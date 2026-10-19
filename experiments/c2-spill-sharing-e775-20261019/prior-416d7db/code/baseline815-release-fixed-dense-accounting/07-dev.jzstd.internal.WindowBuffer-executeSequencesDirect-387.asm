00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c07fa9ff                   jne        0x7fd1c390f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85fc1d0000                   jne        0x7fd1c3e797ba
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 448bc7                         mov        r8d, edi
0004c 488bee                         mov        rbp, rsi
0004f 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
00053 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00058 448b4e38                       mov        r9d, dword ptr [rsi + 0x38]
0005c 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00061 458bd9                         mov        r11d, r9d
00064 442b5c2438                     sub        r11d, dword ptr [rsp + 0x38]
00069 448b8c24d0000000               mov        r9d, dword ptr [rsp + 0xd0]
00071 453bcb                         cmp        r9d, r11d
00074 0f8f01140000                   jg         0x7fd1c3e78dfb
0007a 488b4608                       mov        rax, qword ptr [rsi + 8]
0007e 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
00082 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
0008a 4c634c2438                     movsxd     r9, dword ptr [rsp + 0x38]
0008f 4c03c8                         add        r9, rax
00092 4d2bd9                         sub        r11, r9
00095 493bcb                         cmp        rcx, r11
00098 0f8fdd130000                   jg         0x7fd1c3e78dfb
0009e 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
000a2 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a6 4d85ed                         test       r13, r13
000a9 0f84cd0d0000                   je         0x7fd1c3e787fc
000af 33ff                           xor        edi, edi
000b1 4c8bda                         mov        r11, rdx
000b4 8b5208                         mov        edx, dword ptr [rdx + 8]
000b7 448b4e44                       mov        r9d, dword ptr [rsi + 0x44]
000bb 4585c0                         test       r8d, r8d
000be 0f8eac130000                   jle        0x7fd1c3e78df0
000c4 4c2be8                         sub        r13, rax
000c7 8d4ae0                         lea        ecx, [rdx - 0x20]
000ca 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
000ce 83c3e0                         add        ebx, -0x20
000d1 418b7208                       mov        esi, dword ptr [r10 + 8]
000d5 85f6                           test       esi, esi
000d7 0f86bd130000                   jbe        0x7fd1c3e78e1a
000dd 895c2448                       mov        dword ptr [rsp + 0x48], ebx
000e1 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
000e5 89542404                       mov        dword ptr [rsp + 4], edx
000e9 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ee 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f3 4889442430                     mov        qword ptr [rsp + 0x30], rax
000f8 4c89542408                     mov        qword ptr [rsp + 8], r10
000fd 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00102 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00107 48896c2458                     mov        qword ptr [rsp + 0x58], rbp
0010c 4c63d6                         movsxd     r10, esi
0010f 4d63d8                         movsxd     r11, r8d
00112 49ffcb                         dec        r11
00115 4d3bda                         cmp        r11, r10
00118 0f8372130000                   jae        0x7fd1c3e78e10
0011e 85ff                           test       edi, edi
00120 0f84ce130000                   je         0x7fd1c3e78e74
00126 448d52f1                       lea        r10d, [rdx - 0xf]
0012a 4585d2                         test       r10d, r10d
0012d 0f8ccd130000                   jl         0x7fd1c3e78e80
00133 458b5108                       mov        r10d, dword ptr [r9 + 8]
00137 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0013c 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00141 897c2464                       mov        dword ptr [rsp + 0x64], edi
00145 458d5af1                       lea        r11d, [r10 - 0xf]
00149 4585db                         test       r11d, r11d
0014c 0f8cba130000                   jl         0x7fd1c3e78e8c
00152 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0015a 458b5208                       mov        r10d, dword ptr [r10 + 8]
0015e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00163 4585d2                         test       r10d, r10d
00166 0f86af130000                   jbe        0x7fd1c3e78e9b
0016c 4183fa01                       cmp        r10d, 1
00170 0f86a5130000                   jbe        0x7fd1c3e78e9b
00176 4183fa02                       cmp        r10d, 2
0017a 0f869b130000                   jbe        0x7fd1c3e78e9b
00180 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00185 4183c2f9                       add        r10d, -7
00189 4585d2                         test       r10d, r10d
0018c 0f8c89130000                   jl         0x7fd1c3e78e9b
00192 448bd2                         mov        r10d, edx
00195 4d8bd9                         mov        r11, r9
00198 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0019d 4183c2f1                       add        r10d, -0xf
001a1 4489542478                     mov        dword ptr [rsp + 0x78], r10d
001a6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
001ab 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
001b0 458d53f1                       lea        r10d, [r11 - 0xf]
001b4 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001b9 4533d2                         xor        r10d, r10d
001bc 4533c9                         xor        r9d, r9d
001bf e9c3010000                     jmp        0x7fd1c3e77d07
001c4 4533db                         xor        r11d, r11d
001c7 418bc3                         mov        eax, r11d
001ca 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
001d2 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
001d6 448bda                         mov        r11d, edx
001d9 4183fb03                       cmp        r11d, 3
001dd 0f8e29020000                   jle        0x7fd1c3e77d8c
001e3 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
001eb 45894314                       mov        dword ptr [r11 + 0x14], r8d
001ef 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
001f3 45894310                       mov        dword ptr [r11 + 0x10], r8d
001f7 448d5afd                       lea        r11d, [rdx - 3]
001fb 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00203 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
0020b 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0020f 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
00217 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
0021f 4c634c2438                     movsxd     r9, dword ptr [rsp + 0x38]
00224 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00229 4863c8                         movsxd     rcx, eax
0022c 4c03c9                         add        r9, rcx
0022f 4d3bd9                         cmp        r11, r9
00232 0f8f380f0000                   jg         0x7fd1c3e78af0
00238 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00240 4585db                         test       r11d, r11d
00243 0f8e7b0e0000                   jle        0x7fd1c3e78a44
00249 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0024e 4403d8                         add        r11d, eax
00251 44039c2480000000               add        r11d, dword ptr [rsp + 0x80]
00259 443b5c2448                     cmp        r11d, dword ptr [rsp + 0x48]
0025e 0f8fa80f0000                   jg         0x7fd1c3e78b8c
00264 458d1c02                       lea        r11d, [r10 + rax]
00268 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0026d 0f8f3d100000                   jg         0x7fd1c3e78c30
00273 83f810                         cmp        eax, 0x10
00276 0f8fd8100000                   jg         0x7fd1c3e78cd4
0027c 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00281 0f83120c0000                   jae        0x7fd1c3e78819
00287 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0028c c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00293 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00298 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
0029d 0f838d0c0000                   jae        0x7fd1c3e788b0
002a3 468d1c10                       lea        r11d, [rax + r10]
002a7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
002ac 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002b1 418bfa                         mov        edi, r10d
002b4 468d1c10                       lea        r11d, [rax + r10]
002b8 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002c0 4d63c2                         movsxd     r8, r10d
002c3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002c8 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
002cf 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
002d7 442b942484000000               sub        r10d, dword ptr [rsp + 0x84]
002df 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002e7 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002ef 4183fb10                       cmp        r11d, 0x10
002f3 0f8fe7100000                   jg         0x7fd1c3e78d60
002f9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00301 4183fa10                       cmp        r10d, 0x10
00305 0f8c72020000                   jl         0x7fd1c3e77efd
0030b 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00313 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00318 0f83860c0000                   jae        0x7fd1c3e78924
0031e 458bd3                         mov        r10d, r11d
00321 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00326 c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
0032d 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00335 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0033a 0f83e80c0000                   jae        0x7fd1c3e789a8
00340 448bd7                         mov        r10d, edi
00343 448bd8                         mov        r11d, eax
00346 4d63ca                         movsxd     r9, r10d
00349 478d0413                       lea        r8d, [r11 + r10]
0034d 4403842480000000               add        r8d, dword ptr [rsp + 0x80]
00355 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0035a 4d63d3                         movsxd     r10, r11d
0035d 4d03d1                         add        r10, r9
00360 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00365 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0036c 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00374 41ffc1                         inc        r9d
00377 443b4c2420                     cmp        r9d, dword ptr [rsp + 0x20]
0037c 0f8df2080000                   jge        0x7fd1c3e785f4
00382 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00387 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0038c 4f8b44cb10                     mov        r8, qword ptr [r11 + r9*8 + 0x10]
00391 4d8bd8                         mov        r11, r8
00394 49c1fb24                       sar        r11, 0x24
00398 458bdb                         mov        r11d, r11d
0039b 418bd3                         mov        edx, r11d
0039e 498bc8                         mov        rcx, r8
003a1 48c1e912                       shr        rcx, 0x12
003a5 458bd8                         mov        r11d, r8d
003a8 448bc1                         mov        r8d, ecx
003ab 4181e3ffff0100                 and        r11d, 0x1ffff
003b2 418bc3                         mov        eax, r11d
003b5 4181e0ffff0300                 and        r8d, 0x3ffff
003bc 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
003c4 448bda                         mov        r11d, edx
003c7 4585db                         test       r11d, r11d
003ca 0f8c140d0000                   jl         0x7fd1c3e78a64
003d0 448bd8                         mov        r11d, eax
003d3 4585db                         test       r11d, r11d
003d6 0f84e8fdffff                   je         0x7fd1c3e77b44
003dc 448b0424                       mov        r8d, dword ptr [rsp]
003e0 452bc2                         sub        r8d, r10d
003e3 453bd8                         cmp        r11d, r8d
003e6 0f8edefdffff                   jle        0x7fd1c3e77b4a
003ec be45ffffff                     mov        esi, 0xffffff45
003f1 418beb                         mov        ebp, r11d
003f4 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
003fc c5f877                         vzeroupper 
003ff e8dcb9acff                     call       0x7fd1c3943760
00404 0f1f8400fc040000               nop        dword ptr [rax + rax + 0x4fc]
0040c 85c0                           test       eax, eax
0040e 7407                           je         0x7fd1c3e77d97
00410 448d5aff                       lea        r11d, [rdx - 1]
00414 418bd3                         mov        edx, r11d
00417 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0041f 418b5b0c                       mov        ebx, dword ptr [r11 + 0xc]
00423 85d2                           test       edx, edx
00425 0f8479090000                   je         0x7fd1c3e78724
0042b 83fa03                         cmp        edx, 3
0042e 0f847d090000                   je         0x7fd1c3e78731
00434 83fa02                         cmp        edx, 2
00437 0f8786000000                   ja         0x7fd1c3e77e43
0043d 3b542414                       cmp        edx, dword ptr [rsp + 0x14]
00441 0f831d110000                   jae        0x7fd1c3e78ee4
00447 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
0044f 418b5c900c                     mov        ebx, dword ptr [r8 + rdx*4 + 0xc]
00454 85d2                           test       edx, edx
00456 7e4b                           jle        0x7fd1c3e77e23
00458 448d5aff                       lea        r11d, [rdx - 1]
0045c 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00461 0f8389150000                   jae        0x7fd1c3e79370
00467 4863fa                         movsxd     rdi, edx
0046a 458bc0                         mov        r8d, r8d
0046d 4183c0d0                       add        r8d, -0x30
00471 41c1e802                       shr        r8d, 2
00475 458d5c10ff                     lea        r11d, [r8 + rdx - 1]
0047a b904000000                     mov        ecx, 4
0047f c442f0f5db                     bzhi       r11, r11, rcx
00484 492bfb                         sub        rdi, r11
00487 48ffcf                         dec        rdi
0048a 4533db                         xor        r11d, r11d
0048d 4885ff                         test       rdi, rdi
00490 490f4cfb                       cmovl      rdi, r11
00494 8bff                           mov        edi, edi
00496 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0049e e998060000                     jmp        0x7fd1c3e784bb
004a3 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
004ab 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
004b3 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
004b7 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
004be e954fdffff                     jmp        0x7fd1c3e77b97
004c3 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
004c8 48be48387ce200000000           movabs     rsi, 0xe27c3848
004d2 48ff742440                     push       qword ptr [rsp + 0x40]
004d7 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
004df 8b6c2420                       mov        ebp, dword ptr [rsp + 0x20]
004e3 896c2404                       mov        dword ptr [rsp + 4], ebp
004e7 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
004ec 4489442410                     mov        dword ptr [rsp + 0x10], r8d
004f1 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
004f5 896c2414                       mov        dword ptr [rsp + 0x14], ebp
004f9 4489542418                     mov        dword ptr [rsp + 0x18], r10d
004fe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00503 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00508 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0050c 896c241c                       mov        dword ptr [rsp + 0x1c], ebp
00510 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
00514 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00518 89442430                       mov        dword ptr [rsp + 0x30], eax
0051c 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
00521 48896c2440                     mov        qword ptr [rsp + 0x40], rbp
00526 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0052b 90                             nop        
0052c c5f877                         vzeroupper 
0052f e8ac89a9ff                     call       0x7fd1c3910860
00534 0f1f84002c060001               nop        dword ptr [rax + rax + 0x100062c]
0053c 4885c0                         test       rax, rax
0053f 0f84bf100000                   je         0x7fd1c3e78f84
00545 488bf0                         mov        rsi, rax
00548 c5f877                         vzeroupper 
0054b 4881c4c0000000                 add        rsp, 0xc0
00552 5d                             pop        rbp
00553 e9880badff                     jmp        0x7fd1c3948a60
00558 4d63d3                         movsxd     r10, r11d
0055b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00562 c442a8f5db                     bzhi       r11, r11, r10
00567 c4c1fb92fb                     kmovq      k7, r11
0056c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00572 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00578 e994050000                     jmp        0x7fd1c3e78491
0057d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00585 44039c2480000000               add        r11d, dword ptr [rsp + 0x80]
0058d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00592 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0059a 0f8dfc020000                   jge        0x7fd1c3e7821c
005a0 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
005a8 4183c208                       add        r10d, 8
005ac 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
005b4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
005bc 4183fb08                       cmp        r11d, 8
005c0 0f8db7010000                   jge        0x7fd1c3e780fd
005c6 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
005ce 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
005d3 0f83c3140000                   jae        0x7fd1c3e7941c
005d9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
005de 430fbe6c130c                   movsx      ebp, byte ptr [r11 + r10 + 0xc]
005e4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
005ec 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
005f1 0f834d150000                   jae        0x7fd1c3e794c4
005f7 4c63d7                         movsxd     r10, edi
005fa 4c63d8                         movsxd     r11, eax
005fd 4d03da                         add        r11, r10
00600 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00605 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
0060a 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00612 4183c303                       add        r11d, 3
00616 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
0061e 41ffc1                         inc        r9d
00621 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00626 0f83a4150000                   jae        0x7fd1c3e79550
0062c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00634 4183c303                       add        r11d, 3
00638 48638c248c000000               movsxd     rcx, dword ptr [rsp + 0x8c]
00640 410fbe6c0a0d                   movsx      ebp, byte ptr [r10 + rcx + 0xd]
00646 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
0064b 0f8313160000                   jae        0x7fd1c3e795e4
00651 4c63d7                         movsxd     r10, edi
00654 4c63c0                         movsxd     r8, eax
00657 4d03c2                         add        r8, r10
0065a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0065f 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00664 450fbe5c0a0e                   movsx      r11d, byte ptr [r10 + rcx + 0xe]
0066a 47885c020e                     mov        byte ptr [r10 + r8 + 0xe], r11b
0066f 450fbe540a0f                   movsx      r10d, byte ptr [r10 + rcx + 0xf]
00675 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0067a 478854030f                     mov        byte ptr [r11 + r8 + 0xf], r10b
0067f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00687 4183fb08                       cmp        r11d, 8
0068b 0f8357160000                   jae        0x7fd1c3e79668
00691 49bab08c79e200000000           movabs     r10, 0xe2798cb0
0069b 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
006a3 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
006a8 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
006b0 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
006b8 4183fa04                       cmp        r10d, 4
006bc 7e3e                           jle        0x7fd1c3e7807c
006be 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
006c5 83c504                         add        ebp, 4
006c8 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
006cd 418bd1                         mov        edx, r9d
006d0 c5f877                         vzeroupper 
006d3 e80888a9ff                     call       0x7fd1c3910860
006d8 0f1f8400d0070002               nop        dword ptr [rax + rax + 0x20007d0]
006e0 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
006e5 8bd5                           mov        edx, ebp
006e7 8bc8                           mov        ecx, eax
006e9 488bee                         mov        rbp, rsi
006ec c5f877                         vzeroupper 
006ef e8ec87a9ff                     call       0x7fd1c3910860
006f4 0f1f8400ec070003               nop        dword ptr [rax + rax + 0x30007ec]
006fc 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00704 4183fa08                       cmp        r10d, 8
00708 0f8e5efcffff                   jle        0x7fd1c3e77cec
0070e 49bae08c79e200000000           movabs     r10, 0xe2798ce0
00718 8b9424d0000000                 mov        edx, dword ptr [rsp + 0xd0]
0071f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00727 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
0072c 83c208                         add        edx, 8
0072f 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00734 488bee                         mov        rbp, rsi
00737 90                             nop        
00738 c5f877                         vzeroupper 
0073b e8a087a9ff                     call       0x7fd1c3910860
00740 0f1f840038080004               nop        dword ptr [rax + rax + 0x4000838]
00748 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00750 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00758 488bf5                         mov        rsi, rbp
0075b 8b942490000000                 mov        edx, dword ptr [rsp + 0x90]
00762 488bc8                         mov        rcx, rax
00765 666690                         nop        
00768 c5f877                         vzeroupper 
0076b e87087a9ff                     call       0x7fd1c3910860
00770 0f1f840068080005               nop        dword ptr [rax + rax + 0x5000868]
00778 e9effbffff                     jmp        0x7fd1c3e77cec
0077d 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00782 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
00789 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00790 c5f877                         vzeroupper 
00793 e84887a9ff                     call       0x7fd1c3910860
00798 0f1f840090080006               nop        dword ptr [rax + rax + 0x6000890]
007a0 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
007a5 8bd5                           mov        edx, ebp
007a7 488bc8                         mov        rcx, rax
007aa 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
007b1 666690                         nop        
007b4 c5f877                         vzeroupper 
007b7 e82487a9ff                     call       0x7fd1c3910860
007bc 0f1f8400b4080007               nop        dword ptr [rax + rax + 0x70008b4]
007c4 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
007cc 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
007d1 0f8d95fbffff                   jge        0x7fd1c3e77cec
007d7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007dc 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
007e3 0f8e4f050000                   jle        0x7fd1c3e786b8
007e9 448bd5                         mov        r10d, ebp
007ec 4183c208                       add        r10d, 8
007f0 be66ffffff                     mov        esi, 0xffffff66
007f5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
007fa 448b1c24                       mov        r11d, dword ptr [rsp]
007fe 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00806 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0080b 4c891c24                       mov        qword ptr [rsp], r11
0080f 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00814 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0081c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00821 44895c2408                     mov        dword ptr [rsp + 8], r11d
00826 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0082b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00830 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00835 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0083a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0083f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00844 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00849 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0084e 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00853 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00858 458bd8                         mov        r11d, r8d
0085b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00860 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00865 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0086a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0086f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00874 48894424f8                     mov        qword ptr [rsp - 8], rax
00879 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
00880 89442458                       mov        dword ptr [rsp + 0x58], eax
00884 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00889 666690                         nop        
0088c c5f877                         vzeroupper 
0088f e84cb5acff                     call       0x7fd1c3943760
00894 0f1f84008c090008               nop        dword ptr [rax + rax + 0x800098c]
0089c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
008a4 4183fb30                       cmp        r11d, 0x30
008a8 0f8fce010000                   jg         0x7fd1c3e783fc
008ae 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
008b2 83c5f9                         add        ebp, -7
008b5 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
008bc 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
008c4 443bd5                         cmp        r10d, ebp
008c7 0f834f0d0000                   jae        0x7fd1c3e78f9c
008cd 418bea                         mov        ebp, r10d
008d0 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
008d7 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008dc 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
008e1 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
008e9 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
008f1 0f83e10d0000                   jae        0x7fd1c3e79058
008f7 448bd7                         mov        r10d, edi
008fa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
008ff 4d63da                         movsxd     r11, r10d
00902 448bd0                         mov        r10d, eax
00905 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0090d 4d63d2                         movsxd     r10, r10d
00910 4b8d4c1a0c                     lea        rcx, [r10 + r11 + 0xc]
00915 48894424f8                     mov        qword ptr [rsp - 8], rax
0091a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00921 898424d0000000                 mov        dword ptr [rsp + 0xd0], eax
00928 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092d 48be00b722e200000000           movabs     rsi, 0xe222b700
00937 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
0093c 4533c9                         xor        r9d, r9d
0093f 90                             nop        
00940 c5f877                         vzeroupper 
00943 e8987ba9ff                     call       0x7fd1c390fe60
00948 0f1f8400400a0009               nop        dword ptr [rax + rax + 0x9000a40]
00950 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
00957 036c242c                       add        ebp, dword ptr [rsp + 0x2c]
0095b 896c242c                       mov        dword ptr [rsp + 0x2c], ebp
0095f 448d5d08                       lea        r11d, [rbp + 8]
00963 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0096b 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00970 0f8da8010000                   jge        0x7fd1c3e7849e
00976 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0097e 442bdd                         sub        r11d, ebp
00981 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00989 4c63442424                     movsxd     r8, dword ptr [rsp + 0x24]
0098e 4983c0f9                       add        r8, -7
00992 4d63cb                         movsxd     r9, r11d
00995 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
0099d 4f8d140b                       lea        r10, [r11 + r9]
009a1 4d3bd0                         cmp        r10, r8
009a4 0f83a60e0000                   jae        0x7fd1c3e791d0
009aa 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
009af 4d2bd3                         sub        r10, r11
009b2 4983c207                       add        r10, 7
009b6 4983e2f8                       and        r10, 0xfffffffffffffff8
009ba 458bd2                         mov        r10d, r10d
009bd 458d5c2a08                     lea        r11d, [r10 + rbp + 8]
009c2 4d63db                         movsxd     r11, r11d
009c5 4f8d5419f8                     lea        r10, [r9 + r11 - 8]
009ca 4d3bd0                         cmp        r10, r8
009cd 0f837d0e0000                   jae        0x7fd1c3e791d0
009d3 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
009db 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
009e3 0f83670e0000                   jae        0x7fd1c3e791d0
009e9 4983c3f8                       add        r11, -8
009ed 4d3bd8                         cmp        r11, r8
009f0 0f835a0e0000                   jae        0x7fd1c3e791d0
009f6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
009fb 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00a02 0f8f140f0000                   jg         0x7fd1c3e7929c
00a08 0f1f840000000000               nop        dword ptr [rax + rax]
00a10 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a18 4963cb                         movsxd     rcx, r11d
00a1b 4883c10c                       add        rcx, 0xc
00a1f 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00a26 03ac24d0000000                 add        ebp, dword ptr [rsp + 0xd0]
00a2d 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00a32 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00a37 48be00b722e200000000           movabs     rsi, 0xe222b700
00a41 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00a46 4533c9                         xor        r9d, r9d
00a49 666690                         nop        
00a4c c5f877                         vzeroupper 
00a4f e88c7aa9ff                     call       0x7fd1c390fe60
00a54 0f1f84004c0b000a               nop        dword ptr [rax + rax + 0xa000b4c]
00a5c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a64 4183c308                       add        r11d, 8
00a68 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00a70 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00a75 7c99                           jl         0x7fd1c3e78390
00a77 e9a2000000                     jmp        0x7fd1c3e7849e
00a7c 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00a84 4585db                         test       r11d, r11d
00a87 0f8c130d0000                   jl         0x7fd1c3e79120
00a8d 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00a95 4585d2                         test       r10d, r10d
00a98 0f8c020d0000                   jl         0x7fd1c3e79120
00a9e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00aa6 4503d3                         add        r10d, r11d
00aa9 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00aae 453bca                         cmp        r9d, r10d
00ab1 0f82e90c0000                   jb         0x7fd1c3e79120
00ab7 458bd1                         mov        r10d, r9d
00aba 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00abf 0f82db0c0000                   jb         0x7fd1c3e79120
00ac5 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00acd 4585db                         test       r11d, r11d
00ad0 743f                           je         0x7fd1c3e78491
00ad2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ad7 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00adf 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
00ae4 4903c8                         add        rcx, r8
00ae7 498d740a0c                     lea        rsi, [r10 + rcx + 0xc]
00aec 4963d3                         movsxd     rdx, r11d
00aef 4883fa20                       cmp        rdx, 0x20
00af3 0f865ffaffff                   jbe        0x7fd1c3e77ed8
00af9 c5f877                         vzeroupper 
00afc 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00b06 41ffd2                         call       r10
00b09 0f1f840000000000               nop        dword ptr [rax + rax]
00b11 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b19 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b1e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b23 44039c2480000000               add        r11d, dword ptr [rsp + 0x80]
00b2b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b30 e937f8ffff                     jmp        0x7fd1c3e77cec
00b35 666690                         nop        
00b38 418bd0                         mov        edx, r8d
00b3b 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00b43 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
00b48 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
00b50 45895c910c                     mov        dword ptr [r9 + rdx*4 + 0xc], r11d
00b55 448d42ff                       lea        r8d, [rdx - 1]
00b59 443bc7                         cmp        r8d, edi
00b5c 7fda                           jg         0x7fd1c3e784b8
00b5e 4183f83f                       cmp        r8d, 0x3f
00b62 0f8e2c0f0000                   jle        0x7fd1c3e79414
00b68 448bda                         mov        r11d, edx
00b6b 41ffcb                         dec        r11d
00b6e 418bcb                         mov        ecx, r11d
00b71 eb10                           jmp        0x7fd1c3e78503
00b73 0f1f8000000000                 nop        dword ptr [rax]
00b7a 660f1f440000                   nop        word ptr [rax + rax]
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
00beb 7f93                           jg         0x7fd1c3e78500
00bed 4183fb0f                       cmp        r11d, 0xf
00bf1 7e31                           jle        0x7fd1c3e785a4
00bf3 448bd9                         mov        r11d, ecx
00bf6 4183c3c0                       add        r11d, -0x40
00bfa 6690                           nop        
00bfc 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00c04 62917e486f8498ccffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x34]
00c0f 62917e487f8498d0ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x30], zmm0
00c1a 4183c3f0                       add        r11d, -0x10
00c1e 4183fb0f                       cmp        r11d, 0xf
00c22 7fd8                           jg         0x7fd1c3e7857c
00c24 4585db                         test       r11d, r11d
00c27 0f8e7ef8ffff                   jle        0x7fd1c3e77e2b
00c2d 666690                         nop        
00c30 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00c38 478b4c9808                     mov        r9d, dword ptr [r8 + r11*4 + 8]
00c3d 47894c980c                     mov        dword ptr [r8 + r11*4 + 0xc], r9d
00c42 41ffcb                         dec        r11d
00c45 4585db                         test       r11d, r11d
00c48 7fe6                           jg         0x7fd1c3e785b0
00c4a e95cf8ffff                     jmp        0x7fd1c3e77e2b
00c4f 4d63d2                         movsxd     r10, r10d
00c52 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c59 c442a8f5db                     bzhi       r11, r11, r10
00c5e c4c1fb92fb                     kmovq      k7, r11
00c63 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c69 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c6f e995000000                     jmp        0x7fd1c3e78689
00c74 448b1c24                       mov        r11d, dword ptr [rsp]
00c78 458bd3                         mov        r10d, r11d
00c7b 442b542428                     sub        r10d, dword ptr [rsp + 0x28]
00c80 488b6c2458                     mov        rbp, qword ptr [rsp + 0x58]
00c85 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c8a 8b542404                       mov        edx, dword ptr [rsp + 4]
00c8e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c93 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
00c97 418b7908                       mov        edi, dword ptr [r9 + 8]
00c9b 85c9                           test       ecx, ecx
00c9d 0f8cdd100000                   jl         0x7fd1c3e79700
00ca3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ca8 4585c0                         test       r8d, r8d
00cab 0f8cd4100000                   jl         0x7fd1c3e79705
00cb1 3b1424                         cmp        edx, dword ptr [rsp]
00cb4 0f82cb100000                   jb         0x7fd1c3e79705
00cba 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00cbe 4103da                         add        ebx, r10d
00cc1 3bfb                           cmp        edi, ebx
00cc3 0f82bc100000                   jb         0x7fd1c3e79705
00cc9 4585d2                         test       r10d, r10d
00ccc 0f8cb3100000                   jl         0x7fd1c3e79705
00cd2 4585d2                         test       r10d, r10d
00cd5 7432                           je         0x7fd1c3e78689
00cd7 498d7c0b0c                     lea        rdi, [r11 + rcx + 0xc]
00cdc 4d8bd9                         mov        r11, r9
00cdf 4b8d74010c                     lea        rsi, [r9 + r8 + 0xc]
00ce4 4963d2                         movsxd     rdx, r10d
00ce7 4883fa20                       cmp        rdx, 0x20
00ceb 0f865effffff                   jbe        0x7fd1c3e785cf
00cf1 c5f877                         vzeroupper 
00cf4 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00cfe 41ffd2                         call       r10
00d01 0f1f840000000000               nop        dword ptr [rax + rax]
00d09 895d3c                         mov        dword ptr [rbp + 0x3c], ebx
00d0c c5f877                         vzeroupper 
00d0f 4881c4c0000000                 add        rsp, 0xc0
00d16 5d                             pop        rbp
00d17 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d1b 0f8703110000                   ja         0x7fd1c3e797a4
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
00d5b e88081a9ff                     call       0x7fd1c3910860
00d60 0f1f8400580e000b               nop        dword ptr [rax + rax + 0xb000e58]
00d68 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00d70 8b942490000000                 mov        edx, dword ptr [rsp + 0x90]
00d77 488bc8                         mov        rcx, rax
00d7a 6690                           nop        
00d7c c5f877                         vzeroupper 
00d7f e85c81a9ff                     call       0x7fd1c3910860
00d84 0f1f84007c0e000c               nop        dword ptr [rax + rax + 0xc000e7c]
00d8c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00d94 4183c208                       add        r10d, 8
00d98 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00d9d 7c91                           jl         0x7fd1c3e786b0
00d9f e9c8f5ffff                     jmp        0x7fd1c3e77cec
00da4 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
00dac e906f7ffff                     jmp        0x7fd1c3e77e37
00db1 ffcb                           dec        ebx
00db3 85db                           test       ebx, ebx
00db5 7e2d                           jle        0x7fd1c3e78764
00db7 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00dbf 45894314                       mov        dword ptr [r11 + 0x14], r8d
00dc3 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00dc7 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00dcf 45895810                       mov        dword ptr [r8 + 0x10], r11d
00dd3 4189580c                       mov        dword ptr [r8 + 0xc], ebx
00dd7 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
00ddf e9d3f6ffff                     jmp        0x7fd1c3e77e37
00de4 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00de9 48be08387ce200000000           movabs     rsi, 0xe27c3808
00df3 48ff742440                     push       qword ptr [rsp + 0x40]
00df8 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
00e00 8b6c2420                       mov        ebp, dword ptr [rsp + 0x20]
00e04 896c2404                       mov        dword ptr [rsp + 4], ebp
00e08 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e0d 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00e12 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00e16 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00e1a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00e1f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00e24 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e29 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
00e2d 896c241c                       mov        dword ptr [rsp + 0x1c], ebp
00e31 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
00e35 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00e39 89442430                       mov        dword ptr [rsp + 0x30], eax
00e3d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
00e42 48896c2440                     mov        qword ptr [rsp + 0x40], rbp
00e47 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
00e4c c5f877                         vzeroupper 
00e4f e88c80a9ff                     call       0x7fd1c3910860
00e54 0f1f84004c0f000d               nop        dword ptr [rax + rax + 0xd000f4c]
00e5c 4885c0                         test       rax, rax
00e5f 0f85e0f6ffff                   jne        0x7fd1c3e77ec5
00e65 bef6ffffff                     mov        esi, 0xfffffff6
00e6a 6690                           nop        
00e6c c5f877                         vzeroupper 
00e6f e86cafacff                     call       0x7fd1c3943760
00e74 0f1f84006c0f000e               nop        dword ptr [rax + rax + 0xe000f6c]
00e7c 4c03c9                         add        r9, rcx
00e7f 4d3bce                         cmp        r9, r14
00e82 7e08                           jle        0x7fd1c3e7880c
00e84 4533ed                         xor        r13d, r13d
00e87 e923f2ffff                     jmp        0x7fd1c3e77a2f
00e8c 4533ed                         xor        r13d, r13d
00e8f bf01000000                     mov        edi, 1
00e94 e918f2ffff                     jmp        0x7fd1c3e77a31
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
00ee3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ee8 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00eed 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ef2 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00ef7 89442428                       mov        dword ptr [rsp + 0x28], eax
00efb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f00 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00f05 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00f0a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f0f 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00f14 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f19 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00f1e 6690                           nop        
00f20 c5f877                         vzeroupper 
00f23 e8b8aeacff                     call       0x7fd1c3943760
00f28 0f1f84002010000f               nop        dword ptr [rax + rax + 0xf001020]
00f30 bee4ffffff                     mov        esi, 0xffffffe4
00f35 498beb                         mov        rbp, r11
00f38 448b0424                       mov        r8d, dword ptr [rsp]
00f3c 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00f44 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00f49 4c891c24                       mov        qword ptr [rsp], r11
00f4d 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00f52 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00f5a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f5f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00f64 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f69 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f6e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f73 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f78 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f7d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f82 89442428                       mov        dword ptr [rsp + 0x28], eax
00f86 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f8b c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00f91 666690                         nop        
00f94 c5f877                         vzeroupper 
00f97 e844aeacff                     call       0x7fd1c3943760
00f9c 0f1f840094100010               nop        dword ptr [rax + rax + 0x10001094]
00fa4 bee4ffffff                     mov        esi, 0xffffffe4
00fa9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00fae 448b1c24                       mov        r11d, dword ptr [rsp]
00fb2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00fba 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fbf 4c891424                       mov        qword ptr [rsp], r10
00fc3 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00fc8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00fd0 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fd5 4489542408                     mov        dword ptr [rsp + 8], r10d
00fda 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00fdf 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00fe4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fe9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fee 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ff3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00ff8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ffd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01002 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01007 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0100c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01011 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01016 6690                           nop        
01018 c5f877                         vzeroupper 
0101b e8c0adacff                     call       0x7fd1c3943760
01020 0f1f840018110011               nop        dword ptr [rax + rax + 0x11001118]
01028 bee4ffffff                     mov        esi, 0xffffffe4
0102d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01032 448b1c24                       mov        r11d, dword ptr [rsp]
01036 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0103e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01043 4c891424                       mov        qword ptr [rsp], r10
01047 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0104c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01054 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0105c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01061 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01066 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0106b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01070 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01075 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0107a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0107f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01084 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01089 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0108e c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01094 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01099 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0109e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
010a3 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
010a8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010ad 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
010b2 6690                           nop        
010b4 c5f877                         vzeroupper 
010b7 e824adacff                     call       0x7fd1c3943760
010bc 0f1f8400b4110012               nop        dword ptr [rax + rax + 0x120011b4]
010c4 be45ffffff                     mov        esi, 0xffffff45
010c9 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
010d1 666690                         nop        
010d4 c5f877                         vzeroupper 
010d7 e804adacff                     call       0x7fd1c3943760
010dc 0f1f8400d4110013               nop        dword ptr [rax + rax + 0x130011d4]
010e4 be45ffffff                     mov        esi, 0xffffff45
010e9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
010ee 448b0424                       mov        r8d, dword ptr [rsp]
010f2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
010fa 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010ff 4c891c24                       mov        qword ptr [rsp], r11
01103 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01108 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01110 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01115 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0111a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0111f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01124 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01129 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0112e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01133 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01138 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0113d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01142 89442428                       mov        dword ptr [rsp + 0x28], eax
01146 89542430                       mov        dword ptr [rsp + 0x30], edx
0114a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0114f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01154 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01159 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0115e 6690                           nop        
01160 c5f877                         vzeroupper 
01163 e878acacff                     call       0x7fd1c3943760
01168 0f1f840060120014               nop        dword ptr [rax + rax + 0x14001260]
01170 4d3bd9                         cmp        r11, r9
01173 bdffffffff                     mov        ebp, 0xffffffff
01178 7c08                           jl         0x7fd1c3e78b02
0117a 400f95c5                       setne      bpl
0117e 400fb6ed                       movzx      ebp, bpl
01182 be45ffffff                     mov        esi, 0xffffff45
01187 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0118c 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01194 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01199 44895c2404                     mov        dword ptr [rsp + 4], r11d
0119e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
011a3 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
011a8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
011ad 4489442414                     mov        dword ptr [rsp + 0x14], r8d
011b2 4489542418                     mov        dword ptr [rsp + 0x18], r10d
011b7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
011c1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
011c6 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
011cb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
011d0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
011d5 89442430                       mov        dword ptr [rsp + 0x30], eax
011d9 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
011de 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
011e3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
011e8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
011ed 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
011f2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
011f7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
011fc c5f877                         vzeroupper 
011ff e8dcabacff                     call       0x7fd1c3943760
01204 0f1f8400fc120015               nop        dword ptr [rax + rax + 0x150012fc]
0120c be45ffffff                     mov        esi, 0xffffff45
01211 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01216 448b0424                       mov        r8d, dword ptr [rsp]
0121a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01222 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01227 4c890424                       mov        qword ptr [rsp], r8
0122b 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
01230 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
01238 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0123d 4489442408                     mov        dword ptr [rsp + 8], r8d
01242 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01247 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0124c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01251 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01256 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0125b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01260 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01265 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0126a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0126f 89442428                       mov        dword ptr [rsp + 0x28], eax
01273 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01278 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0127d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01282 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01287 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0128c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01291 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01296 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0129b 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
012a0 c5f877                         vzeroupper 
012a3 e838abacff                     call       0x7fd1c3943760
012a8 0f1f8400a0130016               nop        dword ptr [rax + rax + 0x160013a0]
012b0 be45ffffff                     mov        esi, 0xffffff45
012b5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
012ba 448b0c24                       mov        r9d, dword ptr [rsp]
012be 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
012c6 4c8b442408                     mov        r8, qword ptr [rsp + 8]
012cb 4c890424                       mov        qword ptr [rsp], r8
012cf 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
012d4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
012dc 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
012e1 44894c2408                     mov        dword ptr [rsp + 8], r9d
012e6 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
012eb 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
012f0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012f5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
012fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012ff 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01304 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01309 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0130e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01313 89442428                       mov        dword ptr [rsp + 0x28], eax
01317 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0131c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01321 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01326 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0132b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01330 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01335 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0133a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0133f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01344 c5f877                         vzeroupper 
01347 e894aaacff                     call       0x7fd1c3943760
0134c 0f1f840044140017               nop        dword ptr [rax + rax + 0x17001444]
01354 be45ffffff                     mov        esi, 0xffffff45
01359 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0135e 448b0424                       mov        r8d, dword ptr [rsp]
01362 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0136a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0136f 4c891c24                       mov        qword ptr [rsp], r11
01373 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01378 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01380 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01385 4489442408                     mov        dword ptr [rsp + 8], r8d
0138a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0138f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01394 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01399 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0139e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013a3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
013a8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013ad 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
013b2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013b7 89442434                       mov        dword ptr [rsp + 0x34], eax
013bb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
013c0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
013c5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
013ca 4c89542440                     mov        qword ptr [rsp + 0x40], r10
013cf 90                             nop        
013d0 c5f877                         vzeroupper 
013d3 e808aaacff                     call       0x7fd1c3943760
013d8 0f1f8400d0140018               nop        dword ptr [rax + rax + 0x180014d0]
013e0 be45ffffff                     mov        esi, 0xffffff45
013e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
013ea 448b1424                       mov        r10d, dword ptr [rsp]
013ee 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
013f6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013fb 4c891424                       mov        qword ptr [rsp], r10
013ff 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01404 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0140c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01411 4489542408                     mov        dword ptr [rsp + 8], r10d
01416 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0141b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01420 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01425 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0142a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0142f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01434 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01439 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0143e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01446 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0144b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01450 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01455 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0145a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0145f 90                             nop        
01460 c5f877                         vzeroupper 
01463 e878a9acff                     call       0x7fd1c3943760
01468 0f1f840060150019               nop        dword ptr [rax + rax + 0x19001560]
01470 448b1424                       mov        r10d, dword ptr [rsp]
01474 33c9                           xor        ecx, ecx
01476 e91cf8ffff                     jmp        0x7fd1c3e78617
0147b be17000000                     mov        esi, 0x17
01480 c5f877                         vzeroupper 
01483 e858a9acff                     call       0x7fd1c3943760
01488 0f1f84008015001a               nop        dword ptr [rax + rax + 0x1a001580]
01490 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01495 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0149a be6effffff                     mov        esi, 0xffffff6e
0149f 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
014a7 4c89542408                     mov        qword ptr [rsp + 8], r10
014ac 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
014b1 48894424f8                     mov        qword ptr [rsp - 8], rax
014b6 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014ba 89442414                       mov        dword ptr [rsp + 0x14], eax
014be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c3 4889442418                     mov        qword ptr [rsp + 0x18], rax
014c8 895c2420                       mov        dword ptr [rsp + 0x20], ebx
014cc 894c2424                       mov        dword ptr [rsp + 0x24], ecx
014d0 4489442428                     mov        dword ptr [rsp + 0x28], r8d
014d5 897c2438                       mov        dword ptr [rsp + 0x38], edi
014d9 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
014de 4c89742448                     mov        qword ptr [rsp + 0x48], r14
014e3 90                             nop        
014e4 c5f877                         vzeroupper 
014e7 e8f4a8acff                     call       0x7fd1c3943760
014ec 0f1f8400e415001b               nop        dword ptr [rax + rax + 0x1b0015e4]
014f4 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
014f9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014fe eb9a                           jmp        0x7fd1c3e78e1a
01500 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01505 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0150a eb8e                           jmp        0x7fd1c3e78e1a
0150c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01511 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01516 e97fffffff                     jmp        0x7fd1c3e78e1a
0151b bebeffffff                     mov        esi, 0xffffffbe
01520 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01525 448b1c24                       mov        r11d, dword ptr [rsp]
01529 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01531 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01536 4c891424                       mov        qword ptr [rsp], r10
0153a 44894c2408                     mov        dword ptr [rsp + 8], r9d
0153f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01544 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01549 4889442410                     mov        qword ptr [rsp + 0x10], rax
0154e 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01552 6690                           nop        
01554 c5f877                         vzeroupper 
01557 e884a8acff                     call       0x7fd1c3943760
0155c 0f1f84005416001c               nop        dword ptr [rax + rax + 0x1c001654]
01564 bee4ffffff                     mov        esi, 0xffffffe4
01569 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0156e 448b0424                       mov        r8d, dword ptr [rsp]
01572 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0157a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0157f 4c891c24                       mov        qword ptr [rsp], r11
01583 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01588 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01590 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01595 4489442408                     mov        dword ptr [rsp + 8], r8d
0159a 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0159f 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015a4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015a9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015ae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
015b8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015bd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015c2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015c7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015cc 89442428                       mov        dword ptr [rsp + 0x28], eax
015d0 8954243c                       mov        dword ptr [rsp + 0x3c], edx
015d4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
015d9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
015de 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015e3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
015e8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
015ed 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
015f2 6690                           nop        
015f4 c5f877                         vzeroupper 
015f7 e8e4a7acff                     call       0x7fd1c3943760
015fc 0f1f8400f416001d               nop        dword ptr [rax + rax + 0x1d0016f4]
01604 bef6ffffff                     mov        esi, 0xfffffff6
01609 666690                         nop        
0160c c5f877                         vzeroupper 
0160f e8cca7acff                     call       0x7fd1c3943760
01614 0f1f84000c17001e               nop        dword ptr [rax + rax + 0x1e00170c]
0161c bee4ffffff                     mov        esi, 0xffffffe4
01621 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01626 448b1c24                       mov        r11d, dword ptr [rsp]
0162a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01632 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01637 4c891424                       mov        qword ptr [rsp], r10
0163b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01640 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01648 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0164d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01652 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0165a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0165f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01664 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01669 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0166e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01673 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01678 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0167d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01682 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01687 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0168c 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01691 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01699 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0169e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
016a3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
016a8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
016ad 4489542458                     mov        dword ptr [rsp + 0x58], r10d
016b2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
016b7 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
016bc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
016c1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016c6 6690                           nop        
016c8 c5f877                         vzeroupper 
016cb e810a7acff                     call       0x7fd1c3943760
016d0 0f1f8400c817001f               nop        dword ptr [rax + rax + 0x1f0017c8]
016d8 bee4ffffff                     mov        esi, 0xffffffe4
016dd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016e2 448b1c24                       mov        r11d, dword ptr [rsp]
016e6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
016ee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016f3 4c891424                       mov        qword ptr [rsp], r10
016f7 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
016fc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01704 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01709 4489542408                     mov        dword ptr [rsp + 8], r10d
0170e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01716 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0171b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01720 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01725 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0172a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0172f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01734 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01739 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0173e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01743 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01748 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0174d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01752 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01757 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0175c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01761 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01766 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0176b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01770 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01775 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0177a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0177f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01784 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01789 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0178e 6690                           nop        
01790 c5f877                         vzeroupper 
01793 e848a6acff                     call       0x7fd1c3943760
01798 0f1f840090180020               nop        dword ptr [rax + rax + 0x20001890]
017a0 beccffffff                     mov        esi, 0xffffffcc
017a5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017aa 448b1424                       mov        r10d, dword ptr [rsp]
017ae 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
017b6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017bb 4c891424                       mov        qword ptr [rsp], r10
017bf 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
017c4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017cc 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
017d1 4489542408                     mov        dword ptr [rsp + 8], r10d
017d6 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
017de 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017e3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017e8 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017ed 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017f2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017f7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017fc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01801 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01806 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0180b 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01813 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01818 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0181d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01822 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01827 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0182c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01831 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01836 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0183b 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01840 c5f877                         vzeroupper 
01843 e898a5acff                     call       0x7fd1c3943760
01848 0f1f840040190021               nop        dword ptr [rax + rax + 0x21001940]
01850 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01858 458d5308                       lea        r10d, [r11 + 8]
0185c 458bca                         mov        r9d, r10d
0185f be6effffff                     mov        esi, 0xffffff6e
01864 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01869 448b1424                       mov        r10d, dword ptr [rsp]
0186d 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01875 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0187a 4c891424                       mov        qword ptr [rsp], r10
0187e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01883 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0188b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01890 4489542408                     mov        dword ptr [rsp + 8], r10d
01895 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0189a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0189f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018a4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018a9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018ae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018b3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018b8 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018bd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018c2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018c7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
018cc 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
018d1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
018d6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018db 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018e0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018e5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018ea 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018ef 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
018f4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018f9 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018fe 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01906 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e8cca4acff                     call       0x7fd1c3943760
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
0197f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01984 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01989 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0198e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01993 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01998 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0199d 458bda                         mov        r11d, r10d
019a0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
019a5 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019aa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019af 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019b4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019b9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
019be 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019c3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
019c8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019cd 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
019d5 458bda                         mov        r11d, r10d
019d8 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
019dd 666690                         nop        
019e0 c5f877                         vzeroupper 
019e3 e8f8a3acff                     call       0x7fd1c3943760
019e8 0f1f8400e01a0023               nop        dword ptr [rax + rax + 0x23001ae0]
019f0 be6effffff                     mov        esi, 0xffffff6e
019f5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019fa 448b1c24                       mov        r11d, dword ptr [rsp]
019fe 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01a06 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01a0b 4c891c24                       mov        qword ptr [rsp], r11
01a0f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a14 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01a1c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01a21 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a26 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01a2b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a30 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a35 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a3a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a3f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a44 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a49 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a4e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a53 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a58 89442428                       mov        dword ptr [rsp + 0x28], eax
01a5c 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a60 89542440                       mov        dword ptr [rsp + 0x40], edx
01a64 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a69 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a6e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a73 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a78 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01a7d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a82 6690                           nop        
01a84 c5f877                         vzeroupper 
01a87 e854a3acff                     call       0x7fd1c3943760
01a8c 0f1f8400841b0024               nop        dword ptr [rax + rax + 0x24001b84]
01a94 458bd8                         mov        r11d, r8d
01a97 e988f1ffff                     jmp        0x7fd1c3e785a4
01a9c bee4ffffff                     mov        esi, 0xffffffe4
01aa1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01aa6 448b1424                       mov        r10d, dword ptr [rsp]
01aaa 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01ab2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ab7 4c891424                       mov        qword ptr [rsp], r10
01abb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01ac0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01ac8 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01acd 4489542408                     mov        dword ptr [rsp + 8], r10d
01ad2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ad7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01adc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ae1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ae6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01aeb 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01af0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01af5 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01afa 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b02 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01b07 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01b0f 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b14 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b19 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b1e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b23 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01b28 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b2d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01b32 6690                           nop        
01b34 c5f877                         vzeroupper 
01b37 e8a4a2acff                     call       0x7fd1c3943760
01b3c 0f1f8400341c0025               nop        dword ptr [rax + rax + 0x25001c34]
01b44 bee4ffffff                     mov        esi, 0xffffffe4
01b49 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b4e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01b56 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b5b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01b60 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01b65 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b6a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b6f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b74 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b7e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b83 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b88 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b8d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b92 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b9a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b9f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ba4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01ba9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01bae 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01bb3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01bb8 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01bbd 666690                         nop        
01bc0 c5f877                         vzeroupper 
01bc3 e818a2acff                     call       0x7fd1c3943760
01bc8 0f1f8400c01c0026               nop        dword ptr [rax + rax + 0x26001cc0]
01bd0 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
01bd7 ffc5                           inc        ebp
01bd9 bee4ffffff                     mov        esi, 0xffffffe4
01bde 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01be3 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01beb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01bf0 44895c2404                     mov        dword ptr [rsp + 4], r11d
01bf5 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01bfa 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01bff 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c04 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c09 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c0e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c13 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c18 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c1d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c22 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c27 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c2c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01c31 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c36 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01c3b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c40 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01c45 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c4a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01c4f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c54 c5f877                         vzeroupper 
01c57 e884a1acff                     call       0x7fd1c3943760
01c5c 0f1f8400541d0027               nop        dword ptr [rax + rax + 0x27001d54]
01c64 bee4ffffff                     mov        esi, 0xffffffe4
01c69 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c6e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c76 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01c7b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c80 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01c85 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01c8a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c8f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c94 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c99 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c9e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ca3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ca8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cad 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cb2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01cb7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cbc 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01cc1 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01cc6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ccb 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01cd0 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
01cd5 666690                         nop        
01cd8 c5f877                         vzeroupper 
01cdb e800a1acff                     call       0x7fd1c3943760
01ce0 0f1f8400d81d0028               nop        dword ptr [rax + rax + 0x28001dd8]
01ce8 bee4ffffff                     mov        esi, 0xffffffe4
01ced 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cf2 448b1c24                       mov        r11d, dword ptr [rsp]
01cf6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01cfe 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d03 4c891424                       mov        qword ptr [rsp], r10
01d07 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d0c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01d14 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01d19 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d1e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d23 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d28 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d2d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d32 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d37 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01d3c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d41 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01d46 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01d4b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d50 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01d55 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d5a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d5f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01d64 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d69 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01d6e 6690                           nop        
01d70 c5f877                         vzeroupper 
01d73 e868a0acff                     call       0x7fd1c3943760
01d78 0f1f8400701e0029               nop        dword ptr [rax + rax + 0x29001e70]
01d80 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01d85 beccffffff                     mov        esi, 0xffffffcc
01d8a 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01d92 898c24d4000000                 mov        dword ptr [rsp + 0xd4], ecx
01d99 44890c24                       mov        dword ptr [rsp], r9d
01d9d 4489442404                     mov        dword ptr [rsp + 4], r8d
01da2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01da7 90                             nop        
01da8 c5f877                         vzeroupper 
01dab e830a0acff                     call       0x7fd1c3943760
01db0 0f1f8400a81e002a               nop        dword ptr [rax + rax + 0x2a001ea8]
01db8 bef6ffffff                     mov        esi, 0xfffffff6
01dbd 666690                         nop        
01dc0 c5f877                         vzeroupper 
01dc3 e818a0acff                     call       0x7fd1c3943760
01dc8 0f1f8400c01e002b               nop        dword ptr [rax + rax + 0x2b001ec0]
01dd0 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01dd5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dda e9bbf6ffff                     jmp        0x7fd1c3e78e1a
01ddf eb14                           jmp        0x7fd1c3e79775
01de1 eb12                           jmp        0x7fd1c3e79775
01de3 eb10                           jmp        0x7fd1c3e79775
01de5 eb0e                           jmp        0x7fd1c3e79775
01de7 eb0c                           jmp        0x7fd1c3e79775
01de9 eb0a                           jmp        0x7fd1c3e79775
01deb eb08                           jmp        0x7fd1c3e79775
01ded eb06                           jmp        0x7fd1c3e79775
01def eb04                           jmp        0x7fd1c3e79775
01df1 eb02                           jmp        0x7fd1c3e79775
01df3 eb00                           jmp        0x7fd1c3e79775
01df5 488bf0                         mov        rsi, rax
01df8 e94be7ffff                     jmp        0x7fd1c3e77ec8
01dfd bef6ffffff                     mov        esi, 0xfffffff6
01e02 498beb                         mov        rbp, r11
01e05 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01e0c 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01e14 c5f877                         vzeroupper 
01e17 e8c49facff                     call       0x7fd1c3943760
01e1c 0f1f8400141f002c               nop        dword ptr [rax + rax + 0x2c001f14]
01e24 49ba9786e7c3d17f0000           movabs     r10, 0x7fd1c3e78697
01e2e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01e35 e92697a9ff                     jmp        0x7fd1c3912ee0
01e3a e8e162a8ff                     call       0x7fd1c38ffaa0
01e3f e9fae1ffff                     jmp        0x7fd1c3e779be
01e44 f4                             hlt        
01e45 f4                             hlt        
01e46 f4                             hlt        
01e47 f4                             hlt        
