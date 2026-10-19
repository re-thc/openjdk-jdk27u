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
0001a 0f8540755c07                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ece0020000                 sub        rsp, 0x2e0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f6a9016783f
0003a e8a1795b07                     call       0x7f6a9771f1e0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00067 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0006a 83c002                         add        eax, 2
0006d 894378                         mov        dword ptr [rbx + 0x78], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f845e480000                   je         0x7f6a9016c0db
0007d 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00087 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0008d 8b9c24f0020000                 mov        ebx, dword ptr [rsp + 0x2f0]
00094 8b4640                         mov        eax, dword ptr [rsi + 0x40]
00097 4c3b25fa847e20                 cmp        r12, qword ptr [rip + 0x207e84fa]
0009e 0f8414000000                   je         0x7f6a901678b8
000a4 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
000ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
000b2 e8a96cbb1f                     call       0x7f6aafd1e560
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
000da 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
000e4 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000ec b800010000                     mov        eax, 0x100
000f1 7f05                           jg         0x7f6a901678f8
000f3 b810010000                     mov        eax, 0x110
000f8 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00100 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00104 4d8d5b01                       lea        r11, [r11 + 1]
00108 4c891c07                       mov        qword ptr [rdi + rax], r11
0010c 0f8f6f440000                   jg         0x7f6a9016bd81
00112 4863db                         movsxd     rbx, ebx
00115 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
00119 492bf9                         sub        rdi, r9
0011c 483bfb                         cmp        rdi, rbx
0011f 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
00129 b830010000                     mov        eax, 0x130
0012e 7c05                           jl         0x7f6a90167935
00130 b820010000                     mov        eax, 0x120
00135 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00139 4d8d5b01                       lea        r11, [r11 + 1]
0013d 4c891c07                       mov        qword ptr [rdi + rax], r11
00141 0f8c3a440000                   jl         0x7f6a9016bd81
00147 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
00151 ff8760010000                   inc        dword ptr [rdi + 0x160]
00157 498bf8                         mov        rdi, r8
0015a 4883ff00                       cmp        rdi, 0
0015e 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
00168 b870010000                     mov        eax, 0x170
0016d 7505                           jne        0x7f6a90167974
0016f b880010000                     mov        eax, 0x180
00174 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00178 4d8d5b01                       lea        r11, [r11 + 1]
0017c 4c891c07                       mov        qword ptr [rdi + rax], r11
00180 0f8531000000                   jne        0x7f6a901679b7
00186 4903d9                         add        rbx, r9
00189 488bf9                         mov        rdi, rcx
0018c 483bfb                         cmp        rdi, rbx
0018f 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
00199 bba0010000                     mov        ebx, 0x1a0
0019e 7d05                           jge        0x7f6a901679a5
001a0 bb90010000                     mov        ebx, 0x190
001a5 488b041f                       mov        rax, qword ptr [rdi + rbx]
001a9 488d4001                       lea        rax, [rax + 1]
001ad 4889041f                       mov        qword ptr [rdi + rbx], rax
001b1 0f8d0a000000                   jge        0x7f6a901679c1
001b7 bf00000000                     mov        edi, 0
001bc e915000000                     jmp        0x7f6a901679d6
001c1 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
001cb ff87b0010000                   inc        dword ptr [rdi + 0x1b0]
001d1 bf01000000                     mov        edi, 1
001d6 4d2bc6                         sub        r8, r14
001d9 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
001e3 488383c801000001               add        qword ptr [rbx + 0x1c8], 1
001eb 48bb48116e846a7f0000           movabs     rbx, 0x7f6a846e1148
001f5 8b4378                         mov        eax, dword ptr [rbx + 0x78]
001f8 83c002                         add        eax, 2
001fb 894378                         mov        dword ptr [rbx + 0x78], eax
001fe 25feff1f00                     and        eax, 0x1ffffe
00203 85c0                           test       eax, eax
00205 0f84f1460000                   je         0x7f6a9016c0fc
0020b 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
00215 483bd9                         cmp        rbx, rcx
00218 48bb48116e846a7f0000           movabs     rbx, 0x7f6a846e1148
00222 b8c0000000                     mov        eax, 0xc0
00227 7d05                           jge        0x7f6a90167a2e
00229 b8b0000000                     mov        eax, 0xb0
0022e 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00232 4d8d4901                       lea        r9, [r9 + 1]
00236 4c890c03                       mov        qword ptr [rbx + rax], r9
0023a 0f8d0f000000                   jge        0x7f6a90167a4f
00240 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
0024a e910000000                     jmp        0x7f6a90167a5f
0024f 48bb48116e846a7f0000           movabs     rbx, 0x7f6a846e1148
00259 ff83d0000000                   inc        dword ptr [rbx + 0xd0]
0025f 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00267 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0026f 488b9c24f8020000               mov        rbx, qword ptr [rsp + 0x2f8]
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
0036f 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00379 41bbd8010000                   mov        r11d, 0x1d8
0037f 7d06                           jge        0x7f6a90167b87
00381 41bbe8010000                   mov        r11d, 0x1e8
00387 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
0038b 4d8d6d01                       lea        r13, [r13 + 1]
0038f 4e892c1b                       mov        qword ptr [rbx + r11], r13
00393 0f8d5d3f0000                   jge        0x7f6a9016baf6
00399 3b5604                         cmp        edx, dword ptr [rsi + 4]
0039c 0f83c6450000                   jae        0x7f6a9016c168
003a2 4863ca                         movsxd     rcx, edx
003a5 4c8b5cce08                     mov        r11, qword ptr [rsi + rcx*8 + 8]
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
003ed 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
003f7 bef8010000                     mov        esi, 0x1f8
003fc 7d05                           jge        0x7f6a90167c03
003fe be08020000                     mov        esi, 0x208
00403 488b1c31                       mov        rbx, qword ptr [rcx + rsi]
00407 488d5b01                       lea        rbx, [rbx + 1]
0040b 48891c31                       mov        qword ptr [rcx + rsi], rbx
0040f 0f8d13000000                   jge        0x7f6a90167c28
00415 3b5704                         cmp        edx, dword ptr [rdi + 4]
00418 0f839e450000                   jae        0x7f6a9016c1bc
0041e 4863f2                         movsxd     rsi, edx
00421 8b74b708                       mov        esi, dword ptr [rdi + rsi*4 + 8]
00425 4c8bde                         mov        r11, rsi
00428 4585ed                         test       r13d, r13d
0042b 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00435 b918020000                     mov        ecx, 0x218
0043a 7405                           je         0x7f6a90167c41
0043c b928020000                     mov        ecx, 0x228
00441 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00445 488d5b01                       lea        rbx, [rbx + 1]
00449 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0044d 0f8431000000                   je         0x7f6a90167c84
00453 488bd8                         mov        rbx, rax
00456 412bd8                         sub        ebx, r8d
00459 443beb                         cmp        r13d, ebx
0045c 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00466 b948020000                     mov        ecx, 0x248
0046b 7f05                           jg         0x7f6a90167c72
0046d b938020000                     mov        ecx, 0x238
00472 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00476 488d5b01                       lea        rbx, [rbx + 1]
0047a 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0047e 0f8f5d400000                   jg         0x7f6a9016bce1
00484 4183fb03                       cmp        r11d, 3
00488 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00492 b968020000                     mov        ecx, 0x268
00497 7e05                           jle        0x7f6a90167c9e
00499 b978020000                     mov        ecx, 0x278
0049e 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
004a2 488d5b01                       lea        rbx, [rbx + 1]
004a6 48891c0e                       mov        qword ptr [rsi + rcx], rbx
004aa 0f8e9c000000                   jle        0x7f6a90167d4c
004b0 4183eb03                       sub        r11d, 3
004b4 4183790401                     cmp        dword ptr [r9 + 4], 1
004b9 0f8651450000                   jbe        0x7f6a9016c210
004bf 418b710c                       mov        esi, dword ptr [r9 + 0xc]
004c3 4183790402                     cmp        dword ptr [r9 + 4], 2
004c8 0f8668450000                   jbe        0x7f6a9016c236
004ce 41897110                       mov        dword ptr [r9 + 0x10], esi
004d2 4183790400                     cmp        dword ptr [r9 + 4], 0
004d7 0f867f450000                   jbe        0x7f6a9016c25c
004dd 418b7108                       mov        esi, dword ptr [r9 + 8]
004e1 4183790401                     cmp        dword ptr [r9 + 4], 1
004e6 0f8696450000                   jbe        0x7f6a9016c282
004ec 4189710c                       mov        dword ptr [r9 + 0xc], esi
004f0 4183790400                     cmp        dword ptr [r9 + 4], 0
004f5 0f86ad450000                   jbe        0x7f6a9016c2a8
004fb 45895908                       mov        dword ptr [r9 + 8], r11d
004ff 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00509 ff8688020000                   inc        dword ptr [rsi + 0x288]
0050f 498bcd                         mov        rcx, r13
00512 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00519 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
00521 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
00529 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
00530 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00538 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00540 89842478010000                 mov        dword ptr [rsp + 0x178], eax
00547 e969000000                     jmp        0x7f6a90167db5
0054c 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00553 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
0055b 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00563 89842478010000                 mov        dword ptr [rsp + 0x178], eax
0056a 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
00574 488387a002000001               add        qword ptr [rdi + 0x2a0], 1
0057c 498bf1                         mov        rsi, r9
0057f 498bd3                         mov        rdx, r11
00582 498bcd                         mov        rcx, r13
00585 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
0058d 90                             nop        
0058e 90                             nop        
0058f e8cc7e5c07                     call       0x7f6a9772fc60
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
005ca 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
005d4 41b8c0020000                   mov        r8d, 0x2c0
005da 7d06                           jge        0x7f6a90167de2
005dc 41b8b0020000                   mov        r8d, 0x2b0
005e2 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005e6 4d8d4901                       lea        r9, [r9 + 1]
005ea 4e890c02                       mov        qword ptr [rdx + r8], r9
005ee 0f8d14000000                   jge        0x7f6a90167e08
005f4 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
005fc 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
00603 e9b2000000                     jmp        0x7f6a90167eba
00608 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
0060f 85c0                           test       eax, eax
00611 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0061b 41b8d0020000                   mov        r8d, 0x2d0
00621 7506                           jne        0x7f6a90167e29
00623 41b8e0020000                   mov        r8d, 0x2e0
00629 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
0062d 4d8d4901                       lea        r9, [r9 + 1]
00631 4e890c02                       mov        qword ptr [rdx + r8], r9
00635 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
0063d 0f856d000000                   jne        0x7f6a90167eb0
00643 488bd3                         mov        rdx, rbx
00646 03d1                           add        edx, ecx
00648 412bd3                         sub        edx, r11d
0064b 4863d2                         movsxd     rdx, edx
0064e 493bd0                         cmp        rdx, r8
00651 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0065b 41b9f0020000                   mov        r9d, 0x2f0
00661 7c06                           jl         0x7f6a90167e69
00663 41b900030000                   mov        r9d, 0x300
00669 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0066d 4d8d6d01                       lea        r13, [r13 + 1]
00671 4e892c0a                       mov        qword ptr [rdx + r9], r13
00675 0f8c3f000000                   jl         0x7f6a90167eba
0067b 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
00683 483bd7                         cmp        rdx, rdi
00686 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
00690 41b920030000                   mov        r9d, 0x320
00696 7c06                           jl         0x7f6a90167e9e
00698 41b910030000                   mov        r9d, 0x310
0069e 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
006a2 4d8d6d01                       lea        r13, [r13 + 1]
006a6 4e892c0a                       mov        qword ptr [rdx + r9], r13
006aa 0f8c0a000000                   jl         0x7f6a90167eba
006b0 ba00000000                     mov        edx, 0
006b5 e915000000                     jmp        0x7f6a90167ecf
006ba 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
006c4 ff8230030000                   inc        dword ptr [rdx + 0x330]
006ca ba01000000                     mov        edx, 1
006cf 4889bc2430020000               mov        qword ptr [rsp + 0x230], rdi
006d7 4585db                         test       r11d, r11d
006da 49b900c063846a7f0000           movabs     r9, 0x7f6a8463c000
006e4 41bd48030000                   mov        r13d, 0x348
006ea 7e06                           jle        0x7f6a90167ef2
006ec 41bd58030000                   mov        r13d, 0x358
006f2 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006f6 488d7f01                       lea        rdi, [rdi + 1]
006fa 4b893c29                       mov        qword ptr [r9 + r13], rdi
006fe 0f8e4b3b0000                   jle        0x7f6a9016ba4f
00704 85d2                           test       edx, edx
00706 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
00710 41b978030000                   mov        r9d, 0x378
00716 7506                           jne        0x7f6a90167f1e
00718 41b968030000                   mov        r9d, 0x368
0071e 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00722 488d7f01                       lea        rdi, [rdi + 1]
00726 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0072a 0f851f3b0000                   jne        0x7f6a9016ba4f
00730 4c8beb                         mov        r13, rbx
00733 4403e9                         add        r13d, ecx
00736 4489ac2440020000               mov        dword ptr [rsp + 0x240], r13d
0073e 498bf5                         mov        rsi, r13
00741 03b42410020000                 add        esi, dword ptr [rsp + 0x210]
00748 3bb424ec010000                 cmp        esi, dword ptr [rsp + 0x1ec]
0074f 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00759 ba30040000                     mov        edx, 0x430
0075e 7f05                           jg         0x7f6a90167f65
00760 ba40040000                     mov        edx, 0x440
00765 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00769 4d8d4901                       lea        r9, [r9 + 1]
0076d 4c890c16                       mov        qword ptr [rsi + rdx], r9
00771 0f8f3f000000                   jg         0x7f6a90167fb6
00777 8bbc24e8010000                 mov        edi, dword ptr [rsp + 0x1e8]
0077e 03f9                           add        edi, ecx
00780 89bc2438020000                 mov        dword ptr [rsp + 0x238], edi
00787 3bbc24f8010000                 cmp        edi, dword ptr [rsp + 0x1f8]
0078e 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00798 ba60040000                     mov        edx, 0x460
0079d 7e05                           jle        0x7f6a90167fa4
0079f ba50040000                     mov        edx, 0x450
007a4 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
007a8 4d8d4901                       lea        r9, [r9 + 1]
007ac 4c890c16                       mov        qword ptr [rsi + rdx], r9
007b0 0f8e89000000                   jle        0x7f6a9016803f
007b6 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
007bd 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
007c5 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
007cc 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
007d4 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
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
0081f e83c7c5c07                     call       0x7f6a9772fc60
00824 0f1f84001c090001               nop        dword ptr [rax + rax + 0x100091c]
0082c 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
00833 039c2414020000                 add        ebx, dword ptr [rsp + 0x214]
0083a e9bc390000                     jmp        0x7f6a9016b9fb
0083f 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
00847 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
0084e 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00856 8b842410020000                 mov        eax, dword ptr [rsp + 0x210]
0085d 83f910                         cmp        ecx, 0x10
00860 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0086a ba70040000                     mov        edx, 0x470
0086f 7f05                           jg         0x7f6a90168076
00871 ba80040000                     mov        edx, 0x480
00876 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0087a 4d8d4001                       lea        r8, [r8 + 1]
0087e 4c890416                       mov        qword ptr [rsi + rdx], r8
00882 0f8f990a0000                   jg         0x7f6a90168b21
00888 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
00890 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0089a 4883869004000001               add        qword ptr [rsi + 0x490], 1
008a2 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
008ac 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
008b0 4183c002                       add        r8d, 2
008b4 44894678                       mov        dword ptr [rsi + 0x78], r8d
008b8 4181e0feff1f00                 and        r8d, 0x1ffffe
008bf 4585c0                         test       r8d, r8d
008c2 0f8406420000                   je         0x7f6a9016c2ce
008c8 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
008d2 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
008dc 8b36                           mov        esi, dword ptr [rsi]
008de c1ee0d                         shr        esi, 0xd
008e1 48c1e60a                       shl        rsi, 0xa
008e5 41ba00000011                   mov        r10d, 0x11000000
008eb 4903f2                         add        rsi, r10
008ee 41ba17000000                   mov        r10d, 0x17
008f4 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
008f8 7436                           je         0x7f6a90168130
008fa 4983c202                       add        r10, 2
008fe 4983fa1b                       cmp        r10, 0x1b
00902 75f0                           jne        0x7f6a901680f4
00904 41ba17000000                   mov        r10d, 0x17
0090a 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
0090f 7412                           je         0x7f6a90168123
00911 4983c202                       add        r10, 2
00915 4983fa1b                       cmp        r10, 0x1b
00919 75ef                           jne        0x7f6a9016810a
0091b 41ba16000000                   mov        r10d, 0x16
00921 eb11                           jmp        0x7f6a90168134
00923 50                             push       rax
00924 4833c0                         xor        rax, rax
00927 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
0092d 58                             pop        rax
0092e ebbe                           jmp        0x7f6a901680ee
00930 4983c201                       add        r10, 1
00934 4b8304d001                     add        qword ptr [r8 + r10*8], 1
00939 8b7204                         mov        esi, dword ptr [rdx + 4]
0093c 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
00946 498380e000000001               add        qword ptr [r8 + 0xe0], 1
0094e 49b858b36d846a7f0000           movabs     r8, 0x7f6a846db358
00958 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0095c 4183c102                       add        r9d, 2
00960 45894878                       mov        dword ptr [r8 + 0x78], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f8494410000                   je         0x7f6a9016c308
00974 448bb424e8010000               mov        r14d, dword ptr [rsp + 0x1e8]
0097c 49b858b36d846a7f0000           movabs     r8, 0x7f6a846db358
00986 4983801001000001               add        qword ptr [r8 + 0x110], 1
0098e 83ee0f                         sub        esi, 0xf
00991 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
0099b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0099f 4183c102                       add        r9d, 2
009a3 45894878                       mov        dword ptr [r8 + 0x78], r9d
009a7 4181e1feff1f00                 and        r9d, 0x1ffffe
009ae 4585c9                         test       r9d, r9d
009b1 0f8472410000                   je         0x7f6a9016c329
009b7 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
009c1 498380b000000001               add        qword ptr [r8 + 0xb0], 1
009c9 49b80000000000000000           movabs     r8, 0
009d3 41b800000000                   mov        r8d, 0
009d9 453bf0                         cmp        r14d, r8d
009dc 0f8c68410000                   jl         0x7f6a9016c34a
009e2 443bf6                         cmp        r14d, esi
009e5 0f8d80410000                   jge        0x7f6a9016c36b
009eb 498bf6                         mov        rsi, r14
009ee 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
009f5 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
009ff 4d8bc8                         mov        r9, r8
00a02 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
00a0c 458b09                         mov        r9d, dword ptr [r9]
00a0f 41c1e90d                       shr        r9d, 0xd
00a13 49c1e10a                       shl        r9, 0xa
00a17 41ba00000011                   mov        r10d, 0x11000000
00a1d 4d03ca                         add        r9, r10
00a20 41ba25000000                   mov        r10d, 0x25
00a26 4e3b0cd6                       cmp        r9, qword ptr [rsi + r10*8]
00a2a 7436                           je         0x7f6a90168262
00a2c 4983c202                       add        r10, 2
00a30 4983fa29                       cmp        r10, 0x29
00a34 75f0                           jne        0x7f6a90168226
00a36 41ba25000000                   mov        r10d, 0x25
00a3c 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
00a41 7412                           je         0x7f6a90168255
00a43 4983c202                       add        r10, 2
00a47 4983fa29                       cmp        r10, 0x29
00a4b 75ef                           jne        0x7f6a9016823c
00a4d 41ba24000000                   mov        r10d, 0x24
00a53 eb11                           jmp        0x7f6a90168266
00a55 50                             push       rax
00a56 4833c0                         xor        rax, rax
00a59 f04e0fb10cd6                   lock cmpxchg qword ptr [rsi + r10*8], r9
00a5f 58                             pop        rax
00a60 ebbe                           jmp        0x7f6a90168220
00a62 4983c201                       add        r10, 1
00a66 4a8304d601                     add        qword ptr [rsi + r10*8], 1
00a6b 48bef0aa6d846a7f0000           movabs     rsi, 0x7f6a846daaf0
00a75 448b4e78                       mov        r9d, dword ptr [rsi + 0x78]
00a79 4183c102                       add        r9d, 2
00a7d 44894e78                       mov        dword ptr [rsi + 0x78], r9d
00a81 4181e1feff1f00                 and        r9d, 0x1ffffe
00a88 4585c9                         test       r9d, r9d
00a8b 0f84fb400000                   je         0x7f6a9016c38c
00a91 48bef0aa6d846a7f0000           movabs     rsi, 0x7f6a846daaf0
00a9b 488386b000000001               add        qword ptr [rsi + 0xb0], 1
00aa3 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
00aad 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00ab1 4183c002                       add        r8d, 2
00ab5 44894678                       mov        dword ptr [rsi + 0x78], r8d
00ab9 4181e0feff1f00                 and        r8d, 0x1ffffe
00ac0 4585c0                         test       r8d, r8d
00ac3 0f84e4400000                   je         0x7f6a9016c3ad
00ac9 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
00ad3 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
00ad9 8bb4242c020000                 mov        esi, dword ptr [rsp + 0x22c]
00ae0 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
00ae8 4489b424e8010000               mov        dword ptr [rsp + 0x1e8], r14d
00af0 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
00af7 49b8b8452ee300000000           movabs     r8, 0xe32e45b8
00b01 4d8bc8                         mov        r9, r8
00b04 48bb28be6d846a7f0000           movabs     rbx, 0x7f6a846dbe28
00b0e 4883836001000001               add        qword ptr [rbx + 0x160], 1
00b16 49b9f8bf6d846a7f0000           movabs     r9, 0x7f6a846dbff8
00b20 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00b24 83c302                         add        ebx, 2
00b27 41895978                       mov        dword ptr [r9 + 0x78], ebx
00b2b 81e3feff1f00                   and        ebx, 0x1ffffe
00b31 85db                           test       ebx, ebx
00b33 0f8495400000                   je         0x7f6a9016c3ce
00b39 4d8bc8                         mov        r9, r8
00b3c 48bbf8bf6d846a7f0000           movabs     rbx, 0x7f6a846dbff8
00b46 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00b4e 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00b58 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00b5c 83c302                         add        ebx, 2
00b5f 41895978                       mov        dword ptr [r9 + 0x78], ebx
00b63 81e3feff1f00                   and        ebx, 0x1ffffe
00b69 85db                           test       ebx, ebx
00b6b 0f847e400000                   je         0x7f6a9016c3ef
00b71 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00b7b 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00b83 49b8d8b46d846a7f0000           movabs     r8, 0x7f6a846db4d8
00b8d 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
00b91 4183c102                       add        r9d, 2
00b95 45894878                       mov        dword ptr [r8 + 0x78], r9d
00b99 4181e1feff1f00                 and        r9d, 0x1ffffe
00ba0 4585c9                         test       r9d, r9d
00ba3 0f8467400000                   je         0x7f6a9016c410
00ba9 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
00bb3 4d8bc8                         mov        r9, r8
00bb6 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
00bc0 458b09                         mov        r9d, dword ptr [r9]
00bc3 41c1e90d                       shr        r9d, 0xd
00bc7 49c1e10a                       shl        r9, 0xa
00bcb 41ba00000011                   mov        r10d, 0x11000000
00bd1 4d03ca                         add        r9, r10
00bd4 41ba1d000000                   mov        r10d, 0x1d
00bda 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00bde 7436                           je         0x7f6a90168416
00be0 4983c202                       add        r10, 2
00be4 4983fa21                       cmp        r10, 0x21
00be8 75f0                           jne        0x7f6a901683da
00bea 41ba1d000000                   mov        r10d, 0x1d
00bf0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00bf5 7412                           je         0x7f6a90168409
00bf7 4983c202                       add        r10, 2
00bfb 4983fa21                       cmp        r10, 0x21
00bff 75ef                           jne        0x7f6a901683f0
00c01 41ba1c000000                   mov        r10d, 0x1c
00c07 eb11                           jmp        0x7f6a9016841a
00c09 50                             push       rax
00c0a 4833c0                         xor        rax, rax
00c0d f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00c13 58                             pop        rax
00c14 ebbe                           jmp        0x7f6a901683d4
00c16 4983c201                       add        r10, 1
00c1a 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00c1f 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00c29 458b00                         mov        r8d, dword ptr [r8]
00c2c 41c1e80d                       shr        r8d, 0xd
00c30 49c1e00a                       shl        r8, 0xa
00c34 41ba00000011                   mov        r10d, 0x11000000
00c3a 4d03c2                         add        r8, r10
00c3d 41ba23000000                   mov        r10d, 0x23
00c43 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
00c47 7436                           je         0x7f6a9016847f
00c49 4983c202                       add        r10, 2
00c4d 4983fa27                       cmp        r10, 0x27
00c51 75f0                           jne        0x7f6a90168443
00c53 41ba23000000                   mov        r10d, 0x23
00c59 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00c5e 7412                           je         0x7f6a90168472
00c60 4983c202                       add        r10, 2
00c64 4983fa27                       cmp        r10, 0x27
00c68 75ef                           jne        0x7f6a90168459
00c6a 41ba22000000                   mov        r10d, 0x22
00c70 eb11                           jmp        0x7f6a90168483
00c72 50                             push       rax
00c73 4833c0                         xor        rax, rax
00c76 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
00c7c 58                             pop        rax
00c7d ebbe                           jmp        0x7f6a9016843d
00c7f 4983c201                       add        r10, 1
00c83 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c88 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
00c92 4983804001000001               add        qword ptr [r8 + 0x140], 1
00c9a 49b8a0b56d846a7f0000           movabs     r8, 0x7f6a846db5a0
00ca4 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
00ca8 4183c102                       add        r9d, 2
00cac 45894878                       mov        dword ptr [r8 + 0x78], r9d
00cb0 4181e1feff1f00                 and        r9d, 0x1ffffe
00cb7 4585c9                         test       r9d, r9d
00cba 0f84713f0000                   je         0x7f6a9016c431
00cc0 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
00cca 4983805001000001               add        qword ptr [r8 + 0x150], 1
00cd2 4863de                         movsxd     rbx, esi
00cd5 be08000000                     mov        esi, 8
00cda 4c8bcb                         mov        r9, rbx
00cdd 4c03ce                         add        r9, rsi
00ce0 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
00cea 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00cee 4183c002                       add        r8d, 2
00cf2 44894678                       mov        dword ptr [rsi + 0x78], r8d
00cf6 4181e0feff1f00                 and        r8d, 0x1ffffe
00cfd 4585c0                         test       r8d, r8d
00d00 0f844c3f0000                   je         0x7f6a9016c452
00d06 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
00d10 488386e000000001               add        qword ptr [rsi + 0xe0], 1
00d18 48bea8a86d846a7f0000           movabs     rsi, 0x7f6a846da8a8
00d22 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00d26 4183c002                       add        r8d, 2
00d2a 44894678                       mov        dword ptr [rsi + 0x78], r8d
00d2e 4181e0feff1f00                 and        r8d, 0x1ffffe
00d35 4585c0                         test       r8d, r8d
00d38 0f84353f0000                   je         0x7f6a9016c473
00d3e 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
00d48 4883867001000001               add        qword ptr [rsi + 0x170], 1
00d50 48be889e2ee300000000           movabs     rsi, 0xe32e9e88
00d5a 48be08c62de300000000           movabs     rsi, 0xe32dc608
00d64 488bc2                         mov        rax, rdx
00d67 ba02000000                     mov        edx, 2
00d6c b910000000                     mov        ecx, 0x10
00d71 4c8bc0                         mov        r8, rax
00d74 bf00000000                     mov        edi, 0
00d79 48890424                       mov        qword ptr [rsp], rax
00d7d 48895c2408                     mov        qword ptr [rsp + 8], rbx
00d82 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
00d8c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d91 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
00d9b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00da0 4889842468010000               mov        qword ptr [rsp + 0x168], rax
00da8 90                             nop        
00da9 90                             nop        
00daa 90                             nop        
00dab 90                             nop        
00dac 90                             nop        
00dad 90                             nop        
00dae 90                             nop        
00daf e8ac765c07                     call       0x7f6a9772fc60
00db4 0f1f8400ac0e0002               nop        dword ptr [rax + rax + 0x2000eac]
00dbc 4885c0                         test       rax, rax
00dbf 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
00dc9 750c                           jne        0x7f6a901685d7
00dcb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00dd2 e988000000                     jmp        0x7f6a9016865f
00dd7 8b38                           mov        edi, dword ptr [rax]
00dd9 c1ef0d                         shr        edi, 0xd
00ddc 48c1e70a                       shl        rdi, 0xa
00de0 41ba00000011                   mov        r10d, 0x11000000
00de6 4903fa                         add        rdi, r10
00de9 41ba31000000                   mov        r10d, 0x31
00def 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00df3 7436                           je         0x7f6a9016862b
00df5 4983c202                       add        r10, 2
00df9 4983fa35                       cmp        r10, 0x35
00dfd 75f0                           jne        0x7f6a901685ef
00dff 41ba31000000                   mov        r10d, 0x31
00e05 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e0a 7412                           je         0x7f6a9016861e
00e0c 4983c202                       add        r10, 2
00e10 4983fa35                       cmp        r10, 0x35
00e14 75ef                           jne        0x7f6a90168605
00e16 41ba30000000                   mov        r10d, 0x30
00e1c eb11                           jmp        0x7f6a9016862f
00e1e 50                             push       rax
00e1f 4833c0                         xor        rax, rax
00e22 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00e28 58                             pop        rax
00e29 ebbe                           jmp        0x7f6a901685e9
00e2b 4983c201                       add        r10, 1
00e2f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e34 48bf00b4141100000000           movabs     rdi, 0x1114b400
00e3e 8b18                           mov        ebx, dword ptr [rax]
00e40 c1eb0d                         shr        ebx, 0xd
00e43 48c1e30a                       shl        rbx, 0xa
00e47 41ba00000011                   mov        r10d, 0x11000000
00e4d 4903da                         add        rbx, r10
00e50 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e54 0f853a3e0000                   jne        0x7f6a9016c494
00e5a e900000000                     jmp        0x7f6a9016865f
00e5f 488bf8                         mov        rdi, rax
00e62 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
00e6a 483b07                         cmp        rax, qword ptr [rdi]
00e6d 488bf7                         mov        rsi, rdi
00e70 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00e7a 8b36                           mov        esi, dword ptr [rsi]
00e7c c1ee0d                         shr        esi, 0xd
00e7f 48c1e60a                       shl        rsi, 0xa
00e83 41ba00000011                   mov        r10d, 0x11000000
00e89 4903f2                         add        rsi, r10
00e8c 41ba95000000                   mov        r10d, 0x95
00e92 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e96 743c                           je         0x7f6a901686d4
00e98 4983c202                       add        r10, 2
00e9c 4981fa99000000                 cmp        r10, 0x99
00ea3 75ed                           jne        0x7f6a90168692
00ea5 41ba95000000                   mov        r10d, 0x95
00eab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00eb0 7415                           je         0x7f6a901686c7
00eb2 4983c202                       add        r10, 2
00eb6 4981fa99000000                 cmp        r10, 0x99
00ebd 75ec                           jne        0x7f6a901686ab
00ebf 41ba94000000                   mov        r10d, 0x94
00ec5 eb11                           jmp        0x7f6a901686d8
00ec7 50                             push       rax
00ec8 4833c0                         xor        rax, rax
00ecb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00ed1 58                             pop        rax
00ed2 ebb8                           jmp        0x7f6a9016868c
00ed4 4983c201                       add        r10, 1
00ed8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00edd 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
00ee7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00eea 83c302                         add        ebx, 2
00eed 895e78                         mov        dword ptr [rsi + 0x78], ebx
00ef0 81e3feff1f00                   and        ebx, 0x1ffffe
00ef6 85db                           test       ebx, ebx
00ef8 0f84cc3d0000                   je         0x7f6a9016c4ca
00efe 488bf7                         mov        rsi, rdi
00f01 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
00f0b 8b36                           mov        esi, dword ptr [rsi]
00f0d c1ee0d                         shr        esi, 0xd
00f10 48c1e60a                       shl        rsi, 0xa
00f14 41ba00000011                   mov        r10d, 0x11000000
00f1a 4903f2                         add        rsi, r10
00f1d 41ba17000000                   mov        r10d, 0x17
00f23 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f27 7436                           je         0x7f6a9016875f
00f29 4983c202                       add        r10, 2
00f2d 4983fa1b                       cmp        r10, 0x1b
00f31 75f0                           jne        0x7f6a90168723
00f33 41ba17000000                   mov        r10d, 0x17
00f39 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f3e 7412                           je         0x7f6a90168752
00f40 4983c202                       add        r10, 2
00f44 4983fa1b                       cmp        r10, 0x1b
00f48 75ef                           jne        0x7f6a90168739
00f4a 41ba16000000                   mov        r10d, 0x16
00f50 eb11                           jmp        0x7f6a90168763
00f52 50                             push       rax
00f53 4833c0                         xor        rax, rax
00f56 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f5c 58                             pop        rax
00f5d ebbe                           jmp        0x7f6a9016871d
00f5f 4983c201                       add        r10, 1
00f63 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f68 488bf7                         mov        rsi, rdi
00f6b 90                             nop        
00f6c 90                             nop        
00f6d 48b830873b646a7f0000           movabs     rax, 0x7f6a643b8730
00f77 e8e46f5c07                     call       0x7f6a9772f760
00f7c 0f1f840074100003               nop        dword ptr [rax + rax + 0x3001074]
00f84 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
00f8c 8b7704                         mov        esi, dword ptr [rdi + 4]
00f8f 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
00f99 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00fa1 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
00fab 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00fae 83c202                         add        edx, 2
00fb1 895378                         mov        dword ptr [rbx + 0x78], edx
00fb4 81e2feff1f00                   and        edx, 0x1ffffe
00fba 85d2                           test       edx, edx
00fbc 0f84423d0000                   je         0x7f6a9016c504
00fc2 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
00fca 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
00fd4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00fdc ffc8                           dec        eax
00fde 2bf0                           sub        esi, eax
00fe0 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
00fea 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00fed 83c002                         add        eax, 2
00ff0 894378                         mov        dword ptr [rbx + 0x78], eax
00ff3 25feff1f00                     and        eax, 0x1ffffe
00ff8 85c0                           test       eax, eax
00ffa 0f84253d0000                   je         0x7f6a9016c525
01000 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
0100a 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01012 48bb0000000000000000           movabs     rbx, 0
0101c bb00000000                     mov        ebx, 0
01021 443bdb                         cmp        r11d, ebx
01024 0f8c1c3d0000                   jl         0x7f6a9016c546
0102a 443bde                         cmp        r11d, esi
0102d 0f8d343d0000                   jge        0x7f6a9016c567
01033 498bdb                         mov        rbx, r11
01036 899c2444020000                 mov        dword ptr [rsp + 0x244], ebx
0103d 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
01045 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
0104d 488bbc2448020000               mov        rdi, qword ptr [rsp + 0x248]
01055 488bf7                         mov        rsi, rdi
01058 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01062 8b36                           mov        esi, dword ptr [rsi]
01064 c1ee0d                         shr        esi, 0xd
01067 48c1e60a                       shl        rsi, 0xa
0106b 41ba00000011                   mov        r10d, 0x11000000
01071 4903f2                         add        rsi, r10
01074 41ba1f000000                   mov        r10d, 0x1f
0107a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0107e 7436                           je         0x7f6a901688b6
01080 4983c202                       add        r10, 2
01084 4983fa23                       cmp        r10, 0x23
01088 75f0                           jne        0x7f6a9016887a
0108a 41ba1f000000                   mov        r10d, 0x1f
01090 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01095 7412                           je         0x7f6a901688a9
01097 4983c202                       add        r10, 2
0109b 4983fa23                       cmp        r10, 0x23
0109f 75ef                           jne        0x7f6a90168890
010a1 41ba1e000000                   mov        r10d, 0x1e
010a7 eb11                           jmp        0x7f6a901688ba
010a9 50                             push       rax
010aa 4833c0                         xor        rax, rax
010ad f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
010b3 58                             pop        rax
010b4 ebbe                           jmp        0x7f6a90168874
010b6 4983c201                       add        r10, 1
010ba 4a8304d201                     add        qword ptr [rdx + r10*8], 1
010bf 488bf7                         mov        rsi, rdi
010c2 90                             nop        
010c3 90                             nop        
010c4 90                             nop        
010c5 48b858873b646a7f0000           movabs     rax, 0x7f6a643b8758
010cf e88c6e5c07                     call       0x7f6a9772f760
010d4 0f1f8400cc110004               nop        dword ptr [rax + rax + 0x40011cc]
010dc 483b00                         cmp        rax, qword ptr [rax]
010df 488bf0                         mov        rsi, rax
010e2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
010ec 8b36                           mov        esi, dword ptr [rsi]
010ee c1ee0d                         shr        esi, 0xd
010f1 48c1e60a                       shl        rsi, 0xa
010f5 41ba00000011                   mov        r10d, 0x11000000
010fb 4903f2                         add        rsi, r10
010fe 41ba25000000                   mov        r10d, 0x25
01104 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01108 7436                           je         0x7f6a90168940
0110a 4983c202                       add        r10, 2
0110e 4983fa29                       cmp        r10, 0x29
01112 75f0                           jne        0x7f6a90168904
01114 41ba25000000                   mov        r10d, 0x25
0111a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0111f 7412                           je         0x7f6a90168933
01121 4983c202                       add        r10, 2
01125 4983fa29                       cmp        r10, 0x29
01129 75ef                           jne        0x7f6a9016891a
0112b 41ba24000000                   mov        r10d, 0x24
01131 eb11                           jmp        0x7f6a90168944
01133 50                             push       rax
01134 4833c0                         xor        rax, rax
01137 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0113d 58                             pop        rax
0113e ebbe                           jmp        0x7f6a901688fe
01140 4983c201                       add        r10, 1
01144 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01149 8b7024                         mov        esi, dword ptr [rax + 0x24]
0114c 4c3b2545747e20                 cmp        r12, qword ptr [rip + 0x207e7445]
01153 0f8414000000                   je         0x7f6a9016896d
01159 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
01163 4883e4f0                       and        rsp, 0xfffffffffffffff0
01167 e8f45bbb1f                     call       0x7f6aafd1e560
0116c f4                             hlt        
0116d 488bd0                         mov        rdx, rax
01170 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
0117a 8b12                           mov        edx, dword ptr [rdx]
0117c c1ea0d                         shr        edx, 0xd
0117f 48c1e20a                       shl        rdx, 0xa
01183 41ba00000011                   mov        r10d, 0x11000000
01189 4903d2                         add        rdx, r10
0118c 41ba2b000000                   mov        r10d, 0x2b
01192 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01196 7436                           je         0x7f6a901689ce
01198 4983c202                       add        r10, 2
0119c 4983fa2f                       cmp        r10, 0x2f
011a0 75f0                           jne        0x7f6a90168992
011a2 41ba2b000000                   mov        r10d, 0x2b
011a8 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
011ad 7412                           je         0x7f6a901689c1
011af 4983c202                       add        r10, 2
011b3 4983fa2f                       cmp        r10, 0x2f
011b7 75ef                           jne        0x7f6a901689a8
011b9 41ba2a000000                   mov        r10d, 0x2a
011bf eb11                           jmp        0x7f6a901689d2
011c1 50                             push       rax
011c2 4833c0                         xor        rax, rax
011c5 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
011cb 58                             pop        rax
011cc ebbe                           jmp        0x7f6a9016898c
011ce 4983c201                       add        r10, 1
011d2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
011d7 8b4804                         mov        ecx, dword ptr [rax + 4]
011da 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
011e4 4883828001000001               add        qword ptr [rdx + 0x180], 1
011ec 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
011f6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
011fa 4183c002                       add        r8d, 2
011fe 44894278                       mov        dword ptr [rdx + 0x78], r8d
01202 4181e0feff1f00                 and        r8d, 0x1ffffe
01209 4585c0                         test       r8d, r8d
0120c 0f848f3b0000                   je         0x7f6a9016c5a1
01212 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
0121c 4883829001000001               add        qword ptr [rdx + 0x190], 1
01224 8b9c2444020000                 mov        ebx, dword ptr [rsp + 0x244]
0122b 4863db                         movsxd     rbx, ebx
0122e ba08000000                     mov        edx, 8
01233 4c8bcb                         mov        r9, rbx
01236 4c03ca                         add        r9, rdx
01239 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01243 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01247 4183c002                       add        r8d, 2
0124b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0124f 4181e0feff1f00                 and        r8d, 0x1ffffe
01256 4585c0                         test       r8d, r8d
01259 0f84633b0000                   je         0x7f6a9016c5c2
0125f 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01269 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01271 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
0127b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0127f 4183c002                       add        r8d, 2
01283 44894278                       mov        dword ptr [rdx + 0x78], r8d
01287 4181e0feff1f00                 and        r8d, 0x1ffffe
0128e 4585c0                         test       r8d, r8d
01291 0f844c3b0000                   je         0x7f6a9016c5e3
01297 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
012a1 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
012a9 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
012b3 ba02000000                     mov        edx, 2
012b8 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
012c0 bf00000000                     mov        edi, 0
012c5 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
012cd 48890424                       mov        qword ptr [rsp], rax
012d1 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
012d9 4889442408                     mov        qword ptr [rsp + 8], rax
012de 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012e3 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
012ed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012f2 4889842400020000               mov        qword ptr [rsp + 0x200], rax
012fa 90                             nop        
012fb 90                             nop        
012fc 90                             nop        
012fd 90                             nop        
012fe 90                             nop        
012ff e85c715c07                     call       0x7f6a9772fc60
01304 0f1f8400fc130005               nop        dword ptr [rax + rax + 0x50013fc]
0130c 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
01316 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
0131c e9e80b0000                     jmp        0x7f6a90169709
01321 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
01329 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
01330 83f930                         cmp        ecx, 0x30
01333 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0133d bae8040000                     mov        edx, 0x4e8
01342 7f05                           jg         0x7f6a90168b49
01344 baf8040000                     mov        edx, 0x4f8
01349 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0134d 4d8d4001                       lea        r8, [r8 + 1]
01351 4c890416                       mov        qword ptr [rsi + rdx], r8
01355 0f8f180b0000                   jg         0x7f6a90169673
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
01380 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0138a 4883860805000001               add        qword ptr [rsi + 0x508], 1
01392 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
0139c 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
013a0 4183c002                       add        r8d, 2
013a4 44894678                       mov        dword ptr [rsi + 0x78], r8d
013a8 4181e0feff1f00                 and        r8d, 0x1ffffe
013af 4585c0                         test       r8d, r8d
013b2 0f844c3a0000                   je         0x7f6a9016c604
013b8 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
013c2 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
013cc 8b36                           mov        esi, dword ptr [rsi]
013ce c1ee0d                         shr        esi, 0xd
013d1 48c1e60a                       shl        rsi, 0xa
013d5 41ba00000011                   mov        r10d, 0x11000000
013db 4903f2                         add        rsi, r10
013de 41ba17000000                   mov        r10d, 0x17
013e4 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
013e8 7436                           je         0x7f6a90168c20
013ea 4983c202                       add        r10, 2
013ee 4983fa1b                       cmp        r10, 0x1b
013f2 75f0                           jne        0x7f6a90168be4
013f4 41ba17000000                   mov        r10d, 0x17
013fa 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013ff 7412                           je         0x7f6a90168c13
01401 4983c202                       add        r10, 2
01405 4983fa1b                       cmp        r10, 0x1b
01409 75ef                           jne        0x7f6a90168bfa
0140b 41ba16000000                   mov        r10d, 0x16
01411 eb11                           jmp        0x7f6a90168c24
01413 50                             push       rax
01414 4833c0                         xor        rax, rax
01417 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
0141d 58                             pop        rax
0141e ebbe                           jmp        0x7f6a90168bde
01420 4983c201                       add        r10, 1
01424 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01429 8b7204                         mov        esi, dword ptr [rdx + 4]
0142c 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
01436 498380e000000001               add        qword ptr [r8 + 0xe0], 1
0143e 49b858b36d846a7f0000           movabs     r8, 0x7f6a846db358
01448 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0144c 4183c102                       add        r9d, 2
01450 45894878                       mov        dword ptr [r8 + 0x78], r9d
01454 4181e1feff1f00                 and        r9d, 0x1ffffe
0145b 4585c9                         test       r9d, r9d
0145e 0f84da390000                   je         0x7f6a9016c63e
01464 49b858b36d846a7f0000           movabs     r8, 0x7f6a846db358
0146e 4983801001000001               add        qword ptr [r8 + 0x110], 1
01476 83ee0f                         sub        esi, 0xf
01479 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
01483 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01487 4183c102                       add        r9d, 2
0148b 45894878                       mov        dword ptr [r8 + 0x78], r9d
0148f 4181e1feff1f00                 and        r9d, 0x1ffffe
01496 4585c9                         test       r9d, r9d
01499 0f84c0390000                   je         0x7f6a9016c65f
0149f 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
014a9 498380b000000001               add        qword ptr [r8 + 0xb0], 1
014b1 49b80000000000000000           movabs     r8, 0
014bb 41b800000000                   mov        r8d, 0
014c1 413bd8                         cmp        ebx, r8d
014c4 0f8cb6390000                   jl         0x7f6a9016c680
014ca 3bde                           cmp        ebx, esi
014cc 0f8dcf390000                   jge        0x7f6a9016c6a1
014d2 488bf3                         mov        rsi, rbx
014d5 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
014df 4d8bc8                         mov        r9, r8
014e2 48bf28be6d846a7f0000           movabs     rdi, 0x7f6a846dbe28
014ec 458b09                         mov        r9d, dword ptr [r9]
014ef 41c1e90d                       shr        r9d, 0xd
014f3 49c1e10a                       shl        r9, 0xa
014f7 41ba00000011                   mov        r10d, 0x11000000
014fd 4d03ca                         add        r9, r10
01500 41ba25000000                   mov        r10d, 0x25
01506 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
0150a 7436                           je         0x7f6a90168d42
0150c 4983c202                       add        r10, 2
01510 4983fa29                       cmp        r10, 0x29
01514 75f0                           jne        0x7f6a90168d06
01516 41ba25000000                   mov        r10d, 0x25
0151c 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
01521 7412                           je         0x7f6a90168d35
01523 4983c202                       add        r10, 2
01527 4983fa29                       cmp        r10, 0x29
0152b 75ef                           jne        0x7f6a90168d1c
0152d 41ba24000000                   mov        r10d, 0x24
01533 eb11                           jmp        0x7f6a90168d46
01535 50                             push       rax
01536 4833c0                         xor        rax, rax
01539 f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
0153f 58                             pop        rax
01540 ebbe                           jmp        0x7f6a90168d00
01542 4983c201                       add        r10, 1
01546 4a8304d701                     add        qword ptr [rdi + r10*8], 1
0154b 49b9f0aa6d846a7f0000           movabs     r9, 0x7f6a846daaf0
01555 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01559 83c702                         add        edi, 2
0155c 41897978                       mov        dword ptr [r9 + 0x78], edi
01560 81e7feff1f00                   and        edi, 0x1ffffe
01566 85ff                           test       edi, edi
01568 0f8454390000                   je         0x7f6a9016c6c2
0156e 49b9f0aa6d846a7f0000           movabs     r9, 0x7f6a846daaf0
01578 498381b000000001               add        qword ptr [r9 + 0xb0], 1
01580 49b820ac6d846a7f0000           movabs     r8, 0x7f6a846dac20
0158a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0158e 4183c102                       add        r9d, 2
01592 45894878                       mov        dword ptr [r8 + 0x78], r9d
01596 4181e1feff1f00                 and        r9d, 0x1ffffe
0159d 4585c9                         test       r9d, r9d
015a0 0f843d390000                   je         0x7f6a9016c6e3
015a6 49b820ac6d846a7f0000           movabs     r8, 0x7f6a846dac20
015b0 41ff80c0000000                 inc        dword ptr [r8 + 0xc0]
015b7 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
015be 49b8b8452ee300000000           movabs     r8, 0xe32e45b8
015c8 4d8bc8                         mov        r9, r8
015cb 48bf28be6d846a7f0000           movabs     rdi, 0x7f6a846dbe28
015d5 4883876001000001               add        qword ptr [rdi + 0x160], 1
015dd 49b9f8bf6d846a7f0000           movabs     r9, 0x7f6a846dbff8
015e7 418b7978                       mov        edi, dword ptr [r9 + 0x78]
015eb 83c702                         add        edi, 2
015ee 41897978                       mov        dword ptr [r9 + 0x78], edi
015f2 81e7feff1f00                   and        edi, 0x1ffffe
015f8 85ff                           test       edi, edi
015fa 0f8404390000                   je         0x7f6a9016c704
01600 4d8bc8                         mov        r9, r8
01603 48bff8bf6d846a7f0000           movabs     rdi, 0x7f6a846dbff8
0160d 488387b000000001               add        qword ptr [rdi + 0xb0], 1
01615 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
0161f 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01623 83c702                         add        edi, 2
01626 41897978                       mov        dword ptr [r9 + 0x78], edi
0162a 81e7feff1f00                   and        edi, 0x1ffffe
01630 85ff                           test       edi, edi
01632 0f84ed380000                   je         0x7f6a9016c725
01638 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
01642 498381c000000001               add        qword ptr [r9 + 0xc0], 1
0164a 49b8d8b46d846a7f0000           movabs     r8, 0x7f6a846db4d8
01654 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01658 4183c102                       add        r9d, 2
0165c 45894878                       mov        dword ptr [r8 + 0x78], r9d
01660 4181e1feff1f00                 and        r9d, 0x1ffffe
01667 4585c9                         test       r9d, r9d
0166a 0f84d6380000                   je         0x7f6a9016c746
01670 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
0167a 4d8bc8                         mov        r9, r8
0167d 48bfe0c06d846a7f0000           movabs     rdi, 0x7f6a846dc0e0
01687 458b09                         mov        r9d, dword ptr [r9]
0168a 41c1e90d                       shr        r9d, 0xd
0168e 49c1e10a                       shl        r9, 0xa
01692 41ba00000011                   mov        r10d, 0x11000000
01698 4d03ca                         add        r9, r10
0169b 41ba1d000000                   mov        r10d, 0x1d
016a1 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
016a5 7436                           je         0x7f6a90168edd
016a7 4983c202                       add        r10, 2
016ab 4983fa21                       cmp        r10, 0x21
016af 75f0                           jne        0x7f6a90168ea1
016b1 41ba1d000000                   mov        r10d, 0x1d
016b7 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
016bc 7412                           je         0x7f6a90168ed0
016be 4983c202                       add        r10, 2
016c2 4983fa21                       cmp        r10, 0x21
016c6 75ef                           jne        0x7f6a90168eb7
016c8 41ba1c000000                   mov        r10d, 0x1c
016ce eb11                           jmp        0x7f6a90168ee1
016d0 50                             push       rax
016d1 4833c0                         xor        rax, rax
016d4 f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
016da 58                             pop        rax
016db ebbe                           jmp        0x7f6a90168e9b
016dd 4983c201                       add        r10, 1
016e1 4a8304d701                     add        qword ptr [rdi + r10*8], 1
016e6 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
016f0 458b00                         mov        r8d, dword ptr [r8]
016f3 41c1e80d                       shr        r8d, 0xd
016f7 49c1e00a                       shl        r8, 0xa
016fb 41ba00000011                   mov        r10d, 0x11000000
01701 4d03c2                         add        r8, r10
01704 41ba23000000                   mov        r10d, 0x23
0170a 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0170e 7436                           je         0x7f6a90168f46
01710 4983c202                       add        r10, 2
01714 4983fa27                       cmp        r10, 0x27
01718 75f0                           jne        0x7f6a90168f0a
0171a 41ba23000000                   mov        r10d, 0x23
01720 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
01725 7412                           je         0x7f6a90168f39
01727 4983c202                       add        r10, 2
0172b 4983fa27                       cmp        r10, 0x27
0172f 75ef                           jne        0x7f6a90168f20
01731 41ba22000000                   mov        r10d, 0x22
01737 eb11                           jmp        0x7f6a90168f4a
01739 50                             push       rax
0173a 4833c0                         xor        rax, rax
0173d f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
01743 58                             pop        rax
01744 ebbe                           jmp        0x7f6a90168f04
01746 4983c201                       add        r10, 1
0174a 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0174f 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
01759 4983804001000001               add        qword ptr [r8 + 0x140], 1
01761 49b8a0b56d846a7f0000           movabs     r8, 0x7f6a846db5a0
0176b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0176f 4183c102                       add        r9d, 2
01773 45894878                       mov        dword ptr [r8 + 0x78], r9d
01777 4181e1feff1f00                 and        r9d, 0x1ffffe
0177e 4585c9                         test       r9d, r9d
01781 0f84e0370000                   je         0x7f6a9016c767
01787 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
01791 4983805001000001               add        qword ptr [r8 + 0x150], 1
01799 4c63f6                         movsxd     r14, esi
0179c be08000000                     mov        esi, 8
017a1 4d8bce                         mov        r9, r14
017a4 4c03ce                         add        r9, rsi
017a7 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
017b1 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
017b5 4183c002                       add        r8d, 2
017b9 44894678                       mov        dword ptr [rsi + 0x78], r8d
017bd 4181e0feff1f00                 and        r8d, 0x1ffffe
017c4 4585c0                         test       r8d, r8d
017c7 0f84bb370000                   je         0x7f6a9016c788
017cd 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
017d7 488386e000000001               add        qword ptr [rsi + 0xe0], 1
017df 48bea8a86d846a7f0000           movabs     rsi, 0x7f6a846da8a8
017e9 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
017ed 4183c002                       add        r8d, 2
017f1 44894678                       mov        dword ptr [rsi + 0x78], r8d
017f5 4181e0feff1f00                 and        r8d, 0x1ffffe
017fc 4585c0                         test       r8d, r8d
017ff 0f84a4370000                   je         0x7f6a9016c7a9
01805 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
0180f 4883867001000001               add        qword ptr [rsi + 0x170], 1
01817 48be889e2ee300000000           movabs     rsi, 0xe32e9e88
01821 48be08c62de300000000           movabs     rsi, 0xe32dc608
0182b 488bfa                         mov        rdi, rdx
0182e ba02000000                     mov        edx, 2
01833 b910000000                     mov        ecx, 0x10
01838 4c8bc7                         mov        r8, rdi
0183b 488bdf                         mov        rbx, rdi
0183e bf00000000                     mov        edi, 0
01843 48891c24                       mov        qword ptr [rsp], rbx
01847 4c89742408                     mov        qword ptr [rsp + 8], r14
0184c 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
01856 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0185b 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
01865 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0186a 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01872 90                             nop        
01873 90                             nop        
01874 90                             nop        
01875 90                             nop        
01876 90                             nop        
01877 e8e46b5c07                     call       0x7f6a9772fc60
0187c 0f1f840074190006               nop        dword ptr [rax + rax + 0x6001974]
01884 4885c0                         test       rax, rax
01887 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
01891 750c                           jne        0x7f6a9016909f
01893 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0189a e988000000                     jmp        0x7f6a90169127
0189f 8b38                           mov        edi, dword ptr [rax]
018a1 c1ef0d                         shr        edi, 0xd
018a4 48c1e70a                       shl        rdi, 0xa
018a8 41ba00000011                   mov        r10d, 0x11000000
018ae 4903fa                         add        rdi, r10
018b1 41ba31000000                   mov        r10d, 0x31
018b7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
018bb 7436                           je         0x7f6a901690f3
018bd 4983c202                       add        r10, 2
018c1 4983fa35                       cmp        r10, 0x35
018c5 75f0                           jne        0x7f6a901690b7
018c7 41ba31000000                   mov        r10d, 0x31
018cd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018d2 7412                           je         0x7f6a901690e6
018d4 4983c202                       add        r10, 2
018d8 4983fa35                       cmp        r10, 0x35
018dc 75ef                           jne        0x7f6a901690cd
018de 41ba30000000                   mov        r10d, 0x30
018e4 eb11                           jmp        0x7f6a901690f7
018e6 50                             push       rax
018e7 4833c0                         xor        rax, rax
018ea f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
018f0 58                             pop        rax
018f1 ebbe                           jmp        0x7f6a901690b1
018f3 4983c201                       add        r10, 1
018f7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018fc 48bf00b4141100000000           movabs     rdi, 0x1114b400
01906 8b18                           mov        ebx, dword ptr [rax]
01908 c1eb0d                         shr        ebx, 0xd
0190b 48c1e30a                       shl        rbx, 0xa
0190f 41ba00000011                   mov        r10d, 0x11000000
01915 4903da                         add        rbx, r10
01918 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0191c 0f85a8360000                   jne        0x7f6a9016c7ca
01922 e900000000                     jmp        0x7f6a90169127
01927 488bf8                         mov        rdi, rax
0192a 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
01932 483b07                         cmp        rax, qword ptr [rdi]
01935 488bf7                         mov        rsi, rdi
01938 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
01942 8b36                           mov        esi, dword ptr [rsi]
01944 c1ee0d                         shr        esi, 0xd
01947 48c1e60a                       shl        rsi, 0xa
0194b 41ba00000011                   mov        r10d, 0x11000000
01951 4903f2                         add        rsi, r10
01954 41baa4000000                   mov        r10d, 0xa4
0195a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0195e 743c                           je         0x7f6a9016919c
01960 4983c202                       add        r10, 2
01964 4981faa8000000                 cmp        r10, 0xa8
0196b 75ed                           jne        0x7f6a9016915a
0196d 41baa4000000                   mov        r10d, 0xa4
01973 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01978 7415                           je         0x7f6a9016918f
0197a 4983c202                       add        r10, 2
0197e 4981faa8000000                 cmp        r10, 0xa8
01985 75ec                           jne        0x7f6a90169173
01987 41baa3000000                   mov        r10d, 0xa3
0198d eb11                           jmp        0x7f6a901691a0
0198f 50                             push       rax
01990 4833c0                         xor        rax, rax
01993 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01999 58                             pop        rax
0199a ebb8                           jmp        0x7f6a90169154
0199c 4983c201                       add        r10, 1
019a0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019a5 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
019af 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
019b2 83c302                         add        ebx, 2
019b5 895e78                         mov        dword ptr [rsi + 0x78], ebx
019b8 81e3feff1f00                   and        ebx, 0x1ffffe
019be 85db                           test       ebx, ebx
019c0 0f843a360000                   je         0x7f6a9016c800
019c6 488bf7                         mov        rsi, rdi
019c9 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
019d3 8b36                           mov        esi, dword ptr [rsi]
019d5 c1ee0d                         shr        esi, 0xd
019d8 48c1e60a                       shl        rsi, 0xa
019dc 41ba00000011                   mov        r10d, 0x11000000
019e2 4903f2                         add        rsi, r10
019e5 41ba17000000                   mov        r10d, 0x17
019eb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019ef 7436                           je         0x7f6a90169227
019f1 4983c202                       add        r10, 2
019f5 4983fa1b                       cmp        r10, 0x1b
019f9 75f0                           jne        0x7f6a901691eb
019fb 41ba17000000                   mov        r10d, 0x17
01a01 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a06 7412                           je         0x7f6a9016921a
01a08 4983c202                       add        r10, 2
01a0c 4983fa1b                       cmp        r10, 0x1b
01a10 75ef                           jne        0x7f6a90169201
01a12 41ba16000000                   mov        r10d, 0x16
01a18 eb11                           jmp        0x7f6a9016922b
01a1a 50                             push       rax
01a1b 4833c0                         xor        rax, rax
01a1e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01a24 58                             pop        rax
01a25 ebbe                           jmp        0x7f6a901691e5
01a27 4983c201                       add        r10, 1
01a2b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a30 488bf7                         mov        rsi, rdi
01a33 90                             nop        
01a34 90                             nop        
01a35 48b880873b646a7f0000           movabs     rax, 0x7f6a643b8780
01a3f e81c655c07                     call       0x7f6a9772f760
01a44 0f1f84003c1b0007               nop        dword ptr [rax + rax + 0x7001b3c]
01a4c 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
01a54 8b7704                         mov        esi, dword ptr [rdi + 4]
01a57 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
01a61 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01a69 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
01a73 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01a76 83c202                         add        edx, 2
01a79 895378                         mov        dword ptr [rbx + 0x78], edx
01a7c 81e2feff1f00                   and        edx, 0x1ffffe
01a82 85d2                           test       edx, edx
01a84 0f84b0350000                   je         0x7f6a9016c83a
01a8a 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01a92 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
01a9c 4883831001000001               add        qword ptr [rbx + 0x110], 1
01aa4 ffc8                           dec        eax
01aa6 2bf0                           sub        esi, eax
01aa8 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
01ab2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
01ab5 83c002                         add        eax, 2
01ab8 894378                         mov        dword ptr [rbx + 0x78], eax
01abb 25feff1f00                     and        eax, 0x1ffffe
01ac0 85c0                           test       eax, eax
01ac2 0f8493350000                   je         0x7f6a9016c85b
01ac8 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
01ad2 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01ada 48bb0000000000000000           movabs     rbx, 0
01ae4 bb00000000                     mov        ebx, 0
01ae9 443bdb                         cmp        r11d, ebx
01aec 0f8c8a350000                   jl         0x7f6a9016c87c
01af2 443bde                         cmp        r11d, esi
01af5 0f8da2350000                   jge        0x7f6a9016c89d
01afb 498bdb                         mov        rbx, r11
01afe 899c2460020000                 mov        dword ptr [rsp + 0x260], ebx
01b05 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01b0d 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
01b15 488bbc2458020000               mov        rdi, qword ptr [rsp + 0x258]
01b1d 488bf7                         mov        rsi, rdi
01b20 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01b2a 8b36                           mov        esi, dword ptr [rsi]
01b2c c1ee0d                         shr        esi, 0xd
01b2f 48c1e60a                       shl        rsi, 0xa
01b33 41ba00000011                   mov        r10d, 0x11000000
01b39 4903f2                         add        rsi, r10
01b3c 41ba1f000000                   mov        r10d, 0x1f
01b42 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b46 7436                           je         0x7f6a9016937e
01b48 4983c202                       add        r10, 2
01b4c 4983fa23                       cmp        r10, 0x23
01b50 75f0                           jne        0x7f6a90169342
01b52 41ba1f000000                   mov        r10d, 0x1f
01b58 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01b5d 7412                           je         0x7f6a90169371
01b5f 4983c202                       add        r10, 2
01b63 4983fa23                       cmp        r10, 0x23
01b67 75ef                           jne        0x7f6a90169358
01b69 41ba1e000000                   mov        r10d, 0x1e
01b6f eb11                           jmp        0x7f6a90169382
01b71 50                             push       rax
01b72 4833c0                         xor        rax, rax
01b75 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01b7b 58                             pop        rax
01b7c ebbe                           jmp        0x7f6a9016933c
01b7e 4983c201                       add        r10, 1
01b82 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01b87 488bf7                         mov        rsi, rdi
01b8a 90                             nop        
01b8b 90                             nop        
01b8c 90                             nop        
01b8d 48b8a8873b646a7f0000           movabs     rax, 0x7f6a643b87a8
01b97 e8c4635c07                     call       0x7f6a9772f760
01b9c 0f1f8400941c0008               nop        dword ptr [rax + rax + 0x8001c94]
01ba4 483b00                         cmp        rax, qword ptr [rax]
01ba7 488bf0                         mov        rsi, rax
01baa 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01bb4 8b36                           mov        esi, dword ptr [rsi]
01bb6 c1ee0d                         shr        esi, 0xd
01bb9 48c1e60a                       shl        rsi, 0xa
01bbd 41ba00000011                   mov        r10d, 0x11000000
01bc3 4903f2                         add        rsi, r10
01bc6 41ba25000000                   mov        r10d, 0x25
01bcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01bd0 7436                           je         0x7f6a90169408
01bd2 4983c202                       add        r10, 2
01bd6 4983fa29                       cmp        r10, 0x29
01bda 75f0                           jne        0x7f6a901693cc
01bdc 41ba25000000                   mov        r10d, 0x25
01be2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01be7 7412                           je         0x7f6a901693fb
01be9 4983c202                       add        r10, 2
01bed 4983fa29                       cmp        r10, 0x29
01bf1 75ef                           jne        0x7f6a901693e2
01bf3 41ba24000000                   mov        r10d, 0x24
01bf9 eb11                           jmp        0x7f6a9016940c
01bfb 50                             push       rax
01bfc 4833c0                         xor        rax, rax
01bff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c05 58                             pop        rax
01c06 ebbe                           jmp        0x7f6a901693c6
01c08 4983c201                       add        r10, 1
01c0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c11 8b7024                         mov        esi, dword ptr [rax + 0x24]
01c14 4c3b257d697e20                 cmp        r12, qword ptr [rip + 0x207e697d]
01c1b 0f8414000000                   je         0x7f6a90169435
01c21 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
01c2b 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2f e82c51bb1f                     call       0x7f6aafd1e560
01c34 f4                             hlt        
01c35 488bd0                         mov        rdx, rax
01c38 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
01c42 8b12                           mov        edx, dword ptr [rdx]
01c44 c1ea0d                         shr        edx, 0xd
01c47 48c1e20a                       shl        rdx, 0xa
01c4b 41ba00000011                   mov        r10d, 0x11000000
01c51 4903d2                         add        rdx, r10
01c54 41ba2b000000                   mov        r10d, 0x2b
01c5a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01c5e 7436                           je         0x7f6a90169496
01c60 4983c202                       add        r10, 2
01c64 4983fa2f                       cmp        r10, 0x2f
01c68 75f0                           jne        0x7f6a9016945a
01c6a 41ba2b000000                   mov        r10d, 0x2b
01c70 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01c75 7412                           je         0x7f6a90169489
01c77 4983c202                       add        r10, 2
01c7b 4983fa2f                       cmp        r10, 0x2f
01c7f 75ef                           jne        0x7f6a90169470
01c81 41ba2a000000                   mov        r10d, 0x2a
01c87 eb11                           jmp        0x7f6a9016949a
01c89 50                             push       rax
01c8a 4833c0                         xor        rax, rax
01c8d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01c93 58                             pop        rax
01c94 ebbe                           jmp        0x7f6a90169454
01c96 4983c201                       add        r10, 1
01c9a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01c9f 8b4804                         mov        ecx, dword ptr [rax + 4]
01ca2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01cac 4883828001000001               add        qword ptr [rdx + 0x180], 1
01cb4 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
01cbe 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01cc2 4183c002                       add        r8d, 2
01cc6 44894278                       mov        dword ptr [rdx + 0x78], r8d
01cca 4181e0feff1f00                 and        r8d, 0x1ffffe
01cd1 4585c0                         test       r8d, r8d
01cd4 0f84fd330000                   je         0x7f6a9016c8d7
01cda 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01ce4 4883829001000001               add        qword ptr [rdx + 0x190], 1
01cec 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
01cf3 4863db                         movsxd     rbx, ebx
01cf6 ba08000000                     mov        edx, 8
01cfb 4c8bcb                         mov        r9, rbx
01cfe 4c03ca                         add        r9, rdx
01d01 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01d0b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01d0f 4183c002                       add        r8d, 2
01d13 44894278                       mov        dword ptr [rdx + 0x78], r8d
01d17 4181e0feff1f00                 and        r8d, 0x1ffffe
01d1e 4585c0                         test       r8d, r8d
01d21 0f84d1330000                   je         0x7f6a9016c8f8
01d27 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01d31 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01d39 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
01d43 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01d47 4183c002                       add        r8d, 2
01d4b 44894278                       mov        dword ptr [rdx + 0x78], r8d
01d4f 4181e0feff1f00                 and        r8d, 0x1ffffe
01d56 4585c0                         test       r8d, r8d
01d59 0f84ba330000                   je         0x7f6a9016c919
01d5f 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01d69 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01d71 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
01d7b ba02000000                     mov        edx, 2
01d80 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
01d88 bf00000000                     mov        edi, 0
01d8d 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
01d95 48890424                       mov        qword ptr [rsp], rax
01d99 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
01da1 4889442408                     mov        qword ptr [rsp + 8], rax
01da6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01dab 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
01db5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dba 4889842400020000               mov        qword ptr [rsp + 0x200], rax
01dc2 90                             nop        
01dc3 90                             nop        
01dc4 90                             nop        
01dc5 90                             nop        
01dc6 90                             nop        
01dc7 e894665c07                     call       0x7f6a9772fc60
01dcc 0f1f8400c41e0009               nop        dword ptr [rax + rax + 0x9001ec4]
01dd4 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01ddc 4183c310                       add        r11d, 0x10
01de0 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
01de7 83c310                         add        ebx, 0x10
01dea 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01df2 be02000000                     mov        esi, 2
01df7 7c05                           jl         0x7f6a901695fe
01df9 be00000000                     mov        esi, 0
01dfe 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01e08 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
01e0b 03ce                           add        ecx, esi
01e0d 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
01e10 85f6                           test       esi, esi
01e12 7505                           jne        0x7f6a90169619
01e14 b902000000                     mov        ecx, 2
01e19 81e1fe3f0000                   and        ecx, 0x3ffe
01e1f 85c9                           test       ecx, ecx
01e21 0f8413330000                   je         0x7f6a9016c93a
01e27 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01e2b 418502                         test       dword ptr [r10], eax
01e2e 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01e36 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
01e40 ba48050000                     mov        edx, 0x548
01e45 7c05                           jl         0x7f6a9016964c
01e47 ba58050000                     mov        edx, 0x558
01e4c 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01e50 488d4901                       lea        rcx, [rcx + 1]
01e54 48890c16                       mov        qword ptr [rsi + rdx], rcx
01e58 0f8c12f5ffff                   jl         0x7f6a90168b70
01e5e 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
01e68 ff8668050000                   inc        dword ptr [rsi + 0x568]
01e6e e996000000                     jmp        0x7f6a90169709
01e73 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
01e7d 4883868005000001               add        qword ptr [rsi + 0x580], 1
01e85 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01e8d 8b9424e8010000                 mov        edx, dword ptr [rsp + 0x1e8]
01e94 488bd9                         mov        rbx, rcx
01e97 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01e9f 448b842408020000               mov        r8d, dword ptr [rsp + 0x208]
01ea7 4c8bcb                         mov        r9, rbx
01eaa 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01eaf 4c89442408                     mov        qword ptr [rsp + 8], r8
01eb4 48890c24                       mov        qword ptr [rsp], rcx
01eb8 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01ebd 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01ec2 488bfe                         mov        rdi, rsi
01ec5 488bf2                         mov        rsi, rdx
01ec8 488bd1                         mov        rdx, rcx
01ecb 498bc8                         mov        rcx, r8
01ece 4d8bc1                         mov        r8, r9
01ed1 e8aa475b07                     call       0x7f6a9771de80
01ed6 85c0                           test       eax, eax
01ed8 0f842b000000                   je         0x7f6a90169709
01ede 488bf8                         mov        rdi, rax
01ee1 83f7ff                         xor        edi, 0xffffffff
01ee4 488b0c24                       mov        rcx, qword ptr [rsp]
01ee8 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01eed 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01ef2 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01ef7 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01efc 442bcf                         sub        r9d, edi
01eff 03d7                           add        edx, edi
01f01 4403c7                         add        r8d, edi
01f04 e952320000                     jmp        0x7f6a9016c95b
01f09 8bbc2438020000                 mov        edi, dword ptr [rsp + 0x238]
01f10 448bac2440020000               mov        r13d, dword ptr [rsp + 0x240]
01f18 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
01f1f 498bdd                         mov        rbx, r13
01f22 2b9c243c020000                 sub        ebx, dword ptr [rsp + 0x23c]
01f29 83fe10                         cmp        esi, 0x10
01f2c 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01f36 b990050000                     mov        ecx, 0x590
01f3b 7f05                           jg         0x7f6a90169742
01f3d b9a0050000                     mov        ecx, 0x5a0
01f42 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f46 4d8d4001                       lea        r8, [r8 + 1]
01f4a 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f4e 448b9c243c020000               mov        r11d, dword ptr [rsp + 0x23c]
01f56 0f8f2c000000                   jg         0x7f6a90169788
01f5c 4183fb10                       cmp        r11d, 0x10
01f60 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01f6a b9c0050000                     mov        ecx, 0x5c0
01f6f 7d05                           jge        0x7f6a90169776
01f71 b9b0050000                     mov        ecx, 0x5b0
01f76 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f7a 4d8d4001                       lea        r8, [r8 + 1]
01f7e 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f82 0f8d0c180000                   jge        0x7f6a9016af94
01f88 443bde                         cmp        r11d, esi
01f8b 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01f95 b928060000                     mov        ecx, 0x628
01f9a 7c05                           jl         0x7f6a901697a1
01f9c b938060000                     mov        ecx, 0x638
01fa1 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fa5 4d8d4001                       lea        r8, [r8 + 1]
01fa9 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fad 0f8c8c060000                   jl         0x7f6a90169e3f
01fb3 83fe30                         cmp        esi, 0x30
01fb6 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01fc0 b948060000                     mov        ecx, 0x648
01fc5 7e05                           jle        0x7f6a901697cc
01fc7 b958060000                     mov        ecx, 0x658
01fcc 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fd0 4d8d4001                       lea        r8, [r8 + 1]
01fd4 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fd8 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
01fdf 0f8eaa000000                   jle        0x7f6a9016988f
01fe5 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01fef 4883826806000001               add        qword ptr [rdx + 0x668], 1
01ff7 488bc6                         mov        rax, rsi
01ffa 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
02002 488bd3                         mov        rdx, rbx
02005 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
0200d 4d8bc5                         mov        r8, r13
02010 4c8bc8                         mov        r9, rax
02013 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0201b 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
02020 4c89442408                     mov        qword ptr [rsp + 8], r8
02025 48890c24                       mov        qword ptr [rsp], rcx
02029 4889542418                     mov        qword ptr [rsp + 0x18], rdx
0202e 4889742420                     mov        qword ptr [rsp + 0x20], rsi
02033 488bfe                         mov        rdi, rsi
02036 488bf2                         mov        rsi, rdx
02039 488bd1                         mov        rdx, rcx
0203c 498bc8                         mov        rcx, r8
0203f 4d8bc1                         mov        r8, r9
02042 e839465b07                     call       0x7f6a9771de80
02047 85c0                           test       eax, eax
02049 0f842b000000                   je         0x7f6a9016987a
0204f 488bf8                         mov        rdi, rax
02052 83f7ff                         xor        edi, 0xffffffff
02055 488b0c24                       mov        rcx, qword ptr [rsp]
02059 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0205e 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
02063 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
02068 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
0206d 442bcf                         sub        r9d, edi
02070 03d7                           add        edx, edi
02072 4403c7                         add        r8d, edi
02075 e9ef300000                     jmp        0x7f6a9016c969
0207a 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
02084 ff8278060000                   inc        dword ptr [rdx + 0x678]
0208a e98b050000                     jmp        0x7f6a90169e1a
0208f 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
02097 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
0209f 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
020a7 4489ac2474020000               mov        dword ptr [rsp + 0x274], r13d
020af 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
020b6 90                             nop        
020b7 90                             nop        
020b8 89bc246c020000                 mov        dword ptr [rsp + 0x26c], edi
020bf 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
020c7 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
020d1 4883829006000001               add        qword ptr [rdx + 0x690], 1
020d9 48ba206a101100000000           movabs     rdx, 0x11106a20
020e3 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
020e6 83c102                         add        ecx, 2
020e9 894a78                         mov        dword ptr [rdx + 0x78], ecx
020ec 81e1feff1f00                   and        ecx, 0x1ffffe
020f2 85c9                           test       ecx, ecx
020f4 0f847f300000                   je         0x7f6a9016c979
020fa 48ba206a101100000000           movabs     rdx, 0x11106a20
02104 488d92e0000000                 lea        rdx, [rdx + 0xe0]
0210b 4885c0                         test       rax, rax
0210e 7510                           jne        0x7f6a90169920
02110 f6420801                       test       byte ptr [rdx + 8], 1
02114 0f8506000000                   jne        0x7f6a90169920
0211a f048834a0801                   lock or    qword ptr [rdx + 8], 1
02120 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0212a 488d9248030000                 lea        rdx, [rdx + 0x348]
02131 4885c0                         test       rax, rax
02134 7515                           jne        0x7f6a9016994b
02136 f6421001                       test       byte ptr [rdx + 0x10], 1
0213a 0f8537000000                   jne        0x7f6a90169977
02140 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
02146 e92c000000                     jmp        0x7f6a90169977
0214b 8b08                           mov        ecx, dword ptr [rax]
0214d c1e90d                         shr        ecx, 0xd
02150 48c1e10a                       shl        rcx, 0xa
02154 41ba00000011                   mov        r10d, 0x11000000
0215a 4903ca                         add        rcx, r10
0215d 4c8bd1                         mov        r10, rcx
02160 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
02164 48f7c1fcffffff                 test       rcx, -4
0216b 740a                           je         0x7f6a90169977
0216d f6c102                         test       cl, 2
02170 7505                           jne        0x7f6a90169977
02172 48834a1002                     or         qword ptr [rdx + 0x10], 2
02177 48ba206a101100000000           movabs     rdx, 0x11106a20
02181 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02189 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
02193 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02196 83c102                         add        ecx, 2
02199 894a78                         mov        dword ptr [rdx + 0x78], ecx
0219c 81e1feff1f00                   and        ecx, 0x1ffffe
021a2 85c9                           test       ecx, ecx
021a4 0f84f02f0000                   je         0x7f6a9016c99a
021aa 48bad82e29e300000000           movabs     rdx, 0xe3292ed8
021b4 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
021be 8b12                           mov        edx, dword ptr [rdx]
021c0 c1ea0d                         shr        edx, 0xd
021c3 48c1e20a                       shl        rdx, 0xa
021c7 41ba00000011                   mov        r10d, 0x11000000
021cd 4903d2                         add        rdx, r10
021d0 41ba17000000                   mov        r10d, 0x17
021d6 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
021da 7436                           je         0x7f6a90169a12
021dc 4983c202                       add        r10, 2
021e0 4983fa1b                       cmp        r10, 0x1b
021e4 75f0                           jne        0x7f6a901699d6
021e6 41ba17000000                   mov        r10d, 0x17
021ec 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
021f1 7412                           je         0x7f6a90169a05
021f3 4983c202                       add        r10, 2
021f7 4983fa1b                       cmp        r10, 0x1b
021fb 75ef                           jne        0x7f6a901699ec
021fd 41ba16000000                   mov        r10d, 0x16
02203 eb11                           jmp        0x7f6a90169a16
02205 50                             push       rax
02206 4833c0                         xor        rax, rax
02209 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0220f 58                             pop        rax
02210 ebbe                           jmp        0x7f6a901699d0
02212 4983c201                       add        r10, 1
02216 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0221b 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
02225 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02228 83c102                         add        ecx, 2
0222b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0222e 81e1feff1f00                   and        ecx, 0x1ffffe
02234 85c9                           test       ecx, ecx
02236 0f847f2f0000                   je         0x7f6a9016c9bb
0223c 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
02246 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
0224c 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
02256 ff8208010000                   inc        dword ptr [rdx + 0x108]
0225c 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
02266 ff8228010000                   inc        dword ptr [rdx + 0x128]
0226c 48ba902729e300000000           movabs     rdx, 0xe3292790
02276 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
02280 8b12                           mov        edx, dword ptr [rdx]
02282 c1ea0d                         shr        edx, 0xd
02285 48c1e20a                       shl        rdx, 0xa
02289 41ba00000011                   mov        r10d, 0x11000000
0228f 4903d2                         add        rdx, r10
02292 41ba28000000                   mov        r10d, 0x28
02298 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0229c 7436                           je         0x7f6a90169ad4
0229e 4983c202                       add        r10, 2
022a2 4983fa2c                       cmp        r10, 0x2c
022a6 75f0                           jne        0x7f6a90169a98
022a8 41ba28000000                   mov        r10d, 0x28
022ae 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
022b3 7412                           je         0x7f6a90169ac7
022b5 4983c202                       add        r10, 2
022b9 4983fa2c                       cmp        r10, 0x2c
022bd 75ef                           jne        0x7f6a90169aae
022bf 41ba27000000                   mov        r10d, 0x27
022c5 eb11                           jmp        0x7f6a90169ad8
022c7 50                             push       rax
022c8 4833c0                         xor        rax, rax
022cb f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
022d1 58                             pop        rax
022d2 ebbe                           jmp        0x7f6a90169a92
022d4 4983c201                       add        r10, 1
022d8 4a8304d101                     add        qword ptr [rcx + r10*8], 1
022dd 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
022e7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022ea 83c102                         add        ecx, 2
022ed 894a78                         mov        dword ptr [rdx + 0x78], ecx
022f0 81e1feff1f00                   and        ecx, 0x1ffffe
022f6 85c9                           test       ecx, ecx
022f8 0f84de2e0000                   je         0x7f6a9016c9dc
022fe 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
02308 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
0230e 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
02318 488d9288010000                 lea        rdx, [rdx + 0x188]
0231f 4885c0                         test       rax, rax
02322 7515                           jne        0x7f6a90169b39
02324 f6421801                       test       byte ptr [rdx + 0x18], 1
02328 0f8537000000                   jne        0x7f6a90169b65
0232e f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
02334 e92c000000                     jmp        0x7f6a90169b65
02339 8b08                           mov        ecx, dword ptr [rax]
0233b c1e90d                         shr        ecx, 0xd
0233e 48c1e10a                       shl        rcx, 0xa
02342 41ba00000011                   mov        r10d, 0x11000000
02348 4903ca                         add        rcx, r10
0234b 4c8bd1                         mov        r10, rcx
0234e 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
02352 48f7c1fcffffff                 test       rcx, -4
02359 740a                           je         0x7f6a90169b65
0235b f6c102                         test       cl, 2
0235e 7505                           jne        0x7f6a90169b65
02360 48834a1802                     or         qword ptr [rdx + 0x18], 2
02365 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0236f 4883827801000001               add        qword ptr [rdx + 0x178], 1
02377 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
02381 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02384 83c102                         add        ecx, 2
02387 894a78                         mov        dword ptr [rdx + 0x78], ecx
0238a 81e1feff1f00                   and        ecx, 0x1ffffe
02390 85c9                           test       ecx, ecx
02392 0f84652e0000                   je         0x7f6a9016c9fd
02398 4885c0                         test       rax, rax
0239b 49b8d88173846a7f0000           movabs     r8, 0x7f6a847381d8
023a5 750d                           jne        0x7f6a90169bb4
023a7 418088d900000001               or         byte ptr [r8 + 0xd9], 1
023af e98a000000                     jmp        0x7f6a90169c3e
023b4 8b30                           mov        esi, dword ptr [rax]
023b6 c1ee0d                         shr        esi, 0xd
023b9 48c1e60a                       shl        rsi, 0xa
023bd 41ba00000011                   mov        r10d, 0x11000000
023c3 4903f2                         add        rsi, r10
023c6 41ba1d000000                   mov        r10d, 0x1d
023cc 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
023d0 7436                           je         0x7f6a90169c08
023d2 4983c202                       add        r10, 2
023d6 4983fa21                       cmp        r10, 0x21
023da 75f0                           jne        0x7f6a90169bcc
023dc 41ba1d000000                   mov        r10d, 0x1d
023e2 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
023e7 7412                           je         0x7f6a90169bfb
023e9 4983c202                       add        r10, 2
023ed 4983fa21                       cmp        r10, 0x21
023f1 75ef                           jne        0x7f6a90169be2
023f3 41ba1c000000                   mov        r10d, 0x1c
023f9 eb11                           jmp        0x7f6a90169c0c
023fb 50                             push       rax
023fc 4833c0                         xor        rax, rax
023ff f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
02405 58                             pop        rax
02406 ebbe                           jmp        0x7f6a90169bc6
02408 4983c201                       add        r10, 1
0240c 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02411 48be0014041100000000           movabs     rsi, 0x11041400
0241b 448b00                         mov        r8d, dword ptr [rax]
0241e 41c1e80d                       shr        r8d, 0xd
02422 49c1e00a                       shl        r8, 0xa
02426 41ba00000011                   mov        r10d, 0x11000000
0242c 4d03c2                         add        r8, r10
0242f 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
02433 0f85e52d0000                   jne        0x7f6a9016ca1e
02439 e900000000                     jmp        0x7f6a90169c3e
0243e 488bd0                         mov        rdx, rax
02441 48b9d88173846a7f0000           movabs     rcx, 0x7f6a847381d8
0244b 4883811001000001               add        qword ptr [rcx + 0x110], 1
02453 48b9a88a141100000000           movabs     rcx, 0x11148aa8
0245d 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02461 4183c002                       add        r8d, 2
02465 44894178                       mov        dword ptr [rcx + 0x78], r8d
02469 4181e0feff1f00                 and        r8d, 0x1ffffe
02470 4585c0                         test       r8d, r8d
02473 0f84c22d0000                   je         0x7f6a9016ca3b
02479 8b4a04                         mov        ecx, dword ptr [rdx + 4]
0247c 49b8a88a141100000000           movabs     r8, 0x11148aa8
02486 498380b000000001               add        qword ptr [r8 + 0xb0], 1
0248e 83e907                         sub        ecx, 7
02491 49b828fe22e200000000           movabs     r8, 0xe222fe28
0249b 41b800000000                   mov        r8d, 0
024a1 413bd8                         cmp        ebx, r8d
024a4 0f8ccb2d0000                   jl         0x7f6a9016ca75
024aa 3bd9                           cmp        ebx, ecx
024ac 0f8de42d0000                   jge        0x7f6a9016ca96
024b2 488bcb                         mov        rcx, rbx
024b5 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
024bf 4c8bc6                         mov        r8, rsi
024c2 49b9d88173846a7f0000           movabs     r9, 0x7f6a847381d8
024cc 458b00                         mov        r8d, dword ptr [r8]
024cf 41c1e80d                       shr        r8d, 0xd
024d3 49c1e00a                       shl        r8, 0xa
024d7 41ba00000011                   mov        r10d, 0x11000000
024dd 4d03c2                         add        r8, r10
024e0 41ba25000000                   mov        r10d, 0x25
024e6 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
024ea 7436                           je         0x7f6a90169d22
024ec 4983c202                       add        r10, 2
024f0 4983fa29                       cmp        r10, 0x29
024f4 75f0                           jne        0x7f6a90169ce6
024f6 41ba25000000                   mov        r10d, 0x25
024fc 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
02501 7412                           je         0x7f6a90169d15
02503 4983c202                       add        r10, 2
02507 4983fa29                       cmp        r10, 0x29
0250b 75ef                           jne        0x7f6a90169cfc
0250d 41ba24000000                   mov        r10d, 0x24
02513 eb11                           jmp        0x7f6a90169d26
02515 50                             push       rax
02516 4833c0                         xor        rax, rax
02519 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0251f 58                             pop        rax
02520 ebbe                           jmp        0x7f6a90169ce0
02522 4983c201                       add        r10, 1
02526 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0252b 4863c9                         movsxd     rcx, ecx
0252e 41ba08000000                   mov        r10d, 8
02534 4903ca                         add        rcx, r10
02537 41b800000000                   mov        r8d, 0
0253d 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
02544 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0254c 90                             nop        
0254d 90                             nop        
0254e 90                             nop        
0254f e80c555c07                     call       0x7f6a9772f260
02554 0f1f84004c26000b               nop        dword ptr [rax + rax + 0xb00264c]
0255c 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
02566 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
0256e 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
02576 8b94246c020000                 mov        edx, dword ptr [rsp + 0x26c]
0257d 488bc8                         mov        rcx, rax
02580 90                             nop        
02581 90                             nop        
02582 90                             nop        
02583 90                             nop        
02584 90                             nop        
02585 90                             nop        
02586 90                             nop        
02587 e8d45e5c07                     call       0x7f6a9772fc60
0258c 0f1f84008426000c               nop        dword ptr [rax + rax + 0xc002684]
02594 8bbc246c020000                 mov        edi, dword ptr [rsp + 0x26c]
0259b 83c708                         add        edi, 8
0259e 8b9c2470020000                 mov        ebx, dword ptr [rsp + 0x270]
025a5 83c308                         add        ebx, 8
025a8 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
025af be02000000                     mov        esi, 2
025b4 7c05                           jl         0x7f6a90169dbb
025b6 be00000000                     mov        esi, 0
025bb 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
025c5 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
025c8 03ce                           add        ecx, esi
025ca 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
025cd 85f6                           test       esi, esi
025cf 7505                           jne        0x7f6a90169dd6
025d1 b902000000                     mov        ecx, 2
025d6 81e1fe3f0000                   and        ecx, 0x3ffe
025dc 85c9                           test       ecx, ecx
025de 0f84d32c0000                   je         0x7f6a9016cab7
025e4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
025e8 418502                         test       dword ptr [r10], eax
025eb 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
025f2 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
025fc bab0060000                     mov        edx, 0x6b0
02601 7c05                           jl         0x7f6a90169e08
02603 bac0060000                     mov        edx, 0x6c0
02608 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0260c 488d4901                       lea        rcx, [rcx + 1]
02610 48890c16                       mov        qword ptr [rsi + rdx], rcx
02614 0f8c9efaffff                   jl         0x7f6a901698b8
0261a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02622 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0262a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
02634 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
0263a e99f1b0000                     jmp        0x7f6a9016b9de
0263f 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
02646 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0264e 4183fb10                       cmp        r11d, 0x10
02652 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0265c bae8060000                     mov        edx, 0x6e8
02661 7c05                           jl         0x7f6a90169e68
02663 baf8060000                     mov        edx, 0x6f8
02668 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0266c 488d4901                       lea        rcx, [rcx + 1]
02670 48890c16                       mov        qword ptr [rsi + rdx], rcx
02674 0f8c0b0b0000                   jl         0x7f6a9016a985
0267a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02682 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0268a 4489ac2484020000               mov        dword ptr [rsp + 0x284], r13d
02692 8b842464020000                 mov        eax, dword ptr [rsp + 0x264]
02699 90                             nop        
0269a 90                             nop        
0269b 90                             nop        
0269c 90                             nop        
0269d 90                             nop        
0269e 90                             nop        
0269f 90                             nop        
026a0 89842478020000                 mov        dword ptr [rsp + 0x278], eax
026a7 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
026af 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
026b9 4883860807000001               add        qword ptr [rsi + 0x708], 1
026c1 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
026cb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
026ce 83c202                         add        edx, 2
026d1 895678                         mov        dword ptr [rsi + 0x78], edx
026d4 81e2feff1f00                   and        edx, 0x1ffffe
026da 85d2                           test       edx, edx
026dc 0f84f62b0000                   je         0x7f6a9016cad8
026e2 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
026ec 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
026f6 8b36                           mov        esi, dword ptr [rsi]
026f8 c1ee0d                         shr        esi, 0xd
026fb 48c1e60a                       shl        rsi, 0xa
026ff 41ba00000011                   mov        r10d, 0x11000000
02705 4903f2                         add        rsi, r10
02708 41ba17000000                   mov        r10d, 0x17
0270e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02712 7436                           je         0x7f6a90169f4a
02714 4983c202                       add        r10, 2
02718 4983fa1b                       cmp        r10, 0x1b
0271c 75f0                           jne        0x7f6a90169f0e
0271e 41ba17000000                   mov        r10d, 0x17
02724 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02729 7412                           je         0x7f6a90169f3d
0272b 4983c202                       add        r10, 2
0272f 4983fa1b                       cmp        r10, 0x1b
02733 75ef                           jne        0x7f6a90169f24
02735 41ba16000000                   mov        r10d, 0x16
0273b eb11                           jmp        0x7f6a90169f4e
0273d 50                             push       rax
0273e 4833c0                         xor        rax, rax
02741 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02747 58                             pop        rax
02748 ebbe                           jmp        0x7f6a90169f08
0274a 4983c201                       add        r10, 1
0274e 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02753 448b7004                       mov        r14d, dword ptr [rax + 4]
02757 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
02761 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02769 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02773 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02776 83c202                         add        edx, 2
02779 895678                         mov        dword ptr [rsi + 0x78], edx
0277c 81e2feff1f00                   and        edx, 0x1ffffe
02782 85d2                           test       edx, edx
02784 0f84882b0000                   je         0x7f6a9016cb12
0278a 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02794 4883861001000001               add        qword ptr [rsi + 0x110], 1
0279c 498bf6                         mov        rsi, r14
0279f 83ee0f                         sub        esi, 0xf
027a2 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
027ac 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
027af 83c102                         add        ecx, 2
027b2 894a78                         mov        dword ptr [rdx + 0x78], ecx
027b5 81e1feff1f00                   and        ecx, 0x1ffffe
027bb 85c9                           test       ecx, ecx
027bd 0f84702b0000                   je         0x7f6a9016cb33
027c3 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
027cd 488382b000000001               add        qword ptr [rdx + 0xb0], 1
027d5 48ba0000000000000000           movabs     rdx, 0
027df ba00000000                     mov        edx, 0
027e4 3bda                           cmp        ebx, edx
027e6 0f8c682b0000                   jl         0x7f6a9016cb54
027ec 3bde                           cmp        ebx, esi
027ee 0f8d812b0000                   jge        0x7f6a9016cb75
027f4 488bf3                         mov        rsi, rbx
027f7 48bac0c52de300000000           movabs     rdx, 0xe32dc5c0
02801 488bca                         mov        rcx, rdx
02804 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
0280e 8b09                           mov        ecx, dword ptr [rcx]
02810 c1e90d                         shr        ecx, 0xd
02813 48c1e10a                       shl        rcx, 0xa
02817 41ba00000011                   mov        r10d, 0x11000000
0281d 4903ca                         add        rcx, r10
02820 41ba25000000                   mov        r10d, 0x25
02826 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0282a 7436                           je         0x7f6a9016a062
0282c 4983c202                       add        r10, 2
02830 4983fa29                       cmp        r10, 0x29
02834 75f0                           jne        0x7f6a9016a026
02836 41ba25000000                   mov        r10d, 0x25
0283c 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02841 7412                           je         0x7f6a9016a055
02843 4983c202                       add        r10, 2
02847 4983fa29                       cmp        r10, 0x29
0284b 75ef                           jne        0x7f6a9016a03c
0284d 41ba24000000                   mov        r10d, 0x24
02853 eb11                           jmp        0x7f6a9016a066
02855 50                             push       rax
02856 4833c0                         xor        rax, rax
02859 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
0285f 58                             pop        rax
02860 ebbe                           jmp        0x7f6a9016a020
02862 4983c201                       add        r10, 1
02866 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0286b 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
02875 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02879 4183c002                       add        r8d, 2
0287d 44894178                       mov        dword ptr [rcx + 0x78], r8d
02881 4181e0feff1f00                 and        r8d, 0x1ffffe
02888 4585c0                         test       r8d, r8d
0288b 0f84052b0000                   je         0x7f6a9016cb96
02891 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
0289b 488381b000000001               add        qword ptr [rcx + 0xb0], 1
028a3 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
028ad 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
028b0 83c102                         add        ecx, 2
028b3 894a78                         mov        dword ptr [rdx + 0x78], ecx
028b6 81e1feff1f00                   and        ecx, 0x1ffffe
028bc 85c9                           test       ecx, ecx
028be 0f84f32a0000                   je         0x7f6a9016cbb7
028c4 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
028ce ff82c0000000                   inc        dword ptr [rdx + 0xc0]
028d4 4489b4247c020000               mov        dword ptr [rsp + 0x27c], r14d
028dc 899c2480020000                 mov        dword ptr [rsp + 0x280], ebx
028e3 48bab8452ee300000000           movabs     rdx, 0xe32e45b8
028ed 488bca                         mov        rcx, rdx
028f0 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
028fa 4983806001000001               add        qword ptr [r8 + 0x160], 1
02902 48b9f8bf6d846a7f0000           movabs     rcx, 0x7f6a846dbff8
0290c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02910 4183c002                       add        r8d, 2
02914 44894178                       mov        dword ptr [rcx + 0x78], r8d
02918 4181e0feff1f00                 and        r8d, 0x1ffffe
0291f 4585c0                         test       r8d, r8d
02922 0f84b02a0000                   je         0x7f6a9016cbd8
02928 488bca                         mov        rcx, rdx
0292b 49b8f8bf6d846a7f0000           movabs     r8, 0x7f6a846dbff8
02935 498380b000000001               add        qword ptr [r8 + 0xb0], 1
0293d 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
02947 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0294b 4183c002                       add        r8d, 2
0294f 44894178                       mov        dword ptr [rcx + 0x78], r8d
02953 4181e0feff1f00                 and        r8d, 0x1ffffe
0295a 4585c0                         test       r8d, r8d
0295d 0f84962a0000                   je         0x7f6a9016cbf9
02963 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
0296d 488381c000000001               add        qword ptr [rcx + 0xc0], 1
02975 48bad8b46d846a7f0000           movabs     rdx, 0x7f6a846db4d8
0297f 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02982 83c102                         add        ecx, 2
02985 894a78                         mov        dword ptr [rdx + 0x78], ecx
02988 81e1feff1f00                   and        ecx, 0x1ffffe
0298e 85c9                           test       ecx, ecx
02990 0f84842a0000                   je         0x7f6a9016cc1a
02996 48bac0c52de300000000           movabs     rdx, 0xe32dc5c0
029a0 488bca                         mov        rcx, rdx
029a3 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
029ad 8b09                           mov        ecx, dword ptr [rcx]
029af c1e90d                         shr        ecx, 0xd
029b2 48c1e10a                       shl        rcx, 0xa
029b6 41ba00000011                   mov        r10d, 0x11000000
029bc 4903ca                         add        rcx, r10
029bf 41ba1d000000                   mov        r10d, 0x1d
029c5 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
029c9 7436                           je         0x7f6a9016a201
029cb 4983c202                       add        r10, 2
029cf 4983fa21                       cmp        r10, 0x21
029d3 75f0                           jne        0x7f6a9016a1c5
029d5 41ba1d000000                   mov        r10d, 0x1d
029db 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
029e0 7412                           je         0x7f6a9016a1f4
029e2 4983c202                       add        r10, 2
029e6 4983fa21                       cmp        r10, 0x21
029ea 75ef                           jne        0x7f6a9016a1db
029ec 41ba1c000000                   mov        r10d, 0x1c
029f2 eb11                           jmp        0x7f6a9016a205
029f4 50                             push       rax
029f5 4833c0                         xor        rax, rax
029f8 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
029fe 58                             pop        rax
029ff ebbe                           jmp        0x7f6a9016a1bf
02a01 4983c201                       add        r10, 1
02a05 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02a0a 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
02a14 8b12                           mov        edx, dword ptr [rdx]
02a16 c1ea0d                         shr        edx, 0xd
02a19 48c1e20a                       shl        rdx, 0xa
02a1d 41ba00000011                   mov        r10d, 0x11000000
02a23 4903d2                         add        rdx, r10
02a26 41ba23000000                   mov        r10d, 0x23
02a2c 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02a30 7436                           je         0x7f6a9016a268
02a32 4983c202                       add        r10, 2
02a36 4983fa27                       cmp        r10, 0x27
02a3a 75f0                           jne        0x7f6a9016a22c
02a3c 41ba23000000                   mov        r10d, 0x23
02a42 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02a47 7412                           je         0x7f6a9016a25b
02a49 4983c202                       add        r10, 2
02a4d 4983fa27                       cmp        r10, 0x27
02a51 75ef                           jne        0x7f6a9016a242
02a53 41ba22000000                   mov        r10d, 0x22
02a59 eb11                           jmp        0x7f6a9016a26c
02a5b 50                             push       rax
02a5c 4833c0                         xor        rax, rax
02a5f f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02a65 58                             pop        rax
02a66 ebbe                           jmp        0x7f6a9016a226
02a68 4983c201                       add        r10, 1
02a6c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a71 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
02a7b 4883824001000001               add        qword ptr [rdx + 0x140], 1
02a83 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
02a8d 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02a90 83c102                         add        ecx, 2
02a93 894a78                         mov        dword ptr [rdx + 0x78], ecx
02a96 81e1feff1f00                   and        ecx, 0x1ffffe
02a9c 85c9                           test       ecx, ecx
02a9e 0f8497290000                   je         0x7f6a9016cc3b
02aa4 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
02aae 4883825001000001               add        qword ptr [rdx + 0x150], 1
02ab6 4863f6                         movsxd     rsi, esi
02ab9 ba08000000                     mov        edx, 8
02abe 4c8bce                         mov        r9, rsi
02ac1 4c03ca                         add        r9, rdx
02ac4 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
02ace 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02ad1 83c102                         add        ecx, 2
02ad4 894a78                         mov        dword ptr [rdx + 0x78], ecx
02ad7 81e1feff1f00                   and        ecx, 0x1ffffe
02add 85c9                           test       ecx, ecx
02adf 0f8477290000                   je         0x7f6a9016cc5c
02ae5 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
02aef 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02af7 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
02b01 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02b04 83c102                         add        ecx, 2
02b07 894a78                         mov        dword ptr [rdx + 0x78], ecx
02b0a 81e1feff1f00                   and        ecx, 0x1ffffe
02b10 85c9                           test       ecx, ecx
02b12 0f8465290000                   je         0x7f6a9016cc7d
02b18 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
02b22 4883827001000001               add        qword ptr [rdx + 0x170], 1
02b2a 48ba889e2ee300000000           movabs     rdx, 0xe32e9e88
02b34 488bfe                         mov        rdi, rsi
02b37 48be08c62de300000000           movabs     rsi, 0xe32dc608
02b41 ba02000000                     mov        edx, 2
02b46 b910000000                     mov        ecx, 0x10
02b4b 4c8bc0                         mov        r8, rax
02b4e 488bdf                         mov        rbx, rdi
02b51 bf00000000                     mov        edi, 0
02b56 48890424                       mov        qword ptr [rsp], rax
02b5a 48895c2408                     mov        qword ptr [rsp + 8], rbx
02b5f 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
02b69 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b6e 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
02b78 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b7d 4889842400020000               mov        qword ptr [rsp + 0x200], rax
02b85 90                             nop        
02b86 90                             nop        
02b87 e8d4585c07                     call       0x7f6a9772fc60
02b8c 0f1f8400842c000e               nop        dword ptr [rax + rax + 0xe002c84]
02b94 4885c0                         test       rax, rax
02b97 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
02ba1 750c                           jne        0x7f6a9016a3af
02ba3 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02baa e988000000                     jmp        0x7f6a9016a437
02baf 8b38                           mov        edi, dword ptr [rax]
02bb1 c1ef0d                         shr        edi, 0xd
02bb4 48c1e70a                       shl        rdi, 0xa
02bb8 41ba00000011                   mov        r10d, 0x11000000
02bbe 4903fa                         add        rdi, r10
02bc1 41ba31000000                   mov        r10d, 0x31
02bc7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02bcb 7436                           je         0x7f6a9016a403
02bcd 4983c202                       add        r10, 2
02bd1 4983fa35                       cmp        r10, 0x35
02bd5 75f0                           jne        0x7f6a9016a3c7
02bd7 41ba31000000                   mov        r10d, 0x31
02bdd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02be2 7412                           je         0x7f6a9016a3f6
02be4 4983c202                       add        r10, 2
02be8 4983fa35                       cmp        r10, 0x35
02bec 75ef                           jne        0x7f6a9016a3dd
02bee 41ba30000000                   mov        r10d, 0x30
02bf4 eb11                           jmp        0x7f6a9016a407
02bf6 50                             push       rax
02bf7 4833c0                         xor        rax, rax
02bfa f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02c00 58                             pop        rax
02c01 ebbe                           jmp        0x7f6a9016a3c1
02c03 4983c201                       add        r10, 1
02c07 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02c0c 48bf00b4141100000000           movabs     rdi, 0x1114b400
02c16 8b18                           mov        ebx, dword ptr [rax]
02c18 c1eb0d                         shr        ebx, 0xd
02c1b 48c1e30a                       shl        rbx, 0xa
02c1f 41ba00000011                   mov        r10d, 0x11000000
02c25 4903da                         add        rbx, r10
02c28 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02c2c 0f856c280000                   jne        0x7f6a9016cc9e
02c32 e900000000                     jmp        0x7f6a9016a437
02c37 488bf8                         mov        rdi, rax
02c3a 4889bc2488020000               mov        qword ptr [rsp + 0x288], rdi
02c42 483b07                         cmp        rax, qword ptr [rdi]
02c45 488bf7                         mov        rsi, rdi
02c48 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
02c52 8b36                           mov        esi, dword ptr [rsi]
02c54 c1ee0d                         shr        esi, 0xd
02c57 48c1e60a                       shl        rsi, 0xa
02c5b 41ba00000011                   mov        r10d, 0x11000000
02c61 4903f2                         add        rsi, r10
02c64 41bae4000000                   mov        r10d, 0xe4
02c6a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02c6e 743c                           je         0x7f6a9016a4ac
02c70 4983c202                       add        r10, 2
02c74 4981fae8000000                 cmp        r10, 0xe8
02c7b 75ed                           jne        0x7f6a9016a46a
02c7d 41bae4000000                   mov        r10d, 0xe4
02c83 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02c88 7415                           je         0x7f6a9016a49f
02c8a 4983c202                       add        r10, 2
02c8e 4981fae8000000                 cmp        r10, 0xe8
02c95 75ec                           jne        0x7f6a9016a483
02c97 41bae3000000                   mov        r10d, 0xe3
02c9d eb11                           jmp        0x7f6a9016a4b0
02c9f 50                             push       rax
02ca0 4833c0                         xor        rax, rax
02ca3 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02ca9 58                             pop        rax
02caa ebb8                           jmp        0x7f6a9016a464
02cac 4983c201                       add        r10, 1
02cb0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02cb5 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
02cbf 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02cc2 83c302                         add        ebx, 2
02cc5 895e78                         mov        dword ptr [rsi + 0x78], ebx
02cc8 81e3feff1f00                   and        ebx, 0x1ffffe
02cce 85db                           test       ebx, ebx
02cd0 0f84fe270000                   je         0x7f6a9016ccd4
02cd6 488bf7                         mov        rsi, rdi
02cd9 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
02ce3 8b36                           mov        esi, dword ptr [rsi]
02ce5 c1ee0d                         shr        esi, 0xd
02ce8 48c1e60a                       shl        rsi, 0xa
02cec 41ba00000011                   mov        r10d, 0x11000000
02cf2 4903f2                         add        rsi, r10
02cf5 41ba17000000                   mov        r10d, 0x17
02cfb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02cff 7436                           je         0x7f6a9016a537
02d01 4983c202                       add        r10, 2
02d05 4983fa1b                       cmp        r10, 0x1b
02d09 75f0                           jne        0x7f6a9016a4fb
02d0b 41ba17000000                   mov        r10d, 0x17
02d11 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02d16 7412                           je         0x7f6a9016a52a
02d18 4983c202                       add        r10, 2
02d1c 4983fa1b                       cmp        r10, 0x1b
02d20 75ef                           jne        0x7f6a9016a511
02d22 41ba16000000                   mov        r10d, 0x16
02d28 eb11                           jmp        0x7f6a9016a53b
02d2a 50                             push       rax
02d2b 4833c0                         xor        rax, rax
02d2e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02d34 58                             pop        rax
02d35 ebbe                           jmp        0x7f6a9016a4f5
02d37 4983c201                       add        r10, 1
02d3b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02d40 488bf7                         mov        rsi, rdi
02d43 90                             nop        
02d44 90                             nop        
02d45 48b8d0873b646a7f0000           movabs     rax, 0x7f6a643b87d0
02d4f e80c525c07                     call       0x7f6a9772f760
02d54 0f1f84004c2e000f               nop        dword ptr [rax + rax + 0xf002e4c]
02d5c 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
02d66 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02d6e 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02d78 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02d7b 83c702                         add        edi, 2
02d7e 897e78                         mov        dword ptr [rsi + 0x78], edi
02d81 81e7feff1f00                   and        edi, 0x1ffffe
02d87 85ff                           test       edi, edi
02d89 0f8466270000                   je         0x7f6a9016ccf5
02d8f 448bb4247c020000               mov        r14d, dword ptr [rsp + 0x27c]
02d97 8bbc2478020000                 mov        edi, dword ptr [rsp + 0x278]
02d9e 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02da8 4883861001000001               add        qword ptr [rsi + 0x110], 1
02db0 ffc8                           dec        eax
02db2 442bf0                         sub        r14d, eax
02db5 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
02dbf 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02dc2 83c302                         add        ebx, 2
02dc5 895e78                         mov        dword ptr [rsi + 0x78], ebx
02dc8 81e3feff1f00                   and        ebx, 0x1ffffe
02dce 85db                           test       ebx, ebx
02dd0 0f8440270000                   je         0x7f6a9016cd16
02dd6 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
02de0 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02de8 48be0000000000000000           movabs     rsi, 0
02df2 be00000000                     mov        esi, 0
02df7 3bfe                           cmp        edi, esi
02df9 0f8c38270000                   jl         0x7f6a9016cd37
02dff 413bfe                         cmp        edi, r14d
02e02 0f8d50270000                   jge        0x7f6a9016cd58
02e08 488bc7                         mov        rax, rdi
02e0b 89842490020000                 mov        dword ptr [rsp + 0x290], eax
02e12 89bc2478020000                 mov        dword ptr [rsp + 0x278], edi
02e19 488bbc2488020000               mov        rdi, qword ptr [rsp + 0x288]
02e21 488bf7                         mov        rsi, rdi
02e24 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
02e2e 8b36                           mov        esi, dword ptr [rsi]
02e30 c1ee0d                         shr        esi, 0xd
02e33 48c1e60a                       shl        rsi, 0xa
02e37 41ba00000011                   mov        r10d, 0x11000000
02e3d 4903f2                         add        rsi, r10
02e40 41ba1f000000                   mov        r10d, 0x1f
02e46 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02e4a 7436                           je         0x7f6a9016a682
02e4c 4983c202                       add        r10, 2
02e50 4983fa23                       cmp        r10, 0x23
02e54 75f0                           jne        0x7f6a9016a646
02e56 41ba1f000000                   mov        r10d, 0x1f
02e5c 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e61 7412                           je         0x7f6a9016a675
02e63 4983c202                       add        r10, 2
02e67 4983fa23                       cmp        r10, 0x23
02e6b 75ef                           jne        0x7f6a9016a65c
02e6d 41ba1e000000                   mov        r10d, 0x1e
02e73 eb11                           jmp        0x7f6a9016a686
02e75 50                             push       rax
02e76 4833c0                         xor        rax, rax
02e79 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02e7f 58                             pop        rax
02e80 ebbe                           jmp        0x7f6a9016a640
02e82 4983c201                       add        r10, 1
02e86 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e8b 488bf7                         mov        rsi, rdi
02e8e 90                             nop        
02e8f 90                             nop        
02e90 90                             nop        
02e91 90                             nop        
02e92 90                             nop        
02e93 90                             nop        
02e94 90                             nop        
02e95 48b8f8873b646a7f0000           movabs     rax, 0x7f6a643b87f8
02e9f e8bc505c07                     call       0x7f6a9772f760
02ea4 0f1f84009c2f0010               nop        dword ptr [rax + rax + 0x10002f9c]
02eac 483b00                         cmp        rax, qword ptr [rax]
02eaf 488bf0                         mov        rsi, rax
02eb2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02ebc 8b36                           mov        esi, dword ptr [rsi]
02ebe c1ee0d                         shr        esi, 0xd
02ec1 48c1e60a                       shl        rsi, 0xa
02ec5 41ba00000011                   mov        r10d, 0x11000000
02ecb 4903f2                         add        rsi, r10
02ece 41ba25000000                   mov        r10d, 0x25
02ed4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02ed8 7436                           je         0x7f6a9016a710
02eda 4983c202                       add        r10, 2
02ede 4983fa29                       cmp        r10, 0x29
02ee2 75f0                           jne        0x7f6a9016a6d4
02ee4 41ba25000000                   mov        r10d, 0x25
02eea 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02eef 7412                           je         0x7f6a9016a703
02ef1 4983c202                       add        r10, 2
02ef5 4983fa29                       cmp        r10, 0x29
02ef9 75ef                           jne        0x7f6a9016a6ea
02efb 41ba24000000                   mov        r10d, 0x24
02f01 eb11                           jmp        0x7f6a9016a714
02f03 50                             push       rax
02f04 4833c0                         xor        rax, rax
02f07 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02f0d 58                             pop        rax
02f0e ebbe                           jmp        0x7f6a9016a6ce
02f10 4983c201                       add        r10, 1
02f14 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02f19 8b7024                         mov        esi, dword ptr [rax + 0x24]
02f1c 4c3b2575567e20                 cmp        r12, qword ptr [rip + 0x207e5675]
02f23 0f8414000000                   je         0x7f6a9016a73d
02f29 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
02f33 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f37 e8243ebb1f                     call       0x7f6aafd1e560
02f3c f4                             hlt        
02f3d 488bd0                         mov        rdx, rax
02f40 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
02f4a 8b12                           mov        edx, dword ptr [rdx]
02f4c c1ea0d                         shr        edx, 0xd
02f4f 48c1e20a                       shl        rdx, 0xa
02f53 41ba00000011                   mov        r10d, 0x11000000
02f59 4903d2                         add        rdx, r10
02f5c 41ba2b000000                   mov        r10d, 0x2b
02f62 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02f66 7436                           je         0x7f6a9016a79e
02f68 4983c202                       add        r10, 2
02f6c 4983fa2f                       cmp        r10, 0x2f
02f70 75f0                           jne        0x7f6a9016a762
02f72 41ba2b000000                   mov        r10d, 0x2b
02f78 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02f7d 7412                           je         0x7f6a9016a791
02f7f 4983c202                       add        r10, 2
02f83 4983fa2f                       cmp        r10, 0x2f
02f87 75ef                           jne        0x7f6a9016a778
02f89 41ba2a000000                   mov        r10d, 0x2a
02f8f eb11                           jmp        0x7f6a9016a7a2
02f91 50                             push       rax
02f92 4833c0                         xor        rax, rax
02f95 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02f9b 58                             pop        rax
02f9c ebbe                           jmp        0x7f6a9016a75c
02f9e 4983c201                       add        r10, 1
02fa2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02fa7 8b4804                         mov        ecx, dword ptr [rax + 4]
02faa 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02fb4 4883828001000001               add        qword ptr [rdx + 0x180], 1
02fbc 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
02fc6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02fca 4183c002                       add        r8d, 2
02fce 44894278                       mov        dword ptr [rdx + 0x78], r8d
02fd2 4181e0feff1f00                 and        r8d, 0x1ffffe
02fd9 4585c0                         test       r8d, r8d
02fdc 0f84b0250000                   je         0x7f6a9016cd92
02fe2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02fec 4883829001000001               add        qword ptr [rdx + 0x190], 1
02ff4 8b842490020000                 mov        eax, dword ptr [rsp + 0x290]
02ffb 4863c0                         movsxd     rax, eax
02ffe ba08000000                     mov        edx, 8
03003 4c8bc8                         mov        r9, rax
03006 4c03ca                         add        r9, rdx
03009 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
03013 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03017 4183c002                       add        r8d, 2
0301b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0301f 4181e0feff1f00                 and        r8d, 0x1ffffe
03026 4585c0                         test       r8d, r8d
03029 0f8484250000                   je         0x7f6a9016cdb3
0302f 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
03039 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03041 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
0304b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0304f 4183c002                       add        r8d, 2
03053 44894278                       mov        dword ptr [rdx + 0x78], r8d
03057 4181e0feff1f00                 and        r8d, 0x1ffffe
0305e 4585c0                         test       r8d, r8d
03061 0f846d250000                   je         0x7f6a9016cdd4
03067 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03071 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03079 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
03083 ba02000000                     mov        edx, 2
03088 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
03090 bf00000000                     mov        edi, 0
03095 488b9c2488020000               mov        rbx, qword ptr [rsp + 0x288]
0309d 48891c24                       mov        qword ptr [rsp], rbx
030a1 488b9c2400020000               mov        rbx, qword ptr [rsp + 0x200]
030a9 48895c2408                     mov        qword ptr [rsp + 8], rbx
030ae 4889442410                     mov        qword ptr [rsp + 0x10], rax
030b3 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
030bd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
030c2 48899c2400020000               mov        qword ptr [rsp + 0x200], rbx
030ca 90                             nop        
030cb 90                             nop        
030cc 90                             nop        
030cd 90                             nop        
030ce 90                             nop        
030cf e88c535c07                     call       0x7f6a9772fc60
030d4 0f1f8400cc310011               nop        dword ptr [rax + rax + 0x110031cc]
030dc 8b842478020000                 mov        eax, dword ptr [rsp + 0x278]
030e3 83c010                         add        eax, 0x10
030e6 8b9c2480020000                 mov        ebx, dword ptr [rsp + 0x280]
030ed 83c310                         add        ebx, 0x10
030f0 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
030f7 ba02000000                     mov        edx, 2
030fc 7c05                           jl         0x7f6a9016a903
030fe ba00000000                     mov        edx, 0
03103 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
0310d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03111 4403c2                         add        r8d, edx
03114 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03118 85d2                           test       edx, edx
0311a 7506                           jne        0x7f6a9016a922
0311c 41b802000000                   mov        r8d, 2
03122 4181e0fe3f0000                 and        r8d, 0x3ffe
03129 4585c0                         test       r8d, r8d
0312c 0f84c3240000                   je         0x7f6a9016cdf5
03132 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03136 418502                         test       dword ptr [r10], eax
03139 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
03140 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0314a b948070000                     mov        ecx, 0x748
0314f 7c05                           jl         0x7f6a9016a956
03151 b958070000                     mov        ecx, 0x758
03156 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0315a 4d8d4001                       lea        r8, [r8 + 1]
0315e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03162 0f8c38f5ffff                   jl         0x7f6a90169ea0
03168 448bac2484020000               mov        r13d, dword ptr [rsp + 0x284]
03170 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0317a ff8268070000                   inc        dword ptr [rdx + 0x768]
03180 e959100000                     jmp        0x7f6a9016b9de
03185 4183fb08                       cmp        r11d, 8
03189 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03193 b980070000                     mov        ecx, 0x780
03198 7c05                           jl         0x7f6a9016a99f
0319a b990070000                     mov        ecx, 0x790
0319f 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
031a3 4d8d4001                       lea        r8, [r8 + 1]
031a7 4c89040a                       mov        qword ptr [rdx + rcx], r8
031ab 0f8c9e050000                   jl         0x7f6a9016af4f
031b1 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
031b9 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
031c1 4489ac249c020000               mov        dword ptr [rsp + 0x29c], r13d
031c9 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
031d0 89bc2494020000                 mov        dword ptr [rsp + 0x294], edi
031d7 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
031df 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
031e9 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
031f1 48ba206a101100000000           movabs     rdx, 0x11106a20
031fb 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
031fe 83c102                         add        ecx, 2
03201 894a78                         mov        dword ptr [rdx + 0x78], ecx
03204 81e1feff1f00                   and        ecx, 0x1ffffe
0320a 85c9                           test       ecx, ecx
0320c 0f8404240000                   je         0x7f6a9016ce16
03212 48ba206a101100000000           movabs     rdx, 0x11106a20
0321c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03223 4885c0                         test       rax, rax
03226 7510                           jne        0x7f6a9016aa38
03228 f6420801                       test       byte ptr [rdx + 8], 1
0322c 0f8506000000                   jne        0x7f6a9016aa38
03232 f048834a0801                   lock or    qword ptr [rdx + 8], 1
03238 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
03242 488d9248030000                 lea        rdx, [rdx + 0x348]
03249 4885c0                         test       rax, rax
0324c 7515                           jne        0x7f6a9016aa63
0324e f6421001                       test       byte ptr [rdx + 0x10], 1
03252 0f8537000000                   jne        0x7f6a9016aa8f
03258 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
0325e e92c000000                     jmp        0x7f6a9016aa8f
03263 8b08                           mov        ecx, dword ptr [rax]
03265 c1e90d                         shr        ecx, 0xd
03268 48c1e10a                       shl        rcx, 0xa
0326c 41ba00000011                   mov        r10d, 0x11000000
03272 4903ca                         add        rcx, r10
03275 4c8bd1                         mov        r10, rcx
03278 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
0327c 48f7c1fcffffff                 test       rcx, -4
03283 740a                           je         0x7f6a9016aa8f
03285 f6c102                         test       cl, 2
03288 7505                           jne        0x7f6a9016aa8f
0328a 48834a1002                     or         qword ptr [rdx + 0x10], 2
0328f 48ba206a101100000000           movabs     rdx, 0x11106a20
03299 488382b000000001               add        qword ptr [rdx + 0xb0], 1
032a1 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
032ab 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032ae 83c102                         add        ecx, 2
032b1 894a78                         mov        dword ptr [rdx + 0x78], ecx
032b4 81e1feff1f00                   and        ecx, 0x1ffffe
032ba 85c9                           test       ecx, ecx
032bc 0f8475230000                   je         0x7f6a9016ce37
032c2 48bad82e29e300000000           movabs     rdx, 0xe3292ed8
032cc 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
032d6 8b12                           mov        edx, dword ptr [rdx]
032d8 c1ea0d                         shr        edx, 0xd
032db 48c1e20a                       shl        rdx, 0xa
032df 41ba00000011                   mov        r10d, 0x11000000
032e5 4903d2                         add        rdx, r10
032e8 41ba17000000                   mov        r10d, 0x17
032ee 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
032f2 7436                           je         0x7f6a9016ab2a
032f4 4983c202                       add        r10, 2
032f8 4983fa1b                       cmp        r10, 0x1b
032fc 75f0                           jne        0x7f6a9016aaee
032fe 41ba17000000                   mov        r10d, 0x17
03304 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03309 7412                           je         0x7f6a9016ab1d
0330b 4983c202                       add        r10, 2
0330f 4983fa1b                       cmp        r10, 0x1b
03313 75ef                           jne        0x7f6a9016ab04
03315 41ba16000000                   mov        r10d, 0x16
0331b eb11                           jmp        0x7f6a9016ab2e
0331d 50                             push       rax
0331e 4833c0                         xor        rax, rax
03321 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03327 58                             pop        rax
03328 ebbe                           jmp        0x7f6a9016aae8
0332a 4983c201                       add        r10, 1
0332e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03333 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
0333d 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03340 83c102                         add        ecx, 2
03343 894a78                         mov        dword ptr [rdx + 0x78], ecx
03346 81e1feff1f00                   and        ecx, 0x1ffffe
0334c 85c9                           test       ecx, ecx
0334e 0f8404230000                   je         0x7f6a9016ce58
03354 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
0335e ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03364 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0336e ff8208010000                   inc        dword ptr [rdx + 0x108]
03374 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0337e ff8228010000                   inc        dword ptr [rdx + 0x128]
03384 48ba902729e300000000           movabs     rdx, 0xe3292790
0338e 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
03398 8b12                           mov        edx, dword ptr [rdx]
0339a c1ea0d                         shr        edx, 0xd
0339d 48c1e20a                       shl        rdx, 0xa
033a1 41ba00000011                   mov        r10d, 0x11000000
033a7 4903d2                         add        rdx, r10
033aa 41ba28000000                   mov        r10d, 0x28
033b0 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
033b4 7436                           je         0x7f6a9016abec
033b6 4983c202                       add        r10, 2
033ba 4983fa2c                       cmp        r10, 0x2c
033be 75f0                           jne        0x7f6a9016abb0
033c0 41ba28000000                   mov        r10d, 0x28
033c6 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
033cb 7412                           je         0x7f6a9016abdf
033cd 4983c202                       add        r10, 2
033d1 4983fa2c                       cmp        r10, 0x2c
033d5 75ef                           jne        0x7f6a9016abc6
033d7 41ba27000000                   mov        r10d, 0x27
033dd eb11                           jmp        0x7f6a9016abf0
033df 50                             push       rax
033e0 4833c0                         xor        rax, rax
033e3 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
033e9 58                             pop        rax
033ea ebbe                           jmp        0x7f6a9016abaa
033ec 4983c201                       add        r10, 1
033f0 4a8304d101                     add        qword ptr [rcx + r10*8], 1
033f5 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
033ff 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03402 83c102                         add        ecx, 2
03405 894a78                         mov        dword ptr [rdx + 0x78], ecx
03408 81e1feff1f00                   and        ecx, 0x1ffffe
0340e 85c9                           test       ecx, ecx
03410 0f8463220000                   je         0x7f6a9016ce79
03416 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
03420 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03426 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
03430 488d9288010000                 lea        rdx, [rdx + 0x188]
03437 4885c0                         test       rax, rax
0343a 7515                           jne        0x7f6a9016ac51
0343c f6421801                       test       byte ptr [rdx + 0x18], 1
03440 0f8537000000                   jne        0x7f6a9016ac7d
03446 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
0344c e92c000000                     jmp        0x7f6a9016ac7d
03451 8b08                           mov        ecx, dword ptr [rax]
03453 c1e90d                         shr        ecx, 0xd
03456 48c1e10a                       shl        rcx, 0xa
0345a 41ba00000011                   mov        r10d, 0x11000000
03460 4903ca                         add        rcx, r10
03463 4c8bd1                         mov        r10, rcx
03466 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
0346a 48f7c1fcffffff                 test       rcx, -4
03471 740a                           je         0x7f6a9016ac7d
03473 f6c102                         test       cl, 2
03476 7505                           jne        0x7f6a9016ac7d
03478 48834a1802                     or         qword ptr [rdx + 0x18], 2
0347d 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
03487 4883827801000001               add        qword ptr [rdx + 0x178], 1
0348f 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
03499 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0349c 83c102                         add        ecx, 2
0349f 894a78                         mov        dword ptr [rdx + 0x78], ecx
034a2 81e1feff1f00                   and        ecx, 0x1ffffe
034a8 85c9                           test       ecx, ecx
034aa 0f84ea210000                   je         0x7f6a9016ce9a
034b0 4885c0                         test       rax, rax
034b3 49b8d88173846a7f0000           movabs     r8, 0x7f6a847381d8
034bd 750d                           jne        0x7f6a9016accc
034bf 418088d900000001               or         byte ptr [r8 + 0xd9], 1
034c7 e98a000000                     jmp        0x7f6a9016ad56
034cc 8b30                           mov        esi, dword ptr [rax]
034ce c1ee0d                         shr        esi, 0xd
034d1 48c1e60a                       shl        rsi, 0xa
034d5 41ba00000011                   mov        r10d, 0x11000000
034db 4903f2                         add        rsi, r10
034de 41ba1d000000                   mov        r10d, 0x1d
034e4 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
034e8 7436                           je         0x7f6a9016ad20
034ea 4983c202                       add        r10, 2
034ee 4983fa21                       cmp        r10, 0x21
034f2 75f0                           jne        0x7f6a9016ace4
034f4 41ba1d000000                   mov        r10d, 0x1d
034fa 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
034ff 7412                           je         0x7f6a9016ad13
03501 4983c202                       add        r10, 2
03505 4983fa21                       cmp        r10, 0x21
03509 75ef                           jne        0x7f6a9016acfa
0350b 41ba1c000000                   mov        r10d, 0x1c
03511 eb11                           jmp        0x7f6a9016ad24
03513 50                             push       rax
03514 4833c0                         xor        rax, rax
03517 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
0351d 58                             pop        rax
0351e ebbe                           jmp        0x7f6a9016acde
03520 4983c201                       add        r10, 1
03524 4b8304d001                     add        qword ptr [r8 + r10*8], 1
03529 48be0014041100000000           movabs     rsi, 0x11041400
03533 448b00                         mov        r8d, dword ptr [rax]
03536 41c1e80d                       shr        r8d, 0xd
0353a 49c1e00a                       shl        r8, 0xa
0353e 41ba00000011                   mov        r10d, 0x11000000
03544 4d03c2                         add        r8, r10
03547 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
0354b 0f856a210000                   jne        0x7f6a9016cebb
03551 e900000000                     jmp        0x7f6a9016ad56
03556 488bd0                         mov        rdx, rax
03559 48b9d88173846a7f0000           movabs     rcx, 0x7f6a847381d8
03563 4883811001000001               add        qword ptr [rcx + 0x110], 1
0356b 48b9a88a141100000000           movabs     rcx, 0x11148aa8
03575 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
03579 4183c002                       add        r8d, 2
0357d 44894178                       mov        dword ptr [rcx + 0x78], r8d
03581 4181e0feff1f00                 and        r8d, 0x1ffffe
03588 4585c0                         test       r8d, r8d
0358b 0f8447210000                   je         0x7f6a9016ced8
03591 8b4a04                         mov        ecx, dword ptr [rdx + 4]
03594 49b8a88a141100000000           movabs     r8, 0x11148aa8
0359e 498380b000000001               add        qword ptr [r8 + 0xb0], 1
035a6 83e907                         sub        ecx, 7
035a9 49b828fe22e200000000           movabs     r8, 0xe222fe28
035b3 41b800000000                   mov        r8d, 0
035b9 413bd8                         cmp        ebx, r8d
035bc 0f8c50210000                   jl         0x7f6a9016cf12
035c2 3bd9                           cmp        ebx, ecx
035c4 0f8d69210000                   jge        0x7f6a9016cf33
035ca 488bcb                         mov        rcx, rbx
035cd 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
035d7 4c8bc6                         mov        r8, rsi
035da 49b9d88173846a7f0000           movabs     r9, 0x7f6a847381d8
035e4 458b00                         mov        r8d, dword ptr [r8]
035e7 41c1e80d                       shr        r8d, 0xd
035eb 49c1e00a                       shl        r8, 0xa
035ef 41ba00000011                   mov        r10d, 0x11000000
035f5 4d03c2                         add        r8, r10
035f8 41ba25000000                   mov        r10d, 0x25
035fe 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
03602 7436                           je         0x7f6a9016ae3a
03604 4983c202                       add        r10, 2
03608 4983fa29                       cmp        r10, 0x29
0360c 75f0                           jne        0x7f6a9016adfe
0360e 41ba25000000                   mov        r10d, 0x25
03614 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
03619 7412                           je         0x7f6a9016ae2d
0361b 4983c202                       add        r10, 2
0361f 4983fa29                       cmp        r10, 0x29
03623 75ef                           jne        0x7f6a9016ae14
03625 41ba24000000                   mov        r10d, 0x24
0362b eb11                           jmp        0x7f6a9016ae3e
0362d 50                             push       rax
0362e 4833c0                         xor        rax, rax
03631 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
03637 58                             pop        rax
03638 ebbe                           jmp        0x7f6a9016adf8
0363a 4983c201                       add        r10, 1
0363e 4b8304d101                     add        qword ptr [r9 + r10*8], 1
03643 4863c9                         movsxd     rcx, ecx
03646 41ba08000000                   mov        r10d, 8
0364c 4903ca                         add        rcx, r10
0364f 41b800000000                   mov        r8d, 0
03655 899c2498020000                 mov        dword ptr [rsp + 0x298], ebx
0365c 4889842400020000               mov        qword ptr [rsp + 0x200], rax
03664 90                             nop        
03665 90                             nop        
03666 90                             nop        
03667 e8f4435c07                     call       0x7f6a9772f260
0366c 0f1f840064370013               nop        dword ptr [rax + rax + 0x13003764]
03674 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0367e 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
03686 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
0368e 8b942494020000                 mov        edx, dword ptr [rsp + 0x294]
03695 488bc8                         mov        rcx, rax
03698 90                             nop        
03699 90                             nop        
0369a 90                             nop        
0369b 90                             nop        
0369c 90                             nop        
0369d 90                             nop        
0369e 90                             nop        
0369f e8bc4d5c07                     call       0x7f6a9772fc60
036a4 0f1f84009c370014               nop        dword ptr [rax + rax + 0x1400379c]
036ac 8bbc2494020000                 mov        edi, dword ptr [rsp + 0x294]
036b3 83c708                         add        edi, 8
036b6 8b9c2498020000                 mov        ebx, dword ptr [rsp + 0x298]
036bd 83c308                         add        ebx, 8
036c0 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
036c7 be02000000                     mov        esi, 2
036cc 7c05                           jl         0x7f6a9016aed3
036ce be00000000                     mov        esi, 0
036d3 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
036dd 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
036e0 03ce                           add        ecx, esi
036e2 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
036e5 85f6                           test       esi, esi
036e7 7505                           jne        0x7f6a9016aeee
036e9 b902000000                     mov        ecx, 2
036ee 81e1fe3f0000                   and        ecx, 0x3ffe
036f4 85c9                           test       ecx, ecx
036f6 0f8458200000                   je         0x7f6a9016cf54
036fc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03700 418502                         test       dword ptr [r10], eax
03703 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
0370a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
03714 bac0070000                     mov        edx, 0x7c0
03719 7c05                           jl         0x7f6a9016af20
0371b bad0070000                     mov        edx, 0x7d0
03720 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03724 488d4901                       lea        rcx, [rcx + 1]
03728 48890c16                       mov        qword ptr [rsi + rdx], rcx
0372c 0f8c9efaffff                   jl         0x7f6a9016a9d0
03732 448bac249c020000               mov        r13d, dword ptr [rsp + 0x29c]
0373a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
03744 ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
0374a e98f0a0000                     jmp        0x7f6a9016b9de
0374f 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
03759 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
03761 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
03769 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
03770 488bcb                         mov        rcx, rbx
03773 4d8bc3                         mov        r8, r11
03776 448b8c2410020000               mov        r9d, dword ptr [rsp + 0x210]
0377e 90                             nop        
0377f e8dc4c5c07                     call       0x7f6a9772fc60
03784 0f1f84007c380016               nop        dword ptr [rax + rax + 0x1600387c]
0378c 4c8be8                         mov        r13, rax
0378f e94a0a0000                     jmp        0x7f6a9016b9de
03794 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
0379b 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
037a3 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
037ab 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
037b5 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
037bd 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
037c7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037ca 83c202                         add        edx, 2
037cd 895678                         mov        dword ptr [rsi + 0x78], edx
037d0 81e2feff1f00                   and        edx, 0x1ffffe
037d6 85d2                           test       edx, edx
037d8 0f84971f0000                   je         0x7f6a9016cf75
037de 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
037e8 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
037f2 8b36                           mov        esi, dword ptr [rsi]
037f4 c1ee0d                         shr        esi, 0xd
037f7 48c1e60a                       shl        rsi, 0xa
037fb 41ba00000011                   mov        r10d, 0x11000000
03801 4903f2                         add        rsi, r10
03804 41ba17000000                   mov        r10d, 0x17
0380a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0380e 7436                           je         0x7f6a9016b046
03810 4983c202                       add        r10, 2
03814 4983fa1b                       cmp        r10, 0x1b
03818 75f0                           jne        0x7f6a9016b00a
0381a 41ba17000000                   mov        r10d, 0x17
03820 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03825 7412                           je         0x7f6a9016b039
03827 4983c202                       add        r10, 2
0382b 4983fa1b                       cmp        r10, 0x1b
0382f 75ef                           jne        0x7f6a9016b020
03831 41ba16000000                   mov        r10d, 0x16
03837 eb11                           jmp        0x7f6a9016b04a
03839 50                             push       rax
0383a 4833c0                         xor        rax, rax
0383d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03843 58                             pop        rax
03844 ebbe                           jmp        0x7f6a9016b004
03846 4983c201                       add        r10, 1
0384a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0384f 448b5804                       mov        r11d, dword ptr [rax + 4]
03853 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
0385d 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03865 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
0386f 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03872 83c202                         add        edx, 2
03875 895678                         mov        dword ptr [rsi + 0x78], edx
03878 81e2feff1f00                   and        edx, 0x1ffffe
0387e 85d2                           test       edx, edx
03880 0f84291f0000                   je         0x7f6a9016cfaf
03886 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
03890 4883861001000001               add        qword ptr [rsi + 0x110], 1
03898 498bf3                         mov        rsi, r11
0389b 83ee0f                         sub        esi, 0xf
0389e 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
038a8 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
038ab 83c102                         add        ecx, 2
038ae 894a78                         mov        dword ptr [rdx + 0x78], ecx
038b1 81e1feff1f00                   and        ecx, 0x1ffffe
038b7 85c9                           test       ecx, ecx
038b9 0f84111f0000                   je         0x7f6a9016cfd0
038bf 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
038c9 488382b000000001               add        qword ptr [rdx + 0xb0], 1
038d1 48ba0000000000000000           movabs     rdx, 0
038db ba00000000                     mov        edx, 0
038e0 3bda                           cmp        ebx, edx
038e2 0f8c091f0000                   jl         0x7f6a9016cff1
038e8 3bde                           cmp        ebx, esi
038ea 0f8d221f0000                   jge        0x7f6a9016d012
038f0 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
038fa 488bd6                         mov        rdx, rsi
038fd 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
03907 8b12                           mov        edx, dword ptr [rdx]
03909 c1ea0d                         shr        edx, 0xd
0390c 48c1e20a                       shl        rdx, 0xa
03910 41ba00000011                   mov        r10d, 0x11000000
03916 4903d2                         add        rdx, r10
03919 41ba25000000                   mov        r10d, 0x25
0391f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03923 7436                           je         0x7f6a9016b15b
03925 4983c202                       add        r10, 2
03929 4983fa29                       cmp        r10, 0x29
0392d 75f0                           jne        0x7f6a9016b11f
0392f 41ba25000000                   mov        r10d, 0x25
03935 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0393a 7412                           je         0x7f6a9016b14e
0393c 4983c202                       add        r10, 2
03940 4983fa29                       cmp        r10, 0x29
03944 75ef                           jne        0x7f6a9016b135
03946 41ba24000000                   mov        r10d, 0x24
0394c eb11                           jmp        0x7f6a9016b15f
0394e 50                             push       rax
0394f 4833c0                         xor        rax, rax
03952 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03958 58                             pop        rax
03959 ebbe                           jmp        0x7f6a9016b119
0395b 4983c201                       add        r10, 1
0395f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03964 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
0396e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03971 83c102                         add        ecx, 2
03974 894a78                         mov        dword ptr [rdx + 0x78], ecx
03977 81e1feff1f00                   and        ecx, 0x1ffffe
0397d 85c9                           test       ecx, ecx
0397f 0f84ae1e0000                   je         0x7f6a9016d033
03985 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
0398f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03997 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
039a1 8b5678                         mov        edx, dword ptr [rsi + 0x78]
039a4 83c202                         add        edx, 2
039a7 895678                         mov        dword ptr [rsi + 0x78], edx
039aa 81e2feff1f00                   and        edx, 0x1ffffe
039b0 85d2                           test       edx, edx
039b2 0f849c1e0000                   je         0x7f6a9016d054
039b8 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
039c2 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
039c8 44899c24a0020000               mov        dword ptr [rsp + 0x2a0], r11d
039d0 48beb8452ee300000000           movabs     rsi, 0xe32e45b8
039da 488bd6                         mov        rdx, rsi
039dd 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
039e7 4883816001000001               add        qword ptr [rcx + 0x160], 1
039ef 48baf8bf6d846a7f0000           movabs     rdx, 0x7f6a846dbff8
039f9 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
039fc 83c102                         add        ecx, 2
039ff 894a78                         mov        dword ptr [rdx + 0x78], ecx
03a02 81e1feff1f00                   and        ecx, 0x1ffffe
03a08 85c9                           test       ecx, ecx
03a0a 0f84651e0000                   je         0x7f6a9016d075
03a10 488bd6                         mov        rdx, rsi
03a13 48b9f8bf6d846a7f0000           movabs     rcx, 0x7f6a846dbff8
03a1d 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03a25 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
03a2f 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03a32 83c102                         add        ecx, 2
03a35 894a78                         mov        dword ptr [rdx + 0x78], ecx
03a38 81e1feff1f00                   and        ecx, 0x1ffffe
03a3e 85c9                           test       ecx, ecx
03a40 0f84501e0000                   je         0x7f6a9016d096
03a46 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
03a50 488382c000000001               add        qword ptr [rdx + 0xc0], 1
03a58 48bed8b46d846a7f0000           movabs     rsi, 0x7f6a846db4d8
03a62 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03a65 83c202                         add        edx, 2
03a68 895678                         mov        dword ptr [rsi + 0x78], edx
03a6b 81e2feff1f00                   and        edx, 0x1ffffe
03a71 85d2                           test       edx, edx
03a73 0f843e1e0000                   je         0x7f6a9016d0b7
03a79 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
03a83 488bd6                         mov        rdx, rsi
03a86 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
03a90 8b12                           mov        edx, dword ptr [rdx]
03a92 c1ea0d                         shr        edx, 0xd
03a95 48c1e20a                       shl        rdx, 0xa
03a99 41ba00000011                   mov        r10d, 0x11000000
03a9f 4903d2                         add        rdx, r10
03aa2 41ba1d000000                   mov        r10d, 0x1d
03aa8 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03aac 7436                           je         0x7f6a9016b2e4
03aae 4983c202                       add        r10, 2
03ab2 4983fa21                       cmp        r10, 0x21
03ab6 75f0                           jne        0x7f6a9016b2a8
03ab8 41ba1d000000                   mov        r10d, 0x1d
03abe 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03ac3 7412                           je         0x7f6a9016b2d7
03ac5 4983c202                       add        r10, 2
03ac9 4983fa21                       cmp        r10, 0x21
03acd 75ef                           jne        0x7f6a9016b2be
03acf 41ba1c000000                   mov        r10d, 0x1c
03ad5 eb11                           jmp        0x7f6a9016b2e8
03ad7 50                             push       rax
03ad8 4833c0                         xor        rax, rax
03adb f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03ae1 58                             pop        rax
03ae2 ebbe                           jmp        0x7f6a9016b2a2
03ae4 4983c201                       add        r10, 1
03ae8 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03aed 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
03af7 8b36                           mov        esi, dword ptr [rsi]
03af9 c1ee0d                         shr        esi, 0xd
03afc 48c1e60a                       shl        rsi, 0xa
03b00 41ba00000011                   mov        r10d, 0x11000000
03b06 4903f2                         add        rsi, r10
03b09 41ba23000000                   mov        r10d, 0x23
03b0f 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03b13 7436                           je         0x7f6a9016b34b
03b15 4983c202                       add        r10, 2
03b19 4983fa27                       cmp        r10, 0x27
03b1d 75f0                           jne        0x7f6a9016b30f
03b1f 41ba23000000                   mov        r10d, 0x23
03b25 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03b2a 7412                           je         0x7f6a9016b33e
03b2c 4983c202                       add        r10, 2
03b30 4983fa27                       cmp        r10, 0x27
03b34 75ef                           jne        0x7f6a9016b325
03b36 41ba22000000                   mov        r10d, 0x22
03b3c eb11                           jmp        0x7f6a9016b34f
03b3e 50                             push       rax
03b3f 4833c0                         xor        rax, rax
03b42 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03b48 58                             pop        rax
03b49 ebbe                           jmp        0x7f6a9016b309
03b4b 4983c201                       add        r10, 1
03b4f 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03b54 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
03b5e 4883864001000001               add        qword ptr [rsi + 0x140], 1
03b66 48bea0b56d846a7f0000           movabs     rsi, 0x7f6a846db5a0
03b70 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03b73 83c202                         add        edx, 2
03b76 895678                         mov        dword ptr [rsi + 0x78], edx
03b79 81e2feff1f00                   and        edx, 0x1ffffe
03b7f 85d2                           test       edx, edx
03b81 0f84511d0000                   je         0x7f6a9016d0d8
03b87 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
03b91 4883865001000001               add        qword ptr [rsi + 0x150], 1
03b99 4863db                         movsxd     rbx, ebx
03b9c be08000000                     mov        esi, 8
03ba1 4c8bcb                         mov        r9, rbx
03ba4 4c03ce                         add        r9, rsi
03ba7 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
03bb1 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03bb4 83c202                         add        edx, 2
03bb7 895678                         mov        dword ptr [rsi + 0x78], edx
03bba 81e2feff1f00                   and        edx, 0x1ffffe
03bc0 85d2                           test       edx, edx
03bc2 0f84311d0000                   je         0x7f6a9016d0f9
03bc8 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
03bd2 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03bda 48bea8a86d846a7f0000           movabs     rsi, 0x7f6a846da8a8
03be4 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03be7 83c202                         add        edx, 2
03bea 895678                         mov        dword ptr [rsi + 0x78], edx
03bed 81e2feff1f00                   and        edx, 0x1ffffe
03bf3 85d2                           test       edx, edx
03bf5 0f841f1d0000                   je         0x7f6a9016d11a
03bfb 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
03c05 4883867001000001               add        qword ptr [rsi + 0x170], 1
03c0d 48be889e2ee300000000           movabs     rsi, 0xe32e9e88
03c17 48be08c62de300000000           movabs     rsi, 0xe32dc608
03c21 ba02000000                     mov        edx, 2
03c26 b910000000                     mov        ecx, 0x10
03c2b 4c8bc0                         mov        r8, rax
03c2e bf00000000                     mov        edi, 0
03c33 48890424                       mov        qword ptr [rsp], rax
03c37 48895c2408                     mov        qword ptr [rsp + 8], rbx
03c3c 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
03c46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03c4b 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
03c55 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03c5a 4889842400020000               mov        qword ptr [rsp + 0x200], rax
03c62 90                             nop        
03c63 90                             nop        
03c64 90                             nop        
03c65 90                             nop        
03c66 90                             nop        
03c67 e8f4475c07                     call       0x7f6a9772fc60
03c6c 0f1f8400643d0017               nop        dword ptr [rax + rax + 0x17003d64]
03c74 4885c0                         test       rax, rax
03c77 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
03c81 750c                           jne        0x7f6a9016b48f
03c83 808b7901000001                 or         byte ptr [rbx + 0x179], 1
03c8a e988000000                     jmp        0x7f6a9016b517
03c8f 8b38                           mov        edi, dword ptr [rax]
03c91 c1ef0d                         shr        edi, 0xd
03c94 48c1e70a                       shl        rdi, 0xa
03c98 41ba00000011                   mov        r10d, 0x11000000
03c9e 4903fa                         add        rdi, r10
03ca1 41ba31000000                   mov        r10d, 0x31
03ca7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03cab 7436                           je         0x7f6a9016b4e3
03cad 4983c202                       add        r10, 2
03cb1 4983fa35                       cmp        r10, 0x35
03cb5 75f0                           jne        0x7f6a9016b4a7
03cb7 41ba31000000                   mov        r10d, 0x31
03cbd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03cc2 7412                           je         0x7f6a9016b4d6
03cc4 4983c202                       add        r10, 2
03cc8 4983fa35                       cmp        r10, 0x35
03ccc 75ef                           jne        0x7f6a9016b4bd
03cce 41ba30000000                   mov        r10d, 0x30
03cd4 eb11                           jmp        0x7f6a9016b4e7
03cd6 50                             push       rax
03cd7 4833c0                         xor        rax, rax
03cda f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03ce0 58                             pop        rax
03ce1 ebbe                           jmp        0x7f6a9016b4a1
03ce3 4983c201                       add        r10, 1
03ce7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03cec 48bf00b4141100000000           movabs     rdi, 0x1114b400
03cf6 8b18                           mov        ebx, dword ptr [rax]
03cf8 c1eb0d                         shr        ebx, 0xd
03cfb 48c1e30a                       shl        rbx, 0xa
03cff 41ba00000011                   mov        r10d, 0x11000000
03d05 4903da                         add        rbx, r10
03d08 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03d0c 0f85291c0000                   jne        0x7f6a9016d13b
03d12 e900000000                     jmp        0x7f6a9016b517
03d17 488bf8                         mov        rdi, rax
03d1a 4889bc24a8020000               mov        qword ptr [rsp + 0x2a8], rdi
03d22 483b07                         cmp        rax, qword ptr [rdi]
03d25 488bf7                         mov        rsi, rdi
03d28 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
03d32 8b36                           mov        esi, dword ptr [rsi]
03d34 c1ee0d                         shr        esi, 0xd
03d37 48c1e60a                       shl        rsi, 0xa
03d3b 41ba00000011                   mov        r10d, 0x11000000
03d41 4903f2                         add        rsi, r10
03d44 41babd000000                   mov        r10d, 0xbd
03d4a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03d4e 743c                           je         0x7f6a9016b58c
03d50 4983c202                       add        r10, 2
03d54 4981fac1000000                 cmp        r10, 0xc1
03d5b 75ed                           jne        0x7f6a9016b54a
03d5d 41babd000000                   mov        r10d, 0xbd
03d63 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03d68 7415                           je         0x7f6a9016b57f
03d6a 4983c202                       add        r10, 2
03d6e 4981fac1000000                 cmp        r10, 0xc1
03d75 75ec                           jne        0x7f6a9016b563
03d77 41babc000000                   mov        r10d, 0xbc
03d7d eb11                           jmp        0x7f6a9016b590
03d7f 50                             push       rax
03d80 4833c0                         xor        rax, rax
03d83 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03d89 58                             pop        rax
03d8a ebb8                           jmp        0x7f6a9016b544
03d8c 4983c201                       add        r10, 1
03d90 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03d95 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
03d9f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03da2 83c302                         add        ebx, 2
03da5 895e78                         mov        dword ptr [rsi + 0x78], ebx
03da8 81e3feff1f00                   and        ebx, 0x1ffffe
03dae 85db                           test       ebx, ebx
03db0 0f84bb1b0000                   je         0x7f6a9016d171
03db6 488bf7                         mov        rsi, rdi
03db9 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
03dc3 8b36                           mov        esi, dword ptr [rsi]
03dc5 c1ee0d                         shr        esi, 0xd
03dc8 48c1e60a                       shl        rsi, 0xa
03dcc 41ba00000011                   mov        r10d, 0x11000000
03dd2 4903f2                         add        rsi, r10
03dd5 41ba17000000                   mov        r10d, 0x17
03ddb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03ddf 7436                           je         0x7f6a9016b617
03de1 4983c202                       add        r10, 2
03de5 4983fa1b                       cmp        r10, 0x1b
03de9 75f0                           jne        0x7f6a9016b5db
03deb 41ba17000000                   mov        r10d, 0x17
03df1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03df6 7412                           je         0x7f6a9016b60a
03df8 4983c202                       add        r10, 2
03dfc 4983fa1b                       cmp        r10, 0x1b
03e00 75ef                           jne        0x7f6a9016b5f1
03e02 41ba16000000                   mov        r10d, 0x16
03e08 eb11                           jmp        0x7f6a9016b61b
03e0a 50                             push       rax
03e0b 4833c0                         xor        rax, rax
03e0e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03e14 58                             pop        rax
03e15 ebbe                           jmp        0x7f6a9016b5d5
03e17 4983c201                       add        r10, 1
03e1b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03e20 488bf7                         mov        rsi, rdi
03e23 90                             nop        
03e24 90                             nop        
03e25 48b820883b646a7f0000           movabs     rax, 0x7f6a643b8820
03e2f e82c415c07                     call       0x7f6a9772f760
03e34 0f1f84002c3f0018               nop        dword ptr [rax + rax + 0x18003f2c]
03e3c 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
03e46 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03e4e 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
03e58 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03e5b 83c702                         add        edi, 2
03e5e 897e78                         mov        dword ptr [rsi + 0x78], edi
03e61 81e7feff1f00                   and        edi, 0x1ffffe
03e67 85ff                           test       edi, edi
03e69 0f84231b0000                   je         0x7f6a9016d192
03e6f 448b9c24a0020000               mov        r11d, dword ptr [rsp + 0x2a0]
03e77 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03e7f 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
03e89 4883861001000001               add        qword ptr [rsi + 0x110], 1
03e91 ffc8                           dec        eax
03e93 442bd8                         sub        r11d, eax
03e96 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
03ea0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ea3 83c702                         add        edi, 2
03ea6 897e78                         mov        dword ptr [rsi + 0x78], edi
03ea9 81e7feff1f00                   and        edi, 0x1ffffe
03eaf 85ff                           test       edi, edi
03eb1 0f84fc1a0000                   je         0x7f6a9016d1b3
03eb7 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
03ec1 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03ec9 48be0000000000000000           movabs     rsi, 0
03ed3 be00000000                     mov        esi, 0
03ed8 443bee                         cmp        r13d, esi
03edb 0f8cf31a0000                   jl         0x7f6a9016d1d4
03ee1 453beb                         cmp        r13d, r11d
03ee4 0f8d0b1b0000                   jge        0x7f6a9016d1f5
03eea 498bfd                         mov        rdi, r13
03eed 89bc24a4020000                 mov        dword ptr [rsp + 0x2a4], edi
03ef4 488bbc24a8020000               mov        rdi, qword ptr [rsp + 0x2a8]
03efc 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
03f04 488bf7                         mov        rsi, rdi
03f07 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03f11 8b36                           mov        esi, dword ptr [rsi]
03f13 c1ee0d                         shr        esi, 0xd
03f16 48c1e60a                       shl        rsi, 0xa
03f1a 41ba00000011                   mov        r10d, 0x11000000
03f20 4903f2                         add        rsi, r10
03f23 41ba1f000000                   mov        r10d, 0x1f
03f29 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03f2d 7436                           je         0x7f6a9016b765
03f2f 4983c202                       add        r10, 2
03f33 4983fa23                       cmp        r10, 0x23
03f37 75f0                           jne        0x7f6a9016b729
03f39 41ba1f000000                   mov        r10d, 0x1f
03f3f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03f44 7412                           je         0x7f6a9016b758
03f46 4983c202                       add        r10, 2
03f4a 4983fa23                       cmp        r10, 0x23
03f4e 75ef                           jne        0x7f6a9016b73f
03f50 41ba1e000000                   mov        r10d, 0x1e
03f56 eb11                           jmp        0x7f6a9016b769
03f58 50                             push       rax
03f59 4833c0                         xor        rax, rax
03f5c f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03f62 58                             pop        rax
03f63 ebbe                           jmp        0x7f6a9016b723
03f65 4983c201                       add        r10, 1
03f69 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03f6e 488bf7                         mov        rsi, rdi
03f71 90                             nop        
03f72 90                             nop        
03f73 90                             nop        
03f74 90                             nop        
03f75 48b848883b646a7f0000           movabs     rax, 0x7f6a643b8848
03f7f e8dc3f5c07                     call       0x7f6a9772f760
03f84 0f1f84007c400019               nop        dword ptr [rax + rax + 0x1900407c]
03f8c 483b00                         cmp        rax, qword ptr [rax]
03f8f 488bf0                         mov        rsi, rax
03f92 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03f9c 8b36                           mov        esi, dword ptr [rsi]
03f9e c1ee0d                         shr        esi, 0xd
03fa1 48c1e60a                       shl        rsi, 0xa
03fa5 41ba00000011                   mov        r10d, 0x11000000
03fab 4903f2                         add        rsi, r10
03fae 41ba25000000                   mov        r10d, 0x25
03fb4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03fb8 7436                           je         0x7f6a9016b7f0
03fba 4983c202                       add        r10, 2
03fbe 4983fa29                       cmp        r10, 0x29
03fc2 75f0                           jne        0x7f6a9016b7b4
03fc4 41ba25000000                   mov        r10d, 0x25
03fca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03fcf 7412                           je         0x7f6a9016b7e3
03fd1 4983c202                       add        r10, 2
03fd5 4983fa29                       cmp        r10, 0x29
03fd9 75ef                           jne        0x7f6a9016b7ca
03fdb 41ba24000000                   mov        r10d, 0x24
03fe1 eb11                           jmp        0x7f6a9016b7f4
03fe3 50                             push       rax
03fe4 4833c0                         xor        rax, rax
03fe7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03fed 58                             pop        rax
03fee ebbe                           jmp        0x7f6a9016b7ae
03ff0 4983c201                       add        r10, 1
03ff4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03ff9 8b7024                         mov        esi, dword ptr [rax + 0x24]
03ffc 4c3b2595457e20                 cmp        r12, qword ptr [rip + 0x207e4595]
04003 0f8414000000                   je         0x7f6a9016b81d
04009 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
04013 4883e4f0                       and        rsp, 0xfffffffffffffff0
04017 e8442dbb1f                     call       0x7f6aafd1e560
0401c f4                             hlt        
0401d 488bd0                         mov        rdx, rax
04020 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
0402a 8b12                           mov        edx, dword ptr [rdx]
0402c c1ea0d                         shr        edx, 0xd
0402f 48c1e20a                       shl        rdx, 0xa
04033 41ba00000011                   mov        r10d, 0x11000000
04039 4903d2                         add        rdx, r10
0403c 41ba2b000000                   mov        r10d, 0x2b
04042 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
04046 7436                           je         0x7f6a9016b87e
04048 4983c202                       add        r10, 2
0404c 4983fa2f                       cmp        r10, 0x2f
04050 75f0                           jne        0x7f6a9016b842
04052 41ba2b000000                   mov        r10d, 0x2b
04058 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0405d 7412                           je         0x7f6a9016b871
0405f 4983c202                       add        r10, 2
04063 4983fa2f                       cmp        r10, 0x2f
04067 75ef                           jne        0x7f6a9016b858
04069 41ba2a000000                   mov        r10d, 0x2a
0406f eb11                           jmp        0x7f6a9016b882
04071 50                             push       rax
04072 4833c0                         xor        rax, rax
04075 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0407b 58                             pop        rax
0407c ebbe                           jmp        0x7f6a9016b83c
0407e 4983c201                       add        r10, 1
04082 4a8304d101                     add        qword ptr [rcx + r10*8], 1
04087 8b4804                         mov        ecx, dword ptr [rax + 4]
0408a 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
04094 4883828001000001               add        qword ptr [rdx + 0x180], 1
0409c 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
040a6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
040aa 4183c002                       add        r8d, 2
040ae 44894278                       mov        dword ptr [rdx + 0x78], r8d
040b2 4181e0feff1f00                 and        r8d, 0x1ffffe
040b9 4585c0                         test       r8d, r8d
040bc 0f846d190000                   je         0x7f6a9016d22f
040c2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
040cc 4883829001000001               add        qword ptr [rdx + 0x190], 1
040d4 8bbc24a4020000                 mov        edi, dword ptr [rsp + 0x2a4]
040db 4863df                         movsxd     rbx, edi
040de ba08000000                     mov        edx, 8
040e3 4c8bcb                         mov        r9, rbx
040e6 4c03ca                         add        r9, rdx
040e9 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
040f3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
040f7 4183c002                       add        r8d, 2
040fb 44894278                       mov        dword ptr [rdx + 0x78], r8d
040ff 4181e0feff1f00                 and        r8d, 0x1ffffe
04106 4585c0                         test       r8d, r8d
04109 0f8441190000                   je         0x7f6a9016d250
0410f 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
04119 488382e000000001               add        qword ptr [rdx + 0xe0], 1
04121 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
0412b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0412f 4183c002                       add        r8d, 2
04133 44894278                       mov        dword ptr [rdx + 0x78], r8d
04137 4181e0feff1f00                 and        r8d, 0x1ffffe
0413e 4585c0                         test       r8d, r8d
04141 0f842a190000                   je         0x7f6a9016d271
04147 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
04151 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
04159 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
04163 ba02000000                     mov        edx, 2
04168 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
04170 bf00000000                     mov        edi, 0
04175 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
0417d 48890424                       mov        qword ptr [rsp], rax
04181 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
04189 4889442408                     mov        qword ptr [rsp + 8], rax
0418e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
04193 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
0419d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
041a2 4889842400020000               mov        qword ptr [rsp + 0x200], rax
041aa 90                             nop        
041ab 90                             nop        
041ac 90                             nop        
041ad 90                             nop        
041ae 90                             nop        
041af e8ac425c07                     call       0x7f6a9772fc60
041b4 0f1f8400ac42001a               nop        dword ptr [rax + rax + 0x1a0042ac]
041bc 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
041c4 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
041cb 4403ee                         add        r13d, esi
041ce 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
041d8 ff8610060000                   inc        dword ptr [rsi + 0x610]
041de 8bbc2468020000                 mov        edi, dword ptr [rsp + 0x268]
041e5 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
041ef ff8608080000                   inc        dword ptr [rsi + 0x808]
041f5 488bdf                         mov        rbx, rdi
041f8 498bc5                         mov        rax, r13
041fb 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04202 ffc2                           inc        edx
04204 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0420e 8b4e7c                         mov        ecx, dword ptr [rsi + 0x7c]
04211 83c102                         add        ecx, 2
04214 894e7c                         mov        dword ptr [rsi + 0x7c], ecx
04217 81e1fe3f0000                   and        ecx, 0x3ffe
0421d 85c9                           test       ecx, ecx
0421f 0f846d180000                   je         0x7f6a9016d292
04225 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
04229 418502                         test       dword ptr [r10], eax
0422c 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
04236 ff8630080000                   inc        dword ptr [rsi + 0x830]
0423c 4c8bd8                         mov        r11, rax
0423f 4c8bc3                         mov        r8, rbx
04242 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
0424a e9f1c0ffff                     jmp        0x7f6a90167b40
0424f 4585db                         test       r11d, r11d
04252 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0425c b988030000                     mov        ecx, 0x388
04261 7e05                           jle        0x7f6a9016ba68
04263 b998030000                     mov        ecx, 0x398
04268 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0426c 4d8d4001                       lea        r8, [r8 + 1]
04270 4c89040a                       mov        qword ptr [rdx + rcx], r8
04274 0f8e5f010000                   jle        0x7f6a9016bbd9
0427a 488bbc2430020000               mov        rdi, qword ptr [rsp + 0x230]
04282 482bf7                         sub        rsi, rdi
04285 ba00000000                     mov        edx, 0
0428a 483bf2                         cmp        rsi, rdx
0428d 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
04297 baa8030000                     mov        edx, 0x3a8
0429c 7d05                           jge        0x7f6a9016baa3
0429e bab8030000                     mov        edx, 0x3b8
042a3 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
042a7 488d4901                       lea        rcx, [rcx + 1]
042ab 48890c16                       mov        qword ptr [rsi + rdx], rcx
042af 0f8d24010000                   jge        0x7f6a9016bbd9
042b5 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
042bd 488b7230                       mov        rsi, qword ptr [rdx + 0x30]
042c1 ba00000000                     mov        edx, 0
042c6 483bf2                         cmp        rsi, rdx
042c9 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
042d3 bac8030000                     mov        edx, 0x3c8
042d8 7505                           jne        0x7f6a9016badf
042da bad8030000                     mov        edx, 0x3d8
042df 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
042e3 488d4901                       lea        rcx, [rcx + 1]
042e7 48890c16                       mov        qword ptr [rsi + rdx], rcx
042eb 0f85e8000000                   jne        0x7f6a9016bbd9
042f1 e9ed000000                     jmp        0x7f6a9016bbe3
042f6 498bd8                         mov        rbx, r8
042f9 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
04301 488bf0                         mov        rsi, rax
04304 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0430c 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
04314 4c8bee                         mov        r13, rsi
04317 442beb                         sub        r13d, ebx
0431a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
04324 4883864808000001               add        qword ptr [rsi + 0x848], 1
0432c 488bf2                         mov        rsi, rdx
0432f 488bd3                         mov        rdx, rbx
04332 488bc8                         mov        rcx, rax
04335 4d8bc3                         mov        r8, r11
04338 4d8bcd                         mov        r9, r13
0433b 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
04343 4489ac24b0020000               mov        dword ptr [rsp + 0x2b0], r13d
0434b 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
04350 4c89442408                     mov        qword ptr [rsp + 8], r8
04355 48890c24                       mov        qword ptr [rsp], rcx
04359 4889542418                     mov        qword ptr [rsp + 0x18], rdx
0435e 4889742420                     mov        qword ptr [rsp + 0x20], rsi
04363 488bfe                         mov        rdi, rsi
04366 488bf2                         mov        rsi, rdx
04369 488bd1                         mov        rdx, rcx
0436c 498bc8                         mov        rcx, r8
0436f 4d8bc1                         mov        r8, r9
04372 e809235b07                     call       0x7f6a9771de80
04377 85c0                           test       eax, eax
04379 0f842b000000                   je         0x7f6a9016bbaa
0437f 488bf8                         mov        rdi, rax
04382 83f7ff                         xor        edi, 0xffffffff
04385 488b0c24                       mov        rcx, qword ptr [rsp]
04389 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0438e 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
04393 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
04398 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
0439d 442bcf                         sub        r9d, edi
043a0 03d7                           add        edx, edi
043a2 4403c7                         add        r8d, edi
043a5 e922170000                     jmp        0x7f6a9016d2cc
043aa 448bac24b0020000               mov        r13d, dword ptr [rsp + 0x2b0]
043b2 4403ac2408020000               add        r13d, dword ptr [rsp + 0x208]
043ba 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
043c2 44896a38                       mov        dword ptr [rdx + 0x38], r13d
043c6 4881c4e0020000                 add        rsp, 0x2e0
043cd 5d                             pop        rbp
043ce 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
043d2 0f871a170000                   ja         0x7f6a9016d2f2
043d8 c3                             ret        
043d9 bb02000000                     mov        ebx, 2
043de e915000000                     jmp        0x7f6a9016bbf8
043e3 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
043ed ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
043f3 bb08000000                     mov        ebx, 8
043f8 899c24b4020000                 mov        dword ptr [rsp + 0x2b4], ebx
043ff 90                             nop        
04400 e912170000                     jmp        0x7f6a9016d317
04405 90                             nop        
04406 90                             nop        
04407 90                             nop        
04408 90                             nop        
04409 90                             nop        
0440a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04411 0f8523170000                   jne        0x7f6a9016d33a
04417 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0441e 488d7820                       lea        rdi, [rax + 0x20]
04422 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04429 0f870b170000                   ja         0x7f6a9016d33a
0442f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04436 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0443d 488908                         mov        qword ptr [rax], rcx
04440 4833c9                         xor        rcx, rcx
04443 48894808                       mov        qword ptr [rax + 8], rcx
04447 48894810                       mov        qword ptr [rax + 0x10], rcx
0444b 48894818                       mov        qword ptr [rax + 0x18], rcx
0444f 90                             nop        
04450 e901170000                     jmp        0x7f6a9016d356
04455 90                             nop        
04456 90                             nop        
04457 90                             nop        
04458 90                             nop        
04459 90                             nop        
0445a 498bf3                         mov        rsi, r11
0445d 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
04465 90                             nop        
04466 90                             nop        
04467 e8f43f5c07                     call       0x7f6a9772fc60
0446c 0f1f84006445001c               nop        dword ptr [rax + rax + 0x1c004564]
04474 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0447e 488d9210040000                 lea        rdx, [rdx + 0x410]
04485 4885c0                         test       rax, rax
04488 750e                           jne        0x7f6a9016bc98
0448a f60201                         test       byte ptr [rdx], 1
0448d 0f8505000000                   jne        0x7f6a9016bc98
04493 f048830a01                     lock or    qword ptr [rdx], 1
04498 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
044a0 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
044aa 4883812004000001               add        qword ptr [rcx + 0x420], 1
044b2 8b9424b4020000                 mov        edx, dword ptr [rsp + 0x2b4]
044b9 488bc8                         mov        rcx, rax
044bc 488bb424b8020000               mov        rsi, qword ptr [rsp + 0x2b8]
044c4 90                             nop        
044c5 90                             nop        
044c6 90                             nop        
044c7 e894355c07                     call       0x7f6a9772f260
044cc 0f1f8400c445001d               nop        dword ptr [rax + rax + 0x1d0045c4]
044d4 488b8424b8020000               mov        rax, qword ptr [rsp + 0x2b8]
044dc e91a170000                     jmp        0x7f6a9016d3fb
044e1 90                             nop        
044e2 90                             nop        
044e3 90                             nop        
044e4 90                             nop        
044e5 90                             nop        
044e6 90                             nop        
044e7 90                             nop        
044e8 e982160000                     jmp        0x7f6a9016d36f
044ed 90                             nop        
044ee 90                             nop        
044ef 90                             nop        
044f0 90                             nop        
044f1 90                             nop        
044f2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
044f9 0f8593160000                   jne        0x7f6a9016d392
044ff 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
04506 488d7820                       lea        rdi, [rax + 0x20]
0450a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04511 0f877b160000                   ja         0x7f6a9016d392
04517 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
0451e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04525 488908                         mov        qword ptr [rax], rcx
04528 4833c9                         xor        rcx, rcx
0452b 48894808                       mov        qword ptr [rax + 8], rcx
0452f 48894810                       mov        qword ptr [rax + 0x10], rcx
04533 48894818                       mov        qword ptr [rax + 0x18], rcx
04537 488bd0                         mov        rdx, rax
0453a 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
04544 4883815802000001               add        qword ptr [rcx + 0x258], 1
0454c ba02000000                     mov        edx, 2
04551 48b9006226e200000000           movabs     rcx, 0xe2266200
0455b 488bf0                         mov        rsi, rax
0455e 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
04566 90                             nop        
04567 e8f4345c07                     call       0x7f6a9772f260
0456c 0f1f84006446001e               nop        dword ptr [rax + rax + 0x1e004664]
04574 488b8424c0020000               mov        rax, qword ptr [rsp + 0x2c0]
0457c e97a160000                     jmp        0x7f6a9016d3fb
04581 90                             nop        
04582 90                             nop        
04583 90                             nop        
04584 90                             nop        
04585 90                             nop        
04586 90                             nop        
04587 90                             nop        
04588 e921160000                     jmp        0x7f6a9016d3ae
0458d 90                             nop        
0458e 90                             nop        
0458f 90                             nop        
04590 90                             nop        
04591 90                             nop        
04592 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04599 0f8532160000                   jne        0x7f6a9016d3d1
0459f 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
045a6 488d7820                       lea        rdi, [rax + 0x20]
045aa 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
045b1 0f871a160000                   ja         0x7f6a9016d3d1
045b7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
045be 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
045c5 488908                         mov        qword ptr [rax], rcx
045c8 4833c9                         xor        rcx, rcx
045cb 48894808                       mov        qword ptr [rax + 8], rcx
045cf 48894810                       mov        qword ptr [rax + 0x10], rcx
045d3 48894818                       mov        qword ptr [rax + 0x18], rcx
045d7 488bd0                         mov        rdx, rax
045da 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
045e4 4883814001000001               add        qword ptr [rcx + 0x140], 1
045ec ba05000000                     mov        edx, 5
045f1 48b9306226e200000000           movabs     rcx, 0xe2266230
045fb 488bf0                         mov        rsi, rax
045fe 48898424c8020000               mov        qword ptr [rsp + 0x2c8], rax
04606 90                             nop        
04607 e854345c07                     call       0x7f6a9772f260
0460c 0f1f84000447001f               nop        dword ptr [rax + rax + 0x1f004704]
04614 488b8424c8020000               mov        rax, qword ptr [rsp + 0x2c8]
0461c e9da150000                     jmp        0x7f6a9016d3fb
04621 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
04628 55                             push       rbp
04629 4881ece0020000                 sub        rsp, 0x2e0
04630 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
04638 7405                           je         0x7f6a9016be3f
0463a e8a1335b07                     call       0x7f6a9771f1e0
0463f bf40010000                     mov        edi, 0x140
04644 4863ff                         movsxd     rdi, edi
04647 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0464b 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
04653 bf38010000                     mov        edi, 0x138
04658 4863ff                         movsxd     rdi, edi
0465b 488b043e                       mov        rax, qword ptr [rsi + rdi]
0465f 4889842488010000               mov        qword ptr [rsp + 0x188], rax
04667 bf30010000                     mov        edi, 0x130
0466c 4863ff                         movsxd     rdi, edi
0466f 8b143e                         mov        edx, dword ptr [rsi + rdi]
04672 bf28010000                     mov        edi, 0x128
04677 4863ff                         movsxd     rdi, edi
0467a 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
0467e bf20010000                     mov        edi, 0x120
04683 4863ff                         movsxd     rdi, edi
04686 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
0468a bf18010000                     mov        edi, 0x118
0468f 4863ff                         movsxd     rdi, edi
04692 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
04696 bf08010000                     mov        edi, 0x108
0469b 4863ff                         movsxd     rdi, edi
0469e 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
046a2 bf00010000                     mov        edi, 0x100
046a7 4863ff                         movsxd     rdi, edi
046aa 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
046ae bff8000000                     mov        edi, 0xf8
046b3 4863ff                         movsxd     rdi, edi
046b6 448b343e                       mov        r14d, dword ptr [rsi + rdi]
046ba bff0000000                     mov        edi, 0xf0
046bf 4863ff                         movsxd     rdi, edi
046c2 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
046c5 bbe8000000                     mov        ebx, 0xe8
046ca 4863db                         movsxd     rbx, ebx
046cd 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046d0 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
046d7 bbd8000000                     mov        ebx, 0xd8
046dc 4863db                         movsxd     rbx, ebx
046df 488b041e                       mov        rax, qword ptr [rsi + rbx]
046e3 4889842498010000               mov        qword ptr [rsp + 0x198], rax
046eb bba0000000                     mov        ebx, 0xa0
046f0 4863db                         movsxd     rbx, ebx
046f3 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046f6 899c2490010000                 mov        dword ptr [rsp + 0x190], ebx
046fd bb90000000                     mov        ebx, 0x90
04702 4863db                         movsxd     rbx, ebx
04705 488b041e                       mov        rax, qword ptr [rsi + rbx]
04709 48898424a0010000               mov        qword ptr [rsp + 0x1a0], rax
04711 bb80000000                     mov        ebx, 0x80
04716 4863db                         movsxd     rbx, ebx
04719 488b041e                       mov        rax, qword ptr [rsi + rbx]
0471d bb78000000                     mov        ebx, 0x78
04722 4863db                         movsxd     rbx, ebx
04725 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04728 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
0472f bb70000000                     mov        ebx, 0x70
04734 4863db                         movsxd     rbx, ebx
04737 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0473a 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
04741 bb68000000                     mov        ebx, 0x68
04746 4863db                         movsxd     rbx, ebx
04749 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0474c 89bc24ac010000                 mov        dword ptr [rsp + 0x1ac], edi
04753 488bfe                         mov        rdi, rsi
04756 899424d4010000                 mov        dword ptr [rsp + 0x1d4], edx
0475d 48898c24e0010000               mov        qword ptr [rsp + 0x1e0], rcx
04765 4c898424d8010000               mov        qword ptr [rsp + 0x1d8], r8
0476d 44898c24d0010000               mov        dword ptr [rsp + 0x1d0], r9d
04775 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
0477d 4c89ac24c0010000               mov        qword ptr [rsp + 0x1c0], r13
04785 4489b424b4010000               mov        dword ptr [rsp + 0x1b4], r14d
0478d 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
04795 899c24b0010000                 mov        dword ptr [rsp + 0x1b0], ebx
0479c e80f24fa1f                     call       0x7f6ab010e3b0
047a1 0f1f840000000000               nop        dword ptr [rax + rax]
047a9 8b9c24b0010000                 mov        ebx, dword ptr [rsp + 0x1b0]
047b0 488bd3                         mov        rdx, rbx
047b3 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
047ba 4c8bcb                         mov        r9, rbx
047bd 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
047c4 488bf3                         mov        rsi, rbx
047c7 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
047cf 488bc8                         mov        rcx, rax
047d2 488b8424a0010000               mov        rax, qword ptr [rsp + 0x1a0]
047da 4c8bc0                         mov        r8, rax
047dd 8b9c2490010000                 mov        ebx, dword ptr [rsp + 0x190]
047e4 488bfb                         mov        rdi, rbx
047e7 488b842498010000               mov        rax, qword ptr [rsp + 0x198]
047ef 4c8bf0                         mov        r14, rax
047f2 8b9c247c010000                 mov        ebx, dword ptr [rsp + 0x17c]
047f9 4c8beb                         mov        r13, rbx
047fc 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
04803 8b8424b4010000                 mov        eax, dword ptr [rsp + 0x1b4]
0480a 4c8bd8                         mov        r11, rax
0480d 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
04815 899c24e8010000                 mov        dword ptr [rsp + 0x1e8], ebx
0481c 488b9c24c8010000               mov        rbx, qword ptr [rsp + 0x1c8]
04824 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
0482c 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
04833 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
0483a 488b9c24d8010000               mov        rbx, qword ptr [rsp + 0x1d8]
04842 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
0484a 488b9c24e0010000               mov        rbx, qword ptr [rsp + 0x1e0]
04852 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
0485a 8b9c24d4010000                 mov        ebx, dword ptr [rsp + 0x1d4]
04861 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
04868 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
04870 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
04878 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
04880 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
04888 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
04890 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
04897 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
0489f 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
048a7 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
048ae 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
048b6 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
048be 448b8424e8010000               mov        r8d, dword ptr [rsp + 0x1e8]
048c6 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
048ce 4889842400020000               mov        qword ptr [rsp + 0x200], rax
048d6 e965baffff                     jmp        0x7f6a90167b40
048db 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
048e5 4c89542408                     mov        qword ptr [rsp + 8], r10
048ea 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048f2 e869295607                     call       0x7f6a976cea60
048f7 e981b7ffff                     jmp        0x7f6a9016787d
048fc 49baa8ee1a846a7f0000           movabs     r10, 0x7f6a841aeea8
04906 4c89542408                     mov        qword ptr [rsp + 8], r10
0490b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04913 e848295607                     call       0x7f6a976cea60
04918 e9eeb8ffff                     jmp        0x7f6a90167a0b
0491d e8be945607                     call       0x7f6a976d55e0
04922 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0492c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04930 e82b24bb1f                     call       0x7f6aafd1e560
04935 f4                             hlt        
04936 e8a5945607                     call       0x7f6a976d55e0
0493b 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04945 4883e4f0                       and        rsp, 0xfffffffffffffff0
04949 e81224bb1f                     call       0x7f6aafd1e560
0494e f4                             hlt        
0494f e88c945607                     call       0x7f6a976d55e0
04954 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0495e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04962 e8f923bb1f                     call       0x7f6aafd1e560
04967 f4                             hlt        
04968 48891424                       mov        qword ptr [rsp], rdx
0496c 4889742408                     mov        qword ptr [rsp + 8], rsi
04971 e86a9d5607                     call       0x7f6a976d5ee0
04976 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04980 4883e4f0                       and        rsp, 0xfffffffffffffff0
04984 e8d723bb1f                     call       0x7f6aafd1e560
04989 f4                             hlt        
0498a e851945607                     call       0x7f6a976d55e0
0498f 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04999 4883e4f0                       and        rsp, 0xfffffffffffffff0
0499d e8be23bb1f                     call       0x7f6aafd1e560
049a2 f4                             hlt        
049a3 e838945607                     call       0x7f6a976d55e0
049a8 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
049b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
049b6 e8a523bb1f                     call       0x7f6aafd1e560
049bb f4                             hlt        
049bc 48891424                       mov        qword ptr [rsp], rdx
049c0 48897c2408                     mov        qword ptr [rsp + 8], rdi
049c5 e8169d5607                     call       0x7f6a976d5ee0
049ca 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
049d4 4883e4f0                       and        rsp, 0xfffffffffffffff0
049d8 e88323bb1f                     call       0x7f6aafd1e560
049dd f4                             hlt        
049de e8fd935607                     call       0x7f6a976d55e0
049e3 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
049ed 4883e4f0                       and        rsp, 0xfffffffffffffff0
049f1 e86a23bb1f                     call       0x7f6aafd1e560
049f6 f4                             hlt        
049f7 e8e4935607                     call       0x7f6a976d55e0
049fc 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a0a e85123bb1f                     call       0x7f6aafd1e560
04a0f f4                             hlt        
04a10 48c7042401000000               mov        qword ptr [rsp], 1
04a18 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a1d e8be9c5607                     call       0x7f6a976d5ee0
04a22 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a2c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a30 e82b23bb1f                     call       0x7f6aafd1e560
04a35 f4                             hlt        
04a36 48c7042402000000               mov        qword ptr [rsp], 2
04a3e 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a43 e8989c5607                     call       0x7f6a976d5ee0
04a48 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a52 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a56 e80523bb1f                     call       0x7f6aafd1e560
04a5b f4                             hlt        
04a5c 48c7042400000000               mov        qword ptr [rsp], 0
04a64 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a69 e8729c5607                     call       0x7f6a976d5ee0
04a6e 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a78 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a7c e8df22bb1f                     call       0x7f6aafd1e560
04a81 f4                             hlt        
04a82 48c7042401000000               mov        qword ptr [rsp], 1
04a8a 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a8f e84c9c5607                     call       0x7f6a976d5ee0
04a94 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04aa2 e8b922bb1f                     call       0x7f6aafd1e560
04aa7 f4                             hlt        
04aa8 48c7042400000000               mov        qword ptr [rsp], 0
04ab0 4c894c2408                     mov        qword ptr [rsp + 8], r9
04ab5 e8269c5607                     call       0x7f6a976d5ee0
04aba 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04ac4 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ac8 e89322bb1f                     call       0x7f6aafd1e560
04acd f4                             hlt        
04ace 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
04ad8 4c89542408                     mov        qword ptr [rsp + 8], r10
04add 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ae5 e876275607                     call       0x7f6a976cea60
04aea e9d9bdffff                     jmp        0x7f6a901680c8
04aef e8ec925607                     call       0x7f6a976d55e0
04af4 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04afe 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b02 e85922bb1f                     call       0x7f6aafd1e560
04b07 f4                             hlt        
04b08 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04b12 4c89542408                     mov        qword ptr [rsp + 8], r10
04b17 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b1f e83c275607                     call       0x7f6a976cea60
04b24 e94bbeffff                     jmp        0x7f6a90168174
04b29 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04b33 4c89542408                     mov        qword ptr [rsp + 8], r10
04b38 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b40 e81b275607                     call       0x7f6a976cea60
04b45 e96dbeffff                     jmp        0x7f6a901681b7
04b4a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b52 e8094a5607                     call       0x7f6a976d0d60
04b57 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04b61 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b65 e8f621bb1f                     call       0x7f6aafd1e560
04b6a f4                             hlt        
04b6b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b73 e8e8495607                     call       0x7f6a976d0d60
04b78 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b86 e8d521bb1f                     call       0x7f6aafd1e560
04b8b f4                             hlt        
04b8c 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
04b96 4c89542408                     mov        qword ptr [rsp + 8], r10
04b9b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ba3 e8b8265607                     call       0x7f6a976cea60
04ba8 e9e4beffff                     jmp        0x7f6a90168291
04bad 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
04bb7 4c89542408                     mov        qword ptr [rsp + 8], r10
04bbc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc4 e897265607                     call       0x7f6a976cea60
04bc9 e9fbbeffff                     jmp        0x7f6a901682c9
04bce 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
04bd8 4c89542408                     mov        qword ptr [rsp + 8], r10
04bdd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04be5 e876265607                     call       0x7f6a976cea60
04bea e94abfffff                     jmp        0x7f6a90168339
04bef 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
04bf9 4c89542408                     mov        qword ptr [rsp + 8], r10
04bfe 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c06 e855265607                     call       0x7f6a976cea60
04c0b e961bfffff                     jmp        0x7f6a90168371
04c10 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
04c1a 4c89542408                     mov        qword ptr [rsp + 8], r10
04c1f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c27 e834265607                     call       0x7f6a976cea60
04c2c e978bfffff                     jmp        0x7f6a901683a9
04c31 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04c3b 4c89542408                     mov        qword ptr [rsp + 8], r10
04c40 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c48 e813265607                     call       0x7f6a976cea60
04c4d e96ec0ffff                     jmp        0x7f6a901684c0
04c52 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
04c5c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c61 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c69 e8f2255607                     call       0x7f6a976cea60
04c6e e993c0ffff                     jmp        0x7f6a90168506
04c73 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04c7d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c82 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c8a e8d1255607                     call       0x7f6a976cea60
04c8f e9aac0ffff                     jmp        0x7f6a9016853e
04c94 48890424                       mov        qword ptr [rsp], rax
04c98 e8c3635607                     call       0x7f6a976d2860
04c9d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04ca7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cab e8b020bb1f                     call       0x7f6aafd1e560
04cb0 f4                             hlt        
04cb1 e82a915607                     call       0x7f6a976d55e0
04cb6 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04cc0 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cc4 e89720bb1f                     call       0x7f6aafd1e560
04cc9 f4                             hlt        
04cca 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
04cd4 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce1 e87a255607                     call       0x7f6a976cea60
04ce6 e913c2ffff                     jmp        0x7f6a901686fe
04ceb e8f0905607                     call       0x7f6a976d55e0
04cf0 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04cfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cfe e85d20bb1f                     call       0x7f6aafd1e560
04d03 f4                             hlt        
04d04 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04d0e 4c89542408                     mov        qword ptr [rsp + 8], r10
04d13 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d1b e840255607                     call       0x7f6a976cea60
04d20 e99dc2ffff                     jmp        0x7f6a901687c2
04d25 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04d2f 4c89542408                     mov        qword ptr [rsp + 8], r10
04d34 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3c e81f255607                     call       0x7f6a976cea60
04d41 e9bac2ffff                     jmp        0x7f6a90168800
04d46 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d4e e80d485607                     call       0x7f6a976d0d60
04d53 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04d5d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d61 e8fa1fbb1f                     call       0x7f6aafd1e560
04d66 f4                             hlt        
04d67 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d6f e8ec475607                     call       0x7f6a976d0d60
04d74 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04d7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d82 e8d91fbb1f                     call       0x7f6aafd1e560
04d87 f4                             hlt        
04d88 e853905607                     call       0x7f6a976d55e0
04d8d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04d97 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d9b e8c01fbb1f                     call       0x7f6aafd1e560
04da0 f4                             hlt        
04da1 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04dab 4c89542408                     mov        qword ptr [rsp + 8], r10
04db0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db8 e8a3245607                     call       0x7f6a976cea60
04dbd e950c4ffff                     jmp        0x7f6a90168a12
04dc2 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
04dcc 4c89542408                     mov        qword ptr [rsp + 8], r10
04dd1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dd9 e882245607                     call       0x7f6a976cea60
04dde e97cc4ffff                     jmp        0x7f6a90168a5f
04de3 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04ded 4c89542408                     mov        qword ptr [rsp + 8], r10
04df2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dfa e861245607                     call       0x7f6a976cea60
04dff e993c4ffff                     jmp        0x7f6a90168a97
04e04 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
04e0e 4c89542408                     mov        qword ptr [rsp + 8], r10
04e13 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e1b e840245607                     call       0x7f6a976cea60
04e20 e993c5ffff                     jmp        0x7f6a90168bb8
04e25 e8b68f5607                     call       0x7f6a976d55e0
04e2a 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04e34 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e38 e8231fbb1f                     call       0x7f6aafd1e560
04e3d f4                             hlt        
04e3e 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04e48 4c89542408                     mov        qword ptr [rsp + 8], r10
04e4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e55 e806245607                     call       0x7f6a976cea60
04e5a e905c6ffff                     jmp        0x7f6a90168c64
04e5f 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04e69 4c89542408                     mov        qword ptr [rsp + 8], r10
04e6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e76 e8e5235607                     call       0x7f6a976cea60
04e7b e91fc6ffff                     jmp        0x7f6a90168c9f
04e80 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e88 e8d3465607                     call       0x7f6a976d0d60
04e8d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04e97 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e9b e8c01ebb1f                     call       0x7f6aafd1e560
04ea0 f4                             hlt        
04ea1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ea9 e8b2465607                     call       0x7f6a976d0d60
04eae 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04eb8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ebc e89f1ebb1f                     call       0x7f6aafd1e560
04ec1 f4                             hlt        
04ec2 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
04ecc 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ed9 e882235607                     call       0x7f6a976cea60
04ede e98bc6ffff                     jmp        0x7f6a90168d6e
04ee3 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
04eed 4c89542408                     mov        qword ptr [rsp + 8], r10
04ef2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04efa e861235607                     call       0x7f6a976cea60
04eff e9a2c6ffff                     jmp        0x7f6a90168da6
04f04 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
04f0e 4c89542408                     mov        qword ptr [rsp + 8], r10
04f13 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f1b e840235607                     call       0x7f6a976cea60
04f20 e9dbc6ffff                     jmp        0x7f6a90168e00
04f25 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
04f2f 4c89542408                     mov        qword ptr [rsp + 8], r10
04f34 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f3c e81f235607                     call       0x7f6a976cea60
04f41 e9f2c6ffff                     jmp        0x7f6a90168e38
04f46 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
04f50 4c89542408                     mov        qword ptr [rsp + 8], r10
04f55 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f5d e8fe225607                     call       0x7f6a976cea60
04f62 e909c7ffff                     jmp        0x7f6a90168e70
04f67 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04f71 4c89542408                     mov        qword ptr [rsp + 8], r10
04f76 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f7e e8dd225607                     call       0x7f6a976cea60
04f83 e9ffc7ffff                     jmp        0x7f6a90168f87
04f88 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
04f92 4c89542408                     mov        qword ptr [rsp + 8], r10
04f97 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f9f e8bc225607                     call       0x7f6a976cea60
04fa4 e924c8ffff                     jmp        0x7f6a90168fcd
04fa9 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04fb3 4c89542408                     mov        qword ptr [rsp + 8], r10
04fb8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fc0 e89b225607                     call       0x7f6a976cea60
04fc5 e93bc8ffff                     jmp        0x7f6a90169005
04fca 48890424                       mov        qword ptr [rsp], rax
04fce e88d605607                     call       0x7f6a976d2860
04fd3 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04fdd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fe1 e87a1dbb1f                     call       0x7f6aafd1e560
04fe6 f4                             hlt        
04fe7 e8f48d5607                     call       0x7f6a976d55e0
04fec 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04ff6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ffa e8611dbb1f                     call       0x7f6aafd1e560
04fff f4                             hlt        
05000 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
0500a 4c89542408                     mov        qword ptr [rsp + 8], r10
0500f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05017 e844225607                     call       0x7f6a976cea60
0501c e9a5c9ffff                     jmp        0x7f6a901691c6
05021 e8ba8d5607                     call       0x7f6a976d55e0
05026 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05030 4883e4f0                       and        rsp, 0xfffffffffffffff0
05034 e8271dbb1f                     call       0x7f6aafd1e560
05039 f4                             hlt        
0503a 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
05044 4c89542408                     mov        qword ptr [rsp + 8], r10
05049 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05051 e80a225607                     call       0x7f6a976cea60
05056 e92fcaffff                     jmp        0x7f6a9016928a
0505b 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
05065 4c89542408                     mov        qword ptr [rsp + 8], r10
0506a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05072 e8e9215607                     call       0x7f6a976cea60
05077 e94ccaffff                     jmp        0x7f6a901692c8
0507c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05084 e8d7445607                     call       0x7f6a976d0d60
05089 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05093 4883e4f0                       and        rsp, 0xfffffffffffffff0
05097 e8c41cbb1f                     call       0x7f6aafd1e560
0509c f4                             hlt        
0509d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
050a5 e8b6445607                     call       0x7f6a976d0d60
050aa 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
050b4 4883e4f0                       and        rsp, 0xfffffffffffffff0
050b8 e8a31cbb1f                     call       0x7f6aafd1e560
050bd f4                             hlt        
050be e81d8d5607                     call       0x7f6a976d55e0
050c3 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
050cd 4883e4f0                       and        rsp, 0xfffffffffffffff0
050d1 e88a1cbb1f                     call       0x7f6aafd1e560
050d6 f4                             hlt        
050d7 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
050e1 4c89542408                     mov        qword ptr [rsp + 8], r10
050e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ee e86d215607                     call       0x7f6a976cea60
050f3 e9e2cbffff                     jmp        0x7f6a901694da
050f8 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05102 4c89542408                     mov        qword ptr [rsp + 8], r10
05107 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0510f e84c215607                     call       0x7f6a976cea60
05114 e90eccffff                     jmp        0x7f6a90169527
05119 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05123 4c89542408                     mov        qword ptr [rsp + 8], r10
05128 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05130 e82b215607                     call       0x7f6a976cea60
05135 e925ccffff                     jmp        0x7f6a9016955f
0513a 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
05144 4c89542408                     mov        qword ptr [rsp + 8], r10
05149 48c704240a020000               mov        qword ptr [rsp], 0x20a
05151 e80a215607                     call       0x7f6a976cea60
05156 e9ccccffff                     jmp        0x7f6a90169627
0515b 90                             nop        
0515c 90                             nop        
0515d 90                             nop        
0515e 90                             nop        
0515f e8fc325c07                     call       0x7f6a9772fc60
05164 e9a0cdffff                     jmp        0x7f6a90169709
05169 90                             nop        
0516a 90                             nop        
0516b 90                             nop        
0516c 90                             nop        
0516d 90                             nop        
0516e 90                             nop        
0516f e8ec325c07                     call       0x7f6a9772fc60
05174 e901cfffff                     jmp        0x7f6a9016987a
05179 49bac02e62846a7f0000           movabs     r10, 0x7f6a84622ec0
05183 4c89542408                     mov        qword ptr [rsp + 8], r10
05188 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05190 e8cb205607                     call       0x7f6a976cea60
05195 e960cfffff                     jmp        0x7f6a901698fa
0519a 49ba78f871846a7f0000           movabs     r10, 0x7f6a8471f878
051a4 4c89542408                     mov        qword ptr [rsp + 8], r10
051a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051b1 e8aa205607                     call       0x7f6a976cea60
051b6 e9efcfffff                     jmp        0x7f6a901699aa
051bb 49baf09c09846a7f0000           movabs     r10, 0x7f6a84099cf0
051c5 4c89542408                     mov        qword ptr [rsp + 8], r10
051ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051d2 e889205607                     call       0x7f6a976cea60
051d7 e960d0ffff                     jmp        0x7f6a90169a3c
051dc 49ba68d472846a7f0000           movabs     r10, 0x7f6a8472d468
051e6 4c89542408                     mov        qword ptr [rsp + 8], r10
051eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f3 e868205607                     call       0x7f6a976cea60
051f8 e901d1ffff                     jmp        0x7f6a90169afe
051fd 49ba980e73846a7f0000           movabs     r10, 0x7f6a84730e98
05207 4c89542408                     mov        qword ptr [rsp + 8], r10
0520c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05214 e847205607                     call       0x7f6a976cea60
05219 e97ad1ffff                     jmp        0x7f6a90169b98
0521e 48890424                       mov        qword ptr [rsp], rax
05222 e8395e5607                     call       0x7f6a976d2860
05227 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05231 4883e4f0                       and        rsp, 0xfffffffffffffff0
05235 e8261bbb1f                     call       0x7f6aafd1e560
0523a f4                             hlt        
0523b 49ba680d73846a7f0000           movabs     r10, 0x7f6a84730d68
05245 4c89542408                     mov        qword ptr [rsp + 8], r10
0524a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05252 e809205607                     call       0x7f6a976cea60
05257 e91dd2ffff                     jmp        0x7f6a90169c79
0525c e87f8b5607                     call       0x7f6a976d55e0
05261 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0526b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0526f e8ec1abb1f                     call       0x7f6aafd1e560
05274 f4                             hlt        
05275 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0527d e8de425607                     call       0x7f6a976d0d60
05282 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0528c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05290 e8cb1abb1f                     call       0x7f6aafd1e560
05295 f4                             hlt        
05296 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0529e e8bd425607                     call       0x7f6a976d0d60
052a3 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
052ad 4883e4f0                       and        rsp, 0xfffffffffffffff0
052b1 e8aa1abb1f                     call       0x7f6aafd1e560
052b6 f4                             hlt        
052b7 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
052c1 4c89542408                     mov        qword ptr [rsp + 8], r10
052c6 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
052ce e88d1f5607                     call       0x7f6a976cea60
052d3 e90cd3ffff                     jmp        0x7f6a90169de4
052d8 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
052e2 4c89542408                     mov        qword ptr [rsp + 8], r10
052e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052ef e86c1f5607                     call       0x7f6a976cea60
052f4 e9e9d3ffff                     jmp        0x7f6a90169ee2
052f9 e8e28a5607                     call       0x7f6a976d55e0
052fe 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05308 4883e4f0                       and        rsp, 0xfffffffffffffff0
0530c e84f1abb1f                     call       0x7f6aafd1e560
05311 f4                             hlt        
05312 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
0531c 4c89542408                     mov        qword ptr [rsp + 8], r10
05321 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05329 e8321f5607                     call       0x7f6a976cea60
0532e e957d4ffff                     jmp        0x7f6a90169f8a
05333 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
0533d 4c89542408                     mov        qword ptr [rsp + 8], r10
05342 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0534a e8111f5607                     call       0x7f6a976cea60
0534f e96fd4ffff                     jmp        0x7f6a90169fc3
05354 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0535c e8ff415607                     call       0x7f6a976d0d60
05361 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0536b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0536f e8ec19bb1f                     call       0x7f6aafd1e560
05374 f4                             hlt        
05375 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0537d e8de415607                     call       0x7f6a976d0d60
05382 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0538c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05390 e8cb19bb1f                     call       0x7f6aafd1e560
05395 f4                             hlt        
05396 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
053a0 4c89542408                     mov        qword ptr [rsp + 8], r10
053a5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ad e8ae1e5607                     call       0x7f6a976cea60
053b2 e9dad4ffff                     jmp        0x7f6a9016a091
053b7 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
053c1 4c89542408                     mov        qword ptr [rsp + 8], r10
053c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ce e88d1e5607                     call       0x7f6a976cea60
053d3 e9ecd4ffff                     jmp        0x7f6a9016a0c4
053d8 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
053e2 4c89542408                     mov        qword ptr [rsp + 8], r10
053e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ef e86c1e5607                     call       0x7f6a976cea60
053f4 e92fd5ffff                     jmp        0x7f6a9016a128
053f9 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
05403 4c89542408                     mov        qword ptr [rsp + 8], r10
05408 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05410 e84b1e5607                     call       0x7f6a976cea60
05415 e949d5ffff                     jmp        0x7f6a9016a163
0541a 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
05424 4c89542408                     mov        qword ptr [rsp + 8], r10
05429 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05431 e82a1e5607                     call       0x7f6a976cea60
05436 e95bd5ffff                     jmp        0x7f6a9016a196
0543b 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
05445 4c89542408                     mov        qword ptr [rsp + 8], r10
0544a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05452 e8091e5607                     call       0x7f6a976cea60
05457 e948d6ffff                     jmp        0x7f6a9016a2a4
0545c 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05466 4c89542408                     mov        qword ptr [rsp + 8], r10
0546b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05473 e8e81d5607                     call       0x7f6a976cea60
05478 e968d6ffff                     jmp        0x7f6a9016a2e5
0547d 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05487 4c89542408                     mov        qword ptr [rsp + 8], r10
0548c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05494 e8c71d5607                     call       0x7f6a976cea60
05499 e97ad6ffff                     jmp        0x7f6a9016a318
0549e 48890424                       mov        qword ptr [rsp], rax
054a2 e8b95b5607                     call       0x7f6a976d2860
054a7 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
054b1 4883e4f0                       and        rsp, 0xfffffffffffffff0
054b5 e8a618bb1f                     call       0x7f6aafd1e560
054ba f4                             hlt        
054bb e820895607                     call       0x7f6a976d55e0
054c0 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
054ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
054ce e88d18bb1f                     call       0x7f6aafd1e560
054d3 f4                             hlt        
054d4 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
054de 4c89542408                     mov        qword ptr [rsp + 8], r10
054e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054eb e8701d5607                     call       0x7f6a976cea60
054f0 e9e1d7ffff                     jmp        0x7f6a9016a4d6
054f5 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
054ff 4c89542408                     mov        qword ptr [rsp + 8], r10
05504 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0550c e84f1d5607                     call       0x7f6a976cea60
05511 e979d8ffff                     jmp        0x7f6a9016a58f
05516 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
05520 4c89542408                     mov        qword ptr [rsp + 8], r10
05525 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0552d e82e1d5607                     call       0x7f6a976cea60
05532 e99fd8ffff                     jmp        0x7f6a9016a5d6
05537 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0553f e81c405607                     call       0x7f6a976d0d60
05544 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0554e 4883e4f0                       and        rsp, 0xfffffffffffffff0
05552 e80918bb1f                     call       0x7f6aafd1e560
05557 f4                             hlt        
05558 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05560 e8fb3f5607                     call       0x7f6a976d0d60
05565 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0556f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05573 e8e817bb1f                     call       0x7f6aafd1e560
05578 f4                             hlt        
05579 e862885607                     call       0x7f6a976d55e0
0557e 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05588 4883e4f0                       and        rsp, 0xfffffffffffffff0
0558c e8cf17bb1f                     call       0x7f6aafd1e560
05591 f4                             hlt        
05592 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
0559c 4c89542408                     mov        qword ptr [rsp + 8], r10
055a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055a9 e8b21c5607                     call       0x7f6a976cea60
055ae e92fdaffff                     jmp        0x7f6a9016a7e2
055b3 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
055bd 4c89542408                     mov        qword ptr [rsp + 8], r10
055c2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055ca e8911c5607                     call       0x7f6a976cea60
055cf e95bdaffff                     jmp        0x7f6a9016a82f
055d4 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
055de 4c89542408                     mov        qword ptr [rsp + 8], r10
055e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055eb e8701c5607                     call       0x7f6a976cea60
055f0 e972daffff                     jmp        0x7f6a9016a867
055f5 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
055ff 4c89542408                     mov        qword ptr [rsp + 8], r10
05604 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
0560c e84f1c5607                     call       0x7f6a976cea60
05611 e91cdbffff                     jmp        0x7f6a9016a932
05616 49bac02e62846a7f0000           movabs     r10, 0x7f6a84622ec0
05620 4c89542408                     mov        qword ptr [rsp + 8], r10
05625 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0562d e82e1c5607                     call       0x7f6a976cea60
05632 e9dbdbffff                     jmp        0x7f6a9016aa12
05637 49ba78f871846a7f0000           movabs     r10, 0x7f6a8471f878
05641 4c89542408                     mov        qword ptr [rsp + 8], r10
05646 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0564e e80d1c5607                     call       0x7f6a976cea60
05653 e96adcffff                     jmp        0x7f6a9016aac2
05658 49baf09c09846a7f0000           movabs     r10, 0x7f6a84099cf0
05662 4c89542408                     mov        qword ptr [rsp + 8], r10
05667 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0566f e8ec1b5607                     call       0x7f6a976cea60
05674 e9dbdcffff                     jmp        0x7f6a9016ab54
05679 49ba68d472846a7f0000           movabs     r10, 0x7f6a8472d468
05683 4c89542408                     mov        qword ptr [rsp + 8], r10
05688 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05690 e8cb1b5607                     call       0x7f6a976cea60
05695 e97cddffff                     jmp        0x7f6a9016ac16
0569a 49ba980e73846a7f0000           movabs     r10, 0x7f6a84730e98
056a4 4c89542408                     mov        qword ptr [rsp + 8], r10
056a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056b1 e8aa1b5607                     call       0x7f6a976cea60
056b6 e9f5ddffff                     jmp        0x7f6a9016acb0
056bb 48890424                       mov        qword ptr [rsp], rax
056bf e89c595607                     call       0x7f6a976d2860
056c4 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
056ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
056d2 e88916bb1f                     call       0x7f6aafd1e560
056d7 f4                             hlt        
056d8 49ba680d73846a7f0000           movabs     r10, 0x7f6a84730d68
056e2 4c89542408                     mov        qword ptr [rsp + 8], r10
056e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056ef e86c1b5607                     call       0x7f6a976cea60
056f4 e998deffff                     jmp        0x7f6a9016ad91
056f9 e8e2865607                     call       0x7f6a976d55e0
056fe 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05708 4883e4f0                       and        rsp, 0xfffffffffffffff0
0570c e84f16bb1f                     call       0x7f6aafd1e560
05711 f4                             hlt        
05712 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0571a e8413e5607                     call       0x7f6a976d0d60
0571f 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05729 4883e4f0                       and        rsp, 0xfffffffffffffff0
0572d e82e16bb1f                     call       0x7f6aafd1e560
05732 f4                             hlt        
05733 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0573b e8203e5607                     call       0x7f6a976d0d60
05740 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0574a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0574e e80d16bb1f                     call       0x7f6aafd1e560
05753 f4                             hlt        
05754 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
0575e 4c89542408                     mov        qword ptr [rsp + 8], r10
05763 48c7042420030000               mov        qword ptr [rsp], 0x320
0576b e8f01a5607                     call       0x7f6a976cea60
05770 e987dfffff                     jmp        0x7f6a9016aefc
05775 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
0577f 4c89542408                     mov        qword ptr [rsp + 8], r10
05784 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0578c e8cf1a5607                     call       0x7f6a976cea60
05791 e948e0ffff                     jmp        0x7f6a9016afde
05796 e845865607                     call       0x7f6a976d55e0
0579b 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
057a5 4883e4f0                       and        rsp, 0xfffffffffffffff0
057a9 e8b215bb1f                     call       0x7f6aafd1e560
057ae f4                             hlt        
057af 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
057b9 4c89542408                     mov        qword ptr [rsp + 8], r10
057be 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
057c6 e8951a5607                     call       0x7f6a976cea60
057cb e9b6e0ffff                     jmp        0x7f6a9016b086
057d0 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
057da 4c89542408                     mov        qword ptr [rsp + 8], r10
057df 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
057e7 e8741a5607                     call       0x7f6a976cea60
057ec e9cee0ffff                     jmp        0x7f6a9016b0bf
057f1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
057f9 e8623d5607                     call       0x7f6a976d0d60
057fe 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05808 4883e4f0                       and        rsp, 0xfffffffffffffff0
0580c e84f15bb1f                     call       0x7f6aafd1e560
05811 f4                             hlt        
05812 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0581a e8413d5607                     call       0x7f6a976d0d60
0581f 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05829 4883e4f0                       and        rsp, 0xfffffffffffffff0
0582d e82e15bb1f                     call       0x7f6aafd1e560
05832 f4                             hlt        
05833 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
0583d 4c89542408                     mov        qword ptr [rsp + 8], r10
05842 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0584a e8111a5607                     call       0x7f6a976cea60
0584f e931e1ffff                     jmp        0x7f6a9016b185
05854 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
0585e 4c89542408                     mov        qword ptr [rsp + 8], r10
05863 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0586b e8f0195607                     call       0x7f6a976cea60
05870 e943e1ffff                     jmp        0x7f6a9016b1b8
05875 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
0587f 4c89542408                     mov        qword ptr [rsp + 8], r10
05884 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0588c e8cf195607                     call       0x7f6a976cea60
05891 e97ae1ffff                     jmp        0x7f6a9016b210
05896 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
058a0 4c89542408                     mov        qword ptr [rsp + 8], r10
058a5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058ad e8ae195607                     call       0x7f6a976cea60
058b2 e98fe1ffff                     jmp        0x7f6a9016b246
058b7 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
058c1 4c89542408                     mov        qword ptr [rsp + 8], r10
058c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058ce e88d195607                     call       0x7f6a976cea60
058d3 e9a1e1ffff                     jmp        0x7f6a9016b279
058d8 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
058e2 4c89542408                     mov        qword ptr [rsp + 8], r10
058e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058ef e86c195607                     call       0x7f6a976cea60
058f4 e98ee2ffff                     jmp        0x7f6a9016b387
058f9 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05903 4c89542408                     mov        qword ptr [rsp + 8], r10
05908 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05910 e84b195607                     call       0x7f6a976cea60
05915 e9aee2ffff                     jmp        0x7f6a9016b3c8
0591a 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05924 4c89542408                     mov        qword ptr [rsp + 8], r10
05929 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05931 e82a195607                     call       0x7f6a976cea60
05936 e9c0e2ffff                     jmp        0x7f6a9016b3fb
0593b 48890424                       mov        qword ptr [rsp], rax
0593f e81c575607                     call       0x7f6a976d2860
05944 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0594e 4883e4f0                       and        rsp, 0xfffffffffffffff0
05952 e80914bb1f                     call       0x7f6aafd1e560
05957 f4                             hlt        
05958 e883845607                     call       0x7f6a976d55e0
0595d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05967 4883e4f0                       and        rsp, 0xfffffffffffffff0
0596b e8f013bb1f                     call       0x7f6aafd1e560
05970 f4                             hlt        
05971 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
0597b 4c89542408                     mov        qword ptr [rsp + 8], r10
05980 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05988 e8d3185607                     call       0x7f6a976cea60
0598d e924e4ffff                     jmp        0x7f6a9016b5b6
05992 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
0599c 4c89542408                     mov        qword ptr [rsp + 8], r10
059a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
059a9 e8b2185607                     call       0x7f6a976cea60
059ae e9bce4ffff                     jmp        0x7f6a9016b66f
059b3 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
059bd 4c89542408                     mov        qword ptr [rsp + 8], r10
059c2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
059ca e891185607                     call       0x7f6a976cea60
059cf e9e3e4ffff                     jmp        0x7f6a9016b6b7
059d4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
059dc e87f3b5607                     call       0x7f6a976d0d60
059e1 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
059eb 4883e4f0                       and        rsp, 0xfffffffffffffff0
059ef e86c13bb1f                     call       0x7f6aafd1e560
059f4 f4                             hlt        
059f5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
059fd e85e3b5607                     call       0x7f6a976d0d60
05a02 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05a0c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a10 e84b13bb1f                     call       0x7f6aafd1e560
05a15 f4                             hlt        
05a16 e8c5835607                     call       0x7f6a976d55e0
05a1b 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05a25 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a29 e83213bb1f                     call       0x7f6aafd1e560
05a2e f4                             hlt        
05a2f 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
05a39 4c89542408                     mov        qword ptr [rsp + 8], r10
05a3e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05a46 e815185607                     call       0x7f6a976cea60
05a4b e972e6ffff                     jmp        0x7f6a9016b8c2
05a50 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05a5a 4c89542408                     mov        qword ptr [rsp + 8], r10
05a5f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05a67 e8f4175607                     call       0x7f6a976cea60
05a6c e99ee6ffff                     jmp        0x7f6a9016b90f
05a71 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05a7b 4c89542408                     mov        qword ptr [rsp + 8], r10
05a80 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05a88 e8d3175607                     call       0x7f6a976cea60
05a8d e9b5e6ffff                     jmp        0x7f6a9016b947
05a92 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
05a9c 4c89542408                     mov        qword ptr [rsp + 8], r10
05aa1 48c704245a030000               mov        qword ptr [rsp], 0x35a
05aa9 e8b2175607                     call       0x7f6a976cea60
05aae e972e7ffff                     jmp        0x7f6a9016ba25
05ab3 e828835607                     call       0x7f6a976d55e0
05ab8 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
05ac6 e89512bb1f                     call       0x7f6aafd1e560
05acb f4                             hlt        
05acc 90                             nop        
05acd 90                             nop        
05ace 90                             nop        
05acf e88c295c07                     call       0x7f6a9772fc60
05ad4 e9d1e8ffff                     jmp        0x7f6a9016bbaa
05ad9 e802835607                     call       0x7f6a976d55e0
05ade 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05ae8 4883e4f0                       and        rsp, 0xfffffffffffffff0
05aec e86f12bb1f                     call       0x7f6aafd1e560
05af1 f4                             hlt        
05af2 49bacebb16906a7f0000           movabs     r10, 0x7f6a9016bbce
05afc 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05b03 e958505c07                     jmp        0x7f6a97732360
05b08 48ba0000000000000000           movabs     rdx, 0
05b12 b8000f050a                     mov        eax, 0xa050f00
05b17 e8442c5607                     call       0x7f6a976cff60
05b1c e9dfe8ffff                     jmp        0x7f6a9016bc00
05b21 e8ba825607                     call       0x7f6a976d55e0
05b26 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05b30 4883e4f0                       and        rsp, 0xfffffffffffffff0
05b34 e82712bb1f                     call       0x7f6aafd1e560
05b39 f4                             hlt        
05b3a 488bd2                         mov        rdx, rdx
05b3d e89e725607                     call       0x7f6a976d45e0
05b42 e908e9ffff                     jmp        0x7f6a9016bc4f
05b47 48ba0000000000000000           movabs     rdx, 0
05b51 b8000f050a                     mov        eax, 0xa050f00
05b56 e8051e5607                     call       0x7f6a976cf160
05b5b e9f0e8ffff                     jmp        0x7f6a9016bc50
05b60 48ba0000000000000000           movabs     rdx, 0
05b6a b8000f050a                     mov        eax, 0xa050f00
05b6f e8ec2b5607                     call       0x7f6a976cff60
05b74 e96fe9ffff                     jmp        0x7f6a9016bce8
05b79 e862825607                     call       0x7f6a976d55e0
05b7e 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05b88 4883e4f0                       and        rsp, 0xfffffffffffffff0
05b8c e8cf11bb1f                     call       0x7f6aafd1e560
05b91 f4                             hlt        
05b92 488bd2                         mov        rdx, rdx
05b95 e846725607                     call       0x7f6a976d45e0
05b9a e998e9ffff                     jmp        0x7f6a9016bd37
05b9f 48ba0000000000000000           movabs     rdx, 0
05ba9 b8000f050a                     mov        eax, 0xa050f00
05bae e8ad2b5607                     call       0x7f6a976cff60
05bb3 e9d0e9ffff                     jmp        0x7f6a9016bd88
05bb8 e823825607                     call       0x7f6a976d55e0
05bbd 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05bc7 4883e4f0                       and        rsp, 0xfffffffffffffff0
05bcb e89011bb1f                     call       0x7f6aafd1e560
05bd0 f4                             hlt        
05bd1 488bd2                         mov        rdx, rdx
05bd4 e807725607                     call       0x7f6a976d45e0
05bd9 e9f9e9ffff                     jmp        0x7f6a9016bdd7
05bde 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
05be5 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
05bf0 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
05bfb 4881c4e0020000                 add        rsp, 0x2e0
05c02 5d                             pop        rbp
05c03 e958915607                     jmp        0x7f6a976d6560
