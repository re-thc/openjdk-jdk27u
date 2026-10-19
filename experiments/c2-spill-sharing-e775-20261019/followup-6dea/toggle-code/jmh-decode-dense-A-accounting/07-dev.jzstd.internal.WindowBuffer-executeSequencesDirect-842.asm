00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c076a7ff                   jne        0x7febff8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f854c1c0000                   jne        0x7febffe83f0a
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bc7                         mov        r8d, edi
0004e 488bee                         mov        rbp, rsi
00051 8b7638                         mov        esi, dword ptr [rsi + 0x38]
00054 448b5504                       mov        r10d, dword ptr [rbp + 4]
00058 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0005d 458bda                         mov        r11d, r10d
00060 442bde                         sub        r11d, esi
00063 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
0006b 453bd3                         cmp        r10d, r11d
0006e 0f8f24130000                   jg         0x7febffe83618
00074 488b4508                       mov        rax, qword ptr [rbp + 8]
00078 4c8b4d20                       mov        r9, qword ptr [rbp + 0x20]
0007c 4c639c24d0000000               movsxd     r11, dword ptr [rsp + 0xd0]
00084 4c63d6                         movsxd     r10, esi
00087 4c03d0                         add        r10, rax
0008a 4d2bca                         sub        r9, r10
0008d 4d3bd9                         cmp        r11, r9
00090 0f8f02130000                   jg         0x7febffe83618
00096 4c8b7510                       mov        r14, qword ptr [rbp + 0x10]
0009a 4c8b6d28                       mov        r13, qword ptr [rbp + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f84130b0000                   je         0x7febffe82e3a
000a7 33db                           xor        ebx, ebx
000a9 4c8bda                         mov        r11, rdx
000ac 8b5204                         mov        edx, dword ptr [rdx + 4]
000af 8b7d40                         mov        edi, dword ptr [rbp + 0x40]
000b2 4585c0                         test       r8d, r8d
000b5 0f8efd110000                   jle        0x7febffe83538
000bb 89742414                       mov        dword ptr [rsp + 0x14], esi
000bf 4c2be8                         sub        r13, rax
000c2 448d4ae0                       lea        r9d, [rdx - 0x20]
000c6 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
000ca 83c1e0                         add        ecx, -0x20
000cd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d2 418b7204                       mov        esi, dword ptr [r10 + 4]
000d6 85f6                           test       esi, esi
000d8 0f86ee120000                   jbe        0x7febffe8364c
000de 894c2420                       mov        dword ptr [rsp + 0x20], ecx
000e2 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000e7 897c2410                       mov        dword ptr [rsp + 0x10], edi
000eb 8954243c                       mov        dword ptr [rsp + 0x3c], edx
000ef 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f4 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f9 4889442418                     mov        qword ptr [rsp + 0x18], rax
000fe 4489442404                     mov        dword ptr [rsp + 4], r8d
00103 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0010b 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
00110 4c63d6                         movsxd     r10, esi
00113 4d63d8                         movsxd     r11, r8d
00116 49ffcb                         dec        r11
00119 4d3bda                         cmp        r11, r10
0011c 0f838e120000                   jae        0x7febffe83630
00122 85db                           test       ebx, ebx
00124 0f8495120000                   je         0x7febffe8363f
0012a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00132 458b5304                       mov        r10d, dword ptr [r11 + 4]
00136 4585d2                         test       r10d, r10d
00139 0f86da120000                   jbe        0x7febffe83699
0013f 4183fa01                       cmp        r10d, 1
00143 0f86d0120000                   jbe        0x7febffe83699
00149 4183fa02                       cmp        r10d, 2
0014d 0f86c6120000                   jbe        0x7febffe83699
00153 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0015b 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0015f 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00164 448b5704                       mov        r10d, dword ptr [rdi + 4]
00168 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00170 448d52f1                       lea        r10d, [rdx - 0xf]
00174 4585d2                         test       r10d, r10d
00177 0f8cf3120000                   jl         0x7febffe836f0
0017d 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00185 4183c3f1                       add        r11d, -0xf
00189 4585db                         test       r11d, r11d
0018c 0f8ce5120000                   jl         0x7febffe836f7
00192 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
0019a 4183c2f9                       add        r10d, -7
0019e 4585d2                         test       r10d, r10d
001a1 0f8cd7120000                   jl         0x7febffe836fe
001a7 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
001af 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
001b4 4c8bd7                         mov        r10, rdi
001b7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001bc 458d53f1                       lea        r10d, [r11 - 0xf]
001c0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
001c5 448bda                         mov        r11d, edx
001c8 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001cd 458d53f1                       lea        r10d, [r11 - 0xf]
001d1 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001d6 4533d2                         xor        r10d, r10d
001d9 33db                           xor        ebx, ebx
001db e9c0010000                     jmp        0x7febffe82620
001e0 4533c0                         xor        r8d, r8d
001e3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
001e8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
001ed 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
001f1 448bda                         mov        r11d, edx
001f4 4183fb03                       cmp        r11d, 3
001f8 0f8e63030000                   jle        0x7febffe827e1
001fe 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00203 41894b10                       mov        dword ptr [r11 + 0x10], ecx
00207 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0020b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00210 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00214 448d5afd                       lea        r11d, [rdx - 3]
00218 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00220 45895808                       mov        dword ptr [r8 + 8], r11d
00224 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0022c 4c639c2480000000               movsxd     r11, dword ptr [rsp + 0x80]
00234 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00239 4c03542418                     add        r10, qword ptr [rsp + 0x18]
0023e 4863542428                     movsxd     rdx, dword ptr [rsp + 0x28]
00243 4c03d2                         add        r10, rdx
00246 4d3bda                         cmp        r11, r10
00249 0f8f2d0f0000                   jg         0x7febffe833fc
0024f 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00257 4585db                         test       r11d, r11d
0025a 0f8e780e0000                   jle        0x7febffe83358
00260 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
00265 4403742428                     add        r14d, dword ptr [rsp + 0x28]
0026a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0026f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00274 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00279 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0027e 4503d6                         add        r10d, r14d
00281 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00289 498d7c1b08                     lea        rdi, [r11 + rbx + 8]
0028e 448bdb                         mov        r11d, ebx
00291 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
00296 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0029e 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
002a3 0f8f55090000                   jg         0x7febffe82e7e
002a9 443b5c2424                     cmp        r11d, dword ptr [rsp + 0x24]
002ae 0f8f1c0f0000                   jg         0x7febffe83450
002b4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002b9 4183fa10                       cmp        r10d, 0x10
002bd 0f8f61010000                   jg         0x7febffe826a4
002c3 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
002c7 0f83670d0000                   jae        0x7febffe832b4
002cd 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
002d5 c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002dc 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
002e1 0f83910d0000                   jae        0x7febffe832f8
002e7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002ec 4403db                         add        r11d, ebx
002ef 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002f7 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
002fc c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00303 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00308 4503d8                         add        r11d, r8d
0030b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00310 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00315 442b842480000000               sub        r8d, dword ptr [rsp + 0x80]
0031d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00322 4183fa10                       cmp        r10d, 0x10
00326 0f8f1c0f0000                   jg         0x7febffe834c8
0032c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00334 4183fb10                       cmp        r11d, 0x10
00338 0f8c26030000                   jl         0x7febffe828e4
0033e 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00343 0f833d0c0000                   jae        0x7febffe83206
00349 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0034e c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00355 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0035a 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
0035f 0f83730c0000                   jae        0x7febffe83258
00365 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0036a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0036f c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00376 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0037b 4503da                         add        r11d, r10d
0037e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00383 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0038b 41ffc2                         inc        r10d
0038e 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00393 0f8d60070000                   jge        0x7febffe82d79
00399 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
003a0 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003a5 4f8b44d308                     mov        r8, qword ptr [r11 + r10*8 + 8]
003aa 4d8bd8                         mov        r11, r8
003ad 49c1eb12                       shr        r11, 0x12
003b1 458bdb                         mov        r11d, r11d
003b4 4181e3ffff0300                 and        r11d, 0x3ffff
003bb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003c0 4d8bd8                         mov        r11, r8
003c3 49c1fb24                       sar        r11, 0x24
003c7 458bc0                         mov        r8d, r8d
003ca 458bdb                         mov        r11d, r11d
003cd 418bd3                         mov        edx, r11d
003d0 4181e0ffff0100                 and        r8d, 0x1ffff
003d7 4489442428                     mov        dword ptr [rsp + 0x28], r8d
003dc 4585db                         test       r11d, r11d
003df 0f8c130d0000                   jl         0x7febffe83378
003e5 4585c0                         test       r8d, r8d
003e8 0f84f2fdffff                   je         0x7febffe82460
003ee 448b0424                       mov        r8d, dword ptr [rsp]
003f2 442bc3                         sub        r8d, ebx
003f5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
003fa 453bd8                         cmp        r11d, r8d
003fd 0f8ee5fdffff                   jle        0x7febffe82468
00403 be45ffffff                     mov        esi, 0xffffff45
00408 418beb                         mov        ebp, r11d
0040b 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00413 90                             nop        
00414 c5f877                         vzeroupper 
00417 e84427b4ff                     call       0x7febff9c4de0
0041c 0f1f840014050000               nop        dword ptr [rax + rax + 0x514]
00424 4183fa30                       cmp        r10d, 0x30
00428 0f8fbd050000                   jg         0x7febffe82c6b
0042e 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00432 0f839b0e0000                   jae        0x7febffe83553
00438 4c63cb                         movsxd     r9, ebx
0043b 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00443 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
0044a 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0044f 0f83cf0e0000                   jae        0x7febffe835a4
00455 458d5010                       lea        r10d, [r8 + 0x10]
00459 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00461 4963c8                         movsxd     rcx, r8d
00464 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00469 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
00470 453bd6                         cmp        r10d, r14d
00473 0f8dce000000                   jge        0x7febffe827c7
00479 4c2bc9                         sub        r9, rcx
0047c 4d63da                         movsxd     r11, r10d
0047f 48634c2450                     movsxd     rcx, dword ptr [rsp + 0x50]
00484 4883c1f1                       add        rcx, -0xf
00488 4f8d140b                       lea        r10, [r11 + r9]
0048c 4c3bd1                         cmp        r10, rcx
0048f 0f83f00f0000                   jae        0x7febffe83705
00495 4d63d6                         movsxd     r10, r14d
00498 4d2bd3                         sub        r10, r11
0049b 4983c20f                       add        r10, 0xf
0049f 4983e2f0                       and        r10, 0xfffffffffffffff0
004a3 458bd2                         mov        r10d, r10d
004a6 478d5c0210                     lea        r11d, [r10 + r8 + 0x10]
004ab 4d63d3                         movsxd     r10, r11d
004ae 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004b3 4c3bd9                         cmp        r11, rcx
004b6 0f83c90f0000                   jae        0x7febffe83705
004bc 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
004c4 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
004c9 0f83b60f0000                   jae        0x7febffe83705
004cf 4983c2f0                       add        r10, -0x10
004d3 4c635c2440                     movsxd     r11, dword ptr [rsp + 0x40]
004d8 4983c3f1                       add        r11, -0xf
004dc 4d3bd3                         cmp        r10, r11
004df 0f83a00f0000                   jae        0x7febffe83705
004e5 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
004ec 0f8fda0f0000                   jg         0x7febffe8374c
004f2 448bd3                         mov        r10d, ebx
004f5 452bd0                         sub        r10d, r8d
004f8 0f1f840000000000               nop        dword ptr [rax + rax]
00500 458bc2                         mov        r8d, r10d
00503 4403842484000000               add        r8d, dword ptr [rsp + 0x84]
0050b 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00513 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0051a 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00522 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00527 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0052e 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00536 4183c010                       add        r8d, 0x10
0053a 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00542 453bc6                         cmp        r8d, r14d
00545 7cb9                           jl         0x7febffe82780
00547 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0054c 4403db                         add        r11d, ebx
0054f 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00557 4489742438                     mov        dword ptr [rsp + 0x38], r14d
0055c e9affdffff                     jmp        0x7febffe82590
00561 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00566 4585c0                         test       r8d, r8d
00569 7406                           je         0x7febffe827f1
0056b 41ffcb                         dec        r11d
0056e 418bd3                         mov        edx, r11d
00571 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00576 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0057a 85d2                           test       edx, edx
0057c 0f84d0040000                   je         0x7febffe82cd2
00582 83fa03                         cmp        edx, 3
00585 0f84d4040000                   je         0x7febffe82cdf
0058b 83fa02                         cmp        edx, 2
0058e 0f878d000000                   ja         0x7febffe828a1
00594 3b9424d8000000                 cmp        edx, dword ptr [rsp + 0xd8]
0059b 0f83730f0000                   jae        0x7febffe83794
005a1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005a6 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
005ab 85d2                           test       edx, edx
005ad 7e54                           jle        0x7febffe82883
005af 448d42ff                       lea        r8d, [rdx - 1]
005b3 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
005bb 0f8347120000                   jae        0x7febffe83a88
005c1 4863fa                         movsxd     rdi, edx
005c4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005c9 458bc8                         mov        r9d, r8d
005cc 4183c1cc                       add        r9d, -0x34
005d0 41c1e902                       shr        r9d, 2
005d4 458d4411ff                     lea        r8d, [r9 + rdx - 1]
005d9 b904000000                     mov        ecx, 4
005de c442f0f5c0                     bzhi       r8, r8, rcx
005e3 492bf8                         sub        rdi, r8
005e6 48ffcf                         dec        rdi
005e9 4533c0                         xor        r8d, r8d
005ec 4885ff                         test       rdi, rdi
005ef 490f4cf8                       cmovl      rdi, r8
005f3 448bc7                         mov        r8d, edi
005f6 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
005fe e9c8020000                     jmp        0x7febffe82b4b
00603 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0060b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00610 45895a08                       mov        dword ptr [r10 + 8], r11d
00614 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0061c e90bfcffff                     jmp        0x7febffe824ac
00621 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00629 48bef011bce200000000           movabs     rsi, 0xe2bc11f0
00633 8beb                           mov        ebp, ebx
00635 666690                         nop        
00638 c5f877                         vzeroupper 
0063b e8a07fa7ff                     call       0x7febff8fa860
00640 0f1f840038070001               nop        dword ptr [rax + rax + 0x1000738]
00648 4885c0                         test       rax, rax
0064b 0f84470f0000                   je         0x7febffe83818
00651 488bf0                         mov        rsi, rax
00654 c5f877                         vzeroupper 
00657 4881c4c0000000                 add        rsp, 0xc0
0065e 5d                             pop        rbp
0065f e97c46b4ff                     jmp        0x7febff9c6f60
00664 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00669 4503da                         add        r11d, r10d
0066c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00671 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00679 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
0067e 0f8d8d010000                   jge        0x7febffe82a91
00684 4183fa08                       cmp        r10d, 8
00688 0f8d3e130000                   jge        0x7febffe83c4c
0068e 443b8424dc000000               cmp        r8d, dword ptr [rsp + 0xdc]
00696 0f83bc0f0000                   jae        0x7febffe838d8
0069c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006a1 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
006a7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
006ac 443b9c24dc000000               cmp        r11d, dword ptr [rsp + 0xdc]
006b4 0f830e100000                   jae        0x7febffe83948
006ba 458bda                         mov        r11d, r10d
006bd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006c2 43886c1308                     mov        byte ptr [r11 + r10 + 8], bpl
006c7 458d5003                       lea        r10d, [r8 + 3]
006cb 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006d0 41ffc1                         inc        r9d
006d3 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
006db 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
006e3 0f831b100000                   jae        0x7febffe83984
006e9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006ee 4183c203                       add        r10d, 3
006f2 4d63d8                         movsxd     r11, r8d
006f5 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
006fa 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
00700 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00708 0f8342100000                   jae        0x7febffe839d0
0070e 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00713 43886c1109                     mov        byte ptr [r9 + r10 + 9], bpl
00718 430fbe4c190a                   movsx      ecx, byte ptr [r9 + r11 + 0xa]
0071e 43884c110a                     mov        byte ptr [r9 + r10 + 0xa], cl
00723 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
00729 47885c110b                     mov        byte ptr [r9 + r10 + 0xb], r11b
0072e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00736 4183fa08                       cmp        r10d, 8
0073a 0f8358100000                   jae        0x7febffe83a18
00740 49ba1081b6e200000000           movabs     r10, 0xe2b68110
0074a 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00752 4703448a08                     add        r8d, dword ptr [r10 + r9*4 + 8]
00757 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0075c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00761 4183fa04                       cmp        r10d, 4
00765 7e3d                           jle        0x7febffe82a24
00767 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0076b 83c504                         add        ebp, 4
0076e 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00773 418bd0                         mov        edx, r8d
00776 6690                           nop        
00778 c5f877                         vzeroupper 
0077b e8607ea7ff                     call       0x7febff8fa860
00780 0f1f840078080002               nop        dword ptr [rax + rax + 0x2000878]
00788 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0078d 8bd5                           mov        edx, ebp
0078f 8bc8                           mov        ecx, eax
00791 666690                         nop        
00794 c5f877                         vzeroupper 
00797 e8447ea7ff                     call       0x7febff8fa860
0079c 0f1f840094080003               nop        dword ptr [rax + rax + 0x3000894]
007a4 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a9 4183fa08                       cmp        r10d, 8
007ad 0f8ed0fbffff                   jle        0x7febffe82603
007b3 49ba3881b6e200000000           movabs     r10, 0xe2b68138
007bd 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007c1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
007c9 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007ce 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
007d2 83c508                         add        ebp, 8
007d5 83c208                         add        edx, 8
007d8 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007dd 666690                         nop        
007e0 c5f877                         vzeroupper 
007e3 e8f87da7ff                     call       0x7febff8fa860
007e8 0f1f8400e0080004               nop        dword ptr [rax + rax + 0x40008e0]
007f0 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007f5 8bd5                           mov        edx, ebp
007f7 488bc8                         mov        rcx, rax
007fa 6690                           nop        
007fc c5f877                         vzeroupper 
007ff e8dc7da7ff                     call       0x7febff8fa860
00804 0f1f8400fc080005               nop        dword ptr [rax + rax + 0x50008fc]
0080c e972fbffff                     jmp        0x7febffe82603
00811 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00816 4183fb30                       cmp        r11d, 0x30
0081a 0f8ff8100000                   jg         0x7febffe83b98
00820 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00824 83c5f9                         add        ebp, -7
00827 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
0082e 443bc5                         cmp        r8d, ebp
00831 0f83790d0000                   jae        0x7febffe83830
00837 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
0083f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00844 4b8b6c0308                     mov        rbp, qword ptr [r11 + r8 + 8]
00849 4889ac2490000000               mov        qword ptr [rsp + 0x90], rbp
00851 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00856 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0085e 0f83a80d0000                   jae        0x7febffe8388c
00864 48be28c122e200000000           movabs     rsi, 0xe222c128
0086e 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00872 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
00879 4863cd                         movsxd     rcx, ebp
0087c 4883c108                       add        rcx, 8
00880 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00885 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
0088d 4533c9                         xor        r9d, r9d
00890 c5f877                         vzeroupper 
00893 e84873a7ff                     call       0x7febff8f9e60
00898 0f1f840090090006               nop        dword ptr [rax + rax + 0x6000990]
008a0 83c508                         add        ebp, 8
008a3 896c2438                       mov        dword ptr [rsp + 0x38], ebp
008a7 3b6c2414                       cmp        ebp, dword ptr [rsp + 0x14]
008ab 0f8cdf0f0000                   jl         0x7febffe83b10
008b1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
008b6 4403942480000000               add        r10d, dword ptr [rsp + 0x80]
008be 4489542414                     mov        dword ptr [rsp + 0x14], r10d
008c3 e9bbfaffff                     jmp        0x7febffe82603
008c8 418bd1                         mov        edx, r9d
008cb 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008d0 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
008d5 498bc9                         mov        rcx, r9
008d8 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
008dd 448d4aff                       lea        r9d, [rdx - 1]
008e1 453bc8                         cmp        r9d, r8d
008e4 7fe2                           jg         0x7febffe82b48
008e6 4183f93f                       cmp        r9d, 0x3f
008ea 0f8e980f0000                   jle        0x7febffe83b08
008f0 448bd2                         mov        r10d, edx
008f3 41ffca                         dec        r10d
008f6 458bca                         mov        r9d, r10d
008f9 eb08                           jmp        0x7febffe82b83
008fb 0f1f440000                     nop        dword ptr [rax + rax]
00900 458bca                         mov        r9d, r10d
00903 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00908 62917e486f8488c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x38]
00913 62917e487f8488ccffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x34], zmm0
0091e 62917e486f848888ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0x78]
00929 62917e487f84888cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0x74], zmm0
00934 62917e486f848848ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0xb8]
0093f 62917e487f84884cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0xb4], zmm0
0094a 62917e486f848808ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 - 0xf8]
00955 62917e487f84880cffffff         vmovdqu32  zmmword ptr [r8 + r9*4 - 0xf4], zmm0
00960 458d51c0                       lea        r10d, [r9 - 0x40]
00964 4183fa3f                       cmp        r10d, 0x3f
00968 7f96                           jg         0x7febffe82b80
0096a 4183fa0f                       cmp        r10d, 0xf
0096e 7e2d                           jle        0x7febffe82c1d
00970 458bd1                         mov        r10d, r9d
00973 4183c2c0                       add        r10d, -0x40
00977 90                             nop        
00978 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0097d 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00988 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00993 4183c2f0                       add        r10d, -0x10
00997 4183fa0f                       cmp        r10d, 0xf
0099b 7fdb                           jg         0x7febffe82bf8
0099d 4585d2                         test       r10d, r10d
009a0 0f8e65fcffff                   jle        0x7febffe8288b
009a6 6690                           nop        
009a8 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
009ad 478b4c9004                     mov        r9d, dword ptr [r8 + r10*4 + 4]
009b2 47894c9008                     mov        dword ptr [r8 + r10*4 + 8], r9d
009b7 41ffca                         dec        r10d
009ba 4585d2                         test       r10d, r10d
009bd 7fe9                           jg         0x7febffe82c28
009bf e947fcffff                     jmp        0x7febffe8288b
009c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009c9 4d63d2                         movsxd     r10, r10d
009cc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009d3 c442a8f5db                     bzhi       r11, r11, r10
009d8 c4c1fb92fb                     kmovq      k7, r11
009dd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009e3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e9 eb5d                           jmp        0x7febffe82cc8
009eb 85db                           test       ebx, ebx
009ed 0f8c950f0000                   jl         0x7febffe83c08
009f3 4585c0                         test       r8d, r8d
009f6 0f8c8c0f0000                   jl         0x7febffe83c08
009fc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a01 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00a09 0f82790f0000                   jb         0x7febffe83c08
00a0f 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00a17 453bd6                         cmp        r10d, r14d
00a1a 0f82680f0000                   jb         0x7febffe83c08
00a20 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a25 4585db                         test       r11d, r11d
00a28 741e                           je         0x7febffe82cc8
00a2a 4883fa20                       cmp        rdx, 0x20
00a2e 7694                           jbe        0x7febffe82c44
00a30 c5f877                         vzeroupper 
00a33 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00a3d 41ffd2                         call       r10
00a40 0f1f840000000000               nop        dword ptr [rax + rax]
00a48 4489742438                     mov        dword ptr [rsp + 0x38], r14d
00a4d e9bef8ffff                     jmp        0x7febffe82590
00a52 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a5a e9b5fbffff                     jmp        0x7febffe82894
00a5f 41ffcb                         dec        r11d
00a62 4585db                         test       r11d, r11d
00a65 7e27                           jle        0x7febffe82d0e
00a67 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00a6c 41894810                       mov        dword ptr [r8 + 0x10], ecx
00a70 458b4008                       mov        r8d, dword ptr [r8 + 8]
00a74 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00a79 4589410c                       mov        dword ptr [r9 + 0xc], r8d
00a7d 45895908                       mov        dword ptr [r9 + 8], r11d
00a81 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a89 e986fbffff                     jmp        0x7febffe82894
00a8e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00a96 48bec011bce200000000           movabs     rsi, 0xe2bc11c0
00aa0 8beb                           mov        ebp, ebx
00aa2 6690                           nop        
00aa4 c5f877                         vzeroupper 
00aa7 e8347ba7ff                     call       0x7febff8fa860
00aac 0f1f8400a40b0007               nop        dword ptr [rax + rax + 0x7000ba4]
00ab4 4885c0                         test       rax, rax
00ab7 0f8594fbffff                   jne        0x7febffe828d1
00abd bef6ffffff                     mov        esi, 0xfffffff6
00ac2 6690                           nop        
00ac4 c5f877                         vzeroupper 
00ac7 e89420b4ff                     call       0x7febff9c4de0
00acc 0f1f8400c40b0008               nop        dword ptr [rax + rax + 0x8000bc4]
00ad4 4d63d2                         movsxd     r10, r10d
00ad7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ade c442a8f5db                     bzhi       r11, r11, r10
00ae3 c4c1fb92fb                     kmovq      k7, r11
00ae8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aee 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00af4 e9a8000000                     jmp        0x7febffe82e21
00af9 448b1c24                       mov        r11d, dword ptr [rsp]
00afd 458bd3                         mov        r10d, r11d
00b00 442b942484000000               sub        r10d, dword ptr [rsp + 0x84]
00b08 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b0d 4585db                         test       r11d, r11d
00b10 0f84320f0000                   je         0x7febffe83cc8
00b16 498bcb                         mov        rcx, r11
00b19 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00b21 4585c0                         test       r8d, r8d
00b24 0f8c560f0000                   jl         0x7febffe83d00
00b2a 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
00b2f 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00b37 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00b3b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b40 4585c9                         test       r9d, r9d
00b43 0f8c490f0000                   jl         0x7febffe83d12
00b49 3b1424                         cmp        edx, dword ptr [rsp]
00b4c 0f82400f0000                   jb         0x7febffe83d12
00b52 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
00b56 4103da                         add        ebx, r10d
00b59 8b7904                         mov        edi, dword ptr [rcx + 4]
00b5c 3bfb                           cmp        edi, ebx
00b5e 0f822e0f0000                   jb         0x7febffe83d12
00b64 4585d2                         test       r10d, r10d
00b67 0f8c250f0000                   jl         0x7febffe83d12
00b6d 4585d2                         test       r10d, r10d
00b70 742f                           je         0x7febffe82e21
00b72 4a8d740908                     lea        rsi, [rcx + r9 + 8]
00b77 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00b7c 4963d2                         movsxd     rdx, r10d
00b7f 4883fa20                       cmp        rdx, 0x20
00b83 0f864bffffff                   jbe        0x7febffe82d54
00b89 c5f877                         vzeroupper 
00b8c 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00b96 41ffd2                         call       r10
00b99 0f1f840000000000               nop        dword ptr [rax + rax]
00ba1 895d38                         mov        dword ptr [rbp + 0x38], ebx
00ba4 c5f877                         vzeroupper 
00ba7 4881c4c0000000                 add        rsp, 0xc0
00bae 5d                             pop        rbp
00baf 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00bb3 0f87bb100000                   ja         0x7febffe83ef4
00bb9 c3                             ret        
00bba 4d03d3                         add        r10, r11
00bbd 4d3bd6                         cmp        r10, r14
00bc0 7e08                           jle        0x7febffe82e4a
00bc2 4533ed                         xor        r13d, r13d
00bc5 e9ddf4ffff                     jmp        0x7febffe82327
00bca 4533ed                         xor        r13d, r13d
00bcd bb01000000                     mov        ebx, 1
00bd2 e9d2f4ffff                     jmp        0x7febffe82329
00bd7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bdc 4d63d3                         movsxd     r10, r11d
00bdf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00be6 c442a8f5db                     bzhi       r11, r11, r10
00beb c4c1fb92fb                     kmovq      k7, r11
00bf0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bf6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bfc eb6b                           jmp        0x7febffe82ee9
00bfe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c03 4585db                         test       r11d, r11d
00c06 0f8470030000                   je         0x7febffe831fc
00c0c 85db                           test       ebx, ebx
00c0e 0f8cf40e0000                   jl         0x7febffe83d88
00c14 4585c0                         test       r8d, r8d
00c17 0f8ceb0e0000                   jl         0x7febffe83d88
00c1d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c22 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00c2a 0f82d80e0000                   jb         0x7febffe83d88
00c30 448b9c24dc000000               mov        r11d, dword ptr [rsp + 0xdc]
00c38 453bde                         cmp        r11d, r14d
00c3b 0f82c70e0000                   jb         0x7febffe83d88
00c41 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c46 4585d2                         test       r10d, r10d
00c49 741e                           je         0x7febffe82ee9
00c4b 4883fa20                       cmp        rdx, 0x20
00c4f 7686                           jbe        0x7febffe82e57
00c51 c5f877                         vzeroupper 
00c54 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00c5e 41ffd2                         call       r10
00c61 0f1f840000000000               nop        dword ptr [rax + rax]
00c69 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c6e 4585db                         test       r11d, r11d
00c71 0f8ed6010000                   jle        0x7febffe830cd
00c77 458bd6                         mov        r10d, r14d
00c7a 442b942480000000               sub        r10d, dword ptr [rsp + 0x80]
00c82 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00c8a 4503de                         add        r11d, r14d
00c8d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c92 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00c97 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c9f 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00ca4 4b8d743308                     lea        rsi, [r11 + r14 + 8]
00ca9 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00cb1 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00cb6 0f8dec000000                   jge        0x7febffe83028
00cbc 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00cc1 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00cc9 458bd3                         mov        r10d, r11d
00ccc 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00cd4 450f4fd0                       cmovg      r10d, r8d
00cd8 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00ce0 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00ce8 4585d2                         test       r10d, r10d
00ceb 0f8c5f0e0000                   jl         0x7febffe83dd0
00cf1 4585f6                         test       r14d, r14d
00cf4 0f8c560e0000                   jl         0x7febffe83dd0
00cfa 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00d02 4403942488000000               add        r10d, dword ptr [rsp + 0x88]
00d0a 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00d12 453bc2                         cmp        r8d, r10d
00d15 0f82350e0000                   jb         0x7febffe83dd0
00d1b 458bd6                         mov        r10d, r14d
00d1e 4403942480000000               add        r10d, dword ptr [rsp + 0x80]
00d26 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d2e 453bc2                         cmp        r8d, r10d
00d31 0f82190e0000                   jb         0x7febffe83dd0
00d37 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00d3f 4585d2                         test       r10d, r10d
00d42 0f8c080e0000                   jl         0x7febffe83dd0
00d48 4585d2                         test       r10d, r10d
00d4b 7429                           je         0x7febffe82ff6
00d4d 4963d2                         movsxd     rdx, r10d
00d50 4883fa20                       cmp        rdx, 0x20
00d54 7738                           ja         0x7febffe8300e
00d56 4d63d2                         movsxd     r10, r10d
00d59 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d60 c442a8f5db                     bzhi       r11, r11, r10
00d65 c4c1fb92fb                     kmovq      k7, r11
00d6a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d70 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d76 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00d7e 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00d83 0f8dfaf5ffff                   jge        0x7febffe82603
00d89 e919010000                     jmp        0x7febffe83127
00d8e c5f877                         vzeroupper 
00d91 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00d9b 41ffd2                         call       r10
00d9e 0f1f840000000000               nop        dword ptr [rax + rax]
00da6 ebce                           jmp        0x7febffe82ff6
00da8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00db0 4585db                         test       r11d, r11d
00db3 0f8c0b0e0000                   jl         0x7febffe83e44
00db9 4585f6                         test       r14d, r14d
00dbc 0f8c020e0000                   jl         0x7febffe83e44
00dc2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00dc7 44039c2488000000               add        r11d, dword ptr [rsp + 0x88]
00dcf 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00dd7 453bd3                         cmp        r10d, r11d
00dda 0f82e40d0000                   jb         0x7febffe83e44
00de0 458bc2                         mov        r8d, r10d
00de3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00de8 453bc2                         cmp        r8d, r10d
00deb 0f82d30d0000                   jb         0x7febffe83e44
00df1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00df6 4585d2                         test       r10d, r10d
00df9 0f8484f5ffff                   je         0x7febffe82603
00dff 4963d2                         movsxd     rdx, r10d
00e02 4883fa20                       cmp        rdx, 0x20
00e06 7728                           ja         0x7febffe830b0
00e08 458bda                         mov        r11d, r10d
00e0b 4d63d3                         movsxd     r10, r11d
00e0e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e15 c442a8f5db                     bzhi       r11, r11, r10
00e1a c4c1fb92fb                     kmovq      k7, r11
00e1f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e25 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e2b e953f5ffff                     jmp        0x7febffe82603
00e30 c5f877                         vzeroupper 
00e33 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00e3d 41ffd2                         call       r10
00e40 0f1f840000000000               nop        dword ptr [rax + rax]
00e48 e936f5ffff                     jmp        0x7febffe82603
00e4d 4489742414                     mov        dword ptr [rsp + 0x14], r14d
00e52 e92cf5ffff                     jmp        0x7febffe82603
00e57 448bd5                         mov        r10d, ebp
00e5a 4d63d2                         movsxd     r10, r10d
00e5d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e64 c442a8f5db                     bzhi       r11, r11, r10
00e69 c4c1fb92fb                     kmovq      k7, r11
00e6e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e74 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e7a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00e82 4403dd                         add        r11d, ebp
00e85 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00e8d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00e91 418502                         test       dword ptr [r10], eax
00e94 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00e99 0f8de4f4ffff                   jge        0x7febffe82603
00e9f 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
00ea7 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00eaf 442b9c2480000000               sub        r11d, dword ptr [rsp + 0x80]
00eb7 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00ebf 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00ec3 2bac2480000000                 sub        ebp, dword ptr [rsp + 0x80]
00eca 3bac2480000000                 cmp        ebp, dword ptr [rsp + 0x80]
00ed1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00ed9 410f4fea                       cmovg      ebp, r10d
00edd 4585db                         test       r11d, r11d
00ee0 0f8ce20b0000                   jl         0x7febffe83d48
00ee6 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00eee 4585d2                         test       r10d, r10d
00ef1 0f8cd10b0000                   jl         0x7febffe83d48
00ef7 458d142b                       lea        r10d, [r11 + rbp]
00efb 448b8424dc000000               mov        r8d, dword ptr [rsp + 0xdc]
00f03 453bc2                         cmp        r8d, r10d
00f06 0f82bc0b0000                   jb         0x7febffe83d48
00f0c 448bac248c000000               mov        r13d, dword ptr [rsp + 0x8c]
00f14 4403ed                         add        r13d, ebp
00f17 458bd0                         mov        r10d, r8d
00f1a 453bd5                         cmp        r10d, r13d
00f1d 0f82a50b0000                   jb         0x7febffe83d48
00f23 85ed                           test       ebp, ebp
00f25 0f8c9d0b0000                   jl         0x7febffe83d48
00f2b 85ed                           test       ebp, ebp
00f2d 0f8447ffffff                   je         0x7febffe830fa
00f33 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f38 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00f40 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00f45 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00f4d 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00f52 4863d5                         movsxd     rdx, ebp
00f55 4883fa20                       cmp        rdx, 0x20
00f59 0f86f8feffff                   jbe        0x7febffe830d7
00f5f c5f877                         vzeroupper 
00f62 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00f6c 41ffd2                         call       r10
00f6f 0f1f840000000000               nop        dword ptr [rax + rax]
00f77 e9fefeffff                     jmp        0x7febffe830fa
00f7c 448b742414                     mov        r14d, dword ptr [rsp + 0x14]
00f81 e9e3fcffff                     jmp        0x7febffe82ee9
00f86 bee4ffffff                     mov        esi, 0xffffffe4
00f8b 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00f93 448b1424                       mov        r10d, dword ptr [rsp]
00f97 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00f9f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fa4 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00fac 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00fb1 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00fb9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fbe 4c891424                       mov        qword ptr [rsp], r10
00fc2 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00fc7 90                             nop        
00fc8 c5f877                         vzeroupper 
00fcb e8901bb4ff                     call       0x7febff9c4de0
00fd0 0f1f8400c810000a               nop        dword ptr [rax + rax + 0xa0010c8]
00fd8 bee4ffffff                     mov        esi, 0xffffffe4
00fdd 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
00fe5 448b1424                       mov        r10d, dword ptr [rsp]
00fe9 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00ff1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00ff6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00ffe 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01003 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0100b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01010 4c891424                       mov        qword ptr [rsp], r10
01014 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01019 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0101e c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01024 c5f877                         vzeroupper 
01027 e8341bb4ff                     call       0x7febff9c4de0
0102c 0f1f84002411000b               nop        dword ptr [rax + rax + 0xb001124]
01034 bee4ffffff                     mov        esi, 0xffffffe4
01039 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01041 448b1424                       mov        r10d, dword ptr [rsp]
01045 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0104d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01052 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0105a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0105f 4c891424                       mov        qword ptr [rsp], r10
01063 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01067 90                             nop        
01068 c5f877                         vzeroupper 
0106b e8f01ab4ff                     call       0x7febff9c4de0
01070 0f1f84006811000c               nop        dword ptr [rax + rax + 0xc001168]
01078 bee4ffffff                     mov        esi, 0xffffffe4
0107d 498bea                         mov        rbp, r10
01080 448b1c24                       mov        r11d, dword ptr [rsp]
01084 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0108c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01091 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01099 448b542404                     mov        r10d, dword ptr [rsp + 4]
0109e 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
010a6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
010ab 4c891424                       mov        qword ptr [rsp], r10
010af 895c2414                       mov        dword ptr [rsp + 0x14], ebx
010b3 4489442438                     mov        dword ptr [rsp + 0x38], r8d
010b8 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
010bd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
010c2 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
010c8 c5f877                         vzeroupper 
010cb e8901ab4ff                     call       0x7febff9c4de0
010d0 0f1f8400c811000d               nop        dword ptr [rax + rax + 0xd0011c8]
010d8 be45ffffff                     mov        esi, 0xffffff45
010dd 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
010e5 666690                         nop        
010e8 c5f877                         vzeroupper 
010eb e8701ab4ff                     call       0x7febff9c4de0
010f0 0f1f8400e811000e               nop        dword ptr [rax + rax + 0xe0011e8]
010f8 be45ffffff                     mov        esi, 0xffffff45
010fd 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01105 448b0424                       mov        r8d, dword ptr [rsp]
01109 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01111 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01116 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0111e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01123 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0112b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01130 4c891c24                       mov        qword ptr [rsp], r11
01134 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01139 4489442408                     mov        dword ptr [rsp + 8], r8d
0113e 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01143 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01148 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0114c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01151 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01156 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
0115b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01160 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01165 89542430                       mov        dword ptr [rsp + 0x30], edx
01169 666690                         nop        
0116c c5f877                         vzeroupper 
0116f e8ec19b4ff                     call       0x7febff9c4de0
01174 0f1f84006c12000f               nop        dword ptr [rax + rax + 0xf00126c]
0117c 4d3bda                         cmp        r11, r10
0117f bdffffffff                     mov        ebp, 0xffffffff
01184 7c08                           jl         0x7febffe8340e
01186 400f95c5                       setne      bpl
0118a 400fb6ed                       movzx      ebp, bpl
0118e be45ffffff                     mov        esi, 0xffffff45
01193 448b0424                       mov        r8d, dword ptr [rsp]
01197 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
0119f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
011a4 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
011ac 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
011b1 4c891c24                       mov        qword ptr [rsp], r11
011b5 895c2430                       mov        dword ptr [rsp + 0x30], ebx
011b9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
011be 6690                           nop        
011c0 c5f877                         vzeroupper 
011c3 e89819b4ff                     call       0x7febff9c4de0
011c8 0f1f8400c0120010               nop        dword ptr [rax + rax + 0x100012c0]
011d0 be45ffffff                     mov        esi, 0xffffff45
011d5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
011dd 448b1c24                       mov        r11d, dword ptr [rsp]
011e1 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
011e9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011ee 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
011f6 448b542404                     mov        r10d, dword ptr [rsp + 4]
011fb 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01203 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01208 4c891424                       mov        qword ptr [rsp], r10
0120c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01211 44895c2408                     mov        dword ptr [rsp + 8], r11d
01216 48894424f8                     mov        qword ptr [rsp - 8], rax
0121b 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0121f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01223 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01228 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0122c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01231 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01236 6690                           nop        
01238 c5f877                         vzeroupper 
0123b e82019b4ff                     call       0x7febff9c4de0
01240 0f1f840038130011               nop        dword ptr [rax + rax + 0x11001338]
01248 be45ffffff                     mov        esi, 0xffffff45
0124d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01255 448b1424                       mov        r10d, dword ptr [rsp]
01259 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01261 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01266 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0126e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01273 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0127b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01280 4c891424                       mov        qword ptr [rsp], r10
01284 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01289 4489542408                     mov        dword ptr [rsp + 8], r10d
0128e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01293 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01298 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0129d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
012a2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
012a7 90                             nop        
012a8 c5f877                         vzeroupper 
012ab e8b018b4ff                     call       0x7febff9c4de0
012b0 0f1f8400a8130012               nop        dword ptr [rax + rax + 0x120013a8]
012b8 85ff                           test       edi, edi
012ba 0f8478090000                   je         0x7febffe83eb8
012c0 488bcf                         mov        rcx, rdi
012c3 448b1424                       mov        r10d, dword ptr [rsp]
012c7 89742414                       mov        dword ptr [rsp + 0x14], esi
012cb 4533c0                         xor        r8d, r8d
012ce e968f8ffff                     jmp        0x7febffe82dbb
012d3 bee4ffffff                     mov        esi, 0xffffffe4
012d8 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
012e0 448b1424                       mov        r10d, dword ptr [rsp]
012e4 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
012ec 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
012f1 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
012f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012fe 4c891424                       mov        qword ptr [rsp], r10
01302 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01307 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0130c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01310 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01314 c5f877                         vzeroupper 
01317 e84418b4ff                     call       0x7febff9c4de0
0131c 0f1f840014140013               nop        dword ptr [rax + rax + 0x13001414]
01324 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
0132d bee4ffffff                     mov        esi, 0xffffffe4
01332 498bea                         mov        rbp, r10
01335 448b1424                       mov        r10d, dword ptr [rsp]
01339 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01341 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01346 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0134e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01353 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0135b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01360 4c891424                       mov        qword ptr [rsp], r10
01364 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01369 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0136e 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01373 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01378 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0137d 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01381 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01386 6690                           nop        
01388 c5f877                         vzeroupper 
0138b e8d017b4ff                     call       0x7febff9c4de0
01390 0f1f840088140014               nop        dword ptr [rax + rax + 0x14001488]
01398 be17000000                     mov        esi, 0x17
0139d 666690                         nop        
013a0 c5f877                         vzeroupper 
013a3 e8b817b4ff                     call       0x7febff9c4de0
013a8 0f1f8400a0140015               nop        dword ptr [rax + rax + 0x150014a0]
013b0 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
013b8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013bd eb0d                           jmp        0x7febffe8364c
013bf 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
013c7 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013cc be6effffff                     mov        esi, 0xffffff6e
013d1 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
013d9 4c89542408                     mov        qword ptr [rsp + 8], r10
013de 897c2410                       mov        dword ptr [rsp + 0x10], edi
013e2 4889442418                     mov        qword ptr [rsp + 0x18], rax
013e7 894c2420                       mov        dword ptr [rsp + 0x20], ecx
013eb 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
013f0 4489442428                     mov        dword ptr [rsp + 0x28], r8d
013f5 895c2430                       mov        dword ptr [rsp + 0x30], ebx
013f9 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
013fe 4c89742440                     mov        qword ptr [rsp + 0x40], r14
01403 90                             nop        
01404 c5f877                         vzeroupper 
01407 e85417b4ff                     call       0x7febff9c4de0
0140c 0f1f840004150016               nop        dword ptr [rax + rax + 0x16001504]
01414 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01419 bebeffffff                     mov        esi, 0xffffffbe
0141e 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01426 448b1424                       mov        r10d, dword ptr [rsp]
0142a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01432 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01437 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0143f 4c895c2408                     mov        qword ptr [rsp + 8], r11
01444 893c24                         mov        dword ptr [rsp], edi
01447 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0144c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01451 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01455 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0145a 895c2424                       mov        dword ptr [rsp + 0x24], ebx
0145e 6690                           nop        
01460 c5f877                         vzeroupper 
01463 e8f816b4ff                     call       0x7febff9c4de0
01468 0f1f840060150017               nop        dword ptr [rax + rax + 0x17001560]
01470 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01475 eba2                           jmp        0x7febffe83699
01477 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0147c eb9b                           jmp        0x7febffe83699
0147e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01483 eb94                           jmp        0x7febffe83699
01485 8beb                           mov        ebp, ebx
01487 83c510                         add        ebp, 0x10
0148a be6effffff                     mov        esi, 0xffffff6e
0148f 448b1424                       mov        r10d, dword ptr [rsp]
01493 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0149b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014a0 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
014a8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014ad 4c891424                       mov        qword ptr [rsp], r10
014b1 895c2414                       mov        dword ptr [rsp + 0x14], ebx
014b5 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
014ba 6690                           nop        
014bc c5f877                         vzeroupper 
014bf e89c16b4ff                     call       0x7febff9c4de0
014c4 0f1f8400bc150018               nop        dword ptr [rax + rax + 0x180015bc]
014cc 8beb                           mov        ebp, ebx
014ce 83c510                         add        ebp, 0x10
014d1 be66ffffff                     mov        esi, 0xffffff66
014d6 448b1c24                       mov        r11d, dword ptr [rsp]
014da 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
014e2 448b542404                     mov        r10d, dword ptr [rsp + 4]
014e7 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
014ef 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014f4 4c891424                       mov        qword ptr [rsp], r10
014f8 895c2414                       mov        dword ptr [rsp + 0x14], ebx
014fc 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01501 666690                         nop        
01504 c5f877                         vzeroupper 
01507 e85416b4ff                     call       0x7febff9c4de0
0150c 0f1f840004160019               nop        dword ptr [rax + rax + 0x19001604]
01514 bee4ffffff                     mov        esi, 0xffffffe4
01519 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01521 448b1c24                       mov        r11d, dword ptr [rsp]
01525 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0152d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01532 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0153a 448b442404                     mov        r8d, dword ptr [rsp + 4]
0153f 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01547 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0154c 4c891c24                       mov        qword ptr [rsp], r11
01550 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01555 44895c2408                     mov        dword ptr [rsp + 8], r11d
0155a 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0155f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01564 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01568 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0156d 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01572 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01577 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0157c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01581 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01585 666690                         nop        
01588 c5f877                         vzeroupper 
0158b e8d015b4ff                     call       0x7febff9c4de0
01590 0f1f84008816001a               nop        dword ptr [rax + rax + 0x1a001688]
01598 bef6ffffff                     mov        esi, 0xfffffff6
0159d 666690                         nop        
015a0 c5f877                         vzeroupper 
015a3 e8b815b4ff                     call       0x7febff9c4de0
015a8 0f1f8400a016001b               nop        dword ptr [rax + rax + 0x1b0016a0]
015b0 bee4ffffff                     mov        esi, 0xffffffe4
015b5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
015bd 448b1c24                       mov        r11d, dword ptr [rsp]
015c1 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
015c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015ce 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
015d6 448b542404                     mov        r10d, dword ptr [rsp + 4]
015db 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
015e3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015e8 4c891424                       mov        qword ptr [rsp], r10
015ec 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015f1 44895c2408                     mov        dword ptr [rsp + 8], r11d
015f6 4489442444                     mov        dword ptr [rsp + 0x44], r8d
015fb 90                             nop        
015fc c5f877                         vzeroupper 
015ff e85c15b4ff                     call       0x7febff9c4de0
01604 0f1f8400fc16001c               nop        dword ptr [rax + rax + 0x1c0016fc]
0160c bee4ffffff                     mov        esi, 0xffffffe4
01611 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01619 448b1424                       mov        r10d, dword ptr [rsp]
0161d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01625 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0162a 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01632 448b542404                     mov        r10d, dword ptr [rsp + 4]
01637 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0163f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01644 4c891424                       mov        qword ptr [rsp], r10
01648 c5f877                         vzeroupper 
0164b e81015b4ff                     call       0x7febff9c4de0
01650 0f1f84004817001d               nop        dword ptr [rax + rax + 0x1d001748]
01658 bee4ffffff                     mov        esi, 0xffffffe4
0165d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01665 448b1c24                       mov        r11d, dword ptr [rsp]
01669 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01671 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01676 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0167e 448b542404                     mov        r10d, dword ptr [rsp + 4]
01683 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0168b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01690 4c891424                       mov        qword ptr [rsp], r10
01694 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01699 44895c2408                     mov        dword ptr [rsp + 8], r11d
0169e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
016a3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
016a8 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
016ad 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016b2 4489442444                     mov        dword ptr [rsp + 0x44], r8d
016b7 90                             nop        
016b8 c5f877                         vzeroupper 
016bb e8a014b4ff                     call       0x7febff9c4de0
016c0 0f1f8400b817001e               nop        dword ptr [rax + rax + 0x1e0017b8]
016c8 bee4ffffff                     mov        esi, 0xffffffe4
016cd 448b1424                       mov        r10d, dword ptr [rsp]
016d1 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
016d9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016de 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
016e6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016eb 4c891424                       mov        qword ptr [rsp], r10
016ef 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
016f4 c5f877                         vzeroupper 
016f7 e86414b4ff                     call       0x7febff9c4de0
016fc 0f1f8400f417001f               nop        dword ptr [rax + rax + 0x1f0017f4]
01704 418d6801                       lea        ebp, [r8 + 1]
01708 bee4ffffff                     mov        esi, 0xffffffe4
0170d 448b1c24                       mov        r11d, dword ptr [rsp]
01711 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01719 448b542404                     mov        r10d, dword ptr [rsp + 4]
0171e 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01726 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0172b 4c891424                       mov        qword ptr [rsp], r10
0172f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01734 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01739 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0173e 6690                           nop        
01740 c5f877                         vzeroupper 
01743 e81814b4ff                     call       0x7febff9c4de0
01748 0f1f840040180020               nop        dword ptr [rax + rax + 0x20001840]
01750 bee4ffffff                     mov        esi, 0xffffffe4
01755 448b1424                       mov        r10d, dword ptr [rsp]
01759 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01761 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01766 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0176e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01773 4c891424                       mov        qword ptr [rsp], r10
01777 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0177c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01781 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01786 6690                           nop        
01788 c5f877                         vzeroupper 
0178b e8d013b4ff                     call       0x7febff9c4de0
01790 0f1f840088180021               nop        dword ptr [rax + rax + 0x21001888]
01798 bee4ffffff                     mov        esi, 0xffffffe4
0179d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
017a5 448b1424                       mov        r10d, dword ptr [rsp]
017a9 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
017b1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017b6 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
017be 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
017c3 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017cb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017d0 4c891424                       mov        qword ptr [rsp], r10
017d4 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
017d9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017de 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
017e3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017e8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017ed 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017f2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
017f7 90                             nop        
017f8 c5f877                         vzeroupper 
017fb e86013b4ff                     call       0x7febff9c4de0
01800 0f1f8400f8180022               nop        dword ptr [rax + rax + 0x220018f8]
01808 be6effffff                     mov        esi, 0xffffff6e
0180d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01815 448b0424                       mov        r8d, dword ptr [rsp]
01819 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01821 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01826 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0182e 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
01833 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
0183b 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01840 44894c2408                     mov        dword ptr [rsp + 8], r9d
01845 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0184a 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0184f 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01853 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01858 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0185d 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01862 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01867 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0186c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01871 89542440                       mov        dword ptr [rsp + 0x40], edx
01875 666690                         nop        
01878 c5f877                         vzeroupper 
0187b e8e012b4ff                     call       0x7febff9c4de0
01880 0f1f840078190023               nop        dword ptr [rax + rax + 0x23001978]
01888 458bd1                         mov        r10d, r9d
0188b e90df1ffff                     jmp        0x7febffe82c1d
01890 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01898 4183c308                       add        r11d, 8
0189c 458bc3                         mov        r8d, r11d
0189f be45ffffff                     mov        esi, 0xffffff45
018a4 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
018ac 448b1424                       mov        r10d, dword ptr [rsp]
018b0 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
018b8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018bd 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018c5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
018ca 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
018d2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018d7 4c891424                       mov        qword ptr [rsp], r10
018db 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018e0 44895c2408                     mov        dword ptr [rsp + 8], r11d
018e5 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
018ea 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018ef 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
018f4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018f9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018fe 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01903 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01908 c5f877                         vzeroupper 
0190b e85012b4ff                     call       0x7febff9c4de0
01910 0f1f8400081a0024               nop        dword ptr [rax + rax + 0x24001a08]
01918 be45ffffff                     mov        esi, 0xffffff45
0191d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01925 448b1c24                       mov        r11d, dword ptr [rsp]
01929 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01931 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01936 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0193e 448b542404                     mov        r10d, dword ptr [rsp + 4]
01943 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0194b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01950 4c891424                       mov        qword ptr [rsp], r10
01954 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01959 44895c2408                     mov        dword ptr [rsp + 8], r11d
0195e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01963 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01968 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0196d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01972 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01977 90                             nop        
01978 c5f877                         vzeroupper 
0197b e8e011b4ff                     call       0x7febff9c4de0
01980 0f1f8400781a0025               nop        dword ptr [rax + rax + 0x25001a78]
01988 beccffffff                     mov        esi, 0xffffffcc
0198d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01995 448b1c24                       mov        r11d, dword ptr [rsp]
01999 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
019a1 448b542404                     mov        r10d, dword ptr [rsp + 4]
019a6 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
019ae 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019b3 4c891424                       mov        qword ptr [rsp], r10
019b7 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
019bb 90                             nop        
019bc c5f877                         vzeroupper 
019bf e89c11b4ff                     call       0x7febff9c4de0
019c4 0f1f8400bc1a0026               nop        dword ptr [rax + rax + 0x26001abc]
019cc be45ffffff                     mov        esi, 0xffffff45
019d1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
019d9 448b1c24                       mov        r11d, dword ptr [rsp]
019dd 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
019e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ea 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
019f2 448b542404                     mov        r10d, dword ptr [rsp + 4]
019f7 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
019ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a04 4c891424                       mov        qword ptr [rsp], r10
01a08 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a0d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a12 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a17 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a1c 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01a21 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a26 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01a2b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01a30 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01a35 666690                         nop        
01a38 c5f877                         vzeroupper 
01a3b e82011b4ff                     call       0x7febff9c4de0
01a40 0f1f8400381b0027               nop        dword ptr [rax + rax + 0x27001b38]
01a48 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a50 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
01a57 bef6ffffff                     mov        esi, 0xfffffff6
01a5c 498beb                         mov        rbp, r11
01a5f 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01a66 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01a6e 6690                           nop        
01a70 c5f877                         vzeroupper 
01a73 e8e810b4ff                     call       0x7febff9c4de0
01a78 0f1f8400701b0028               nop        dword ptr [rax + rax + 0x28001b70]
01a80 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01a85 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
01a8d 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01a92 beccffffff                     mov        esi, 0xffffffcc
01a97 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a9f 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01aa7 44890c24                       mov        dword ptr [rsp], r9d
01aab 48894c2408                     mov        qword ptr [rsp + 8], rcx
01ab0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ab5 666690                         nop        
01ab8 c5f877                         vzeroupper 
01abb e8a010b4ff                     call       0x7febff9c4de0
01ac0 0f1f8400b81b0029               nop        dword ptr [rax + rax + 0x29001bb8]
01ac8 beccffffff                     mov        esi, 0xffffffcc
01acd 448b1424                       mov        r10d, dword ptr [rsp]
01ad1 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01ad9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01ade 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01ae6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aeb 4c891424                       mov        qword ptr [rsp], r10
01aef 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01af3 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01af8 c5f877                         vzeroupper 
01afb e86010b4ff                     call       0x7febff9c4de0
01b00 0f1f8400f81b002a               nop        dword ptr [rax + rax + 0x2a001bf8]
01b08 beccffffff                     mov        esi, 0xffffffcc
01b0d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b15 448b1424                       mov        r10d, dword ptr [rsp]
01b19 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01b21 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b26 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01b2e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b33 4c891424                       mov        qword ptr [rsp], r10
01b37 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01b3b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01b40 c5f877                         vzeroupper 
01b43 e81810b4ff                     call       0x7febff9c4de0
01b48 0f1f8400401c002b               nop        dword ptr [rax + rax + 0x2b001c40]
01b50 beccffffff                     mov        esi, 0xffffffcc
01b55 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b5d 448b1424                       mov        r10d, dword ptr [rsp]
01b61 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b69 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b6e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b76 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b7b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b83 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b88 4c891424                       mov        qword ptr [rsp], r10
01b8c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b91 4489542408                     mov        dword ptr [rsp + 8], r10d
01b96 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01b9a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b9f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ba4 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01ba9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bae 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01bb3 90                             nop        
01bb4 c5f877                         vzeroupper 
01bb7 e8a40fb4ff                     call       0x7febff9c4de0
01bbc 0f1f8400b41c002c               nop        dword ptr [rax + rax + 0x2c001cb4]
01bc4 beccffffff                     mov        esi, 0xffffffcc
01bc9 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01bd1 448b1c24                       mov        r11d, dword ptr [rsp]
01bd5 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bdd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01be2 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01bea 448b542404                     mov        r10d, dword ptr [rsp + 4]
01bef 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bf7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bfc 4c891424                       mov        qword ptr [rsp], r10
01c00 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c05 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c0a 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01c0e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01c13 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c18 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01c1d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c22 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01c27 90                             nop        
01c28 c5f877                         vzeroupper 
01c2b e8300fb4ff                     call       0x7febff9c4de0
01c30 0f1f8400281d002d               nop        dword ptr [rax + rax + 0x2d001d28]
01c38 448bc1                         mov        r8d, ecx
01c3b 89742414                       mov        dword ptr [rsp + 0x14], esi
01c3f 33c9                           xor        ecx, ecx
01c41 458bd0                         mov        r10d, r8d
01c44 e90efeffff                     jmp        0x7febffe83cd7
01c49 bef6ffffff                     mov        esi, 0xfffffff6
01c4e 6690                           nop        
01c50 c5f877                         vzeroupper 
01c53 e8080fb4ff                     call       0x7febff9c4de0
01c58 0f1f8400501d002e               nop        dword ptr [rax + rax + 0x2e001d50]
01c60 eb0a                           jmp        0x7febffe83eec
01c62 eb08                           jmp        0x7febffe83eec
01c64 eb06                           jmp        0x7febffe83eec
01c66 eb04                           jmp        0x7febffe83eec
01c68 eb02                           jmp        0x7febffe83eec
01c6a eb00                           jmp        0x7febffe83eec
01c6c 488bf0                         mov        rsi, rax
01c6f e9e0e9ffff                     jmp        0x7febffe828d4
01c74 49ba2f2ee8ffeb7f0000           movabs     r10, 0x7febffe82e2f
01c7e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c85 e9d68fa7ff                     jmp        0x7febff8fcee0
01c8a e8915ba6ff                     call       0x7febff8e9aa0
01c8f e9aae3ffff                     jmp        0x7febffe822be
01c94 f4                             hlt        
01c95 f4                             hlt        
01c96 f4                             hlt        
01c97 f4                             hlt        
