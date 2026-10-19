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
0001a 0f854097b5ff                   jne        0x7f431372ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f853b110000                   jne        0x7f4313bd6779
0003e 448bef                         mov        r13d, edi
00041 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00046 498bd8                         mov        rbx, r8
00049 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004d 4c8bf6                         mov        r14, rsi
00050 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00054 448b4604                       mov        r8d, dword ptr [rsi + 4]
00058 458bd8                         mov        r11d, r8d
0005b 452bda                         sub        r11d, r10d
0005e 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00066 453bcb                         cmp        r9d, r11d
00069 0f8f410b0000                   jg         0x7f4313bd61b0
0006f 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00073 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00078 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007c 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00084 4963fa                         movsxd     rdi, r10d
00087 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008c 4c2bdf                         sub        r11, rdi
0008f 4d3bcb                         cmp        r9, r11
00092 0f8f500b0000                   jg         0x7f4313bd61e8
00098 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009c 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a1 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a5 8b4e40                         mov        ecx, dword ptr [rsi + 0x40]
000a8 4d85db                         test       r11, r11
000ab 0f85e3070000                   jne        0x7f4313bd5e94
000b1 4903f9                         add        rdi, r9
000b4 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b9 0f8f650b0000                   jg         0x7f4313bd6224
000bf 488bfa                         mov        rdi, rdx
000c2 8b7204                         mov        esi, dword ptr [rdx + 4]
000c5 4533c9                         xor        r9d, r9d
000c8 458bdd                         mov        r11d, r13d
000cb 4585db                         test       r11d, r11d
000ce 0f8ee8020000                   jle        0x7f4313bd59bc
000d4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d9 448d6ee0                       lea        r13d, [rsi - 0x20]
000dd 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e2 4183c0e0                       add        r8d, -0x20
000e6 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
000eb 49f7d9                         neg        r9
000ee 448b5304                       mov        r10d, dword ptr [rbx + 4]
000f2 4585d2                         test       r10d, r10d
000f5 0f8605070000                   jbe        0x7f4313bd5e00
000fb 4963d3                         movsxd     rdx, r11d
000fe 4d63d2                         movsxd     r10, r10d
00101 48ffca                         dec        rdx
00104 493bd2                         cmp        rdx, r10
00107 0f83f3060000                   jae        0x7f4313bd5e00
0010d 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00115 8b5504                         mov        edx, dword ptr [rbp + 4]
00118 85d2                           test       edx, edx
0011a 0f86f0070000                   jbe        0x7f4313bd5f10
00120 448d56f1                       lea        r10d, [rsi - 0xf]
00124 4585d2                         test       r10d, r10d
00127 0f8ce3070000                   jl         0x7f4313bd5f10
0012d 8b4104                         mov        eax, dword ptr [rcx + 4]
00130 448d50f1                       lea        r10d, [rax - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8cd3070000                   jl         0x7f4313bd5f10
0013d 89542418                       mov        dword ptr [rsp + 0x18], edx
00141 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00146 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0014b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00150 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00158 488f442458                     pop        qword ptr [rsp + 0x58]
0015d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00162 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00167 48897c2450                     mov        qword ptr [rsp + 0x50], rdi
0016c 4c89b424c8000000               mov        qword ptr [rsp + 0xc8], r14
00174 89b424c4000000                 mov        dword ptr [rsp + 0xc4], esi
0017b 4c8bd1                         mov        r10, rcx
0017e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00183 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00187 83c6f1                         add        esi, -0xf
0018a 8974246c                       mov        dword ptr [rsp + 0x6c], esi
0018e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00192 83c0f1                         add        eax, -0xf
00195 89442478                       mov        dword ptr [rsp + 0x78], eax
00199 4533c9                         xor        r9d, r9d
0019c 4533c0                         xor        r8d, r8d
0019f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001a4 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
001a9 4d8bd3                         mov        r10, r11
001ac 49c1ea12                       shr        r10, 0x12
001b0 458bd2                         mov        r10d, r10d
001b3 4181e2ffff0300                 and        r10d, 0x3ffff
001ba 458bea                         mov        r13d, r10d
001bd 498bcb                         mov        rcx, r11
001c0 48c1f924                       sar        rcx, 0x24
001c4 458bd3                         mov        r10d, r11d
001c7 8bd9                           mov        ebx, ecx
001c9 4181e2ffff0100                 and        r10d, 0x1ffff
001d0 85db                           test       ebx, ebx
001d2 0f8cbc0a0000                   jl         0x7f4313bd6294
001d8 4585d2                         test       r10d, r10d
001db 0f84f7020000                   je         0x7f4313bd5ad8
001e1 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e5 412be9                         sub        ebp, r9d
001e8 443bd5                         cmp        r10d, ebp
001eb 0f8fef0b0000                   jg         0x7f4313bd63e0
001f1 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
001f9 83fb03                         cmp        ebx, 3
001fc 0f8fe6020000                   jg         0x7f4313bd5ae8
00202 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0020a 4585d2                         test       r10d, r10d
0020d 0f84010c0000                   je         0x7f4313bd6414
00213 83fb01                         cmp        ebx, 1
00216 0f85d8070000                   jne        0x7f4313bd5ff4
0021c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00221 458b5208                       mov        r10d, dword ptr [r10 + 8]
00225 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0022d 48638c2490000000               movsxd     rcx, dword ptr [rsp + 0x90]
00235 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
0023a 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0023f 4c03d1                         add        r10, rcx
00242 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0024a 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00252 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0025a 0f8fe00a0000                   jg         0x7f4313bd6340
00260 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00268 4585d2                         test       r10d, r10d
0026b 0f8e51070000                   jle        0x7f4313bd5fc2
00271 458bd1                         mov        r10d, r9d
00274 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0027c 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00281 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00286 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
0028e 4503dd                         add        r11d, r13d
00291 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00296 0f8f8d020000                   jg         0x7f4313bd5b29
0029c 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
002a1 0f8f210c0000                   jg         0x7f4313bd64c8
002a7 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
002af 4183fb10                       cmp        r11d, 0x10
002b3 0f8fa30c0000                   jg         0x7f4313bd655c
002b9 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
002be 0f8338030000                   jae        0x7f4313bd5bfc
002c4 418be9                         mov        ebp, r9d
002c7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002cc c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002d3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
002d8 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
002dd 0f83ad030000                   jae        0x7f4313bd5c90
002e3 4403dd                         add        r11d, ebp
002e6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
002eb 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002f3 4503ca                         add        r9d, r10d
002f6 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
002fe 4963d2                         movsxd     rdx, r10d
00301 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00306 c4c17a7f441308                 vmovdqu    xmmword ptr [r11 + rdx + 8], xmm0
0030d 418be9                         mov        ebp, r9d
00310 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00317 458bd5                         mov        r10d, r13d
0031a 4183fa10                       cmp        r10d, 0x10
0031e 0f8ecc0c0000                   jle        0x7f4313bd65f0
00324 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0032c 453bda                         cmp        r11d, r10d
0032f 0f8c73070000                   jl         0x7f4313bd60a8
00335 4183fa30                       cmp        r10d, 0x30
00339 0f8eed070000                   jle        0x7f4313bd612c
0033f 85ed                           test       ebp, ebp
00341 0f8cef030000                   jl         0x7f4313bd5d36
00347 4585c9                         test       r9d, r9d
0034a 0f8ce6030000                   jl         0x7f4313bd5d36
00350 458d0c2a                       lea        r9d, [r10 + rbp]
00354 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00359 453bd9                         cmp        r11d, r9d
0035c 0f82d4030000                   jb         0x7f4313bd5d36
00362 418bda                         mov        ebx, r10d
00365 039c2480000000                 add        ebx, dword ptr [rsp + 0x80]
0036c 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00370 443bdb                         cmp        r11d, ebx
00373 0f82bd030000                   jb         0x7f4313bd5d36
00379 4585d2                         test       r10d, r10d
0037c 0f84aa030000                   je         0x7f4313bd5d2c
00382 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00387 498d7c2a08                     lea        rdi, [r10 + rbp + 8]
0038c 4803ca                         add        rcx, rdx
0038f 498d740a08                     lea        rsi, [r10 + rcx + 8]
00394 4963d5                         movsxd     rdx, r13d
00397 4883fa20                       cmp        rdx, 0x20
0039b 762e                           jbe        0x7f4313bd59cb
0039d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003a2 c5f877                         vzeroupper 
003a5 49ba40917113437f0000           movabs     r10, 0x7f4313719140
003af 41ffd2                         call       r10
003b2 0f1f840000000000               nop        dword ptr [rax + rax]
003ba eb34                           jmp        0x7f4313bd59f0
003bc 85c9                           test       ecx, ecx
003be 0f8408040000                   je         0x7f4313bd5dcc
003c4 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003c9 eb73                           jmp        0x7f4313bd5a3e
003cb 4d63d5                         movsxd     r10, r13d
003ce 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003d5 c442a8f5db                     bzhi       r11, r11, r10
003da c4c1fb92fb                     kmovq      k7, r11
003df 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003e5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003eb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003f0 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
003f5 41ffc0                         inc        r8d
003f8 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
003fd 7d0a                           jge        0x7f4313bd5a09
003ff 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00404 e996fdffff                     jmp        0x7f4313bd579f
00409 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0040e 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
00413 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00418 4585c9                         test       r9d, r9d
0041b 0f8c87050000                   jl         0x7f4313bd5fa8
00421 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
00429 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
0042e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00432 8bb424c4000000                 mov        esi, dword ptr [rsp + 0xc4]
00439 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0043e 4585d2                         test       r10d, r10d
00441 0f8c5a010000                   jl         0x7f4313bd5ba1
00447 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
0044b 0f8255010000                   jb         0x7f4313bd5ba6
00451 438d2c02                       lea        ebp, [r10 + r8]
00455 8b5904                         mov        ebx, dword ptr [rcx + 4]
00458 3bdd                           cmp        ebx, ebp
0045a 0f824b010000                   jb         0x7f4313bd5bab
00460 4585c0                         test       r8d, r8d
00463 0f8c47010000                   jl         0x7f4313bd5bb0
00469 4585c0                         test       r8d, r8d
0046c 7436                           je         0x7f4313bd5aa4
0046e 4a8d7c0f08                     lea        rdi, [rdi + r9 + 8]
00473 4c8bd9                         mov        r11, rcx
00476 4a8d741108                     lea        rsi, [rcx + r10 + 8]
0047b 4963d0                         movsxd     rdx, r8d
0047e 4883fa20                       cmp        rdx, 0x20
00482 773a                           ja         0x7f4313bd5abe
00484 4d63d0                         movsxd     r10, r8d
00487 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0048e c442a8f5db                     bzhi       r11, r11, r10
00493 c4c1fb92fb                     kmovq      k7, r11
00498 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0049e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004a4 41896e38                       mov        dword ptr [r14 + 0x38], ebp
004a8 c5f877                         vzeroupper 
004ab 4881c4b0000000                 add        rsp, 0xb0
004b2 5d                             pop        rbp
004b3 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
004b7 0f87a60c0000                   ja         0x7f4313bd6763
004bd c3                             ret        
004be c5f877                         vzeroupper 
004c1 49ba40917113437f0000           movabs     r10, 0x7f4313719140
004cb 41ffd2                         call       r10
004ce 0f1f840000000000               nop        dword ptr [rax + rax]
004d6 ebcc                           jmp        0x7f4313bd5aa4
004d8 4533d2                         xor        r10d, r10d
004db 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
004e3 e911fdffff                     jmp        0x7f4313bd57f9
004e8 83c3fd                         add        ebx, -3
004eb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004f0 4183fb02                       cmp        r11d, 2
004f4 0f867a0b0000                   jbe        0x7f4313bd6674
004fa 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004ff 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00503 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00508 45895310                       mov        dword ptr [r11 + 0x10], r10d
0050c 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00510 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00515 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00519 41895a08                       mov        dword ptr [r10 + 8], ebx
0051d 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00524 e904fdffff                     jmp        0x7f4313bd582d
00529 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0052e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00533 498bea                         mov        rbp, r10
00536 4c3b25dba8e318                 cmp        r12, qword ptr [rip + 0x18e3a8db]
0053d 0f8414000000                   je         0x7f4313bd5b57
00543 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
0054d 4883e4f0                       and        rsp, 0xfffffffffffffff0
00551 e88a902018                     call       0x7f432bddebe0
00556 f4                             hlt        
00557 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0055f 488bf5                         mov        rsi, rbp
00562 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00566 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0056b 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
00572 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0057a 44891424                       mov        dword ptr [rsp], r10d
0057e 44896c2408                     mov        dword ptr [rsp + 8], r13d
00583 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00587 90                             nop        
00588 c5f877                         vzeroupper 
0058b e8d0a0b5ff                     call       0x7f431372fc60
00590 0f1f840088060000               nop        dword ptr [rax + rax + 0x688]
00598 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0059c e94ffeffff                     jmp        0x7f4313bd59f0
005a1 418bea                         mov        ebp, r10d
005a4 eb0d                           jmp        0x7f4313bd5bb3
005a6 418bea                         mov        ebp, r10d
005a9 eb08                           jmp        0x7f4313bd5bb3
005ab 418bea                         mov        ebp, r10d
005ae eb03                           jmp        0x7f4313bd5bb3
005b0 418bea                         mov        ebp, r10d
005b3 beccffffff                     mov        esi, 0xffffffcc
005b8 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
005c0 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
005c5 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
005cd 894c240c                       mov        dword ptr [rsp + 0xc], ecx
005d1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
005d6 90                             nop        
005d7 90                             nop        
005d8 c5f877                         vzeroupper 
005db e8807eafff                     call       0x7f43136cda60
005e0 0f1f8400d8060001               nop        dword ptr [rax + rax + 0x10006d8]
005e8 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
005f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
005f6 e8e58f2018                     call       0x7f432bddebe0
005fb f4                             hlt        
005fc bee4ffffff                     mov        esi, 0xffffffe4
00601 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00609 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0060e 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00616 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0061b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00620 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00625 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0062d 48894424f8                     mov        qword ptr [rsp - 8], rax
00632 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00636 89442428                       mov        dword ptr [rsp + 0x28], eax
0063a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0063f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00644 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00649 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0064e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00653 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00658 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0065d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00662 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00667 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0066c c5f877                         vzeroupper 
0066f e8ec7dafff                     call       0x7f43136cda60
00674 0f1f84006c070002               nop        dword ptr [rax + rax + 0x200076c]
0067c 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00686 4883e4f0                       and        rsp, 0xfffffffffffffff0
0068a e8518f2018                     call       0x7f432bddebe0
0068f f4                             hlt        
00690 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00699 bee4ffffff                     mov        esi, 0xffffffe4
0069e 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
006a6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
006ae 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
006b3 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
006bb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
006c0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
006c5 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
006ca 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
006cf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
006d4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
006d9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006de 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
006e3 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
006e8 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
006ed 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
006f2 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
006f7 4489442448                     mov        dword ptr [rsp + 0x48], r8d
006fc 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00701 4489542454                     mov        dword ptr [rsp + 0x54], r10d
00706 90                             nop        
00707 90                             nop        
00708 c5f877                         vzeroupper 
0070b e8507dafff                     call       0x7f43136cda60
00710 0f1f840008080003               nop        dword ptr [rax + rax + 0x3000808]
00718 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00722 4883e4f0                       and        rsp, 0xfffffffffffffff0
00726 e8b58e2018                     call       0x7f432bddebe0
0072b f4                             hlt        
0072c 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00731 e9bafcffff                     jmp        0x7f4313bd59f0
00736 beccffffff                     mov        esi, 0xffffffcc
0073b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00743 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0074b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00750 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00758 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0075d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00762 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00767 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0076c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00771 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00776 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0077b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00780 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00785 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0078a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0078f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00794 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00799 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0079e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
007a3 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
007a8 c5f877                         vzeroupper 
007ab e8b07cafff                     call       0x7f43136cda60
007b0 0f1f8400a8080004               nop        dword ptr [rax + rax + 0x40008a8]
007b8 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
007c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007c6 e8158e2018                     call       0x7f432bddebe0
007cb f4                             hlt        
007cc bef6ffffff                     mov        esi, 0xfffffff6
007d1 488bea                         mov        rbp, rdx
007d4 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
007dc c5f877                         vzeroupper 
007df e87c7cafff                     call       0x7f43136cda60
007e4 0f1f8400dc080005               nop        dword ptr [rax + rax + 0x50008dc]
007ec 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
007f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
007fa e8e18d2018                     call       0x7f432bddebe0
007ff f4                             hlt        
00800 be6effffff                     mov        esi, 0xffffff6e
00805 498bee                         mov        rbp, r14
00808 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
00810 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00815 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0081a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0081f 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00823 48894424f8                     mov        qword ptr [rsp - 8], rax
00828 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0082c 89442428                       mov        dword ptr [rsp + 0x28], eax
00830 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00835 48894424f8                     mov        qword ptr [rsp - 8], rax
0083a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0083e 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00842 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00847 48ff742440                     push       qword ptr [rsp + 0x40]
0084c 488f442430                     pop        qword ptr [rsp + 0x30]
00851 48ff742448                     push       qword ptr [rsp + 0x48]
00856 488f442438                     pop        qword ptr [rsp + 0x38]
0085b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00860 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
00865 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0086a 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0086f 90                             nop        
00870 c5f877                         vzeroupper 
00873 e8e87bafff                     call       0x7f43136cda60
00878 0f1f840070090006               nop        dword ptr [rax + rax + 0x6000970]
00880 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
0088a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0088e e84d8d2018                     call       0x7f432bddebe0
00893 f4                             hlt        
00894 4533c9                         xor        r9d, r9d
00897 4d3bd9                         cmp        r11, r9
0089a bdffffffff                     mov        ebp, 0xffffffff
0089f 7c08                           jl         0x7f4313bd5ea9
008a1 400f95c5                       setne      bpl
008a5 400fb6ed                       movzx      ebp, bpl
008a9 be45ffffff                     mov        esi, 0xffffff45
008ae 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
008b6 4889542410                     mov        qword ptr [rsp + 0x10], rdx
008bb 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
008c0 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
008c5 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
008c9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008ce 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008d3 48ff742440                     push       qword ptr [rsp + 0x40]
008d8 488f442438                     pop        qword ptr [rsp + 0x38]
008dd 48ff742448                     push       qword ptr [rsp + 0x48]
008e2 488f442440                     pop        qword ptr [rsp + 0x40]
008e7 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
008ec c5f877                         vzeroupper 
008ef e86c7bafff                     call       0x7f43136cda60
008f4 0f1f8400ec090007               nop        dword ptr [rax + rax + 0x70009ec]
008fc 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0090a e8d18c2018                     call       0x7f432bddebe0
0090f f4                             hlt        
00910 bebeffffff                     mov        esi, 0xffffffbe
00915 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
0091d 4889bc24c8000000               mov        qword ptr [rsp + 0xc8], rdi
00925 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0092a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0092f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00934 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00938 48894424f8                     mov        qword ptr [rsp - 8], rax
0093d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00941 89442428                       mov        dword ptr [rsp + 0x28], eax
00945 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0094a 48894424f8                     mov        qword ptr [rsp - 8], rax
0094f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00953 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0095c 48ff742440                     push       qword ptr [rsp + 0x40]
00961 488f442430                     pop        qword ptr [rsp + 0x30]
00966 48ff742448                     push       qword ptr [rsp + 0x48]
0096b 488f442438                     pop        qword ptr [rsp + 0x38]
00970 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00975 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
0097a 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0097f 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00984 c5f877                         vzeroupper 
00987 e8d47aafff                     call       0x7f43136cda60
0098c 0f1f8400840a0008               nop        dword ptr [rax + rax + 0x8000a84]
00994 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
0099e 4883e4f0                       and        rsp, 0xfffffffffffffff0
009a2 e8398c2018                     call       0x7f432bddebe0
009a7 f4                             hlt        
009a8 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
009ac 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
009b4 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
009b9 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
009bd e9f1fbffff                     jmp        0x7f4313bd5bb3
009c2 be45ffffff                     mov        esi, 0xffffff45
009c7 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
009cf 90                             nop        
009d0 c5f877                         vzeroupper 
009d3 e8887aafff                     call       0x7f43136cda60
009d8 0f1f8400d00a0009               nop        dword ptr [rax + rax + 0x9000ad0]
009e0 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
009ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
009ee e8ed8b2018                     call       0x7f432bddebe0
009f3 f4                             hlt        
009f4 ffcb                           dec        ebx
009f6 be45ffffff                     mov        esi, 0xffffff45
009fb 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00a03 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a08 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00a10 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a15 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a1d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a22 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a27 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a2c 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a34 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a39 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00a3e 48894424f8                     mov        qword ptr [rsp - 8], rax
00a43 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00a47 89442428                       mov        dword ptr [rsp + 0x28], eax
00a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a50 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00a55 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a5a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00a5f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a64 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a69 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a6e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a73 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00a78 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00a7d 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00a81 90                             nop        
00a82 90                             nop        
00a83 90                             nop        
00a84 c5f877                         vzeroupper 
00a87 e8d479afff                     call       0x7f43136cda60
00a8c 0f1f8400840b000a               nop        dword ptr [rax + rax + 0xa000b84]
00a94 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aa2 e8398b2018                     call       0x7f432bddebe0
00aa7 f4                             hlt        
00aa8 be45ffffff                     mov        esi, 0xffffff45
00aad 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00ab5 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00abd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00ac2 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00aca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00acf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ad4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ad9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ade 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ae3 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00ae8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00aed 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00af2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00af7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00afc 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b01 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00b06 90                             nop        
00b07 90                             nop        
00b08 c5f877                         vzeroupper 
00b0b e85079afff                     call       0x7f43136cda60
00b10 0f1f8400080c000b               nop        dword ptr [rax + rax + 0xb000c08]
00b18 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b26 e8b58a2018                     call       0x7f432bddebe0
00b2b f4                             hlt        
00b2c be45ffffff                     mov        esi, 0xffffff45
00b31 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b39 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00b41 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00b46 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00b4e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b53 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b58 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b5d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b62 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b67 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b6c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00b71 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00b76 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00b7b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00b80 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b85 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00b8a 90                             nop        
00b8b 90                             nop        
00b8c c5f877                         vzeroupper 
00b8f e8cc78afff                     call       0x7f43136cda60
00b94 0f1f84008c0c000c               nop        dword ptr [rax + rax + 0xc000c8c]
00b9c 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00baa e8318a2018                     call       0x7f432bddebe0
00baf f4                             hlt        
00bb0 be45ffffff                     mov        esi, 0xffffff45
00bb5 8bac24c0000000                 mov        ebp, dword ptr [rsp + 0xc0]
00bbc 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00bc4 c5f877                         vzeroupper 
00bc7 e89478afff                     call       0x7f43136cda60
00bcc 0f1f8400c40c000d               nop        dword ptr [rax + rax + 0xd000cc4]
00bd4 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00bde 4883e4f0                       and        rsp, 0xfffffffffffffff0
00be2 e8f9892018                     call       0x7f432bddebe0
00be7 f4                             hlt        
00be8 4d3bcb                         cmp        r9, r11
00beb bdffffffff                     mov        ebp, 0xffffffff
00bf0 7c08                           jl         0x7f4313bd61fa
00bf2 400f95c5                       setne      bpl
00bf6 400fb6ed                       movzx      ebp, bpl
00bfa be45ffffff                     mov        esi, 0xffffff45
00bff 90                             nop        
00c00 c5f877                         vzeroupper 
00c03 e85878afff                     call       0x7f43136cda60
00c08 0f1f8400000d000e               nop        dword ptr [rax + rax + 0xe000d00]
00c10 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00c1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c1e e8bd892018                     call       0x7f432bddebe0
00c23 f4                             hlt        
00c24 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00c29 493bfb                         cmp        rdi, r11
00c2c bdffffffff                     mov        ebp, 0xffffffff
00c31 7c08                           jl         0x7f4313bd623b
00c33 400f95c5                       setne      bpl
00c37 400fb6ed                       movzx      ebp, bpl
00c3b be45ffffff                     mov        esi, 0xffffff45
00c40 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00c48 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00c4d 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00c52 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
00c57 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c5b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00c60 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c65 48ff742440                     push       qword ptr [rsp + 0x40]
00c6a 488f442438                     pop        qword ptr [rsp + 0x38]
00c6f 90                             nop        
00c70 c5f877                         vzeroupper 
00c73 e8e877afff                     call       0x7f43136cda60
00c78 0f1f8400700d000f               nop        dword ptr [rax + rax + 0xf000d70]
00c80 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8e e84d892018                     call       0x7f432bddebe0
00c93 f4                             hlt        
00c94 be45ffffff                     mov        esi, 0xffffff45
00c99 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00ca1 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00ca6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00cae 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00cb3 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00cbb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00cc0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cc5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00cca 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00cd7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cdb 89442428                       mov        dword ptr [rsp + 0x28], eax
00cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce4 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ce9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00cee 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cf3 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00cf8 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00cfd 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00d02 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00d07 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d0c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00d11 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00d16 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00d1a 90                             nop        
00d1b 90                             nop        
00d1c c5f877                         vzeroupper 
00d1f e83c77afff                     call       0x7f43136cda60
00d24 0f1f84001c0e0010               nop        dword ptr [rax + rax + 0x10000e1c]
00d2c 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00d36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d3a e8a1882018                     call       0x7f432bddebe0
00d3f f4                             hlt        
00d40 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
00d48 4c3bd1                         cmp        r10, rcx
00d4b bdffffffff                     mov        ebp, 0xffffffff
00d50 7c08                           jl         0x7f4313bd635a
00d52 400f95c5                       setne      bpl
00d56 400fb6ed                       movzx      ebp, bpl
00d5a be45ffffff                     mov        esi, 0xffffff45
00d5f 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00d67 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00d6f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00d74 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00d7c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d81 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d86 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d8b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d90 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00d95 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00d9a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00da3 89442430                       mov        dword ptr [rsp + 0x30], eax
00da7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dac 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00db1 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00db6 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00dbb 90                             nop        
00dbc c5f877                         vzeroupper 
00dbf e89c76afff                     call       0x7f43136cda60
00dc4 0f1f8400bc0e0011               nop        dword ptr [rax + rax + 0x11000ebc]
00dcc 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dda e801882018                     call       0x7f432bddebe0
00ddf f4                             hlt        
00de0 be45ffffff                     mov        esi, 0xffffff45
00de5 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00ded 90                             nop        
00dee 90                             nop        
00def 90                             nop        
00df0 c5f877                         vzeroupper 
00df3 e86876afff                     call       0x7f43136cda60
00df8 0f1f8400f00e0012               nop        dword ptr [rax + rax + 0x12000ef0]
00e00 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00e0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e0e e8cd872018                     call       0x7f432bddebe0
00e13 f4                             hlt        
00e14 ffcb                           dec        ebx
00e16 be45ffffff                     mov        esi, 0xffffff45
00e1b 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00e23 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00e28 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00e30 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00e35 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00e3d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e42 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e47 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e4c 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00e54 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00e59 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00e63 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00e67 89442428                       mov        dword ptr [rsp + 0x28], eax
00e6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e70 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e75 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e7a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e7f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e84 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e89 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e8e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e93 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e98 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00e9d 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00ea1 90                             nop        
00ea2 90                             nop        
00ea3 90                             nop        
00ea4 c5f877                         vzeroupper 
00ea7 e8b475afff                     call       0x7f43136cda60
00eac 0f1f8400a40f0013               nop        dword ptr [rax + rax + 0x13000fa4]
00eb4 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00ebe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ec2 e819872018                     call       0x7f432bddebe0
00ec7 f4                             hlt        
00ec8 be45ffffff                     mov        esi, 0xffffff45
00ecd 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00ed5 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00eda 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00ee2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ee7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00eec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ef1 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00ef9 48894424f8                     mov        qword ptr [rsp - 8], rax
00efe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00f02 89442428                       mov        dword ptr [rsp + 0x28], eax
00f06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f0b 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00f10 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f15 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f1a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00f1f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f24 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f29 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f2e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f33 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00f38 c5f877                         vzeroupper 
00f3b e82075afff                     call       0x7f43136cda60
00f40 0f1f840038100014               nop        dword ptr [rax + rax + 0x14001038]
00f48 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00f52 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f56 e885862018                     call       0x7f432bddebe0
00f5b f4                             hlt        
00f5c be45ffffff                     mov        esi, 0xffffff45
00f61 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00f69 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00f6e 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00f76 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f7b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f80 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f85 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f92 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00f96 89442428                       mov        dword ptr [rsp + 0x28], eax
00f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f9f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00fa4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00fa9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00fae 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00fb3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00fb8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fbd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00fc2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00fc7 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00fcc c5f877                         vzeroupper 
00fcf e88c74afff                     call       0x7f43136cda60
00fd4 0f1f8400cc100015               nop        dword ptr [rax + rax + 0x150010cc]
00fdc 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
00fe6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fea e8f1852018                     call       0x7f432bddebe0
00fef f4                             hlt        
00ff0 be45ffffff                     mov        esi, 0xffffff45
00ff5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00ffd 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01005 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0100a 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01012 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01017 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0101c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01021 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01026 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0102b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01030 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01035 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0103a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0103f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01044 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01049 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0104e 90                             nop        
0104f 90                             nop        
01050 c5f877                         vzeroupper 
01053 e80874afff                     call       0x7f43136cda60
01058 0f1f840050110016               nop        dword ptr [rax + rax + 0x16001150]
01060 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
0106a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0106e e86d852018                     call       0x7f432bddebe0
01073 f4                             hlt        
01074 bee4ffffff                     mov        esi, 0xffffffe4
01079 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
01081 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01086 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0108e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01093 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0109b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010a0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010a5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010aa 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
010b2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
010b7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010bc 48894424f8                     mov        qword ptr [rsp - 8], rax
010c1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010c5 89442428                       mov        dword ptr [rsp + 0x28], eax
010c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ce 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
010d3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
010d8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
010dd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
010e2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
010e7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
010ec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
010f1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
010f6 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
010fb 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
010ff 90                             nop        
01100 c5f877                         vzeroupper 
01103 e85873afff                     call       0x7f43136cda60
01108 0f1f840000120017               nop        dword ptr [rax + rax + 0x17001200]
01110 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
0111a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0111e e8bd842018                     call       0x7f432bddebe0
01123 f4                             hlt        
01124 bef6ffffff                     mov        esi, 0xfffffff6
01129 90                             nop        
0112a 90                             nop        
0112b 90                             nop        
0112c c5f877                         vzeroupper 
0112f e82c73afff                     call       0x7f43136cda60
01134 0f1f84002c120018               nop        dword ptr [rax + rax + 0x1800122c]
0113c 48bf305122ec427f0000           movabs     rdi, 0x7f42ec225130
01146 4883e4f0                       and        rsp, 0xfffffffffffffff0
0114a e891842018                     call       0x7f432bddebe0
0114f f4                             hlt        
01150 488bf0                         mov        rsi, rax
01153 c5f877                         vzeroupper 
01156 4881c4b0000000                 add        rsp, 0xb0
0115d 5d                             pop        rbp
0115e e9fdf3aeff                     jmp        0x7f43136c5b60
01163 49bab35abd13437f0000           movabs     r10, 0x7f4313bd5ab3
0116d 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01174 e9e7bbb5ff                     jmp        0x7f4313732360
01179 e8628ab4ff                     call       0x7f431371f1e0
0117e e9bbeeffff                     jmp        0x7f4313bd563e
01183 f4                             hlt        
01184 f4                             hlt        
01185 f4                             hlt        
01186 f4                             hlt        
01187 f4                             hlt        
