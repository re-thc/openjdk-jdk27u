00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec90000000                 sub        rsp, 0x90
0000f 90                             nop        
00010 41817f2003000000               cmp        dword ptr [r15 + 0x20], 3
00018 0f8514030000                   jne        0x7fd59008d1b2
0001e 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
00023 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
00028 4889542408                     mov        qword ptr [rsp + 8], rdx
0002d 48893424                       mov        qword ptr [rsp], rsi
00031 4d8bd0                         mov        r10, r8
00034 458b4004                       mov        r8d, dword ptr [r8 + 4]
00038 4183f80b                       cmp        r8d, 0xb
0003c 0f8662020000                   jbe        0x7fd59008d124
00042 4d8b5a60                       mov        r11, qword ptr [r10 + 0x60]
00046 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0004b 4d8b6a58                       mov        r13, qword ptr [r10 + 0x58]
0004f 4d8b5a50                       mov        r11, qword ptr [r10 + 0x50]
00053 4d8b4248                       mov        r8, qword ptr [r10 + 0x48]
00057 4d8b4a40                       mov        r9, qword ptr [r10 + 0x40]
0005b 498b4a38                       mov        rcx, qword ptr [r10 + 0x38]
0005f 498b5a30                       mov        rbx, qword ptr [r10 + 0x30]
00063 498b7a28                       mov        rdi, qword ptr [r10 + 0x28]
00067 498b5220                       mov        rdx, qword ptr [r10 + 0x20]
0006b 498b7218                       mov        rsi, qword ptr [r10 + 0x18]
0006f 498b4210                       mov        rax, qword ptr [r10 + 0x10]
00073 4d8b7208                       mov        r14, qword ptr [r10 + 8]
00077 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0007c 4585d2                         test       r10d, r10d
0007f 0f8ee6010000                   jle        0x7fd59008d0eb
00085 33ed                           xor        ebp, ebp
00087 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0008c 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
00091 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00096 4c89442438                     mov        qword ptr [rsp + 0x38], r8
0009b 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
000a0 48894c2460                     mov        qword ptr [rsp + 0x60], rcx
000a5 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
000aa 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
000af 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000b4 4889742448                     mov        qword ptr [rsp + 0x48], rsi
000b9 4889442440                     mov        qword ptr [rsp + 0x40], rax
000be 896c2478                       mov        dword ptr [rsp + 0x78], ebp
000c2 eb13                           jmp        0x7fd59008cf57
000c4 90                             nop        
000c5 90                             nop        
000c6 90                             nop        
000c7 90                             nop        
000c8 90                             nop        
000c9 90                             nop        
000ca 90                             nop        
000cb 90                             nop        
000cc 90                             nop        
000cd 90                             nop        
000ce 90                             nop        
000cf 90                             nop        
000d0 896c2478                       mov        dword ptr [rsp + 0x78], ebp
000d4 4d8bf2                         mov        r14, r10
000d7 498bee                         mov        rbp, r14
000da 4c33742430                     xor        r14, qword ptr [rsp + 0x30]
000df c463fbf054243807               rorx       r10, qword ptr [rsp + 0x38], 7
000e7 4d03f2                         add        r14, r10
000ea 4c89742418                     mov        qword ptr [rsp + 0x18], r14
000ef 8b742478                       mov        esi, dword ptr [rsp + 0x78]
000f3 488b1424                       mov        rdx, qword ptr [rsp]
000f7 488b4c2408                     mov        rcx, qword ptr [rsp + 8]
000fc 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
00101 90                             nop        
00102 90                             nop        
00103 e8d8fc0700                     call       0x7fd59010cc60
00108 0f1f840000020000               nop        dword ptr [rax + rax + 0x200]
00110 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00115 4c03542418                     add        r10, qword ptr [rsp + 0x18]
0011a 4c03d0                         add        r10, rax
0011d c443fbf0d234                   rorx       r10, r10, 0x34
00123 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00128 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0012d 4c03542418                     add        r10, qword ptr [rsp + 0x18]
00132 4c03d0                         add        r10, rax
00135 c443fbf0d235                   rorx       r10, r10, 0x35
0013b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00140 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00145 4c03542418                     add        r10, qword ptr [rsp + 0x18]
0014a 4c03d0                         add        r10, rax
0014d c443fbf0d23b                   rorx       r10, r10, 0x3b
00153 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00158 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0015d 4c03542418                     add        r10, qword ptr [rsp + 0x18]
00162 4c03d0                         add        r10, rax
00165 c443fbf0d237                   rorx       r10, r10, 0x37
0016b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00170 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
00175 4803e8                         add        rbp, rax
00178 c463fbf0d53f                   rorx       r10, rbp, 0x3f
0017e 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00183 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
00188 4c03d8                         add        r11, rax
0018b c443fbf0db3e                   rorx       r11, r11, 0x3e
00191 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00196 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0019b 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
001a0 4c03d8                         add        r11, rax
001a3 c443fbf0db3d                   rorx       r11, r11, 0x3d
001a9 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
001ae 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
001b3 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
001b8 4c03d8                         add        r11, rax
001bb c443fbf0db3c                   rorx       r11, r11, 0x3c
001c1 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
001c6 488b6c2458                     mov        rbp, qword ptr [rsp + 0x58]
001cb 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
001d0 4803e8                         add        rbp, rax
001d3 c4e3fbf0ed3a                   rorx       rbp, rbp, 0x3a
001d9 48896c2458                     mov        qword ptr [rsp + 0x58], rbp
001de 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
001e3 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
001e8 4803e8                         add        rbp, rax
001eb c4e3fbf0ed39                   rorx       rbp, rbp, 0x39
001f1 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001f6 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
001fb 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
00200 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00205 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
0020a 4803e8                         add        rbp, rax
0020d 4c03d8                         add        r11, rax
00210 c4e3fbf0ed38                   rorx       rbp, rbp, 0x38
00216 48896c2468                     mov        qword ptr [rsp + 0x68], rbp
0021b c4c3fbf0eb36                   rorx       rbp, r11, 0x36
00221 48896c2470                     mov        qword ptr [rsp + 0x70], rbp
00226 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
0022a ffc5                           inc        ebp
0022c 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
00230 0f8c9afeffff                   jl         0x7fd59008cf50
00236 4c8b6c2428                     mov        r13, qword ptr [rsp + 0x28]
0023b 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00240 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00245 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
0024a 488b4c2460                     mov        rcx, qword ptr [rsp + 0x60]
0024f 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00254 488b7c2430                     mov        rdi, qword ptr [rsp + 0x30]
00259 488b542450                     mov        rdx, qword ptr [rsp + 0x50]
0025e 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00263 488b442440                     mov        rax, qword ptr [rsp + 0x40]
00268 4d8bf2                         mov        r14, r10
0026b 4c03f0                         add        r14, rax
0026e 4903f6                         add        rsi, r14
00271 4803d6                         add        rdx, rsi
00274 4803fa                         add        rdi, rdx
00277 4803df                         add        rbx, rdi
0027a 4803cb                         add        rcx, rbx
0027d 4c03c9                         add        r9, rcx
00280 4d03c1                         add        r8, r9
00283 4d03d8                         add        r11, r8
00286 4d03eb                         add        r13, r11
00289 488b442420                     mov        rax, qword ptr [rsp + 0x20]
0028e 4903c5                         add        rax, r13
00291 4881c490000000                 add        rsp, 0x90
00298 5d                             pop        rbp
00299 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0029d 0f8779000000                   ja         0x7fd59008d19c
002a3 c3                             ret        
002a4 bee4ffffff                     mov        esi, 0xffffffe4
002a9 488b2c24                       mov        rbp, qword ptr [rsp]
002ad 48891424                       mov        qword ptr [rsp], rdx
002b1 48894c2408                     mov        qword ptr [rsp + 8], rcx
002b6 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
002bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
002c0 90                             nop        
002c1 90                             nop        
002c2 90                             nop        
002c3 e898430200                     call       0x7fd5900b14e0
002c8 0f1f8400c0030001               nop        dword ptr [rax + rax + 0x10003c0]
002d0 48bff04b0b70d57f0000           movabs     rdi, 0x7fd5700b4bf0
002da 4883e4f0                       and        rsp, 0xfffffffffffffff0
002de e8fda3c312                     call       0x7fd5a2cc7560
002e3 f4                             hlt        
002e4 488bf0                         mov        rsi, rax
002e7 4881c490000000                 add        rsp, 0x90
002ee 5d                             pop        rbp
002ef e9ec8d0100                     jmp        0x7fd5900a5f60
002f4 bef6ffffff                     mov        esi, 0xfffffff6
002f9 90                             nop        
002fa 90                             nop        
002fb e860430200                     call       0x7fd5900b14e0
00300 0f1f8400f8030002               nop        dword ptr [rax + rax + 0x20003f8]
00308 48bff04b0b70d57f0000           movabs     rdi, 0x7fd5700b4bf0
00312 4883e4f0                       and        rsp, 0xfffffffffffffff0
00316 e8c5a3c312                     call       0x7fd5a2cc7560
0031b f4                             hlt        
0031c 49ba19d10890d57f0000           movabs     r10, 0x7fd59008d119
00326 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0032d e9ae210800                     jmp        0x7fd59010f360
00332 e8a9f10600                     call       0x7fd5900fc360
00337 e9e2fcffff                     jmp        0x7fd59008ce9e
0033c f4                             hlt        
0033d f4                             hlt        
0033e f4                             hlt        
0033f f4                             hlt        
