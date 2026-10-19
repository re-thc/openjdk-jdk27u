00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4883ec40                       sub        rsp, 0x40
0000c 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00014 0f8520030000                   jne        0x7f509fe71aba
0001a 4c8bf7                         mov        r14, rdi
0001d 488bde                         mov        rbx, rsi
00020 4889542458                     mov        qword ptr [rsp + 0x58], rdx
00025 c5f877                         vzeroupper 
00028 49ba209d01b7507f0000           movabs     r10, 0x7f50b7019d20
00032 41ffd2                         call       r10
00035 0f1f840000000000               nop        dword ptr [rax + rax]
0003d 488be8                         mov        rbp, rax
00040 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00045 4d85d2                         test       r10, r10
00048 0f84a6010000                   je         0x7f509fe71974
0004e 49894220                       mov        qword ptr [r10 + 0x20], rax
00052 4c8b6c2460                     mov        r13, qword ptr [rsp + 0x60]
00057 458b4508                       mov        r8d, dword ptr [r13 + 8]
0005b 458b5004                       mov        r10d, dword ptr [r8 + 4]
0005f 418b6d10                       mov        ebp, dword ptr [r13 + 0x10]
00063 448b5d04                       mov        r11d, dword ptr [rbp + 4]
00067 453bda                         cmp        r11d, r10d
0006a 0f82b4010000                   jb         0x7f509fe719a4
00070 4585d2                         test       r10d, r10d
00073 7631                           jbe        0x7f509fe71826
00075 4963d2                         movsxd     rdx, r10d
00078 488d7508                       lea        rsi, [rbp + 8]
0007c 498d7808                       lea        rdi, [r8 + 8]
00080 4883fa20                       cmp        rdx, 0x20
00084 774c                           ja         0x7f509fe71852
00086 4d63d2                         movsxd     r10, r10d
00089 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00090 c442a8f5db                     bzhi       r11, r11, r10
00095 c4c1fb92fb                     kmovq      k7, r11
0009a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
000a0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
000a6 458b5d10                       mov        r11d, dword ptr [r13 + 0x10]
000aa 418b6b04                       mov        ebp, dword ptr [r11 + 4]
000ae 4d85f6                         test       r14, r14
000b1 0f8455010000                   je         0x7f509fe7198c
000b7 488beb                         mov        rbp, rbx
000ba 440fb69b8c000000               movzx      r11d, byte ptr [rbx + 0x8c]
000c2 bb01000000                     mov        ebx, 1
000c7 4585db                         test       r11d, r11d
000ca 0f85a0000000                   jne        0x7f509fe718f0
000d0 eb59                           jmp        0x7f509fe718ab
000d2 c5f877                         vzeroupper 
000d5 49ba60378e9f507f0000           movabs     r10, 0x7f509f8e3760
000df 41ffd2                         call       r10
000e2 0f1f840000000000               nop        dword ptr [rax + rax]
000ea ebba                           jmp        0x7f509fe71826
000ec 4d63d2                         movsxd     r10, r10d
000ef 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
000f6 c442a8f5db                     bzhi       r11, r11, r10
000fb c4c1fb92fb                     kmovq      k7, r11
00100 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00106 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0010c 458b5d10                       mov        r11d, dword ptr [r13 + 0x10]
00110 458b5b04                       mov        r11d, dword ptr [r11 + 4]
00114 440fb6958c000000               movzx      r10d, byte ptr [rbp + 0x8c]
0011c 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00120 48ffc3                         inc        rbx
00123 418503                         test       dword ptr [r11], eax
00126 4585d2                         test       r10d, r10d
00129 7545                           jne        0x7f509fe718f0
0012b 458b4d08                       mov        r9d, dword ptr [r13 + 8]
0012f 458b5104                       mov        r10d, dword ptr [r9 + 4]
00133 418b4d10                       mov        ecx, dword ptr [r13 + 0x10]
00137 448b5904                       mov        r11d, dword ptr [rcx + 4]
0013b 453bda                         cmp        r11d, r10d
0013e 7277                           jb         0x7f509fe71937
00140 4585d2                         test       r10d, r10d
00143 76c7                           jbe        0x7f509fe7188c
00145 488d7108                       lea        rsi, [rcx + 8]
00149 498d7908                       lea        rdi, [r9 + 8]
0014d 4963d2                         movsxd     rdx, r10d
00150 4883fa20                       cmp        rdx, 0x20
00154 7696                           jbe        0x7f509fe7186c
00156 c5f877                         vzeroupper 
00159 49ba60378e9f507f0000           movabs     r10, 0x7f509f8e3760
00163 41ffd2                         call       r10
00166 0f1f840000000000               nop        dword ptr [rax + rax]
0016e eb9c                           jmp        0x7f509fe7188c
00170 c5f877                         vzeroupper 
00173 49ba209d01b7507f0000           movabs     r10, 0x7f50b7019d20
0017d 41ffd2                         call       r10
00180 0f1f840000000000               nop        dword ptr [rax + rax]
00188 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0018d 49894228                       mov        qword ptr [r10 + 0x28], rax
00191 4d896218                       mov        qword ptr [r10 + 0x18], r12
00195 c5f9efc0                       vpxor      xmm0, xmm0, xmm0
00199 c4e1fb2ac3                     vcvtsi2sd  xmm0, xmm0, rbx
0019e c4c17b114210                   vmovsd     qword ptr [r10 + 0x10], xmm0
001a4 c5f877                         vzeroupper 
001a7 4883c440                       add        rsp, 0x40
001ab 5d                             pop        rbp
001ac 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001b0 0f876e010000                   ja         0x7f509fe71aa4
001b6 c3                             ret        
001b7 beccffffff                     mov        esi, 0xffffffcc
001bc 48ff742458                     push       qword ptr [rsp + 0x58]
001c1 488f442450                     pop        qword ptr [rsp + 0x50]
001c6 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
001cb 48891c24                       mov        qword ptr [rsp], rbx
001cf 4c89742408                     mov        qword ptr [rsp + 8], r14
001d4 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
001d9 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
001dd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
001e2 6690                           nop        
001e4 c5f877                         vzeroupper 
001e7 e8f421b5ff                     call       0x7f509f9c3b60
001ec 0f1f8400e4020001               nop        dword ptr [rax + rax + 0x10002e4]
001f4 bef6ffffff                     mov        esi, 0xfffffff6
001f9 666690                         nop        
001fc c5f877                         vzeroupper 
001ff e8dc21b5ff                     call       0x7f509f9c3b60
00204 0f1f8400fc020002               nop        dword ptr [rax + rax + 0x20002fc]
0020c bef6ffffff                     mov        esi, 0xfffffff6
00211 666690                         nop        
00214 c5f877                         vzeroupper 
00217 e8c421b5ff                     call       0x7f509f9c3b60
0021c 0f1f840014030003               nop        dword ptr [rax + rax + 0x3000314]
00224 beccffffff                     mov        esi, 0xffffffcc
00229 48895c2450                     mov        qword ptr [rsp + 0x50], rbx
0022e 4c89742408                     mov        qword ptr [rsp + 8], r14
00233 4c896c2410                     mov        qword ptr [rsp + 0x10], r13
00238 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0023d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00242 6690                           nop        
00244 c5f877                         vzeroupper 
00247 e89421b5ff                     call       0x7f509f9c3b60
0024c 0f1f840044030004               nop        dword ptr [rax + rax + 0x4000344]
00254 bef6ffffff                     mov        esi, 0xfffffff6
00259 666690                         nop        
0025c c5f877                         vzeroupper 
0025f e87c21b5ff                     call       0x7f509f9c3b60
00264 0f1f84005c030005               nop        dword ptr [rax + rax + 0x500035c]
0026c bef6ffffff                     mov        esi, 0xfffffff6
00271 418be9                         mov        ebp, r9d
00274 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00279 666690                         nop        
0027c c5f877                         vzeroupper 
0027f e85c21b5ff                     call       0x7f509f9c3b60
00284 0f1f84007c030006               nop        dword ptr [rax + rax + 0x600037c]
0028c bef6ffffff                     mov        esi, 0xfffffff6
00291 666690                         nop        
00294 c5f877                         vzeroupper 
00297 e84421b5ff                     call       0x7f509f9c3b60
0029c 0f1f840094030007               nop        dword ptr [rax + rax + 0x7000394]
002a4 bef6ffffff                     mov        esi, 0xfffffff6
002a9 666690                         nop        
002ac c5f877                         vzeroupper 
002af e82c21b5ff                     call       0x7f509f9c3b60
002b4 0f1f8400ac030008               nop        dword ptr [rax + rax + 0x80003ac]
002bc bef6ffffff                     mov        esi, 0xfffffff6
002c1 666690                         nop        
002c4 c5f877                         vzeroupper 
002c7 e81421b5ff                     call       0x7f509f9c3b60
002cc 0f1f8400c4030009               nop        dword ptr [rax + rax + 0x90003c4]
002d4 bef6ffffff                     mov        esi, 0xfffffff6
002d9 418be8                         mov        ebp, r8d
002dc 4489542450                     mov        dword ptr [rsp + 0x50], r10d
002e1 666690                         nop        
002e4 c5f877                         vzeroupper 
002e7 e8f420b5ff                     call       0x7f509f9c3b60
002ec 0f1f8400e403000a               nop        dword ptr [rax + rax + 0xa0003e4]
002f4 bef6ffffff                     mov        esi, 0xfffffff6
002f9 666690                         nop        
002fc c5f877                         vzeroupper 
002ff e8dc20b5ff                     call       0x7f509f9c3b60
00304 0f1f8400fc03000b               nop        dword ptr [rax + rax + 0xb0003fc]
0030c bef6ffffff                     mov        esi, 0xfffffff6
00311 666690                         nop        
00314 c5f877                         vzeroupper 
00317 e8c420b5ff                     call       0x7f509f9c3b60
0031c 0f1f84001404000c               nop        dword ptr [rax + rax + 0xc000414]
00324 49ba2c19e79f507f0000           movabs     r10, 0x7f509fe7192c
0032e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00335 e926b4a8ff                     jmp        0x7f509f8fcee0
0033a e8e17fa7ff                     call       0x7f509f8e9aa0
0033f e9d6fcffff                     jmp        0x7f509fe7179a
00344 f4                             hlt        
00345 f4                             hlt        
00346 f4                             hlt        
00347 f4                             hlt        
