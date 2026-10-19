00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854045a9ff                   jne        0x7fd3338fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85721f0000                   jne        0x7fd333e683b0
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bd7                         mov        r10d, edi
0004e 488bee                         mov        rbp, rsi
00051 8b7638                         mov        esi, dword ptr [rsi + 0x38]
00054 448b5d04                       mov        r11d, dword ptr [rbp + 4]
00058 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0005d 458bc3                         mov        r8d, r11d
00060 442bc6                         sub        r8d, esi
00063 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
0006b 453bd8                         cmp        r11d, r8d
0006e 0f8fd8160000                   jg         0x7fd333e67b4c
00074 488b4508                       mov        rax, qword ptr [rbp + 8]
00078 4c8b4d20                       mov        r9, qword ptr [rbp + 0x20]
0007c 4c638424e0000000               movsxd     r8, dword ptr [rsp + 0xe0]
00084 4c63de                         movsxd     r11, esi
00087 4c03d8                         add        r11, rax
0008a 4d2bcb                         sub        r9, r11
0008d 4d3bc1                         cmp        r8, r9
00090 0f8fb6160000                   jg         0x7fd333e67b4c
00096 4c8b7510                       mov        r14, qword ptr [rbp + 0x10]
0009a 4c8b6d28                       mov        r13, qword ptr [rbp + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f84cd100000                   je         0x7fd333e67574
000a7 33db                           xor        ebx, ebx
000a9 4c8bda                         mov        r11, rdx
000ac 8b5204                         mov        edx, dword ptr [rdx + 4]
000af 8b7d40                         mov        edi, dword ptr [rbp + 0x40]
000b2 458bc2                         mov        r8d, r10d
000b5 4585d2                         test       r10d, r10d
000b8 0f8e1e150000                   jle        0x7fd333e679dc
000be 89742414                       mov        dword ptr [rsp + 0x14], esi
000c2 4c2be8                         sub        r13, rax
000c5 448d4ae0                       lea        r9d, [rdx - 0x20]
000c9 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
000cd 83c1e0                         add        ecx, -0x20
000d0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d5 418b7204                       mov        esi, dword ptr [r10 + 4]
000d9 85f6                           test       esi, esi
000db 0f869f160000                   jbe        0x7fd333e67b80
000e1 894c2420                       mov        dword ptr [rsp + 0x20], ecx
000e5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000ea 897c2410                       mov        dword ptr [rsp + 0x10], edi
000ee 89542438                       mov        dword ptr [rsp + 0x38], edx
000f2 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f7 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000fc 4889442418                     mov        qword ptr [rsp + 0x18], rax
00101 4489442404                     mov        dword ptr [rsp + 4], r8d
00106 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0010e 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
00113 4c63d6                         movsxd     r10, esi
00116 4d63d8                         movsxd     r11, r8d
00119 49ffcb                         dec        r11
0011c 4d3bda                         cmp        r11, r10
0011f 0f833f160000                   jae        0x7fd333e67b64
00125 85db                           test       ebx, ebx
00127 0f8446160000                   je         0x7fd333e67b73
0012d 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00135 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00139 4585db                         test       r11d, r11d
0013c 0f868b160000                   jbe        0x7fd333e67bcd
00142 4183fb01                       cmp        r11d, 1
00146 0f8681160000                   jbe        0x7fd333e67bcd
0014c 4183fb02                       cmp        r11d, 2
00150 0f8677160000                   jbe        0x7fd333e67bcd
00156 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0015e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
00162 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00167 448b5f04                       mov        r11d, dword ptr [rdi + 4]
0016b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
00173 448d5af1                       lea        r11d, [rdx - 0xf]
00177 4585db                         test       r11d, r11d
0017a 0f8ca4160000                   jl         0x7fd333e67c24
00180 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00188 4183c2f1                       add        r10d, -0xf
0018c 4585d2                         test       r10d, r10d
0018f 0f8c96160000                   jl         0x7fd333e67c2b
00195 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
0019d 4183c3f9                       add        r11d, -7
001a1 4585db                         test       r11d, r11d
001a4 0f8c88160000                   jl         0x7fd333e67c32
001aa 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
001b2 4489542440                     mov        dword ptr [rsp + 0x40], r10d
001b7 4c8bd7                         mov        r10, rdi
001ba 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001bf 4c63542440                     movsxd     r10, dword ptr [rsp + 0x40]
001c4 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001cc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
001d1 4183c3f1                       add        r11d, -0xf
001d5 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
001da 4983c2f1                       add        r10, -0xf
001de 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001e6 448bd2                         mov        r10d, edx
001e9 458d5af1                       lea        r11d, [r10 - 0xf]
001ed 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
001f2 4d63d2                         movsxd     r10, r10d
001f5 4983c2f1                       add        r10, -0xf
001f9 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00201 4533d2                         xor        r10d, r10d
00204 33db                           xor        ebx, ebx
00206 e9d1010000                     jmp        0x7fd333e667dc
0020b 4533db                         xor        r11d, r11d
0020e 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00213 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00218 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
0021c 448bdf                         mov        r11d, edi
0021f 4183fb03                       cmp        r11d, 3
00223 0f8e68030000                   jle        0x7fd333e66991
00229 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0022e 45894b10                       mov        dword ptr [r11 + 0x10], r9d
00232 458b4308                       mov        r8d, dword ptr [r11 + 8]
00236 4589430c                       mov        dword ptr [r11 + 0xc], r8d
0023a 448d5ffd                       lea        r11d, [rdi - 3]
0023e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00243 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00248 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0024d 45894308                       mov        dword ptr [r11 + 8], r8d
00251 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00259 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
0025e 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00263 4c03542418                     add        r10, qword ptr [rsp + 0x18]
00268 4c63442428                     movsxd     r8, dword ptr [rsp + 0x28]
0026d 4d8bc8                         mov        r9, r8
00270 4d03d0                         add        r10, r8
00273 4d3bda                         cmp        r11, r10
00276 0f8f28120000                   jg         0x7fd333e678a4
0027c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00281 4585db                         test       r11d, r11d
00284 0f8e76110000                   jle        0x7fd333e67800
0028a 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0028f 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
00294 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00299 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0029e 4b8d740208                     lea        rsi, [r10 + r8 + 8]
002a3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
002a8 4503d5                         add        r10d, r13d
002ab 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
002b3 498d7c1b08                     lea        rdi, [r11 + rbx + 8]
002b8 448bdb                         mov        r11d, ebx
002bb 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
002c0 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
002c8 48636c242c                     movsxd     rbp, dword ptr [rsp + 0x2c]
002cd 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
002d2 0f8f0e0b0000                   jg         0x7fd333e671e6
002d8 443b5c2424                     cmp        r11d, dword ptr [rsp + 0x24]
002dd 0f8f15120000                   jg         0x7fd333e678f8
002e3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
002e8 4183fa10                       cmp        r10d, 0x10
002ec 0f8f6a010000                   jg         0x7fd333e6685c
002f2 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002f6 0f8360100000                   jae        0x7fd333e6775c
002fc 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00304 c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
0030b 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00310 0f838a100000                   jae        0x7fd333e677a0
00316 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0031b 4403d3                         add        r10d, ebx
0031e 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00326 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0032b c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00332 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00337 4503d0                         add        r10d, r8d
0033a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0033f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00344 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00349 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00351 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00356 4183fb10                       cmp        r11d, 0x10
0035a 0f8f10120000                   jg         0x7fd333e67970
00360 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00365 4183fa10                       cmp        r10d, 0x10
00369 0f8c21030000                   jl         0x7fd333e66a90
0036f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00377 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
0037c 0f83300f0000                   jae        0x7fd333e676b2
00382 458bd3                         mov        r10d, r11d
00385 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0038a c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00391 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00396 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
0039b 0f835f0f0000                   jae        0x7fd333e67700
003a1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
003a6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
003ab c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003b2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
003b7 4503d0                         add        r10d, r8d
003ba 4489542414                     mov        dword ptr [rsp + 0x14], r10d
003bf 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
003c7 41ffc2                         inc        r10d
003ca 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003cf 0f8d6f0c0000                   jge        0x7fd333e67444
003d5 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
003dc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003e1 4f8b4cd308                     mov        r9, qword ptr [r11 + r10*8 + 8]
003e6 4d8bd9                         mov        r11, r9
003e9 49c1eb12                       shr        r11, 0x12
003ed 458bdb                         mov        r11d, r11d
003f0 4181e3ffff0300                 and        r11d, 0x3ffff
003f7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
003fc 458bc1                         mov        r8d, r9d
003ff 49c1f924                       sar        r9, 0x24
00403 4181e0ffff0100                 and        r8d, 0x1ffff
0040a 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0040f 458bd9                         mov        r11d, r9d
00412 418bfb                         mov        edi, r11d
00415 4585db                         test       r11d, r11d
00418 0f8c02100000                   jl         0x7fd333e67820
0041e 4585c0                         test       r8d, r8d
00421 0f84e4fdffff                   je         0x7fd333e6660b
00427 448b0424                       mov        r8d, dword ptr [rsp]
0042b 442bc3                         sub        r8d, ebx
0042e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00433 453bd8                         cmp        r11d, r8d
00436 0f8ed7fdffff                   jle        0x7fd333e66613
0043c be45ffffff                     mov        esi, 0xffffff45
00441 418beb                         mov        ebp, r11d
00444 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0044c c5f877                         vzeroupper 
0044f e80cceb5ff                     call       0x7fd3339c3660
00454 0f1f84004c050000               nop        dword ptr [rax + rax + 0x54c]
0045c 4183fa30                       cmp        r10d, 0x30
00460 0f8f77070000                   jg         0x7fd333e66fdd
00466 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0046a 0f8387110000                   jae        0x7fd333e679f7
00470 4c63cb                         movsxd     r9, ebx
00473 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0047b c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00482 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
00487 0f83bb110000                   jae        0x7fd333e67a48
0048d 458d5810                       lea        r11d, [r8 + 0x10]
00491 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00499 4963c8                         movsxd     rcx, r8d
0049c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
004a1 c4c17a7f440a08                 vmovdqu    xmmword ptr [r10 + rcx + 8], xmm0
004a8 453bdd                         cmp        r11d, r13d
004ab 0f8dc6000000                   jge        0x7fd333e66977
004b1 4c2bc9                         sub        r9, rcx
004b4 4d63db                         movsxd     r11, r11d
004b7 4f8d140b                       lea        r10, [r11 + r9]
004bb 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004c3 0f83f3110000                   jae        0x7fd333e67abc
004c9 4d63d5                         movsxd     r10, r13d
004cc 4d2bd3                         sub        r10, r11
004cf 4983c20f                       add        r10, 0xf
004d3 4983e2f0                       and        r10, 0xfffffffffffffff0
004d7 458bda                         mov        r11d, r10d
004da 478d540310                     lea        r10d, [r11 + r8 + 0x10]
004df 4d63d2                         movsxd     r10, r10d
004e2 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004e7 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
004ef 0f83c7110000                   jae        0x7fd333e67abc
004f5 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
004fd 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00502 0f83b4110000                   jae        0x7fd333e67abc
00508 4983c2f0                       add        r10, -0x10
0050c 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
00514 0f83a2110000                   jae        0x7fd333e67abc
0051a 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00521 0f8fdd110000                   jg         0x7fd333e67b04
00527 448bd3                         mov        r10d, ebx
0052a 452bd0                         sub        r10d, r8d
0052d 666690                         nop        
00530 458bc2                         mov        r8d, r10d
00533 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0053b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00543 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0054a 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00552 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00557 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
0055e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00566 4183c310                       add        r11d, 0x10
0056a 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00572 453bdd                         cmp        r11d, r13d
00575 7cb9                           jl         0x7fd333e66930
00577 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0057c 4403d3                         add        r10d, ebx
0057f 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00587 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0058c e9aefdffff                     jmp        0x7fd333e6673f
00591 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00596 4585c0                         test       r8d, r8d
00599 7406                           je         0x7fd333e669a1
0059b 41ffcb                         dec        r11d
0059e 418bfb                         mov        edi, r11d
005a1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005a6 458b5b08                       mov        r11d, dword ptr [r11 + 8]
005aa 85ff                           test       edi, edi
005ac 0f8497070000                   je         0x7fd333e67149
005b2 83ff03                         cmp        edi, 3
005b5 0f844a0b0000                   je         0x7fd333e67505
005bb 83ff02                         cmp        edi, 2
005be 0f878a000000                   ja         0x7fd333e66a4e
005c4 3bbc24e8000000                 cmp        edi, dword ptr [rsp + 0xe8]
005cb 0f8368120000                   jae        0x7fd333e67c39
005d1 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005d6 458b5cb808                     mov        r11d, dword ptr [r8 + rdi*4 + 8]
005db 85ff                           test       edi, edi
005dd 7e54                           jle        0x7fd333e66a33
005df 448d4fff                       lea        r9d, [rdi - 1]
005e3 443b8c24e8000000               cmp        r9d, dword ptr [rsp + 0xe8]
005eb 0f833b140000                   jae        0x7fd333e67e2c
005f1 4863cf                         movsxd     rcx, edi
005f4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005f9 458bc0                         mov        r8d, r8d
005fc 4183c0cc                       add        r8d, -0x34
00600 41c1e802                       shr        r8d, 2
00604 458d4c38ff                     lea        r9d, [r8 + rdi - 1]
00609 41b804000000                   mov        r8d, 4
0060f c442b8f5c1                     bzhi       r8, r9, r8
00614 492bc8                         sub        rcx, r8
00617 48ffc9                         dec        rcx
0061a 4533c0                         xor        r8d, r8d
0061d 4885c9                         test       rcx, rcx
00620 490f4cc8                       cmovl      rcx, r8
00624 8bc9                           mov        ecx, ecx
00626 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0062e e918060000                     jmp        0x7fd333e6704b
00633 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0063b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00640 45895a08                       mov        dword ptr [r10 + 8], r11d
00644 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00649 e90bfcffff                     jmp        0x7fd333e66659
0064e 48bee82374e200000000           movabs     rsi, 0xe27423e8
00658 8beb                           mov        ebp, ebx
0065a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00662 6690                           nop        
00664 c5f877                         vzeroupper 
00667 e8f44da9ff                     call       0x7fd3338fb860
0066c 0f1f840064070001               nop        dword ptr [rax + rax + 0x1000764]
00674 4885c0                         test       rax, rax
00677 0f8443120000                   je         0x7fd333e67cc0
0067d 488bf0                         mov        rsi, rax
00680 c5f877                         vzeroupper 
00683 4881c4d0000000                 add        rsp, 0xd0
0068a 5d                             pop        rbp
0068b e9502ab6ff                     jmp        0x7fd3339c94e0
00690 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
00695 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0069a 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
0069f 0f8d7b020000                   jge        0x7fd333e66d20
006a5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
006aa 4183c208                       add        r10d, 8
006ae 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
006b6 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006bb 4183fb08                       cmp        r11d, 8
006bf 0f8d88010000                   jge        0x7fd333e66c4d
006c5 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
006cd 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
006d5 0f8329150000                   jae        0x7fd333e68004
006db 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006e0 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
006e6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
006eb 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
006f3 0f8383150000                   jae        0x7fd333e6807c
006f9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006fe 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00703 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0070b 4183c303                       add        r11d, 3
0070f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00714 41ffc2                         inc        r10d
00717 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0071f 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00727 0f8387150000                   jae        0x7fd333e680b4
0072d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00732 4183c303                       add        r11d, 3
00736 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
0073e 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00743 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
00749 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00751 0f83a9150000                   jae        0x7fd333e68100
00757 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
0075c 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00761 470fbe44110a                   movsx      r8d, byte ptr [r9 + r10 + 0xa]
00767 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
0076c 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
00772 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
00777 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0077c 4183fb08                       cmp        r11d, 8
00780 0f83be150000                   jae        0x7fd333e68144
00786 49ba285d72e200000000           movabs     r10, 0xe2725d28
00790 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00798 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
0079d 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
007a2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007a7 4183fa04                       cmp        r10d, 4
007ab 7e3b                           jle        0x7fd333e66be8
007ad 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
007b1 83c504                         add        ebp, 4
007b4 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007b9 418bd1                         mov        edx, r9d
007bc c5f877                         vzeroupper 
007bf e89c4ca9ff                     call       0x7fd3338fb860
007c4 0f1f8400bc080002               nop        dword ptr [rax + rax + 0x20008bc]
007cc 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007d1 8bd5                           mov        edx, ebp
007d3 8bc8                           mov        ecx, eax
007d5 666690                         nop        
007d8 c5f877                         vzeroupper 
007db e8804ca9ff                     call       0x7fd3338fb860
007e0 0f1f8400d8080003               nop        dword ptr [rax + rax + 0x30008d8]
007e8 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007ed 4183fa08                       cmp        r10d, 8
007f1 0f8ec8fbffff                   jle        0x7fd333e667bf
007f7 49ba505d72e200000000           movabs     r10, 0xe2725d50
00801 8b542428                       mov        edx, dword ptr [rsp + 0x28]
00805 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0080a 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
0080f 83c208                         add        edx, 8
00812 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00817 90                             nop        
00818 c5f877                         vzeroupper 
0081b e8404ca9ff                     call       0x7fd3338fb860
00820 0f1f840018090004               nop        dword ptr [rax + rax + 0x4000918]
00828 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0082d 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00834 488bc8                         mov        rcx, rax
00837 90                             nop        
00838 c5f877                         vzeroupper 
0083b e8204ca9ff                     call       0x7fd3338fb860
00840 0f1f840038090005               nop        dword ptr [rax + rax + 0x5000938]
00848 e972fbffff                     jmp        0x7fd333e667bf
0084d 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00852 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00859 666690                         nop        
0085c c5f877                         vzeroupper 
0085f e8fc4ba9ff                     call       0x7fd3338fb860
00864 0f1f84005c090006               nop        dword ptr [rax + rax + 0x600095c]
0086c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00871 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00875 488bc8                         mov        rcx, rax
00878 c5f877                         vzeroupper 
0087b e8e04ba9ff                     call       0x7fd3338fb860
00880 0f1f840078090007               nop        dword ptr [rax + rax + 0x7000978]
00888 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00890 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00895 0f8d24fbffff                   jge        0x7fd333e667bf
0089b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
008a0 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
008a7 0f8ebb040000                   jle        0x7fd333e67168
008ad 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
008b5 4183c008                       add        r8d, 8
008b9 be66ffffff                     mov        esi, 0xffffff66
008be 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
008c6 448b1424                       mov        r10d, dword ptr [rsp]
008ca 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
008d2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
008d7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
008df 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
008e4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
008ec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
008f1 4489542408                     mov        dword ptr [rsp + 8], r10d
008f6 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
008fb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00900 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
00905 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0090a 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0090f 90                             nop        
00910 c5f877                         vzeroupper 
00913 e848c9b5ff                     call       0x7fd3339c3660
00918 0f1f8400100a0008               nop        dword ptr [rax + rax + 0x8000a10]
00920 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00925 4183fb30                       cmp        r11d, 0x30
00929 0f8fef010000                   jg         0x7fd333e66f1e
0092f 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00933 83c5f9                         add        ebp, -7
00936 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
0093a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00942 443bd5                         cmp        r10d, ebp
00945 0f83d10f0000                   jae        0x7fd333e67d1c
0094b 418bea                         mov        ebp, r10d
0094e 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
00955 4863ed                         movsxd     rbp, ebp
00958 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00960 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00965 498b6c2b08                     mov        rbp, qword ptr [r11 + rbp + 8]
0096a 4889ac24a8000000               mov        qword ptr [rsp + 0xa8], rbp
00972 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00977 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0097c 0f83fe0f0000                   jae        0x7fd333e67d80
00982 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0098a 4963ea                         movsxd     rbp, r10d
0098d 4889ac24b8000000               mov        qword ptr [rsp + 0xb8], rbp
00995 488d4d08                       lea        rcx, [rbp + 8]
00999 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
009a3 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
009a8 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
009b0 4533c9                         xor        r9d, r9d
009b3 90                             nop        
009b4 c5f877                         vzeroupper 
009b7 e8a440a9ff                     call       0x7fd3338fae60
009bc 0f1f8400b40a0009               nop        dword ptr [rax + rax + 0x9000ab4]
009c4 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
009cc 4183c308                       add        r11d, 8
009d0 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
009d8 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
009dd 0f8d27010000                   jge        0x7fd333e66f0a
009e3 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
009eb 482bac24b8000000               sub        rbp, qword ptr [rsp + 0xb8]
009f3 4d63db                         movsxd     r11, r11d
009f6 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
009fe 4983c1f9                       add        r9, -7
00a02 4d8d142b                       lea        r10, [r11 + rbp]
00a06 4d3bd1                         cmp        r10, r9
00a09 0f83a5100000                   jae        0x7fd333e67eb4
00a0f 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00a14 4d2bd3                         sub        r10, r11
00a17 4983c207                       add        r10, 7
00a1b 4983e2f8                       and        r10, 0xfffffffffffffff8
00a1f 458bd2                         mov        r10d, r10d
00a22 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00a2a 478d5c0208                     lea        r11d, [r10 + r8 + 8]
00a2f 4d63db                         movsxd     r11, r11d
00a32 4d8d542bf8                     lea        r10, [r11 + rbp - 8]
00a37 4d3bd1                         cmp        r10, r9
00a3a 0f8374100000                   jae        0x7fd333e67eb4
00a40 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a48 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00a4d 0f8361100000                   jae        0x7fd333e67eb4
00a53 4983c3f8                       add        r11, -8
00a57 4d3bd9                         cmp        r11, r9
00a5a 0f8354100000                   jae        0x7fd333e67eb4
00a60 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00a65 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a6c 0f8fca100000                   jg         0x7fd333e67f3c
00a72 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00a79 412be8                         sub        ebp, r8d
00a7c 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00a80 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00a88 4963cb                         movsxd     rcx, r11d
00a8b 4883c108                       add        rcx, 8
00a8f 8b6c2428                       mov        ebp, dword ptr [rsp + 0x28]
00a93 03ac24a8000000                 add        ebp, dword ptr [rsp + 0xa8]
00a9a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a9f 4d8b442b08                     mov        r8, qword ptr [r11 + rbp + 8]
00aa4 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00aae 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00ab3 4533c9                         xor        r9d, r9d
00ab6 6690                           nop        
00ab8 c5f877                         vzeroupper 
00abb e8a03fa9ff                     call       0x7fd3338fae60
00ac0 0f1f8400b80b000a               nop        dword ptr [rax + rax + 0xa000bb8]
00ac8 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00ad0 4183c208                       add        r10d, 8
00ad4 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00adc 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00ae1 7c9d                           jl         0x7fd333e66e80
00ae3 eb25                           jmp        0x7fd333e66f0a
00ae5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00aea 4d63d2                         movsxd     r10, r10d
00aed 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00af4 c442a8f5db                     bzhi       r11, r11, r10
00af9 c4c1fb92fb                     kmovq      k7, r11
00afe 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b04 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b0a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b0f 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00b14 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00b19 e9a1f8ffff                     jmp        0x7fd333e667bf
00b1e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b26 4585d2                         test       r10d, r10d
00b29 0f8c9d0e0000                   jl         0x7fd333e67dcc
00b2f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b34 4585db                         test       r11d, r11d
00b37 0f8c8f0e0000                   jl         0x7fd333e67dcc
00b3d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b42 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
00b4a 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00b52 453bda                         cmp        r11d, r10d
00b55 0f82710e0000                   jb         0x7fd333e67dcc
00b5b 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00b60 0f82660e0000                   jb         0x7fd333e67dcc
00b66 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b6b 4585d2                         test       r10d, r10d
00b6e 749a                           je         0x7fd333e66f0a
00b70 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b75 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b7a 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00b7f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b87 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00b8c 4883fd20                       cmp        rbp, 0x20
00b90 0f864fffffff                   jbe        0x7fd333e66ee5
00b96 488bd5                         mov        rdx, rbp
00b99 c5f877                         vzeroupper 
00b9c 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00ba6 41ffd2                         call       r10
00ba9 0f1f840000000000               nop        dword ptr [rax + rax]
00bb1 e954ffffff                     jmp        0x7fd333e66f0a
00bb6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bbb 4d63d2                         movsxd     r10, r10d
00bbe 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bc5 c442a8f5db                     bzhi       r11, r11, r10
00bca c4c1fb92fb                     kmovq      k7, r11
00bcf 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bd5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bdb eb60                           jmp        0x7fd333e6703d
00bdd 85db                           test       ebx, ebx
00bdf 0f8cf30c0000                   jl         0x7fd333e67cd8
00be5 4585c0                         test       r8d, r8d
00be8 0f8cea0c0000                   jl         0x7fd333e67cd8
00bee 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00bf3 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00bfb 0f82d70c0000                   jb         0x7fd333e67cd8
00c01 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00c09 453bd5                         cmp        r10d, r13d
00c0c 0f82c60c0000                   jb         0x7fd333e67cd8
00c12 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c17 4585db                         test       r11d, r11d
00c1a 7421                           je         0x7fd333e6703d
00c1c 4983f920                       cmp        r9, 0x20
00c20 7694                           jbe        0x7fd333e66fb6
00c22 498bd1                         mov        rdx, r9
00c25 c5f877                         vzeroupper 
00c28 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00c32 41ffd2                         call       r10
00c35 0f1f840000000000               nop        dword ptr [rax + rax]
00c3d 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00c42 e9f8f6ffff                     jmp        0x7fd333e6673f
00c47 90                             nop        
00c48 418bfa                         mov        edi, r10d
00c4b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c50 458b44b804                     mov        r8d, dword ptr [r8 + rdi*4 + 4]
00c55 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00c5a 458944b908                     mov        dword ptr [r9 + rdi*4 + 8], r8d
00c5f 448d57ff                       lea        r10d, [rdi - 1]
00c63 443bd1                         cmp        r10d, ecx
00c66 7fe0                           jg         0x7fd333e67048
00c68 4183fa3f                       cmp        r10d, 0x3f
00c6c 0f8e3a0e0000                   jle        0x7fd333e67eac
00c72 448bd7                         mov        r10d, edi
00c75 41ffca                         dec        r10d
00c78 eb09                           jmp        0x7fd333e67083
00c7a 660f1f440000                   nop        word ptr [rax + rax]
00c80 458bd0                         mov        r10d, r8d
00c83 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c88 62917e486f8490c8ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x38]
00c93 62917e487f8490ccffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x34], zmm0
00c9e 62917e486f849088ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0x78]
00ca9 62917e487f84908cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0x74], zmm0
00cb4 62917e486f849048ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xb8]
00cbf 62917e487f84904cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xb4], zmm0
00cca 62917e486f849008ffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r10*4 - 0xf8]
00cd5 62917e487f84900cffffff         vmovdqu32  zmmword ptr [r8 + r10*4 - 0xf4], zmm0
00ce0 458d42c0                       lea        r8d, [r10 - 0x40]
00ce4 4183f83f                       cmp        r8d, 0x3f
00ce8 7f96                           jg         0x7fd333e67080
00cea 4183f80f                       cmp        r8d, 0xf
00cee 7e2d                           jle        0x7fd333e6711d
00cf0 458bc2                         mov        r8d, r10d
00cf3 4183c0c0                       add        r8d, -0x40
00cf7 90                             nop        
00cf8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00cfd 62917e486f8482c8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r8*4 - 0x38]
00d08 62917e487f8482ccffffff         vmovdqu32  zmmword ptr [r10 + r8*4 - 0x34], zmm0
00d13 4183c0f0                       add        r8d, -0x10
00d17 4183f80f                       cmp        r8d, 0xf
00d1b 7fdb                           jg         0x7fd333e670f8
00d1d 4585c0                         test       r8d, r8d
00d20 0f8e15f9ffff                   jle        0x7fd333e66a3b
00d26 6690                           nop        
00d28 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d2d 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00d32 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00d37 4789548108                     mov        dword ptr [r9 + r8*4 + 8], r10d
00d3c 41ffc8                         dec        r8d
00d3f 4585c0                         test       r8d, r8d
00d42 7fe4                           jg         0x7fd333e67128
00d44 e9f2f8ffff                     jmp        0x7fd333e66a3b
00d49 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00d51 e9eef8ffff                     jmp        0x7fd333e66a44
00d56 66660f1f840000000000           nop        word ptr [rax + rax]
00d60 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00d68 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00d6f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00d73 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d78 8bd5                           mov        edx, ebp
00d7a 6690                           nop        
00d7c c5f877                         vzeroupper 
00d7f e8dc46a9ff                     call       0x7fd3338fb860
00d84 0f1f84007c0e000b               nop        dword ptr [rax + rax + 0xb000e7c]
00d8c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00d91 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00d98 488bc8                         mov        rcx, rax
00d9b 90                             nop        
00d9c c5f877                         vzeroupper 
00d9f e8bc46a9ff                     call       0x7fd3338fb860
00da4 0f1f84009c0e000c               nop        dword ptr [rax + rax + 0xc000e9c]
00dac 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00db4 4183c308                       add        r11d, 8
00db8 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00dbd 7ca1                           jl         0x7fd333e67160
00dbf e9fbf5ffff                     jmp        0x7fd333e667bf
00dc4 4d63d2                         movsxd     r10, r10d
00dc7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dce c442a8f5db                     bzhi       r11, r11, r10
00dd3 c4c1fb92fb                     kmovq      k7, r11
00dd8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dde 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de4 eb6e                           jmp        0x7fd333e67254
00de6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00deb 4585db                         test       r11d, r11d
00dee 0f84b4040000                   je         0x7fd333e676a8
00df4 85db                           test       ebx, ebx
00df6 0f8c28100000                   jl         0x7fd333e68224
00dfc 4585c0                         test       r8d, r8d
00dff 0f8c1f100000                   jl         0x7fd333e68224
00e05 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e0a 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00e12 0f820c100000                   jb         0x7fd333e68224
00e18 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00e20 453bdd                         cmp        r11d, r13d
00e23 0f82fb0f0000                   jb         0x7fd333e68224
00e29 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e2e 4585d2                         test       r10d, r10d
00e31 7421                           je         0x7fd333e67254
00e33 4983f920                       cmp        r9, 0x20
00e37 768b                           jbe        0x7fd333e671c4
00e39 498bd1                         mov        rdx, r9
00e3c c5f877                         vzeroupper 
00e3f 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00e49 41ffd2                         call       r10
00e4c 0f1f840000000000               nop        dword ptr [rax + rax]
00e54 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e59 4585db                         test       r11d, r11d
00e5c 0f8eb3010000                   jle        0x7fd333e67415
00e62 458bd5                         mov        r10d, r13d
00e65 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00e6a 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00e72 458bdd                         mov        r11d, r13d
00e75 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00e7a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00e7f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e84 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00e89 4b8d742b08                     lea        rsi, [r11 + r13 + 8]
00e8e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00e93 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00e98 0f8dd8000000                   jge        0x7fd333e67376
00e9e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00ea3 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00ea8 458bd3                         mov        r10d, r11d
00eab 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00eb0 450f4fd0                       cmovg      r10d, r8d
00eb4 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00eb9 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00ec1 4585d2                         test       r10d, r10d
00ec4 0f8ca20f0000                   jl         0x7fd333e6826c
00eca 4585ed                         test       r13d, r13d
00ecd 0f8c990f0000                   jl         0x7fd333e6826c
00ed3 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00ed8 4503da                         add        r11d, r10d
00edb 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00ee3 453bc3                         cmp        r8d, r11d
00ee6 0f82800f0000                   jb         0x7fd333e6826c
00eec 458bd5                         mov        r10d, r13d
00eef 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00ef4 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00efc 458bd8                         mov        r11d, r8d
00eff 453bda                         cmp        r11d, r10d
00f02 0f82640f0000                   jb         0x7fd333e6826c
00f08 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f0d 4585d2                         test       r10d, r10d
00f10 0f8c560f0000                   jl         0x7fd333e6826c
00f16 4585d2                         test       r10d, r10d
00f19 742c                           je         0x7fd333e67347
00f1b 4963d2                         movsxd     rdx, r10d
00f1e 4883fa20                       cmp        rdx, 0x20
00f22 7738                           ja         0x7fd333e6735c
00f24 458bda                         mov        r11d, r10d
00f27 4d63d3                         movsxd     r10, r11d
00f2a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f31 c442a8f5db                     bzhi       r11, r11, r10
00f36 c4c1fb92fb                     kmovq      k7, r11
00f3b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f41 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f47 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f4c 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00f51 0f8d68f4ffff                   jge        0x7fd333e667bf
00f57 e97f020000                     jmp        0x7fd333e675db
00f5c c5f877                         vzeroupper 
00f5f 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00f69 41ffd2                         call       r10
00f6c 0f1f840000000000               nop        dword ptr [rax + rax]
00f74 ebd1                           jmp        0x7fd333e67347
00f76 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f7e 4585db                         test       r11d, r11d
00f81 0f8c590f0000                   jl         0x7fd333e682e0
00f87 4585ed                         test       r13d, r13d
00f8a 0f8c500f0000                   jl         0x7fd333e682e0
00f90 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f95 4503d3                         add        r10d, r11d
00f98 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00fa0 453bda                         cmp        r11d, r10d
00fa3 0f82370f0000                   jb         0x7fd333e682e0
00fa9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00fae 453bda                         cmp        r11d, r10d
00fb1 0f82290f0000                   jb         0x7fd333e682e0
00fb7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00fbc 4585d2                         test       r10d, r10d
00fbf 0f84faf3ffff                   je         0x7fd333e667bf
00fc5 4883fd20                       cmp        rbp, 0x20
00fc9 772a                           ja         0x7fd333e673f5
00fcb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fd0 4d63d3                         movsxd     r10, r11d
00fd3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fda c442a8f5db                     bzhi       r11, r11, r10
00fdf c4c1fb92fb                     kmovq      k7, r11
00fe4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00fea 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ff0 e9caf3ffff                     jmp        0x7fd333e667bf
00ff5 488bd5                         mov        rdx, rbp
00ff8 c5f877                         vzeroupper 
00ffb 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
01005 41ffd2                         call       r10
01008 0f1f840000000000               nop        dword ptr [rax + rax]
01010 e9aaf3ffff                     jmp        0x7fd333e667bf
01015 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0101a e9a0f3ffff                     jmp        0x7fd333e667bf
0101f 4d63d2                         movsxd     r10, r10d
01022 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01029 c442a8f5db                     bzhi       r11, r11, r10
0102e c4c1fb92fb                     kmovq      k7, r11
01033 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01039 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0103f e9a8000000                     jmp        0x7fd333e674ec
01044 448b1c24                       mov        r11d, dword ptr [rsp]
01048 458bd3                         mov        r10d, r11d
0104b 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
01053 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01058 4585db                         test       r11d, r11d
0105b 0f84430d0000                   je         0x7fd333e681a4
01061 498bcb                         mov        rcx, r11
01064 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
0106c 4585c0                         test       r8d, r8d
0106f 0f8c670d0000                   jl         0x7fd333e681dc
01075 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
0107a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01082 8b542438                       mov        edx, dword ptr [rsp + 0x38]
01086 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0108b 4585c9                         test       r9d, r9d
0108e 0f8c5a0d0000                   jl         0x7fd333e681ee
01094 3b1424                         cmp        edx, dword ptr [rsp]
01097 0f82510d0000                   jb         0x7fd333e681ee
0109d 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
010a1 4103da                         add        ebx, r10d
010a4 8b5104                         mov        edx, dword ptr [rcx + 4]
010a7 3bd3                           cmp        edx, ebx
010a9 0f823f0d0000                   jb         0x7fd333e681ee
010af 4585d2                         test       r10d, r10d
010b2 0f8c360d0000                   jl         0x7fd333e681ee
010b8 4585d2                         test       r10d, r10d
010bb 742f                           je         0x7fd333e674ec
010bd 4a8d740908                     lea        rsi, [rcx + r9 + 8]
010c2 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
010c7 4963d2                         movsxd     rdx, r10d
010ca 4883fa20                       cmp        rdx, 0x20
010ce 0f864bffffff                   jbe        0x7fd333e6741f
010d4 c5f877                         vzeroupper 
010d7 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
010e1 41ffd2                         call       r10
010e4 0f1f840000000000               nop        dword ptr [rax + rax]
010ec 895d38                         mov        dword ptr [rbp + 0x38], ebx
010ef c5f877                         vzeroupper 
010f2 4881c4d0000000                 add        rsp, 0xd0
010f9 5d                             pop        rbp
010fa 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
010fe 0f87960e0000                   ja         0x7fd333e6839a
01104 c3                             ret        
01105 41ffcb                         dec        r11d
01108 4585db                         test       r11d, r11d
0110b 7e22                           jle        0x7fd333e6752f
0110d 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01112 45894810                       mov        dword ptr [r8 + 0x10], r9d
01116 458b4808                       mov        r9d, dword ptr [r8 + 8]
0111a 4589480c                       mov        dword ptr [r8 + 0xc], r9d
0111e 45895808                       mov        dword ptr [r8 + 8], r11d
01122 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0112a e915f5ffff                     jmp        0x7fd333e66a44
0112f 48beb82374e200000000           movabs     rsi, 0xe27423b8
01139 8beb                           mov        ebp, ebx
0113b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01143 90                             nop        
01144 c5f877                         vzeroupper 
01147 e81443a9ff                     call       0x7fd3338fb860
0114c 0f1f84004412000d               nop        dword ptr [rax + rax + 0xd001244]
01154 4885c0                         test       rax, rax
01157 0f8520f5ffff                   jne        0x7fd333e66a7d
0115d bef6ffffff                     mov        esi, 0xfffffff6
01162 6690                           nop        
01164 c5f877                         vzeroupper 
01167 e8f4c0b5ff                     call       0x7fd3339c3660
0116c 0f1f84006412000e               nop        dword ptr [rax + rax + 0xe001264]
01174 4d03d8                         add        r11, r8
01177 4d3bde                         cmp        r11, r14
0117a 7e08                           jle        0x7fd333e67584
0117c 4533ed                         xor        r13d, r13d
0117f e923efffff                     jmp        0x7fd333e664a7
01184 4533ed                         xor        r13d, r13d
01187 bb01000000                     mov        ebx, 1
0118c e918efffff                     jmp        0x7fd333e664a9
01191 448bdd                         mov        r11d, ebp
01194 4d63d3                         movsxd     r10, r11d
01197 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0119e c442a8f5db                     bzhi       r11, r11, r10
011a3 c4c1fb92fb                     kmovq      k7, r11
011a8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
011ae 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
011b4 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
011b9 4403dd                         add        r11d, ebp
011bc 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011c1 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
011c5 418502                         test       dword ptr [r10], eax
011c8 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
011cd 0f8decf1ffff                   jge        0x7fd333e667bf
011d3 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
011db 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
011e3 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
011e8 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
011f0 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
011f4 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
011f8 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
011fc 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01201 410f4fea                       cmovg      ebp, r10d
01205 4585db                         test       r11d, r11d
01208 0f8cb6090000                   jl         0x7fd333e67fc4
0120e 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01216 4585d2                         test       r10d, r10d
01219 0f8ca5090000                   jl         0x7fd333e67fc4
0121f 448bdd                         mov        r11d, ebp
01222 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
0122a 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
01232 453bc3                         cmp        r8d, r11d
01235 0f8289090000                   jb         0x7fd333e67fc4
0123b 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
01243 4403f5                         add        r14d, ebp
01246 453bc6                         cmp        r8d, r14d
01249 0f8275090000                   jb         0x7fd333e67fc4
0124f 85ed                           test       ebp, ebp
01251 0f8c6d090000                   jl         0x7fd333e67fc4
01257 85ed                           test       ebp, ebp
01259 0f8455ffffff                   je         0x7fd333e675b4
0125f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01264 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0126c 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
01271 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01279 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0127e 4863d5                         movsxd     rdx, ebp
01281 4883fa20                       cmp        rdx, 0x20
01285 0f8606ffffff                   jbe        0x7fd333e67591
0128b c5f877                         vzeroupper 
0128e 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
01298 41ffd2                         call       r10
0129b 0f1f840000000000               nop        dword ptr [rax + rax]
012a3 e90cffffff                     jmp        0x7fd333e675b4
012a8 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
012ad e9a2fbffff                     jmp        0x7fd333e67254
012b2 bee4ffffff                     mov        esi, 0xffffffe4
012b7 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
012bf 448b1424                       mov        r10d, dword ptr [rsp]
012c3 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
012cb 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012d0 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
012d8 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
012dd 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
012e5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012ea 4c891424                       mov        qword ptr [rsp], r10
012ee 6690                           nop        
012f0 c5f877                         vzeroupper 
012f3 e868bfb5ff                     call       0x7fd3339c3660
012f8 0f1f8400f0130010               nop        dword ptr [rax + rax + 0x100013f0]
01300 bee4ffffff                     mov        esi, 0xffffffe4
01305 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0130d 448b1424                       mov        r10d, dword ptr [rsp]
01311 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01319 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0131e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01326 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0132b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01333 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01338 4c891424                       mov        qword ptr [rsp], r10
0133c 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01341 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01346 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0134c c5f877                         vzeroupper 
0134f e80cbfb5ff                     call       0x7fd3339c3660
01354 0f1f84004c140011               nop        dword ptr [rax + rax + 0x1100144c]
0135c bee4ffffff                     mov        esi, 0xffffffe4
01361 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01369 448b1c24                       mov        r11d, dword ptr [rsp]
0136d 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01375 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0137a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01382 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01387 4c891424                       mov        qword ptr [rsp], r10
0138b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0138f 90                             nop        
01390 c5f877                         vzeroupper 
01393 e8c8beb5ff                     call       0x7fd3339c3660
01398 0f1f840090140012               nop        dword ptr [rax + rax + 0x12001490]
013a0 bee4ffffff                     mov        esi, 0xffffffe4
013a5 498bea                         mov        rbp, r10
013a8 448b1424                       mov        r10d, dword ptr [rsp]
013ac 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013b4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013b9 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
013c1 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
013c6 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
013ce 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013d3 4c891424                       mov        qword ptr [rsp], r10
013d7 895c2414                       mov        dword ptr [rsp + 0x14], ebx
013db 4489442438                     mov        dword ptr [rsp + 0x38], r8d
013e0 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
013e5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
013ea c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
013f0 c5f877                         vzeroupper 
013f3 e868beb5ff                     call       0x7fd3339c3660
013f8 0f1f8400f0140013               nop        dword ptr [rax + rax + 0x130014f0]
01400 be45ffffff                     mov        esi, 0xffffff45
01405 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0140d 666690                         nop        
01410 c5f877                         vzeroupper 
01413 e848beb5ff                     call       0x7fd3339c3660
01418 0f1f840010150014               nop        dword ptr [rax + rax + 0x14001510]
01420 458bc2                         mov        r8d, r10d
01423 be45ffffff                     mov        esi, 0xffffff45
01428 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01430 448b1c24                       mov        r11d, dword ptr [rsp]
01434 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0143c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01441 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01449 448b542404                     mov        r10d, dword ptr [rsp + 4]
0144e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01456 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0145b 4c891424                       mov        qword ptr [rsp], r10
0145f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01464 44895c2408                     mov        dword ptr [rsp + 8], r11d
01469 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0146e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01473 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01477 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0147c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01481 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01486 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0148b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01490 897c2430                       mov        dword ptr [rsp + 0x30], edi
01494 c5f877                         vzeroupper 
01497 e8c4bdb5ff                     call       0x7fd3339c3660
0149c 0f1f840094150015               nop        dword ptr [rax + rax + 0x15001594]
014a4 4d3bda                         cmp        r11, r10
014a7 bdffffffff                     mov        ebp, 0xffffffff
014ac 7c08                           jl         0x7fd333e678b6
014ae 400f95c5                       setne      bpl
014b2 400fb6ed                       movzx      ebp, bpl
014b6 be45ffffff                     mov        esi, 0xffffff45
014bb 448b0424                       mov        r8d, dword ptr [rsp]
014bf 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
014c7 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014cc 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
014d4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014d9 4c891c24                       mov        qword ptr [rsp], r11
014dd 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014e1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014e6 6690                           nop        
014e8 c5f877                         vzeroupper 
014eb e870bdb5ff                     call       0x7fd3339c3660
014f0 0f1f8400e8150016               nop        dword ptr [rax + rax + 0x160015e8]
014f8 be45ffffff                     mov        esi, 0xffffff45
014fd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01505 448b1c24                       mov        r11d, dword ptr [rsp]
01509 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01511 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01516 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0151e 448b542404                     mov        r10d, dword ptr [rsp + 4]
01523 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0152b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01530 4c891424                       mov        qword ptr [rsp], r10
01534 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01539 44895c2408                     mov        dword ptr [rsp + 8], r11d
0153e 48894424f8                     mov        qword ptr [rsp - 8], rax
01543 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01547 8944240c                       mov        dword ptr [rsp + 0xc], eax
0154b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01550 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01554 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01559 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0155e 6690                           nop        
01560 c5f877                         vzeroupper 
01563 e8f8bcb5ff                     call       0x7fd3339c3660
01568 0f1f840060160017               nop        dword ptr [rax + rax + 0x17001660]
01570 be45ffffff                     mov        esi, 0xffffff45
01575 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0157d 448b1424                       mov        r10d, dword ptr [rsp]
01581 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01589 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0158e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01596 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0159b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
015a3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015a8 4c891424                       mov        qword ptr [rsp], r10
015ac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015b1 4489542408                     mov        dword ptr [rsp + 8], r10d
015b6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
015bb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015c0 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
015c5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015ca 6690                           nop        
015cc c5f877                         vzeroupper 
015cf e88cbcb5ff                     call       0x7fd3339c3660
015d4 0f1f8400cc160018               nop        dword ptr [rax + rax + 0x180016cc]
015dc 85ff                           test       edi, edi
015de 0f8470090000                   je         0x7fd333e68354
015e4 488bcf                         mov        rcx, rdi
015e7 448b1424                       mov        r10d, dword ptr [rsp]
015eb 89742414                       mov        dword ptr [rsp + 0x14], esi
015ef 4533c0                         xor        r8d, r8d
015f2 e98ffaffff                     jmp        0x7fd333e67486
015f7 bee4ffffff                     mov        esi, 0xffffffe4
015fc 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01604 448b1424                       mov        r10d, dword ptr [rsp]
01608 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01610 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01615 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0161d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01622 4c891424                       mov        qword ptr [rsp], r10
01626 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
0162b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01630 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01634 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01638 c5f877                         vzeroupper 
0163b e820bcb5ff                     call       0x7fd3339c3660
01640 0f1f840038170019               nop        dword ptr [rax + rax + 0x19001738]
01648 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01651 bee4ffffff                     mov        esi, 0xffffffe4
01656 498bea                         mov        rbp, r10
01659 448b1424                       mov        r10d, dword ptr [rsp]
0165d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01665 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0166a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01672 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01677 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0167f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01684 4c891424                       mov        qword ptr [rsp], r10
01688 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0168d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01692 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01697 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0169c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016a1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
016a5 4489442440                     mov        dword ptr [rsp + 0x40], r8d
016aa 6690                           nop        
016ac c5f877                         vzeroupper 
016af e8acbbb5ff                     call       0x7fd3339c3660
016b4 0f1f8400ac17001a               nop        dword ptr [rax + rax + 0x1a0017ac]
016bc 8beb                           mov        ebp, ebx
016be 83c510                         add        ebp, 0x10
016c1 be6effffff                     mov        esi, 0xffffff6e
016c6 448b1424                       mov        r10d, dword ptr [rsp]
016ca 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
016d2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
016d7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016df 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016e4 4c891424                       mov        qword ptr [rsp], r10
016e8 895c2414                       mov        dword ptr [rsp + 0x14], ebx
016ec 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
016f1 666690                         nop        
016f4 c5f877                         vzeroupper 
016f7 e864bbb5ff                     call       0x7fd3339c3660
016fc 0f1f8400f417001b               nop        dword ptr [rax + rax + 0x1b0017f4]
01704 8beb                           mov        ebp, ebx
01706 83c510                         add        ebp, 0x10
01709 be66ffffff                     mov        esi, 0xffffff66
0170e 448b1424                       mov        r10d, dword ptr [rsp]
01712 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0171a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0171f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01727 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0172c 4c891424                       mov        qword ptr [rsp], r10
01730 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01734 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01739 666690                         nop        
0173c c5f877                         vzeroupper 
0173f e81cbbb5ff                     call       0x7fd3339c3660
01744 0f1f84003c18001c               nop        dword ptr [rax + rax + 0x1c00183c]
0174c be17000000                     mov        esi, 0x17
01751 666690                         nop        
01754 c5f877                         vzeroupper 
01757 e804bbb5ff                     call       0x7fd3339c3660
0175c 0f1f84005418001d               nop        dword ptr [rax + rax + 0x1d001854]
01764 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0176c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01771 eb0d                           jmp        0x7fd333e67b80
01773 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0177b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01780 be6effffff                     mov        esi, 0xffffff6e
01785 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0178d 4c89542408                     mov        qword ptr [rsp + 8], r10
01792 897c2410                       mov        dword ptr [rsp + 0x10], edi
01796 4889442418                     mov        qword ptr [rsp + 0x18], rax
0179b 894c2420                       mov        dword ptr [rsp + 0x20], ecx
0179f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017a4 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017a9 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017ad 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
017b2 4c89742440                     mov        qword ptr [rsp + 0x40], r14
017b7 90                             nop        
017b8 c5f877                         vzeroupper 
017bb e8a0bab5ff                     call       0x7fd3339c3660
017c0 0f1f8400b818001e               nop        dword ptr [rax + rax + 0x1e0018b8]
017c8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017cd bebeffffff                     mov        esi, 0xffffffbe
017d2 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
017da 448b1c24                       mov        r11d, dword ptr [rsp]
017de 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
017e6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
017eb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
017f3 4c89542408                     mov        qword ptr [rsp + 8], r10
017f8 893c24                         mov        dword ptr [rsp], edi
017fb 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01800 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01805 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01809 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0180e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01812 6690                           nop        
01814 c5f877                         vzeroupper 
01817 e844bab5ff                     call       0x7fd3339c3660
0181c 0f1f84001419001f               nop        dword ptr [rax + rax + 0x1f001914]
01824 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01829 eba2                           jmp        0x7fd333e67bcd
0182b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01830 eb9b                           jmp        0x7fd333e67bcd
01832 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01837 eb94                           jmp        0x7fd333e67bcd
01839 458bc2                         mov        r8d, r10d
0183c bee4ffffff                     mov        esi, 0xffffffe4
01841 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01849 448b1424                       mov        r10d, dword ptr [rsp]
0184d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01855 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0185a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01862 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01867 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0186f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01874 4c891424                       mov        qword ptr [rsp], r10
01878 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0187d 4489542408                     mov        dword ptr [rsp + 8], r10d
01882 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01887 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0188c 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01890 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01895 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0189a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0189f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018a4 4489442424                     mov        dword ptr [rsp + 0x24], r8d
018a9 897c243c                       mov        dword ptr [rsp + 0x3c], edi
018ad 666690                         nop        
018b0 c5f877                         vzeroupper 
018b3 e8a8b9b5ff                     call       0x7fd3339c3660
018b8 0f1f8400b0190020               nop        dword ptr [rax + rax + 0x200019b0]
018c0 bef6ffffff                     mov        esi, 0xfffffff6
018c5 666690                         nop        
018c8 c5f877                         vzeroupper 
018cb e890b9b5ff                     call       0x7fd3339c3660
018d0 0f1f8400c8190021               nop        dword ptr [rax + rax + 0x210019c8]
018d8 beccffffff                     mov        esi, 0xffffffcc
018dd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
018e5 448b1c24                       mov        r11d, dword ptr [rsp]
018e9 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
018f1 448b542404                     mov        r10d, dword ptr [rsp + 4]
018f6 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
018fe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01903 4c891424                       mov        qword ptr [rsp], r10
01907 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e84cb9b5ff                     call       0x7fd3339c3660
01914 0f1f84000c1a0022               nop        dword ptr [rax + rax + 0x22001a0c]
0191c bee4ffffff                     mov        esi, 0xffffffe4
01921 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01929 448b1424                       mov        r10d, dword ptr [rsp]
0192d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01935 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0193a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01942 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01947 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0194f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01954 4c891424                       mov        qword ptr [rsp], r10
01958 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0195d 4489542408                     mov        dword ptr [rsp + 8], r10d
01962 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0196a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0196f 90                             nop        
01970 c5f877                         vzeroupper 
01973 e8e8b8b5ff                     call       0x7fd3339c3660
01978 0f1f8400701a0023               nop        dword ptr [rax + rax + 0x23001a70]
01980 bee4ffffff                     mov        esi, 0xffffffe4
01985 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0198d 448b1424                       mov        r10d, dword ptr [rsp]
01991 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01999 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0199e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019a6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
019ab 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
019b3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019b8 4c891424                       mov        qword ptr [rsp], r10
019bc c5f877                         vzeroupper 
019bf e89cb8b5ff                     call       0x7fd3339c3660
019c4 0f1f8400bc1a0024               nop        dword ptr [rax + rax + 0x24001abc]
019cc beccffffff                     mov        esi, 0xffffffcc
019d1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
019d9 448b1424                       mov        r10d, dword ptr [rsp]
019dd 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
019e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ea 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
019f2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
019f7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
019ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a04 4c891424                       mov        qword ptr [rsp], r10
01a08 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a0d 4489542408                     mov        dword ptr [rsp + 8], r10d
01a12 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a17 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a1c c5f877                         vzeroupper 
01a1f e83cb8b5ff                     call       0x7fd3339c3660
01a24 0f1f84001c1b0025               nop        dword ptr [rax + rax + 0x25001b1c]
01a2c be6effffff                     mov        esi, 0xffffff6e
01a31 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01a39 448b0424                       mov        r8d, dword ptr [rsp]
01a3d 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01a45 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01a4a 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
01a52 448b4c2404                     mov        r9d, dword ptr [rsp + 4]
01a57 44898c24e4000000               mov        dword ptr [rsp + 0xe4], r9d
01a5f 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01a64 44894c2408                     mov        dword ptr [rsp + 8], r9d
01a69 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01a6e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01a73 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a77 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01a7c 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01a81 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01a86 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01a8b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a90 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a95 897c2440                       mov        dword ptr [rsp + 0x40], edi
01a99 666690                         nop        
01a9c c5f877                         vzeroupper 
01a9f e8bcb7b5ff                     call       0x7fd3339c3660
01aa4 0f1f84009c1b0026               nop        dword ptr [rax + rax + 0x26001b9c]
01aac 458bc2                         mov        r8d, r10d
01aaf e969f2ffff                     jmp        0x7fd333e6711d
01ab4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01abc 458d5a08                       lea        r11d, [r10 + 8]
01ac0 458bc3                         mov        r8d, r11d
01ac3 be6effffff                     mov        esi, 0xffffff6e
01ac8 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01ad0 448b1424                       mov        r10d, dword ptr [rsp]
01ad4 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01adc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ae1 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ae9 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01aee 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01af6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01afb 4c891424                       mov        qword ptr [rsp], r10
01aff 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b04 4489542408                     mov        dword ptr [rsp + 8], r10d
01b09 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b0e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b13 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01b18 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b1d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b22 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b27 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01b2c c5f877                         vzeroupper 
01b2f e82cb7b5ff                     call       0x7fd3339c3660
01b34 0f1f84002c1c0027               nop        dword ptr [rax + rax + 0x27001c2c]
01b3c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01b44 458d5a08                       lea        r11d, [r10 + 8]
01b48 458bc3                         mov        r8d, r11d
01b4b be66ffffff                     mov        esi, 0xffffff66
01b50 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b58 448b1424                       mov        r10d, dword ptr [rsp]
01b5c 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01b64 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b69 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01b71 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01b76 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01b7e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b83 4c891424                       mov        qword ptr [rsp], r10
01b87 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b8c 4489542408                     mov        dword ptr [rsp + 8], r10d
01b91 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b96 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b9b 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01ba0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ba5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01baa 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01baf 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01bb4 c5f877                         vzeroupper 
01bb7 e8a4b6b5ff                     call       0x7fd3339c3660
01bbc 0f1f8400b41c0028               nop        dword ptr [rax + rax + 0x28001cb4]
01bc4 beccffffff                     mov        esi, 0xffffffcc
01bc9 448b1424                       mov        r10d, dword ptr [rsp]
01bcd 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01bd5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01bda 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01be2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01be7 4c891424                       mov        qword ptr [rsp], r10
01beb 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01bef 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01bf4 c5f877                         vzeroupper 
01bf7 e864b6b5ff                     call       0x7fd3339c3660
01bfc 0f1f8400f41c0029               nop        dword ptr [rax + rax + 0x29001cf4]
01c04 bee4ffffff                     mov        esi, 0xffffffe4
01c09 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01c11 448b1424                       mov        r10d, dword ptr [rsp]
01c15 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01c1d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c22 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c2a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01c2f 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c37 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c3c 4c891424                       mov        qword ptr [rsp], r10
01c40 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c45 4489542408                     mov        dword ptr [rsp + 8], r10d
01c4a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01c4f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c54 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01c59 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c5e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01c66 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c6b 90                             nop        
01c6c c5f877                         vzeroupper 
01c6f e8ecb5b5ff                     call       0x7fd3339c3660
01c74 0f1f84006c1d002a               nop        dword ptr [rax + rax + 0x2a001d6c]
01c7c bee4ffffff                     mov        esi, 0xffffffe4
01c81 448b1c24                       mov        r11d, dword ptr [rsp]
01c85 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c8d 448b542404                     mov        r10d, dword ptr [rsp + 4]
01c92 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01c9a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c9f 4c891424                       mov        qword ptr [rsp], r10
01ca3 90                             nop        
01ca4 c5f877                         vzeroupper 
01ca7 e8b4b5b5ff                     call       0x7fd3339c3660
01cac 0f1f8400a41d002b               nop        dword ptr [rax + rax + 0x2b001da4]
01cb4 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01cbb ffc5                           inc        ebp
01cbd bee4ffffff                     mov        esi, 0xffffffe4
01cc2 448b1424                       mov        r10d, dword ptr [rsp]
01cc6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01cce 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01cd3 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01cdb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ce0 4c891424                       mov        qword ptr [rsp], r10
01ce4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ce9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01cee 6690                           nop        
01cf0 c5f877                         vzeroupper 
01cf3 e868b5b5ff                     call       0x7fd3339c3660
01cf8 0f1f8400f01d002c               nop        dword ptr [rax + rax + 0x2c001df0]
01d00 bee4ffffff                     mov        esi, 0xffffffe4
01d05 448b1c24                       mov        r11d, dword ptr [rsp]
01d09 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01d11 448b542404                     mov        r10d, dword ptr [rsp + 4]
01d16 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01d1e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d23 4c891424                       mov        qword ptr [rsp], r10
01d27 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d2c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d31 666690                         nop        
01d34 c5f877                         vzeroupper 
01d37 e824b5b5ff                     call       0x7fd3339c3660
01d3c 0f1f8400341e002d               nop        dword ptr [rax + rax + 0x2d001e34]
01d44 bee4ffffff                     mov        esi, 0xffffffe4
01d49 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01d51 448b1c24                       mov        r11d, dword ptr [rsp]
01d55 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d5d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d62 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01d6a 448b542404                     mov        r10d, dword ptr [rsp + 4]
01d6f 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d77 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d7c 4c891424                       mov        qword ptr [rsp], r10
01d80 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d85 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01d8a 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01d8f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d94 c5f877                         vzeroupper 
01d97 e8c4b4b5ff                     call       0x7fd3339c3660
01d9c 0f1f8400941e002e               nop        dword ptr [rax + rax + 0x2e001e94]
01da4 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01dac 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
01db3 bef6ffffff                     mov        esi, 0xfffffff6
01db8 498beb                         mov        rbp, r11
01dbb 898c24e0000000                 mov        dword ptr [rsp + 0xe0], ecx
01dc2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01dca 6690                           nop        
01dcc c5f877                         vzeroupper 
01dcf e88cb4b5ff                     call       0x7fd3339c3660
01dd4 0f1f8400cc1e002f               nop        dword ptr [rax + rax + 0x2f001ecc]
01ddc 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
01de1 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01de9 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01dee beccffffff                     mov        esi, 0xffffffcc
01df3 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01dfb 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01e03 44890c24                       mov        dword ptr [rsp], r9d
01e07 48894c2408                     mov        qword ptr [rsp + 8], rcx
01e0c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e11 666690                         nop        
01e14 c5f877                         vzeroupper 
01e17 e844b4b5ff                     call       0x7fd3339c3660
01e1c 0f1f8400141f0030               nop        dword ptr [rax + rax + 0x30001f14]
01e24 beccffffff                     mov        esi, 0xffffffcc
01e29 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e31 448b1424                       mov        r10d, dword ptr [rsp]
01e35 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01e3d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e42 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01e4a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e4f 4c891424                       mov        qword ptr [rsp], r10
01e53 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e57 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01e5c c5f877                         vzeroupper 
01e5f e8fcb3b5ff                     call       0x7fd3339c3660
01e64 0f1f84005c1f0031               nop        dword ptr [rax + rax + 0x31001f5c]
01e6c beccffffff                     mov        esi, 0xffffffcc
01e71 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e79 448b1424                       mov        r10d, dword ptr [rsp]
01e7d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01e85 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e8a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01e92 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e97 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e9f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ea4 4c891424                       mov        qword ptr [rsp], r10
01ea8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ead 4489542408                     mov        dword ptr [rsp + 8], r10d
01eb2 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01eb6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01ebb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ec0 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01ec5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01eca 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01ecf 90                             nop        
01ed0 c5f877                         vzeroupper 
01ed3 e888b3b5ff                     call       0x7fd3339c3660
01ed8 0f1f8400d01f0032               nop        dword ptr [rax + rax + 0x32001fd0]
01ee0 beccffffff                     mov        esi, 0xffffffcc
01ee5 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01eed 448b1c24                       mov        r11d, dword ptr [rsp]
01ef1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01ef9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01efe 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01f06 448b542404                     mov        r10d, dword ptr [rsp + 4]
01f0b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01f13 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f18 4c891424                       mov        qword ptr [rsp], r10
01f1c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f21 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f26 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01f2a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01f2f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f34 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01f39 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f3e 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01f43 90                             nop        
01f44 c5f877                         vzeroupper 
01f47 e814b3b5ff                     call       0x7fd3339c3660
01f4c 0f1f840044200033               nop        dword ptr [rax + rax + 0x33002044]
01f54 448bc1                         mov        r8d, ecx
01f57 89742414                       mov        dword ptr [rsp + 0x14], esi
01f5b 33c9                           xor        ecx, ecx
01f5d 458bd0                         mov        r10d, r8d
01f60 e94efeffff                     jmp        0x7fd333e681b3
01f65 bef6ffffff                     mov        esi, 0xfffffff6
01f6a 6690                           nop        
01f6c c5f877                         vzeroupper 
01f6f e8ecb2b5ff                     call       0x7fd3339c3660
01f74 0f1f84006c200034               nop        dword ptr [rax + rax + 0x3400206c]
01f7c eb14                           jmp        0x7fd333e68392
01f7e eb12                           jmp        0x7fd333e68392
01f80 eb10                           jmp        0x7fd333e68392
01f82 eb0e                           jmp        0x7fd333e68392
01f84 eb0c                           jmp        0x7fd333e68392
01f86 eb0a                           jmp        0x7fd333e68392
01f88 eb08                           jmp        0x7fd333e68392
01f8a eb06                           jmp        0x7fd333e68392
01f8c eb04                           jmp        0x7fd333e68392
01f8e eb02                           jmp        0x7fd333e68392
01f90 eb00                           jmp        0x7fd333e68392
01f92 488bf0                         mov        rsi, rax
01f95 e9e6e6ffff                     jmp        0x7fd333e66a80
01f9a 49bafa74e633d37f0000           movabs     r10, 0x7fd333e674fa
01fa4 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01fab e9305ba9ff                     jmp        0x7fd3338fdee0
01fb0 e8eb26a8ff                     call       0x7fd3338eaaa0
01fb5 e984e0ffff                     jmp        0x7fd333e6643e
01fba f4                             hlt        
01fbb f4                             hlt        
01fbc f4                             hlt        
01fbd f4                             hlt        
01fbe f4                             hlt        
01fbf f4                             hlt        
