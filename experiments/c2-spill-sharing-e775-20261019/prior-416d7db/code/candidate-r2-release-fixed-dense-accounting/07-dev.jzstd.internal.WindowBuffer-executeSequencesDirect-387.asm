00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c080a9ff                   jne        0x7fa87b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85f01d0000                   jne        0x7fa87be796ae
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 c4c1f96ec0                     vmovq      xmm0, r8
0004b 448bd7                         mov        r10d, edi
0004e 488bee                         mov        rbp, rsi
00051 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
00055 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0005a 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
0005e 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00063 458bd8                         mov        r11d, r8d
00066 442b5c2438                     sub        r11d, dword ptr [rsp + 0x38]
0006b 448b8424d0000000               mov        r8d, dword ptr [rsp + 0xd0]
00073 453bc3                         cmp        r8d, r11d
00076 0f8f02140000                   jg         0x7fa87be78cfe
0007c 488b4608                       mov        rax, qword ptr [rsi + 8]
00080 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
00084 4c638c24d0000000               movsxd     r9, dword ptr [rsp + 0xd0]
0008c 4c63442438                     movsxd     r8, dword ptr [rsp + 0x38]
00091 4c03c0                         add        r8, rax
00094 4d2bd8                         sub        r11, r8
00097 4d3bcb                         cmp        r9, r11
0009a 0f8fde130000                   jg         0x7fa87be78cfe
000a0 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
000a4 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a8 4d85ed                         test       r13, r13
000ab 0f84cb0d0000                   je         0x7fa87be786fc
000b1 33ff                           xor        edi, edi
000b3 4c8bda                         mov        r11, rdx
000b6 8b5208                         mov        edx, dword ptr [rdx + 8]
000b9 448b4e44                       mov        r9d, dword ptr [rsi + 0x44]
000bd 458bc2                         mov        r8d, r10d
000c0 4585d2                         test       r10d, r10d
000c3 0f8eab130000                   jle        0x7fa87be78cf4
000c9 4c2be8                         sub        r13, rax
000cc 8d4ae0                         lea        ecx, [rdx - 0x20]
000cf 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
000d3 83c3e0                         add        ebx, -0x20
000d6 c4c1f97ec2                     vmovq      r10, xmm0
000db 418b7208                       mov        esi, dword ptr [r10 + 8]
000df 85f6                           test       esi, esi
000e1 0f86b7130000                   jbe        0x7fa87be78d1e
000e7 895c2448                       mov        dword ptr [rsp + 0x48], ebx
000eb 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
000ef 89542404                       mov        dword ptr [rsp + 4], edx
000f3 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f8 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000fd 4889442430                     mov        qword ptr [rsp + 0x30], rax
00102 4c89542408                     mov        qword ptr [rsp + 8], r10
00107 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0010c 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00111 48896c2458                     mov        qword ptr [rsp + 0x58], rbp
00116 4c63d6                         movsxd     r10, esi
00119 4d63d8                         movsxd     r11, r8d
0011c 49ffcb                         dec        r11
0011f 4d3bda                         cmp        r11, r10
00122 0f836c130000                   jae        0x7fa87be78d14
00128 85ff                           test       edi, edi
0012a 0f84c8130000                   je         0x7fa87be78d78
00130 448d52f1                       lea        r10d, [rdx - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8cc7130000                   jl         0x7fa87be78d84
0013d 458b5108                       mov        r10d, dword ptr [r9 + 8]
00141 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00146 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0014b 897c2464                       mov        dword ptr [rsp + 0x64], edi
0014f 458d5af1                       lea        r11d, [r10 - 0xf]
00153 4585db                         test       r11d, r11d
00156 0f8cb4130000                   jl         0x7fa87be78d90
0015c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00164 458b5208                       mov        r10d, dword ptr [r10 + 8]
00168 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0016d 4585d2                         test       r10d, r10d
00170 0f86a9130000                   jbe        0x7fa87be78d9f
00176 4183fa01                       cmp        r10d, 1
0017a 0f869f130000                   jbe        0x7fa87be78d9f
00180 4183fa02                       cmp        r10d, 2
00184 0f8695130000                   jbe        0x7fa87be78d9f
0018a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0018f 4183c2f9                       add        r10d, -7
00193 4585d2                         test       r10d, r10d
00196 0f8c83130000                   jl         0x7fa87be78d9f
0019c 448bd2                         mov        r10d, edx
0019f 4d8bd9                         mov        r11, r9
001a2 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
001a7 4183c2f1                       add        r10d, -0xf
001ab 4489542478                     mov        dword ptr [rsp + 0x78], r10d
001b0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
001b5 4489542424                     mov        dword ptr [rsp + 0x24], r10d
001ba 458d5af1                       lea        r11d, [r10 - 0xf]
001be 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
001c3 4533d2                         xor        r10d, r10d
001c6 33c9                           xor        ecx, ecx
001c8 e9cc010000                     jmp        0x7fa87be77c19
001cd 4533db                         xor        r11d, r11d
001d0 418bd3                         mov        edx, r11d
001d3 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
001db 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
001df 448bdf                         mov        r11d, edi
001e2 4183fb03                       cmp        r11d, 3
001e6 0f8e34020000                   jle        0x7fa87be77ca0
001ec 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
001f4 45894314                       mov        dword ptr [r11 + 0x14], r8d
001f8 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
001fc 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00204 45895810                       mov        dword ptr [r8 + 0x10], r11d
00208 448d5ffd                       lea        r11d, [rdi - 3]
0020c 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00214 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0021c 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00224 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00228 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0022f 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
00237 4c634c2438                     movsxd     r9, dword ptr [rsp + 0x38]
0023c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00241 4863ca                         movsxd     rcx, edx
00244 4c03c9                         add        r9, rcx
00247 4d3bd9                         cmp        r11, r9
0024a 0f8f240f0000                   jg         0x7fa87be789f4
00250 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00258 4585c0                         test       r8d, r8d
0025b 0f8e670e0000                   jle        0x7fa87be78948
00261 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00266 4403c2                         add        r8d, edx
00269 4403842480000000               add        r8d, dword ptr [rsp + 0x80]
00271 443b442448                     cmp        r8d, dword ptr [rsp + 0x48]
00276 0f8f940f0000                   jg         0x7fa87be78a90
0027c 458d0412                       lea        r8d, [r10 + rdx]
00280 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00285 0f8f29100000                   jg         0x7fa87be78b34
0028b 83fa10                         cmp        edx, 0x10
0028e 0f8fc4100000                   jg         0x7fa87be78bd8
00294 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00299 0f83fa0b0000                   jae        0x7fa87be78719
0029f 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
002a4 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
002ab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
002b0 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
002b5 0f83750c0000                   jae        0x7fa87be787b0
002bb 468d0412                       lea        r8d, [rdx + r10]
002bf 4489442428                     mov        dword ptr [rsp + 0x28], r8d
002c4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002c9 418bda                         mov        ebx, r10d
002cc 448d141a                       lea        r10d, [rdx + rbx]
002d0 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002d8 4c63c3                         movsxd     r8, ebx
002db 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002e0 c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
002e7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
002ef 442b9c2484000000               sub        r11d, dword ptr [rsp + 0x84]
002f7 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002ff 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00307 4183fa10                       cmp        r10d, 0x10
0030b 0f8fd3100000                   jg         0x7fa87be78c64
00311 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00319 4183fb10                       cmp        r11d, 0x10
0031d 0f8c76020000                   jl         0x7fa87be77e19
00323 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0032b 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00330 0f836e0c0000                   jae        0x7fa87be78824
00336 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0033b c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00342 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0034a 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
0034f 0f83d30c0000                   jae        0x7fa87be788a8
00355 448bd3                         mov        r10d, ebx
00358 448bda                         mov        r11d, edx
0035b 4d63c2                         movsxd     r8, r10d
0035e 478d0c13                       lea        r9d, [r11 + r10]
00362 44038c2480000000               add        r9d, dword ptr [rsp + 0x80]
0036a 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0036f 4d63db                         movsxd     r11, r11d
00372 4d03d8                         add        r11, r8
00375 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0037a c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00381 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
00388 ffc1                           inc        ecx
0038a 3b4c2420                       cmp        ecx, dword ptr [rsp + 0x20]
0038e 0f8de0080000                   jge        0x7fa87be784f4
00394 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00399 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0039e 4d8b44cb10                     mov        r8, qword ptr [r11 + rcx*8 + 0x10]
003a3 4d8bd8                         mov        r11, r8
003a6 49c1fb24                       sar        r11, 0x24
003aa 458bdb                         mov        r11d, r11d
003ad 418bfb                         mov        edi, r11d
003b0 4d8bc8                         mov        r9, r8
003b3 49c1e912                       shr        r9, 0x12
003b7 458bd8                         mov        r11d, r8d
003ba 458bc9                         mov        r9d, r9d
003bd 4181e3ffff0100                 and        r11d, 0x1ffff
003c4 418bd3                         mov        edx, r11d
003c7 4181e1ffff0300                 and        r9d, 0x3ffff
003ce 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
003d6 448bdf                         mov        r11d, edi
003d9 4585db                         test       r11d, r11d
003dc 0f8c060d0000                   jl         0x7fa87be78968
003e2 448bda                         mov        r11d, edx
003e5 4585db                         test       r11d, r11d
003e8 0f84dffdffff                   je         0x7fa87be77a4d
003ee 448b0c24                       mov        r9d, dword ptr [rsp]
003f2 452bca                         sub        r9d, r10d
003f5 453bd9                         cmp        r11d, r9d
003f8 0f8ed5fdffff                   jle        0x7fa87be77a53
003fe be45ffffff                     mov        esi, 0xffffff45
00403 418beb                         mov        ebp, r11d
00406 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
0040e 6690                           nop        
00410 c5f877                         vzeroupper 
00413 e8c800b6ff                     call       0x7fa87b9d7d60
00418 0f1f840010050000               nop        dword ptr [rax + rax + 0x510]
00420 85d2                           test       edx, edx
00422 7407                           je         0x7fa87be77cab
00424 448d5fff                       lea        r11d, [rdi - 1]
00428 418bfb                         mov        edi, r11d
0042b 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00433 418b5b0c                       mov        ebx, dword ptr [r11 + 0xc]
00437 85ff                           test       edi, edi
00439 0f8465090000                   je         0x7fa87be78624
0043f 83ff03                         cmp        edi, 3
00442 0f8468090000                   je         0x7fa87be78630
00448 83ff02                         cmp        edi, 2
0044b 0f8786000000                   ja         0x7fa87be77d57
00451 3b7c2414                       cmp        edi, dword ptr [rsp + 0x14]
00455 0f830d110000                   jae        0x7fa87be78de8
0045b 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00463 418b5cb80c                     mov        ebx, dword ptr [r8 + rdi*4 + 0xc]
00468 85ff                           test       edi, edi
0046a 7e4c                           jle        0x7fa87be77d38
0046c 448d5fff                       lea        r11d, [rdi - 1]
00470 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00475 0f836d150000                   jae        0x7fa87be79268
0047b 4c63cf                         movsxd     r9, edi
0047e 458bd8                         mov        r11d, r8d
00481 4183c3d0                       add        r11d, -0x30
00485 41c1eb02                       shr        r11d, 2
00489 458d443bff                     lea        r8d, [r11 + rdi - 1]
0048e 41bb04000000                   mov        r11d, 4
00494 c442a0f5d8                     bzhi       r11, r8, r11
00499 4d2bcb                         sub        r9, r11
0049c 49ffc9                         dec        r9
0049f 4533db                         xor        r11d, r11d
004a2 4d85c9                         test       r9, r9
004a5 4d0f4ccb                       cmovl      r9, r11
004a9 458bc9                         mov        r9d, r9d
004ac 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
004b3 e98f060000                     jmp        0x7fa87be783c7
004b8 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
004bf 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
004c7 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
004cb 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
004d2 e958fdffff                     jmp        0x7fa87be77aaf
004d7 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
004db 48be68387ce200000000           movabs     rsi, 0xe27c3868
004e5 48ff742440                     push       qword ptr [rsp + 0x40]
004ea 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
004f2 8b6c2420                       mov        ebp, dword ptr [rsp + 0x20]
004f6 896c2404                       mov        dword ptr [rsp + 4], ebp
004fa 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
004ff 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00504 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00508 896c2414                       mov        dword ptr [rsp + 0x14], ebp
0050c 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00511 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00516 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0051b 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0051f 896c241c                       mov        dword ptr [rsp + 0x1c], ebp
00523 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
00527 896c2428                       mov        dword ptr [rsp + 0x28], ebp
0052b 89542430                       mov        dword ptr [rsp + 0x30], edx
0052f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
00534 48896c2440                     mov        qword ptr [rsp + 0x40], rbp
00539 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0053e 6690                           nop        
00540 c5f877                         vzeroupper 
00543 e8988aa9ff                     call       0x7fa87b910860
00548 0f1f840040060001               nop        dword ptr [rax + rax + 0x1000640]
00550 4885c0                         test       rax, rax
00553 0f84af100000                   je         0x7fa87be78e88
00559 488bf0                         mov        rsi, rax
0055c c5f877                         vzeroupper 
0055f 4881c4c0000000                 add        rsp, 0xc0
00566 5d                             pop        rbp
00567 e97428b6ff                     jmp        0x7fa87b9da660
0056c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00574 4d63d3                         movsxd     r10, r11d
00577 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0057e c442a8f5db                     bzhi       r11, r11, r10
00583 c4c1fb92fb                     kmovq      k7, r11
00588 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0058e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00594 e984050000                     jmp        0x7fa87be7839d
00599 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
005a1 4403942480000000               add        r10d, dword ptr [rsp + 0x80]
005a9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
005ae 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
005b6 0f8df4020000                   jge        0x7fa87be78130
005bc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
005c4 4183c308                       add        r11d, 8
005c8 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
005d0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
005d8 4183fa08                       cmp        r10d, 8
005dc 0f8db3010000                   jge        0x7fa87be78015
005e2 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
005ea 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
005ef 0f839f140000                   jae        0x7fa87be79314
005f5 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
005fa 430fbe6c1a0c                   movsx      ebp, byte ptr [r10 + r11 + 0xc]
00600 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00608 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
0060d 0f8329150000                   jae        0x7fa87be793bc
00613 4c63d3                         movsxd     r10, ebx
00616 4c63da                         movsxd     r11, edx
00619 4d03da                         add        r11, r10
0061c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00621 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00626 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0062e 4183c303                       add        r11d, 3
00632 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0063a 41ffc0                         inc        r8d
0063d 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00642 0f8380150000                   jae        0x7fa87be79448
00648 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00650 4183c303                       add        r11d, 3
00654 48638c248c000000               movsxd     rcx, dword ptr [rsp + 0x8c]
0065c 458bca                         mov        r9d, r10d
0065f 410fbe6c090d                   movsx      ebp, byte ptr [r9 + rcx + 0xd]
00665 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
0066a 0f83ec150000                   jae        0x7fa87be794dc
00670 4c63d3                         movsxd     r10, ebx
00673 4c63c2                         movsxd     r8, edx
00676 4d03c2                         add        r8, r10
00679 43886c010d                     mov        byte ptr [r9 + r8 + 0xd], bpl
0067e 450fbe5c090e                   movsx      r11d, byte ptr [r9 + rcx + 0xe]
00684 47885c010e                     mov        byte ptr [r9 + r8 + 0xe], r11b
00689 450fbe54090f                   movsx      r10d, byte ptr [r9 + rcx + 0xf]
0068f 478854010f                     mov        byte ptr [r9 + r8 + 0xf], r10b
00694 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0069c 4183fb08                       cmp        r11d, 8
006a0 0f833a160000                   jae        0x7fa87be79560
006a6 49bad08c79e200000000           movabs     r10, 0xe2798cd0
006b0 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
006b8 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
006bd 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
006c5 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
006cd 4183fa04                       cmp        r10d, 4
006d1 7e41                           jle        0x7fa87be77f94
006d3 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
006da 83c504                         add        ebp, 4
006dd 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
006e2 418bd1                         mov        edx, r9d
006e5 666690                         nop        
006e8 c5f877                         vzeroupper 
006eb e8f088a9ff                     call       0x7fa87b910860
006f0 0f1f8400e8070002               nop        dword ptr [rax + rax + 0x20007e8]
006f8 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
006fd 8bd5                           mov        edx, ebp
006ff 8bc8                           mov        ecx, eax
00701 488bee                         mov        rbp, rsi
00704 c5f877                         vzeroupper 
00707 e8d488a9ff                     call       0x7fa87b910860
0070c 0f1f840004080003               nop        dword ptr [rax + rax + 0x3000804]
00714 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0071c 4183fa08                       cmp        r10d, 8
00720 0f8e5bfcffff                   jle        0x7fa87be77c01
00726 49ba008d79e200000000           movabs     r10, 0xe2798d00
00730 8b9424d0000000                 mov        edx, dword ptr [rsp + 0xd0]
00737 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0073f 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00744 83c208                         add        edx, 8
00747 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
0074c 488bee                         mov        rbp, rsi
0074f 90                             nop        
00750 c5f877                         vzeroupper 
00753 e88888a9ff                     call       0x7fa87b910860
00758 0f1f840050080004               nop        dword ptr [rax + rax + 0x4000850]
00760 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00768 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00770 488bf5                         mov        rsi, rbp
00773 8b942490000000                 mov        edx, dword ptr [rsp + 0x90]
0077a 488bc8                         mov        rcx, rax
0077d 666690                         nop        
00780 c5f877                         vzeroupper 
00783 e85888a9ff                     call       0x7fa87b910860
00788 0f1f840080080005               nop        dword ptr [rax + rax + 0x5000880]
00790 e9ecfbffff                     jmp        0x7fa87be77c01
00795 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
0079a 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
007a1 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
007a8 c5f877                         vzeroupper 
007ab e83088a9ff                     call       0x7fa87b910860
007b0 0f1f8400a8080006               nop        dword ptr [rax + rax + 0x60008a8]
007b8 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
007bd 8bd5                           mov        edx, ebp
007bf 488bc8                         mov        rcx, rax
007c2 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
007c9 666690                         nop        
007cc c5f877                         vzeroupper 
007cf e80c88a9ff                     call       0x7fa87b910860
007d4 0f1f8400cc080007               nop        dword ptr [rax + rax + 0x70008cc]
007dc 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
007e4 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
007e9 0f8d92fbffff                   jge        0x7fa87be77c01
007ef 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007f4 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
007fb 0f8e37050000                   jle        0x7fa87be785b8
00801 448bc5                         mov        r8d, ebp
00804 4183c008                       add        r8d, 8
00808 be66ffffff                     mov        esi, 0xffffff66
0080d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00812 448b1424                       mov        r10d, dword ptr [rsp]
00816 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0081e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00823 4c891424                       mov        qword ptr [rsp], r10
00827 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0082c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00834 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00839 4489542408                     mov        dword ptr [rsp + 8], r10d
0083e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00843 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00848 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0084d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00852 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00857 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0085c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00861 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00866 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0086b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00870 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00875 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0087a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0087f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00884 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00889 48894424f8                     mov        qword ptr [rsp - 8], rax
0088e 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00895 89442458                       mov        dword ptr [rsp + 0x58], eax
00899 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089e 6690                           nop        
008a0 c5f877                         vzeroupper 
008a3 e838fcb5ff                     call       0x7fa87b9d7d60
008a8 0f1f8400a0090008               nop        dword ptr [rax + rax + 0x80009a0]
008b0 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
008b8 4183fa30                       cmp        r10d, 0x30
008bc 0f8fca010000                   jg         0x7fa87be7830c
008c2 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
008c6 83c5f9                         add        ebp, -7
008c9 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
008d0 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
008d8 443bdd                         cmp        r11d, ebp
008db 0f833f0d0000                   jae        0x7fa87be78ea0
008e1 418beb                         mov        ebp, r11d
008e4 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
008eb 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008f0 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
008f5 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008fd 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00905 0f83d10d0000                   jae        0x7fa87be78f5c
0090b 448bd3                         mov        r10d, ebx
0090e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00913 4d63da                         movsxd     r11, r10d
00916 448bd2                         mov        r10d, edx
00919 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00921 4d63d2                         movsxd     r10, r10d
00924 4b8d4c1a0c                     lea        rcx, [r10 + r11 + 0xc]
00929 48894424f8                     mov        qword ptr [rsp - 8], rax
0092e 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00935 898424d0000000                 mov        dword ptr [rsp + 0xd0], eax
0093c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00941 48be00b722e200000000           movabs     rsi, 0xe222b700
0094b 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00950 4533c9                         xor        r9d, r9d
00953 90                             nop        
00954 c5f877                         vzeroupper 
00957 e8847ca9ff                     call       0x7fa87b90fe60
0095c 0f1f8400540a0009               nop        dword ptr [rax + rax + 0x9000a54]
00964 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
0096b 036c242c                       add        ebp, dword ptr [rsp + 0x2c]
0096f 896c242c                       mov        dword ptr [rsp + 0x2c], ebp
00973 448d5508                       lea        r10d, [rbp + 8]
00977 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0097f 458bc2                         mov        r8d, r10d
00982 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00987 0f8d9d010000                   jge        0x7fa87be783aa
0098d 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00995 442bdd                         sub        r11d, ebp
00998 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
009a0 48634c2424                     movsxd     rcx, dword ptr [rsp + 0x24]
009a5 4883c1f9                       add        rcx, -7
009a9 4963db                         movsxd     rbx, r11d
009ac 4d63da                         movsxd     r11, r10d
009af 4d8d141b                       lea        r10, [r11 + rbx]
009b3 4c3bd1                         cmp        r10, rcx
009b6 0f83980e0000                   jae        0x7fa87be790d4
009bc 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
009c1 4d2bd3                         sub        r10, r11
009c4 4983c207                       add        r10, 7
009c8 4983e2f8                       and        r10, 0xfffffffffffffff8
009cc 458bd2                         mov        r10d, r10d
009cf 458d5c2a08                     lea        r11d, [r10 + rbp + 8]
009d4 4d63d3                         movsxd     r10, r11d
009d7 4e8d5c13f8                     lea        r11, [rbx + r10 - 8]
009dc 4c3bd9                         cmp        r11, rcx
009df 0f836f0e0000                   jae        0x7fa87be790d4
009e5 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
009ed 0f83610e0000                   jae        0x7fa87be790d4
009f3 4983c2f8                       add        r10, -8
009f7 4c3bd1                         cmp        r10, rcx
009fa 0f83540e0000                   jae        0x7fa87be790d4
00a00 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a05 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a0c 0f8f0a0f0000                   jg         0x7fa87be7919c
00a12 0f1f8000000000                 nop        dword ptr [rax]
00a19 0f1f8000000000                 nop        dword ptr [rax]
00a20 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a28 4963cb                         movsxd     rcx, r11d
00a2b 4883c10c                       add        rcx, 0xc
00a2f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00a36 03ac24d0000000                 add        ebp, dword ptr [rsp + 0xd0]
00a3d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00a42 4d8b442b0c                     mov        r8, qword ptr [r11 + rbp + 0xc]
00a47 48be00b722e200000000           movabs     rsi, 0xe222b700
00a51 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00a56 4533c9                         xor        r9d, r9d
00a59 666690                         nop        
00a5c c5f877                         vzeroupper 
00a5f e87c7ba9ff                     call       0x7fa87b90fe60
00a64 0f1f84005c0b000a               nop        dword ptr [rax + rax + 0xa000b5c]
00a6c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a74 4183c308                       add        r11d, 8
00a78 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00a80 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00a85 7c99                           jl         0x7fa87be782a0
00a87 e99e000000                     jmp        0x7fa87be783aa
00a8c 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00a94 4585c9                         test       r9d, r9d
00a97 0f8c070d0000                   jl         0x7fa87be79024
00a9d 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00aa5 4585d2                         test       r10d, r10d
00aa8 0f8cf60c0000                   jl         0x7fa87be79024
00aae 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00ab6 4503d1                         add        r10d, r9d
00ab9 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00abd 413bda                         cmp        ebx, r10d
00ac0 0f82de0c0000                   jb         0x7fa87be79024
00ac6 448bd3                         mov        r10d, ebx
00ac9 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00ace 0f82d00c0000                   jb         0x7fa87be79024
00ad4 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00adc 4585db                         test       r11d, r11d
00adf 743c                           je         0x7fa87be7839d
00ae1 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ae6 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
00aeb 4903c8                         add        rcx, r8
00aee 498d740a0c                     lea        rsi, [r10 + rcx + 0xc]
00af3 4863942480000000               movsxd     rdx, dword ptr [rsp + 0x80]
00afb 4883fa20                       cmp        rdx, 0x20
00aff 0f8667faffff                   jbe        0x7fa87be77dec
00b05 c5f877                         vzeroupper 
00b08 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00b12 41ffd2                         call       r10
00b15 0f1f840000000000               nop        dword ptr [rax + rax]
00b1d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b25 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b2a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b2f 4403942480000000               add        r10d, dword ptr [rsp + 0x80]
00b37 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b3c e940f8ffff                     jmp        0x7fa87be77c01
00b41 666690                         nop        
00b44 418bf8                         mov        edi, r8d
00b47 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00b4f 458b44b808                     mov        r8d, dword ptr [r8 + rdi*4 + 8]
00b54 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
00b5c 448944b90c                     mov        dword ptr [rcx + rdi*4 + 0xc], r8d
00b61 448d47ff                       lea        r8d, [rdi - 1]
00b65 453bc1                         cmp        r8d, r9d
00b68 7fda                           jg         0x7fa87be783c4
00b6a 4183f83f                       cmp        r8d, 0x3f
00b6e 0f8e180f0000                   jle        0x7fa87be7930c
00b74 448bdf                         mov        r11d, edi
00b77 41ffcb                         dec        r11d
00b7a 418bcb                         mov        ecx, r11d
00b7d eb04                           jmp        0x7fa87be78403
00b7f 90                             nop        
00b80 418bcb                         mov        ecx, r11d
00b83 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00b8b 62d17e486f8488ccffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rcx*4 - 0x34]
00b96 62d17e487f8488d0ffffff         vmovdqu32  zmmword ptr [r8 + rcx*4 - 0x30], zmm0
00ba1 62d17e486f84888cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rcx*4 - 0x74]
00bac 62d17e487f848890ffffff         vmovdqu32  zmmword ptr [r8 + rcx*4 - 0x70], zmm0
00bb7 62d17e486f84884cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rcx*4 - 0xb4]
00bc2 62d17e487f848850ffffff         vmovdqu32  zmmword ptr [r8 + rcx*4 - 0xb0], zmm0
00bcd 62d17e486f84880cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + rcx*4 - 0xf4]
00bd8 62d17e487f848810ffffff         vmovdqu32  zmmword ptr [r8 + rcx*4 - 0xf0], zmm0
00be3 448d59c0                       lea        r11d, [rcx - 0x40]
00be7 4183fb3f                       cmp        r11d, 0x3f
00beb 7f93                           jg         0x7fa87be78400
00bed 4183fb0f                       cmp        r11d, 0xf
00bf1 7e31                           jle        0x7fa87be784a4
00bf3 448bd9                         mov        r11d, ecx
00bf6 4183c3c0                       add        r11d, -0x40
00bfa 6690                           nop        
00bfc 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00c04 62917e486f8498ccffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x34]
00c0f 62917e487f8498d0ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x30], zmm0
00c1a 4183c3f0                       add        r11d, -0x10
00c1e 4183fb0f                       cmp        r11d, 0xf
00c22 7fd8                           jg         0x7fa87be7847c
00c24 4585db                         test       r11d, r11d
00c27 0f8e92f8ffff                   jle        0x7fa87be77d3f
00c2d 666690                         nop        
00c30 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00c38 478b4c9808                     mov        r9d, dword ptr [r8 + r11*4 + 8]
00c3d 47894c980c                     mov        dword ptr [r8 + r11*4 + 0xc], r9d
00c42 41ffcb                         dec        r11d
00c45 4585db                         test       r11d, r11d
00c48 7fe6                           jg         0x7fa87be784b0
00c4a e970f8ffff                     jmp        0x7fa87be77d3f
00c4f 4d63d0                         movsxd     r10, r8d
00c52 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c59 c442a8f5db                     bzhi       r11, r11, r10
00c5e c4c1fb92fb                     kmovq      k7, r11
00c63 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c69 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c6f e995000000                     jmp        0x7fa87be78589
00c74 448b1c24                       mov        r11d, dword ptr [rsp]
00c78 458bc3                         mov        r8d, r11d
00c7b 442b442428                     sub        r8d, dword ptr [rsp + 0x28]
00c80 488b6c2458                     mov        rbp, qword ptr [rsp + 0x58]
00c85 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c8a 8b542404                       mov        edx, dword ptr [rsp + 4]
00c8e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c93 8b7c2428                       mov        edi, dword ptr [rsp + 0x28]
00c97 418b4908                       mov        ecx, dword ptr [r9 + 8]
00c9b 85ff                           test       edi, edi
00c9d 0f8cd1100000                   jl         0x7fa87be795f4
00ca3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ca8 4585d2                         test       r10d, r10d
00cab 0f8cc8100000                   jl         0x7fa87be795f9
00cb1 3b1424                         cmp        edx, dword ptr [rsp]
00cb4 0f82bf100000                   jb         0x7fa87be795f9
00cba 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00cbe 4103d8                         add        ebx, r8d
00cc1 3bcb                           cmp        ecx, ebx
00cc3 0f82b0100000                   jb         0x7fa87be795f9
00cc9 4585c0                         test       r8d, r8d
00ccc 0f8ca7100000                   jl         0x7fa87be795f9
00cd2 4585c0                         test       r8d, r8d
00cd5 7432                           je         0x7fa87be78589
00cd7 498d7c3b0c                     lea        rdi, [r11 + rdi + 0xc]
00cdc 4d8bd9                         mov        r11, r9
00cdf 4b8d74110c                     lea        rsi, [r9 + r10 + 0xc]
00ce4 4963d0                         movsxd     rdx, r8d
00ce7 4883fa20                       cmp        rdx, 0x20
00ceb 0f865effffff                   jbe        0x7fa87be784cf
00cf1 c5f877                         vzeroupper 
00cf4 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00cfe 41ffd2                         call       r10
00d01 0f1f840000000000               nop        dword ptr [rax + rax]
00d09 895d3c                         mov        dword ptr [rbp + 0x3c], ebx
00d0c c5f877                         vzeroupper 
00d0f 4881c4c0000000                 add        rsp, 0xc0
00d16 5d                             pop        rbp
00d17 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d1b 0f87f7100000                   ja         0x7fa87be79698
00d21 c3                             ret        
00d22 0f1f8000000000                 nop        dword ptr [rax]
00d29 0f1f8000000000                 nop        dword ptr [rax]
00d30 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00d38 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
00d3f 2bac2484000000                 sub        ebp, dword ptr [rsp + 0x84]
00d46 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00d4b 8bd5                           mov        edx, ebp
00d4d 4889b424d0000000               mov        qword ptr [rsp + 0xd0], rsi
00d55 666690                         nop        
00d58 c5f877                         vzeroupper 
00d5b e88082a9ff                     call       0x7fa87b910860
00d60 0f1f8400580e000b               nop        dword ptr [rax + rax + 0xb000e58]
00d68 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00d70 8b942490000000                 mov        edx, dword ptr [rsp + 0x90]
00d77 488bc8                         mov        rcx, rax
00d7a 6690                           nop        
00d7c c5f877                         vzeroupper 
00d7f e85c82a9ff                     call       0x7fa87b910860
00d84 0f1f84007c0e000c               nop        dword ptr [rax + rax + 0xc000e7c]
00d8c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00d94 4183c208                       add        r10d, 8
00d98 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00d9d 7c91                           jl         0x7fa87be785b0
00d9f e9ddf5ffff                     jmp        0x7fa87be77c01
00da4 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00dab e91bf7ffff                     jmp        0x7fa87be77d4b
00db0 ffcb                           dec        ebx
00db2 85db                           test       ebx, ebx
00db4 7e2c                           jle        0x7fa87be78662
00db6 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00dbe 45894314                       mov        dword ptr [r11 + 0x14], r8d
00dc2 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00dc6 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00dce 45895810                       mov        dword ptr [r8 + 0x10], r11d
00dd2 4189580c                       mov        dword ptr [r8 + 0xc], ebx
00dd6 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00ddd e9e9f6ffff                     jmp        0x7fa87be77d4b
00de2 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00de6 48be28387ce200000000           movabs     rsi, 0xe27c3828
00df0 48ff742440                     push       qword ptr [rsp + 0x40]
00df5 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
00dfd 8b6c2420                       mov        ebp, dword ptr [rsp + 0x20]
00e01 896c2404                       mov        dword ptr [rsp + 4], ebp
00e05 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00e0a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00e0f 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00e13 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00e17 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00e1c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00e21 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e26 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
00e2a 896c241c                       mov        dword ptr [rsp + 0x1c], ebp
00e2e 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
00e32 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00e36 89542430                       mov        dword ptr [rsp + 0x30], edx
00e3a 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
00e3f 48896c2440                     mov        qword ptr [rsp + 0x40], rbp
00e44 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
00e49 666690                         nop        
00e4c c5f877                         vzeroupper 
00e4f e88c81a9ff                     call       0x7fa87b910860
00e54 0f1f84004c0f000d               nop        dword ptr [rax + rax + 0xd000f4c]
00e5c 4885c0                         test       rax, rax
00e5f 0f85f4f6ffff                   jne        0x7fa87be77dd9
00e65 bef6ffffff                     mov        esi, 0xfffffff6
00e6a 6690                           nop        
00e6c c5f877                         vzeroupper 
00e6f e86cf6b5ff                     call       0x7fa87b9d7d60
00e74 0f1f84006c0f000e               nop        dword ptr [rax + rax + 0xe000f6c]
00e7c 4d03c1                         add        r8, r9
00e7f 4d3bc6                         cmp        r8, r14
00e82 7e08                           jle        0x7fa87be7870c
00e84 4533ed                         xor        r13d, r13d
00e87 e925f2ffff                     jmp        0x7fa87be77931
00e8c 4533ed                         xor        r13d, r13d
00e8f bf01000000                     mov        edi, 1
00e94 e91af2ffff                     jmp        0x7fa87be77933
00e99 bee4ffffff                     mov        esi, 0xffffffe4
00e9e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00ea3 448b0424                       mov        r8d, dword ptr [rsp]
00ea7 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00eaf 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00eb4 4c891c24                       mov        qword ptr [rsp], r11
00eb8 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00ebd 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00ec5 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00eca 4489442408                     mov        dword ptr [rsp + 8], r8d
00ecf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ed4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ed9 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00ede 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00ee3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ee8 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00eed 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ef2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ef7 89542428                       mov        dword ptr [rsp + 0x28], edx
00efb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f00 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00f05 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00f0a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f0f 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00f14 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f19 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00f1e 6690                           nop        
00f20 c5f877                         vzeroupper 
00f23 e8b8f5b5ff                     call       0x7fa87b9d7d60
00f28 0f1f84002010000f               nop        dword ptr [rax + rax + 0xf001020]
00f30 bee4ffffff                     mov        esi, 0xffffffe4
00f35 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00f3a 448b0424                       mov        r8d, dword ptr [rsp]
00f3e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00f46 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00f4b 4c891c24                       mov        qword ptr [rsp], r11
00f4f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00f54 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00f5c 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f61 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00f66 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f6b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f70 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f75 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00f7a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f7f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f84 89542428                       mov        dword ptr [rsp + 0x28], edx
00f88 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f8d c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00f93 90                             nop        
00f94 c5f877                         vzeroupper 
00f97 e844f5b5ff                     call       0x7fa87b9d7d60
00f9c 0f1f840094100010               nop        dword ptr [rax + rax + 0x10001094]
00fa4 bee4ffffff                     mov        esi, 0xffffffe4
00fa9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00fae 448b1c24                       mov        r11d, dword ptr [rsp]
00fb2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00fba 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fbf 4c891424                       mov        qword ptr [rsp], r10
00fc3 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00fc8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00fd0 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fd5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00fda 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00fdf 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00fe4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fe9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ff3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00ff8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ffd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01002 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01007 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0100c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01011 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01016 6690                           nop        
01018 c5f877                         vzeroupper 
0101b e8c0f4b5ff                     call       0x7fa87b9d7d60
01020 0f1f840018110011               nop        dword ptr [rax + rax + 0x11001118]
01028 bee4ffffff                     mov        esi, 0xffffffe4
0102d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01032 448b1c24                       mov        r11d, dword ptr [rsp]
01036 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0103e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01043 4c891424                       mov        qword ptr [rsp], r10
01047 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0104c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01054 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01059 4489542408                     mov        dword ptr [rsp + 8], r10d
0105e 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01066 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0106b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01070 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01075 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0107a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0107f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01084 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01089 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0108e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01093 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01099 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0109e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
010a3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
010a8 4489542458                     mov        dword ptr [rsp + 0x58], r10d
010ad 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
010b2 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
010b7 90                             nop        
010b8 c5f877                         vzeroupper 
010bb e820f4b5ff                     call       0x7fa87b9d7d60
010c0 0f1f8400b8110012               nop        dword ptr [rax + rax + 0x120011b8]
010c8 be45ffffff                     mov        esi, 0xffffff45
010cd 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
010d5 666690                         nop        
010d8 c5f877                         vzeroupper 
010db e800f4b5ff                     call       0x7fa87b9d7d60
010e0 0f1f8400d8110013               nop        dword ptr [rax + rax + 0x130011d8]
010e8 be45ffffff                     mov        esi, 0xffffff45
010ed 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
010f2 448b0424                       mov        r8d, dword ptr [rsp]
010f6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
010fe 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01103 4c891c24                       mov        qword ptr [rsp], r11
01107 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0110c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01114 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01119 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0111e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01123 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01128 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0112d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01132 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01137 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0113c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01141 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01145 89542428                       mov        dword ptr [rsp + 0x28], edx
01149 897c2430                       mov        dword ptr [rsp + 0x30], edi
0114d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01152 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01157 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0115c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01161 666690                         nop        
01164 c5f877                         vzeroupper 
01167 e874f3b5ff                     call       0x7fa87b9d7d60
0116c 0f1f840064120014               nop        dword ptr [rax + rax + 0x14001264]
01174 4d3bd9                         cmp        r11, r9
01177 bdffffffff                     mov        ebp, 0xffffffff
0117c 7c08                           jl         0x7fa87be78a06
0117e 400f95c5                       setne      bpl
01182 400fb6ed                       movzx      ebp, bpl
01186 be45ffffff                     mov        esi, 0xffffff45
0118b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01190 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01198 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0119d 44895c2404                     mov        dword ptr [rsp + 4], r11d
011a2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
011a7 4489442410                     mov        dword ptr [rsp + 0x10], r8d
011ac 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
011b1 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011b6 4489542418                     mov        dword ptr [rsp + 0x18], r10d
011bb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011c0 4c89542420                     mov        qword ptr [rsp + 0x20], r10
011c5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
011ca 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
011cf 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
011d4 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
011d9 89542430                       mov        dword ptr [rsp + 0x30], edx
011dd 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
011e2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
011e7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
011ec 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
011f1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
011f6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
011fb 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01200 c5f877                         vzeroupper 
01203 e8d8f2b5ff                     call       0x7fa87b9d7d60
01208 0f1f840000130015               nop        dword ptr [rax + rax + 0x15001300]
01210 be45ffffff                     mov        esi, 0xffffff45
01215 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0121a 448b1c24                       mov        r11d, dword ptr [rsp]
0121e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01226 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0122b 4c891c24                       mov        qword ptr [rsp], r11
0122f 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01234 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
0123c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01241 44895c2408                     mov        dword ptr [rsp + 8], r11d
01246 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0124b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01250 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01255 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0125a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0125f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01264 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01269 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0126e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01273 89542428                       mov        dword ptr [rsp + 0x28], edx
01277 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0127c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01281 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01286 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0128b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01290 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01295 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0129a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0129f 4489542450                     mov        dword ptr [rsp + 0x50], r10d
012a4 c5f877                         vzeroupper 
012a7 e834f2b5ff                     call       0x7fa87b9d7d60
012ac 0f1f8400a4130016               nop        dword ptr [rax + rax + 0x160013a4]
012b4 be45ffffff                     mov        esi, 0xffffff45
012b9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
012be 448b0c24                       mov        r9d, dword ptr [rsp]
012c2 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
012ca 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012cf 4c891c24                       mov        qword ptr [rsp], r11
012d3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012d8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
012e0 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
012e5 44894c2408                     mov        dword ptr [rsp + 8], r9d
012ea 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
012ef 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
012f4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012fe 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01303 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01308 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0130d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01312 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01317 89542428                       mov        dword ptr [rsp + 0x28], edx
0131b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01320 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01325 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0132a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0132f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01334 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01339 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0133e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01343 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01348 c5f877                         vzeroupper 
0134b e890f1b5ff                     call       0x7fa87b9d7d60
01350 0f1f840048140017               nop        dword ptr [rax + rax + 0x17001448]
01358 be45ffffff                     mov        esi, 0xffffff45
0135d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01362 448b0424                       mov        r8d, dword ptr [rsp]
01366 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0136e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01373 4c891c24                       mov        qword ptr [rsp], r11
01377 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0137c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01384 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01389 4489442408                     mov        dword ptr [rsp + 8], r8d
0138e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01393 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01398 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0139d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013a2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013a7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
013ac 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
013b1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
013b6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013bb 89542434                       mov        dword ptr [rsp + 0x34], edx
013bf 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
013c4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
013c9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
013ce 4c89542440                     mov        qword ptr [rsp + 0x40], r10
013d3 90                             nop        
013d4 c5f877                         vzeroupper 
013d7 e804f1b5ff                     call       0x7fa87b9d7d60
013dc 0f1f8400d4140018               nop        dword ptr [rax + rax + 0x180014d4]
013e4 be45ffffff                     mov        esi, 0xffffff45
013e9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
013ee 448b1424                       mov        r10d, dword ptr [rsp]
013f2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
013fa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013ff 4c891424                       mov        qword ptr [rsp], r10
01403 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01408 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01410 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01415 4489542408                     mov        dword ptr [rsp + 8], r10d
0141a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0141f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01424 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01429 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0142e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01433 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01438 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0143d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01442 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0144a 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0144f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01454 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01459 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0145e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01463 90                             nop        
01464 c5f877                         vzeroupper 
01467 e874f0b5ff                     call       0x7fa87b9d7d60
0146c 0f1f840064150019               nop        dword ptr [rax + rax + 0x19001564]
01474 33ff                           xor        edi, edi
01476 448bc1                         mov        r8d, ecx
01479 e919f8ffff                     jmp        0x7fa87be78517
0147e be17000000                     mov        esi, 0x17
01483 90                             nop        
01484 c5f877                         vzeroupper 
01487 e854f0b5ff                     call       0x7fa87b9d7d60
0148c 0f1f84008415001a               nop        dword ptr [rax + rax + 0x1a001584]
01494 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01499 c4c1f97ec2                     vmovq      r10, xmm0
0149e be6effffff                     mov        esi, 0xffffff6e
014a3 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
014ab 4c89542408                     mov        qword ptr [rsp + 8], r10
014b0 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
014b5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ba 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014be 89442414                       mov        dword ptr [rsp + 0x14], eax
014c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c7 4889442418                     mov        qword ptr [rsp + 0x18], rax
014cc 895c2420                       mov        dword ptr [rsp + 0x20], ebx
014d0 894c2424                       mov        dword ptr [rsp + 0x24], ecx
014d4 4489442428                     mov        dword ptr [rsp + 0x28], r8d
014d9 897c2438                       mov        dword ptr [rsp + 0x38], edi
014dd 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
014e2 4c89742448                     mov        qword ptr [rsp + 0x48], r14
014e7 90                             nop        
014e8 c5f877                         vzeroupper 
014eb e8f0efb5ff                     call       0x7fa87b9d7d60
014f0 0f1f8400e815001b               nop        dword ptr [rax + rax + 0x1b0015e8]
014f8 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
014fd c4c1f97ec2                     vmovq      r10, xmm0
01502 eb9a                           jmp        0x7fa87be78d1e
01504 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01509 c4c1f97ec2                     vmovq      r10, xmm0
0150e eb8e                           jmp        0x7fa87be78d1e
01510 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01515 c4c1f97ec2                     vmovq      r10, xmm0
0151a e97fffffff                     jmp        0x7fa87be78d1e
0151f bebeffffff                     mov        esi, 0xffffffbe
01524 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01529 448b1c24                       mov        r11d, dword ptr [rsp]
0152d 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01535 c4c1f97ec2                     vmovq      r10, xmm0
0153a 4c891424                       mov        qword ptr [rsp], r10
0153e 44894c2408                     mov        dword ptr [rsp + 8], r9d
01543 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01548 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0154d 4889442410                     mov        qword ptr [rsp + 0x10], rax
01552 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01556 6690                           nop        
01558 c5f877                         vzeroupper 
0155b e880efb5ff                     call       0x7fa87b9d7d60
01560 0f1f84005816001c               nop        dword ptr [rax + rax + 0x1c001658]
01568 bee4ffffff                     mov        esi, 0xffffffe4
0156d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01572 448b0424                       mov        r8d, dword ptr [rsp]
01576 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0157e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01583 4c891c24                       mov        qword ptr [rsp], r11
01587 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0158c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01594 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01599 44895c2408                     mov        dword ptr [rsp + 8], r11d
0159e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015a3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015a8 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015b2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
015bc 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015c1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015c6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015cb 894c2424                       mov        dword ptr [rsp + 0x24], ecx
015cf 89542428                       mov        dword ptr [rsp + 0x28], edx
015d3 897c243c                       mov        dword ptr [rsp + 0x3c], edi
015d7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
015dc 4c89542448                     mov        qword ptr [rsp + 0x48], r10
015e1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015e6 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
015eb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015f0 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
015f5 666690                         nop        
015f8 c5f877                         vzeroupper 
015fb e8e0eeb5ff                     call       0x7fa87b9d7d60
01600 0f1f8400f816001d               nop        dword ptr [rax + rax + 0x1d0016f8]
01608 bef6ffffff                     mov        esi, 0xfffffff6
0160d 666690                         nop        
01610 c5f877                         vzeroupper 
01613 e8c8eeb5ff                     call       0x7fa87b9d7d60
01618 0f1f84001017001e               nop        dword ptr [rax + rax + 0x1e001710]
01620 bee4ffffff                     mov        esi, 0xffffffe4
01625 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0162a 448b1c24                       mov        r11d, dword ptr [rsp]
0162e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01636 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0163b 4c891424                       mov        qword ptr [rsp], r10
0163f 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01644 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0164c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01651 44895c2408                     mov        dword ptr [rsp + 8], r11d
01656 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0165e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01663 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01668 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0166d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01672 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01677 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0167c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01681 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01686 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0168b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01690 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01695 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0169d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
016a2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
016a7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
016ac 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016b1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016b6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
016bb 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
016c0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
016c5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016ca 6690                           nop        
016cc c5f877                         vzeroupper 
016cf e80ceeb5ff                     call       0x7fa87b9d7d60
016d4 0f1f8400cc17001f               nop        dword ptr [rax + rax + 0x1f0017cc]
016dc bee4ffffff                     mov        esi, 0xffffffe4
016e1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016e6 448b1c24                       mov        r11d, dword ptr [rsp]
016ea 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
016f2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016f7 4c891424                       mov        qword ptr [rsp], r10
016fb 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01700 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01708 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0170d 4489542408                     mov        dword ptr [rsp + 8], r10d
01712 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0171a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0171f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01724 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01729 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0172e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01733 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01738 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0173d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01742 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01747 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0174c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01751 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01756 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0175b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01760 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01765 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0176a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0176f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01774 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01779 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0177e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01783 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01788 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0178d 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01792 6690                           nop        
01794 c5f877                         vzeroupper 
01797 e844edb5ff                     call       0x7fa87b9d7d60
0179c 0f1f840094180020               nop        dword ptr [rax + rax + 0x20001894]
017a4 beccffffff                     mov        esi, 0xffffffcc
017a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017ae 448b1424                       mov        r10d, dword ptr [rsp]
017b2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
017ba 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017bf 4c891424                       mov        qword ptr [rsp], r10
017c3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
017c8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017d0 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
017d5 4489542408                     mov        dword ptr [rsp + 8], r10d
017da 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
017e2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017e7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017ec 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017f1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017f6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017fb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01800 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01805 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0180a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0180f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01817 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0181c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01821 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01826 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0182b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01830 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01835 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0183a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0183f 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01844 c5f877                         vzeroupper 
01847 e894ecb5ff                     call       0x7fa87b9d7d60
0184c 0f1f840044190021               nop        dword ptr [rax + rax + 0x21001944]
01854 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0185c 458d5308                       lea        r10d, [r11 + 8]
01860 458bca                         mov        r9d, r10d
01863 be6effffff                     mov        esi, 0xffffff6e
01868 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0186d 448b1424                       mov        r10d, dword ptr [rsp]
01871 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01879 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0187e 4c891424                       mov        qword ptr [rsp], r10
01882 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01887 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0188f 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01894 4489542408                     mov        dword ptr [rsp + 8], r10d
01899 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0189e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018a3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018a8 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018b2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018b7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018bc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018c1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018c6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018cb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018d0 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
018d5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
018da 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018df 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018e4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018e9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018ee 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018f3 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018f8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
018fd 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01902 458bd0                         mov        r10d, r8d
01905 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0190a 6690                           nop        
0190c c5f877                         vzeroupper 
0190f e8ccebb5ff                     call       0x7fa87b9d7d60
01914 0f1f84000c1a0022               nop        dword ptr [rax + rax + 0x22001a0c]
0191c 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01924 458d5308                       lea        r10d, [r11 + 8]
01928 458bca                         mov        r9d, r10d
0192b be66ffffff                     mov        esi, 0xffffff66
01930 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01935 448b1c24                       mov        r11d, dword ptr [rsp]
01939 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01941 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01946 4c891424                       mov        qword ptr [rsp], r10
0194a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0194f 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01957 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0195c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01961 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01966 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0196b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01970 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01975 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0197a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0197f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01984 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01989 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0198e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01993 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01998 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0199d 458bd3                         mov        r10d, r11d
019a0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
019a5 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019aa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019af 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019b4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019b9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019be 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
019c3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019c8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
019cd 458bd0                         mov        r10d, r8d
019d0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
019d5 666690                         nop        
019d8 c5f877                         vzeroupper 
019db e800ebb5ff                     call       0x7fa87b9d7d60
019e0 0f1f8400d81a0023               nop        dword ptr [rax + rax + 0x23001ad8]
019e8 be6effffff                     mov        esi, 0xffffff6e
019ed 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019f2 448b0424                       mov        r8d, dword ptr [rsp]
019f6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
019fe 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01a03 4c891c24                       mov        qword ptr [rsp], r11
01a07 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01a0c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01a14 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01a19 4489442408                     mov        dword ptr [rsp + 8], r8d
01a1e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a23 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a28 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a2d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a32 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a37 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a3c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a41 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a46 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a4b 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01a4f 89542428                       mov        dword ptr [rsp + 0x28], edx
01a53 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a57 897c2440                       mov        dword ptr [rsp + 0x40], edi
01a5b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a60 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a65 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a6a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01a6f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a74 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a79 666690                         nop        
01a7c c5f877                         vzeroupper 
01a7f e85ceab5ff                     call       0x7fa87b9d7d60
01a84 0f1f84007c1b0024               nop        dword ptr [rax + rax + 0x24001b7c]
01a8c 458bd8                         mov        r11d, r8d
01a8f e990f1ffff                     jmp        0x7fa87be784a4
01a94 bee4ffffff                     mov        esi, 0xffffffe4
01a99 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a9e 448b1424                       mov        r10d, dword ptr [rsp]
01aa2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01aaa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01aaf 4c891424                       mov        qword ptr [rsp], r10
01ab3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01ab8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01ac0 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01ac5 4489542408                     mov        dword ptr [rsp + 8], r10d
01aca 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01acf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ad4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ad9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ade 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ae3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01ae8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01aed 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01af2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01afa 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01aff 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01b07 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b0c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b11 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b16 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01b1b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01b20 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01b25 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01b2a 6690                           nop        
01b2c c5f877                         vzeroupper 
01b2f e8ace9b5ff                     call       0x7fa87b9d7d60
01b34 0f1f84002c1c0025               nop        dword ptr [rax + rax + 0x25001c2c]
01b3c bee4ffffff                     mov        esi, 0xffffffe4
01b41 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b46 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01b4e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b53 44895c2404                     mov        dword ptr [rsp + 4], r11d
01b58 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01b5d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b62 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b67 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b6c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b76 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b7b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b80 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b85 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b8a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01b92 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b97 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b9c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01ba1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ba6 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01bab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01bb0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01bb5 666690                         nop        
01bb8 c5f877                         vzeroupper 
01bbb e820e9b5ff                     call       0x7fa87b9d7d60
01bc0 0f1f8400b81c0026               nop        dword ptr [rax + rax + 0x26001cb8]
01bc8 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
01bcf ffc5                           inc        ebp
01bd1 bee4ffffff                     mov        esi, 0xffffffe4
01bd6 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01bdb 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01be3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01be8 44895c2404                     mov        dword ptr [rsp + 4], r11d
01bed 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01bf2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01bf7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bfc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c01 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c06 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c0b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c10 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c15 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c1a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c1f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c24 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01c29 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c2e 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01c33 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01c38 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01c3d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c42 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01c47 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01c4c c5f877                         vzeroupper 
01c4f e88ce8b5ff                     call       0x7fa87b9d7d60
01c54 0f1f84004c1d0027               nop        dword ptr [rax + rax + 0x27001d4c]
01c5c bee4ffffff                     mov        esi, 0xffffffe4
01c61 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c66 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c6e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01c73 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c78 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c7d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c82 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c87 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c8c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c91 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c96 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c9b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ca0 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01ca5 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01caa 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01caf 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cb4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01cb9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01cbe 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01cc3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01cc8 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01ccd 666690                         nop        
01cd0 c5f877                         vzeroupper 
01cd3 e808e8b5ff                     call       0x7fa87b9d7d60
01cd8 0f1f8400d01d0028               nop        dword ptr [rax + rax + 0x28001dd0]
01ce0 bee4ffffff                     mov        esi, 0xffffffe4
01ce5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cea 448b1c24                       mov        r11d, dword ptr [rsp]
01cee 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01cf6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cfb 4c891424                       mov        qword ptr [rsp], r10
01cff 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d04 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01d0c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d11 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d16 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d1b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d20 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d25 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01d2a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d2f 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01d34 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01d39 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01d3e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d43 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01d48 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d4d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d52 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d57 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d5c 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d61 666690                         nop        
01d64 c5f877                         vzeroupper 
01d67 e874e7b5ff                     call       0x7fa87b9d7d60
01d6c 0f1f8400641e0029               nop        dword ptr [rax + rax + 0x29001e64]
01d74 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d79 beccffffff                     mov        esi, 0xffffffcc
01d7e 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01d86 89bc24d4000000                 mov        dword ptr [rsp + 0xd4], edi
01d8d 44890c24                       mov        dword ptr [rsp], r9d
01d91 4489542404                     mov        dword ptr [rsp + 4], r10d
01d96 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01d9b 90                             nop        
01d9c c5f877                         vzeroupper 
01d9f e83ce7b5ff                     call       0x7fa87b9d7d60
01da4 0f1f84009c1e002a               nop        dword ptr [rax + rax + 0x2a001e9c]
01dac bef6ffffff                     mov        esi, 0xfffffff6
01db1 666690                         nop        
01db4 c5f877                         vzeroupper 
01db7 e824e7b5ff                     call       0x7fa87b9d7d60
01dbc 0f1f8400b41e002b               nop        dword ptr [rax + rax + 0x2b001eb4]
01dc4 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01dc9 c4c1f97ec2                     vmovq      r10, xmm0
01dce e9cbf6ffff                     jmp        0x7fa87be78d1e
01dd3 eb14                           jmp        0x7fa87be79669
01dd5 eb12                           jmp        0x7fa87be79669
01dd7 eb10                           jmp        0x7fa87be79669
01dd9 eb0e                           jmp        0x7fa87be79669
01ddb eb0c                           jmp        0x7fa87be79669
01ddd eb0a                           jmp        0x7fa87be79669
01ddf eb08                           jmp        0x7fa87be79669
01de1 eb06                           jmp        0x7fa87be79669
01de3 eb04                           jmp        0x7fa87be79669
01de5 eb02                           jmp        0x7fa87be79669
01de7 eb00                           jmp        0x7fa87be79669
01de9 488bf0                         mov        rsi, rax
01dec e96be7ffff                     jmp        0x7fa87be77ddc
01df1 bef6ffffff                     mov        esi, 0xfffffff6
01df6 498beb                         mov        rbp, r11
01df9 89bc24d0000000                 mov        dword ptr [rsp + 0xd0], edi
01e00 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01e08 c5f877                         vzeroupper 
01e0b e8d0e6b5ff                     call       0x7fa87b9d7d60
01e10 0f1f8400081f002c               nop        dword ptr [rax + rax + 0x2c001f08]
01e18 49ba9785e77ba87f0000           movabs     r10, 0x7fa87be78597
01e22 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01e29 e93298a9ff                     jmp        0x7fa87b912ee0
01e2e e8ed63a8ff                     call       0x7fa87b8ffaa0
01e33 e906e2ffff                     jmp        0x7fa87be778be
