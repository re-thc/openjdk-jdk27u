00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c09ea9ff                   jne        0x7f98bf8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f853b0f0000                   jne        0x7f98bfe619f9
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
00069 0f8f310a0000                   jg         0x7f98bfe61520
0006f 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00073 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00078 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007c 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00084 4963fa                         movsxd     rdi, r10d
00087 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008c 4c2bdf                         sub        r11, rdi
0008f 4d3bcb                         cmp        r9, r11
00092 0f8f2c0a0000                   jg         0x7f98bfe61544
00098 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009c 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a1 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a5 8b4e40                         mov        ecx, dword ptr [rsi + 0x40]
000a8 4d85db                         test       r11, r11
000ab 0f854b070000                   jne        0x7f98bfe6127c
000b1 4903f9                         add        rdi, r9
000b4 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b9 0f8f2d0a0000                   jg         0x7f98bfe6156c
000bf 488bfa                         mov        rdi, rdx
000c2 8b7204                         mov        esi, dword ptr [rdx + 4]
000c5 4533c9                         xor        r9d, r9d
000c8 458bdd                         mov        r11d, r13d
000cb 4585db                         test       r11d, r11d
000ce 0f8ee8020000                   jle        0x7f98bfe60e3c
000d4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d9 448d6ee0                       lea        r13d, [rsi - 0x20]
000dd 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e2 4183c0e0                       add        r8d, -0x20
000e6 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
000eb 49f7d9                         neg        r9
000ee 448b5304                       mov        r10d, dword ptr [rbx + 4]
000f2 4585d2                         test       r10d, r10d
000f5 0f8681060000                   jbe        0x7f98bfe611fc
000fb 4963d3                         movsxd     rdx, r11d
000fe 4d63d2                         movsxd     r10, r10d
00101 48ffca                         dec        rdx
00104 493bd2                         cmp        rdx, r10
00107 0f836f060000                   jae        0x7f98bfe611fc
0010d 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00115 8b5504                         mov        edx, dword ptr [rbp + 4]
00118 85d2                           test       edx, edx
0011a 0f8644070000                   jbe        0x7f98bfe612e4
00120 448d56f1                       lea        r10d, [rsi - 0xf]
00124 4585d2                         test       r10d, r10d
00127 0f8c37070000                   jl         0x7f98bfe612e4
0012d 8b4104                         mov        eax, dword ptr [rcx + 4]
00130 448d50f1                       lea        r10d, [rax - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8c27070000                   jl         0x7f98bfe612e4
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
001d2 0f8c70090000                   jl         0x7f98bfe615c8
001d8 4585d2                         test       r10d, r10d
001db 0f84f7020000                   je         0x7f98bfe60f58
001e1 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e5 412be9                         sub        ebp, r9d
001e8 443bd5                         cmp        r10d, ebp
001eb 0f8f7b0a0000                   jg         0x7f98bfe616ec
001f1 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
001f9 83fb03                         cmp        ebx, 3
001fc 0f8fe6020000                   jg         0x7f98bfe60f68
00202 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0020a 4585d2                         test       r10d, r10d
0020d 0f84790a0000                   je         0x7f98bfe6170c
00213 83fb01                         cmp        ebx, 1
00216 0f8504070000                   jne        0x7f98bfe613a0
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
0025a 0f8f80090000                   jg         0x7f98bfe61660
00260 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00268 4585d2                         test       r10d, r10d
0026b 0f8e91060000                   jle        0x7f98bfe61382
00271 458bd1                         mov        r10d, r9d
00274 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0027c 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00281 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00286 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
0028e 4503dd                         add        r11d, r13d
00291 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00296 0f8f8d020000                   jg         0x7f98bfe60fa9
0029c 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
002a1 0f8f850a0000                   jg         0x7f98bfe617ac
002a7 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
002af 4183fb10                       cmp        r11d, 0x10
002b3 0f8ff30a0000                   jg         0x7f98bfe6182c
002b9 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
002be 0f8304030000                   jae        0x7f98bfe61048
002c4 418be9                         mov        ebp, r9d
002c7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002cc c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002d3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
002d8 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
002dd 0f8365030000                   jae        0x7f98bfe610c8
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
0031e 0f8e080b0000                   jle        0x7f98bfe618ac
00324 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0032c 453bda                         cmp        r11d, r10d
0032f 0f8c8b060000                   jl         0x7f98bfe61440
00335 4183fa30                       cmp        r10d, 0x30
00339 0f8ef1060000                   jle        0x7f98bfe614b0
0033f 85ed                           test       ebp, ebp
00341 0f8c93030000                   jl         0x7f98bfe6115a
00347 4585c9                         test       r9d, r9d
0034a 0f8c8a030000                   jl         0x7f98bfe6115a
00350 458d0c2a                       lea        r9d, [r10 + rbp]
00354 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00359 453bd9                         cmp        r11d, r9d
0035c 0f8278030000                   jb         0x7f98bfe6115a
00362 418bda                         mov        ebx, r10d
00365 039c2480000000                 add        ebx, dword ptr [rsp + 0x80]
0036c 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00370 443bdb                         cmp        r11d, ebx
00373 0f8261030000                   jb         0x7f98bfe6115a
00379 4585d2                         test       r10d, r10d
0037c 0f844e030000                   je         0x7f98bfe61150
00382 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00387 498d7c2a08                     lea        rdi, [r10 + rbp + 8]
0038c 4803ca                         add        rcx, rdx
0038f 498d740a08                     lea        rsi, [r10 + rcx + 8]
00394 4963d5                         movsxd     rdx, r13d
00397 4883fa20                       cmp        rdx, 0x20
0039b 762e                           jbe        0x7f98bfe60e4b
0039d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003a2 c5f877                         vzeroupper 
003a5 49ba204f8ebf987f0000           movabs     r10, 0x7f98bf8e4f20
003af 41ffd2                         call       r10
003b2 0f1f840000000000               nop        dword ptr [rax + rax]
003ba eb34                           jmp        0x7f98bfe60e70
003bc 85c9                           test       ecx, ecx
003be 0f8498030000                   je         0x7f98bfe611dc
003c4 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003c9 eb73                           jmp        0x7f98bfe60ebe
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
003fd 7d0a                           jge        0x7f98bfe60e89
003ff 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00404 e996fdffff                     jmp        0x7f98bfe60c1f
00409 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0040e 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
00413 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00418 4585c9                         test       r9d, r9d
0041b 0f8cc7040000                   jl         0x7f98bfe61368
00421 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
00429 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
0042e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00432 8bb424c4000000                 mov        esi, dword ptr [rsp + 0xc4]
00439 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0043e 4585d2                         test       r10d, r10d
00441 0f8c3a010000                   jl         0x7f98bfe61001
00447 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
0044b 0f8235010000                   jb         0x7f98bfe61006
00451 438d2c02                       lea        ebp, [r10 + r8]
00455 8b5904                         mov        ebx, dword ptr [rcx + 4]
00458 3bdd                           cmp        ebx, ebp
0045a 0f822b010000                   jb         0x7f98bfe6100b
00460 4585c0                         test       r8d, r8d
00463 0f8c27010000                   jl         0x7f98bfe61010
00469 4585c0                         test       r8d, r8d
0046c 7436                           je         0x7f98bfe60f24
0046e 4a8d7c0f08                     lea        rdi, [rdi + r9 + 8]
00473 4c8bd9                         mov        r11, rcx
00476 4a8d741108                     lea        rsi, [rcx + r10 + 8]
0047b 4963d0                         movsxd     rdx, r8d
0047e 4883fa20                       cmp        rdx, 0x20
00482 773a                           ja         0x7f98bfe60f3e
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
004b7 0f87a60a0000                   ja         0x7f98bfe619e3
004bd c3                             ret        
004be c5f877                         vzeroupper 
004c1 49ba204f8ebf987f0000           movabs     r10, 0x7f98bf8e4f20
004cb 41ffd2                         call       r10
004ce 0f1f840000000000               nop        dword ptr [rax + rax]
004d6 ebcc                           jmp        0x7f98bfe60f24
004d8 4533d2                         xor        r10d, r10d
004db 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
004e3 e911fdffff                     jmp        0x7f98bfe60c79
004e8 83c3fd                         add        ebx, -3
004eb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004f0 4183fb02                       cmp        r11d, 2
004f4 0f86a2090000                   jbe        0x7f98bfe6191c
004fa 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004ff 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00503 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00508 45895310                       mov        dword ptr [r11 + 0x10], r10d
0050c 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00510 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00515 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00519 41895a08                       mov        dword ptr [r10 + 8], ebx
0051d 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00524 e904fdffff                     jmp        0x7f98bfe60cad
00529 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0052e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00533 498bea                         mov        rbp, r10
00536 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0053e 488bf5                         mov        rsi, rbp
00541 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00545 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0054a 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
00551 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00559 44891424                       mov        dword ptr [rsp], r10d
0055d 44896c2408                     mov        dword ptr [rsp + 8], r13d
00562 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00566 6690                           nop        
00568 c5f877                         vzeroupper 
0056b e870a8a9ff                     call       0x7f98bf8fb860
00570 0f1f840068060000               nop        dword ptr [rax + rax + 0x668]
00578 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0057c e96ffeffff                     jmp        0x7f98bfe60e70
00581 418bea                         mov        ebp, r10d
00584 eb0d                           jmp        0x7f98bfe61013
00586 418bea                         mov        ebp, r10d
00589 eb08                           jmp        0x7f98bfe61013
0058b 418bea                         mov        ebp, r10d
0058e eb03                           jmp        0x7f98bfe61013
00590 418bea                         mov        ebp, r10d
00593 beccffffff                     mov        esi, 0xffffffcc
00598 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
005a0 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
005a5 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
005ad 894c240c                       mov        dword ptr [rsp + 0xc], ecx
005b1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
005b6 6690                           nop        
005b8 c5f877                         vzeroupper 
005bb e82029b6ff                     call       0x7f98bf9c3960
005c0 0f1f8400b8060001               nop        dword ptr [rax + rax + 0x10006b8]
005c8 bee4ffffff                     mov        esi, 0xffffffe4
005cd 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
005d5 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
005da 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
005e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
005e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
005ec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
005f1 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
005f9 48894424f8                     mov        qword ptr [rsp - 8], rax
005fe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00602 89442428                       mov        dword ptr [rsp + 0x28], eax
00606 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0060b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00610 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00615 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0061a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0061f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00624 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00629 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0062e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00633 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00638 c5f877                         vzeroupper 
0063b e8a028b6ff                     call       0x7f98bf9c3960
00640 0f1f840038070002               nop        dword ptr [rax + rax + 0x2000738]
00648 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00651 bee4ffffff                     mov        esi, 0xffffffe4
00656 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0065e 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00666 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0066b 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00673 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00678 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0067d 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00682 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00687 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0068c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00691 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00696 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0069b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
006a0 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
006a5 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
006aa 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
006af 4489442448                     mov        dword ptr [rsp + 0x48], r8d
006b4 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
006b9 4489542454                     mov        dword ptr [rsp + 0x54], r10d
006be 6690                           nop        
006c0 c5f877                         vzeroupper 
006c3 e81828b6ff                     call       0x7f98bf9c3960
006c8 0f1f8400c0070003               nop        dword ptr [rax + rax + 0x30007c0]
006d0 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006d5 e916fdffff                     jmp        0x7f98bfe60e70
006da beccffffff                     mov        esi, 0xffffffcc
006df 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006e7 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
006ef 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006f4 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
006fc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00701 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00706 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0070b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00710 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00715 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0071a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0071f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00724 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00729 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0072e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00733 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00738 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0073d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00742 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00747 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0074c c5f877                         vzeroupper 
0074f e88c27b6ff                     call       0x7f98bf9c3960
00754 0f1f84004c080004               nop        dword ptr [rax + rax + 0x400084c]
0075c bef6ffffff                     mov        esi, 0xfffffff6
00761 488bea                         mov        rbp, rdx
00764 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0076c c5f877                         vzeroupper 
0076f e86c27b6ff                     call       0x7f98bf9c3960
00774 0f1f84006c080005               nop        dword ptr [rax + rax + 0x500086c]
0077c be6effffff                     mov        esi, 0xffffff6e
00781 498bee                         mov        rbp, r14
00784 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
0078c 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00791 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00796 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0079b 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0079f 48894424f8                     mov        qword ptr [rsp - 8], rax
007a4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
007a8 89442428                       mov        dword ptr [rsp + 0x28], eax
007ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007b1 48894424f8                     mov        qword ptr [rsp - 8], rax
007b6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
007ba 8944242c                       mov        dword ptr [rsp + 0x2c], eax
007be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007c3 48ff742440                     push       qword ptr [rsp + 0x40]
007c8 488f442430                     pop        qword ptr [rsp + 0x30]
007cd 48ff742448                     push       qword ptr [rsp + 0x48]
007d2 488f442438                     pop        qword ptr [rsp + 0x38]
007d7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007dc 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
007e1 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007e6 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
007eb 90                             nop        
007ec c5f877                         vzeroupper 
007ef e8ec26b6ff                     call       0x7f98bf9c3960
007f4 0f1f8400ec080006               nop        dword ptr [rax + rax + 0x60008ec]
007fc 4533c9                         xor        r9d, r9d
007ff 4d3bd9                         cmp        r11, r9
00802 bdffffffff                     mov        ebp, 0xffffffff
00807 7c08                           jl         0x7f98bfe61291
00809 400f95c5                       setne      bpl
0080d 400fb6ed                       movzx      ebp, bpl
00811 be45ffffff                     mov        esi, 0xffffff45
00816 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
0081e 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00823 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00828 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0082d 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00831 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00836 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0083b 48ff742440                     push       qword ptr [rsp + 0x40]
00840 488f442438                     pop        qword ptr [rsp + 0x38]
00845 48ff742448                     push       qword ptr [rsp + 0x48]
0084a 488f442440                     pop        qword ptr [rsp + 0x40]
0084f 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00854 c5f877                         vzeroupper 
00857 e88426b6ff                     call       0x7f98bf9c3960
0085c 0f1f840054090007               nop        dword ptr [rax + rax + 0x7000954]
00864 bebeffffff                     mov        esi, 0xffffffbe
00869 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00871 4889bc24c8000000               mov        qword ptr [rsp + 0xc8], rdi
00879 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0087e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00883 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00888 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0088c 48894424f8                     mov        qword ptr [rsp - 8], rax
00891 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00895 89442428                       mov        dword ptr [rsp + 0x28], eax
00899 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089e 48894424f8                     mov        qword ptr [rsp - 8], rax
008a3 8b442438                       mov        eax, dword ptr [rsp + 0x38]
008a7 8944242c                       mov        dword ptr [rsp + 0x2c], eax
008ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b0 48ff742440                     push       qword ptr [rsp + 0x40]
008b5 488f442430                     pop        qword ptr [rsp + 0x30]
008ba 48ff742448                     push       qword ptr [rsp + 0x48]
008bf 488f442438                     pop        qword ptr [rsp + 0x38]
008c4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
008c9 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
008ce 4489442444                     mov        dword ptr [rsp + 0x44], r8d
008d3 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
008d8 c5f877                         vzeroupper 
008db e80026b6ff                     call       0x7f98bf9c3960
008e0 0f1f8400d8090008               nop        dword ptr [rax + rax + 0x80009d8]
008e8 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
008ec 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
008f4 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
008f9 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
008fd e991fcffff                     jmp        0x7f98bfe61013
00902 be45ffffff                     mov        esi, 0xffffff45
00907 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0090f 90                             nop        
00910 c5f877                         vzeroupper 
00913 e8c825b6ff                     call       0x7f98bf9c3960
00918 0f1f8400100a0009               nop        dword ptr [rax + rax + 0x9000a10]
00920 ffcb                           dec        ebx
00922 be45ffffff                     mov        esi, 0xffffff45
00927 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0092f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00934 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0093c 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00941 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00949 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0094e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00953 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00958 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00960 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00965 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0096a 48894424f8                     mov        qword ptr [rsp - 8], rax
0096f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00973 89442428                       mov        dword ptr [rsp + 0x28], eax
00977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00981 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00986 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0098b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00990 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00995 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0099a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0099f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
009a4 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
009a9 895c2458                       mov        dword ptr [rsp + 0x58], ebx
009ad 666690                         nop        
009b0 c5f877                         vzeroupper 
009b3 e82825b6ff                     call       0x7f98bf9c3960
009b8 0f1f8400b00a000a               nop        dword ptr [rax + rax + 0xa000ab0]
009c0 be45ffffff                     mov        esi, 0xffffff45
009c5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
009cd 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
009d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
009da 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
009e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009ec 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009f1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
009f6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009fb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a00 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a05 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a0a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a0f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a14 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a19 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00a1e 6690                           nop        
00a20 c5f877                         vzeroupper 
00a23 e8b824b6ff                     call       0x7f98bf9c3960
00a28 0f1f8400200b000b               nop        dword ptr [rax + rax + 0xb000b20]
00a30 be45ffffff                     mov        esi, 0xffffff45
00a35 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00a3d 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00a45 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a4a 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00a52 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a5c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a61 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00a66 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a6b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a70 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a75 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a7a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a7f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a84 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a89 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00a8e 6690                           nop        
00a90 c5f877                         vzeroupper 
00a93 e84824b6ff                     call       0x7f98bf9c3960
00a98 0f1f8400900b000c               nop        dword ptr [rax + rax + 0xc000b90]
00aa0 be45ffffff                     mov        esi, 0xffffff45
00aa5 8bac24c0000000                 mov        ebp, dword ptr [rsp + 0xc0]
00aac 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00ab4 c5f877                         vzeroupper 
00ab7 e82424b6ff                     call       0x7f98bf9c3960
00abc 0f1f8400b40b000d               nop        dword ptr [rax + rax + 0xd000bb4]
00ac4 4d3bcb                         cmp        r9, r11
00ac7 bdffffffff                     mov        ebp, 0xffffffff
00acc 7c08                           jl         0x7f98bfe61556
00ace 400f95c5                       setne      bpl
00ad2 400fb6ed                       movzx      ebp, bpl
00ad6 be45ffffff                     mov        esi, 0xffffff45
00adb 90                             nop        
00adc c5f877                         vzeroupper 
00adf e8fc23b6ff                     call       0x7f98bf9c3960
00ae4 0f1f8400dc0b000e               nop        dword ptr [rax + rax + 0xe000bdc]
00aec 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00af1 493bfb                         cmp        rdi, r11
00af4 bdffffffff                     mov        ebp, 0xffffffff
00af9 7c08                           jl         0x7f98bfe61583
00afb 400f95c5                       setne      bpl
00aff 400fb6ed                       movzx      ebp, bpl
00b03 be45ffffff                     mov        esi, 0xffffff45
00b08 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00b10 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00b15 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00b1a 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
00b1f 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00b23 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b28 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00b2d 48ff742440                     push       qword ptr [rsp + 0x40]
00b32 488f442438                     pop        qword ptr [rsp + 0x38]
00b37 90                             nop        
00b38 c5f877                         vzeroupper 
00b3b e8a023b6ff                     call       0x7f98bf9c3960
00b40 0f1f8400380c000f               nop        dword ptr [rax + rax + 0xf000c38]
00b48 be45ffffff                     mov        esi, 0xffffff45
00b4d 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00b55 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b5a 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00b62 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00b67 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00b6f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b74 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b79 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b7e 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00b86 48894424f8                     mov        qword ptr [rsp - 8], rax
00b8b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00b8f 89442428                       mov        dword ptr [rsp + 0x28], eax
00b93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b98 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00b9d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ba2 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ba7 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00bac 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00bb1 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00bb6 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00bbb 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bc0 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00bc5 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00bca 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00bce 6690                           nop        
00bd0 c5f877                         vzeroupper 
00bd3 e80823b6ff                     call       0x7f98bf9c3960
00bd8 0f1f8400d00c0010               nop        dword ptr [rax + rax + 0x10000cd0]
00be0 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
00be8 4c3bd1                         cmp        r10, rcx
00beb bdffffffff                     mov        ebp, 0xffffffff
00bf0 7c08                           jl         0x7f98bfe6167a
00bf2 400f95c5                       setne      bpl
00bf6 400fb6ed                       movzx      ebp, bpl
00bfa be45ffffff                     mov        esi, 0xffffff45
00bff 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c07 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00c0f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00c14 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00c1c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c21 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c26 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c2b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c30 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00c35 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c3f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00c43 89442430                       mov        dword ptr [rsp + 0x30], eax
00c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4c 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c51 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00c56 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00c5b 90                             nop        
00c5c c5f877                         vzeroupper 
00c5f e87c22b6ff                     call       0x7f98bf9c3960
00c64 0f1f84005c0d0011               nop        dword ptr [rax + rax + 0x11000d5c]
00c6c be45ffffff                     mov        esi, 0xffffff45
00c71 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00c79 666690                         nop        
00c7c c5f877                         vzeroupper 
00c7f e85c22b6ff                     call       0x7f98bf9c3960
00c84 0f1f84007c0d0012               nop        dword ptr [rax + rax + 0x12000d7c]
00c8c ffcb                           dec        ebx
00c8e be45ffffff                     mov        esi, 0xffffff45
00c93 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00c9b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00ca0 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00ca8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00cad 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00cb5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00cba 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00cbf 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00cc4 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00ccc 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00cd1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00cdb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cdf 89442428                       mov        dword ptr [rsp + 0x28], eax
00ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ce8 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ced 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00cf2 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cf7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00cfc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00d01 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00d06 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00d0b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d10 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00d15 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00d19 666690                         nop        
00d1c c5f877                         vzeroupper 
00d1f e8bc21b6ff                     call       0x7f98bf9c3960
00d24 0f1f84001c0e0013               nop        dword ptr [rax + rax + 0x13000e1c]
00d2c be45ffffff                     mov        esi, 0xffffff45
00d31 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00d39 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00d3e 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00d46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d50 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d55 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
00d62 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d66 89442428                       mov        dword ptr [rsp + 0x28], eax
00d6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d6f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d74 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d79 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00d7e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00d83 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00d88 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00d8d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00d92 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d97 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00d9c c5f877                         vzeroupper 
00d9f e83c21b6ff                     call       0x7f98bf9c3960
00da4 0f1f84009c0e0014               nop        dword ptr [rax + rax + 0x14000e9c]
00dac be45ffffff                     mov        esi, 0xffffff45
00db1 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00db9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00dbe 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00dc6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dcb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dd0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dd5 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
00de2 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00de6 89442428                       mov        dword ptr [rsp + 0x28], eax
00dea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00def 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00df4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00df9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00dfe 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e03 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e08 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e0d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e12 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e17 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00e1c c5f877                         vzeroupper 
00e1f e8bc20b6ff                     call       0x7f98bf9c3960
00e24 0f1f84001c0f0015               nop        dword ptr [rax + rax + 0x15000f1c]
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00e39 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00e41 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00e46 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00e4e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e53 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e58 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e5d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e62 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e67 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e6c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e71 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e76 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e7b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e80 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00e85 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00e8a 6690                           nop        
00e8c c5f877                         vzeroupper 
00e8f e84c20b6ff                     call       0x7f98bf9c3960
00e94 0f1f84008c0f0016               nop        dword ptr [rax + rax + 0x16000f8c]
00e9c bee4ffffff                     mov        esi, 0xffffffe4
00ea1 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00ea9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00eae 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00eb6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00ebb 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00ec3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ec8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ecd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ed2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00eda 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00edf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00ee4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00eed 89442428                       mov        dword ptr [rsp + 0x28], eax
00ef1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef6 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00efb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f00 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f05 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00f0a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f0f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f14 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f19 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f1e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00f23 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00f27 90                             nop        
00f28 c5f877                         vzeroupper 
00f2b e8b01fb6ff                     call       0x7f98bf9c3960
00f30 0f1f840028100017               nop        dword ptr [rax + rax + 0x17001028]
00f38 bef6ffffff                     mov        esi, 0xfffffff6
00f3d 666690                         nop        
00f40 c5f877                         vzeroupper 
00f43 e8981fb6ff                     call       0x7f98bf9c3960
00f48 0f1f840040100018               nop        dword ptr [rax + rax + 0x18001040]
00f50 488bf0                         mov        rsi, rax
00f53 c5f877                         vzeroupper 
00f56 4881c4b0000000                 add        rsp, 0xb0
00f5d 5d                             pop        rbp
00f5e e97d45b6ff                     jmp        0x7f98bf9c5f60
00f63 49ba330fe6bf987f0000           movabs     r10, 0x7f98bfe60f33
00f6d 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00f74 e9e7c4a9ff                     jmp        0x7f98bf8fdee0
00f79 e8a290a8ff                     call       0x7f98bf8eaaa0
00f7e e9bbf0ffff                     jmp        0x7f98bfe60abe
00f83 f4                             hlt        
00f84 f4                             hlt        
00f85 f4                             hlt        
00f86 f4                             hlt        
00f87 f4                             hlt        
