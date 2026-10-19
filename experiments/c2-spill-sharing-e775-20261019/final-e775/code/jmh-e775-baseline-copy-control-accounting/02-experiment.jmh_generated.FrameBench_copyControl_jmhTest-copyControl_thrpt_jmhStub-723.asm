00000 e87b721a17                     call       0x7f50b7018580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4883ec60                       sub        rsp, 0x60
0001c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00024 0f85e4020000                   jne        0x7f509fe7160e
0002a 488b5e60                       mov        rbx, qword ptr [rsi + 0x60]
0002e 4c8b5658                       mov        r10, qword ptr [rsi + 0x58]
00032 4c891424                       mov        qword ptr [rsp], r10
00036 4c8b16                         mov        r10, qword ptr [rsi]
00039 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0003e 488b6e38                       mov        rbp, qword ptr [rsi + 0x38]
00042 4c8b7620                       mov        r14, qword ptr [rsi + 0x20]
00046 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
0004a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0004f 488bfe                         mov        rdi, rsi
00052 c5f877                         vzeroupper 
00055 49bac0ec0fb7507f0000           movabs     r10, 0x7f50b70fecc0
0005f 41ffd2                         call       r10
00062 0f1f840000000000               nop        dword ptr [rax + rax]
0006a 4885db                         test       rbx, rbx
0006d 0f84a1010000                   je         0x7f509fe71514
00073 4c8bd3                         mov        r10, rbx
00076 448b1b                         mov        r11d, dword ptr [rbx]
00079 41c1eb0d                       shr        r11d, 0xd
0007d 4181fb66410000                 cmp        r11d, 0x4166
00084 0f85ce010000                   jne        0x7f509fe71558
0008a 4c8beb                         mov        r13, rbx
0008d 4c8b0424                       mov        r8, qword ptr [rsp]
00091 4d85c0                         test       r8, r8
00094 0f8485010000                   je         0x7f509fe7151f
0009a 458b18                         mov        r11d, dword ptr [r8]
0009d 41c1eb0d                       shr        r11d, 0xd
000a1 4181fb67410000                 cmp        r11d, 0x4167
000a8 0f85ae010000                   jne        0x7f509fe7155c
000ae 498bd8                         mov        rbx, r8
000b1 4885ed                         test       rbp, rbp
000b4 0f846c010000                   je         0x7f509fe71526
000ba 448b4d00                       mov        r9d, dword ptr [rbp]
000be 41c1e90d                       shr        r9d, 0xd
000c2 4181f97b410000                 cmp        r9d, 0x417b
000c9 0f858d010000                   jne        0x7f509fe7155c
000cf 488bcd                         mov        rcx, rbp
000d2 458b1e                         mov        r11d, dword ptr [r14]
000d5 41c1eb0d                       shr        r11d, 0xd
000d9 4181fb71410000                 cmp        r11d, 0x4171
000e0 0f8576010000                   jne        0x7f509fe7155c
000e6 4885c9                         test       rcx, rcx
000e9 0f8441010000                   je         0x7f509fe71530
000ef 4d85ed                         test       r13, r13
000f2 0f8438010000                   je         0x7f509fe71530
000f8 eb49                           jmp        0x7f509fe71443
000fa 4d63d0                         movsxd     r10, r8d
000fd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00104 c442a8f5db                     bzhi       r11, r11, r10
00109 c4c1fb92fb                     kmovq      k7, r11
0010e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00114 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0011a 458b5e10                       mov        r11d, dword ptr [r14 + 0x10]
0011e 458b5304                       mov        r10d, dword ptr [r11 + 4]
00122 450fb6858c000000               movzx      r8d, byte ptr [r13 + 0x8c]
0012a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0012e 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00133 49ffc3                         inc        r11
00136 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0013b 418502                         test       dword ptr [r10], eax
0013e 4585c0                         test       r8d, r8d
00141 754f                           jne        0x7f509fe71492
00143 458b5608                       mov        r10d, dword ptr [r14 + 8]
00147 458b4204                       mov        r8d, dword ptr [r10 + 4]
0014b 458b5e10                       mov        r11d, dword ptr [r14 + 0x10]
0014f 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00153 453bc8                         cmp        r9d, r8d
00156 0f8281000000                   jb         0x7f509fe714dd
0015c 4585c0                         test       r8d, r8d
0015f 76b9                           jbe        0x7f509fe7141a
00161 4963d0                         movsxd     rdx, r8d
00164 498d7308                       lea        rsi, [r11 + 8]
00168 498d7a08                       lea        rdi, [r10 + 8]
0016c 4883fa20                       cmp        rdx, 0x20
00170 7688                           jbe        0x7f509fe713fa
00172 488be9                         mov        rbp, rcx
00175 c5f877                         vzeroupper 
00178 49ba60378e9f507f0000           movabs     r10, 0x7f509f8e3760
00182 41ffd2                         call       r10
00185 0f1f840000000000               nop        dword ptr [rax + rax]
0018d 488bcd                         mov        rcx, rbp
00190 eb88                           jmp        0x7f509fe7141a
00192 c5f877                         vzeroupper 
00195 49ba209d01b7507f0000           movabs     r10, 0x7f50b7019d20
0019f 41ffd2                         call       r10
001a2 0f1f840000000000               nop        dword ptr [rax + rax]
001aa 48894328                       mov        qword ptr [rbx + 0x28], rax
001ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
001b3 4c895318                       mov        qword ptr [rbx + 0x18], r10
001b7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
001bc c5f9efc0                       vpxor      xmm0, xmm0, xmm0
001c0 c4c1fb2ac2                     vcvtsi2sd  xmm0, xmm0, r10
001c5 c5fb114310                     vmovsd     qword ptr [rbx + 0x10], xmm0
001ca c5f877                         vzeroupper 
001cd 4883c460                       add        rsp, 0x60
001d1 5d                             pop        rbp
001d2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001d6 0f871c010000                   ja         0x7f509fe715f8
001dc c3                             ret        
001dd beccffffff                     mov        esi, 0xffffffcc
001e2 498bed                         mov        rbp, r13
001e5 48891c24                       mov        qword ptr [rsp], rbx
001e9 48894c2428                     mov        qword ptr [rsp + 0x28], rcx
001ee 4c89742430                     mov        qword ptr [rsp + 0x30], r14
001f3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
001f8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
001fd 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00202 6690                           nop        
00204 c5f877                         vzeroupper 
00207 e85426b5ff                     call       0x7f509f9c3b60
0020c 0f1f840004030001               nop        dword ptr [rax + rax + 0x1000304]
00214 4c8bd3                         mov        r10, rbx
00217 4533ed                         xor        r13d, r13d
0021a e96efeffff                     jmp        0x7f509fe7138d
0021f 33db                           xor        ebx, ebx
00221 e98bfeffff                     jmp        0x7f509fe713b1
00226 33c9                           xor        ecx, ecx
00228 e9a5feffff                     jmp        0x7f509fe713d2
0022d 4533f6                         xor        r14d, r14d
00230 be6effffff                     mov        esi, 0xffffff6e
00235 498bed                         mov        rbp, r13
00238 48891c24                       mov        qword ptr [rsp], rbx
0023c 48894c2408                     mov        qword ptr [rsp + 8], rcx
00241 4c89742410                     mov        qword ptr [rsp + 0x10], r14
00246 6690                           nop        
00248 c5f877                         vzeroupper 
0024b e81026b5ff                     call       0x7f509f9c3b60
00250 0f1f840048030002               nop        dword ptr [rax + rax + 0x2000348]
00258 4c8b0424                       mov        r8, qword ptr [rsp]
0025c be85ffffff                     mov        esi, 0xffffff85
00261 4c893424                       mov        qword ptr [rsp], r14
00265 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0026a 4c895c2408                     mov        qword ptr [rsp + 8], r11
0026f 48ff742420                     push       qword ptr [rsp + 0x20]
00274 488f442410                     pop        qword ptr [rsp + 0x10]
00279 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0027e 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00283 90                             nop        
00284 c5f877                         vzeroupper 
00287 e8d425b5ff                     call       0x7f509f9c3b60
0028c 0f1f840084030003               nop        dword ptr [rax + rax + 0x3000384]
00294 bef6ffffff                     mov        esi, 0xfffffff6
00299 666690                         nop        
0029c c5f877                         vzeroupper 
0029f e8bc25b5ff                     call       0x7f509f9c3b60
002a4 0f1f84009c030004               nop        dword ptr [rax + rax + 0x400039c]
002ac bef6ffffff                     mov        esi, 0xfffffff6
002b1 418bea                         mov        ebp, r10d
002b4 44890424                       mov        dword ptr [rsp], r8d
002b8 c5f877                         vzeroupper 
002bb e8a025b5ff                     call       0x7f509f9c3b60
002c0 0f1f8400b8030005               nop        dword ptr [rax + rax + 0x50003b8]
002c8 bef6ffffff                     mov        esi, 0xfffffff6
002cd 666690                         nop        
002d0 c5f877                         vzeroupper 
002d3 e88825b5ff                     call       0x7f509f9c3b60
002d8 0f1f8400d0030006               nop        dword ptr [rax + rax + 0x60003d0]
002e0 bef6ffffff                     mov        esi, 0xfffffff6
002e5 488be8                         mov        rbp, rax
002e8 c5f877                         vzeroupper 
002eb e87025b5ff                     call       0x7f509f9c3b60
002f0 0f1f8400e8030007               nop        dword ptr [rax + rax + 0x70003e8]
002f8 49bad214e79f507f0000           movabs     r10, 0x7f509fe714d2
00302 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00309 e9d2b8a8ff                     jmp        0x7f509f8fcee0
0030e e88d84a7ff                     call       0x7f509f8e9aa0
00313 e912fdffff                     jmp        0x7f509fe7132a
