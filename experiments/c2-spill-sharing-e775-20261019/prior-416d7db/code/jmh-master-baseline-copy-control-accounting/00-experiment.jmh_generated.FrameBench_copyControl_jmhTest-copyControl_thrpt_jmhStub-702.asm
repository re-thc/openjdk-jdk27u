00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecd0000000                 sub        rsp, 0xd0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7fa71842b39f
0001a e801e74b07                     call       0x7fa71f8e9aa0
0001f 48bb280a098200000000           movabs     rbx, 0x82090a28
00029 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0002c 83c002                         add        eax, 2
0002f 894370                         mov        dword ptr [rbx + 0x70], eax
00032 25fe070000                     and        eax, 0x7fe
00037 85c0                           test       eax, eax
00039 0f84d2030000                   je         0x7fa71842b791
0003f 48897c2448                     mov        qword ptr [rsp + 0x48], rdi
00044 4889542440                     mov        qword ptr [rsp + 0x40], rdx
00049 4889742450                     mov        qword ptr [rsp + 0x50], rsi
0004e 48b8280a098200000000           movabs     rax, 0x82090a28
00058 488380a800000001               add        qword ptr [rax + 0xa8], 1
00060 e83b16c31d                     call       0x7fa73605ca20
00065 0f1f840000000000               nop        dword ptr [rax + rax]
0006d 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00072 48894220                       mov        qword ptr [rdx + 0x20], rax
00076 488bbc24f0000000               mov        rdi, qword ptr [rsp + 0xf0]
0007e 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
00083 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00088 b800000000                     mov        eax, 0
0008d b900000000                     mov        ecx, 0
00092 48898424b0000000               mov        qword ptr [rsp + 0xb0], rax
0009a 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
000a2 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
000aa 48899424a8000000               mov        qword ptr [rsp + 0xa8], rdx
000b2 e9c9000000                     jmp        0x7fa71842b500
000b7 90                             nop        
000b8 48be20be088200000000           movabs     rsi, 0x8208be20
000c2 488386c800000001               add        qword ptr [rsi + 0xc8], 1
000ca 48be20be088200000000           movabs     rsi, 0x8208be20
000d4 ff86d8000000                   inc        dword ptr [rsi + 0xd8]
000da 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
000e2 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
000ea 41ba01000000                   mov        r10d, 1
000f0 4903ca                         add        rcx, r10
000f3 0fbebe8c000000                 movsx      edi, byte ptr [rsi + 0x8c]
000fa 85ff                           test       edi, edi
000fc b802000000                     mov        eax, 2
00101 7405                           je         0x7fa71842b488
00103 b800000000                     mov        eax, 0
00108 48ba280a098200000000           movabs     rdx, 0x82090a28
00112 448b4274                       mov        r8d, dword ptr [rdx + 0x74]
00116 4403c0                         add        r8d, eax
00119 44894274                       mov        dword ptr [rdx + 0x74], r8d
0011d 85c0                           test       eax, eax
0011f 7506                           jne        0x7fa71842b4a7
00121 41b802000000                   mov        r8d, 2
00127 4181e0fe3f0000                 and        r8d, 0x3ffe
0012e 4585c0                         test       r8d, r8d
00131 0f8405030000                   je         0x7fa71842b7bc
00137 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0013b 418502                         test       dword ptr [r10], eax
0013e 85ff                           test       edi, edi
00140 48bf280a098200000000           movabs     rdi, 0x82090a28
0014a b828010000                     mov        eax, 0x128
0014f 7505                           jne        0x7fa71842b4d6
00151 b818010000                     mov        eax, 0x118
00156 488b1407                       mov        rdx, qword ptr [rdi + rax]
0015a 488d5201                       lea        rdx, [rdx + 1]
0015e 48891407                       mov        qword ptr [rdi + rax], rdx
00162 0f8557010000                   jne        0x7fa71842b63f
00168 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
00170 488bbc24a0000000               mov        rdi, qword ptr [rsp + 0xa0]
00178 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
00180 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00188 483b07                         cmp        rax, qword ptr [rdi]
0018b 4c8bc7                         mov        r8, rdi
0018e 49b9280a098200000000           movabs     r9, 0x82090a28
00198 458b00                         mov        r8d, dword ptr [r8]
0019b 41c1e80d                       shr        r8d, 0xd
0019f 49c1e00a                       shl        r8, 0xa
001a3 41ba00000081                   mov        r10d, 0x81000000
001a9 4d03c2                         add        r8, r10
001ac 41ba18000000                   mov        r10d, 0x18
001b2 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
001b6 7436                           je         0x7fa71842b56e
001b8 4983c202                       add        r10, 2
001bc 4983fa1c                       cmp        r10, 0x1c
001c0 75f0                           jne        0x7fa71842b532
001c2 41ba18000000                   mov        r10d, 0x18
001c8 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
001cd 7412                           je         0x7fa71842b561
001cf 4983c202                       add        r10, 2
001d3 4983fa1c                       cmp        r10, 0x1c
001d7 75ef                           jne        0x7fa71842b548
001d9 41ba17000000                   mov        r10d, 0x17
001df eb11                           jmp        0x7fa71842b572
001e1 50                             push       rax
001e2 4833c0                         xor        rax, rax
001e5 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
001eb 58                             pop        rax
001ec ebbe                           jmp        0x7fa71842b52c
001ee 4983c201                       add        r10, 1
001f2 4b8304d101                     add        qword ptr [r9 + r10*8], 1
001f7 488bf7                         mov        rsi, rdi
001fa 4889bc24a0000000               mov        qword ptr [rsp + 0xa0], rdi
00202 0f1f440000                     nop        dword ptr [rax + rax]
00207 e8d4e84c07                     call       0x7fa71f8f9e60
0020c 0f1f840004030001               nop        dword ptr [rax + rax + 0x1000304]
00214 488b9c2488000000               mov        rbx, qword ptr [rsp + 0x88]
0021c 483b03                         cmp        rax, qword ptr [rbx]
0021f 488bf3                         mov        rsi, rbx
00222 48bf280a098200000000           movabs     rdi, 0x82090a28
0022c 8b36                           mov        esi, dword ptr [rsi]
0022e c1ee0d                         shr        esi, 0xd
00231 48c1e60a                       shl        rsi, 0xa
00235 41ba00000081                   mov        r10d, 0x81000000
0023b 4903f2                         add        rsi, r10
0023e 41ba1e000000                   mov        r10d, 0x1e
00244 4a3b34d7                       cmp        rsi, qword ptr [rdi + r10*8]
00248 7436                           je         0x7fa71842b600
0024a 4983c202                       add        r10, 2
0024e 4983fa22                       cmp        r10, 0x22
00252 75f0                           jne        0x7fa71842b5c4
00254 41ba1e000000                   mov        r10d, 0x1e
0025a 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
0025f 7412                           je         0x7fa71842b5f3
00261 4983c202                       add        r10, 2
00265 4983fa22                       cmp        r10, 0x22
00269 75ef                           jne        0x7fa71842b5da
0026b 41ba1d000000                   mov        r10d, 0x1d
00271 eb11                           jmp        0x7fa71842b604
00273 50                             push       rax
00274 4833c0                         xor        rax, rax
00277 f04a0fb134d7                   lock cmpxchg qword ptr [rdi + r10*8], rsi
0027d 58                             pop        rax
0027e ebbe                           jmp        0x7fa71842b5be
00280 4983c201                       add        r10, 1
00284 4a8304d701                     add        qword ptr [rdi + r10*8], 1
00289 48be20be088200000000           movabs     rsi, 0x8208be20
00293 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
00296 83c702                         add        edi, 2
00299 897e70                         mov        dword ptr [rsi + 0x70], edi
0029c 81e7feff1f00                   and        edi, 0x1ffffe
002a2 85ff                           test       edi, edi
002a4 0f84bd010000                   je         0x7fa71842b7e7
002aa 48be20be088200000000           movabs     rsi, 0x8208be20
002b4 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
002ba e9f9fdffff                     jmp        0x7fa71842b438
002bf 48898c24b8000000               mov        qword ptr [rsp + 0xb8], rcx
002c7 48be280a098200000000           movabs     rsi, 0x82090a28
002d1 4883863801000001               add        qword ptr [rsi + 0x138], 1
002d9 e8c213c31d                     call       0x7fa73605ca20
002de 0f1f840000000000               nop        dword ptr [rax + rax]
002e6 488b9424a8000000               mov        rdx, qword ptr [rsp + 0xa8]
002ee 48894228                       mov        qword ptr [rdx + 0x28], rax
002f2 488b8424b0000000               mov        rax, qword ptr [rsp + 0xb0]
002fa 48894218                       mov        qword ptr [rdx + 0x18], rax
002fe 488b8c24b8000000               mov        rcx, qword ptr [rsp + 0xb8]
00306 c4e1fb2ac1                     vcvtsi2sd  xmm0, xmm0, rcx
0030b c5fb114210                     vmovsd     qword ptr [rdx + 0x10], xmm0
00310 4881c4d0000000                 add        rsp, 0xd0
00317 5d                             pop        rbp
00318 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0031c 0f876b010000                   ja         0x7fa71842b80d
00322 c3                             ret        
00323 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
0032a 55                             push       rbp
0032b 4881ecd0000000                 sub        rsp, 0xd0
00332 6690                           nop        
00334 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
0033c 7405                           je         0x7fa71842b6c3
0033e e8dde34b07                     call       0x7fa71f8e9aa0
00343 bf60000000                     mov        edi, 0x60
00348 4863ff                         movsxd     rdi, edi
0034b 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0034f bf58000000                     mov        edi, 0x58
00354 4863ff                         movsxd     rdi, edi
00357 488b043e                       mov        rax, qword ptr [rsi + rdi]
0035b bf38000000                     mov        edi, 0x38
00360 4863ff                         movsxd     rdi, edi
00363 488b143e                       mov        rdx, qword ptr [rsi + rdi]
00367 bf20000000                     mov        edi, 0x20
0036c 4863ff                         movsxd     rdi, edi
0036f 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
00373 bf10000000                     mov        edi, 0x10
00378 4863ff                         movsxd     rdi, edi
0037b 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
0037f bf00000000                     mov        edi, 0
00384 4863ff                         movsxd     rdi, edi
00387 4c8b0c3e                       mov        r9, qword ptr [rsi + rdi]
0038b 488bfe                         mov        rdi, rsi
0038e 48899c2480000000               mov        qword ptr [rsp + 0x80], rbx
00396 4889442478                     mov        qword ptr [rsp + 0x78], rax
0039b 4889542470                     mov        qword ptr [rsp + 0x70], rdx
003a0 48894c2468                     mov        qword ptr [rsp + 0x68], rcx
003a5 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003aa 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
003af e88c62d11d                     call       0x7fa7361419c0
003b4 0f1f840000000000               nop        dword ptr [rax + rax]
003bc 4c8b4c2458                     mov        r9, qword ptr [rsp + 0x58]
003c1 498bc1                         mov        rax, r9
003c4 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
003c9 498bc8                         mov        rcx, r8
003cc 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
003d1 488bfe                         mov        rdi, rsi
003d4 488b542470                     mov        rdx, qword ptr [rsp + 0x70]
003d9 488bda                         mov        rbx, rdx
003dc 488b742478                     mov        rsi, qword ptr [rsp + 0x78]
003e1 488bd6                         mov        rdx, rsi
003e4 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
003ec 48898424b0000000               mov        qword ptr [rsp + 0xb0], rax
003f4 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
003fc 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
00404 48899424a8000000               mov        qword ptr [rsp + 0xa8], rdx
0040c e96ffdffff                     jmp        0x7fa71842b500
00411 49ba80944408a77f0000           movabs     r10, 0x7fa708449480
0041b 4c89542408                     mov        qword ptr [rsp + 8], r10
00420 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
00428 e8b36d5907                     call       0x7fa71f9c2560
0042d e90dfcffff                     jmp        0x7fa71842b3bf
00432 e829055907                     call       0x7fa71f9bbce0
00437 e824055907                     call       0x7fa71f9bbce0
0043c 49ba80944408a77f0000           movabs     r10, 0x7fa708449480
00446 4c89542408                     mov        qword ptr [rsp + 8], r10
0044b 48c7042421000000               mov        qword ptr [rsp], 0x21
00453 e8886d5907                     call       0x7fa71f9c2560
00458 e9dafcffff                     jmp        0x7fa71842b4b7
0045d e8fe045907                     call       0x7fa71f9bbce0
00462 e8f9045907                     call       0x7fa71f9bbce0
00467 49baf8734508a77f0000           movabs     r10, 0x7fa7084573f8
00471 4c89542408                     mov        qword ptr [rsp + 8], r10
00476 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0047e e85d6d5907                     call       0x7fa71f9c2560
00483 e922feffff                     jmp        0x7fa71842b62a
00488 e8d3045907                     call       0x7fa71f9bbce0
0048d 49ba98b64218a77f0000           movabs     r10, 0x7fa71842b698
00497 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0049e e9bd164d07                     jmp        0x7fa71f8fcee0
004a3 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
004aa 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
004b5 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
004c0 4881c4d0000000                 add        rsp, 0xd0
004c7 5d                             pop        rbp
004c8 e993f25807                     jmp        0x7fa71f9baae0
004cd f4                             hlt        
004ce f4                             hlt        
004cf f4                             hlt        
