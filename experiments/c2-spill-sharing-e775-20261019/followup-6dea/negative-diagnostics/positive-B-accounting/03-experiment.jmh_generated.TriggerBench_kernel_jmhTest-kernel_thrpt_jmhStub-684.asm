00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec90000000                 sub        rsp, 0x90
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7f57ec42679f
0001a e801334c07                     call       0x7f57f38e9aa0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 4889542458                     mov        qword ptr [rsp + 0x58], rdx
00029 48897c2460                     mov        qword ptr [rsp + 0x60], rdi
0002e 48bbc07b48dc577f0000           movabs     rbx, 0x7f57dc487bc0
00038 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0003b 83c002                         add        eax, 2
0003e 894370                         mov        dword ptr [rbx + 0x70], eax
00041 25fe070000                     and        eax, 0x7fe
00046 85c0                           test       eax, eax
00048 0f84c7020000                   je         0x7f57ec426a95
0004e 48bbc07b48dc577f0000           movabs     rbx, 0x7f57dc487bc0
00058 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00060 e8fb257420                     call       0x7f580cb68de0
00065 0f1f840000000000               nop        dword ptr [rax + rax]
0006d 488b542458                     mov        rdx, qword ptr [rsp + 0x58]
00072 48894220                       mov        qword ptr [rdx + 0x20], rax
00076 bf00000000                     mov        edi, 0
0007b 48897c2470                     mov        qword ptr [rsp + 0x70], rdi
00080 e9b2000000                     jmp        0x7f57ec4268b7
00085 666690                         nop        
00088 48be187e08a200000000           movabs     rsi, 0xa2087e18
00092 488386c800000001               add        qword ptr [rsi + 0xc8], 1
0009a 48be187e08a200000000           movabs     rsi, 0xa2087e18
000a4 ff86d8000000                   inc        dword ptr [rsi + 0xd8]
000aa 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
000af 488b5c2470                     mov        rbx, qword ptr [rsp + 0x70]
000b4 41ba01000000                   mov        r10d, 1
000ba 4903da                         add        rbx, r10
000bd 0fbe868c000000                 movsx      eax, byte ptr [rsi + 0x8c]
000c4 85c0                           test       eax, eax
000c6 ba02000000                     mov        edx, 2
000cb 7405                           je         0x7f57ec426852
000cd ba00000000                     mov        edx, 0
000d2 48b9c07b48dc577f0000           movabs     rcx, 0x7f57dc487bc0
000dc 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
000e0 4403c2                         add        r8d, edx
000e3 44894174                       mov        dword ptr [rcx + 0x74], r8d
000e7 85d2                           test       edx, edx
000e9 7506                           jne        0x7f57ec426871
000eb 41b802000000                   mov        r8d, 2
000f1 4181e0fe3f0000                 and        r8d, 0x3ffe
000f8 4585c0                         test       r8d, r8d
000fb 0f843f020000                   je         0x7f57ec426ac0
00101 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00105 418502                         test       dword ptr [r10], eax
00108 85c0                           test       eax, eax
0010a 48b8c07b48dc577f0000           movabs     rax, 0x7f57dc487bc0
00114 ba28010000                     mov        edx, 0x128
00119 7505                           jne        0x7f57ec4268a0
0011b ba18010000                     mov        edx, 0x118
00120 488b0c10                       mov        rcx, qword ptr [rax + rdx]
00124 488d4901                       lea        rcx, [rcx + 1]
00128 48890c10                       mov        qword ptr [rax + rdx], rcx
0012c 0f858a010000                   jne        0x7f57ec426a3c
00132 48895c2470                     mov        qword ptr [rsp + 0x70], rbx
00137 488bbc24b0000000               mov        rdi, qword ptr [rsp + 0xb0]
0013f 483b07                         cmp        rax, qword ptr [rdi]
00142 488bcf                         mov        rcx, rdi
00145 49b8c07b48dc577f0000           movabs     r8, 0x7f57dc487bc0
0014f 8b09                           mov        ecx, dword ptr [rcx]
00151 c1e90d                         shr        ecx, 0xd
00154 48c1e10a                       shl        rcx, 0xa
00158 41ba000000a1                   mov        r10d, 0xa1000000
0015e 4903ca                         add        rcx, r10
00161 41ba18000000                   mov        r10d, 0x18
00167 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0016b 7436                           je         0x7f57ec426923
0016d 4983c202                       add        r10, 2
00171 4983fa1c                       cmp        r10, 0x1c
00175 75f0                           jne        0x7f57ec4268e7
00177 41ba18000000                   mov        r10d, 0x18
0017d 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00182 7412                           je         0x7f57ec426916
00184 4983c202                       add        r10, 2
00188 4983fa1c                       cmp        r10, 0x1c
0018c 75ef                           jne        0x7f57ec4268fd
0018e 41ba17000000                   mov        r10d, 0x17
00194 eb11                           jmp        0x7f57ec426927
00196 50                             push       rax
00197 4833c0                         xor        rax, rax
0019a f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
001a0 58                             pop        rax
001a1 ebbe                           jmp        0x7f57ec4268e1
001a3 4983c201                       add        r10, 1
001a7 4b8304d001                     add        qword ptr [r8 + r10*8], 1
001ac 48b9007a48dc577f0000           movabs     rcx, 0x7f57dc487a00
001b6 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
001ba 4183c002                       add        r8d, 2
001be 44894170                       mov        dword ptr [rcx + 0x70], r8d
001c2 4181e0feff1f00                 and        r8d, 0x1ffffe
001c9 4585c0                         test       r8d, r8d
001cc 0f8494010000                   je         0x7f57ec426ae6
001d2 8b4f04                         mov        ecx, dword ptr [rdi + 4]
001d5 448b4710                       mov        r8d, dword ptr [rdi + 0x10]
001d9 448b4f14                       mov        r9d, dword ptr [rdi + 0x14]
001dd 448b5f18                       mov        r11d, dword ptr [rdi + 0x18]
001e1 448b6f1c                       mov        r13d, dword ptr [rdi + 0x1c]
001e5 49be007a48dc577f0000           movabs     r14, 0x7f57dc487a00
001ef 498386a800000001               add        qword ptr [r14 + 0xa8], 1
001f7 488bf1                         mov        rsi, rcx
001fa 498bd0                         mov        rdx, r8
001fd 498bc9                         mov        rcx, r9
00200 4d8bc3                         mov        r8, r11
00203 4d8bcd                         mov        r9, r13
00206 90                             nop        
00207 e8d43e4d07                     call       0x7f57f38fa860
0020c 0f1f840004030001               nop        dword ptr [rax + rax + 0x1000304]
00214 488b7c2460                     mov        rdi, qword ptr [rsp + 0x60]
00219 483b07                         cmp        rax, qword ptr [rdi]
0021c 488bf7                         mov        rsi, rdi
0021f 48bbc07b48dc577f0000           movabs     rbx, 0x7f57dc487bc0
00229 8b36                           mov        esi, dword ptr [rsi]
0022b c1ee0d                         shr        esi, 0xd
0022e 48c1e60a                       shl        rsi, 0xa
00232 41ba000000a1                   mov        r10d, 0xa1000000
00238 4903f2                         add        rsi, r10
0023b 41ba1e000000                   mov        r10d, 0x1e
00241 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00245 7436                           je         0x7f57ec4269fd
00247 4983c202                       add        r10, 2
0024b 4983fa22                       cmp        r10, 0x22
0024f 75f0                           jne        0x7f57ec4269c1
00251 41ba1e000000                   mov        r10d, 0x1e
00257 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0025c 7412                           je         0x7f57ec4269f0
0025e 4983c202                       add        r10, 2
00262 4983fa22                       cmp        r10, 0x22
00266 75ef                           jne        0x7f57ec4269d7
00268 41ba1d000000                   mov        r10d, 0x1d
0026e eb11                           jmp        0x7f57ec426a01
00270 50                             push       rax
00271 4833c0                         xor        rax, rax
00274 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
0027a 58                             pop        rax
0027b ebbe                           jmp        0x7f57ec4269bb
0027d 4983c201                       add        r10, 1
00281 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00286 48be187e08a200000000           movabs     rsi, 0xa2087e18
00290 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00293 83c302                         add        ebx, 2
00296 895e70                         mov        dword ptr [rsi + 0x70], ebx
00299 81e3feff1f00                   and        ebx, 0x1ffffe
0029f 85db                           test       ebx, ebx
002a1 0f84e5000000                   je         0x7f57ec426b0c
002a7 48be187e08a200000000           movabs     rsi, 0xa2087e18
002b1 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
002b7 e9ccfdffff                     jmp        0x7f57ec426808
002bc 48895c2478                     mov        qword ptr [rsp + 0x78], rbx
002c1 48bec07b48dc577f0000           movabs     rsi, 0x7f57dc487bc0
002cb 4883863801000001               add        qword ptr [rsi + 0x138], 1
002d3 e888237420                     call       0x7f580cb68de0
002d8 0f1f840000000000               nop        dword ptr [rax + rax]
002e0 488b542458                     mov        rdx, qword ptr [rsp + 0x58]
002e5 48894228                       mov        qword ptr [rdx + 0x28], rax
002e9 41ba00000000                   mov        r10d, 0
002ef 4c895218                       mov        qword ptr [rdx + 0x18], r10
002f3 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
002f8 c4e1fb2ac3                     vcvtsi2sd  xmm0, xmm0, rbx
002fd c5fb114210                     vmovsd     qword ptr [rdx + 0x10], xmm0
00302 4881c490000000                 add        rsp, 0x90
00309 5d                             pop        rbp
0030a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0030e 0f8799000000                   ja         0x7f57ec426b2d
00314 c3                             ret        
00315 49baa09344dc577f0000           movabs     r10, 0x7f57dc4493a0
0031f 4c89542408                     mov        qword ptr [rsp + 8], r10
00324 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0032c e8afb75907                     call       0x7f57f39c2260
00331 e918fdffff                     jmp        0x7f57ec4267ce
00336 e8254f5907                     call       0x7f57f39bb9e0
0033b e8204f5907                     call       0x7f57f39bb9e0
00340 49baa09344dc577f0000           movabs     r10, 0x7f57dc4493a0
0034a 4c89542408                     mov        qword ptr [rsp + 8], r10
0034f 48c7042421000000               mov        qword ptr [rsp], 0x21
00357 e884b75907                     call       0x7f57f39c2260
0035c e9a0fdffff                     jmp        0x7f57ec426881
00361 e8fa4e5907                     call       0x7f57f39bb9e0
00366 49bad0c045dc577f0000           movabs     r10, 0x7f57dc45c0d0
00370 4c89542408                     mov        qword ptr [rsp + 8], r10
00375 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0037d e85eb75907                     call       0x7f57f39c2260
00382 e94bfeffff                     jmp        0x7f57ec426952
00387 e8d44e5907                     call       0x7f57f39bb9e0
0038c 49baa87045dc577f0000           movabs     r10, 0x7f57dc4570a8
00396 4c89542408                     mov        qword ptr [rsp + 8], r10
0039b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
003a3 e838b75907                     call       0x7f57f39c2260
003a8 e9fafeffff                     jmp        0x7f57ec426a27
003ad 49ba8a6a42ec577f0000           movabs     r10, 0x7f57ec426a8a
003b7 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
003be e99d634d07                     jmp        0x7f57f38fcee0
003c3 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
003ca 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
003d5 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
003e0 4881c490000000                 add        rsp, 0x90
003e7 5d                             pop        rbp
003e8 e9733f5907                     jmp        0x7f57f39baae0
003ed f4                             hlt        
003ee f4                             hlt        
003ef f4                             hlt        
