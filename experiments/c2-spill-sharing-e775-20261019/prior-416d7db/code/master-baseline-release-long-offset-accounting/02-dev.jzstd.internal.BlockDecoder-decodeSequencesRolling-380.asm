00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecd0000000                 sub        rsp, 0xd0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85881d0000                   jne        0x7f959be5dba6
0001e 4889742438                     mov        qword ptr [rsp + 0x38], rsi
00023 448d5aff                       lea        r11d, [rdx - 1]
00027 8b4604                         mov        eax, dword ptr [rsi + 4]
0002a 443bd8                         cmp        r11d, eax
0002d 0f833a0b0000                   jae        0x7f959be5c96d
00033 440fb65c1607                   movzx      r11d, byte ptr [rsi + rdx + 7]
00039 4585db                         test       r11d, r11d
0003c 0f84c20c0000                   je         0x7f959be5cb04
00042 8bda                           mov        ebx, edx
00044 2bd9                           sub        ebx, ecx
00046 f3450fbdd3                     lzcnt      r10d, r11d
0004b 448d1cdd00000000               lea        r11d, [rbx*8]
00053 be1f000000                     mov        esi, 0x1f
00058 412bf2                         sub        esi, r10d
0005b 41ba08000000                   mov        r10d, 8
00061 442bd6                         sub        r10d, esi
00064 418beb                         mov        ebp, r11d
00067 412bea                         sub        ebp, r10d
0006a 83fb08                         cmp        ebx, 8
0006d 0f8da90c0000                   jge        0x7f959be5cb1c
00073 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00077 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
0007e 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00083 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00088 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0008c 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00090 4863c9                         movsxd     rcx, ecx
00093 4863e8                         movsxd     rbp, eax
00096 85db                           test       ebx, ebx
00098 0f8fdb090000                   jg         0x7f959be5c879
0009e 4533c0                         xor        r8d, r8d
000a1 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000a6 eb39                           jmp        0x7f959be5bee1
000a8 49c1e508                       shl        r13, 8
000ac 448bca                         mov        r9d, edx
000af 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
000b4 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
000b9 4f0fb6440808                   movzx      r8, byte ptr [r8 + r9 + 8]
000bf 4d0bc5                         or         r8, r13
000c2 ffca                           dec        edx
000c4 83faff                         cmp        edx, -1
000c7 7e05                           jle        0x7f959be5bece
000c9 4d8be8                         mov        r13, r8
000cc ebda                           jmp        0x7f959be5bea8
000ce 41b940000000                   mov        r9d, 0x40
000d4 452bcb                         sub        r9d, r11d
000d7 c442b1f7c0                     shlx       r8, r8, r9
000dc 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000e1 448d4bf8                       lea        r9d, [rbx - 8]
000e5 4183f908                       cmp        r9d, 8
000e9 0f8d6d0c0000                   jge        0x7f959be5cb5c
000ef 4585c9                         test       r9d, r9d
000f2 0f8f9f080000                   jg         0x7f959be5c797
000f8 4533c0                         xor        r8d, r8d
000fb eb34                           jmp        0x7f959be5bf31
000fd 48c1e208                       shl        rdx, 8
00101 448bcf                         mov        r9d, edi
00104 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00109 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
0010e 4f0fb6440808                   movzx      r8, byte ptr [r8 + r9 + 8]
00114 4c0bc2                         or         r8, rdx
00117 ffcf                           dec        edi
00119 83ffff                         cmp        edi, -1
0011c 7e05                           jle        0x7f959be5bf23
0011e 498bd0                         mov        rdx, r8
00121 ebda                           jmp        0x7f959be5befd
00123 41b980000000                   mov        r9d, 0x80
00129 452bcb                         sub        r9d, r11d
0012c c442b1f7c0                     shlx       r8, r8, r9
00131 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
00136 458b5918                       mov        r11d, dword ptr [r9 + 0x18]
0013a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0013f 4c89442448                     mov        qword ptr [rsp + 0x48], r8
00144 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00148 44891c24                       mov        dword ptr [rsp], r11d
0014c 458b591c                       mov        r11d, dword ptr [r9 + 0x1c]
00150 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00155 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00159 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0015e 458b5b20                       mov        r11d, dword ptr [r11 + 0x20]
00162 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00167 458b4304                       mov        r8d, dword ptr [r11 + 4]
0016b bb40000000                     mov        ebx, 0x40
00170 412bda                         sub        ebx, r10d
00173 418bc9                         mov        ecx, r9d
00176 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
0017b 41034b04                       add        ecx, dword ptr [r11 + 4]
0017f 4103c8                         add        ecx, r8d
00182 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00186 85c9                           test       ecx, ecx
00188 0f84fe0b0000                   je         0x7f959be5cb8c
0018e 3bcb                           cmp        ecx, ebx
00190 0f8f6a0c0000                   jg         0x7f959be5cc00
00196 2bd9                           sub        ebx, ecx
00198 c4e2e3f74c2430                 shrx       rcx, qword ptr [rsp + 0x30], rbx
0019f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
001a4 4183fb40                       cmp        r11d, 0x40
001a8 0f8dd20c0000                   jge        0x7f959be5cc80
001ae 458bd3                         mov        r10d, r11d
001b1 442bd6                         sub        r10d, esi
001b4 4183c208                       add        r10d, 8
001b8 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001bd 41bb01000000                   mov        r11d, 1
001c3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
001c8 c442a9f7db                     shlx       r11, r11, r10
001cd 49ffcb                         dec        r11
001d0 4c23d9                         and        r11, rcx
001d3 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
001d8 4183fa40                       cmp        r10d, 0x40
001dc 0f8d220d0000                   jge        0x7f959be5cd04
001e2 4183f820                       cmp        r8d, 0x20
001e6 0f8d840d0000                   jge        0x7f959be5cd70
001ec c4c2bbf7cb                     shrx       rcx, r11, r8
001f1 bf01000000                     mov        edi, 1
001f6 c46239f7c7                     shlx       r8d, edi, r8d
001fb 41ffc8                         dec        r8d
001fe 4d63d0                         movsxd     r10, r8d
00201 4d23d3                         and        r10, r11
00204 458bd2                         mov        r10d, r10d
00207 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0020c 4183f920                       cmp        r9d, 0x20
00210 0f8dea0d0000                   jge        0x7f959be5ce00
00216 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0021b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0021f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00224 448b1424                       mov        r10d, dword ptr [rsp]
00228 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0022c 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00231 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00235 418bea                         mov        ebp, r10d
00238 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0023c 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00241 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00245 418bf2                         mov        esi, r10d
00248 458b4204                       mov        r8d, dword ptr [r10 + 4]
0024c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00254 4585d2                         test       r10d, r10d
00257 0f8ef8060000                   jle        0x7f959be5c755
0025d c46231f7d7                     shlx       r10d, edi, r9d
00262 c462b3f7c9                     shrx       r9, rcx, r9
00267 41ffca                         dec        r10d
0026a 418bf9                         mov        edi, r9d
0026d 89bc249c000000                 mov        dword ptr [rsp + 0x9c], edi
00274 4d63d2                         movsxd     r10, r10d
00277 4c23d1                         and        r10, rcx
0027a 458bd2                         mov        r10d, r10d
0027d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00285 458d4bff                       lea        r9d, [r11 - 1]
00289 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00291 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00296 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
0029d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002a5 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
002aa 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
002b1 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002b9 458d50ff                       lea        r10d, [r8 - 1]
002bd 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
002c5 448d4bff                       lea        r9d, [rbx - 1]
002c9 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
002d1 4585db                         test       r11d, r11d
002d4 0f86c6080000                   jbe        0x7f959be5c9a0
002da 85db                           test       ebx, ebx
002dc 0f86be080000                   jbe        0x7f959be5c9a0
002e2 4585c0                         test       r8d, r8d
002e5 0f86b5080000                   jbe        0x7f959be5c9a0
002eb 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
002f3 458b5204                       mov        r10d, dword ptr [r10 + 4]
002f7 4585d2                         test       r10d, r10d
002fa 0f86a0080000                   jbe        0x7f959be5c9a0
00300 4d63d2                         movsxd     r10, r10d
00303 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
0030b 49ffcb                         dec        r11
0030e 4d3bda                         cmp        r11, r10
00311 0f8389080000                   jae        0x7f959be5c9a0
00317 4983fb01                       cmp        r11, 1
0031b 41ba01000000                   mov        r10d, 1
00321 4d0f4cda                       cmovl      r11, r10
00325 458beb                         mov        r13d, r11d
00328 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
00330 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00338 450f4fea                       cmovg      r13d, r10d
0033c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00341 44239424ac000000               and        r10d, dword ptr [rsp + 0xac]
00349 458bca                         mov        r9d, r10d
0034c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00354 44239424b0000000               and        r10d, dword ptr [rsp + 0xb0]
0035c 418bfa                         mov        edi, r10d
0035f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00367 44239424a4000000               and        r10d, dword ptr [rsp + 0xa4]
0036f 4533db                         xor        r11d, r11d
00372 4533c0                         xor        r8d, r8d
00375 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0037a 4c898424b8000000               mov        qword ptr [rsp + 0xb8], r8
00382 4489542404                     mov        dword ptr [rsp + 4], r10d
00387 448b1424                       mov        r10d, dword ptr [rsp]
0038b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00390 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00395 448b742464                     mov        r14d, dword ptr [rsp + 0x64]
0039a 41ffc6                         inc        r14d
0039d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
003a2 49c1ea20                       shr        r10, 0x20
003a6 458bd2                         mov        r10d, r10d
003a9 450fb6d2                       movzx      r10d, r10b
003ad 418bd1                         mov        edx, r9d
003b0 4e8b5cce08                     mov        r11, qword ptr [rsi + r9*8 + 8]
003b5 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
003bd 8bdd                           mov        ebx, ebp
003bf 4c8b5cfd08                     mov        r11, qword ptr [rbp + rdi*8 + 8]
003c4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
003c9 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
003d1 49c1eb20                       shr        r11, 0x20
003d5 458bc3                         mov        r8d, r11d
003d8 450fb6c0                       movzx      r8d, r8b
003dc 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
003e1 49c1eb20                       shr        r11, 0x20
003e5 458bcb                         mov        r9d, r11d
003e8 450fb6d9                       movzx      r11d, r9b
003ec 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
003f4 0f8c9e0c0000                   jl         0x7f959be5ce98
003fa 438d0418                       lea        eax, [r8 + r11]
003fe 4103c2                         add        eax, r10d
00401 0f846d0d0000                   je         0x7f959be5cf74
00407 83f83f                         cmp        eax, 0x3f
0040a 0f8f500e0000                   jg         0x7f959be5d060
00410 b940000000                     mov        ecx, 0x40
00415 2b4c247c                       sub        ecx, dword ptr [rsp + 0x7c]
00419 3bc1                           cmp        eax, ecx
0041b 0f8f270f0000                   jg         0x7f959be5d148
00421 2bc8                           sub        ecx, eax
00423 c4e2f3f74c2430                 shrx       rcx, qword ptr [rsp + 0x30], rcx
0042a 83f840                         cmp        eax, 0x40
0042d 0f8d0d100000                   jge        0x7f959be5d240
00433 41b901000000                   mov        r9d, 1
00439 c442f9f7c9                     shlx       r9, r9, rax
0043e 49ffc9                         dec        r9
00441 4c23c9                         and        r9, rcx
00444 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00448 03c8                           add        ecx, eax
0044a 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0044e 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00452 03c8                           add        ecx, eax
00454 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00458 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
0045c 83f940                         cmp        ecx, 0x40
0045f 0f8ddb100000                   jge        0x7f959be5d340
00465 4183fa40                       cmp        r10d, 0x40
00469 0f8d8d110000                   jge        0x7f959be5d3fc
0046f c4c2abf7c9                     shrx       rcx, r9, r10
00474 b801000000                     mov        eax, 1
00479 c462a9f7d0                     shlx       r10, rax, r10
0047e 49ffca                         dec        r10
00481 4d23d1                         and        r10, r9
00484 4183f840                       cmp        r8d, 0x40
00488 0f8d56120000                   jge        0x7f959be5d4e4
0048e c462bbf7c9                     shrx       r9, rcx, r8
00493 c462b9f7c0                     shlx       r8, rax, r8
00498 49ffc8                         dec        r8
0049b 4c23c1                         and        r8, rcx
0049e 4183fb40                       cmp        r11d, 0x40
004a2 0f8df4120000                   jge        0x7f959be5d59c
004a8 b901000000                     mov        ecx, 1
004ad c4e2a1f7c9                     shlx       rcx, rcx, r11
004b2 458bd2                         mov        r10d, r10d
004b5 48ffc9                         dec        rcx
004b8 4923c9                         and        rcx, r9
004bb 458bc0                         mov        r8d, r8d
004be 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
004c3 458bdb                         mov        r11d, r11d
004c6 4903cb                         add        rcx, r11
004c9 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
004ce 458bdb                         mov        r11d, r11d
004d1 4503d3                         add        r10d, r11d
004d4 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004dc 458bcb                         mov        r9d, r11d
004df 4503c1                         add        r8d, r9d
004e2 4d63c8                         movsxd     r9, r8d
004e5 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
004ed 4d03d9                         add        r11, r9
004f0 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
004f8 4885c9                         test       rcx, rcx
004fb 0f8e32070000                   jle        0x7f959be5ca33
00501 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
00508 0f8f3a130000                   jg         0x7f959be5d648
0050e 4181faffff0100                 cmp        r10d, 0x1ffff
00515 0f8ff9130000                   jg         0x7f959be5d714
0051b 4181f8ffff0300                 cmp        r8d, 0x3ffff
00522 0f8fa8140000                   jg         0x7f959be5d7d0
00528 448bd9                         mov        r11d, ecx
0052b 4181fb00000010                 cmp        r11d, 0x10000000
00532 0f8354150000                   jae        0x7f959be5d88c
00538 4d63d2                         movsxd     r10, r10d
0053b 49c1e112                       shl        r9, 0x12
0053f 4d63db                         movsxd     r11, r11d
00542 49c1e324                       shl        r11, 0x24
00546 4d0bcb                         or         r9, r11
00549 4d0bca                         or         r9, r10
0054c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00554 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00559 4f894cda08                     mov        qword ptr [r10 + r11*8 + 8], r9
0055e 453bf5                         cmp        r14d, r13d
00561 7d12                           jge        0x7f959be5c375
00563 4489742464                     mov        dword ptr [rsp + 0x64], r14d
00568 448bca                         mov        r9d, edx
0056b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00570 e90dfeffff                     jmp        0x7f959be5c182
00575 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
0057d 0f8da5060000                   jge        0x7f959be5ca28
00583 41ffc3                         inc        r11d
00586 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0058b 448b1424                       mov        r10d, dword ptr [rsp]
0058f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00594 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00599 4c8b44d608                     mov        r8, qword ptr [rsi + rdx*8 + 8]
0059e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005a3 49c1ea20                       shr        r10, 0x20
005a7 458bda                         mov        r11d, r10d
005aa 450fb6d3                       movzx      r10d, r11b
005ae 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
005b6 49c1e820                       shr        r8, 0x20
005ba 458bd8                         mov        r11d, r8d
005bd 450fb6c3                       movzx      r8d, r11b
005c1 4c8b5cfb08                     mov        r11, qword ptr [rbx + rdi*8 + 8]
005c6 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
005cb 49c1eb20                       shr        r11, 0x20
005cf 458bdb                         mov        r11d, r11d
005d2 450fb6db                       movzx      r11d, r11b
005d6 438d0403                       lea        eax, [r11 + r8]
005da 4103c2                         add        eax, r10d
005dd 0f84910b0000                   je         0x7f959be5cf74
005e3 83f83f                         cmp        eax, 0x3f
005e6 0f8f740c0000                   jg         0x7f959be5d060
005ec b940000000                     mov        ecx, 0x40
005f1 2b4c247c                       sub        ecx, dword ptr [rsp + 0x7c]
005f5 3bc1                           cmp        eax, ecx
005f7 0f8f4b0d0000                   jg         0x7f959be5d148
005fd 2bc8                           sub        ecx, eax
005ff c4e2f3f74c2430                 shrx       rcx, qword ptr [rsp + 0x30], rcx
00606 83f840                         cmp        eax, 0x40
00609 0f8d310e0000                   jge        0x7f959be5d240
0060f 41b901000000                   mov        r9d, 1
00615 c442f9f7c9                     shlx       r9, r9, rax
0061a 49ffc9                         dec        r9
0061d 4c23c9                         and        r9, rcx
00620 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00624 03c8                           add        ecx, eax
00626 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0062a 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
0062e 03c8                           add        ecx, eax
00630 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
00634 83f940                         cmp        ecx, 0x40
00637 0f8d030f0000                   jge        0x7f959be5d340
0063d 4183fa40                       cmp        r10d, 0x40
00641 0f8db50f0000                   jge        0x7f959be5d3fc
00647 c4c2abf7c9                     shrx       rcx, r9, r10
0064c b801000000                     mov        eax, 1
00651 c462a9f7d0                     shlx       r10, rax, r10
00656 49ffca                         dec        r10
00659 4d23d1                         and        r10, r9
0065c 4183f840                       cmp        r8d, 0x40
00660 0f8d7e100000                   jge        0x7f959be5d4e4
00666 c462bbf7c9                     shrx       r9, rcx, r8
0066b c462b9f7c0                     shlx       r8, rax, r8
00670 49ffc8                         dec        r8
00673 4c23c1                         and        r8, rcx
00676 4183fb40                       cmp        r11d, 0x40
0067a 0f8d1c110000                   jge        0x7f959be5d59c
00680 b901000000                     mov        ecx, 1
00685 c4e2a1f7c9                     shlx       rcx, rcx, r11
0068a 458bd2                         mov        r10d, r10d
0068d 48ffc9                         dec        rcx
00690 4923c9                         and        rcx, r9
00693 458bc0                         mov        r8d, r8d
00696 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0069b 458bdb                         mov        r11d, r11d
0069e 4503d3                         add        r10d, r11d
006a1 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
006a9 458bcb                         mov        r9d, r11d
006ac 4503c1                         add        r8d, r9d
006af 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006b4 458bdb                         mov        r11d, r11d
006b7 4903cb                         add        rcx, r11
006ba 4d63d8                         movsxd     r11, r8d
006bd 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
006c5 4d03cb                         add        r9, r11
006c8 4c898c24b8000000               mov        qword ptr [rsp + 0xb8], r9
006d0 4885c9                         test       rcx, rcx
006d3 0f8e5a050000                   jle        0x7f959be5ca33
006d9 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
006e0 0f8f62110000                   jg         0x7f959be5d648
006e6 4181faffff0100                 cmp        r10d, 0x1ffff
006ed 0f8f21120000                   jg         0x7f959be5d714
006f3 4181f8ffff0300                 cmp        r8d, 0x3ffff
006fa 0f8fd0120000                   jg         0x7f959be5d7d0
00700 448bc9                         mov        r9d, ecx
00703 4181f900000010                 cmp        r9d, 0x10000000
0070a 0f837c130000                   jae        0x7f959be5d88c
00710 4d63d2                         movsxd     r10, r10d
00713 49c1e312                       shl        r11, 0x12
00717 4d63c1                         movsxd     r8, r9d
0071a 49c1e024                       shl        r8, 0x24
0071e 4d0bc3                         or         r8, r11
00721 4d0bc2                         or         r8, r10
00724 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0072c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00731 4f8944da08                     mov        qword ptr [r10 + r11*8 + 8], r8
00736 41ffc3                         inc        r11d
00739 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00741 7d0a                           jge        0x7f959be5c54d
00743 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
00748 e93efeffff                     jmp        0x7f959be5c38b
0074d 448bd6                         mov        r10d, esi
00750 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00758 0f8ded010000                   jge        0x7f959be5c74b
0075e 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
00763 90                             nop        
00764 458bea                         mov        r13d, r10d
00767 8bea                           mov        ebp, edx
00769 4d8b54d208                     mov        r10, qword ptr [r10 + rdx*8 + 8]
0076e 448b742464                     mov        r14d, dword ptr [rsp + 0x64]
00773 41ffc6                         inc        r14d
00776 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0077e 49c1ea20                       shr        r10, 0x20
00782 458bda                         mov        r11d, r10d
00785 450fb6c3                       movzx      r8d, r11b
00789 4c8b54fb08                     mov        r10, qword ptr [rbx + rdi*8 + 8]
0078e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00793 8b1424                         mov        edx, dword ptr [rsp]
00796 8b742404                       mov        esi, dword ptr [rsp + 4]
0079a 4c8b54f208                     mov        r10, qword ptr [rdx + rsi*8 + 8]
0079f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
007a4 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
007a9 49c1ea20                       shr        r10, 0x20
007ad 458bd2                         mov        r10d, r10d
007b0 450fb6da                       movzx      r11d, r10b
007b4 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007b9 49c1ea20                       shr        r10, 0x20
007bd 458bd2                         mov        r10d, r10d
007c0 450fb6d2                       movzx      r10d, r10b
007c4 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
007cc 0f8cc6080000                   jl         0x7f959be5ce98
007d2 438d0418                       lea        eax, [r8 + r11]
007d6 4103c2                         add        eax, r10d
007d9 0f8495090000                   je         0x7f959be5cf74
007df 83f83f                         cmp        eax, 0x3f
007e2 0f8f780a0000                   jg         0x7f959be5d060
007e8 b940000000                     mov        ecx, 0x40
007ed 2b4c247c                       sub        ecx, dword ptr [rsp + 0x7c]
007f1 3bc1                           cmp        eax, ecx
007f3 0f8f4f0b0000                   jg         0x7f959be5d148
007f9 2bc8                           sub        ecx, eax
007fb c4e2f3f74c2430                 shrx       rcx, qword ptr [rsp + 0x30], rcx
00802 83f840                         cmp        eax, 0x40
00805 0f8d350c0000                   jge        0x7f959be5d240
0080b 41b901000000                   mov        r9d, 1
00811 c442f9f7c9                     shlx       r9, r9, rax
00816 49ffc9                         dec        r9
00819 4c23c9                         and        r9, rcx
0081c 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00820 03c8                           add        ecx, eax
00822 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00826 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
0082a 03c8                           add        ecx, eax
0082c 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
00830 83f940                         cmp        ecx, 0x40
00833 0f8d070d0000                   jge        0x7f959be5d340
00839 4183fa40                       cmp        r10d, 0x40
0083d 0f8db90d0000                   jge        0x7f959be5d3fc
00843 c4c2abf7c9                     shrx       rcx, r9, r10
00848 b801000000                     mov        eax, 1
0084d c462a9f7d0                     shlx       r10, rax, r10
00852 49ffca                         dec        r10
00855 4d23d1                         and        r10, r9
00858 4183f840                       cmp        r8d, 0x40
0085c 0f8d820e0000                   jge        0x7f959be5d4e4
00862 c462bbf7c9                     shrx       r9, rcx, r8
00867 c462b9f7c0                     shlx       r8, rax, r8
0086c 49ffc8                         dec        r8
0086f 4c23c1                         and        r8, rcx
00872 4183fb40                       cmp        r11d, 0x40
00876 0f8d200f0000                   jge        0x7f959be5d59c
0087c b901000000                     mov        ecx, 1
00881 c4e2a1f7c9                     shlx       rcx, rcx, r11
00886 458bd2                         mov        r10d, r10d
00889 48ffc9                         dec        rcx
0088c 4923c9                         and        rcx, r9
0088f 458bc0                         mov        r8d, r8d
00892 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00897 458bdb                         mov        r11d, r11d
0089a 4503d3                         add        r10d, r11d
0089d 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
008a5 458bcb                         mov        r9d, r11d
008a8 4503c1                         add        r8d, r9d
008ab 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008b0 458bdb                         mov        r11d, r11d
008b3 4903cb                         add        rcx, r11
008b6 4d63c8                         movsxd     r9, r8d
008b9 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
008c1 4d03d9                         add        r11, r9
008c4 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
008cc 4885c9                         test       rcx, rcx
008cf 0f8e5e030000                   jle        0x7f959be5ca33
008d5 4881f9ffffff7f                 cmp        rcx, 0x7fffffff
008dc 0f8f660f0000                   jg         0x7f959be5d648
008e2 4181faffff0100                 cmp        r10d, 0x1ffff
008e9 0f8f25100000                   jg         0x7f959be5d714
008ef 4181f8ffff0300                 cmp        r8d, 0x3ffff
008f6 0f8fd4100000                   jg         0x7f959be5d7d0
008fc 448bd9                         mov        r11d, ecx
008ff 4181fb00000010                 cmp        r11d, 0x10000000
00906 0f8380110000                   jae        0x7f959be5d88c
0090c 4d63d2                         movsxd     r10, r10d
0090f 4d63db                         movsxd     r11, r11d
00912 49c1e112                       shl        r9, 0x12
00916 49c1e324                       shl        r11, 0x24
0091a 4d0bcb                         or         r9, r11
0091d 4d0bca                         or         r9, r10
00920 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00928 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0092d 4f894cda08                     mov        qword ptr [r10 + r11*8 + 8], r9
00932 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
0093a 7d0f                           jge        0x7f959be5c74b
0093c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
00941 458bd5                         mov        r10d, r13d
00944 8bd5                           mov        edx, ebp
00946 e919feffff                     jmp        0x7f959be5c564
0094b 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00953 eb03                           jmp        0x7f959be5c758
00955 4533db                         xor        r11d, r11d
00958 4c63542460                     movsxd     r10, dword ptr [rsp + 0x60]
0095d 4d03da                         add        r11, r10
00960 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
00968 4d3bda                         cmp        r11, r10
0096b 0f8fcf110000                   jg         0x7f959be5d940
00971 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00976 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
0097b 0f85e3110000                   jne        0x7f959be5d964
00981 418bc3                         mov        eax, r11d
00984 4881c4d0000000                 add        rsp, 0xd0
0098b 5d                             pop        rbp
0098c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00990 0f87fa130000                   ja         0x7f959be5db90
00996 c3                             ret        
00997 8d7bf7                         lea        edi, [rbx - 9]
0099a 85ff                           test       edi, edi
0099c 0f8cc3010000                   jl         0x7f959be5c965
009a2 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
009a7 443bc0                         cmp        r8d, eax
009aa 0f8318120000                   jae        0x7f959be5d9c8
009b0 4c63c7                         movsxd     r8, edi
009b3 4c03c1                         add        r8, rcx
009b6 4c3bc5                         cmp        r8, rbp
009b9 0f8309120000                   jae        0x7f959be5d9c8
009bf 85ff                           test       edi, edi
009c1 0f8eb1120000                   jle        0x7f959be5da78
009c7 83c3f6                         add        ebx, -0xa
009ca 4533c9                         xor        r9d, r9d
009cd 49c1e108                       shl        r9, 8
009d1 448bc7                         mov        r8d, edi
009d4 4403442440                     add        r8d, dword ptr [rsp + 0x40]
009d9 488b4c2438                     mov        rcx, qword ptr [rsp + 0x38]
009de 4a0fb6540108                   movzx      rdx, byte ptr [rcx + r8 + 8]
009e4 490bd1                         or         rdx, r9
009e7 ffcf                           dec        edi
009e9 3bfb                           cmp        edi, ebx
009eb 7e05                           jle        0x7f959be5c7f2
009ed 4c8bca                         mov        r9, rdx
009f0 ebdb                           jmp        0x7f959be5c7cd
009f2 83ff02                         cmp        edi, 2
009f5 7e71                           jle        0x7f959be5c868
009f7 660f1f840000000000             nop        word ptr [rax + rax]
00a00 48c1e208                       shl        rdx, 8
00a04 8bcf                           mov        ecx, edi
00a06 034c2440                       add        ecx, dword ptr [rsp + 0x40]
00a0a 448bcf                         mov        r9d, edi
00a0d 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00a12 4d63c9                         movsxd     r9, r9d
00a15 448d41fe                       lea        r8d, [rcx - 2]
00a19 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00a1e 4a0fb65c0308                   movzx      rbx, byte ptr [rbx + r8 + 8]
00a24 83c1fd                         add        ecx, -3
00a27 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00a2c 4d0fb6440808                   movzx      r8, byte ptr [r8 + rcx + 8]
00a32 488b4c2438                     mov        rcx, qword ptr [rsp + 0x38]
00a37 4a0fb64c0907                   movzx      rcx, byte ptr [rcx + r9 + 7]
00a3d 488b442438                     mov        rax, qword ptr [rsp + 0x38]
00a42 4e0fb64c0808                   movzx      r9, byte ptr [rax + r9 + 8]
00a48 490bd1                         or         rdx, r9
00a4b 48c1e208                       shl        rdx, 8
00a4f 480bd1                         or         rdx, rcx
00a52 48c1e208                       shl        rdx, 8
00a56 480bd3                         or         rdx, rbx
00a59 48c1e208                       shl        rdx, 8
00a5d 490bd0                         or         rdx, r8
00a60 83c7fc                         add        edi, -4
00a63 83ff02                         cmp        edi, 2
00a66 7f98                           jg         0x7f959be5c800
00a68 83ffff                         cmp        edi, -1
00a6b 0f8f8cf6ffff                   jg         0x7f959be5befd
00a71 4c8bc2                         mov        r8, rdx
00a74 e9aaf6ffff                     jmp        0x7f959be5bf23
00a79 8d53ff                         lea        edx, [rbx - 1]
00a7c 85d2                           test       edx, edx
00a7e 0f8cd9000000                   jl         0x7f959be5c95d
00a84 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00a89 443bc0                         cmp        r8d, eax
00a8c 0f83e6100000                   jae        0x7f959be5d978
00a92 4c63c2                         movsxd     r8, edx
00a95 4c03c1                         add        r8, rcx
00a98 4c3bc5                         cmp        r8, rbp
00a9b 0f83d7100000                   jae        0x7f959be5d978
00aa1 85d2                           test       edx, edx
00aa3 0f8e7f110000                   jle        0x7f959be5da28
00aa9 448d4bfe                       lea        r9d, [rbx - 2]
00aad 33ff                           xor        edi, edi
00aaf 448bc2                         mov        r8d, edx
00ab2 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00ab7 4c8b6c2438                     mov        r13, qword ptr [rsp + 0x38]
00abc 4f0fb66c0508                   movzx      r13, byte ptr [r13 + r8 + 8]
00ac2 48c1e708                       shl        rdi, 8
00ac6 4c0bef                         or         r13, rdi
00ac9 ffca                           dec        edx
00acb 413bd1                         cmp        edx, r9d
00ace 7e05                           jle        0x7f959be5c8d5
00ad0 498bfd                         mov        rdi, r13
00ad3 ebda                           jmp        0x7f959be5c8af
00ad5 83fa02                         cmp        edx, 2
00ad8 7e72                           jle        0x7f959be5c94c
00ada 893424                         mov        dword ptr [rsp], esi
00add 666690                         nop        
00ae0 49c1e508                       shl        r13, 8
00ae4 448bca                         mov        r9d, edx
00ae7 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00aec 8bfa                           mov        edi, edx
00aee 037c2440                       add        edi, dword ptr [rsp + 0x40]
00af2 4863ff                         movsxd     rdi, edi
00af5 458d41fe                       lea        r8d, [r9 - 2]
00af9 488b742438                     mov        rsi, qword ptr [rsp + 0x38]
00afe 4a0fb6740608                   movzx      rsi, byte ptr [rsi + r8 + 8]
00b04 4183c1fd                       add        r9d, -3
00b08 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00b0d 4f0fb6440808                   movzx      r8, byte ptr [r8 + r9 + 8]
00b13 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
00b18 4d0fb64c3907                   movzx      r9, byte ptr [r9 + rdi + 7]
00b1e 4c8b742438                     mov        r14, qword ptr [rsp + 0x38]
00b23 490fb67c3e08                   movzx      rdi, byte ptr [r14 + rdi + 8]
00b29 4c0bef                         or         r13, rdi
00b2c 49c1e508                       shl        r13, 8
00b30 4d0be9                         or         r13, r9
00b33 49c1e508                       shl        r13, 8
00b37 4c0bee                         or         r13, rsi
00b3a 49c1e508                       shl        r13, 8
00b3e 4d0be8                         or         r13, r8
00b41 83c2fc                         add        edx, -4
00b44 83fa02                         cmp        edx, 2
00b47 7f97                           jg         0x7f959be5c8e0
00b49 8b3424                         mov        esi, dword ptr [rsp]
00b4c 83faff                         cmp        edx, -1
00b4f 0f8f53f5ffff                   jg         0x7f959be5bea8
00b55 4d8bc5                         mov        r8, r13
00b58 e971f5ffff                     jmp        0x7f959be5bece
00b5d 4533c0                         xor        r8d, r8d
00b60 e969f5ffff                     jmp        0x7f959be5bece
00b65 4533c0                         xor        r8d, r8d
00b68 e9b6f5ffff                     jmp        0x7f959be5bf23
00b6d bee4ffffff                     mov        esi, 0xffffffe4
00b72 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00b77 891424                         mov        dword ptr [rsp], edx
00b7a 894c2404                       mov        dword ptr [rsp + 4], ecx
00b7e 4c89442408                     mov        qword ptr [rsp + 8], r8
00b83 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00b88 897c2418                       mov        dword ptr [rsp + 0x18], edi
00b8c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00b91 6690                           nop        
00b93 e8c86cb6ff                     call       0x7f959b9c3660
00b98 0f1f8400900c0000               nop        dword ptr [rax + rax + 0xc90]
00ba0 be6effffff                     mov        esi, 0xffffff6e
00ba5 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00baa 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00baf 44891c24                       mov        dword ptr [rsp], r11d
00bb3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00bb8 4489542404                     mov        dword ptr [rsp + 4], r10d
00bbd 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00bc2 4c89542408                     mov        qword ptr [rsp + 8], r10
00bc7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00bcc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00bd1 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00bd9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00bde 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00be3 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00be8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00bed 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00bf2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00bf7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00bfc 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00c01 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00c06 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00c0b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00c10 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00c15 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00c1a 90                             nop        
00c1b e8406cb6ff                     call       0x7f959b9c3660
00c20 0f1f8400180d0001               nop        dword ptr [rax + rax + 0x1000d18]
00c28 448bd6                         mov        r10d, esi
00c2b 458bde                         mov        r11d, r14d
00c2e e91dfbffff                     jmp        0x7f959be5c550
00c33 4533db                         xor        r11d, r11d
00c36 493bcb                         cmp        rcx, r11
00c39 bdffffffff                     mov        ebp, 0xffffffff
00c3e 7c08                           jl         0x7f959be5ca48
00c40 400f95c5                       setne      bpl
00c44 400fb6ed                       movzx      ebp, bpl
00c48 be45ffffff                     mov        esi, 0xffffff45
00c4d 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
00c52 4c891c24                       mov        qword ptr [rsp], r11
00c56 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
00c5b 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c60 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00c65 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c6a 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00c72 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c77 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c7c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00c81 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00c86 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00c8b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c90 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00c95 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
00c9a 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00c9f 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00ca4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ca9 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
00cae 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00cb3 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00cb8 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cbd 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00cc5 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00ccd 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00cd2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
00cda 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ce2 458bd1                         mov        r10d, r9d
00ce5 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00ced 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
00cf5 6690                           nop        
00cf7 e8646bb6ff                     call       0x7f959b9c3660
00cfc 0f1f8400f40d0002               nop        dword ptr [rax + rax + 0x2000df4]
00d04 be45ffffff                     mov        esi, 0xffffff45
00d09 418beb                         mov        ebp, r11d
00d0c 666690                         nop        
00d0f e84c6bb6ff                     call       0x7f959b9c3660
00d14 0f1f84000c0e0003               nop        dword ptr [rax + rax + 0x3000e0c]
00d1c be45ffffff                     mov        esi, 0xffffff45
00d21 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
00d26 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00d2a 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00d2f 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00d34 897c2420                       mov        dword ptr [rsp + 0x20], edi
00d38 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d3d 89542428                       mov        dword ptr [rsp + 0x28], edx
00d41 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00d46 8954242c                       mov        dword ptr [rsp + 0x2c], edx
00d4a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00d4e 90                             nop        
00d4f e80c6bb6ff                     call       0x7f959b9c3660
00d54 0f1f84004c0e0004               nop        dword ptr [rax + rax + 0x4000e4c]
00d5c 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00d60 83c5f8                         add        ebp, -8
00d63 be45ffffff                     mov        esi, 0xffffff45
00d68 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00d6d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d72 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d77 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00d7c 666690                         nop        
00d7f e8dc6ab6ff                     call       0x7f959b9c3660
00d84 0f1f84007c0e0005               nop        dword ptr [rax + rax + 0x5000e7c]
00d8c be45ffffff                     mov        esi, 0xffffff45
00d91 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00d96 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00d9b 44891c24                       mov        dword ptr [rsp], r11d
00d9f 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00da4 4489442404                     mov        dword ptr [rsp + 4], r8d
00da9 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00dae 4c895c2408                     mov        qword ptr [rsp + 8], r11
00db3 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00db8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00dbd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dc2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00dc7 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00dcc 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00dd1 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00dd6 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00ddb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00de0 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00de5 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dea 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00dee 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00df2 90                             nop        
00df3 e8686ab6ff                     call       0x7f959b9c3660
00df8 0f1f8400f00e0006               nop        dword ptr [rax + rax + 0x6000ef0]
00e00 be45ffffff                     mov        esi, 0xffffff45
00e05 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00e0a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00e0f 44890424                       mov        dword ptr [rsp], r8d
00e13 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e18 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e1d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00e22 4c895c2408                     mov        qword ptr [rsp + 8], r11
00e27 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00e2c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00e31 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00e36 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00e3b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00e40 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00e45 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00e4a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00e4f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e54 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00e59 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e5e 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00e63 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00e68 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00e6c 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00e70 666690                         nop        
00e73 e8e869b6ff                     call       0x7f959b9c3660
00e78 0f1f8400700f0007               nop        dword ptr [rax + rax + 0x7000f70]
00e80 be45ffffff                     mov        esi, 0xffffff45
00e85 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00e8a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00e8f 44890424                       mov        dword ptr [rsp], r8d
00e93 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e98 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e9d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00ea2 4c895c2408                     mov        qword ptr [rsp + 8], r11
00ea7 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00eac 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00eb1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00eb6 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00ebb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00ec0 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00ec5 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00eca 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00ecf 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ed4 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00ed9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ede 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00ee3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00ee8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00eed 48894c2448                     mov        qword ptr [rsp + 0x48], rcx
00ef2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ef7 e86469b6ff                     call       0x7f959b9c3660
00efc 0f1f8400f40f0008               nop        dword ptr [rax + rax + 0x8000ff4]
00f04 be45ffffff                     mov        esi, 0xffffff45
00f09 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00f0e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f13 44891424                       mov        dword ptr [rsp], r10d
00f17 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f1c 4489542404                     mov        dword ptr [rsp + 4], r10d
00f21 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f26 4c89542408                     mov        qword ptr [rsp + 8], r10
00f2b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f30 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f35 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f3a 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00f3f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f44 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f49 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00f4e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00f53 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00f58 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f5d 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00f62 90                             nop        
00f63 e8f868b6ff                     call       0x7f959b9c3660
00f68 0f1f840060100009               nop        dword ptr [rax + rax + 0x9001060]
00f70 be45ffffff                     mov        esi, 0xffffff45
00f75 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00f7a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f7f 44891424                       mov        dword ptr [rsp], r10d
00f83 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00f88 44894c2404                     mov        dword ptr [rsp + 4], r9d
00f8d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f92 4c89542408                     mov        qword ptr [rsp + 8], r10
00f97 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f9c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fa1 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00fa6 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
00fab 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fb0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00fb5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fba 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00fbf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00fc4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fc9 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
00fce 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00fd3 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00fd8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00fdd 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
00fe2 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00fe7 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00fec 4489442458                     mov        dword ptr [rsp + 0x58], r8d
00ff1 6690                           nop        
00ff3 e86868b6ff                     call       0x7f959b9c3660
00ff8 0f1f8400f010000a               nop        dword ptr [rax + rax + 0xa0010f0]
01000 be45ffffff                     mov        esi, 0xffffff45
01005 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0100a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0100f 44891c24                       mov        dword ptr [rsp], r11d
01013 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01018 4489542404                     mov        dword ptr [rsp + 4], r10d
0101d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01022 4c89542408                     mov        qword ptr [rsp + 8], r10
01027 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0102c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01031 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01036 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0103b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01040 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01045 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0104a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0104f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01054 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01059 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
0105e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01063 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01068 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0106d 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01072 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01077 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0107c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01081 48894c2458                     mov        qword ptr [rsp + 0x58], rcx
01086 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0108b e8d067b6ff                     call       0x7f959b9c3660
01090 0f1f84008811000b               nop        dword ptr [rax + rax + 0xb001188]
01098 be45ffffff                     mov        esi, 0xffffff45
0109d 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
010a2 498be9                         mov        rbp, r9
010a5 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
010a9 890c24                         mov        dword ptr [rsp], ecx
010ac 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
010b0 894c2404                       mov        dword ptr [rsp + 4], ecx
010b4 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
010b9 4c894c2408                     mov        qword ptr [rsp + 8], r9
010be 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
010c3 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
010c8 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
010cc 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
010d0 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
010d5 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
010da 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
010df 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
010e4 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
010e8 894c2424                       mov        dword ptr [rsp + 0x24], ecx
010ec 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
010f1 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
010f6 8b4c2444                       mov        ecx, dword ptr [rsp + 0x44]
010fa 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
010fe 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
01102 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01106 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
0110b 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01110 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
01114 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01118 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0111d 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01122 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01126 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
0112a 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
0112f 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01134 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
01139 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0113e 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01146 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
0114b 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01150 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01155 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0115d 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01165 6690                           nop        
01167 e8f466b6ff                     call       0x7f959b9c3660
0116c 0f1f84006412000c               nop        dword ptr [rax + rax + 0xc001264]
01174 be45ffffff                     mov        esi, 0xffffff45
01179 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0117e 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01183 44890c24                       mov        dword ptr [rsp], r9d
01187 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0118c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01191 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01196 4c894c2408                     mov        qword ptr [rsp + 8], r9
0119b 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
011a0 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
011a5 8b8c2488000000                 mov        ecx, dword ptr [rsp + 0x88]
011ac 894c2418                       mov        dword ptr [rsp + 0x18], ecx
011b0 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
011b5 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
011ba 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
011bf 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
011c4 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
011c9 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
011ce 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
011d3 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
011d8 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
011dc 894c2438                       mov        dword ptr [rsp + 0x38], ecx
011e0 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
011e5 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
011ea 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
011ee 894c2440                       mov        dword ptr [rsp + 0x40], ecx
011f2 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
011f7 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
011fc 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
01200 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01204 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01208 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0120c 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01211 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
01216 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
0121b 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01220 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
01225 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0122a 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01232 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
01237 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0123c 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01241 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
01249 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01250 666690                         nop        
01253 e80866b6ff                     call       0x7f959b9c3660
01258 0f1f84005013000d               nop        dword ptr [rax + rax + 0xd001350]
01260 be45ffffff                     mov        esi, 0xffffff45
01265 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0126a 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0126e 890c24                         mov        dword ptr [rsp], ecx
01271 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
01275 894c2404                       mov        dword ptr [rsp + 4], ecx
01279 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
0127e 4c894c2408                     mov        qword ptr [rsp + 8], r9
01283 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
01288 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
0128d 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
01295 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
0129a 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
0129e 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
012a2 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
012a7 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
012ac 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
012b1 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
012b6 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
012ba 894c2424                       mov        dword ptr [rsp + 0x24], ecx
012be 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
012c3 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
012c8 8b4c2444                       mov        ecx, dword ptr [rsp + 0x44]
012cc 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
012d0 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
012d5 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
012da 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
012de 894c2444                       mov        dword ptr [rsp + 0x44], ecx
012e2 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
012e7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
012ec 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
012f1 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012f6 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
012fa 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
012fe 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
01303 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01308 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
0130d 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01312 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0131a 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
0131f 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01324 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01329 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
01331 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01338 666690                         nop        
0133b e82065b6ff                     call       0x7f959b9c3660
01340 0f1f84003814000e               nop        dword ptr [rax + rax + 0xe001438]
01348 be45ffffff                     mov        esi, 0xffffff45
0134d 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
01352 498be9                         mov        rbp, r9
01355 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
0135a 44890c24                       mov        dword ptr [rsp], r9d
0135e 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
01362 895c2404                       mov        dword ptr [rsp + 4], ebx
01366 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
0136b 4c894c2408                     mov        qword ptr [rsp + 8], r9
01370 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
01375 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
0137a 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01381 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01385 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0138a 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0138f 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01394 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
01399 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
0139e 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
013a3 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
013a8 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
013ad 8b5c2458                       mov        ebx, dword ptr [rsp + 0x58]
013b1 895c2438                       mov        dword ptr [rsp + 0x38], ebx
013b5 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
013ba 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
013bf 8b5c2450                       mov        ebx, dword ptr [rsp + 0x50]
013c3 895c2440                       mov        dword ptr [rsp + 0x40], ebx
013c7 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
013cc 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
013d1 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
013d5 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
013d9 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
013e1 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
013e6 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
013ea 895c2454                       mov        dword ptr [rsp + 0x54], ebx
013ee 48894424f8                     mov        qword ptr [rsp - 8], rax
013f3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
013f7 89442460                       mov        dword ptr [rsp + 0x60], eax
013fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01400 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01408 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
0140d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01412 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0141a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01422 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01429 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01430 666690                         nop        
01433 e82864b6ff                     call       0x7f959b9c3660
01438 0f1f84003015000f               nop        dword ptr [rax + rax + 0xf001530]
01440 be45ffffff                     mov        esi, 0xffffff45
01445 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0144a 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
0144f 44890c24                       mov        dword ptr [rsp], r9d
01453 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01458 44894c2404                     mov        dword ptr [rsp + 4], r9d
0145d 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01462 4c894c2408                     mov        qword ptr [rsp + 8], r9
01467 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
0146c 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01471 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01478 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0147c 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01481 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01486 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0148b 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
01490 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
01495 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
0149a 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
0149f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
014a4 8b5c2458                       mov        ebx, dword ptr [rsp + 0x58]
014a8 895c2438                       mov        dword ptr [rsp + 0x38], ebx
014ac 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
014b1 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
014b6 8b5c2450                       mov        ebx, dword ptr [rsp + 0x50]
014ba 895c2440                       mov        dword ptr [rsp + 0x40], ebx
014be 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
014c3 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
014c8 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
014cc 895c2448                       mov        dword ptr [rsp + 0x48], ebx
014d0 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
014d8 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
014dd 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
014e1 895c2458                       mov        dword ptr [rsp + 0x58], ebx
014e5 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
014ea 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
014ef 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
014f4 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
014f9 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
014fe 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01503 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0150b 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
01510 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01515 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0151a 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
01522 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
0152a 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01531 6690                           nop        
01533 e82863b6ff                     call       0x7f959b9c3660
01538 0f1f840030160010               nop        dword ptr [rax + rax + 0x10001630]
01540 be45ffffff                     mov        esi, 0xffffff45
01545 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0154a 8b5c242c                       mov        ebx, dword ptr [rsp + 0x2c]
0154e 891c24                         mov        dword ptr [rsp], ebx
01551 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
01555 895c2404                       mov        dword ptr [rsp + 4], ebx
01559 488b4c2410                     mov        rcx, qword ptr [rsp + 0x10]
0155e 48894c2408                     mov        qword ptr [rsp + 8], rcx
01563 488b4c2418                     mov        rcx, qword ptr [rsp + 0x18]
01568 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
0156d 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
01571 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01575 488b4c2448                     mov        rcx, qword ptr [rsp + 0x48]
0157a 48894c2428                     mov        qword ptr [rsp + 0x28], rcx
0157f 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
01583 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01587 8b5c2444                       mov        ebx, dword ptr [rsp + 0x44]
0158b 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0158f 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
01593 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01597 8b5c2454                       mov        ebx, dword ptr [rsp + 0x54]
0159b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0159f 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
015a3 894c2440                       mov        dword ptr [rsp + 0x40], ecx
015a7 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
015ab 894c2450                       mov        dword ptr [rsp + 0x50], ecx
015af 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
015b3 895c2454                       mov        dword ptr [rsp + 0x54], ebx
015b7 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
015bc 48894c2458                     mov        qword ptr [rsp + 0x58], rcx
015c1 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
015c6 48894c2460                     mov        qword ptr [rsp + 0x60], rcx
015cb 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
015d3 48894c2468                     mov        qword ptr [rsp + 0x68], rcx
015d8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
015dd 4489442474                     mov        dword ptr [rsp + 0x74], r8d
015e2 4489542478                     mov        dword ptr [rsp + 0x78], r10d
015e7 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
015ef e86c62b6ff                     call       0x7f959b9c3660
015f4 0f1f8400ec160011               nop        dword ptr [rax + rax + 0x110016ec]
015fc be45ffffff                     mov        esi, 0xffffff45
01601 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01606 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
0160a 890c24                         mov        dword ptr [rsp], ecx
0160d 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
01611 894c2404                       mov        dword ptr [rsp + 4], ecx
01615 488b4c2410                     mov        rcx, qword ptr [rsp + 0x10]
0161a 48894c2408                     mov        qword ptr [rsp + 8], rcx
0161f 488b4c2418                     mov        rcx, qword ptr [rsp + 0x18]
01624 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
01629 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01630 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01634 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
01638 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0163c 488b4c2430                     mov        rcx, qword ptr [rsp + 0x30]
01641 48894c2428                     mov        qword ptr [rsp + 0x28], rcx
01646 488b4c2448                     mov        rcx, qword ptr [rsp + 0x48]
0164b 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
01650 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
01654 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01658 8b5c2458                       mov        ebx, dword ptr [rsp + 0x58]
0165c 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01660 8b4c2444                       mov        ecx, dword ptr [rsp + 0x44]
01664 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01668 8b5c2450                       mov        ebx, dword ptr [rsp + 0x50]
0166c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01670 8b4c2454                       mov        ecx, dword ptr [rsp + 0x54]
01674 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01678 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
0167c 895c2448                       mov        dword ptr [rsp + 0x48], ebx
01680 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
01687 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
0168b 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0168f 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01693 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01697 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
0169b 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
016a0 48894c2460                     mov        qword ptr [rsp + 0x60], rcx
016a5 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
016aa 48894c2468                     mov        qword ptr [rsp + 0x68], rcx
016af 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
016b7 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
016bc 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
016c1 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016c6 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
016ce 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
016d6 90                             nop        
016d7 e88461b6ff                     call       0x7f959b9c3660
016dc 0f1f8400d4170012               nop        dword ptr [rax + rax + 0x120017d4]
016e4 be45ffffff                     mov        esi, 0xffffff45
016e9 418bea                         mov        ebp, r10d
016ec 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016f1 4c891424                       mov        qword ptr [rsp], r10
016f5 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
016fa 44894c2408                     mov        dword ptr [rsp + 8], r9d
016ff 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01704 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01709 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01711 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01716 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0171b 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01720 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01725 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0172a 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
0172f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01734 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01739 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0173e 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
01743 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01748 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0174d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01752 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01757 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0175c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01764 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01769 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01771 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01776 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0177e 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
01786 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0178e 90                             nop        
0178f e8cc60b6ff                     call       0x7f959b9c3660
01794 0f1f84008c180013               nop        dword ptr [rax + rax + 0x1300188c]
0179c be45ffffff                     mov        esi, 0xffffff45
017a1 418bc8                         mov        ecx, r8d
017a4 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
017ab 418bea                         mov        ebp, r10d
017ae 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
017b3 4c891424                       mov        qword ptr [rsp], r10
017b7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017bc 4489542408                     mov        dword ptr [rsp + 8], r10d
017c1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
017c6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017cb 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
017d3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
017d8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017dd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017e2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
017e7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017ec 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
017f1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017f6 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
017fb 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01800 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01805 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0180a 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
0180f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01814 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01819 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0181e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01826 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0182b 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
01833 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0183b e82060b6ff                     call       0x7f959b9c3660
01840 0f1f840038190014               nop        dword ptr [rax + rax + 0x14001938]
01848 be45ffffff                     mov        esi, 0xffffff45
0184d 41bbffffff7f                   mov        r11d, 0x7fffffff
01853 493bcb                         cmp        rcx, r11
01856 bdffffffff                     mov        ebp, 0xffffffff
0185b 7c08                           jl         0x7f959be5d665
0185d 400f95c5                       setne      bpl
01861 400fb6ed                       movzx      ebp, bpl
01865 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
0186a 4c891c24                       mov        qword ptr [rsp], r11
0186e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01873 44895c2408                     mov        dword ptr [rsp + 8], r11d
01878 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0187d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01882 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0188a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0188f 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01894 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01899 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0189e 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
018a3 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
018a8 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
018ad 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
018b2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
018b7 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
018bc 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
018c1 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
018c6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018cb 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
018d0 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
018d5 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
018dd 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
018e2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
018ea 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
018ef 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
018f7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
018ff 48898c2490000000               mov        qword ptr [rsp + 0x90], rcx
01907 e8545fb6ff                     call       0x7f959b9c3660
0190c 0f1f8400041a0015               nop        dword ptr [rax + rax + 0x15001a04]
01914 be45ffffff                     mov        esi, 0xffffff45
01919 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0191e 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01923 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01928 44895c2404                     mov        dword ptr [rsp + 4], r11d
0192d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01932 4c895c2408                     mov        qword ptr [rsp + 8], r11
01937 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0193c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01941 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01946 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0194b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01950 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01955 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0195a 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0195f 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01964 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01969 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0196e 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01973 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01978 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
0197d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01982 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01987 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0198c 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01991 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01996 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0199b 4489442458                     mov        dword ptr [rsp + 0x58], r8d
019a0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
019a5 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
019aa 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
019af 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
019b4 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
019b9 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
019be 4489542478                     mov        dword ptr [rsp + 0x78], r10d
019c3 e8985eb6ff                     call       0x7f959b9c3660
019c8 0f1f8400c01a0016               nop        dword ptr [rax + rax + 0x16001ac0]
019d0 be45ffffff                     mov        esi, 0xffffff45
019d5 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
019da 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019df 44891424                       mov        dword ptr [rsp], r10d
019e3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019e8 44895c2404                     mov        dword ptr [rsp + 4], r11d
019ed 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019f2 4c89542408                     mov        qword ptr [rsp + 8], r10
019f7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019fc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a01 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a06 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01a0b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a10 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a15 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a1a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a1f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a24 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a29 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01a2e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a33 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01a38 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a3d 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01a42 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a47 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a4c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a51 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a56 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a5b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a60 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a65 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a6a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a6f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a74 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a79 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01a7e 90                             nop        
01a7f e8dc5db6ff                     call       0x7f959b9c3660
01a84 0f1f84007c1b0017               nop        dword ptr [rax + rax + 0x17001b7c]
01a8c be3dffffff                     mov        esi, 0xffffff3d
01a91 8be9                           mov        ebp, ecx
01a93 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01a98 4c891c24                       mov        qword ptr [rsp], r11
01a9c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01aa1 44895c2408                     mov        dword ptr [rsp + 8], r11d
01aa6 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01aab 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ab0 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ab8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01abd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ac2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ac7 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01acc 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01ad1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01ad6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01adb 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
01ae0 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01ae5 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01aea 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01aef 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01af4 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01af9 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01afe 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01b03 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01b0b 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01b13 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01b18 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
01b20 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01b28 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01b30 666690                         nop        
01b33 e8285db6ff                     call       0x7f959b9c3660
01b38 0f1f8400301c0018               nop        dword ptr [rax + rax + 0x18001c30]
01b40 4d3bda                         cmp        r11, r10
01b43 bdffffffff                     mov        ebp, 0xffffffff
01b48 7c08                           jl         0x7f959be5d952
01b4a 400f95c5                       setne      bpl
01b4e 400fb6ed                       movzx      ebp, bpl
01b52 be45ffffff                     mov        esi, 0xffffff45
01b57 e8045db6ff                     call       0x7f959b9c3660
01b5c 0f1f8400541c0019               nop        dword ptr [rax + rax + 0x19001c54]
01b64 be45ffffff                     mov        esi, 0xffffff45
01b69 6690                           nop        
01b6b e8f05cb6ff                     call       0x7f959b9c3660
01b70 0f1f8400681c001a               nop        dword ptr [rax + rax + 0x1a001c68]
01b78 be6effffff                     mov        esi, 0xffffff6e
01b7d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01b82 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01b87 44890424                       mov        dword ptr [rsp], r8d
01b8b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01b90 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b95 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b9a 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01b9f 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01ba4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ba9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bae 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01bb2 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01bb7 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01bbb e8a05cb6ff                     call       0x7f959b9c3660
01bc0 0f1f8400b81c001b               nop        dword ptr [rax + rax + 0x1b001cb8]
01bc8 be6effffff                     mov        esi, 0xffffff6e
01bcd 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01bd2 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01bd7 44890424                       mov        dword ptr [rsp], r8d
01bdb 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01be0 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01be5 4c895c2408                     mov        qword ptr [rsp + 8], r11
01bea 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01bef 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01bf4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01bf9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bfe 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c03 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c08 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c0d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01c12 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01c17 897c2444                       mov        dword ptr [rsp + 0x44], edi
01c1b e8405cb6ff                     call       0x7f959b9c3660
01c20 0f1f8400181d001c               nop        dword ptr [rax + rax + 0x1c001d18]
01c28 be66ffffff                     mov        esi, 0xffffff66
01c2d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01c32 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c37 44891c24                       mov        dword ptr [rsp], r11d
01c3b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01c40 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c45 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c4a 4c895c2408                     mov        qword ptr [rsp + 8], r11
01c4f 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01c54 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c59 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c5e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c63 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01c67 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01c6b e8f05bb6ff                     call       0x7f959b9c3660
01c70 0f1f8400681d001d               nop        dword ptr [rax + rax + 0x1d001d68]
01c78 be66ffffff                     mov        esi, 0xffffff66
01c7d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01c82 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c87 44891c24                       mov        dword ptr [rsp], r11d
01c8b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01c90 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c95 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c9a 4c895c2408                     mov        qword ptr [rsp + 8], r11
01c9f 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01ca4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01ca9 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01cae 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cb3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01cb8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cbd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cc2 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01cc7 897c2444                       mov        dword ptr [rsp + 0x44], edi
01ccb e8905bb6ff                     call       0x7f959b9c3660
01cd0 0f1f8400c81d001e               nop        dword ptr [rax + rax + 0x1e001dc8]
01cd8 bef6ffffff                     mov        esi, 0xfffffff6
01cdd 418beb                         mov        ebp, r11d
01ce0 666690                         nop        
01ce3 e8785bb6ff                     call       0x7f959b9c3660
01ce8 0f1f8400e01d001f               nop        dword ptr [rax + rax + 0x1f001de0]
01cf0 bef6ffffff                     mov        esi, 0xfffffff6
01cf5 6690                           nop        
01cf7 e8645bb6ff                     call       0x7f959b9c3660
01cfc 0f1f8400f41d0020               nop        dword ptr [rax + rax + 0x20001df4]
01d04 bef6ffffff                     mov        esi, 0xfffffff6
01d09 6690                           nop        
01d0b e8505bb6ff                     call       0x7f959b9c3660
01d10 0f1f8400081e0021               nop        dword ptr [rax + rax + 0x21001e08]
01d18 bef6ffffff                     mov        esi, 0xfffffff6
01d1d 6690                           nop        
01d1f e83c5bb6ff                     call       0x7f959b9c3660
01d24 0f1f84001c1e0022               nop        dword ptr [rax + rax + 0x22001e1c]
01d2c bef6ffffff                     mov        esi, 0xfffffff6
01d31 6690                           nop        
01d33 e8285bb6ff                     call       0x7f959b9c3660
01d38 0f1f8400301e0023               nop        dword ptr [rax + rax + 0x23001e30]
01d40 bef6ffffff                     mov        esi, 0xfffffff6
01d45 6690                           nop        
01d47 e8145bb6ff                     call       0x7f959b9c3660
01d4c 0f1f8400441e0024               nop        dword ptr [rax + rax + 0x24001e44]
01d54 bef6ffffff                     mov        esi, 0xfffffff6
01d59 6690                           nop        
01d5b e8005bb6ff                     call       0x7f959b9c3660
01d60 0f1f8400581e0025               nop        dword ptr [rax + rax + 0x25001e58]
01d68 bef6ffffff                     mov        esi, 0xfffffff6
01d6d 6690                           nop        
01d6f e8ec5ab6ff                     call       0x7f959b9c3660
01d74 0f1f84006c1e0026               nop        dword ptr [rax + rax + 0x26001e6c]
01d7c bef6ffffff                     mov        esi, 0xfffffff6
01d81 6690                           nop        
01d83 e8d85ab6ff                     call       0x7f959b9c3660
01d88 0f1f8400801e0027               nop        dword ptr [rax + rax + 0x27001e80]
01d90 49ba8cc7e59b957f0000           movabs     r10, 0x7f959be5c78c
01d9a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01da1 e93a03aaff                     jmp        0x7f959b8fdee0
01da6 e8f5cea8ff                     call       0x7f959b8eaaa0
01dab e96ee2ffff                     jmp        0x7f959be5be1e
