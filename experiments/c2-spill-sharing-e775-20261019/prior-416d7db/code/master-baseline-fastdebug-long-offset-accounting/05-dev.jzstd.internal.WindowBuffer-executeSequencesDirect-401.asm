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
0001a 0f85c080b5ff                   jne        0x7faed772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f852b110000                   jne        0x7faed7bd7de9
0003e 8bc7                           mov        eax, edi
00040 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00045 498bd8                         mov        rbx, r8
00048 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004c 4c8bf6                         mov        r14, rsi
0004f 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00053 448b4604                       mov        r8d, dword ptr [rsi + 4]
00057 418bc8                         mov        ecx, r8d
0005a 412bca                         sub        ecx, r10d
0005d 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00065 443bc9                         cmp        r9d, ecx
00068 0f8f3a0b0000                   jg         0x7faed7bd7828
0006e 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00072 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00077 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007b 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00083 4963fa                         movsxd     rdi, r10d
00086 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008b 4c2bdf                         sub        r11, rdi
0008e 4d3bcb                         cmp        r9, r11
00091 0f8f490b0000                   jg         0x7faed7bd7860
00097 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009b 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a0 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a4 8b4e40                         mov        ecx, dword ptr [rsi + 0x40]
000a7 4d85db                         test       r11, r11
000aa 0f85e0070000                   jne        0x7faed7bd7510
000b0 4903f9                         add        rdi, r9
000b3 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b8 0f8f5e0b0000                   jg         0x7faed7bd789c
000be 488bfa                         mov        rdi, rdx
000c1 8b7204                         mov        esi, dword ptr [rdx + 4]
000c4 4533c9                         xor        r9d, r9d
000c7 448bd8                         mov        r11d, eax
000ca 4585db                         test       r11d, r11d
000cd 0f8ee5020000                   jle        0x7faed7bd7038
000d3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d8 448d6ee0                       lea        r13d, [rsi - 0x20]
000dc 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e1 4183c0e0                       add        r8d, -0x20
000e5 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
000ea 49f7d9                         neg        r9
000ed 448b5304                       mov        r10d, dword ptr [rbx + 4]
000f1 4585d2                         test       r10d, r10d
000f4 0f8602070000                   jbe        0x7faed7bd747c
000fa 4963d3                         movsxd     rdx, r11d
000fd 4d63d2                         movsxd     r10, r10d
00100 48ffca                         dec        rdx
00103 493bd2                         cmp        rdx, r10
00106 0f83f0060000                   jae        0x7faed7bd747c
0010c 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00114 8b5504                         mov        edx, dword ptr [rbp + 4]
00117 85d2                           test       edx, edx
00119 0f86ed070000                   jbe        0x7faed7bd758c
0011f 448d56f1                       lea        r10d, [rsi - 0xf]
00123 4585d2                         test       r10d, r10d
00126 0f8ce0070000                   jl         0x7faed7bd758c
0012c 8b4104                         mov        eax, dword ptr [rcx + 4]
0012f 448d50f1                       lea        r10d, [rax - 0xf]
00133 4585d2                         test       r10d, r10d
00136 0f8cd0070000                   jl         0x7faed7bd758c
0013c 89542418                       mov        dword ptr [rsp + 0x18], edx
00140 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00145 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0014a 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0014f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00157 488f442458                     pop        qword ptr [rsp + 0x58]
0015c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00161 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00166 48897c2450                     mov        qword ptr [rsp + 0x50], rdi
0016b 4c89b424c8000000               mov        qword ptr [rsp + 0xc8], r14
00173 89b424c4000000                 mov        dword ptr [rsp + 0xc4], esi
0017a 4c8bd1                         mov        r10, rcx
0017d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00182 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00186 83c6f1                         add        esi, -0xf
00189 8974246c                       mov        dword ptr [rsp + 0x6c], esi
0018d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00191 83c0f1                         add        eax, -0xf
00194 89442478                       mov        dword ptr [rsp + 0x78], eax
00198 4533c9                         xor        r9d, r9d
0019b 4533c0                         xor        r8d, r8d
0019e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001a3 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
001a8 4d8bd3                         mov        r10, r11
001ab 49c1ea12                       shr        r10, 0x12
001af 458bd2                         mov        r10d, r10d
001b2 4181e2ffff0300                 and        r10d, 0x3ffff
001b9 418bc2                         mov        eax, r10d
001bc 498bcb                         mov        rcx, r11
001bf 48c1f924                       sar        rcx, 0x24
001c3 458bd3                         mov        r10d, r11d
001c6 8bd9                           mov        ebx, ecx
001c8 4181e2ffff0100                 and        r10d, 0x1ffff
001cf 85db                           test       ebx, ebx
001d1 0f8cb50a0000                   jl         0x7faed7bd790c
001d7 4585d2                         test       r10d, r10d
001da 0f84f4020000                   je         0x7faed7bd7154
001e0 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e4 412be9                         sub        ebp, r9d
001e7 443bd5                         cmp        r10d, ebp
001ea 0f8fe40b0000                   jg         0x7faed7bd7a54
001f0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
001f8 83fb03                         cmp        ebx, 3
001fb 0f8fe3020000                   jg         0x7faed7bd7164
00201 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00209 4585d2                         test       r10d, r10d
0020c 0f84f60b0000                   je         0x7faed7bd7a88
00212 83fb01                         cmp        ebx, 1
00215 0f85d5070000                   jne        0x7faed7bd7670
0021b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00220 458b5208                       mov        r10d, dword ptr [r10 + 8]
00224 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0022c 4c639c2490000000               movsxd     r11, dword ptr [rsp + 0x90]
00234 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
00239 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0023e 4d03d3                         add        r10, r11
00241 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00249 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00251 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00259 0f8fd50a0000                   jg         0x7faed7bd79b4
0025f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00267 4585d2                         test       r10d, r10d
0026a 0f8e4e070000                   jle        0x7faed7bd763e
00270 458bd1                         mov        r10d, r9d
00273 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0027b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00280 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00284 038c2490000000                 add        ecx, dword ptr [rsp + 0x90]
0028b 03c8                           add        ecx, eax
0028d 3b4c2468                       cmp        ecx, dword ptr [rsp + 0x68]
00291 0f8f8e020000                   jg         0x7faed7bd71a5
00297 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
0029c 0f8f160c0000                   jg         0x7faed7bd7b38
002a2 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
002a9 83f910                         cmp        ecx, 0x10
002ac 0f8f9a0c0000                   jg         0x7faed7bd7bcc
002b2 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
002b7 0f833b030000                   jae        0x7faed7bd7278
002bd 418be9                         mov        ebp, r9d
002c0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002c5 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002cc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
002d1 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
002d6 0f83b0030000                   jae        0x7faed7bd730c
002dc 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002e4 4403cd                         add        r9d, ebp
002e7 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
002ec 4103ca                         add        ecx, r10d
002ef 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
002f6 4963ca                         movsxd     rcx, r10d
002f9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
002fe c4c17a7f440908                 vmovdqu    xmmword ptr [r9 + rcx + 8], xmm0
00305 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
0030c 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00313 83f810                         cmp        eax, 0x10
00316 0f8ec40c0000                   jle        0x7faed7bd7c60
0031c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00324 443bd0                         cmp        r10d, eax
00327 0f8c73070000                   jl         0x7faed7bd7720
0032d 83f830                         cmp        eax, 0x30
00330 0f8eee070000                   jle        0x7faed7bd77a4
00336 85ed                           test       ebp, ebp
00338 0f8cf4030000                   jl         0x7faed7bd73b2
0033e 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00346 4585c9                         test       r9d, r9d
00349 0f8ce3030000                   jl         0x7faed7bd73b2
0034f 448d1428                       lea        r10d, [rax + rbp]
00353 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
00357 413bda                         cmp        ebx, r10d
0035a 0f82d2030000                   jb         0x7faed7bd73b2
00360 428d1c08                       lea        ebx, [rax + r9]
00364 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00368 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
0036d 443bcb                         cmp        r9d, ebx
00370 0f82bc030000                   jb         0x7faed7bd73b2
00376 85c0                           test       eax, eax
00378 0f84aa030000                   je         0x7faed7bd73a8
0037e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00383 498d7c2a08                     lea        rdi, [r10 + rbp + 8]
00388 4c03d9                         add        r11, rcx
0038b 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00390 4863d0                         movsxd     rdx, eax
00393 4883fa20                       cmp        rdx, 0x20
00397 762e                           jbe        0x7faed7bd7047
00399 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0039e c5f877                         vzeroupper 
003a1 49ba409171d7ae7f0000           movabs     r10, 0x7faed7719140
003ab 41ffd2                         call       r10
003ae 0f1f840000000000               nop        dword ptr [rax + rax]
003b6 eb34                           jmp        0x7faed7bd706c
003b8 85c9                           test       ecx, ecx
003ba 0f8408040000                   je         0x7faed7bd7448
003c0 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003c5 eb73                           jmp        0x7faed7bd70ba
003c7 4c63d0                         movsxd     r10, eax
003ca 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003d1 c442a8f5db                     bzhi       r11, r11, r10
003d6 c4c1fb92fb                     kmovq      k7, r11
003db 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003e1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e7 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003ec 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
003f1 41ffc0                         inc        r8d
003f4 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
003f9 7d0a                           jge        0x7faed7bd7085
003fb 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00400 e999fdffff                     jmp        0x7faed7bd6e1e
00405 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0040a 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
0040f 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00414 4585c9                         test       r9d, r9d
00417 0f8c87050000                   jl         0x7faed7bd7624
0041d 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
00425 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
0042a 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0042e 8bb424c4000000                 mov        esi, dword ptr [rsp + 0xc4]
00435 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0043a 4585d2                         test       r10d, r10d
0043d 0f8c5a010000                   jl         0x7faed7bd721d
00443 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00447 0f8255010000                   jb         0x7faed7bd7222
0044d 438d2c02                       lea        ebp, [r10 + r8]
00451 8b5904                         mov        ebx, dword ptr [rcx + 4]
00454 3bdd                           cmp        ebx, ebp
00456 0f824b010000                   jb         0x7faed7bd7227
0045c 4585c0                         test       r8d, r8d
0045f 0f8c47010000                   jl         0x7faed7bd722c
00465 4585c0                         test       r8d, r8d
00468 7436                           je         0x7faed7bd7120
0046a 4a8d7c0f08                     lea        rdi, [rdi + r9 + 8]
0046f 4c8bd9                         mov        r11, rcx
00472 4a8d741108                     lea        rsi, [rcx + r10 + 8]
00477 4963d0                         movsxd     rdx, r8d
0047a 4883fa20                       cmp        rdx, 0x20
0047e 773a                           ja         0x7faed7bd713a
00480 4d63d0                         movsxd     r10, r8d
00483 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0048a c442a8f5db                     bzhi       r11, r11, r10
0048f c4c1fb92fb                     kmovq      k7, r11
00494 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0049a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004a0 41896e38                       mov        dword ptr [r14 + 0x38], ebp
004a4 c5f877                         vzeroupper 
004a7 4881c4b0000000                 add        rsp, 0xb0
004ae 5d                             pop        rbp
004af 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
004b3 0f879a0c0000                   ja         0x7faed7bd7dd3
004b9 c3                             ret        
004ba c5f877                         vzeroupper 
004bd 49ba409171d7ae7f0000           movabs     r10, 0x7faed7719140
004c7 41ffd2                         call       r10
004ca 0f1f840000000000               nop        dword ptr [rax + rax]
004d2 ebcc                           jmp        0x7faed7bd7120
004d4 4533d2                         xor        r10d, r10d
004d7 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
004df e914fdffff                     jmp        0x7faed7bd6e78
004e4 83c3fd                         add        ebx, -3
004e7 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004ec 4183fb02                       cmp        r11d, 2
004f0 0f866e0b0000                   jbe        0x7faed7bd7ce4
004f6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004fb 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
004ff 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00504 45895310                       mov        dword ptr [r11 + 0x10], r10d
00508 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0050c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00511 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00515 41895a08                       mov        dword ptr [r10 + 8], ebx
00519 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00520 e907fdffff                     jmp        0x7faed7bd6eac
00525 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0052a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0052f 498bea                         mov        rbp, r10
00532 4c3b25dfbb4117                 cmp        r12, qword ptr [rip + 0x1741bbdf]
00539 0f8414000000                   je         0x7faed7bd71d3
0053f 48bf28620cedae7f0000           movabs     rdi, 0x7faeed0c6228
00549 4883e4f0                       and        rsp, 0xfffffffffffffff0
0054d e88ea37e16                     call       0x7faeee3c1560
00552 f4                             hlt        
00553 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0055b 488bf5                         mov        rsi, rbp
0055e 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00562 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00567 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
0056e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00576 44891424                       mov        dword ptr [rsp], r10d
0057a 89442408                       mov        dword ptr [rsp + 8], eax
0057e 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00582 90                             nop        
00583 90                             nop        
00584 c5f877                         vzeroupper 
00587 e8548ab5ff                     call       0x7faed772fc60
0058c 0f1f840084060000               nop        dword ptr [rax + rax + 0x684]
00594 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00598 e94ffeffff                     jmp        0x7faed7bd706c
0059d 418bea                         mov        ebp, r10d
005a0 eb0d                           jmp        0x7faed7bd722f
005a2 418bea                         mov        ebp, r10d
005a5 eb08                           jmp        0x7faed7bd722f
005a7 418bea                         mov        ebp, r10d
005aa eb03                           jmp        0x7faed7bd722f
005ac 418bea                         mov        ebp, r10d
005af beccffffff                     mov        esi, 0xffffffcc
005b4 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
005bc 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
005c1 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
005c9 894c240c                       mov        dword ptr [rsp + 0xc], ecx
005cd 4489442418                     mov        dword ptr [rsp + 0x18], r8d
005d2 90                             nop        
005d3 90                             nop        
005d4 c5f877                         vzeroupper 
005d7 e80468afff                     call       0x7faed76cda60
005dc 0f1f8400d4060001               nop        dword ptr [rax + rax + 0x10006d4]
005e4 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
005ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
005f2 e8e9a27e16                     call       0x7faeee3c1560
005f7 f4                             hlt        
005f8 bee4ffffff                     mov        esi, 0xffffffe4
005fd 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00605 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0060a 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00612 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00617 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0061c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00621 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00629 48894424f8                     mov        qword ptr [rsp - 8], rax
0062e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00632 89442428                       mov        dword ptr [rsp + 0x28], eax
00636 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0063b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00640 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00645 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0064a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0064f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00654 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00659 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0065e 89442448                       mov        dword ptr [rsp + 0x48], eax
00662 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00667 90                             nop        
00668 c5f877                         vzeroupper 
0066b e87067afff                     call       0x7faed76cda60
00670 0f1f840068070002               nop        dword ptr [rax + rax + 0x2000768]
00678 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00682 4883e4f0                       and        rsp, 0xfffffffffffffff0
00686 e855a27e16                     call       0x7faeee3c1560
0068b f4                             hlt        
0068c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00695 bee4ffffff                     mov        esi, 0xffffffe4
0069a 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
006a2 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
006aa 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
006af 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
006b7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
006bc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
006c1 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
006c6 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
006cb 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
006d0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
006d5 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006da 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
006df 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
006e4 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
006e9 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
006ee 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
006f3 4489442448                     mov        dword ptr [rsp + 0x48], r8d
006f8 8944244c                       mov        dword ptr [rsp + 0x4c], eax
006fc 4489542454                     mov        dword ptr [rsp + 0x54], r10d
00701 90                             nop        
00702 90                             nop        
00703 90                             nop        
00704 c5f877                         vzeroupper 
00707 e8d466afff                     call       0x7faed76cda60
0070c 0f1f840004080003               nop        dword ptr [rax + rax + 0x3000804]
00714 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
0071e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00722 e8b9a17e16                     call       0x7faeee3c1560
00727 f4                             hlt        
00728 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0072d e9bafcffff                     jmp        0x7faed7bd706c
00732 beccffffff                     mov        esi, 0xffffffcc
00737 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0073f 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00747 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0074c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00754 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00759 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0075e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00763 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00768 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0076d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00772 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00777 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0077c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00781 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00786 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0078b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00790 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00795 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0079a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0079f 89442458                       mov        dword ptr [rsp + 0x58], eax
007a3 90                             nop        
007a4 c5f877                         vzeroupper 
007a7 e83466afff                     call       0x7faed76cda60
007ac 0f1f8400a4080004               nop        dword ptr [rax + rax + 0x40008a4]
007b4 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
007be 4883e4f0                       and        rsp, 0xfffffffffffffff0
007c2 e819a17e16                     call       0x7faeee3c1560
007c7 f4                             hlt        
007c8 bef6ffffff                     mov        esi, 0xfffffff6
007cd 488bea                         mov        rbp, rdx
007d0 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
007d8 c5f877                         vzeroupper 
007db e80066afff                     call       0x7faed76cda60
007e0 0f1f8400d8080005               nop        dword ptr [rax + rax + 0x50008d8]
007e8 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
007f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007f6 e8e5a07e16                     call       0x7faeee3c1560
007fb f4                             hlt        
007fc be6effffff                     mov        esi, 0xffffff6e
00801 498bee                         mov        rbp, r14
00804 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
0080c 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00811 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00816 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0081b 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0081f 48894424f8                     mov        qword ptr [rsp - 8], rax
00824 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00828 89442428                       mov        dword ptr [rsp + 0x28], eax
0082c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00831 48894424f8                     mov        qword ptr [rsp - 8], rax
00836 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0083a 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0083e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00843 48ff742440                     push       qword ptr [rsp + 0x40]
00848 488f442430                     pop        qword ptr [rsp + 0x30]
0084d 48ff742448                     push       qword ptr [rsp + 0x48]
00852 488f442438                     pop        qword ptr [rsp + 0x38]
00857 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0085c 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
00861 4489442444                     mov        dword ptr [rsp + 0x44], r8d
00866 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0086b 90                             nop        
0086c c5f877                         vzeroupper 
0086f e86c65afff                     call       0x7faed76cda60
00874 0f1f84006c090006               nop        dword ptr [rax + rax + 0x600096c]
0087c 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00886 4883e4f0                       and        rsp, 0xfffffffffffffff0
0088a e851a07e16                     call       0x7faeee3c1560
0088f f4                             hlt        
00890 4533c9                         xor        r9d, r9d
00893 4d3bd9                         cmp        r11, r9
00896 bdffffffff                     mov        ebp, 0xffffffff
0089b 7c08                           jl         0x7faed7bd7525
0089d 400f95c5                       setne      bpl
008a1 400fb6ed                       movzx      ebp, bpl
008a5 be45ffffff                     mov        esi, 0xffffff45
008aa 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
008b2 4889542410                     mov        qword ptr [rsp + 0x10], rdx
008b7 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
008bc 89442428                       mov        dword ptr [rsp + 0x28], eax
008c0 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
008c4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008c9 4489442434                     mov        dword ptr [rsp + 0x34], r8d
008ce 48ff742440                     push       qword ptr [rsp + 0x40]
008d3 488f442438                     pop        qword ptr [rsp + 0x38]
008d8 48ff742448                     push       qword ptr [rsp + 0x48]
008dd 488f442440                     pop        qword ptr [rsp + 0x40]
008e2 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
008e7 90                             nop        
008e8 c5f877                         vzeroupper 
008eb e8f064afff                     call       0x7faed76cda60
008f0 0f1f8400e8090007               nop        dword ptr [rax + rax + 0x70009e8]
008f8 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00902 4883e4f0                       and        rsp, 0xfffffffffffffff0
00906 e8d59f7e16                     call       0x7faeee3c1560
0090b f4                             hlt        
0090c bebeffffff                     mov        esi, 0xffffffbe
00911 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00919 4889bc24c8000000               mov        qword ptr [rsp + 0xc8], rdi
00921 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00926 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0092b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00930 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00934 48894424f8                     mov        qword ptr [rsp - 8], rax
00939 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0093d 89442428                       mov        dword ptr [rsp + 0x28], eax
00941 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00946 48894424f8                     mov        qword ptr [rsp - 8], rax
0094b 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0094f 8944242c                       mov        dword ptr [rsp + 0x2c], eax
00953 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00958 48ff742440                     push       qword ptr [rsp + 0x40]
0095d 488f442430                     pop        qword ptr [rsp + 0x30]
00962 48ff742448                     push       qword ptr [rsp + 0x48]
00967 488f442438                     pop        qword ptr [rsp + 0x38]
0096c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00971 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
00976 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0097b 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00980 c5f877                         vzeroupper 
00983 e85864afff                     call       0x7faed76cda60
00988 0f1f8400800a0008               nop        dword ptr [rax + rax + 0x8000a80]
00990 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
0099a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0099e e83d9f7e16                     call       0x7faeee3c1560
009a3 f4                             hlt        
009a4 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
009a8 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
009b0 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
009b5 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
009b9 e9f1fbffff                     jmp        0x7faed7bd722f
009be be45ffffff                     mov        esi, 0xffffff45
009c3 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
009cb 90                             nop        
009cc c5f877                         vzeroupper 
009cf e80c64afff                     call       0x7faed76cda60
009d4 0f1f8400cc0a0009               nop        dword ptr [rax + rax + 0x9000acc]
009dc 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
009e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
009ea e8f19e7e16                     call       0x7faeee3c1560
009ef f4                             hlt        
009f0 ffcb                           dec        ebx
009f2 be45ffffff                     mov        esi, 0xffffff45
009f7 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
009ff 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a04 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00a0c 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a11 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a19 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a1e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a23 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a28 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00a30 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a35 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00a3f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00a43 89442428                       mov        dword ptr [rsp + 0x28], eax
00a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a4c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00a51 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a56 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00a5b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a60 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a65 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a6a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a6f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00a74 89442448                       mov        dword ptr [rsp + 0x48], eax
00a78 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00a7c c5f877                         vzeroupper 
00a7f e85c63afff                     call       0x7faed76cda60
00a84 0f1f84007c0b000a               nop        dword ptr [rax + rax + 0xa000b7c]
00a8c 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00a96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a9a e8419e7e16                     call       0x7faeee3c1560
00a9f f4                             hlt        
00aa0 be45ffffff                     mov        esi, 0xffffff45
00aa5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00aad 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00ab5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00aba 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00ac2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ac7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00acc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ad1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ad6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00adb 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ae0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00ae5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00aea 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00aef 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00af4 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00af9 89442450                       mov        dword ptr [rsp + 0x50], eax
00afd 90                             nop        
00afe 90                             nop        
00aff 90                             nop        
00b00 c5f877                         vzeroupper 
00b03 e8d862afff                     call       0x7faed76cda60
00b08 0f1f8400000c000b               nop        dword ptr [rax + rax + 0xb000c00]
00b10 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00b1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b1e e8bd9d7e16                     call       0x7faeee3c1560
00b23 f4                             hlt        
00b24 be45ffffff                     mov        esi, 0xffffff45
00b29 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b31 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00b39 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00b3e 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00b46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b50 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b55 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b5a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b5f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00b64 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00b69 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00b6e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00b73 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00b78 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b7d 89442450                       mov        dword ptr [rsp + 0x50], eax
00b81 90                             nop        
00b82 90                             nop        
00b83 90                             nop        
00b84 c5f877                         vzeroupper 
00b87 e85462afff                     call       0x7faed76cda60
00b8c 0f1f8400840c000c               nop        dword ptr [rax + rax + 0xc000c84]
00b94 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ba2 e8399d7e16                     call       0x7faeee3c1560
00ba7 f4                             hlt        
00ba8 be45ffffff                     mov        esi, 0xffffff45
00bad 8bac24c0000000                 mov        ebp, dword ptr [rsp + 0xc0]
00bb4 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
00bbb 90                             nop        
00bbc c5f877                         vzeroupper 
00bbf e81c62afff                     call       0x7faed76cda60
00bc4 0f1f8400bc0c000d               nop        dword ptr [rax + rax + 0xd000cbc]
00bcc 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bda e8019d7e16                     call       0x7faeee3c1560
00bdf f4                             hlt        
00be0 4d3bcb                         cmp        r9, r11
00be3 bdffffffff                     mov        ebp, 0xffffffff
00be8 7c08                           jl         0x7faed7bd7872
00bea 400f95c5                       setne      bpl
00bee 400fb6ed                       movzx      ebp, bpl
00bf2 be45ffffff                     mov        esi, 0xffffff45
00bf7 90                             nop        
00bf8 c5f877                         vzeroupper 
00bfb e8e061afff                     call       0x7faed76cda60
00c00 0f1f8400f80c000e               nop        dword ptr [rax + rax + 0xe000cf8]
00c08 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00c12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c16 e8c59c7e16                     call       0x7faeee3c1560
00c1b f4                             hlt        
00c1c 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00c21 493bfb                         cmp        rdi, r11
00c24 bdffffffff                     mov        ebp, 0xffffffff
00c29 7c08                           jl         0x7faed7bd78b3
00c2b 400f95c5                       setne      bpl
00c2f 400fb6ed                       movzx      ebp, bpl
00c33 be45ffffff                     mov        esi, 0xffffff45
00c38 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00c40 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00c45 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00c4a 89442428                       mov        dword ptr [rsp + 0x28], eax
00c4e 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c52 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00c57 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c5c 48ff742440                     push       qword ptr [rsp + 0x40]
00c61 488f442438                     pop        qword ptr [rsp + 0x38]
00c66 90                             nop        
00c67 90                             nop        
00c68 c5f877                         vzeroupper 
00c6b e87061afff                     call       0x7faed76cda60
00c70 0f1f8400680d000f               nop        dword ptr [rax + rax + 0xf000d68]
00c78 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c86 e8559c7e16                     call       0x7faeee3c1560
00c8b f4                             hlt        
00c8c be45ffffff                     mov        esi, 0xffffff45
00c91 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00c99 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00c9e 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00ca6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00cab 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00cb3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00cb8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cbd 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
00cc1 898c24cc000000                 mov        dword ptr [rsp + 0xcc], ecx
00cc8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ccd 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cd1 89442428                       mov        dword ptr [rsp + 0x28], eax
00cd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cda 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cdf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ce4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ce9 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00cee 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00cf3 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00cf8 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00cfd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d02 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00d07 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00d0b 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00d0f 90                             nop        
00d10 c5f877                         vzeroupper 
00d13 e8c860afff                     call       0x7faed76cda60
00d18 0f1f8400100e0010               nop        dword ptr [rax + rax + 0x10000e10]
00d20 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00d2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d2e e8ad9b7e16                     call       0x7faeee3c1560
00d33 f4                             hlt        
00d34 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
00d3c 4c3bd1                         cmp        r10, rcx
00d3f bdffffffff                     mov        ebp, 0xffffffff
00d44 7c08                           jl         0x7faed7bd79ce
00d46 400f95c5                       setne      bpl
00d4a 400fb6ed                       movzx      ebp, bpl
00d4e be45ffffff                     mov        esi, 0xffffff45
00d53 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00d5b 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00d63 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00d68 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00d70 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d75 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d7a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d7f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d84 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00d89 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00d93 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d97 89442430                       mov        dword ptr [rsp + 0x30], eax
00d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00da0 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00da5 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00daa 89442450                       mov        dword ptr [rsp + 0x50], eax
00dae 90                             nop        
00daf 90                             nop        
00db0 c5f877                         vzeroupper 
00db3 e82860afff                     call       0x7faed76cda60
00db8 0f1f8400b00e0011               nop        dword ptr [rax + rax + 0x11000eb0]
00dc0 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dce e80d9b7e16                     call       0x7faeee3c1560
00dd3 f4                             hlt        
00dd4 be45ffffff                     mov        esi, 0xffffff45
00dd9 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00de1 90                             nop        
00de2 90                             nop        
00de3 90                             nop        
00de4 c5f877                         vzeroupper 
00de7 e8f45fafff                     call       0x7faed76cda60
00dec 0f1f8400e40e0012               nop        dword ptr [rax + rax + 0x12000ee4]
00df4 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e02 e8d99a7e16                     call       0x7faeee3c1560
00e07 f4                             hlt        
00e08 ffcb                           dec        ebx
00e0a be45ffffff                     mov        esi, 0xffffff45
00e0f 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00e17 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00e1c 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00e24 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00e29 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00e31 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e36 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e3b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e40 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00e48 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00e4d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e52 48894424f8                     mov        qword ptr [rsp - 8], rax
00e57 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00e5b 89442428                       mov        dword ptr [rsp + 0x28], eax
00e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e64 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e69 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e6e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e73 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e78 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e7d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e82 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e87 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e8c 89442448                       mov        dword ptr [rsp + 0x48], eax
00e90 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00e94 c5f877                         vzeroupper 
00e97 e8445fafff                     call       0x7faed76cda60
00e9c 0f1f8400940f0013               nop        dword ptr [rax + rax + 0x13000f94]
00ea4 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eb2 e8299a7e16                     call       0x7faeee3c1560
00eb7 f4                             hlt        
00eb8 be45ffffff                     mov        esi, 0xffffff45
00ebd 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00ec5 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00eca 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00ed2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ed7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00edc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ee1 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00ee9 48894424f8                     mov        qword ptr [rsp - 8], rax
00eee 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00ef2 89442428                       mov        dword ptr [rsp + 0x28], eax
00ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efb 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00f00 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f05 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f0a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00f0f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f14 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f19 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f1e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f23 89442448                       mov        dword ptr [rsp + 0x48], eax
00f27 90                             nop        
00f28 c5f877                         vzeroupper 
00f2b e8b05eafff                     call       0x7faed76cda60
00f30 0f1f840028100014               nop        dword ptr [rax + rax + 0x14001028]
00f38 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00f42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f46 e895997e16                     call       0x7faeee3c1560
00f4b f4                             hlt        
00f4c be45ffffff                     mov        esi, 0xffffff45
00f51 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00f59 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00f5e 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00f66 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f6b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f70 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f75 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f82 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00f86 89442428                       mov        dword ptr [rsp + 0x28], eax
00f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00f94 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f99 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f9e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00fa3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00fa8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fad 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00fb2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00fb7 89442448                       mov        dword ptr [rsp + 0x48], eax
00fbb 90                             nop        
00fbc c5f877                         vzeroupper 
00fbf e81c5eafff                     call       0x7faed76cda60
00fc4 0f1f8400bc100015               nop        dword ptr [rax + rax + 0x150010bc]
00fcc 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
00fd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fda e801997e16                     call       0x7faeee3c1560
00fdf f4                             hlt        
00fe0 be45ffffff                     mov        esi, 0xffffff45
00fe5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00fed 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00ff5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00ffa 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01002 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01007 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0100c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01011 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01016 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0101b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01020 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01025 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0102a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0102f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01034 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01039 89442450                       mov        dword ptr [rsp + 0x50], eax
0103d 90                             nop        
0103e 90                             nop        
0103f 90                             nop        
01040 c5f877                         vzeroupper 
01043 e8985dafff                     call       0x7faed76cda60
01048 0f1f840040110016               nop        dword ptr [rax + rax + 0x16001140]
01050 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
0105a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0105e e87d987e16                     call       0x7faeee3c1560
01063 f4                             hlt        
01064 bee4ffffff                     mov        esi, 0xffffffe4
01069 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
01071 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01076 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0107e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01083 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0108b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01090 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01095 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0109a 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
010a2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
010a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010ac 48894424f8                     mov        qword ptr [rsp - 8], rax
010b1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010b5 89442428                       mov        dword ptr [rsp + 0x28], eax
010b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010be 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
010c3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
010c8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
010cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
010d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
010d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
010dc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
010e1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
010e6 89442448                       mov        dword ptr [rsp + 0x48], eax
010ea 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
010ee 90                             nop        
010ef 90                             nop        
010f0 c5f877                         vzeroupper 
010f3 e8e85cafff                     call       0x7faed76cda60
010f8 0f1f8400f0110017               nop        dword ptr [rax + rax + 0x170011f0]
01100 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
0110a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0110e e8cd977e16                     call       0x7faeee3c1560
01113 f4                             hlt        
01114 bef6ffffff                     mov        esi, 0xfffffff6
01119 90                             nop        
0111a 90                             nop        
0111b 90                             nop        
0111c c5f877                         vzeroupper 
0111f e8bc5cafff                     call       0x7faed76cda60
01124 0f1f84001c120018               nop        dword ptr [rax + rax + 0x1800121c]
0112c 48bf509628acae7f0000           movabs     rdi, 0x7faeac289650
01136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0113a e8a1977e16                     call       0x7faeee3c1560
0113f f4                             hlt        
01140 488bf0                         mov        rsi, rax
01143 c5f877                         vzeroupper 
01146 4881c4b0000000                 add        rsp, 0xb0
0114d 5d                             pop        rbp
0114e e90df8aeff                     jmp        0x7faed76c75e0
01153 49ba2f71bdd7ae7f0000           movabs     r10, 0x7faed7bd712f
0115d 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01164 e977a5b5ff                     jmp        0x7faed7732360
01169 e8f273b4ff                     call       0x7faed771f1e0
0116e e9cbeeffff                     jmp        0x7faed7bd6cbe
01173 f4                             hlt        
01174 f4                             hlt        
01175 f4                             hlt        
01176 f4                             hlt        
01177 f4                             hlt        
