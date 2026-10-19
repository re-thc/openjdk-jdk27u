00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c05aa9ff                   jne        0x7f882b8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f852e1f0000                   jne        0x7f882be66dec
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 488bde                         mov        rbx, rsi
0004c 8b7638                         mov        esi, dword ptr [rsi + 0x38]
0004f 448b4304                       mov        r8d, dword ptr [rbx + 4]
00053 4489442454                     mov        dword ptr [rsp + 0x54], r8d
00058 442bc6                         sub        r8d, esi
0005b 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
00063 453bd8                         cmp        r11d, r8d
00066 0f8f94160000                   jg         0x7f882be66580
0006c 488b6b08                       mov        rbp, qword ptr [rbx + 8]
00070 4c8b4b20                       mov        r9, qword ptr [rbx + 0x20]
00074 4c638424e0000000               movsxd     r8, dword ptr [rsp + 0xe0]
0007c 4c63de                         movsxd     r11, esi
0007f 4c03dd                         add        r11, rbp
00082 4d2bcb                         sub        r9, r11
00085 4d3bc1                         cmp        r8, r9
00088 0f8f72160000                   jg         0x7f882be66580
0008e 4c8b7310                       mov        r14, qword ptr [rbx + 0x10]
00092 4c8b6b28                       mov        r13, qword ptr [rbx + 0x28]
00096 4d85ed                         test       r13, r13
00099 0f848d100000                   je         0x7f882be65fac
0009f 33c9                           xor        ecx, ecx
000a1 4c8bda                         mov        r11, rdx
000a4 8b5204                         mov        edx, dword ptr [rdx + 4]
000a7 8b4340                         mov        eax, dword ptr [rbx + 0x40]
000aa 448bc7                         mov        r8d, edi
000ad 85ff                           test       edi, edi
000af 0f8ed7140000                   jle        0x7f882be6640c
000b5 89742414                       mov        dword ptr [rsp + 0x14], esi
000b9 4c2bed                         sub        r13, rbp
000bc 448d4ae0                       lea        r9d, [rdx - 0x20]
000c0 8b7c2454                       mov        edi, dword ptr [rsp + 0x54]
000c4 83c7e0                         add        edi, -0x20
000c7 418b7204                       mov        esi, dword ptr [r10 + 4]
000cb 85f6                           test       esi, esi
000cd 0f8661160000                   jbe        0x7f882be665b4
000d3 897c2420                       mov        dword ptr [rsp + 0x20], edi
000d7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000dc 89442410                       mov        dword ptr [rsp + 0x10], eax
000e0 89542438                       mov        dword ptr [rsp + 0x38], edx
000e4 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000e9 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000ee 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
000f3 4c89542408                     mov        qword ptr [rsp + 8], r10
000f8 4489442404                     mov        dword ptr [rsp + 4], r8d
000fd 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
00105 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
0010a 4c63d6                         movsxd     r10, esi
0010d 4d63d8                         movsxd     r11, r8d
00110 49ffcb                         dec        r11
00113 4d3bda                         cmp        r11, r10
00116 0f83fc150000                   jae        0x7f882be66598
0011c 85c9                           test       ecx, ecx
0011e 0f8403160000                   je         0x7f882be665a7
00124 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
0012c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00130 4585db                         test       r11d, r11d
00133 0f8648160000                   jbe        0x7f882be66601
00139 4183fb01                       cmp        r11d, 1
0013d 0f863e160000                   jbe        0x7f882be66601
00143 4183fb02                       cmp        r11d, 2
00147 0f8634160000                   jbe        0x7f882be66601
0014d 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00155 894c2478                       mov        dword ptr [rsp + 0x78], ecx
00159 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0015e 448b5804                       mov        r11d, dword ptr [rax + 4]
00162 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0016a 448d5af1                       lea        r11d, [rdx - 0xf]
0016e 4585db                         test       r11d, r11d
00171 0f8c61160000                   jl         0x7f882be66658
00177 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
0017f 4183c2f1                       add        r10d, -0xf
00183 4585d2                         test       r10d, r10d
00186 0f8c53160000                   jl         0x7f882be6665f
0018c 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00194 4183c3f9                       add        r11d, -7
00198 4585db                         test       r11d, r11d
0019b 0f8c45160000                   jl         0x7f882be66666
001a1 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
001a9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
001ae 4c8bd0                         mov        r10, rax
001b1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001b6 4c63542440                     movsxd     r10, dword ptr [rsp + 0x40]
001bb 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001c3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
001c8 4183c3f1                       add        r11d, -0xf
001cc 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
001d1 4983c2f1                       add        r10, -0xf
001d5 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001dd 448bd2                         mov        r10d, edx
001e0 458d5af1                       lea        r11d, [r10 - 0xf]
001e4 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001e9 4d63d2                         movsxd     r10, r10d
001ec 4983c2f1                       add        r10, -0xf
001f0 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
001f8 4533d2                         xor        r10d, r10d
001fb 33db                           xor        ebx, ebx
001fd e9bf010000                     jmp        0x7f882be65241
00202 4533db                         xor        r11d, r11d
00205 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0020a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0020f 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00213 448bda                         mov        r11d, edx
00216 4183fb03                       cmp        r11d, 3
0021a 0f8e51030000                   jle        0x7f882be653f1
00220 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00225 45894b10                       mov        dword ptr [r11 + 0x10], r9d
00229 458b4308                       mov        r8d, dword ptr [r11 + 8]
0022d 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00231 448d5afd                       lea        r11d, [rdx - 3]
00235 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0023a 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0023f 45895808                       mov        dword ptr [r8 + 8], r11d
00243 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0024b 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00250 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00255 4c03542418                     add        r10, qword ptr [rsp + 0x18]
0025a 4c63442428                     movsxd     r8, dword ptr [rsp + 0x28]
0025f 498bc8                         mov        rcx, r8
00262 4d03d0                         add        r10, r8
00265 4d3bda                         cmp        r11, r10
00268 0f8fe6110000                   jg         0x7f882be662d4
0026e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00273 4585db                         test       r11d, r11d
00276 0f8e34110000                   jle        0x7f882be66230
0027c 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
00281 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
00286 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0028b 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00290 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00295 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
0029a 4503cd                         add        r9d, r13d
0029d 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002a5 498d7c1a08                     lea        rdi, [r10 + rbx + 8]
002aa 448bd3                         mov        r10d, ebx
002ad 4403542428                     add        r10d, dword ptr [rsp + 0x28]
002b2 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
002ba 48636c242c                     movsxd     rbp, dword ptr [rsp + 0x2c]
002bf 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
002c4 0f8fec0a0000                   jg         0x7f882be65c36
002ca 443b542424                     cmp        r10d, dword ptr [rsp + 0x24]
002cf 0f8fd3110000                   jg         0x7f882be66328
002d5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002da 4183fb10                       cmp        r11d, 0x10
002de 0f8f5c010000                   jg         0x7f882be652c0
002e4 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002e8 0f831e100000                   jae        0x7f882be6618c
002ee 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002f6 c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
002fd 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00302 0f8348100000                   jae        0x7f882be661d0
00308 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0030d 4403d3                         add        r10d, ebx
00310 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00318 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0031d c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00324 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00329 4503d0                         add        r10d, r8d
0032c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00331 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00336 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
0033b 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00343 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00348 4183fa10                       cmp        r10d, 0x10
0034c 0f8fce110000                   jg         0x7f882be663a0
00352 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00357 4183fb10                       cmp        r11d, 0x10
0035b 0f8c0f030000                   jl         0x7f882be654f0
00361 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00369 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
0036e 0f83ed0e0000                   jae        0x7f882be660e1
00374 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00379 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00380 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00385 443b542444                     cmp        r10d, dword ptr [rsp + 0x44]
0038a 0f83200f0000                   jae        0x7f882be66130
00390 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00397 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0039c 4503c2                         add        r8d, r10d
0039f 4489442414                     mov        dword ptr [rsp + 0x14], r8d
003a4 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
003ac 41ffc2                         inc        r10d
003af 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003b4 0f8d440c0000                   jge        0x7f882be65e7e
003ba 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
003c1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003c6 4f8b4cd308                     mov        r9, qword ptr [r11 + r10*8 + 8]
003cb 4d8bd9                         mov        r11, r9
003ce 49c1eb12                       shr        r11, 0x12
003d2 458bdb                         mov        r11d, r11d
003d5 4181e3ffff0300                 and        r11d, 0x3ffff
003dc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003e1 458bc1                         mov        r8d, r9d
003e4 49c1f924                       sar        r9, 0x24
003e8 4181e0ffff0100                 and        r8d, 0x1ffff
003ef 4489442428                     mov        dword ptr [rsp + 0x28], r8d
003f4 458bd9                         mov        r11d, r9d
003f7 418bd3                         mov        edx, r11d
003fa 4585db                         test       r11d, r11d
003fd 0f8ccd0f0000                   jl         0x7f882be66250
00403 458bd8                         mov        r11d, r8d
00406 4585c0                         test       r8d, r8d
00409 0f84f3fdffff                   je         0x7f882be65082
0040f 448b0424                       mov        r8d, dword ptr [rsp]
00413 442bc3                         sub        r8d, ebx
00416 453bd8                         cmp        r11d, r8d
00419 0f8eebfdffff                   jle        0x7f882be6508a
0041f be45ffffff                     mov        esi, 0xffffff45
00424 418beb                         mov        ebp, r11d
00427 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0042f 90                             nop        
00430 c5f877                         vzeroupper 
00433 e8a8e3b5ff                     call       0x7f882b9c3660
00438 0f1f840030050000               nop        dword ptr [rax + rax + 0x530]
00440 4183fb30                       cmp        r11d, 0x30
00444 0f8f61070000                   jg         0x7f882be65a2b
0044a 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0044e 0f8356110000                   jae        0x7f882be6642a
00454 4c63cb                         movsxd     r9, ebx
00457 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0045f c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00466 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0046b 0f838b110000                   jae        0x7f882be6647c
00471 458d5810                       lea        r11d, [r8 + 0x10]
00475 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0047d 4d63d8                         movsxd     r11, r8d
00480 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00485 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0048c 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
00493 413bcd                         cmp        ecx, r13d
00496 0f8dbb000000                   jge        0x7f882be653d7
0049c 4d2bcb                         sub        r9, r11
0049f 4c63d9                         movsxd     r11, ecx
004a2 4f8d140b                       lea        r10, [r11 + r9]
004a6 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004ae 0f83bc110000                   jae        0x7f882be664f0
004b4 4d63d5                         movsxd     r10, r13d
004b7 4d2bd3                         sub        r10, r11
004ba 4983c20f                       add        r10, 0xf
004be 4983e2f0                       and        r10, 0xfffffffffffffff0
004c2 458bd2                         mov        r10d, r10d
004c5 478d540210                     lea        r10d, [r10 + r8 + 0x10]
004ca 4d63d2                         movsxd     r10, r10d
004cd 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004d2 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
004da 0f8390110000                   jae        0x7f882be664f0
004e0 3b4c2444                       cmp        ecx, dword ptr [rsp + 0x44]
004e4 0f8386110000                   jae        0x7f882be664f0
004ea 4983c2f0                       add        r10, -0x10
004ee 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004f6 0f8374110000                   jae        0x7f882be664f0
004fc 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00503 0f8faf110000                   jg         0x7f882be66538
00509 448bd3                         mov        r10d, ebx
0050c 452bd0                         sub        r10d, r8d
0050f 90                             nop        
00510 458bc2                         mov        r8d, r10d
00513 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0051b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00523 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0052a 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00532 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00537 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
0053e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00546 4183c310                       add        r11d, 0x10
0054a 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00552 453bdd                         cmp        r11d, r13d
00555 7cb9                           jl         0x7f882be65390
00557 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0055c 4403db                         add        r11d, ebx
0055f 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00567 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0056c e9c0fdffff                     jmp        0x7f882be651b1
00571 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00576 4585c0                         test       r8d, r8d
00579 7406                           je         0x7f882be65401
0057b 41ffcb                         dec        r11d
0057e 418bd3                         mov        edx, r11d
00581 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00586 458b4308                       mov        r8d, dword ptr [r11 + 8]
0058a 85d2                           test       edx, edx
0058c 0f8487070000                   je         0x7f882be65b99
00592 83fa03                         cmp        edx, 3
00595 0f84210b0000                   je         0x7f882be65f3c
0059b 83fa02                         cmp        edx, 2
0059e 0f878a000000                   ja         0x7f882be654ae
005a4 3b9424e8000000                 cmp        edx, dword ptr [rsp + 0xe8]
005ab 0f833c120000                   jae        0x7f882be6666d
005b1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005b6 458b449008                     mov        r8d, dword ptr [r8 + rdx*4 + 8]
005bb 85d2                           test       edx, edx
005bd 7e54                           jle        0x7f882be65493
005bf 448d4aff                       lea        r9d, [rdx - 1]
005c3 443b8c24e8000000               cmp        r9d, dword ptr [rsp + 0xe8]
005cb 0f830f140000                   jae        0x7f882be66860
005d1 4863ca                         movsxd     rcx, edx
005d4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005d9 458bdb                         mov        r11d, r11d
005dc 4183c3cc                       add        r11d, -0x34
005e0 41c1eb02                       shr        r11d, 2
005e4 458d4c13ff                     lea        r9d, [r11 + rdx - 1]
005e9 41bb04000000                   mov        r11d, 4
005ef c442a0f5d9                     bzhi       r11, r9, r11
005f4 492bcb                         sub        rcx, r11
005f7 48ffc9                         dec        rcx
005fa 4533db                         xor        r11d, r11d
005fd 4885c9                         test       rcx, rcx
00600 490f4ccb                       cmovl      rcx, r11
00604 8bc9                           mov        ecx, ecx
00606 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0060e e908060000                     jmp        0x7f882be65a9b
00613 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0061b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00620 45894208                       mov        dword ptr [r10 + 8], r8d
00624 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
00629 e91dfcffff                     jmp        0x7f882be650cb
0062e 48beb0af72e200000000           movabs     rsi, 0xe272afb0
00638 8beb                           mov        ebp, ebx
0063a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00642 6690                           nop        
00644 c5f877                         vzeroupper 
00647 e89463a9ff                     call       0x7f882b8fb860
0064c 0f1f840044070001               nop        dword ptr [rax + rax + 0x1000744]
00654 4885c0                         test       rax, rax
00657 0f8417120000                   je         0x7f882be666f4
0065d 488bf0                         mov        rsi, rax
00660 c5f877                         vzeroupper 
00663 4881c4d0000000                 add        rsp, 0xd0
0066a 5d                             pop        rbp
0066b e97060b6ff                     jmp        0x7f882b9cb560
00670 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
00675 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0067a 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0067f 0f8d77020000                   jge        0x7f882be6577c
00685 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0068a 4183c208                       add        r10d, 8
0068e 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00696 4183fb08                       cmp        r11d, 8
0069a 0f8d89010000                   jge        0x7f882be656a9
006a0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
006a8 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
006b0 0f8302150000                   jae        0x7f882be66a38
006b6 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
006bb 430fbe6c1008                   movsx      ebp, byte ptr [r8 + r10 + 8]
006c1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
006c6 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
006ce 0f835c150000                   jae        0x7f882be66ab0
006d4 43886c1008                     mov        byte ptr [r8 + r10 + 8], bpl
006d9 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
006e1 4183c203                       add        r10d, 3
006e5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
006ea 41ffc0                         inc        r8d
006ed 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
006f5 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
006fd 0f8365150000                   jae        0x7f882be66ae8
00703 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00708 4183c203                       add        r10d, 3
0070c 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
00714 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00719 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
0071f 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
00727 0f8387150000                   jae        0x7f882be66b34
0072d 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
00732 43886c1009                     mov        byte ptr [r8 + r10 + 9], bpl
00737 470fbe4c180a                   movsx      r9d, byte ptr [r8 + r11 + 0xa]
0073d 47884c100a                     mov        byte ptr [r8 + r10 + 0xa], r9b
00742 470fbe5c180b                   movsx      r11d, byte ptr [r8 + r11 + 0xb]
00748 47885c100b                     mov        byte ptr [r8 + r10 + 0xb], r11b
0074d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00752 4183fa08                       cmp        r10d, 8
00756 0f839c150000                   jae        0x7f882be66b78
0075c 49baf0e870e200000000           movabs     r10, 0xe270e8f0
00766 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0076b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00773 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00778 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0077d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00782 4183fb04                       cmp        r11d, 4
00786 7e3c                           jle        0x7f882be65644
00788 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
0078c 83c504                         add        ebp, 4
0078f 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00794 8b542428                       mov        edx, dword ptr [rsp + 0x28]
00798 c5f877                         vzeroupper 
0079b e84062a9ff                     call       0x7f882b8fb860
007a0 0f1f840098080002               nop        dword ptr [rax + rax + 0x2000898]
007a8 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007ad 8bd5                           mov        edx, ebp
007af 8bc8                           mov        ecx, eax
007b1 666690                         nop        
007b4 c5f877                         vzeroupper 
007b7 e82462a9ff                     call       0x7f882b8fb860
007bc 0f1f8400b4080003               nop        dword ptr [rax + rax + 0x30008b4]
007c4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
007c9 4183fb08                       cmp        r11d, 8
007cd 0f8ed1fbffff                   jle        0x7f882be65224
007d3 49ba18e970e200000000           movabs     r10, 0xe270e918
007dd 8b542428                       mov        edx, dword ptr [rsp + 0x28]
007e1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
007e6 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
007eb 83c208                         add        edx, 8
007ee 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007f3 90                             nop        
007f4 c5f877                         vzeroupper 
007f7 e8e461a9ff                     call       0x7f882b8fb860
007fc 0f1f8400f4080004               nop        dword ptr [rax + rax + 0x40008f4]
00804 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00809 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00810 488bc8                         mov        rcx, rax
00813 90                             nop        
00814 c5f877                         vzeroupper 
00817 e8c461a9ff                     call       0x7f882b8fb860
0081c 0f1f840014090005               nop        dword ptr [rax + rax + 0x5000914]
00824 e97bfbffff                     jmp        0x7f882be65224
00829 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0082e 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00835 666690                         nop        
00838 c5f877                         vzeroupper 
0083b e8a061a9ff                     call       0x7f882b8fb860
00840 0f1f840038090006               nop        dword ptr [rax + rax + 0x6000938]
00848 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0084d 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00851 488bc8                         mov        rcx, rax
00854 c5f877                         vzeroupper 
00857 e88461a9ff                     call       0x7f882b8fb860
0085c 0f1f840054090007               nop        dword ptr [rax + rax + 0x7000954]
00864 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0086c 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00871 0f8d2dfbffff                   jge        0x7f882be65224
00877 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0087c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00883 0f8eaf040000                   jle        0x7f882be65bb8
00889 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00891 4183c008                       add        r8d, 8
00895 be66ffffff                     mov        esi, 0xffffff66
0089a 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
008a2 448b1c24                       mov        r11d, dword ptr [rsp]
008a6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
008ae 4c8b542408                     mov        r10, qword ptr [rsp + 8]
008b3 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
008bb 448b542404                     mov        r10d, dword ptr [rsp + 4]
008c0 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
008c8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
008cd 44895c2408                     mov        dword ptr [rsp + 8], r11d
008d2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
008d7 4489542410                     mov        dword ptr [rsp + 0x10], r10d
008dc 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
008e1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008e6 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
008eb 90                             nop        
008ec c5f877                         vzeroupper 
008ef e8ecdeb5ff                     call       0x7f882b9c3660
008f4 0f1f8400ec090008               nop        dword ptr [rax + rax + 0x80009ec]
008fc 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00901 4183fa30                       cmp        r10d, 0x30
00905 0f8fee010000                   jg         0x7f882be65979
0090b 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
0090f 83c5f9                         add        ebp, -7
00912 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
00916 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0091e 443bdd                         cmp        r11d, ebp
00921 0f83a90f0000                   jae        0x7f882be66750
00927 418beb                         mov        ebp, r11d
0092a 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
00931 4863ed                         movsxd     rbp, ebp
00934 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
0093c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00941 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00946 4889ac24a8000000               mov        qword ptr [rsp + 0xa8], rbp
0094e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00953 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00958 0f83d60f0000                   jae        0x7f882be667b4
0095e 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00966 4963eb                         movsxd     rbp, r11d
00969 4889ac24b8000000               mov        qword ptr [rsp + 0xb8], rbp
00971 488d4d08                       lea        rcx, [rbp + 8]
00975 48be28c122e200000000           movabs     rsi, 0xe222c128
0097f 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00984 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0098c 4533c9                         xor        r9d, r9d
0098f 90                             nop        
00990 c5f877                         vzeroupper 
00993 e84856a9ff                     call       0x7f882b8fae60
00998 0f1f8400900a0009               nop        dword ptr [rax + rax + 0x9000a90]
009a0 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
009a8 4183c208                       add        r10d, 8
009ac 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
009b4 458bca                         mov        r9d, r10d
009b7 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
009bc 0f8d23010000                   jge        0x7f882be65965
009c2 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
009ca 482bac24b8000000               sub        rbp, qword ptr [rsp + 0xb8]
009d2 4d63c2                         movsxd     r8, r10d
009d5 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
009dd 4983c3f9                       add        r11, -7
009e1 4d8d1428                       lea        r10, [r8 + rbp]
009e5 4d3bd3                         cmp        r10, r11
009e8 0f837a100000                   jae        0x7f882be668e8
009ee 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
009f3 4d2bd0                         sub        r10, r8
009f6 4983c207                       add        r10, 7
009fa 4983e2f8                       and        r10, 0xfffffffffffffff8
009fe 458bc2                         mov        r8d, r10d
00a01 8b8c24b0000000                 mov        ecx, dword ptr [rsp + 0xb0]
00a08 458d540808                     lea        r10d, [r8 + rcx + 8]
00a0d 4d63d2                         movsxd     r10, r10d
00a10 4d8d442af8                     lea        r8, [r10 + rbp - 8]
00a15 4d3bc3                         cmp        r8, r11
00a18 0f834a100000                   jae        0x7f882be668e8
00a1e 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00a23 0f833f100000                   jae        0x7f882be668e8
00a29 4983c2f8                       add        r10, -8
00a2d 4d3bd3                         cmp        r10, r11
00a30 0f8332100000                   jae        0x7f882be668e8
00a36 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00a3b 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00a42 0f8fa8100000                   jg         0x7f882be66970
00a48 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00a4f 2be9                           sub        ebp, ecx
00a51 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00a55 6666660f1f840000000000         nop        word ptr [rax + rax]
00a60 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a68 4963ca                         movsxd     rcx, r10d
00a6b 4883c108                       add        rcx, 8
00a6f 8b6c2428                       mov        ebp, dword ptr [rsp + 0x28]
00a73 03ac24a8000000                 add        ebp, dword ptr [rsp + 0xa8]
00a7a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a7f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00a84 48be28c122e200000000           movabs     rsi, 0xe222c128
00a8e 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00a93 4533c9                         xor        r9d, r9d
00a96 6690                           nop        
00a98 c5f877                         vzeroupper 
00a9b e84055a9ff                     call       0x7f882b8fae60
00aa0 0f1f8400980b000a               nop        dword ptr [rax + rax + 0xa000b98]
00aa8 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00ab0 4183c308                       add        r11d, 8
00ab4 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00abc 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00ac1 7c9d                           jl         0x7f882be658e0
00ac3 eb20                           jmp        0x7f882be65965
00ac5 4d63d3                         movsxd     r10, r11d
00ac8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00acf c442a8f5db                     bzhi       r11, r11, r10
00ad4 c4c1fb92fb                     kmovq      k7, r11
00ad9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00adf 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ae5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00aea 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00aef 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00af4 e9abf8ffff                     jmp        0x7f882be65224
00af9 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b01 4585c0                         test       r8d, r8d
00b04 0f8c760e0000                   jl         0x7f882be66800
00b0a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b0f 4585d2                         test       r10d, r10d
00b12 0f8c680e0000                   jl         0x7f882be66800
00b18 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b1d 4503d8                         add        r11d, r8d
00b20 448b8c24ec000000               mov        r9d, dword ptr [rsp + 0xec]
00b28 453bcb                         cmp        r9d, r11d
00b2b 0f824f0e0000                   jb         0x7f882be66800
00b31 443b4c2414                     cmp        r9d, dword ptr [rsp + 0x14]
00b36 0f82440e0000                   jb         0x7f882be66800
00b3c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b41 4585db                         test       r11d, r11d
00b44 749f                           je         0x7f882be65965
00b46 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b4b 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00b50 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00b55 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00b5a 4883fd20                       cmp        rbp, 0x20
00b5e 0f8661ffffff                   jbe        0x7f882be65945
00b64 488bd5                         mov        rdx, rbp
00b67 c5f877                         vzeroupper 
00b6a 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
00b74 41ffd2                         call       r10
00b77 0f1f840000000000               nop        dword ptr [rax + rax]
00b7f e961ffffff                     jmp        0x7f882be65965
00b84 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b89 4d63d3                         movsxd     r10, r11d
00b8c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b93 c442a8f5db                     bzhi       r11, r11, r10
00b98 c4c1fb92fb                     kmovq      k7, r11
00b9d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ba3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ba9 eb60                           jmp        0x7f882be65a8b
00bab 85db                           test       ebx, ebx
00bad 0f8cd90c0000                   jl         0x7f882be6670c
00bb3 4585c0                         test       r8d, r8d
00bb6 0f8cd00c0000                   jl         0x7f882be6670c
00bbc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00bc1 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00bc9 0f82bd0c0000                   jb         0x7f882be6670c
00bcf 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00bd7 453bd5                         cmp        r10d, r13d
00bda 0f82ac0c0000                   jb         0x7f882be6670c
00be0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00be5 4585d2                         test       r10d, r10d
00be8 7421                           je         0x7f882be65a8b
00bea 4883f920                       cmp        rcx, 0x20
00bee 7694                           jbe        0x7f882be65a04
00bf0 488bd1                         mov        rdx, rcx
00bf3 c5f877                         vzeroupper 
00bf6 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
00c00 41ffd2                         call       r10
00c03 0f1f840000000000               nop        dword ptr [rax + rax]
00c0b 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00c10 e91cf7ffff                     jmp        0x7f882be651b1
00c15 666690                         nop        
00c18 418bd2                         mov        edx, r10d
00c1b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00c20 458b5c9304                     mov        r11d, dword ptr [r11 + rdx*4 + 4]
00c25 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00c2a 45895c9108                     mov        dword ptr [r9 + rdx*4 + 8], r11d
00c2f 448d52ff                       lea        r10d, [rdx - 1]
00c33 443bd1                         cmp        r10d, ecx
00c36 7fe0                           jg         0x7f882be65a98
00c38 4183fa3f                       cmp        r10d, 0x3f
00c3c 0f8e1e0e0000                   jle        0x7f882be668e0
00c42 448bd2                         mov        r10d, edx
00c45 41ffca                         dec        r10d
00c48 eb09                           jmp        0x7f882be65ad3
00c4a 660f1f440000                   nop        word ptr [rax + rax]
00c50 458bd3                         mov        r10d, r11d
00c53 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00c58 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00c63 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00c6e 62917e486f849388ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x78]
00c79 62917e487f84938cffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x74], zmm0
00c84 62917e486f849348ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xb8]
00c8f 62917e487f84934cffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xb4], zmm0
00c9a 62917e486f849308ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xf8]
00ca5 62917e487f84930cffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xf4], zmm0
00cb0 458d5ac0                       lea        r11d, [r10 - 0x40]
00cb4 4183fb3f                       cmp        r11d, 0x3f
00cb8 7f96                           jg         0x7f882be65ad0
00cba 4183fb0f                       cmp        r11d, 0xf
00cbe 7e2d                           jle        0x7f882be65b6d
00cc0 458bda                         mov        r11d, r10d
00cc3 4183c3c0                       add        r11d, -0x40
00cc7 90                             nop        
00cc8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ccd 62917e486f849ac8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x38]
00cd8 62917e487f849accffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x34], zmm0
00ce3 4183c3f0                       add        r11d, -0x10
00ce7 4183fb0f                       cmp        r11d, 0xf
00ceb 7fdb                           jg         0x7f882be65b48
00ced 4585db                         test       r11d, r11d
00cf0 0f8e25f9ffff                   jle        0x7f882be6549b
00cf6 6690                           nop        
00cf8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00cfd 478b549a04                     mov        r10d, dword ptr [r10 + r11*4 + 4]
00d02 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00d07 4789549908                     mov        dword ptr [r9 + r11*4 + 8], r10d
00d0c 41ffcb                         dec        r11d
00d0f 4585db                         test       r11d, r11d
00d12 7fe4                           jg         0x7f882be65b78
00d14 e902f9ffff                     jmp        0x7f882be6549b
00d19 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00d21 e9fef8ffff                     jmp        0x7f882be654a4
00d26 66660f1f840000000000           nop        word ptr [rax + rax]
00d30 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00d38 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00d3f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00d43 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d48 8bd5                           mov        edx, ebp
00d4a 6690                           nop        
00d4c c5f877                         vzeroupper 
00d4f e88c5ca9ff                     call       0x7f882b8fb860
00d54 0f1f84004c0e000b               nop        dword ptr [rax + rax + 0xb000e4c]
00d5c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d61 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00d68 488bc8                         mov        rcx, rax
00d6b 90                             nop        
00d6c c5f877                         vzeroupper 
00d6f e86c5ca9ff                     call       0x7f882b8fb860
00d74 0f1f84006c0e000c               nop        dword ptr [rax + rax + 0xc000e6c]
00d7c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00d84 4183c208                       add        r10d, 8
00d88 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00d8d 7ca1                           jl         0x7f882be65bb0
00d8f e910f6ffff                     jmp        0x7f882be65224
00d94 4d63d3                         movsxd     r10, r11d
00d97 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d9e c442a8f5db                     bzhi       r11, r11, r10
00da3 c4c1fb92fb                     kmovq      k7, r11
00da8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dae 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00db4 eb6e                           jmp        0x7f882be65ca4
00db6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00dbb 4585d2                         test       r10d, r10d
00dbe 0f8493040000                   je         0x7f882be660d7
00dc4 85db                           test       ebx, ebx
00dc6 0f8c14100000                   jl         0x7f882be66c60
00dcc 4585c0                         test       r8d, r8d
00dcf 0f8c0b100000                   jl         0x7f882be66c60
00dd5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00dda 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00de2 0f82f80f0000                   jb         0x7f882be66c60
00de8 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00df0 453bd5                         cmp        r10d, r13d
00df3 0f82e70f0000                   jb         0x7f882be66c60
00df9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dfe 4585db                         test       r11d, r11d
00e01 7421                           je         0x7f882be65ca4
00e03 4883f920                       cmp        rcx, 0x20
00e07 768b                           jbe        0x7f882be65c14
00e09 488bd1                         mov        rdx, rcx
00e0c c5f877                         vzeroupper 
00e0f 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
00e19 41ffd2                         call       r10
00e1c 0f1f840000000000               nop        dword ptr [rax + rax]
00e24 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00e29 4585d2                         test       r10d, r10d
00e2c 0f8e9d010000                   jle        0x7f882be65e4f
00e32 458bdd                         mov        r11d, r13d
00e35 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
00e3a 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00e42 458bd5                         mov        r10d, r13d
00e45 440354242c                     add        r10d, dword ptr [rsp + 0x2c]
00e4a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00e4f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e54 458bcb                         mov        r9d, r11d
00e57 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00e5c 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00e61 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00e66 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00e6b 0f8dc9000000                   jge        0x7f882be65dba
00e71 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00e76 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00e7b 458bda                         mov        r11d, r10d
00e7e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00e83 450f4fda                       cmovg      r11d, r10d
00e87 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00e8c 4585c9                         test       r9d, r9d
00e8f 0f8c930f0000                   jl         0x7f882be66ca8
00e95 4585ed                         test       r13d, r13d
00e98 0f8c8a0f0000                   jl         0x7f882be66ca8
00e9e 478d140b                       lea        r10d, [r11 + r9]
00ea2 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00eaa 453bc2                         cmp        r8d, r10d
00ead 0f82750f0000                   jb         0x7f882be66ca8
00eb3 458bd5                         mov        r10d, r13d
00eb6 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00ebb 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ec3 458bd8                         mov        r11d, r8d
00ec6 453bda                         cmp        r11d, r10d
00ec9 0f82590f0000                   jb         0x7f882be66ca8
00ecf 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00ed4 4585d2                         test       r10d, r10d
00ed7 0f8c4b0f0000                   jl         0x7f882be66ca8
00edd 4585d2                         test       r10d, r10d
00ee0 7429                           je         0x7f882be65d8b
00ee2 4963d2                         movsxd     rdx, r10d
00ee5 4883fa20                       cmp        rdx, 0x20
00ee9 7735                           ja         0x7f882be65da0
00eeb 4d63d2                         movsxd     r10, r10d
00eee 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ef5 c442a8f5db                     bzhi       r11, r11, r10
00efa c4c1fb92fb                     kmovq      k7, r11
00eff 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f05 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f0b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00f10 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00f15 0f8d89f4ffff                   jge        0x7f882be65224
00f1b e973020000                     jmp        0x7f882be66013
00f20 c5f877                         vzeroupper 
00f23 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
00f2d 41ffd2                         call       r10
00f30 0f1f840000000000               nop        dword ptr [rax + rax]
00f38 ebd1                           jmp        0x7f882be65d8b
00f3a 4585c9                         test       r9d, r9d
00f3d 0f8c590f0000                   jl         0x7f882be66d1c
00f43 4585ed                         test       r13d, r13d
00f46 0f8c500f0000                   jl         0x7f882be66d1c
00f4c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f51 4503d9                         add        r11d, r9d
00f54 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00f5c 453bc3                         cmp        r8d, r11d
00f5f 0f82370f0000                   jb         0x7f882be66d1c
00f65 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00f6a 453bc3                         cmp        r8d, r11d
00f6d 0f82290f0000                   jb         0x7f882be66d1c
00f73 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f78 4585db                         test       r11d, r11d
00f7b 0f8423f4ffff                   je         0x7f882be65224
00f81 4883fd20                       cmp        rbp, 0x20
00f85 7728                           ja         0x7f882be65e2f
00f87 458bd3                         mov        r10d, r11d
00f8a 4d63d2                         movsxd     r10, r10d
00f8d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f94 c442a8f5db                     bzhi       r11, r11, r10
00f99 c4c1fb92fb                     kmovq      k7, r11
00f9e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00fa4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00faa e9f5f3ffff                     jmp        0x7f882be65224
00faf 488bd5                         mov        rdx, rbp
00fb2 c5f877                         vzeroupper 
00fb5 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
00fbf 41ffd2                         call       r10
00fc2 0f1f840000000000               nop        dword ptr [rax + rax]
00fca e9d5f3ffff                     jmp        0x7f882be65224
00fcf 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
00fd4 e9cbf3ffff                     jmp        0x7f882be65224
00fd9 4d63d2                         movsxd     r10, r10d
00fdc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fe3 c442a8f5db                     bzhi       r11, r11, r10
00fe8 c4c1fb92fb                     kmovq      k7, r11
00fed 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ff3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ff9 e9a5000000                     jmp        0x7f882be65f23
00ffe 448b1424                       mov        r10d, dword ptr [rsp]
01002 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
0100a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0100f 4585c0                         test       r8d, r8d
01012 0f84400d0000                   je         0x7f882be66bd8
01018 498bc8                         mov        rcx, r8
0101b 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01023 4585c0                         test       r8d, r8d
01026 0f8c640d0000                   jl         0x7f882be66c10
0102c 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
01031 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01039 8b542438                       mov        edx, dword ptr [rsp + 0x38]
0103d 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01042 4585c9                         test       r9d, r9d
01045 0f8c570d0000                   jl         0x7f882be66c22
0104b 3b1424                         cmp        edx, dword ptr [rsp]
0104e 0f824e0d0000                   jb         0x7f882be66c22
01054 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
01058 4103ea                         add        ebp, r10d
0105b 8b7904                         mov        edi, dword ptr [rcx + 4]
0105e 3bfd                           cmp        edi, ebp
01060 0f823c0d0000                   jb         0x7f882be66c22
01066 4585d2                         test       r10d, r10d
01069 0f8c330d0000                   jl         0x7f882be66c22
0106f 4585d2                         test       r10d, r10d
01072 742f                           je         0x7f882be65f23
01074 4a8d740908                     lea        rsi, [rcx + r9 + 8]
01079 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
0107e 4963d2                         movsxd     rdx, r10d
01081 4883fa20                       cmp        rdx, 0x20
01085 0f864effffff                   jbe        0x7f882be65e59
0108b c5f877                         vzeroupper 
0108e 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
01098 41ffd2                         call       r10
0109b 0f1f840000000000               nop        dword ptr [rax + rax]
010a3 896b38                         mov        dword ptr [rbx + 0x38], ebp
010a6 c5f877                         vzeroupper 
010a9 4881c4d0000000                 add        rsp, 0xd0
010b0 5d                             pop        rbp
010b1 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
010b5 0f879b0e0000                   ja         0x7f882be66dd6
010bb c3                             ret        
010bc 41ffc8                         dec        r8d
010bf 4585c0                         test       r8d, r8d
010c2 7e22                           jle        0x7f882be65f66
010c4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
010c9 45894b10                       mov        dword ptr [r11 + 0x10], r9d
010cd 458b4b08                       mov        r9d, dword ptr [r11 + 8]
010d1 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
010d5 45894308                       mov        dword ptr [r11 + 8], r8d
010d9 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
010e1 e93ef5ffff                     jmp        0x7f882be654a4
010e6 48be80af72e200000000           movabs     rsi, 0xe272af80
010f0 8beb                           mov        ebp, ebx
010f2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
010fa 6690                           nop        
010fc c5f877                         vzeroupper 
010ff e8dc58a9ff                     call       0x7f882b8fb860
01104 0f1f8400fc11000d               nop        dword ptr [rax + rax + 0xd0011fc]
0110c 4885c0                         test       rax, rax
0110f 0f8548f5ffff                   jne        0x7f882be654dd
01115 bef6ffffff                     mov        esi, 0xfffffff6
0111a 6690                           nop        
0111c c5f877                         vzeroupper 
0111f e8bcd6b5ff                     call       0x7f882b9c3660
01124 0f1f84001c12000e               nop        dword ptr [rax + rax + 0xe00121c]
0112c 4d03d8                         add        r11, r8
0112f 4d3bde                         cmp        r11, r14
01132 7e08                           jle        0x7f882be65fbc
01134 4533ed                         xor        r13d, r13d
01137 e963efffff                     jmp        0x7f882be64f1f
0113c 4533ed                         xor        r13d, r13d
0113f b901000000                     mov        ecx, 1
01144 e958efffff                     jmp        0x7f882be64f21
01149 448bd5                         mov        r10d, ebp
0114c 4d63d2                         movsxd     r10, r10d
0114f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01156 c442a8f5db                     bzhi       r11, r11, r10
0115b c4c1fb92fb                     kmovq      k7, r11
01160 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01166 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0116c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01171 4403dd                         add        r11d, ebp
01174 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01179 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0117d 418502                         test       dword ptr [r10], eax
01180 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
01185 0f8d19f2ffff                   jge        0x7f882be65224
0118b 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
01193 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0119b 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
011a0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
011a8 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
011ac 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
011b0 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
011b4 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
011b9 410f4feb                       cmovg      ebp, r11d
011bd 458bda                         mov        r11d, r10d
011c0 4585d2                         test       r10d, r10d
011c3 0f8caf090000                   jl         0x7f882be669f8
011c9 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
011d1 4585c0                         test       r8d, r8d
011d4 0f8c9e090000                   jl         0x7f882be669f8
011da 458d142b                       lea        r10d, [r11 + rbp]
011de 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
011e6 453bc2                         cmp        r8d, r10d
011e9 0f8289090000                   jb         0x7f882be669f8
011ef 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
011f7 4403f5                         add        r14d, ebp
011fa 453bc6                         cmp        r8d, r14d
011fd 0f8275090000                   jb         0x7f882be669f8
01203 85ed                           test       ebp, ebp
01205 0f8c6d090000                   jl         0x7f882be669f8
0120b 85ed                           test       ebp, ebp
0120d 0f8459ffffff                   je         0x7f882be65fec
01213 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01218 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0121d 458bda                         mov        r11d, r10d
01220 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01228 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0122d 4863d5                         movsxd     rdx, ebp
01230 4883fa20                       cmp        rdx, 0x20
01234 0f860fffffff                   jbe        0x7f882be65fc9
0123a c5f877                         vzeroupper 
0123d 49ba204f8e2b887f0000           movabs     r10, 0x7f882b8e4f20
01247 41ffd2                         call       r10
0124a 0f1f840000000000               nop        dword ptr [rax + rax]
01252 e915ffffff                     jmp        0x7f882be65fec
01257 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0125c e9c3fbffff                     jmp        0x7f882be65ca4
01261 bee4ffffff                     mov        esi, 0xffffffe4
01266 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0126e 448b1c24                       mov        r11d, dword ptr [rsp]
01272 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0127a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0127f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01287 448b542404                     mov        r10d, dword ptr [rsp + 4]
0128c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01294 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01299 4c891424                       mov        qword ptr [rsp], r10
0129d 666690                         nop        
012a0 c5f877                         vzeroupper 
012a3 e838d5b5ff                     call       0x7f882b9c3660
012a8 0f1f8400a0130010               nop        dword ptr [rax + rax + 0x100013a0]
012b0 bee4ffffff                     mov        esi, 0xffffffe4
012b5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
012bd 448b1c24                       mov        r11d, dword ptr [rsp]
012c1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
012c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012ce 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
012d6 448b542404                     mov        r10d, dword ptr [rsp + 4]
012db 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
012e3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012e8 4c891424                       mov        qword ptr [rsp], r10
012ec 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
012f1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
012f6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
012fc c5f877                         vzeroupper 
012ff e8dcd4b5ff                     call       0x7f882b9c3660
01304 0f1f8400fc130011               nop        dword ptr [rax + rax + 0x110013fc]
0130c bee4ffffff                     mov        esi, 0xffffffe4
01311 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01319 448b1424                       mov        r10d, dword ptr [rsp]
0131d 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01325 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0132a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01332 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01337 4c891424                       mov        qword ptr [rsp], r10
0133b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0133f 90                             nop        
01340 c5f877                         vzeroupper 
01343 e898d4b5ff                     call       0x7f882b9c3660
01348 0f1f840040140012               nop        dword ptr [rax + rax + 0x12001440]
01350 bee4ffffff                     mov        esi, 0xffffffe4
01355 498bea                         mov        rbp, r10
01358 448b1424                       mov        r10d, dword ptr [rsp]
0135c 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01364 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01369 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01371 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01376 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0137e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01383 4c891424                       mov        qword ptr [rsp], r10
01387 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0138b 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01390 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01395 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0139a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
013a0 c5f877                         vzeroupper 
013a3 e838d4b5ff                     call       0x7f882b9c3660
013a8 0f1f8400a0140013               nop        dword ptr [rax + rax + 0x130014a0]
013b0 be45ffffff                     mov        esi, 0xffffff45
013b5 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
013bd 666690                         nop        
013c0 c5f877                         vzeroupper 
013c3 e818d4b5ff                     call       0x7f882b9c3660
013c8 0f1f8400c0140014               nop        dword ptr [rax + rax + 0x140014c0]
013d0 458bca                         mov        r9d, r10d
013d3 be45ffffff                     mov        esi, 0xffffff45
013d8 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
013e0 448b1424                       mov        r10d, dword ptr [rsp]
013e4 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013ec 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013f1 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
013f9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
013fe 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01406 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0140b 4c891424                       mov        qword ptr [rsp], r10
0140f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01414 4489542408                     mov        dword ptr [rsp + 8], r10d
01419 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0141e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01423 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01427 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0142c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01431 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01436 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0143b 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01440 89542430                       mov        dword ptr [rsp + 0x30], edx
01444 c5f877                         vzeroupper 
01447 e894d3b5ff                     call       0x7f882b9c3660
0144c 0f1f840044150015               nop        dword ptr [rax + rax + 0x15001544]
01454 4d3bda                         cmp        r11, r10
01457 bdffffffff                     mov        ebp, 0xffffffff
0145c 7c08                           jl         0x7f882be662e6
0145e 400f95c5                       setne      bpl
01462 400fb6ed                       movzx      ebp, bpl
01466 be45ffffff                     mov        esi, 0xffffff45
0146b 448b1c24                       mov        r11d, dword ptr [rsp]
0146f 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01477 448b442404                     mov        r8d, dword ptr [rsp + 4]
0147c 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01484 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01489 4c891c24                       mov        qword ptr [rsp], r11
0148d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01491 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01496 6690                           nop        
01498 c5f877                         vzeroupper 
0149b e840d3b5ff                     call       0x7f882b9c3660
014a0 0f1f840098150016               nop        dword ptr [rax + rax + 0x16001598]
014a8 be45ffffff                     mov        esi, 0xffffff45
014ad 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
014b5 448b1424                       mov        r10d, dword ptr [rsp]
014b9 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
014c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014c6 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
014ce 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014d3 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
014db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014e0 4c891424                       mov        qword ptr [rsp], r10
014e4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014e9 4489542408                     mov        dword ptr [rsp + 8], r10d
014ee 48894424f8                     mov        qword ptr [rsp - 8], rax
014f3 8b442414                       mov        eax, dword ptr [rsp + 0x14]
014f7 8944240c                       mov        dword ptr [rsp + 0xc], eax
014fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01500 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01504 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01509 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0150e 6690                           nop        
01510 c5f877                         vzeroupper 
01513 e8c8d2b5ff                     call       0x7f882b9c3660
01518 0f1f840010160017               nop        dword ptr [rax + rax + 0x17001610]
01520 be45ffffff                     mov        esi, 0xffffff45
01525 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0152d 448b1c24                       mov        r11d, dword ptr [rsp]
01531 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01539 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0153e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01546 448b542404                     mov        r10d, dword ptr [rsp + 4]
0154b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01553 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01558 4c891424                       mov        qword ptr [rsp], r10
0155c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01561 44895c2408                     mov        dword ptr [rsp + 8], r11d
01566 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0156b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01570 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01575 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0157a 6690                           nop        
0157c c5f877                         vzeroupper 
0157f e85cd2b5ff                     call       0x7f882b9c3660
01584 0f1f84007c160018               nop        dword ptr [rax + rax + 0x1800167c]
0158c 85c0                           test       eax, eax
0158e 0f847c090000                   je         0x7f882be66d90
01594 488bc8                         mov        rcx, rax
01597 448b0c24                       mov        r9d, dword ptr [rsp]
0159b 89742414                       mov        dword ptr [rsp + 0x14], esi
0159f 4533c0                         xor        r8d, r8d
015a2 458bd1                         mov        r10d, r9d
015a5 e993faffff                     jmp        0x7f882be65ebd
015aa bee4ffffff                     mov        esi, 0xffffffe4
015af 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
015b7 448b1c24                       mov        r11d, dword ptr [rsp]
015bb 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
015c3 448b542404                     mov        r10d, dword ptr [rsp + 4]
015c8 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
015d0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015d5 4c891424                       mov        qword ptr [rsp], r10
015d9 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
015de 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
015e3 895c2440                       mov        dword ptr [rsp + 0x40], ebx
015e7 895c2444                       mov        dword ptr [rsp + 0x44], ebx
015eb 90                             nop        
015ec c5f877                         vzeroupper 
015ef e8ecd1b5ff                     call       0x7f882b9c3660
015f4 0f1f8400ec160019               nop        dword ptr [rax + rax + 0x190016ec]
015fc c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01605 bee4ffffff                     mov        esi, 0xffffffe4
0160a 498bea                         mov        rbp, r10
0160d 448b1c24                       mov        r11d, dword ptr [rsp]
01611 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01619 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0161e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01626 448b542404                     mov        r10d, dword ptr [rsp + 4]
0162b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01633 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01638 4c891424                       mov        qword ptr [rsp], r10
0163c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01641 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01646 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0164b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01650 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01655 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01659 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0165e 6690                           nop        
01660 c5f877                         vzeroupper 
01663 e878d1b5ff                     call       0x7f882b9c3660
01668 0f1f84006017001a               nop        dword ptr [rax + rax + 0x1a001760]
01670 8beb                           mov        ebp, ebx
01672 83c510                         add        ebp, 0x10
01675 be6effffff                     mov        esi, 0xffffff6e
0167a 448b1c24                       mov        r11d, dword ptr [rsp]
0167e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01686 448b542404                     mov        r10d, dword ptr [rsp + 4]
0168b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01693 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01698 4c891424                       mov        qword ptr [rsp], r10
0169c 895c2414                       mov        dword ptr [rsp + 0x14], ebx
016a0 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
016a5 666690                         nop        
016a8 c5f877                         vzeroupper 
016ab e830d1b5ff                     call       0x7f882b9c3660
016b0 0f1f8400a817001b               nop        dword ptr [rax + rax + 0x1b0017a8]
016b8 8beb                           mov        ebp, ebx
016ba 83c510                         add        ebp, 0x10
016bd be66ffffff                     mov        esi, 0xffffff66
016c2 448b1424                       mov        r10d, dword ptr [rsp]
016c6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
016ce 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016d3 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016e0 4c891424                       mov        qword ptr [rsp], r10
016e4 895c2414                       mov        dword ptr [rsp + 0x14], ebx
016e8 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
016ed 666690                         nop        
016f0 c5f877                         vzeroupper 
016f3 e8e8d0b5ff                     call       0x7f882b9c3660
016f8 0f1f8400f017001c               nop        dword ptr [rax + rax + 0x1c0017f0]
01700 be17000000                     mov        esi, 0x17
01705 666690                         nop        
01708 c5f877                         vzeroupper 
0170b e8d0d0b5ff                     call       0x7f882b9c3660
01710 0f1f84000818001d               nop        dword ptr [rax + rax + 0x1d001808]
01718 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01720 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01725 eb0d                           jmp        0x7f882be665b4
01727 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0172f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01734 be6effffff                     mov        esi, 0xffffff6e
01739 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01741 4c89542408                     mov        qword ptr [rsp + 8], r10
01746 89442410                       mov        dword ptr [rsp + 0x10], eax
0174a 897c2418                       mov        dword ptr [rsp + 0x18], edi
0174e 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01753 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01758 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0175d 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01761 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01766 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0176b 90                             nop        
0176c c5f877                         vzeroupper 
0176f e86cd0b5ff                     call       0x7f882b9c3660
01774 0f1f84006c18001e               nop        dword ptr [rax + rax + 0x1e00186c]
0177c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01781 bebeffffff                     mov        esi, 0xffffffbe
01786 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0178e 448b0424                       mov        r8d, dword ptr [rsp]
01792 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0179a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0179f 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
017a7 4c89542408                     mov        qword ptr [rsp + 8], r10
017ac 890424                         mov        dword ptr [rsp], eax
017af 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
017b4 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
017b9 897c2414                       mov        dword ptr [rsp + 0x14], edi
017bd 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
017c2 894c2424                       mov        dword ptr [rsp + 0x24], ecx
017c6 6690                           nop        
017c8 c5f877                         vzeroupper 
017cb e810d0b5ff                     call       0x7f882b9c3660
017d0 0f1f8400c818001f               nop        dword ptr [rax + rax + 0x1f0018c8]
017d8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017dd eba2                           jmp        0x7f882be66601
017df 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017e4 eb9b                           jmp        0x7f882be66601
017e6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017eb eb94                           jmp        0x7f882be66601
017ed 458bca                         mov        r9d, r10d
017f0 bee4ffffff                     mov        esi, 0xffffffe4
017f5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
017fd 448b1c24                       mov        r11d, dword ptr [rsp]
01801 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01809 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0180e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01816 448b542404                     mov        r10d, dword ptr [rsp + 4]
0181b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01823 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01828 4c891424                       mov        qword ptr [rsp], r10
0182c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01831 4489542408                     mov        dword ptr [rsp + 8], r10d
01836 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0183b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01840 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01844 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01849 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0184e 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01853 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01858 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0185d 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01861 666690                         nop        
01864 c5f877                         vzeroupper 
01867 e874cfb5ff                     call       0x7f882b9c3660
0186c 0f1f840064190020               nop        dword ptr [rax + rax + 0x20001964]
01874 bef6ffffff                     mov        esi, 0xfffffff6
01879 666690                         nop        
0187c c5f877                         vzeroupper 
0187f e85ccfb5ff                     call       0x7f882b9c3660
01884 0f1f84007c190021               nop        dword ptr [rax + rax + 0x2100197c]
0188c beccffffff                     mov        esi, 0xffffffcc
01891 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01899 448b1424                       mov        r10d, dword ptr [rsp]
0189d 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
018a5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
018aa 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
018b2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018b7 4c891424                       mov        qword ptr [rsp], r10
018bb 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
018bf 90                             nop        
018c0 c5f877                         vzeroupper 
018c3 e818cfb5ff                     call       0x7f882b9c3660
018c8 0f1f8400c0190022               nop        dword ptr [rax + rax + 0x220019c0]
018d0 bee4ffffff                     mov        esi, 0xffffffe4
018d5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
018dd 448b1c24                       mov        r11d, dword ptr [rsp]
018e1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
018e9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018ee 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
018f6 448b542404                     mov        r10d, dword ptr [rsp + 4]
018fb 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01903 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01908 4c891424                       mov        qword ptr [rsp], r10
0190c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01911 44895c2408                     mov        dword ptr [rsp + 8], r11d
01916 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0191e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01923 90                             nop        
01924 c5f877                         vzeroupper 
01927 e8b4ceb5ff                     call       0x7f882b9c3660
0192c 0f1f8400241a0023               nop        dword ptr [rax + rax + 0x23001a24]
01934 bee4ffffff                     mov        esi, 0xffffffe4
01939 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01941 448b1c24                       mov        r11d, dword ptr [rsp]
01945 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0194d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01952 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0195a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0195f 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01967 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0196c 4c891424                       mov        qword ptr [rsp], r10
01970 c5f877                         vzeroupper 
01973 e868ceb5ff                     call       0x7f882b9c3660
01978 0f1f8400701a0024               nop        dword ptr [rax + rax + 0x24001a70]
01980 beccffffff                     mov        esi, 0xffffffcc
01985 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0198d 448b1c24                       mov        r11d, dword ptr [rsp]
01991 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01999 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0199e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019a6 448b542404                     mov        r10d, dword ptr [rsp + 4]
019ab 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
019b3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019b8 4c891424                       mov        qword ptr [rsp], r10
019bc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019c1 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019cb 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019d0 c5f877                         vzeroupper 
019d3 e808ceb5ff                     call       0x7f882b9c3660
019d8 0f1f8400d01a0025               nop        dword ptr [rax + rax + 0x25001ad0]
019e0 be6effffff                     mov        esi, 0xffffff6e
019e5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
019ed 448b1c24                       mov        r11d, dword ptr [rsp]
019f1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
019f9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
019fe 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01a06 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
01a0b 44898c24e4000000               mov        dword ptr [rsp + 0xe4], r9d
01a13 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01a18 44894c2408                     mov        dword ptr [rsp + 8], r9d
01a1d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01a22 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a27 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a2b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a30 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a35 448b4c2424                     mov        r9d, dword ptr [rsp + 0x24]
01a3a 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01a3f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a44 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01a49 89542440                       mov        dword ptr [rsp + 0x40], edx
01a4d 666690                         nop        
01a50 c5f877                         vzeroupper 
01a53 e888cdb5ff                     call       0x7f882b9c3660
01a58 0f1f8400501b0026               nop        dword ptr [rax + rax + 0x26001b50]
01a60 458bda                         mov        r11d, r10d
01a63 e985f2ffff                     jmp        0x7f882be65b6d
01a68 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01a70 458d5308                       lea        r10d, [r11 + 8]
01a74 458bca                         mov        r9d, r10d
01a77 be6effffff                     mov        esi, 0xffffff6e
01a7c 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01a84 448b1c24                       mov        r11d, dword ptr [rsp]
01a88 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a90 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a95 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01a9d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01aa2 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01aaa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aaf 4c891424                       mov        qword ptr [rsp], r10
01ab3 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ab8 44895c2408                     mov        dword ptr [rsp + 8], r11d
01abd 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01ac2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ac7 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01acc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ad1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ad6 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01adb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01ae0 c5f877                         vzeroupper 
01ae3 e8f8ccb5ff                     call       0x7f882b9c3660
01ae8 0f1f8400e01b0027               nop        dword ptr [rax + rax + 0x27001be0]
01af0 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01af8 458d5308                       lea        r10d, [r11 + 8]
01afc 458bca                         mov        r9d, r10d
01aff be66ffffff                     mov        esi, 0xffffff66
01b04 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b0c 448b1c24                       mov        r11d, dword ptr [rsp]
01b10 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01b18 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b1d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01b25 448b542404                     mov        r10d, dword ptr [rsp + 4]
01b2a 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01b32 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b37 4c891424                       mov        qword ptr [rsp], r10
01b3b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b40 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b45 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b4a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b4f 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01b54 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b59 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b5e 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b63 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01b68 c5f877                         vzeroupper 
01b6b e870ccb5ff                     call       0x7f882b9c3660
01b70 0f1f8400681c0028               nop        dword ptr [rax + rax + 0x28001c68]
01b78 beccffffff                     mov        esi, 0xffffffcc
01b7d 448b1c24                       mov        r11d, dword ptr [rsp]
01b81 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b89 448b542404                     mov        r10d, dword ptr [rsp + 4]
01b8e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01b96 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b9b 4c891424                       mov        qword ptr [rsp], r10
01b9f 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01ba3 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01ba8 c5f877                         vzeroupper 
01bab e830ccb5ff                     call       0x7f882b9c3660
01bb0 0f1f8400a81c0029               nop        dword ptr [rax + rax + 0x29001ca8]
01bb8 bee4ffffff                     mov        esi, 0xffffffe4
01bbd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01bc5 448b1c24                       mov        r11d, dword ptr [rsp]
01bc9 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01bd1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bd6 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01bde 448b542404                     mov        r10d, dword ptr [rsp + 4]
01be3 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01beb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bf0 4c891424                       mov        qword ptr [rsp], r10
01bf4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bf9 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bfe 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01c03 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c08 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01c0d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c12 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01c1a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01c1f 90                             nop        
01c20 c5f877                         vzeroupper 
01c23 e8b8cbb5ff                     call       0x7f882b9c3660
01c28 0f1f8400201d002a               nop        dword ptr [rax + rax + 0x2a001d20]
01c30 bee4ffffff                     mov        esi, 0xffffffe4
01c35 448b1424                       mov        r10d, dword ptr [rsp]
01c39 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01c41 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01c46 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01c4e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c53 4c891424                       mov        qword ptr [rsp], r10
01c57 90                             nop        
01c58 c5f877                         vzeroupper 
01c5b e880cbb5ff                     call       0x7f882b9c3660
01c60 0f1f8400581d002b               nop        dword ptr [rax + rax + 0x2b001d58]
01c68 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01c6f ffc5                           inc        ebp
01c71 bee4ffffff                     mov        esi, 0xffffffe4
01c76 448b1c24                       mov        r11d, dword ptr [rsp]
01c7a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c82 448b542404                     mov        r10d, dword ptr [rsp + 4]
01c87 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01c8f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c94 4c891424                       mov        qword ptr [rsp], r10
01c98 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c9d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ca2 6690                           nop        
01ca4 c5f877                         vzeroupper 
01ca7 e834cbb5ff                     call       0x7f882b9c3660
01cac 0f1f8400a41d002c               nop        dword ptr [rax + rax + 0x2c001da4]
01cb4 bee4ffffff                     mov        esi, 0xffffffe4
01cb9 448b1424                       mov        r10d, dword ptr [rsp]
01cbd 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01cc5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01cca 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01cd2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cd7 4c891424                       mov        qword ptr [rsp], r10
01cdb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ce0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ce5 666690                         nop        
01ce8 c5f877                         vzeroupper 
01ceb e8f0cab5ff                     call       0x7f882b9c3660
01cf0 0f1f8400e81d002d               nop        dword ptr [rax + rax + 0x2d001de8]
01cf8 bee4ffffff                     mov        esi, 0xffffffe4
01cfd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01d05 448b1424                       mov        r10d, dword ptr [rsp]
01d09 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01d11 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d16 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01d1e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01d23 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01d2b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d30 4c891424                       mov        qword ptr [rsp], r10
01d34 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01d39 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d3e 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01d43 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d48 c5f877                         vzeroupper 
01d4b e890cab5ff                     call       0x7f882b9c3660
01d50 0f1f8400481e002e               nop        dword ptr [rax + rax + 0x2e001e48]
01d58 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01d60 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01d68 bef6ffffff                     mov        esi, 0xfffffff6
01d6d 498beb                         mov        rbp, r11
01d70 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01d78 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01d80 c5f877                         vzeroupper 
01d83 e858cab5ff                     call       0x7f882b9c3660
01d88 0f1f8400801e002f               nop        dword ptr [rax + rax + 0x2f001e80]
01d90 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
01d95 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01d9d 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01da2 beccffffff                     mov        esi, 0xffffffcc
01da7 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01daf 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01db7 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
01dbf 48891c24                       mov        qword ptr [rsp], rbx
01dc3 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
01dc8 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01dcd 666690                         nop        
01dd0 c5f877                         vzeroupper 
01dd3 e808cab5ff                     call       0x7f882b9c3660
01dd8 0f1f8400d01e0030               nop        dword ptr [rax + rax + 0x30001ed0]
01de0 beccffffff                     mov        esi, 0xffffffcc
01de5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01ded 448b1c24                       mov        r11d, dword ptr [rsp]
01df1 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01df9 448b542404                     mov        r10d, dword ptr [rsp + 4]
01dfe 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01e06 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e0b 4c891424                       mov        qword ptr [rsp], r10
01e0f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e13 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01e18 c5f877                         vzeroupper 
01e1b e8c0c9b5ff                     call       0x7f882b9c3660
01e20 0f1f8400181f0031               nop        dword ptr [rax + rax + 0x31001f18]
01e28 beccffffff                     mov        esi, 0xffffffcc
01e2d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e35 448b1c24                       mov        r11d, dword ptr [rsp]
01e39 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01e41 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e46 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01e4e 448b542404                     mov        r10d, dword ptr [rsp + 4]
01e53 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01e5b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e60 4c891424                       mov        qword ptr [rsp], r10
01e64 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e69 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e6e 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01e72 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01e77 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e7c 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01e81 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e86 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01e8b 90                             nop        
01e8c c5f877                         vzeroupper 
01e8f e84cc9b5ff                     call       0x7f882b9c3660
01e94 0f1f84008c1f0032               nop        dword ptr [rax + rax + 0x32001f8c]
01e9c beccffffff                     mov        esi, 0xffffffcc
01ea1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01ea9 448b1424                       mov        r10d, dword ptr [rsp]
01ead 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01eb5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01eba 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ec2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01ec7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ecf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ed4 4c891424                       mov        qword ptr [rsp], r10
01ed8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01edd 4489542408                     mov        dword ptr [rsp + 8], r10d
01ee2 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01ee6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01eeb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ef0 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01ef5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01efa 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01eff 90                             nop        
01f00 c5f877                         vzeroupper 
01f03 e8d8c8b5ff                     call       0x7f882b9c3660
01f08 0f1f840000200033               nop        dword ptr [rax + rax + 0x33002000]
01f10 448b1424                       mov        r10d, dword ptr [rsp]
01f14 89742414                       mov        dword ptr [rsp + 0x14], esi
01f18 4533c0                         xor        r8d, r8d
01f1b e948feffff                     jmp        0x7f882be66be8
01f20 bef6ffffff                     mov        esi, 0xfffffff6
01f25 666690                         nop        
01f28 c5f877                         vzeroupper 
01f2b e8b0c8b5ff                     call       0x7f882b9c3660
01f30 0f1f840028200034               nop        dword ptr [rax + rax + 0x34002028]
01f38 eb14                           jmp        0x7f882be66dce
01f3a eb12                           jmp        0x7f882be66dce
01f3c eb10                           jmp        0x7f882be66dce
01f3e eb0e                           jmp        0x7f882be66dce
01f40 eb0c                           jmp        0x7f882be66dce
01f42 eb0a                           jmp        0x7f882be66dce
01f44 eb08                           jmp        0x7f882be66dce
01f46 eb06                           jmp        0x7f882be66dce
01f48 eb04                           jmp        0x7f882be66dce
01f4a eb02                           jmp        0x7f882be66dce
01f4c eb00                           jmp        0x7f882be66dce
01f4e 488bf0                         mov        rsi, rax
01f51 e90ae7ffff                     jmp        0x7f882be654e0
01f56 49ba315fe62b887f0000           movabs     r10, 0x7f882be65f31
01f60 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01f67 e9f470a9ff                     jmp        0x7f882b8fdee0
01f6c e8af3ca8ff                     call       0x7f882b8eaaa0
01f71 e9c8e0ffff                     jmp        0x7f882be64ebe
01f76 f4                             hlt        
01f77 f4                             hlt        
