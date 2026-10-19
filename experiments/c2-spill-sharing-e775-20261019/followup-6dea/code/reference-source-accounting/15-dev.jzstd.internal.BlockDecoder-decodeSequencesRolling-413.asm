00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85061c0000                   jne        0x7f0537e700a4
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f83d3170000                   jae        0x7f0537e6fca9
00056 0fb65c1607                     movzx      ebx, byte ptr [rsi + rdx + 7]
0005b 85db                           test       ebx, ebx
0005d 0f84e5170000                   je         0x7f0537e6fcc8
00063 448bc2                         mov        r8d, edx
00066 442bc1                         sub        r8d, ecx
00069 418d4bf9                       lea        ecx, [r11 - 7]
0006d 8d42f8                         lea        eax, [rdx - 8]
00070 468d1cc500000000               lea        r11d, [r8*8]
00078 f3440fbdcb                     lzcnt      r9d, ebx
0007d 41be1f000000                   mov        r14d, 0x1f
00083 452bf1                         sub        r14d, r9d
00086 bf08000000                     mov        edi, 8
0008b 412bfe                         sub        edi, r14d
0008e 418bd3                         mov        edx, r11d
00091 2bd7                           sub        edx, edi
00093 4183f808                       cmp        r8d, 8
00097 0f8c17160000                   jl         0x7f0537e6fb34
0009d 85c9                           test       ecx, ecx
0009f 0f8c47190000                   jl         0x7f0537e6fe6c
000a5 8b2c24                         mov        ebp, dword ptr [rsp]
000a8 83c5f9                         add        ebp, -7
000ab 3bc5                           cmp        eax, ebp
000ad 0f8341180000                   jae        0x7f0537e6fd74
000b3 448bd0                         mov        r10d, eax
000b6 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bb 4183c0f8                       add        r8d, -8
000bf 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000c7 4183c2f0                       add        r10d, -0x10
000cb 4183f808                       cmp        r8d, 8
000cf 0f8c8c160000                   jl         0x7f0537e6fbe1
000d5 85c9                           test       ecx, ecx
000d7 0f8c57190000                   jl         0x7f0537e6feb4
000dd 8b2c24                         mov        ebp, dword ptr [rsp]
000e0 83c5f9                         add        ebp, -7
000e3 443bd5                         cmp        r10d, ebp
000e6 0f8348180000                   jae        0x7f0537e6fdb4
000ec 458bc2                         mov        r8d, r10d
000ef 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000f7 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
000fc 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00101 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00105 4585db                         test       r11d, r11d
00108 0f844e170000                   je         0x7f0537e6fcdc
0010e 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00112 458b4104                       mov        r8d, dword ptr [r9 + 4]
00116 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00119 85db                           test       ebx, ebx
0011b 0f844f170000                   je         0x7f0537e6fcf0
00121 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00126 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
0012e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00133 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
00138 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0013f 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00144 897c2424                       mov        dword ptr [rsp + 0x24], edi
00148 89442410                       mov        dword ptr [rsp + 0x10], eax
0014c 894c2404                       mov        dword ptr [rsp + 4], ecx
00150 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00158 45034304                       add        r8d, dword ptr [r11 + 4]
0015c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00161 44034304                       add        r8d, dword ptr [rbx + 4]
00165 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00169 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0016e 4c8bd3                         mov        r10, rbx
00171 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00176 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0017b 4d8bd3                         mov        r10, r11
0017e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00183 4d8bd1                         mov        r10, r9
00186 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018b 4585c0                         test       r8d, r8d
0018e 0f84bd080000                   je         0x7f0537e6eed1
00194 be40000000                     mov        esi, 0x40
00199 2bf7                           sub        esi, edi
0019b 443bc6                         cmp        r8d, esi
0019e 0f8f00020000                   jg         0x7f0537e6e824
001a4 412bf0                         sub        esi, r8d
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 4183f840                       cmp        r8d, 0x40
001b5 0f8d49190000                   jge        0x7f0537e6ff84
001bb 41bb01000000                   mov        r11d, 1
001c1 c442b9f7d3                     shlx       r10, r11, r8
001c6 49ffca                         dec        r10
001c9 4c23d5                         and        r10, rbp
001cc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d1 458bd0                         mov        r10d, r8d
001d4 458bca                         mov        r9d, r10d
001d7 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001dc 458d5908                       lea        r11d, [r9 + 8]
001e0 4183fb40                       cmp        r11d, 0x40
001e4 7c35                           jl         0x7f0537e6e69b
001e6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001eb 4183c1c8                       add        r9d, -0x38
001ef 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f4 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fc 8b542408                       mov        edx, dword ptr [rsp + 8]
00200 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00204 666690                         nop        
00207 e8d4d1a8ff                     call       0x7f05378fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f0537e6e6cc
0021b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00220 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00228 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0022d 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00232 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0023a 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00242 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00247 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0024c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00251 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00255 83fd20                         cmp        ebp, 0x20
00258 0f8d26180000                   jge        0x7f0537e6ff04
0025e c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00265 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026a 41bb01000000                   mov        r11d, 1
00270 c44251f7db                     shlx       r11d, r11d, ebp
00275 41ffcb                         dec        r11d
00278 4d63d3                         movsxd     r10, r11d
0027b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00280 458bda                         mov        r11d, r10d
00283 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00288 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0028d 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00291 83fd20                         cmp        ebp, 0x20
00294 0f8d12180000                   jge        0x7f0537e6ff2c
0029a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a2 458b5204                       mov        r10d, dword ptr [r10 + 4]
002a6 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002ae 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b3 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002b7 458b4304                       mov        r8d, dword ptr [r11 + 4]
002bb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c0 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
002c8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002cd 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
002d1 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d5 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002d9 85c9                           test       ecx, ecx
002db 0f8e40150000                   jle        0x7f0537e6fca1
002e1 41ffc8                         dec        r8d
002e4 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002e9 41ffca                         dec        r10d
002ec 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002f1 41ffcb                         dec        r11d
002f4 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
002f9 c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00300 41bb01000000                   mov        r11d, 1
00306 c44251f7db                     shlx       r11d, r11d, ebp
0030b 458bc2                         mov        r8d, r10d
0030e 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00313 41ffcb                         dec        r11d
00316 4d63d3                         movsxd     r10, r11d
00319 4c23542468                     and        r10, qword ptr [rsp + 0x68]
0031e 458bd2                         mov        r10d, r10d
00321 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00326 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0032e 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00335 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0033d 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00344 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0034c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00350 4585db                         test       r11d, r11d
00353 0f862b150000                   jbe        0x7f0537e6fd04
00359 4d63d3                         movsxd     r10, r11d
0035c 4c63d9                         movsxd     r11, ecx
0035f 49ffcb                         dec        r11
00362 4d3bda                         cmp        r11, r10
00365 0f8319150000                   jae        0x7f0537e6fd04
0036b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00370 4585d2                         test       r10d, r10d
00373 0f8c03160000                   jl         0x7f0537e6fdfc
00379 448b1c24                       mov        r11d, dword ptr [rsp]
0037d 4183c3f9                       add        r11d, -7
00381 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00389 4533d2                         xor        r10d, r10d
0038c 4533db                         xor        r11d, r11d
0038f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00397 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0039f e97b020000                     jmp        0x7f0537e6ea9f
003a4 418be8                         mov        ebp, r8d
003a7 2bee                           sub        ebp, esi
003a9 6690                           nop        
003ab e830d0a8ff                     call       0x7f05378fb860
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9edfdffff                     jmp        0x7f0537e6e654
003e7 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003ef 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 6690                           nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8d00090000                   jge        0x7f0537e6f1a0
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8dad090000                   jge        0x7f0537e6f280
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bca                         mov        ecx, r10d
0046c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00473 83fd40                         cmp        ebp, 0x40
00476 0f8d840a0000                   jge        0x7f0537e6f380
0047c c4e2d3f7df                     shrx       rbx, rdi, rbp
00481 41ba01000000                   mov        r10d, 1
00487 c442d1f7d2                     shlx       r10, r10, rbp
0048c 49ffca                         dec        r10
0048f 4c23d7                         and        r10, rdi
00492 458bd2                         mov        r10d, r10d
00495 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
0049c 83fd40                         cmp        ebp, 0x40
0049f 0f8d5f0b0000                   jge        0x7f0537e6f484
004a5 41bb01000000                   mov        r11d, 1
004ab c442d1f7cb                     shlx       r9, r11, rbp
004b0 49ffc9                         dec        r9
004b3 4c23cb                         and        r9, rbx
004b6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004be 418bfb                         mov        edi, r11d
004c1 4103fa                         add        edi, r10d
004c4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c9 458bd2                         mov        r10d, r10d
004cc 4403d1                         add        r10d, ecx
004cf 4863cf                         movsxd     rcx, edi
004d2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004da 458bdb                         mov        r11d, r11d
004dd 4d03cb                         add        r9, r11
004e0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
004e8 4c03d9                         add        r11, rcx
004eb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
004f3 4d85c9                         test       r9, r9
004f6 0f8e30070000                   jle        0x7f0537e6f0ac
004fc 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00503 0f8feb0b0000                   jg         0x7f0537e6f574
00509 4181faffff0100                 cmp        r10d, 0x1ffff
00510 0f8fd60c0000                   jg         0x7f0537e6f66c
00516 81ffffff0300                   cmp        edi, 0x3ffff
0051c 0f8f9e0d0000                   jg         0x7f0537e6f740
00522 458bd9                         mov        r11d, r9d
00525 4181fb00000010                 cmp        r11d, 0x10000000
0052c 0f83620e0000                   jae        0x7f0537e6f814
00532 4d63d2                         movsxd     r10, r10d
00535 4d63db                         movsxd     r11, r11d
00538 48c1e112                       shl        rcx, 0x12
0053c 49c1e324                       shl        r11, 0x24
00540 4c0bd9                         or         r11, rcx
00543 4d0bda                         or         r11, r10
00546 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0054d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00555 4e895cd108                     mov        qword ptr [rcx + r10*8 + 8], r11
0055a 8b2c24                         mov        ebp, dword ptr [rsp]
0055d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00561 0f8da7000000                   jge        0x7f0537e6ea8e
00567 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056f 49c1ea30                       shr        r10, 0x30
00573 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00578 49c1eb30                       shr        r11, 0x30
0057c 458bca                         mov        r9d, r10d
0057f 418bfb                         mov        edi, r11d
00582 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0058a c4c223f7d8                     shrx       ebx, r8d, r11d
0058f 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
00597 c44223f7d0                     shrx       r10d, r8d, r11d
0059c 4103fa                         add        edi, r10d
0059f 897c2474                       mov        dword ptr [rsp + 0x74], edi
005a3 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005ab 4183fb20                       cmp        r11d, 0x20
005af 0f8df30e0000                   jge        0x7f0537e6f928
005b5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005bd 49c1ea30                       shr        r10, 0x30
005c1 458bd2                         mov        r10d, r10d
005c4 b901000000                     mov        ecx, 1
005c9 c46221f7d9                     shlx       r11d, ecx, r11d
005ce 41ffcb                         dec        r11d
005d1 4423db                         and        r11d, ebx
005d4 4503d9                         add        r11d, r9d
005d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
005dc 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005e4 4183fb20                       cmp        r11d, 0x20
005e8 0f8d520f0000                   jge        0x7f0537e6f9c0
005ee 41bb01000000                   mov        r11d, 1
005f4 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
005fb c44271f7cb                     shlx       r9d, r11d, ecx
00600 41ffc9                         dec        r9d
00603 4523c8                         and        r9d, r8d
00606 4503ca                         add        r9d, r10d
00609 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8d7e030000                   jge        0x7f0537e6ee16
00618 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0061f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00624 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 418b4b14                       mov        ecx, dword ptr [r11 + 0x14]
00632 448b5904                       mov        r11d, dword ptr [rcx + 4]
00636 453bd3                         cmp        r10d, r11d
00639 0f8322040000                   jae        0x7f0537e6eee1
0063f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00644 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00649 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0064e 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
00652 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00656 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
0065b 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00660 443bc3                         cmp        r8d, ebx
00663 0f837f040000                   jae        0x7f0537e6ef68
00669 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0066e 4423542448                     and        r10d, dword ptr [rsp + 0x48]
00673 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00678 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
0067c 418b4904                       mov        ecx, dword ptr [r9 + 4]
00680 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00685 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
0068d 443bd1                         cmp        r10d, ecx
00690 0f83ee040000                   jae        0x7f0537e6f004
00696 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006aa ffc5                           inc        ebp
006ac 892c24                         mov        dword ptr [rsp], ebp
006af 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b3 0f8d59030000                   jge        0x7f0537e6ee92
006b9 49c1ea28                       shr        r10, 0x28
006bd 458bd2                         mov        r10d, r10d
006c0 450fb6d2                       movzx      r10d, r10b
006c4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006cc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d1 49c1ea28                       shr        r10, 0x28
006d5 458bda                         mov        r11d, r10d
006d8 410fb6eb                       movzx      ebp, r11b
006dc 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006e3 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006eb 49c1ea28                       shr        r10, 0x28
006ef 458bd2                         mov        r10d, r10d
006f2 450fb6d2                       movzx      r10d, r10b
006f6 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
006fe 4103ea                         add        ebp, r10d
00701 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00708 41ba01000000                   mov        r10d, 1
0070e 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00716 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0071e 49c1ea20                       shr        r10, 0x20
00722 458bd2                         mov        r10d, r10d
00725 410fb6ea                       movzx      ebp, r10b
00729 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00730 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00735 49c1ea20                       shr        r10, 0x20
00739 458bda                         mov        r11d, r10d
0073c 410fb6eb                       movzx      ebp, r11b
00740 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00747 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0074f 49c1ea20                       shr        r10, 0x20
00753 458bd2                         mov        r10d, r10d
00756 410fb6ea                       movzx      ebp, r10b
0075a 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00761 448bcd                         mov        r9d, ebp
00764 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0076c 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
00774 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0077c 4585c9                         test       r9d, r9d
0077f 0f84bc020000                   je         0x7f0537e6eec1
00785 4183f93f                       cmp        r9d, 0x3f
00789 0f8ff10c0000                   jg         0x7f0537e6f900
0078f bb40000000                     mov        ebx, 0x40
00794 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
00798 443bcb                         cmp        r9d, ebx
0079b 7e47                           jle        0x7f0537e6ec64
0079d 458bc1                         mov        r8d, r9d
007a0 442bc3                         sub        r8d, ebx
007a3 83fb40                         cmp        ebx, 0x40
007a6 0f8d1c0e0000                   jge        0x7f0537e6fa48
007ac 41ba01000000                   mov        r10d, 1
007b2 c442e1f7d2                     shlx       r10, r10, rbx
007b7 49ffca                         dec        r10
007ba 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007c2 c4c2b9f7ea                     shlx       rbp, r10, r8
007c7 41bb40000000                   mov        r11d, 0x40
007cd 452bd8                         sub        r11d, r8d
007d0 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007d7 490bea                         or         rbp, r10
007da 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007e2 eb26                           jmp        0x7f0537e6ec8a
007e4 41ba01000000                   mov        r10d, 1
007ea c442b1f7d2                     shlx       r10, r10, r9
007ef 412bd9                         sub        ebx, r9d
007f2 c4e2e3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], rbx
007fc 49ffca                         dec        r10
007ff 4923ea                         and        rbp, r10
00802 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0080a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0080f 4503d9                         add        r11d, r9d
00812 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00817 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0081c 4503d1                         add        r10d, r9d
0081f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00824 4183fa40                       cmp        r10d, 0x40
00828 0f8ce2fbffff                   jl         0x7f0537e6e890
0082e 4183c2c0                       add        r10d, -0x40
00832 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00837 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0083b 83c5f8                         add        ebp, -8
0083e 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00842 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00846 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0084a 83c1f0                         add        ecx, -0x10
0084d 83f908                         cmp        ecx, 8
00850 0f8cf2000000                   jl         0x7f0537e6edc8
00856 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0085b 4183c2e8                       add        r10d, -0x18
0085f 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00867 0f827afbffff                   jb         0x7f0537e6e867
0086d bee4ffffff                     mov        esi, 0xffffffe4
00872 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0087a 448b442408                     mov        r8d, dword ptr [rsp + 8]
0087f 44890424                       mov        dword ptr [rsp], r8d
00883 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00888 4489442404                     mov        dword ptr [rsp + 4], r8d
0088d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00892 44895c2408                     mov        dword ptr [rsp + 8], r11d
00897 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0089c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008a1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008a6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008ab 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008b0 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008b5 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008ba 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008bf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008c4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008c9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008ce 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008d3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008d8 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008dd 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008e2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008e7 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
008ec 4489442430                     mov        dword ptr [rsp + 0x30], r8d
008f1 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
008f6 4489442440                     mov        dword ptr [rsp + 0x40], r8d
008fb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00900 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00905 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0090a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0090f 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00914 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00919 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00921 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00926 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0092e 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00933 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0093b e8a048b5ff                     call       0x7f05379c3660
00940 0f1f8400380a0002               nop        dword ptr [rax + rax + 0x2000a38]
00948 85c9                           test       ecx, ecx
0094a 7f08                           jg         0x7f0537e6edd4
0094c 4533d2                         xor        r10d, r10d
0094f e9a0faffff                     jmp        0x7f0537e6e874
00954 8be9                           mov        ebp, ecx
00956 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0095e 8b542408                       mov        edx, dword ptr [rsp + 8]
00962 90                             nop        
00963 e878caa8ff                     call       0x7f05378fb860
00968 0f1f8400600a0003               nop        dword ptr [rax + rax + 0x3000a60]
00970 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00975 41c1e303                       shl        r11d, 3
00979 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0097e 41c1e003                       shl        r8d, 3
00982 452bd8                         sub        r11d, r8d
00985 4181c3c0000000                 add        r11d, 0xc0
0098c c462a1f7d0                     shlx       r10, rax, r11
00991 e95efaffff                     jmp        0x7f0537e6e874
00996 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
0099e 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009a6 4d03c2                         add        r8, r10
009a9 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009b1 4d3bc2                         cmp        r8, r10
009b4 7e33                           jle        0x7f0537e6ee69
009b6 48bed05429e300000000           movabs     rsi, 0xe32954d0
009c0 666690                         nop        
009c3 e818caa8ff                     call       0x7f05378fb860
009c8 0f1f8400c00a0004               nop        dword ptr [rax + rax + 0x4000ac0]
009d0 4885c0                         test       rax, rax
009d3 0f8403110000                   je         0x7f0537e6ff5c
009d9 488bf0                         mov        rsi, rax
009dc 4881c410010000                 add        rsp, 0x110
009e3 5d                             pop        rbp
009e4 e9f7c6b5ff                     jmp        0x7f05379cb560
009e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009ee 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
009f6 0f85f4100000                   jne        0x7f0537e6ff70
009fc 418bc0                         mov        eax, r8d
009ff 4881c410010000                 add        rsp, 0x110
00a06 5d                             pop        rbp
00a07 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a0b 0f87fd110000                   ja         0x7f0537e7008e
00a11 c3                             ret        
00a12 4533d2                         xor        r10d, r10d
00a15 4533c0                         xor        r8d, r8d
00a18 4533db                         xor        r11d, r11d
00a1b 33c9                           xor        ecx, ecx
00a1d 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a25 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a2d 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a35 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
00a3c e9d5fcffff                     jmp        0x7f0537e6eb96
00a41 4533d2                         xor        r10d, r10d
00a44 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a4c e9bff9ffff                     jmp        0x7f0537e6e890
00a51 4533d2                         xor        r10d, r10d
00a54 4533db                         xor        r11d, r11d
00a57 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a5c e973f7ffff                     jmp        0x7f0537e6e654
00a61 bee4ffffff                     mov        esi, 0xffffffe4
00a66 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a6e 448b442408                     mov        r8d, dword ptr [rsp + 8]
00a73 44890424                       mov        dword ptr [rsp], r8d
00a77 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00a7c 44895c2404                     mov        dword ptr [rsp + 4], r11d
00a81 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00a86 4489442408                     mov        dword ptr [rsp + 8], r8d
00a8b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00a90 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00a95 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a9a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00a9f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00aa4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00aa9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00aae 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ab3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ab8 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00abd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ac2 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ac7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00acc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ad1 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ad5 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00ada 90                             nop        
00adb e80047b5ff                     call       0x7f05379c3660
00ae0 0f1f8400d80b0005               nop        dword ptr [rax + rax + 0x5000bd8]
00ae8 bee4ffffff                     mov        esi, 0xffffffe4
00aed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00af5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00afa 44890c24                       mov        dword ptr [rsp], r9d
00afe 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b03 4489542404                     mov        dword ptr [rsp + 4], r10d
00b08 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00b0d 44894c2408                     mov        dword ptr [rsp + 8], r9d
00b12 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b17 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b1c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b21 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b26 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b2b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b30 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b35 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b3a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b3f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b44 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b49 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b4e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b53 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b58 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b5d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b62 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b67 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b6c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b71 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b76 90                             nop        
00b77 e86446b5ff                     call       0x7f05379c3660
00b7c 0f1f8400740c0006               nop        dword ptr [rax + rax + 0x6000c74]
00b84 bee4ffffff                     mov        esi, 0xffffffe4
00b89 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b91 448b442408                     mov        r8d, dword ptr [rsp + 8]
00b96 44890424                       mov        dword ptr [rsp], r8d
00b9a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b9f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ba4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ba9 4489442408                     mov        dword ptr [rsp + 8], r8d
00bae 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bb3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bb8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bbd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bc2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bc7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bcc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00bd1 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00bd6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00bdb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00be0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00be5 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00bea 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bef 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bf4 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00bf9 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bfe 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c03 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c08 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c0d 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c12 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c17 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c1c 666690                         nop        
00c1f e8bc45b5ff                     call       0x7f05379c3660
00c24 0f1f84001c0d0007               nop        dword ptr [rax + rax + 0x7000d1c]
00c2c 4533db                         xor        r11d, r11d
00c2f 4d3bcb                         cmp        r9, r11
00c32 bdffffffff                     mov        ebp, 0xffffffff
00c37 7c08                           jl         0x7f0537e6f0c1
00c39 400f95c5                       setne      bpl
00c3d 400fb6ed                       movzx      ebp, bpl
00c41 be45ffffff                     mov        esi, 0xffffff45
00c46 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c4e 4c891c24                       mov        qword ptr [rsp], r11
00c52 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c57 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c5c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c64 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c69 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c6e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c73 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00c77 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c7b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c80 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c85 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00c89 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00c8d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c92 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c97 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00c9b 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00c9f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ca4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ca9 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00cb0 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00cb4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cb9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cbe 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00cc2 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00cc6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ccb 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00cd0 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00cd5 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00cda 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00ce2 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00ce7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00cef 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00cf4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00cfc 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d03 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d0b 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d13 e8c844b5ff                     call       0x7f05379c3660
00d18 0f1f8400100e0008               nop        dword ptr [rax + rax + 0x8000e10]
00d20 be45ffffff                     mov        esi, 0xffffff45
00d25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d2d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d32 44891424                       mov        dword ptr [rsp], r10d
00d36 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d3b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d40 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d45 4489542408                     mov        dword ptr [rsp + 8], r10d
00d4a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d52 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d57 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d5c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d61 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d66 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d6b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d70 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d75 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d7a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d7f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d84 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00d89 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d8e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d93 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d98 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00d9d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00da2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00da7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00dac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00db1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00db6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00dbb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00dc0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00dc5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dca 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00dcf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dd4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00dd9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00de1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00de6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00dee 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00df3 e8e843b5ff                     call       0x7f05379c3660
00df8 0f1f8400f00e0009               nop        dword ptr [rax + rax + 0x9000ef0]
00e00 be45ffffff                     mov        esi, 0xffffff45
00e05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e0d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e12 44891c24                       mov        dword ptr [rsp], r11d
00e16 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e1b 4489542404                     mov        dword ptr [rsp + 4], r10d
00e20 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e25 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e2a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e32 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e37 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e41 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e46 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e4b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e50 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e55 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e5a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e5f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e64 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e69 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e6e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e73 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e78 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e7d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e82 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e87 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e8c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e91 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e96 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e9b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ea0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ea5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00eaa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00eaf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00eb4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00eb9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ec1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ec6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ece 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ed3 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00edb 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00ee0 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00ee8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00ef0 666690                         nop        
00ef3 e8e842b5ff                     call       0x7f05379c3660
00ef8 0f1f8400f00f000a               nop        dword ptr [rax + rax + 0xa000ff0]
00f00 be45ffffff                     mov        esi, 0xffffff45
00f05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f0d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f12 44891424                       mov        dword ptr [rsp], r10d
00f16 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f1b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f20 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f25 4489542408                     mov        dword ptr [rsp + 8], r10d
00f2a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f32 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f37 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f41 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f46 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f4b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f50 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f55 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f5a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f5f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f64 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f69 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f6e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f73 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f78 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f7d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f82 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f87 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f8c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f91 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f96 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f9b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00fa0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00fa5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00faa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00faf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fb4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fb9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fc1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fc6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fd3 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
00fdb 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00fe0 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00fe8 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
00fef 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
00ff7 e8e441b5ff                     call       0x7f05379c3660
00ffc 0f1f8400f410000b               nop        dword ptr [rax + rax + 0xb0010f4]
01004 be45ffffff                     mov        esi, 0xffffff45
01009 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01011 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01016 44890c24                       mov        dword ptr [rsp], r9d
0101a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0101f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01024 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01029 44894c2408                     mov        dword ptr [rsp + 8], r9d
0102e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01033 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01038 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0103d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01042 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01047 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0104c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01051 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01056 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0105b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01060 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01065 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0106a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0106f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01074 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01079 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0107e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01083 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01088 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0108d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01092 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01097 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0109c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
010a1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
010a6 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
010ab 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
010b0 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
010b8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
010bd 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
010c5 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
010ca 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
010cf 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
010d6 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
010de 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
010e6 90                             nop        
010e7 e8f440b5ff                     call       0x7f05379c3660
010ec 0f1f8400e411000c               nop        dword ptr [rax + rax + 0xc0011e4]
010f4 41bbffffff7f                   mov        r11d, 0x7fffffff
010fa 4d3bcb                         cmp        r9, r11
010fd bdffffffff                     mov        ebp, 0xffffffff
01102 7c08                           jl         0x7f0537e6f58c
01104 400f95c5                       setne      bpl
01108 400fb6ed                       movzx      ebp, bpl
0110c be45ffffff                     mov        esi, 0xffffff45
01111 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01119 4c891c24                       mov        qword ptr [rsp], r11
0111d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01122 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01127 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0112f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01134 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01138 894c2414                       mov        dword ptr [rsp + 0x14], ecx
0113c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01141 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01146 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
0114a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0114e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01153 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01158 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0115c 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01160 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01165 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0116a 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
0116e 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01172 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0117a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0117f 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01183 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01187 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0118c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01191 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01195 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01199 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0119e 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011a3 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011ab 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011b0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011b8 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
011bd 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011c5 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
011cc 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
011d4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
011dc 666690                         nop        
011df e8fc3fb5ff                     call       0x7f05379c3660
011e4 0f1f8400dc12000d               nop        dword ptr [rax + rax + 0xd0012dc]
011ec be45ffffff                     mov        esi, 0xffffff45
011f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011f9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011fe 44890c24                       mov        dword ptr [rsp], r9d
01202 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01207 44894c2404                     mov        dword ptr [rsp + 4], r9d
0120c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01211 44895c2408                     mov        dword ptr [rsp + 8], r11d
01216 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0121b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01220 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01225 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0122a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0122f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01234 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01239 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0123e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01243 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01248 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0124d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01252 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01257 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0125c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01261 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01266 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0126b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01270 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01275 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0127a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0127f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01284 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01289 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0128e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01293 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01298 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012a0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012a5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012aa 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
012b2 90                             nop        
012b3 e8283fb5ff                     call       0x7f05379c3660
012b8 0f1f8400b013000e               nop        dword ptr [rax + rax + 0xe0013b0]
012c0 be45ffffff                     mov        esi, 0xffffff45
012c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012cd 448b542408                     mov        r10d, dword ptr [rsp + 8]
012d2 44891424                       mov        dword ptr [rsp], r10d
012d6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
012db 4489542404                     mov        dword ptr [rsp + 4], r10d
012e0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012e5 44895c2408                     mov        dword ptr [rsp + 8], r11d
012ea 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012ef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012f4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
012f9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
012fe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01303 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01308 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0130d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01312 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01317 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0131c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01321 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01326 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0132b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01330 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01335 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0133a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0133f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01344 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01349 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0134e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01353 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01358 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0135d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01362 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01367 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0136c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01374 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01379 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0137e 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01385 6690                           nop        
01387 e8543eb5ff                     call       0x7f05379c3660
0138c 0f1f84008414000f               nop        dword ptr [rax + rax + 0xf001484]
01394 be3dffffff                     mov        esi, 0xffffff3d
01399 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013a1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
013a6 44890c24                       mov        dword ptr [rsp], r9d
013aa 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
013ae 894c2404                       mov        dword ptr [rsp + 4], ecx
013b2 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
013b6 894c2408                       mov        dword ptr [rsp + 8], ecx
013ba 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
013bf 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
013c4 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
013c8 894c240c                       mov        dword ptr [rsp + 0xc], ecx
013cc 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
013d1 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
013d6 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
013da 894c2424                       mov        dword ptr [rsp + 0x24], ecx
013de 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
013e3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
013e8 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
013ec 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
013f0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
013f5 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
013fa 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
013fe 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01402 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01407 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0140c 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01413 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01417 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0141c 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01421 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01425 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01429 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0142e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01433 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01438 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
0143d 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01445 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0144a 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01452 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01457 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0145c 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01464 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0146b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01473 e8683db5ff                     call       0x7f05379c3660
01478 0f1f840070150010               nop        dword ptr [rax + rax + 0x10001570]
01480 be45ffffff                     mov        esi, 0xffffff45
01485 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0148d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01492 44891c24                       mov        dword ptr [rsp], r11d
01496 44894c2408                     mov        dword ptr [rsp + 8], r9d
0149b e8403db5ff                     call       0x7f05379c3660
014a0 0f1f840098150011               nop        dword ptr [rax + rax + 0x11001598]
014a8 be45ffffff                     mov        esi, 0xffffff45
014ad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014ba 44891c24                       mov        dword ptr [rsp], r11d
014be 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014c3 44895c2404                     mov        dword ptr [rsp + 4], r11d
014c8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014cd 4489542408                     mov        dword ptr [rsp + 8], r10d
014d2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014d7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014dc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
014e1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014e6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014eb 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014f0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
014f5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
014fa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
014ff 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01504 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01509 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0150e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01513 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01518 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0151d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01522 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01527 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0152c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01530 666690                         nop        
01533 e8a83cb5ff                     call       0x7f05379c3660
01538 0f1f840030160012               nop        dword ptr [rax + rax + 0x12001630]
01540 be45ffffff                     mov        esi, 0xffffff45
01545 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0154d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01552 44890c24                       mov        dword ptr [rsp], r9d
01556 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0155b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01560 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01565 44895c2408                     mov        dword ptr [rsp + 8], r11d
0156a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0156f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01574 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01579 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0157e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01583 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01588 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0158d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01592 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01597 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0159c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015a1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
015a6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
015ab 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
015b0 4489542454                     mov        dword ptr [rsp + 0x54], r10d
015b5 4489442458                     mov        dword ptr [rsp + 0x58], r8d
015ba 90                             nop        
015bb e8203cb5ff                     call       0x7f05379c3660
015c0 0f1f8400b8160013               nop        dword ptr [rax + rax + 0x130016b8]
015c8 be45ffffff                     mov        esi, 0xffffff45
015cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015d5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015da 44891c24                       mov        dword ptr [rsp], r11d
015de 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015e3 44895c2404                     mov        dword ptr [rsp + 4], r11d
015e8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015ed 44895c2408                     mov        dword ptr [rsp + 8], r11d
015f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015fc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01601 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01606 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0160b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01610 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01615 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0161a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0161f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01624 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01629 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0162e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01633 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01638 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0163d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01642 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01647 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0164c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01651 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01656 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0165b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01660 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01665 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0166a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0166f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01674 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0167c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01681 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01689 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0168e 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01696 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
0169e 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
016a5 6690                           nop        
016a7 e8343bb5ff                     call       0x7f05379c3660
016ac 0f1f8400a4170014               nop        dword ptr [rax + rax + 0x140017a4]
016b4 4585c0                         test       r8d, r8d
016b7 7f08                           jg         0x7f0537e6fb41
016b9 4533ed                         xor        r13d, r13d
016bc e9fae9ffff                     jmp        0x7f0537e6e53b
016c1 8954242c                       mov        dword ptr [rsp + 0x2c], edx
016c5 4489742428                     mov        dword ptr [rsp + 0x28], r14d
016ca 897c241c                       mov        dword ptr [rsp + 0x1c], edi
016ce 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
016d3 89442414                       mov        dword ptr [rsp + 0x14], eax
016d7 894c2410                       mov        dword ptr [rsp + 0x10], ecx
016db 448944240c                     mov        dword ptr [rsp + 0xc], r8d
016e0 48894424f8                     mov        qword ptr [rsp - 8], rax
016e5 8b0424                         mov        eax, dword ptr [rsp]
016e8 89442404                       mov        dword ptr [rsp + 4], eax
016ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f1 48894424f8                     mov        qword ptr [rsp - 8], rax
016f6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
016fd 890424                         mov        dword ptr [rsp], eax
01700 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01705 488bee                         mov        rbp, rsi
01708 8b542408                       mov        edx, dword ptr [rsp + 8]
0170c 418bc8                         mov        ecx, r8d
0170f e8ccbca8ff                     call       0x7f05378fb860
01714 0f1f84000c180015               nop        dword ptr [rax + rax + 0x1500180c]
0171c 41bb40000000                   mov        r11d, 0x40
01722 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01727 c462a1f7e8                     shlx       r13, rax, r11
0172c 48894424f8                     mov        qword ptr [rsp - 8], rax
01731 8b442404                       mov        eax, dword ptr [rsp + 4]
01735 890424                         mov        dword ptr [rsp], eax
01738 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173d 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01742 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01746 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0174a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0174f 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01753 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01758 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0175c e95ae9ffff                     jmp        0x7f0537e6e53b
01761 4585c0                         test       r8d, r8d
01764 7f07                           jg         0x7f0537e6fbed
01766 33f6                           xor        esi, esi
01768 e98fe9ffff                     jmp        0x7f0537e6e57c
0176d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01772 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01777 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0177b 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01780 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01784 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01789 89442414                       mov        dword ptr [rsp + 0x14], eax
0178d 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01791 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01796 48894424f8                     mov        qword ptr [rsp - 8], rax
0179b 8b0424                         mov        eax, dword ptr [rsp]
0179e 89442404                       mov        dword ptr [rsp + 4], eax
017a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a7 48894424f8                     mov        qword ptr [rsp - 8], rax
017ac 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017b3 890424                         mov        dword ptr [rsp], eax
017b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bb 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017c3 488bf5                         mov        rsi, rbp
017c6 8b542408                       mov        edx, dword ptr [rsp + 8]
017ca 418bc8                         mov        ecx, r8d
017cd 6690                           nop        
017cf e80cbca8ff                     call       0x7f05378fb860
017d4 0f1f8400cc180016               nop        dword ptr [rax + rax + 0x160018cc]
017dc 41bb80000000                   mov        r11d, 0x80
017e2 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
017e7 c4e2a1f7f0                     shlx       rsi, rax, r11
017ec 48894424f8                     mov        qword ptr [rsp - 8], rax
017f1 8b442404                       mov        eax, dword ptr [rsp + 4]
017f5 890424                         mov        dword ptr [rsp], eax
017f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fd 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01801 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01805 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01809 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
0180e 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01812 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01817 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0181c e9dbe8ffff                     jmp        0x7f0537e6e57c
01821 4533c0                         xor        r8d, r8d
01824 e975f1ffff                     jmp        0x7f0537e6ee1e
01829 bee4ffffff                     mov        esi, 0xffffffe4
0182e 48ffb42490000000               push       qword ptr [rsp + 0x90]
01836 488f0424                       pop        qword ptr [rsp]
0183a 90                             nop        
0183b e8a039b5ff                     call       0x7f05379c3660
01840 0f1f840038190017               nop        dword ptr [rax + rax + 0x17001938]
01848 be5d000000                     mov        esi, 0x5d
0184d 6690                           nop        
0184f e88c39b5ff                     call       0x7f05379c3660
01854 0f1f84004c190018               nop        dword ptr [rax + rax + 0x1800194c]
0185c bef6ffffff                     mov        esi, 0xfffffff6
01861 6690                           nop        
01863 e87839b5ff                     call       0x7f05379c3660
01868 0f1f840060190019               nop        dword ptr [rax + rax + 0x19001960]
01870 bef6ffffff                     mov        esi, 0xfffffff6
01875 6690                           nop        
01877 e86439b5ff                     call       0x7f05379c3660
0187c 0f1f84007419001a               nop        dword ptr [rax + rax + 0x1a001974]
01884 be6effffff                     mov        esi, 0xffffff6e
01889 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01891 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01896 44891c24                       mov        dword ptr [rsp], r11d
0189a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0189f 44895c2408                     mov        dword ptr [rsp + 8], r11d
018a4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018a9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018ae 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018b3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018b8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018bd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018c2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
018c7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
018cc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
018d1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
018d6 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
018db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018e0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018e5 6690                           nop        
018e7 e8f438b5ff                     call       0x7f05379c3660
018ec 0f1f8400e419001b               nop        dword ptr [rax + rax + 0x1b0019e4]
018f4 bee4ffffff                     mov        esi, 0xffffffe4
018f9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01901 488f0424                       pop        qword ptr [rsp]
01905 89442418                       mov        dword ptr [rsp + 0x18], eax
01909 48894424f8                     mov        qword ptr [rsp - 8], rax
0190e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01915 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01919 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191e 897c2428                       mov        dword ptr [rsp + 0x28], edi
01922 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01926 90                             nop        
01927 e8b438b5ff                     call       0x7f05379c3660
0192c 0f1f8400241a001c               nop        dword ptr [rax + rax + 0x1c001a24]
01934 bee4ffffff                     mov        esi, 0xffffffe4
01939 48ffb42490000000               push       qword ptr [rsp + 0x90]
01941 488f0424                       pop        qword ptr [rsp]
01945 48894424f8                     mov        qword ptr [rsp - 8], rax
0194a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01951 89442418                       mov        dword ptr [rsp + 0x18], eax
01955 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0195e 89542428                       mov        dword ptr [rsp + 0x28], edx
01962 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01967 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0196c 666690                         nop        
0196f e86c38b5ff                     call       0x7f05379c3660
01974 0f1f84006c1a001d               nop        dword ptr [rax + rax + 0x1d001a6c]
0197c bebeffffff                     mov        esi, 0xffffffbe
01981 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01989 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0198e 44891c24                       mov        dword ptr [rsp], r11d
01992 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01997 44895c2408                     mov        dword ptr [rsp + 8], r11d
0199c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019a6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019ab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019b0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019b5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019ba 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
019bf 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019c4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
019c9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019ce 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
019d3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019d8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
019dd 6690                           nop        
019df e8fc37b5ff                     call       0x7f05379c3660
019e4 0f1f8400dc1a001e               nop        dword ptr [rax + rax + 0x1e001adc]
019ec beccffffff                     mov        esi, 0xffffffcc
019f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019f9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
019fe 44891c24                       mov        dword ptr [rsp], r11d
01a02 89442410                       mov        dword ptr [rsp + 0x10], eax
01a06 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a12 89442414                       mov        dword ptr [rsp + 0x14], eax
01a16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1b 897c2418                       mov        dword ptr [rsp + 0x18], edi
01a1f 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01a23 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01a27 e8b437b5ff                     call       0x7f05379c3660
01a2c 0f1f8400241b001f               nop        dword ptr [rax + rax + 0x1f001b24]
01a34 beccffffff                     mov        esi, 0xffffffcc
01a39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a41 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a46 44891c24                       mov        dword ptr [rsp], r11d
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a56 89442410                       mov        dword ptr [rsp + 0x10], eax
01a5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5f 897c2414                       mov        dword ptr [rsp + 0x14], edi
01a63 89542418                       mov        dword ptr [rsp + 0x18], edx
01a67 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01a6c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a71 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01a75 6690                           nop        
01a77 e86437b5ff                     call       0x7f05379c3660
01a7c 0f1f8400741b0020               nop        dword ptr [rax + rax + 0x20001b74]
01a84 be45ffffff                     mov        esi, 0xffffff45
01a89 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a8e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a93 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a98 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a9d 6690                           nop        
01a9f e83c37b5ff                     call       0x7f05379c3660
01aa4 0f1f84009c1b0021               nop        dword ptr [rax + rax + 0x21001b9c]
01aac be45ffffff                     mov        esi, 0xffffff45
01ab1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ab6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01abb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ac0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ac5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01aca 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01acf e80c37b5ff                     call       0x7f05379c3660
01ad4 0f1f8400cc1b0022               nop        dword ptr [rax + rax + 0x22001bcc]
01adc bef6ffffff                     mov        esi, 0xfffffff6
01ae1 6690                           nop        
01ae3 e8f836b5ff                     call       0x7f05379c3660
01ae8 0f1f8400e01b0023               nop        dword ptr [rax + rax + 0x23001be0]
01af0 be5d000000                     mov        esi, 0x5d
01af5 6690                           nop        
01af7 e8e436b5ff                     call       0x7f05379c3660
01afc 0f1f8400f41b0024               nop        dword ptr [rax + rax + 0x24001bf4]
01b04 be45ffffff                     mov        esi, 0xffffff45
01b09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b16 44891c24                       mov        dword ptr [rsp], r11d
01b1a 90                             nop        
01b1b e8c036b5ff                     call       0x7f05379c3660
01b20 0f1f8400181c0025               nop        dword ptr [rax + rax + 0x25001c18]
01b28 bef6ffffff                     mov        esi, 0xfffffff6
01b2d 418bea                         mov        ebp, r10d
01b30 666690                         nop        
01b33 e8a836b5ff                     call       0x7f05379c3660
01b38 0f1f8400301c0026               nop        dword ptr [rax + rax + 0x26001c30]
01b40 bef6ffffff                     mov        esi, 0xfffffff6
01b45 418be8                         mov        ebp, r8d
01b48 666690                         nop        
01b4b e89036b5ff                     call       0x7f05379c3660
01b50 0f1f8400481c0027               nop        dword ptr [rax + rax + 0x27001c48]
01b58 bef6ffffff                     mov        esi, 0xfffffff6
01b5d 418bea                         mov        ebp, r10d
01b60 666690                         nop        
01b63 e87836b5ff                     call       0x7f05379c3660
01b68 0f1f8400601c0028               nop        dword ptr [rax + rax + 0x28001c60]
01b70 bef6ffffff                     mov        esi, 0xfffffff6
01b75 6690                           nop        
01b77 e86436b5ff                     call       0x7f05379c3660
01b7c 0f1f8400741c0029               nop        dword ptr [rax + rax + 0x29001c74]
01b84 bef6ffffff                     mov        esi, 0xfffffff6
01b89 6690                           nop        
01b8b e85036b5ff                     call       0x7f05379c3660
01b90 0f1f8400881c002a               nop        dword ptr [rax + rax + 0x2a001c88]
01b98 bef6ffffff                     mov        esi, 0xfffffff6
01b9d 6690                           nop        
01b9f e83c36b5ff                     call       0x7f05379c3660
01ba4 0f1f84009c1c002b               nop        dword ptr [rax + rax + 0x2b001c9c]
01bac bef6ffffff                     mov        esi, 0xfffffff6
01bb1 6690                           nop        
01bb3 e82836b5ff                     call       0x7f05379c3660
01bb8 0f1f8400b01c002c               nop        dword ptr [rax + rax + 0x2c001cb0]
01bc0 bef6ffffff                     mov        esi, 0xfffffff6
01bc5 6690                           nop        
01bc7 e81436b5ff                     call       0x7f05379c3660
01bcc 0f1f8400c41c002d               nop        dword ptr [rax + rax + 0x2d001cc4]
01bd4 bef6ffffff                     mov        esi, 0xfffffff6
01bd9 6690                           nop        
01bdb e80036b5ff                     call       0x7f05379c3660
01be0 0f1f8400d81c002e               nop        dword ptr [rax + rax + 0x2e001cd8]
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 6690                           nop        
01bef e8ec35b5ff                     call       0x7f05379c3660
01bf4 0f1f8400ec1c002f               nop        dword ptr [rax + rax + 0x2f001cec]
01bfc eb08                           jmp        0x7f0537e70086
01bfe eb06                           jmp        0x7f0537e70086
01c00 eb04                           jmp        0x7f0537e70086
01c02 eb02                           jmp        0x7f0537e70086
01c04 eb00                           jmp        0x7f0537e70086
01c06 488bf0                         mov        rsi, rax
01c09 e9ceedffff                     jmp        0x7f0537e6ee5c
01c0e 49ba87eee637057f0000           movabs     r10, 0x7f0537e6ee87
01c18 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c1f e93cdea8ff                     jmp        0x7f05378fdee0
01c24 e8f7a9a7ff                     call       0x7f05378eaaa0
01c29 e9f0e3ffff                     jmp        0x7f0537e6e49e
01c2e f4                             hlt        
01c2f f4                             hlt        
