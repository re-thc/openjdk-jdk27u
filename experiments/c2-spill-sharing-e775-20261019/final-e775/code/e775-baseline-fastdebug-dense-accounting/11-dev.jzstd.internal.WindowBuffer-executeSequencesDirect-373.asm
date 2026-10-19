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
0001a 0f85c03cb5ff                   jne        0x7f23ab72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f853a240000                   jne        0x7f23abbdd4f8
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 488bde                         mov        rbx, rsi
0004e 8b7638                         mov        esi, dword ptr [rsi + 0x38]
00051 448b5304                       mov        r10d, dword ptr [rbx + 4]
00055 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0005a 458bda                         mov        r11d, r10d
0005d 442bde                         sub        r11d, esi
00060 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00068 453bd3                         cmp        r10d, r11d
0006b 0f8ffb180000                   jg         0x7f23abbdc9ec
00071 488b6b08                       mov        rbp, qword ptr [rbx + 8]
00075 4c8b4320                       mov        r8, qword ptr [rbx + 0x20]
00079 4c639c24e0000000               movsxd     r11, dword ptr [rsp + 0xe0]
00081 4c63d6                         movsxd     r10, esi
00084 4c03d5                         add        r10, rbp
00087 4d2bc2                         sub        r8, r10
0008a 4d3bd8                         cmp        r11, r8
0008d 0f8fd9180000                   jg         0x7f23abbdc9ec
00093 4c8b7310                       mov        r14, qword ptr [rbx + 0x10]
00097 4c8b6b28                       mov        r13, qword ptr [rbx + 0x28]
0009b 4d85ed                         test       r13, r13
0009e 0f84e4110000                   je         0x7f23abbdc308
000a4 33c9                           xor        ecx, ecx
000a6 4c8bda                         mov        r11, rdx
000a9 8b5204                         mov        edx, dword ptr [rdx + 4]
000ac 8b4340                         mov        eax, dword ptr [rbx + 0x40]
000af 448bc7                         mov        r8d, edi
000b2 85ff                           test       edi, edi
000b4 0f8eee160000                   jle        0x7f23abbdc828
000ba 89742414                       mov        dword ptr [rsp + 0x14], esi
000be 4c2bed                         sub        r13, rbp
000c1 448d4ae0                       lea        r9d, [rdx - 0x20]
000c5 8b7c2454                       mov        edi, dword ptr [rsp + 0x54]
000c9 83c7e0                         add        edi, -0x20
000cc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d1 418b7204                       mov        esi, dword ptr [r10 + 4]
000d5 85f6                           test       esi, esi
000d7 0f86d7180000                   jbe        0x7f23abbdca34
000dd 897c2420                       mov        dword ptr [rsp + 0x20], edi
000e1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
000e6 89442410                       mov        dword ptr [rsp + 0x10], eax
000ea 89542438                       mov        dword ptr [rsp + 0x38], edx
000ee 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000f3 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f8 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
000fd 4489442404                     mov        dword ptr [rsp + 4], r8d
00102 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0010a 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
0010f 4c63d6                         movsxd     r10, esi
00112 4d63d8                         movsxd     r11, r8d
00115 49ffcb                         dec        r11
00118 4d3bda                         cmp        r11, r10
0011b 0f8377180000                   jae        0x7f23abbdca18
00121 85c9                           test       ecx, ecx
00123 0f847e180000                   je         0x7f23abbdca27
00129 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00131 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00135 4585db                         test       r11d, r11d
00138 0f86d7180000                   jbe        0x7f23abbdca95
0013e 4183fb01                       cmp        r11d, 1
00142 0f86cd180000                   jbe        0x7f23abbdca95
00148 4183fb02                       cmp        r11d, 2
0014c 0f86c3180000                   jbe        0x7f23abbdca95
00152 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0015a 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0015e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00163 448b5804                       mov        r11d, dword ptr [rax + 4]
00167 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0016f 448d5af1                       lea        r11d, [rdx - 0xf]
00173 4585db                         test       r11d, r11d
00176 0f8c04190000                   jl         0x7f23abbdcb00
0017c 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00184 4183c2f1                       add        r10d, -0xf
00188 4585d2                         test       r10d, r10d
0018b 0f8cf6180000                   jl         0x7f23abbdcb07
00191 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00199 4183c3f9                       add        r11d, -7
0019d 4585db                         test       r11d, r11d
001a0 0f8ce8180000                   jl         0x7f23abbdcb0e
001a6 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
001ae 4489542440                     mov        dword ptr [rsp + 0x40], r10d
001b3 4c8bd0                         mov        r10, rax
001b6 4c89542448                     mov        qword ptr [rsp + 0x48], r10
001bb 4c63542440                     movsxd     r10, dword ptr [rsp + 0x40]
001c0 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001c8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
001cd 4183c3f1                       add        r11d, -0xf
001d1 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
001d6 4983c2f1                       add        r10, -0xf
001da 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001e2 448bd2                         mov        r10d, edx
001e5 458d42f1                       lea        r8d, [r10 - 0xf]
001e9 4489442450                     mov        dword ptr [rsp + 0x50], r8d
001ee 4d63d2                         movsxd     r10, r10d
001f1 4983c2f1                       add        r10, -0xf
001f5 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
001fd 4533d2                         xor        r10d, r10d
00200 33db                           xor        ebx, ebx
00202 e9cc010000                     jmp        0x7f23abbdb453
00207 4533db                         xor        r11d, r11d
0020a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0020f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00214 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
00218 4183f803                       cmp        r8d, 3
0021c 0f8e8f030000                   jle        0x7f23abbdb631
00222 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00227 41894b10                       mov        dword ptr [r11 + 0x10], ecx
0022b 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0022f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00234 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00238 448d5afd                       lea        r11d, [rdx - 3]
0023c 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00241 4d8bd8                         mov        r11, r8
00244 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00249 45894308                       mov        dword ptr [r11 + 8], r8d
0024d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00255 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
0025a 4c635c2414                     movsxd     r11, dword ptr [rsp + 0x14]
0025f 4c035c2418                     add        r11, qword ptr [rsp + 0x18]
00264 4c63442428                     movsxd     r8, dword ptr [rsp + 0x28]
00269 498bc8                         mov        rcx, r8
0026c 4d03d8                         add        r11, r8
0026f 4d3bd3                         cmp        r10, r11
00272 0f8fbc130000                   jg         0x7f23abbdc6b4
00278 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0027d 4585d2                         test       r10d, r10d
00280 0f8ede120000                   jle        0x7f23abbdc5e4
00286 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0028b 44036c2428                     add        r13d, dword ptr [rsp + 0x28]
00290 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00295 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0029a 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0029f 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
002a4 4503cd                         add        r9d, r13d
002a7 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002af 498d7c1a08                     lea        rdi, [r10 + rbx + 8]
002b4 448bd3                         mov        r10d, ebx
002b7 4403542428                     add        r10d, dword ptr [rsp + 0x28]
002bc 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
002c4 48636c242c                     movsxd     rbp, dword ptr [rsp + 0x2c]
002c9 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
002ce 0f8f120c0000                   jg         0x7f23abbdbf66
002d4 443b542424                     cmp        r10d, dword ptr [rsp + 0x24]
002d9 0f8fbd130000                   jg         0x7f23abbdc71c
002df 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
002e4 4183fb10                       cmp        r11d, 0x10
002e8 0f8f82010000                   jg         0x7f23abbdb4f0
002ee 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
002f2 0f83a0110000                   jae        0x7f23abbdc518
002f8 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00300 c4c17a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 8]
00307 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0030c 0f83de110000                   jae        0x7f23abbdc570
00312 4403db                         add        r11d, ebx
00315 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0031d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00322 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00329 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0032e 4503d0                         add        r10d, r8d
00331 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00336 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0033b 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00340 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00348 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0034d 4183fb10                       cmp        r11d, 0x10
00351 0f8fd1130000                   jg         0x7f23abbdc7a8
00357 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0035c 4183fa10                       cmp        r10d, 0x10
00360 0f8c4a030000                   jl         0x7f23abbdb730
00366 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0036e 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00373 0f834d100000                   jae        0x7f23abbdc446
00379 458bd3                         mov        r10d, r11d
0037c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00381 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00388 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0038d 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00392 0f8390100000                   jae        0x7f23abbdc4a8
00398 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0039d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
003a2 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003a9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
003ae 4503d0                         add        r10d, r8d
003b1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
003b6 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
003be 41ffc2                         inc        r10d
003c1 443b542404                     cmp        r10d, dword ptr [rsp + 4]
003c6 0f8d7b0d0000                   jge        0x7f23abbdc1c7
003cc 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
003d3 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003d8 4f8b5cd308                     mov        r11, qword ptr [r11 + r10*8 + 8]
003dd 4d8bc3                         mov        r8, r11
003e0 49c1e812                       shr        r8, 0x12
003e4 458bc0                         mov        r8d, r8d
003e7 4181e0ffff0300                 and        r8d, 0x3ffff
003ee 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003f3 4d8bc3                         mov        r8, r11
003f6 49c1f824                       sar        r8, 0x24
003fa 458bdb                         mov        r11d, r11d
003fd 458bc0                         mov        r8d, r8d
00400 418bd0                         mov        edx, r8d
00403 4181e3ffff0100                 and        r11d, 0x1ffff
0040a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0040f 4585c0                         test       r8d, r8d
00412 0f8c80110000                   jl         0x7f23abbdc618
00418 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0041d 4585db                         test       r11d, r11d
00420 0f84e1fdffff                   je         0x7f23abbdb287
00426 448b1c24                       mov        r11d, dword ptr [rsp]
0042a 442bdb                         sub        r11d, ebx
0042d 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00432 453bcb                         cmp        r9d, r11d
00435 0f8ed4fdffff                   jle        0x7f23abbdb28f
0043b be45ffffff                     mov        esi, 0xffffff45
00440 418be9                         mov        ebp, r9d
00443 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0044b 90                             nop        
0044c c5f877                         vzeroupper 
0044f e88c25afff                     call       0x7f23ab6cda60
00454 0f1f84004c050000               nop        dword ptr [rax + rax + 0x54c]
0045c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
00466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0046a e83197b319                     call       0x7f23c5714c20
0046f f4                             hlt        
00470 4183fb30                       cmp        r11d, 0x30
00474 0f8fa3070000                   jg         0x7f23abbdbc9d
0047a 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
0047e 0f8342130000                   jae        0x7f23abbdc846
00484 4c63cb                         movsxd     r9, ebx
00487 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0048f c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00496 443b442444                     cmp        r8d, dword ptr [rsp + 0x44]
0049b 0f838b130000                   jae        0x7f23abbdc8ac
004a1 458d5010                       lea        r10d, [r8 + 0x10]
004a5 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
004ad 4963c8                         movsxd     rcx, r8d
004b0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
004b5 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
004bc 453bd5                         cmp        r10d, r13d
004bf 0f8dd2000000                   jge        0x7f23abbdb617
004c5 4c2bc9                         sub        r9, rcx
004c8 4d63da                         movsxd     r11, r10d
004cb 4f8d140b                       lea        r10, [r11 + r9]
004cf 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004d7 0f83d7130000                   jae        0x7f23abbdc934
004dd 4d63d5                         movsxd     r10, r13d
004e0 4d2bd3                         sub        r10, r11
004e3 4983c20f                       add        r10, 0xf
004e7 4983e2f0                       and        r10, 0xfffffffffffffff0
004eb 458bd2                         mov        r10d, r10d
004ee 478d5c0210                     lea        r11d, [r10 + r8 + 0x10]
004f3 4d63d3                         movsxd     r10, r11d
004f6 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
004fb 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00503 0f83ab130000                   jae        0x7f23abbdc934
00509 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00511 443b5c2444                     cmp        r11d, dword ptr [rsp + 0x44]
00516 0f8398130000                   jae        0x7f23abbdc934
0051c 4983c2f0                       add        r10, -0x10
00520 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
00528 0f8386130000                   jae        0x7f23abbdc934
0052e 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00535 0f8fd5130000                   jg         0x7f23abbdc990
0053b 448bdb                         mov        r11d, ebx
0053e 452bd8                         sub        r11d, r8d
00541 90                             nop        
00542 90                             nop        
00543 90                             nop        
00544 90                             nop        
00545 90                             nop        
00546 90                             nop        
00547 90                             nop        
00548 90                             nop        
00549 90                             nop        
0054a 90                             nop        
0054b 90                             nop        
0054c 90                             nop        
0054d 90                             nop        
0054e 90                             nop        
0054f 90                             nop        
00550 458bd3                         mov        r10d, r11d
00553 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
0055b 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00563 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0056a 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00572 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00577 c4817a7f441108                 vmovdqu    xmmword ptr [r9 + r10 + 8], xmm0
0057e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00586 4183c210                       add        r10d, 0x10
0058a 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00592 453bd5                         cmp        r10d, r13d
00595 7cb9                           jl         0x7f23abbdb5d0
00597 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0059c 4403db                         add        r11d, ebx
0059f 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
005a7 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
005ac e985fdffff                     jmp        0x7f23abbdb3b6
005b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
005b6 4585db                         test       r11d, r11d
005b9 7407                           je         0x7f23abbdb642
005bb 458d58ff                       lea        r11d, [r8 - 1]
005bf 418bd3                         mov        edx, r11d
005c2 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005c7 458b4b08                       mov        r9d, dword ptr [r11 + 8]
005cb 85d2                           test       edx, edx
005cd 0f8472080000                   je         0x7f23abbdbec5
005d3 83fa03                         cmp        edx, 3
005d6 0f84290c0000                   je         0x7f23abbdc285
005dc 83fa02                         cmp        edx, 2
005df 0f878a000000                   ja         0x7f23abbdb6ef
005e5 3b9424e8000000                 cmp        edx, dword ptr [rsp + 0xe8]
005ec 0f83a6140000                   jae        0x7f23abbdcb18
005f2 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
005f7 458b4c9008                     mov        r9d, dword ptr [r8 + rdx*4 + 8]
005fc 85d2                           test       edx, edx
005fe 7f1b                           jg         0x7f23abbdb69b
00600 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00608 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0060d 45894a08                       mov        dword ptr [r10 + 8], r9d
00611 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00616 e93afcffff                     jmp        0x7f23abbdb2d5
0061b 448d42ff                       lea        r8d, [rdx - 1]
0061f 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00627 0f83d3160000                   jae        0x7f23abbdcd80
0062d 4863fa                         movsxd     rdi, edx
00630 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00635 458bc3                         mov        r8d, r11d
00638 4183c0cc                       add        r8d, -0x34
0063c 41c1e802                       shr        r8d, 2
00640 458d5c10ff                     lea        r11d, [r8 + rdx - 1]
00645 b904000000                     mov        ecx, 4
0064a c442f0f5db                     bzhi       r11, r11, rcx
0064f 492bfb                         sub        rdi, r11
00652 48ffcf                         dec        rdi
00655 4533db                         xor        r11d, r11d
00658 4885ff                         test       rdi, rdi
0065b 490f4cfb                       cmovl      rdi, r11
0065f 448bdf                         mov        r11d, edi
00662 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0066a e91c060000                     jmp        0x7f23abbdbd0b
0066f 48bea8b272e200000000           movabs     rsi, 0xe272b2a8
00679 8beb                           mov        ebp, ebx
0067b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
00683 90                             nop        
00684 c5f877                         vzeroupper 
00687 e85445b5ff                     call       0x7f23ab72fc60
0068c 0f1f840084070001               nop        dword ptr [rax + rax + 0x1000784]
00694 4885c0                         test       rax, rax
00697 0f8493140000                   je         0x7f23abbdcbb0
0069d 488bf0                         mov        rsi, rax
006a0 c5f877                         vzeroupper 
006a3 4881c4d0000000                 add        rsp, 0xd0
006aa 5d                             pop        rbp
006ab e930a4aeff                     jmp        0x7f23ab6c5b60
006b0 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
006b5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
006ba 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
006bf 0f8d8f020000                   jge        0x7f23abbdb9d4
006c5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
006ca 4183c208                       add        r10d, 8
006ce 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
006d6 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006db 4183fb08                       cmp        r11d, 8
006df 0f8d88010000                   jge        0x7f23abbdb8ed
006e5 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
006ed 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
006f5 0f8375180000                   jae        0x7f23abbdcff0
006fb 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00700 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
00706 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0070b 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00713 0f83e3180000                   jae        0x7f23abbdd07c
00719 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0071e 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00723 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0072b 4183c303                       add        r11d, 3
0072f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00734 41ffc2                         inc        r10d
00737 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0073f 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00747 0f83fb180000                   jae        0x7f23abbdd0c8
0074d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00752 4183c303                       add        r11d, 3
00756 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
0075e 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00763 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
00769 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00771 0f8331190000                   jae        0x7f23abbdd128
00777 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
0077c 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00781 470fbe44110a                   movsx      r8d, byte ptr [r9 + r10 + 0xa]
00787 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
0078c 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
00792 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
00797 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0079c 4183fb08                       cmp        r11d, 8
007a0 0f835a190000                   jae        0x7f23abbdd180
007a6 49bae8eb70e200000000           movabs     r10, 0xe270ebe8
007b0 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
007b8 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
007bd 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
007c2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007c7 4183fa04                       cmp        r10d, 4
007cb 7e3b                           jle        0x7f23abbdb888
007cd 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
007d1 83c504                         add        ebp, 4
007d4 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007d9 418bd1                         mov        edx, r9d
007dc c5f877                         vzeroupper 
007df e8fc43b5ff                     call       0x7f23ab72fc60
007e4 0f1f8400dc080002               nop        dword ptr [rax + rax + 0x20008dc]
007ec 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
007f1 8bd5                           mov        edx, ebp
007f3 8bc8                           mov        ecx, eax
007f5 90                             nop        
007f6 90                             nop        
007f7 90                             nop        
007f8 c5f877                         vzeroupper 
007fb e8e043b5ff                     call       0x7f23ab72fc60
00800 0f1f8400f8080003               nop        dword ptr [rax + rax + 0x30008f8]
00808 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0080d 4183fa08                       cmp        r10d, 8
00811 0f8e9ffbffff                   jle        0x7f23abbdb436
00817 49ba10ec70e200000000           movabs     r10, 0xe270ec10
00821 8b542428                       mov        edx, dword ptr [rsp + 0x28]
00825 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0082a 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
0082f 83c208                         add        edx, 8
00832 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00837 90                             nop        
00838 c5f877                         vzeroupper 
0083b e8a043b5ff                     call       0x7f23ab72fc60
00840 0f1f840038090004               nop        dword ptr [rax + rax + 0x4000938]
00848 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0084d 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00854 488bc8                         mov        rcx, rax
00857 90                             nop        
00858 c5f877                         vzeroupper 
0085b e88043b5ff                     call       0x7f23ab72fc60
00860 0f1f840058090005               nop        dword ptr [rax + rax + 0x5000958]
00868 e949fbffff                     jmp        0x7f23abbdb436
0086d 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00872 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00879 90                             nop        
0087a 90                             nop        
0087b 90                             nop        
0087c c5f877                         vzeroupper 
0087f e85c43b5ff                     call       0x7f23ab72fc60
00884 0f1f84007c090006               nop        dword ptr [rax + rax + 0x600097c]
0088c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00891 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00895 488bc8                         mov        rcx, rax
00898 c5f877                         vzeroupper 
0089b e84043b5ff                     call       0x7f23ab72fc60
008a0 0f1f840098090007               nop        dword ptr [rax + rax + 0x7000998]
008a8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
008b0 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
008b5 0f8dfbfaffff                   jge        0x7f23abbdb436
008bb 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
008c0 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
008c7 0f8e9b050000                   jle        0x7f23abbdbee8
008cd 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
008d5 4183c008                       add        r8d, 8
008d9 be66ffffff                     mov        esi, 0xffffff66
008de 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
008e6 448b1424                       mov        r10d, dword ptr [rsp]
008ea 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
008f2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
008f7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
008ff 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00904 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0090c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00911 4489542408                     mov        dword ptr [rsp + 8], r10d
00916 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0091b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00920 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
00925 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0092a 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0092f 90                             nop        
00930 c5f877                         vzeroupper 
00933 e8a820afff                     call       0x7f23ab6cda60
00938 0f1f8400300a0008               nop        dword ptr [rax + rax + 0x8000a30]
00940 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0094a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0094e e84d92b319                     call       0x7f23c5714c20
00953 f4                             hlt        
00954 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00959 4183fa30                       cmp        r10d, 0x30
0095d 0f8ffb010000                   jg         0x7f23abbdbbde
00963 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00967 83c5f9                         add        ebp, -7
0096a 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
0096e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00976 443bdd                         cmp        r11d, ebp
00979 0f8335120000                   jae        0x7f23abbdcc34
0097f 418beb                         mov        ebp, r11d
00982 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
00989 4863ed                         movsxd     rbp, ebp
0098c 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00994 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00999 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
0099e 4889ac24a8000000               mov        qword ptr [rsp + 0xa8], rbp
009a6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
009ab 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
009b0 0f8376120000                   jae        0x7f23abbdccac
009b6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
009bb 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
009c3 4963eb                         movsxd     rbp, r11d
009c6 4889ac24b8000000               mov        qword ptr [rsp + 0xb8], rbp
009ce 488d4d08                       lea        rcx, [rbp + 8]
009d2 48be28c122e200000000           movabs     rsi, 0xe222c128
009dc 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
009e1 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
009e9 4533c9                         xor        r9d, r9d
009ec c5f877                         vzeroupper 
009ef e8ec37b5ff                     call       0x7f23ab72f260
009f4 0f1f8400ec0a0009               nop        dword ptr [rax + rax + 0x9000aec]
009fc 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a04 4183c208                       add        r10d, 8
00a08 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00a10 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00a15 0f8d2f010000                   jge        0x7f23abbdbbca
00a1b 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00a23 482bac24b8000000               sub        rbp, qword ptr [rsp + 0xb8]
00a2b 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
00a33 4983c0f9                       add        r8, -7
00a37 4d63da                         movsxd     r11, r10d
00a3a 4d8d142b                       lea        r10, [r11 + rbp]
00a3e 4d3bd0                         cmp        r10, r8
00a41 0f839d130000                   jae        0x7f23abbdce64
00a47 4c63542414                     movsxd     r10, dword ptr [rsp + 0x14]
00a4c 4d2bd3                         sub        r10, r11
00a4f 4983c207                       add        r10, 7
00a53 4983e2f8                       and        r10, 0xfffffffffffffff8
00a57 458bd2                         mov        r10d, r10d
00a5a 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a62 478d5c1a08                     lea        r11d, [r10 + r11 + 8]
00a67 4d63db                         movsxd     r11, r11d
00a6a 4d8d542bf8                     lea        r10, [r11 + rbp - 8]
00a6f 4d3bd0                         cmp        r10, r8
00a72 0f836c130000                   jae        0x7f23abbdce64
00a78 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a80 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00a85 0f8359130000                   jae        0x7f23abbdce64
00a8b 4983c3f8                       add        r11, -8
00a8f 4d3bd8                         cmp        r11, r8
00a92 0f834c130000                   jae        0x7f23abbdce64
00a98 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00a9d 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00aa4 0f8fd6130000                   jg         0x7f23abbdcf00
00aaa 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00ab1 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00ab8 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00abc 90                             nop        
00abd 90                             nop        
00abe 90                             nop        
00abf 90                             nop        
00ac0 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00ac8 4963cb                         movsxd     rcx, r11d
00acb 4883c108                       add        rcx, 8
00acf 8b6c2428                       mov        ebp, dword ptr [rsp + 0x28]
00ad3 03ac24a8000000                 add        ebp, dword ptr [rsp + 0xa8]
00ada 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00adf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ae4 48be28c122e200000000           movabs     rsi, 0xe222c128
00aee 488b542448                     mov        rdx, qword ptr [rsp + 0x48]
00af3 4533c9                         xor        r9d, r9d
00af6 90                             nop        
00af7 90                             nop        
00af8 c5f877                         vzeroupper 
00afb e8e036b5ff                     call       0x7f23ab72f260
00b00 0f1f8400f80b000a               nop        dword ptr [rax + rax + 0xa000bf8]
00b08 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00b10 4183c208                       add        r10d, 8
00b14 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00b1c 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
00b21 7c9d                           jl         0x7f23abbdbb40
00b23 eb25                           jmp        0x7f23abbdbbca
00b25 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b2a 4d63d2                         movsxd     r10, r10d
00b2d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b34 c442a8f5db                     bzhi       r11, r11, r10
00b39 c4c1fb92fb                     kmovq      k7, r11
00b3e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b44 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b4a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b4f 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00b54 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00b59 e958f8ffff                     jmp        0x7f23abbdb436
00b5e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b66 4585d2                         test       r10d, r10d
00b69 0f8c1d110000                   jl         0x7f23abbdcd0c
00b6f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b74 4585db                         test       r11d, r11d
00b77 0f8c0f110000                   jl         0x7f23abbdcd0c
00b7d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b82 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
00b8a 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00b92 453bda                         cmp        r11d, r10d
00b95 0f82f1100000                   jb         0x7f23abbdcd0c
00b9b 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00ba0 0f82e6100000                   jb         0x7f23abbdcd0c
00ba6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00bab 4585d2                         test       r10d, r10d
00bae 749a                           je         0x7f23abbdbbca
00bb0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00bb5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00bba 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00bbf 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00bc7 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00bcc 4883fd20                       cmp        rbp, 0x20
00bd0 0f864fffffff                   jbe        0x7f23abbdbba5
00bd6 488bd5                         mov        rdx, rbp
00bd9 c5f877                         vzeroupper 
00bdc 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
00be6 41ffd2                         call       r10
00be9 0f1f840000000000               nop        dword ptr [rax + rax]
00bf1 e954ffffff                     jmp        0x7f23abbdbbca
00bf6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bfb 4d63d3                         movsxd     r10, r11d
00bfe 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c05 c442a8f5db                     bzhi       r11, r11, r10
00c0a c4c1fb92fb                     kmovq      k7, r11
00c0f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c15 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c1b eb60                           jmp        0x7f23abbdbcfd
00c1d 85db                           test       ebx, ebx
00c1f 0f8c370f0000                   jl         0x7f23abbdcbdc
00c25 4585c0                         test       r8d, r8d
00c28 0f8c2e0f0000                   jl         0x7f23abbdcbdc
00c2e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c33 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00c3b 0f821b0f0000                   jb         0x7f23abbdcbdc
00c41 448b9424ec000000               mov        r10d, dword ptr [rsp + 0xec]
00c49 453bd5                         cmp        r10d, r13d
00c4c 0f820a0f0000                   jb         0x7f23abbdcbdc
00c52 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c57 4585d2                         test       r10d, r10d
00c5a 7421                           je         0x7f23abbdbcfd
00c5c 4883f920                       cmp        rcx, 0x20
00c60 7694                           jbe        0x7f23abbdbc76
00c62 488bd1                         mov        rdx, rcx
00c65 c5f877                         vzeroupper 
00c68 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
00c72 41ffd2                         call       r10
00c75 0f1f840000000000               nop        dword ptr [rax + rax]
00c7d 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00c82 e9aff6ffff                     jmp        0x7f23abbdb3b6
00c87 90                             nop        
00c88 418bd0                         mov        edx, r8d
00c8b 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00c90 458b549004                     mov        r10d, dword ptr [r8 + rdx*4 + 4]
00c95 498bc8                         mov        rcx, r8
00c98 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
00c9d 448d42ff                       lea        r8d, [rdx - 1]
00ca1 453bc3                         cmp        r8d, r11d
00ca4 7fe2                           jg         0x7f23abbdbd08
00ca6 48638c24e8000000               movsxd     rcx, dword ptr [rsp + 0xe8]
00cae 4183f83f                       cmp        r8d, 0x3f
00cb2 0f8e20010000                   jle        0x7f23abbdbe58
00cb8 4c63d2                         movsxd     r10, edx
00cbb 4983c2fe                       add        r10, -2
00cbf 4c3bd1                         cmp        r10, rcx
00cc2 0f83cc100000                   jae        0x7f23abbdce14
00cc8 448d52bf                       lea        r10d, [rdx - 0x41]
00ccc 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00cd4 0f83ce100000                   jae        0x7f23abbdce28
00cda 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00ce2 0f83d4100000                   jae        0x7f23abbdce3c
00ce8 448d5ac0                       lea        r11d, [rdx - 0x40]
00cec 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00cf4 0f83d6100000                   jae        0x7f23abbdce50
00cfa 448bd2                         mov        r10d, edx
00cfd 41ffca                         dec        r10d
00d00 418bfa                         mov        edi, r10d
00d03 eb0e                           jmp        0x7f23abbdbd93
00d05 90                             nop        
00d06 90                             nop        
00d07 90                             nop        
00d08 90                             nop        
00d09 90                             nop        
00d0a 90                             nop        
00d0b 90                             nop        
00d0c 90                             nop        
00d0d 90                             nop        
00d0e 90                             nop        
00d0f 90                             nop        
00d10 418bf8                         mov        edi, r8d
00d13 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00d18 62d17e486f84bbc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0x38]
00d23 62d17e487f84bbccffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0x34], zmm0
00d2e 62d17e486f84bb88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0x78]
00d39 62d17e487f84bb8cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0x74], zmm0
00d44 62d17e486f84bb48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0xb8]
00d4f 62d17e487f84bb4cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0xb4], zmm0
00d5a 62d17e486f84bb08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 - 0xf8]
00d65 62d17e487f84bb0cffffff         vmovdqu32  zmmword ptr [r11 + rdi*4 - 0xf4], zmm0
00d70 448d47c0                       lea        r8d, [rdi - 0x40]
00d74 4183f83f                       cmp        r8d, 0x3f
00d78 7f96                           jg         0x7f23abbdbd90
00d7a 4183f80f                       cmp        r8d, 0xf
00d7e 7e58                           jle        0x7f23abbdbe58
00d80 448bd7                         mov        r10d, edi
00d83 458d42b0                       lea        r8d, [r10 - 0x50]
00d87 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00d8f 0f83f3130000                   jae        0x7f23abbdd208
00d95 4183c2b1                       add        r10d, -0x4f
00d99 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00da1 0f8309140000                   jae        0x7f23abbdd230
00da7 448bd7                         mov        r10d, edi
00daa 4183c2c0                       add        r10d, -0x40
00dae 90                             nop        
00daf 90                             nop        
00db0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00db5 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00dc0 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00dcb 4183c2f0                       add        r10d, -0x10
00dcf 4183fa0f                       cmp        r10d, 0xf
00dd3 7fdb                           jg         0x7f23abbdbe30
00dd5 458bc2                         mov        r8d, r10d
00dd8 4585c0                         test       r8d, r8d
00ddb 0f8e27f8ffff                   jle        0x7f23abbdb688
00de1 4d63d0                         movsxd     r10, r8d
00de4 49ffca                         dec        r10
00de7 4c3bd1                         cmp        r10, rcx
00dea 0f8384130000                   jae        0x7f23abbdd1f4
00df0 458bd8                         mov        r11d, r8d
00df3 458d53ff                       lea        r10d, [r11 - 1]
00df7 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00dff 0f8397130000                   jae        0x7f23abbdd21c
00e05 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00e0d 0f83b1130000                   jae        0x7f23abbdd244
00e13 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00e1b 0f83b7130000                   jae        0x7f23abbdd258
00e21 90                             nop        
00e22 90                             nop        
00e23 90                             nop        
00e24 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00e29 478b548204                     mov        r10d, dword ptr [r10 + r8*4 + 4]
00e2e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00e33 4789548308                     mov        dword ptr [r11 + r8*4 + 8], r10d
00e38 41ffc8                         dec        r8d
00e3b 4585c0                         test       r8d, r8d
00e3e 7fe4                           jg         0x7f23abbdbea4
00e40 e9c3f7ffff                     jmp        0x7f23abbdb688
00e45 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00e4d e9bff7ffff                     jmp        0x7f23abbdb691
00e52 90                             nop        
00e53 90                             nop        
00e54 90                             nop        
00e55 90                             nop        
00e56 90                             nop        
00e57 90                             nop        
00e58 90                             nop        
00e59 90                             nop        
00e5a 90                             nop        
00e5b 90                             nop        
00e5c 90                             nop        
00e5d 90                             nop        
00e5e 90                             nop        
00e5f 90                             nop        
00e60 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00e68 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00e6f 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00e73 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e78 8bd5                           mov        edx, ebp
00e7a 90                             nop        
00e7b 90                             nop        
00e7c c5f877                         vzeroupper 
00e7f e85c3db5ff                     call       0x7f23ab72fc60
00e84 0f1f84007c0f000b               nop        dword ptr [rax + rax + 0xb000f7c]
00e8c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e91 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00e98 488bc8                         mov        rcx, rax
00e9b 90                             nop        
00e9c c5f877                         vzeroupper 
00e9f e83c3db5ff                     call       0x7f23ab72fc60
00ea4 0f1f84009c0f000c               nop        dword ptr [rax + rax + 0xc000f9c]
00eac 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00eb4 4183c308                       add        r11d, 8
00eb8 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00ebd 7ca1                           jl         0x7f23abbdbee0
00ebf e9f2f4ffff                     jmp        0x7f23abbdb436
00ec4 4d63d2                         movsxd     r10, r10d
00ec7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ece c442a8f5db                     bzhi       r11, r11, r10
00ed3 c4c1fb92fb                     kmovq      k7, r11
00ed8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ede 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ee4 eb6e                           jmp        0x7f23abbdbfd4
00ee6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00eeb 4585db                         test       r11d, r11d
00eee 0f84c8040000                   je         0x7f23abbdc43c
00ef4 85db                           test       ebx, ebx
00ef6 0f8ca0130000                   jl         0x7f23abbdd31c
00efc 4585c0                         test       r8d, r8d
00eff 0f8c97130000                   jl         0x7f23abbdd31c
00f05 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f0a 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00f12 0f8284130000                   jb         0x7f23abbdd31c
00f18 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
00f20 453bdd                         cmp        r11d, r13d
00f23 0f8273130000                   jb         0x7f23abbdd31c
00f29 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f2e 4585d2                         test       r10d, r10d
00f31 7421                           je         0x7f23abbdbfd4
00f33 4883f920                       cmp        rcx, 0x20
00f37 768b                           jbe        0x7f23abbdbf44
00f39 488bd1                         mov        rdx, rcx
00f3c c5f877                         vzeroupper 
00f3f 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
00f49 41ffd2                         call       r10
00f4c 0f1f840000000000               nop        dword ptr [rax + rax]
00f54 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f59 4585db                         test       r11d, r11d
00f5c 0f8eb6010000                   jle        0x7f23abbdc198
00f62 458bd5                         mov        r10d, r13d
00f65 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00f6a 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00f72 458bdd                         mov        r11d, r13d
00f75 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00f7a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f7f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f84 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00f89 4b8d742b08                     lea        rsi, [r11 + r13 + 8]
00f8e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f93 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
00f98 0f8dd8000000                   jge        0x7f23abbdc0f6
00f9e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fa3 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00fa8 458bd3                         mov        r10d, r11d
00fab 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00fb0 450f4fd0                       cmovg      r10d, r8d
00fb4 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00fb9 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00fc1 4585d2                         test       r10d, r10d
00fc4 0f8c2e130000                   jl         0x7f23abbdd378
00fca 4585ed                         test       r13d, r13d
00fcd 0f8c25130000                   jl         0x7f23abbdd378
00fd3 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00fd8 4503da                         add        r11d, r10d
00fdb 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
00fe3 453bc3                         cmp        r8d, r11d
00fe6 0f820c130000                   jb         0x7f23abbdd378
00fec 458bd5                         mov        r10d, r13d
00fef 440354247c                     add        r10d, dword ptr [rsp + 0x7c]
00ff4 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ffc 458bd8                         mov        r11d, r8d
00fff 453bda                         cmp        r11d, r10d
01002 0f82f0120000                   jb         0x7f23abbdd378
01008 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0100d 4585d2                         test       r10d, r10d
01010 0f8ce2120000                   jl         0x7f23abbdd378
01016 4585d2                         test       r10d, r10d
01019 742c                           je         0x7f23abbdc0c7
0101b 4963d2                         movsxd     rdx, r10d
0101e 4883fa20                       cmp        rdx, 0x20
01022 7738                           ja         0x7f23abbdc0dc
01024 458bda                         mov        r11d, r10d
01027 4d63d3                         movsxd     r10, r11d
0102a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01031 c442a8f5db                     bzhi       r11, r11, r10
01036 c4c1fb92fb                     kmovq      k7, r11
0103b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01041 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01047 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0104c 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
01051 0f8d5ff3ffff                   jge        0x7f23abbdb436
01057 e993020000                     jmp        0x7f23abbdc36f
0105c c5f877                         vzeroupper 
0105f 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
01069 41ffd2                         call       r10
0106c 0f1f840000000000               nop        dword ptr [rax + rax]
01074 ebd1                           jmp        0x7f23abbdc0c7
01076 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0107e 4585db                         test       r11d, r11d
01081 0f8cf9120000                   jl         0x7f23abbdd400
01087 4585ed                         test       r13d, r13d
0108a 0f8cf0120000                   jl         0x7f23abbdd400
01090 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01095 4503d3                         add        r10d, r11d
01098 448b9c24ec000000               mov        r11d, dword ptr [rsp + 0xec]
010a0 453bda                         cmp        r11d, r10d
010a3 0f82d7120000                   jb         0x7f23abbdd400
010a9 458bc3                         mov        r8d, r11d
010ac 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
010b1 453bc3                         cmp        r8d, r11d
010b4 0f82c6120000                   jb         0x7f23abbdd400
010ba 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
010bf 4585d2                         test       r10d, r10d
010c2 0f84eef2ffff                   je         0x7f23abbdb436
010c8 4883fd20                       cmp        rbp, 0x20
010cc 772a                           ja         0x7f23abbdc178
010ce 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
010d3 4d63d3                         movsxd     r10, r11d
010d6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010dd c442a8f5db                     bzhi       r11, r11, r10
010e2 c4c1fb92fb                     kmovq      k7, r11
010e7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010ed 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010f3 e9bef2ffff                     jmp        0x7f23abbdb436
010f8 488bd5                         mov        rdx, rbp
010fb c5f877                         vzeroupper 
010fe 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
01108 41ffd2                         call       r10
0110b 0f1f840000000000               nop        dword ptr [rax + rax]
01113 e99ef2ffff                     jmp        0x7f23abbdb436
01118 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0111d e994f2ffff                     jmp        0x7f23abbdb436
01122 4d63d2                         movsxd     r10, r10d
01125 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0112c c442a8f5db                     bzhi       r11, r11, r10
01131 c4c1fb92fb                     kmovq      k7, r11
01136 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0113c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01142 e9a5000000                     jmp        0x7f23abbdc26c
01147 448b1424                       mov        r10d, dword ptr [rsp]
0114b 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
01153 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01158 4585db                         test       r11d, r11d
0115b 0f848b100000                   je         0x7f23abbdd26c
01161 498bcb                         mov        rcx, r11
01164 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
0116c 4585c0                         test       r8d, r8d
0116f 0f8cc3100000                   jl         0x7f23abbdd2b8
01175 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
0117a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01182 8b542438                       mov        edx, dword ptr [rsp + 0x38]
01186 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0118b 4585c9                         test       r9d, r9d
0118e 0f8cb6100000                   jl         0x7f23abbdd2ca
01194 3b1424                         cmp        edx, dword ptr [rsp]
01197 0f82ad100000                   jb         0x7f23abbdd2ca
0119d 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
011a1 4103ea                         add        ebp, r10d
011a4 8b5104                         mov        edx, dword ptr [rcx + 4]
011a7 3bd5                           cmp        edx, ebp
011a9 0f829b100000                   jb         0x7f23abbdd2ca
011af 4585d2                         test       r10d, r10d
011b2 0f8c92100000                   jl         0x7f23abbdd2ca
011b8 4585d2                         test       r10d, r10d
011bb 742f                           je         0x7f23abbdc26c
011bd 4a8d740908                     lea        rsi, [rcx + r9 + 8]
011c2 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
011c7 4963d2                         movsxd     rdx, r10d
011ca 4883fa20                       cmp        rdx, 0x20
011ce 0f864effffff                   jbe        0x7f23abbdc1a2
011d4 c5f877                         vzeroupper 
011d7 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
011e1 41ffd2                         call       r10
011e4 0f1f840000000000               nop        dword ptr [rax + rax]
011ec 896b38                         mov        dword ptr [rbx + 0x38], ebp
011ef c5f877                         vzeroupper 
011f2 4881c4d0000000                 add        rsp, 0xd0
011f9 5d                             pop        rbp
011fa 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
011fe 0f875e120000                   ja         0x7f23abbdd4e2
01204 c3                             ret        
01205 41ffc9                         dec        r9d
01208 4585c9                         test       r9d, r9d
0120b 7e22                           jle        0x7f23abbdc2af
0120d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01212 41894b10                       mov        dword ptr [r11 + 0x10], ecx
01216 458b4308                       mov        r8d, dword ptr [r11 + 8]
0121a 4589430c                       mov        dword ptr [r11 + 0xc], r8d
0121e 45894b08                       mov        dword ptr [r11 + 8], r9d
01222 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0122a e9e2f3ffff                     jmp        0x7f23abbdb691
0122f 48be78b272e200000000           movabs     rsi, 0xe272b278
01239 8beb                           mov        ebp, ebx
0123b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01243 90                             nop        
01244 c5f877                         vzeroupper 
01247 e89439b5ff                     call       0x7f23ab72fc60
0124c 0f1f84004413000d               nop        dword ptr [rax + rax + 0xd001344]
01254 4885c0                         test       rax, rax
01257 0f8540f4ffff                   jne        0x7f23abbdb71d
0125d bef6ffffff                     mov        esi, 0xfffffff6
01262 90                             nop        
01263 90                             nop        
01264 c5f877                         vzeroupper 
01267 e87417afff                     call       0x7f23ab6cda60
0126c 0f1f84006413000e               nop        dword ptr [rax + rax + 0xe001364]
01274 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0127e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01282 e81989b319                     call       0x7f23c5714c20
01287 f4                             hlt        
01288 4d03d3                         add        r10, r11
0128b 4d3bd6                         cmp        r10, r14
0128e 7e08                           jle        0x7f23abbdc318
01290 4533ed                         xor        r13d, r13d
01293 e90ceeffff                     jmp        0x7f23abbdb124
01298 4533ed                         xor        r13d, r13d
0129b b901000000                     mov        ecx, 1
012a0 e901eeffff                     jmp        0x7f23abbdb126
012a5 448bdd                         mov        r11d, ebp
012a8 4d63d3                         movsxd     r10, r11d
012ab 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012b2 c442a8f5db                     bzhi       r11, r11, r10
012b7 c4c1fb92fb                     kmovq      k7, r11
012bc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012c2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012c8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
012cd 4403dd                         add        r11d, ebp
012d0 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012d5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
012d9 418502                         test       dword ptr [r10], eax
012dc 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
012e1 0f8dcff0ffff                   jge        0x7f23abbdb436
012e7 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
012ef 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
012f7 442b5c247c                     sub        r11d, dword ptr [rsp + 0x7c]
012fc 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
01304 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
01308 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
0130c 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
01310 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01315 410f4fea                       cmovg      ebp, r10d
01319 4585db                         test       r11d, r11d
0131c 0f8cfa0b0000                   jl         0x7f23abbdcf9c
01322 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0132a 4585d2                         test       r10d, r10d
0132d 0f8ce90b0000                   jl         0x7f23abbdcf9c
01333 448bdd                         mov        r11d, ebp
01336 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
0133e 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
01346 453bc3                         cmp        r8d, r11d
01349 0f82cd0b0000                   jb         0x7f23abbdcf9c
0134f 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
01357 4403f5                         add        r14d, ebp
0135a 453bc6                         cmp        r8d, r14d
0135d 0f82b90b0000                   jb         0x7f23abbdcf9c
01363 85ed                           test       ebp, ebp
01365 0f8cb10b0000                   jl         0x7f23abbdcf9c
0136b 85ed                           test       ebp, ebp
0136d 0f8455ffffff                   je         0x7f23abbdc348
01373 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01378 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01380 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
01385 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0138d 4b8d741308                     lea        rsi, [r11 + r10 + 8]
01392 4863d5                         movsxd     rdx, ebp
01395 4883fa20                       cmp        rdx, 0x20
01399 0f8606ffffff                   jbe        0x7f23abbdc325
0139f c5f877                         vzeroupper 
013a2 49ba409171ab237f0000           movabs     r10, 0x7f23ab719140
013ac 41ffd2                         call       r10
013af 0f1f840000000000               nop        dword ptr [rax + rax]
013b7 e90cffffff                     jmp        0x7f23abbdc348
013bc 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
013c1 e98efbffff                     jmp        0x7f23abbdbfd4
013c6 bee4ffffff                     mov        esi, 0xffffffe4
013cb 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
013d3 448b1424                       mov        r10d, dword ptr [rsp]
013d7 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013df 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013e4 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
013ec 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
013f1 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
013f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013fe 4c891424                       mov        qword ptr [rsp], r10
01402 90                             nop        
01403 90                             nop        
01404 c5f877                         vzeroupper 
01407 e8d415afff                     call       0x7f23ab6cda60
0140c 0f1f840004150010               nop        dword ptr [rax + rax + 0x10001504]
01414 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0141e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01422 e87987b319                     call       0x7f23c5714c20
01427 f4                             hlt        
01428 bee4ffffff                     mov        esi, 0xffffffe4
0142d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01435 448b1424                       mov        r10d, dword ptr [rsp]
01439 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01441 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01446 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0144e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01453 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0145b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01460 4c891424                       mov        qword ptr [rsp], r10
01464 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01469 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0146e c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01474 c5f877                         vzeroupper 
01477 e86415afff                     call       0x7f23ab6cda60
0147c 0f1f840074150011               nop        dword ptr [rax + rax + 0x11001574]
01484 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0148e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01492 e80987b319                     call       0x7f23c5714c20
01497 f4                             hlt        
01498 bee4ffffff                     mov        esi, 0xffffffe4
0149d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
014a5 448b1424                       mov        r10d, dword ptr [rsp]
014a9 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
014b1 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
014b6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
014be 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014c3 4c891424                       mov        qword ptr [rsp], r10
014c7 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
014cb 90                             nop        
014cc c5f877                         vzeroupper 
014cf e80c15afff                     call       0x7f23ab6cda60
014d4 0f1f8400cc150012               nop        dword ptr [rax + rax + 0x120015cc]
014dc 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
014e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014ea e8b186b319                     call       0x7f23c5714c20
014ef f4                             hlt        
014f0 bee4ffffff                     mov        esi, 0xffffffe4
014f5 498bea                         mov        rbp, r10
014f8 448b1424                       mov        r10d, dword ptr [rsp]
014fc 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01504 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01509 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01511 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01516 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0151e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01523 4c891424                       mov        qword ptr [rsp], r10
01527 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0152b 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01530 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
01535 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0153a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01540 c5f877                         vzeroupper 
01543 e89814afff                     call       0x7f23ab6cda60
01548 0f1f840040160013               nop        dword ptr [rax + rax + 0x13001640]
01550 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0155a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0155e e83d86b319                     call       0x7f23c5714c20
01563 f4                             hlt        
01564 be45ffffff                     mov        esi, 0xffffff45
01569 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01571 90                             nop        
01572 90                             nop        
01573 90                             nop        
01574 c5f877                         vzeroupper 
01577 e86414afff                     call       0x7f23ab6cda60
0157c 0f1f840074160014               nop        dword ptr [rax + rax + 0x14001674]
01584 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0158e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01592 e80986b319                     call       0x7f23c5714c20
01597 f4                             hlt        
01598 458bca                         mov        r9d, r10d
0159b be45ffffff                     mov        esi, 0xffffff45
015a0 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
015a8 448b1c24                       mov        r11d, dword ptr [rsp]
015ac 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
015b4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015b9 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
015c1 448b542404                     mov        r10d, dword ptr [rsp + 4]
015c6 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
015ce 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015d3 4c891424                       mov        qword ptr [rsp], r10
015d7 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015dc 44895c2408                     mov        dword ptr [rsp + 8], r11d
015e1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
015e6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015eb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
015ef 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
015f4 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015f9 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
015fe 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01603 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01608 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0160d 90                             nop        
0160e 90                             nop        
0160f 90                             nop        
01610 c5f877                         vzeroupper 
01613 e8c813afff                     call       0x7f23ab6cda60
01618 0f1f840010170015               nop        dword ptr [rax + rax + 0x15001710]
01620 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0162a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0162e e86d85b319                     call       0x7f23c5714c20
01633 f4                             hlt        
01634 4d3bd3                         cmp        r10, r11
01637 bdffffffff                     mov        ebp, 0xffffffff
0163c 7c08                           jl         0x7f23abbdc6c6
0163e 400f95c5                       setne      bpl
01642 400fb6ed                       movzx      ebp, bpl
01646 be45ffffff                     mov        esi, 0xffffff45
0164b 448b0424                       mov        r8d, dword ptr [rsp]
0164f 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01657 448b542404                     mov        r10d, dword ptr [rsp + 4]
0165c 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01664 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01669 4c891424                       mov        qword ptr [rsp], r10
0166d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01671 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01676 90                             nop        
01677 90                             nop        
01678 c5f877                         vzeroupper 
0167b e86013afff                     call       0x7f23ab6cda60
01680 0f1f840078170016               nop        dword ptr [rax + rax + 0x16001778]
01688 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01692 4883e4f0                       and        rsp, 0xfffffffffffffff0
01696 e80585b319                     call       0x7f23c5714c20
0169b f4                             hlt        
0169c be45ffffff                     mov        esi, 0xffffff45
016a1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
016a9 448b1c24                       mov        r11d, dword ptr [rsp]
016ad 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
016b5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016ba 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
016c2 448b542404                     mov        r10d, dword ptr [rsp + 4]
016c7 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
016cf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016d4 4c891424                       mov        qword ptr [rsp], r10
016d8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016dd 44895c2408                     mov        dword ptr [rsp + 8], r11d
016e2 48894424f8                     mov        qword ptr [rsp - 8], rax
016e7 8b442414                       mov        eax, dword ptr [rsp + 0x14]
016eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
016ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f4 895c2410                       mov        dword ptr [rsp + 0x10], ebx
016f8 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
016fd 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01702 90                             nop        
01703 90                             nop        
01704 c5f877                         vzeroupper 
01707 e8d412afff                     call       0x7f23ab6cda60
0170c 0f1f840004180017               nop        dword ptr [rax + rax + 0x17001804]
01714 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0171e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01722 e87984b319                     call       0x7f23c5714c20
01727 f4                             hlt        
01728 be45ffffff                     mov        esi, 0xffffff45
0172d 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01735 448b1424                       mov        r10d, dword ptr [rsp]
01739 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01741 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01746 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0174e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01753 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0175b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01760 4c891424                       mov        qword ptr [rsp], r10
01764 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01769 4489542408                     mov        dword ptr [rsp + 8], r10d
0176e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01773 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01778 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0177d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01782 90                             nop        
01783 90                             nop        
01784 c5f877                         vzeroupper 
01787 e85412afff                     call       0x7f23ab6cda60
0178c 0f1f840084180018               nop        dword ptr [rax + rax + 0x18001884]
01794 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0179e 4883e4f0                       and        rsp, 0xfffffffffffffff0
017a2 e8f983b319                     call       0x7f23c5714c20
017a7 f4                             hlt        
017a8 85c0                           test       eax, eax
017aa 0f84580c0000                   je         0x7f23abbdd488
017b0 488bc8                         mov        rcx, rax
017b3 448b0c24                       mov        r9d, dword ptr [rsp]
017b7 89742414                       mov        dword ptr [rsp + 0x14], esi
017bb 4533c0                         xor        r8d, r8d
017be 458bd1                         mov        r10d, r9d
017c1 e9c0f9ffff                     jmp        0x7f23abbdc206
017c6 bee4ffffff                     mov        esi, 0xffffffe4
017cb 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
017d3 448b1424                       mov        r10d, dword ptr [rsp]
017d7 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
017df 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
017e4 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
017ec 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017f1 4c891424                       mov        qword ptr [rsp], r10
017f5 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
017fa 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
017ff 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01803 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01807 90                             nop        
01808 c5f877                         vzeroupper 
0180b e8d011afff                     call       0x7f23ab6cda60
01810 0f1f840008190019               nop        dword ptr [rax + rax + 0x19001908]
01818 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01822 4883e4f0                       and        rsp, 0xfffffffffffffff0
01826 e87583b319                     call       0x7f23c5714c20
0182b f4                             hlt        
0182c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01835 bee4ffffff                     mov        esi, 0xffffffe4
0183a 498bea                         mov        rbp, r10
0183d 448b1424                       mov        r10d, dword ptr [rsp]
01841 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01849 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0184e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01856 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0185b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01863 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01868 4c891424                       mov        qword ptr [rsp], r10
0186c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01871 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01876 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
0187b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01880 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01885 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01889 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0188e 90                             nop        
0188f 90                             nop        
01890 c5f877                         vzeroupper 
01893 e84811afff                     call       0x7f23ab6cda60
01898 0f1f84009019001a               nop        dword ptr [rax + rax + 0x1a001990]
018a0 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
018aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ae e8ed82b319                     call       0x7f23c5714c20
018b3 f4                             hlt        
018b4 8beb                           mov        ebp, ebx
018b6 83c510                         add        ebp, 0x10
018b9 be6effffff                     mov        esi, 0xffffff6e
018be 448b1424                       mov        r10d, dword ptr [rsp]
018c2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
018ca 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
018cf 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
018d7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018dc 4c891424                       mov        qword ptr [rsp], r10
018e0 895c2414                       mov        dword ptr [rsp + 0x14], ebx
018e4 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
018e9 90                             nop        
018ea 90                             nop        
018eb 90                             nop        
018ec c5f877                         vzeroupper 
018ef e8ec10afff                     call       0x7f23ab6cda60
018f4 0f1f8400ec19001b               nop        dword ptr [rax + rax + 0x1b0019ec]
018fc 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0190a e89182b319                     call       0x7f23c5714c20
0190f f4                             hlt        
01910 8beb                           mov        ebp, ebx
01912 83c510                         add        ebp, 0x10
01915 be66ffffff                     mov        esi, 0xffffff66
0191a 448b1424                       mov        r10d, dword ptr [rsp]
0191e 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01926 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0192b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01933 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01938 4c891424                       mov        qword ptr [rsp], r10
0193c 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01940 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01945 90                             nop        
01946 90                             nop        
01947 90                             nop        
01948 c5f877                         vzeroupper 
0194b e89010afff                     call       0x7f23ab6cda60
01950 0f1f8400481a001c               nop        dword ptr [rax + rax + 0x1c001a48]
01958 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01962 4883e4f0                       and        rsp, 0xfffffffffffffff0
01966 e83582b319                     call       0x7f23c5714c20
0196b f4                             hlt        
0196c be17000000                     mov        esi, 0x17
01971 90                             nop        
01972 90                             nop        
01973 90                             nop        
01974 c5f877                         vzeroupper 
01977 e86410afff                     call       0x7f23ab6cda60
0197c 0f1f8400741a001d               nop        dword ptr [rax + rax + 0x1d001a74]
01984 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0198e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01992 e80982b319                     call       0x7f23c5714c20
01997 f4                             hlt        
01998 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
019a0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019a5 eb0d                           jmp        0x7f23abbdca34
019a7 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
019af 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019b4 be6effffff                     mov        esi, 0xffffff6e
019b9 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
019c1 4c89542408                     mov        qword ptr [rsp + 8], r10
019c6 89442410                       mov        dword ptr [rsp + 0x10], eax
019ca 897c2418                       mov        dword ptr [rsp + 0x18], edi
019ce 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
019d3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
019d8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019dd 894c2430                       mov        dword ptr [rsp + 0x30], ecx
019e1 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
019e6 4c89742440                     mov        qword ptr [rsp + 0x40], r14
019eb 90                             nop        
019ec c5f877                         vzeroupper 
019ef e8ec0fafff                     call       0x7f23ab6cda60
019f4 0f1f8400ec1a001e               nop        dword ptr [rax + rax + 0x1e001aec]
019fc 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a0a e89181b319                     call       0x7f23c5714c20
01a0f f4                             hlt        
01a10 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a15 bebeffffff                     mov        esi, 0xffffffbe
01a1a 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01a22 448b1c24                       mov        r11d, dword ptr [rsp]
01a26 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a2e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01a33 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01a3b 4c89542408                     mov        qword ptr [rsp + 8], r10
01a40 890424                         mov        dword ptr [rsp], eax
01a43 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01a48 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a4d 897c2414                       mov        dword ptr [rsp + 0x14], edi
01a51 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01a56 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01a5a 90                             nop        
01a5b 90                             nop        
01a5c c5f877                         vzeroupper 
01a5f e87c0fafff                     call       0x7f23ab6cda60
01a64 0f1f84005c1b001f               nop        dword ptr [rax + rax + 0x1f001b5c]
01a6c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01a76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a7a e82181b319                     call       0x7f23c5714c20
01a7f f4                             hlt        
01a80 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a85 eb8e                           jmp        0x7f23abbdca95
01a87 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a8c eb87                           jmp        0x7f23abbdca95
01a8e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a93 e97dffffff                     jmp        0x7f23abbdca95
01a98 458bca                         mov        r9d, r10d
01a9b bee4ffffff                     mov        esi, 0xffffffe4
01aa0 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01aa8 448b1c24                       mov        r11d, dword ptr [rsp]
01aac 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01ab4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ab9 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ac1 448b542404                     mov        r10d, dword ptr [rsp + 4]
01ac6 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01ace 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ad3 4c891424                       mov        qword ptr [rsp], r10
01ad7 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01adc 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ae1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01ae6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aeb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01aef 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01af4 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01af9 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01afe 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b03 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b08 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01b0c c5f877                         vzeroupper 
01b0f e8cc0eafff                     call       0x7f23ab6cda60
01b14 0f1f84000c1c0020               nop        dword ptr [rax + rax + 0x20001c0c]
01b1c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2a e87180b319                     call       0x7f23c5714c20
01b2f f4                             hlt        
01b30 bef6ffffff                     mov        esi, 0xfffffff6
01b35 90                             nop        
01b36 90                             nop        
01b37 90                             nop        
01b38 c5f877                         vzeroupper 
01b3b e8a00eafff                     call       0x7f23ab6cda60
01b40 0f1f8400381c0021               nop        dword ptr [rax + rax + 0x21001c38]
01b48 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b56 e84580b319                     call       0x7f23c5714c20
01b5b f4                             hlt        
01b5c beccffffff                     mov        esi, 0xffffffcc
01b61 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01b69 448b1c24                       mov        r11d, dword ptr [rsp]
01b6d 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b75 448b542404                     mov        r10d, dword ptr [rsp + 4]
01b7a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01b82 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b87 4c891424                       mov        qword ptr [rsp], r10
01b8b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01b8f 90                             nop        
01b90 c5f877                         vzeroupper 
01b93 e8480eafff                     call       0x7f23ab6cda60
01b98 0f1f8400901c0022               nop        dword ptr [rax + rax + 0x22001c90]
01ba0 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bae e8ed7fb319                     call       0x7f23c5714c20
01bb3 f4                             hlt        
01bb4 bee4ffffff                     mov        esi, 0xffffffe4
01bb9 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01bc1 448b1424                       mov        r10d, dword ptr [rsp]
01bc5 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01bcd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bd2 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01bda 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01bdf 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01be7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bec 4c891424                       mov        qword ptr [rsp], r10
01bf0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bf5 4489542408                     mov        dword ptr [rsp + 8], r10d
01bfa 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01c02 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01c07 90                             nop        
01c08 c5f877                         vzeroupper 
01c0b e8d00dafff                     call       0x7f23ab6cda60
01c10 0f1f8400081d0023               nop        dword ptr [rax + rax + 0x23001d08]
01c18 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01c22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c26 e8757fb319                     call       0x7f23c5714c20
01c2b f4                             hlt        
01c2c bee4ffffff                     mov        esi, 0xffffffe4
01c31 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01c39 448b1424                       mov        r10d, dword ptr [rsp]
01c3d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01c45 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c4a 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c52 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01c57 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c5f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c64 4c891424                       mov        qword ptr [rsp], r10
01c68 c5f877                         vzeroupper 
01c6b e8700dafff                     call       0x7f23ab6cda60
01c70 0f1f8400681d0024               nop        dword ptr [rax + rax + 0x24001d68]
01c78 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c86 e8157fb319                     call       0x7f23c5714c20
01c8b f4                             hlt        
01c8c beccffffff                     mov        esi, 0xffffffcc
01c91 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01c99 448b1424                       mov        r10d, dword ptr [rsp]
01c9d 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01ca5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01caa 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01cb2 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01cb7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01cbf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cc4 4c891424                       mov        qword ptr [rsp], r10
01cc8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ccd 4489542408                     mov        dword ptr [rsp + 8], r10d
01cd2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01cd7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cdc c5f877                         vzeroupper 
01cdf e8fc0cafff                     call       0x7f23ab6cda60
01ce4 0f1f8400dc1d0025               nop        dword ptr [rax + rax + 0x25001ddc]
01cec 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01cf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cfa e8a17eb319                     call       0x7f23c5714c20
01cff f4                             hlt        
01d00 be6effffff                     mov        esi, 0xffffff6e
01d05 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01d0d 448b0424                       mov        r8d, dword ptr [rsp]
01d11 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01d19 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01d1e 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01d26 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01d2b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01d33 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d38 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d3d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01d42 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d47 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01d4b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01d50 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d55 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
01d5a 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01d5f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d64 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01d69 89542440                       mov        dword ptr [rsp + 0x40], edx
01d6d 90                             nop        
01d6e 90                             nop        
01d6f 90                             nop        
01d70 c5f877                         vzeroupper 
01d73 e8680cafff                     call       0x7f23ab6cda60
01d78 0f1f8400701e0026               nop        dword ptr [rax + rax + 0x26001e70]
01d80 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01d8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8e e80d7eb319                     call       0x7f23c5714c20
01d93 f4                             hlt        
01d94 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
01d9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01da2 e8f97db319                     call       0x7f23c5714c20
01da7 f4                             hlt        
01da8 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
01db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db6 e8e57db319                     call       0x7f23c5714c20
01dbb f4                             hlt        
01dbc 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
01dc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dca e8d17db319                     call       0x7f23c5714c20
01dcf f4                             hlt        
01dd0 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
01dda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dde e8bd7db319                     call       0x7f23c5714c20
01de3 f4                             hlt        
01de4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01dec 458d5a08                       lea        r11d, [r10 + 8]
01df0 458bcb                         mov        r9d, r11d
01df3 be6effffff                     mov        esi, 0xffffff6e
01df8 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e00 448b1424                       mov        r10d, dword ptr [rsp]
01e04 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01e0c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e11 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01e19 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01e1e 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e26 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e2b 4c891424                       mov        qword ptr [rsp], r10
01e2f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e34 4489542408                     mov        dword ptr [rsp + 8], r10d
01e39 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01e3e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e43 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
01e48 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e4d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01e52 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e57 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01e5c c5f877                         vzeroupper 
01e5f e87c0bafff                     call       0x7f23ab6cda60
01e64 0f1f84005c1f0027               nop        dword ptr [rax + rax + 0x27001f5c]
01e6c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01e76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e7a e8217db319                     call       0x7f23c5714c20
01e7f f4                             hlt        
01e80 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01e88 458d5a08                       lea        r11d, [r10 + 8]
01e8c 458bcb                         mov        r9d, r11d
01e8f be66ffffff                     mov        esi, 0xffffff66
01e94 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01e9c 448b1424                       mov        r10d, dword ptr [rsp]
01ea0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01ea8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ead 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01eb5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01eba 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ec2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ec7 4c891424                       mov        qword ptr [rsp], r10
01ecb 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ed0 4489542408                     mov        dword ptr [rsp + 8], r10d
01ed5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01eda 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01edf 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01ee4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ee9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01eee 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ef3 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01ef8 c5f877                         vzeroupper 
01efb e8e00aafff                     call       0x7f23ab6cda60
01f00 0f1f8400f81f0028               nop        dword ptr [rax + rax + 0x28001ff8]
01f08 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e8857cb319                     call       0x7f23c5714c20
01f1b f4                             hlt        
01f1c beccffffff                     mov        esi, 0xffffffcc
01f21 448b1424                       mov        r10d, dword ptr [rsp]
01f25 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01f2d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01f32 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01f3a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f3f 4c891424                       mov        qword ptr [rsp], r10
01f43 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01f47 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01f4c c5f877                         vzeroupper 
01f4f e88c0aafff                     call       0x7f23ab6cda60
01f54 0f1f84004c200029               nop        dword ptr [rax + rax + 0x2900204c]
01f5c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6a e8317cb319                     call       0x7f23c5714c20
01f6f f4                             hlt        
01f70 bee4ffffff                     mov        esi, 0xffffffe4
01f75 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
01f7d 448b1424                       mov        r10d, dword ptr [rsp]
01f81 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01f89 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f8e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01f96 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
01f9b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01fa3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fa8 4c891424                       mov        qword ptr [rsp], r10
01fac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01fb1 4489542408                     mov        dword ptr [rsp + 8], r10d
01fb6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01fbb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01fc0 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
01fc5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fca 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01fd2 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fd7 90                             nop        
01fd8 c5f877                         vzeroupper 
01fdb e8000aafff                     call       0x7f23ab6cda60
01fe0 0f1f8400d820002a               nop        dword ptr [rax + rax + 0x2a0020d8]
01fe8 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
01ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff6 e8a57bb319                     call       0x7f23c5714c20
01ffb f4                             hlt        
01ffc bee4ffffff                     mov        esi, 0xffffffe4
02001 448b1c24                       mov        r11d, dword ptr [rsp]
02005 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0200d 448b542404                     mov        r10d, dword ptr [rsp + 4]
02012 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0201a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0201f 4c891424                       mov        qword ptr [rsp], r10
02023 90                             nop        
02024 c5f877                         vzeroupper 
02027 e8b409afff                     call       0x7f23ab6cda60
0202c 0f1f84002421002b               nop        dword ptr [rax + rax + 0x2b002124]
02034 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0203e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02042 e8597bb319                     call       0x7f23c5714c20
02047 f4                             hlt        
02048 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
0204f ffc5                           inc        ebp
02051 bee4ffffff                     mov        esi, 0xffffffe4
02056 448b1424                       mov        r10d, dword ptr [rsp]
0205a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02062 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
02067 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0206f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02074 4c891424                       mov        qword ptr [rsp], r10
02078 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0207d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02082 90                             nop        
02083 90                             nop        
02084 c5f877                         vzeroupper 
02087 e85409afff                     call       0x7f23ab6cda60
0208c 0f1f84008421002c               nop        dword ptr [rax + rax + 0x2c002184]
02094 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0209e 4883e4f0                       and        rsp, 0xfffffffffffffff0
020a2 e8f97ab319                     call       0x7f23c5714c20
020a7 f4                             hlt        
020a8 bee4ffffff                     mov        esi, 0xffffffe4
020ad 448b1c24                       mov        r11d, dword ptr [rsp]
020b1 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
020b9 448b542404                     mov        r10d, dword ptr [rsp + 4]
020be 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
020c6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020cb 4c891424                       mov        qword ptr [rsp], r10
020cf 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
020d4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020d9 90                             nop        
020da 90                             nop        
020db 90                             nop        
020dc c5f877                         vzeroupper 
020df e8fc08afff                     call       0x7f23ab6cda60
020e4 0f1f8400dc21002d               nop        dword ptr [rax + rax + 0x2d0021dc]
020ec 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
020f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020fa e8a17ab319                     call       0x7f23c5714c20
020ff f4                             hlt        
02100 bee4ffffff                     mov        esi, 0xffffffe4
02105 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0210d 448b1c24                       mov        r11d, dword ptr [rsp]
02111 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02119 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0211e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02126 448b542404                     mov        r10d, dword ptr [rsp + 4]
0212b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02133 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02138 4c891424                       mov        qword ptr [rsp], r10
0213c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02141 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02146 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0214b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02150 c5f877                         vzeroupper 
02153 e88808afff                     call       0x7f23ab6cda60
02158 0f1f84005022002e               nop        dword ptr [rax + rax + 0x2e002250]
02160 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0216a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0216e e82d7ab319                     call       0x7f23c5714c20
02173 f4                             hlt        
02174 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
0217e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02182 e8197ab319                     call       0x7f23c5714c20
02187 f4                             hlt        
02188 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
02192 4883e4f0                       and        rsp, 0xfffffffffffffff0
02196 e8057ab319                     call       0x7f23c5714c20
0219b f4                             hlt        
0219c 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
021a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
021aa e8f179b319                     call       0x7f23c5714c20
021af f4                             hlt        
021b0 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
021ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
021be e8dd79b319                     call       0x7f23c5714c20
021c3 f4                             hlt        
021c4 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
021ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
021d2 e8c979b319                     call       0x7f23c5714c20
021d7 f4                             hlt        
021d8 48bf70535684237f0000           movabs     rdi, 0x7f2384565370
021e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021e6 e8b579b319                     call       0x7f23c5714c20
021eb f4                             hlt        
021ec 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
021f4 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
021fc bef6ffffff                     mov        esi, 0xfffffff6
02201 498beb                         mov        rbp, r11
02204 44898c24e0000000               mov        dword ptr [rsp + 0xe0], r9d
0220c 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02214 c5f877                         vzeroupper 
02217 e8c407afff                     call       0x7f23ab6cda60
0221c 0f1f84001423002f               nop        dword ptr [rax + rax + 0x2f002314]
02224 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0222e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02232 e86979b319                     call       0x7f23c5714c20
02237 f4                             hlt        
02238 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
0223d 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
02245 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0224a beccffffff                     mov        esi, 0xffffffcc
0224f 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02257 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
0225f 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
02267 48891c24                       mov        qword ptr [rsp], rbx
0226b 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
02270 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02275 90                             nop        
02276 90                             nop        
02277 90                             nop        
02278 c5f877                         vzeroupper 
0227b e86007afff                     call       0x7f23ab6cda60
02280 0f1f840078230030               nop        dword ptr [rax + rax + 0x30002378]
02288 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
02292 4883e4f0                       and        rsp, 0xfffffffffffffff0
02296 e80579b319                     call       0x7f23c5714c20
0229b f4                             hlt        
0229c beccffffff                     mov        esi, 0xffffffcc
022a1 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
022a9 448b1424                       mov        r10d, dword ptr [rsp]
022ad 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
022b5 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
022ba 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
022c2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
022c7 4c891424                       mov        qword ptr [rsp], r10
022cb 895c2444                       mov        dword ptr [rsp + 0x44], ebx
022cf 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
022d4 c5f877                         vzeroupper 
022d7 e80407afff                     call       0x7f23ab6cda60
022dc 0f1f8400d4230031               nop        dword ptr [rax + rax + 0x310023d4]
022e4 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
022ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
022f2 e8a978b319                     call       0x7f23c5714c20
022f7 f4                             hlt        
022f8 beccffffff                     mov        esi, 0xffffffcc
022fd 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
02305 448b1424                       mov        r10d, dword ptr [rsp]
02309 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02311 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02316 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0231e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
02323 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0232b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02330 4c891424                       mov        qword ptr [rsp], r10
02334 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02339 4489542408                     mov        dword ptr [rsp + 8], r10d
0233e 895c240c                       mov        dword ptr [rsp + 0xc], ebx
02342 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02347 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0234c 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
02351 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02356 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0235b 90                             nop        
0235c c5f877                         vzeroupper 
0235f e87c06afff                     call       0x7f23ab6cda60
02364 0f1f84005c240032               nop        dword ptr [rax + rax + 0x3200245c]
0236c 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
02376 4883e4f0                       and        rsp, 0xfffffffffffffff0
0237a e82178b319                     call       0x7f23c5714c20
0237f f4                             hlt        
02380 beccffffff                     mov        esi, 0xffffffcc
02385 488bac24e0000000               mov        rbp, qword ptr [rsp + 0xe0]
0238d 448b1c24                       mov        r11d, dword ptr [rsp]
02391 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02399 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0239e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
023a6 448b542404                     mov        r10d, dword ptr [rsp + 4]
023ab 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
023b3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023b8 4c891424                       mov        qword ptr [rsp], r10
023bc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023c1 44895c2408                     mov        dword ptr [rsp + 8], r11d
023c6 895c240c                       mov        dword ptr [rsp + 0xc], ebx
023ca 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
023cf 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
023d4 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
023d9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
023de 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
023e3 90                             nop        
023e4 c5f877                         vzeroupper 
023e7 e8f405afff                     call       0x7f23ab6cda60
023ec 0f1f8400e4240033               nop        dword ptr [rax + rax + 0x330024e4]
023f4 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
023fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02402 e89977b319                     call       0x7f23c5714c20
02407 f4                             hlt        
02408 448b1424                       mov        r10d, dword ptr [rsp]
0240c 89742414                       mov        dword ptr [rsp + 0x14], esi
02410 4533c9                         xor        r9d, r9d
02413 e9e4fdffff                     jmp        0x7f23abbdd27c
02418 bef6ffffff                     mov        esi, 0xfffffff6
0241d 90                             nop        
0241e 90                             nop        
0241f 90                             nop        
02420 c5f877                         vzeroupper 
02423 e8b805afff                     call       0x7f23ab6cda60
02428 0f1f840020250034               nop        dword ptr [rax + rax + 0x34002520]
02430 48bf10ed5984237f0000           movabs     rdi, 0x7f238459ed10
0243a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0243e e85d77b319                     call       0x7f23c5714c20
02443 f4                             hlt        
02444 eb14                           jmp        0x7f23abbdd4da
02446 eb12                           jmp        0x7f23abbdd4da
02448 eb10                           jmp        0x7f23abbdd4da
0244a eb0e                           jmp        0x7f23abbdd4da
0244c eb0c                           jmp        0x7f23abbdd4da
0244e eb0a                           jmp        0x7f23abbdd4da
02450 eb08                           jmp        0x7f23abbdd4da
02452 eb06                           jmp        0x7f23abbdd4da
02454 eb04                           jmp        0x7f23abbdd4da
02456 eb02                           jmp        0x7f23abbdd4da
02458 eb00                           jmp        0x7f23abbdd4da
0245a 488bf0                         mov        rsi, rax
0245d e93ee2ffff                     jmp        0x7f23abbdb720
02462 49ba7ac2bdab237f0000           movabs     r10, 0x7f23abbdc27a
0246c 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02473 e9684eb5ff                     jmp        0x7f23ab732360
02478 e8e31cb4ff                     call       0x7f23ab71f1e0
0247d e9bcdbffff                     jmp        0x7f23abbdb0be
02482 f4                             hlt        
02483 f4                             hlt        
02484 f4                             hlt        
02485 f4                             hlt        
02486 f4                             hlt        
02487 f4                             hlt        
