00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f854e1f0000                   jne        0x7ff77bbe6a6c
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
00050 0f8327190000                   jae        0x7ff77bbe647d
00056 0fb65c1607                     movzx      ebx, byte ptr [rsi + rdx + 7]
0005b 85db                           test       ebx, ebx
0005d 0f844d190000                   je         0x7ff77bbe64b0
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
00097 0f8c6b170000                   jl         0x7ff77bbe6308
0009d 85c9                           test       ecx, ecx
0009f 0f8c3b1b0000                   jl         0x7ff77bbe66e0
000a5 8b2c24                         mov        ebp, dword ptr [rsp]
000a8 83c5f9                         add        ebp, -7
000ab 3bc5                           cmp        eax, ebp
000ad 0f83f9190000                   jae        0x7ff77bbe65ac
000b3 448bd0                         mov        r10d, eax
000b6 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bb 4183c0f8                       add        r8d, -8
000bf 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000c7 4183c2f0                       add        r10d, -0x10
000cb 4183f808                       cmp        r8d, 8
000cf 0f8ce0170000                   jl         0x7ff77bbe63b5
000d5 85c9                           test       ecx, ecx
000d7 0f8c5f1b0000                   jl         0x7ff77bbe673c
000dd 8b2c24                         mov        ebp, dword ptr [rsp]
000e0 83c5f9                         add        ebp, -7
000e3 443bd5                         cmp        r10d, ebp
000e6 0f83141a0000                   jae        0x7ff77bbe6600
000ec 458bc2                         mov        r8d, r10d
000ef 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000f7 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
000fc 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00101 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00105 4585db                         test       r11d, r11d
00108 0f84ca180000                   je         0x7ff77bbe64d8
0010e 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00112 458b4104                       mov        r8d, dword ptr [r9 + 4]
00116 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00119 85db                           test       ebx, ebx
0011b 0f84df180000                   je         0x7ff77bbe6500
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
0018e 0f84d1080000                   je         0x7ff77bbe5565
00194 be40000000                     mov        esi, 0x40
00199 2bf7                           sub        esi, edi
0019b 443bc6                         cmp        r8d, esi
0019e 0f8f00020000                   jg         0x7ff77bbe4ea4
001a4 412bf0                         sub        esi, r8d
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 4183f840                       cmp        r8d, 0x40
001b5 0f8db51b0000                   jge        0x7ff77bbe6870
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
001e4 7c35                           jl         0x7ff77bbe4d1b
001e6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001eb 4183c1c8                       add        r9d, -0x38
001ef 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f4 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fc 8b542408                       mov        edx, dword ptr [rsp + 8]
00200 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00204 90                             nop        
00205 90                             nop        
00206 90                             nop        
00207 e854afb4ff                     call       0x7ff77b72fc60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7ff77bbe4d4c
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
00258 0f8d421a0000                   jge        0x7ff77bbe67a0
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
00294 0f8d421a0000                   jge        0x7ff77bbe67dc
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
002db 0f8e94160000                   jle        0x7ff77bbe6475
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
00353 0f86cf160000                   jbe        0x7ff77bbe6528
00359 4d63d3                         movsxd     r10, r11d
0035c 4c63d9                         movsxd     r11, ecx
0035f 49ffcb                         dec        r11
00362 4d3bda                         cmp        r11, r10
00365 0f83bd160000                   jae        0x7ff77bbe6528
0036b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00370 4585d2                         test       r10d, r10d
00373 0f8ce3170000                   jl         0x7ff77bbe665c
00379 448b1c24                       mov        r11d, dword ptr [rsp]
0037d 4183c3f9                       add        r11d, -7
00381 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00389 4533d2                         xor        r10d, r10d
0038c 4533db                         xor        r11d, r11d
0038f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00397 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0039f e97b020000                     jmp        0x7ff77bbe511f
003a4 418be8                         mov        ebp, r8d
003a7 2bee                           sub        ebp, esi
003a9 90                             nop        
003aa 90                             nop        
003ab e8b0adb4ff                     call       0x7ff77b72fc60
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9edfdffff                     jmp        0x7ff77bbe4cd4
003e7 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003ef 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 90                             nop        
0040f 90                             nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8d64090000                   jge        0x7ff77bbe5884
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d250a0000                   jge        0x7ff77bbe5978
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bca                         mov        ecx, r10d
0046c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00473 83fd40                         cmp        ebp, 0x40
00476 0f8d100b0000                   jge        0x7ff77bbe5a8c
0047c c4e2d3f7df                     shrx       rbx, rdi, rbp
00481 41ba01000000                   mov        r10d, 1
00487 c442d1f7d2                     shlx       r10, r10, rbp
0048c 49ffca                         dec        r10
0048f 4c23d7                         and        r10, rdi
00492 458bd2                         mov        r10d, r10d
00495 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
0049c 83fd40                         cmp        ebp, 0x40
0049f 0f8dff0b0000                   jge        0x7ff77bbe5ba4
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
004f6 0f8e80070000                   jle        0x7ff77bbe577c
004fc 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00503 0f8f9f0c0000                   jg         0x7ff77bbe5ca8
00509 4181faffff0100                 cmp        r10d, 0x1ffff
00510 0f8f9e0d0000                   jg         0x7ff77bbe5db4
00516 81ffffff0300                   cmp        edi, 0x3ffff
0051c 0f8f7a0e0000                   jg         0x7ff77bbe5e9c
00522 458bd9                         mov        r11d, r9d
00525 4181fb00000010                 cmp        r11d, 0x10000000
0052c 0f83520f0000                   jae        0x7ff77bbe5f84
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
00561 0f8da7000000                   jge        0x7ff77bbe510e
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
005af 0f8d0b100000                   jge        0x7ff77bbe60c0
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
005e8 0f8d7e100000                   jge        0x7ff77bbe616c
005ee 41bb01000000                   mov        r11d, 1
005f4 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
005fb c44271f7cb                     shlx       r9d, r11d, ecx
00600 41ffc9                         dec        r9d
00603 4523c8                         and        r9d, r8d
00606 4503ca                         add        r9d, r10d
00609 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8d92030000                   jge        0x7ff77bbe54aa
00618 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0061f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00624 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 418b4b14                       mov        ecx, dword ptr [r11 + 0x14]
00632 448b5904                       mov        r11d, dword ptr [rcx + 4]
00636 453bd3                         cmp        r10d, r11d
00639 0f8336040000                   jae        0x7ff77bbe5575
0063f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00644 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00649 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0064e 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
00652 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00656 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
0065b 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00660 443bc3                         cmp        r8d, ebx
00663 0f83a7040000                   jae        0x7ff77bbe5610
00669 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0066e 4423542448                     and        r10d, dword ptr [rsp + 0x48]
00673 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00678 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
0067c 418b4904                       mov        ecx, dword ptr [r9 + 4]
00680 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00685 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
0068d 443bd1                         cmp        r10d, ecx
00690 0f832a050000                   jae        0x7ff77bbe56c0
00696 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006aa ffc5                           inc        ebp
006ac 892c24                         mov        dword ptr [rsp], ebp
006af 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b3 0f8d6d030000                   jge        0x7ff77bbe5526
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
0077f 0f84d0020000                   je         0x7ff77bbe5555
00785 4183f93f                       cmp        r9d, 0x3f
00789 0f8ff50d0000                   jg         0x7ff77bbe6084
0078f bb40000000                     mov        ebx, 0x40
00794 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
00798 443bcb                         cmp        r9d, ebx
0079b 7e47                           jle        0x7ff77bbe52e4
0079d 458bc1                         mov        r8d, r9d
007a0 442bc3                         sub        r8d, ebx
007a3 83fb40                         cmp        ebx, 0x40
007a6 0f8d5c0f0000                   jge        0x7ff77bbe6208
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
007e2 eb26                           jmp        0x7ff77bbe530a
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
00828 0f8ce2fbffff                   jl         0x7ff77bbe4f10
0082e 4183c2c0                       add        r10d, -0x40
00832 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00837 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0083b 83c5f8                         add        ebp, -8
0083e 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00842 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00846 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0084a 83c1f0                         add        ecx, -0x10
0084d 83f908                         cmp        ecx, 8
00850 0f8c06010000                   jl         0x7ff77bbe545c
00856 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0085b 4183c2e8                       add        r10d, -0x18
0085f 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00867 0f827afbffff                   jb         0x7ff77bbe4ee7
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
0093b e82086aeff                     call       0x7ff77b6cda60
00940 0f1f8400380a0002               nop        dword ptr [rax + rax + 0x2000a38]
00948 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00952 4883e4f0                       and        rsp, 0xfffffffffffffff0
00956 e885a71718                     call       0x7ff793d5fbe0
0095b f4                             hlt        
0095c 85c9                           test       ecx, ecx
0095e 7f08                           jg         0x7ff77bbe5468
00960 4533d2                         xor        r10d, r10d
00963 e98cfaffff                     jmp        0x7ff77bbe4ef4
00968 8be9                           mov        ebp, ecx
0096a 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00972 8b542408                       mov        edx, dword ptr [rsp + 8]
00976 90                             nop        
00977 e8e4a7b4ff                     call       0x7ff77b72fc60
0097c 0f1f8400740a0003               nop        dword ptr [rax + rax + 0x3000a74]
00984 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00989 41c1e303                       shl        r11d, 3
0098d 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00992 41c1e003                       shl        r8d, 3
00996 452bd8                         sub        r11d, r8d
00999 4181c3c0000000                 add        r11d, 0xc0
009a0 c462a1f7d0                     shlx       r10, rax, r11
009a5 e94afaffff                     jmp        0x7ff77bbe4ef4
009aa 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009b2 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009ba 4d03c2                         add        r8, r10
009bd 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009c5 4d3bc2                         cmp        r8, r10
009c8 7e33                           jle        0x7ff77bbe54fd
009ca 48bed05829e300000000           movabs     rsi, 0xe32958d0
009d4 90                             nop        
009d5 90                             nop        
009d6 90                             nop        
009d7 e884a7b4ff                     call       0x7ff77b72fc60
009dc 0f1f8400d40a0004               nop        dword ptr [rax + rax + 0x4000ad4]
009e4 4885c0                         test       rax, rax
009e7 0f8433130000                   je         0x7ff77bbe6820
009ed 488bf0                         mov        rsi, rax
009f0 4881c410010000                 add        rsp, 0x110
009f7 5d                             pop        rbp
009f8 e9e323aeff                     jmp        0x7ff77b6c78e0
009fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a02 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a0a 0f8538130000                   jne        0x7ff77bbe6848
00a10 418bc0                         mov        eax, r8d
00a13 4881c410010000                 add        rsp, 0x110
00a1a 5d                             pop        rbp
00a1b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a1f 0f8731150000                   ja         0x7ff77bbe6a56
00a25 c3                             ret        
00a26 4533d2                         xor        r10d, r10d
00a29 4533c0                         xor        r8d, r8d
00a2c 4533db                         xor        r11d, r11d
00a2f 33c9                           xor        ecx, ecx
00a31 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a39 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a41 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a49 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
00a50 e9c1fcffff                     jmp        0x7ff77bbe5216
00a55 4533d2                         xor        r10d, r10d
00a58 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a60 e9abf9ffff                     jmp        0x7ff77bbe4f10
00a65 4533d2                         xor        r10d, r10d
00a68 4533db                         xor        r11d, r11d
00a6b 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a70 e95ff7ffff                     jmp        0x7ff77bbe4cd4
00a75 bee4ffffff                     mov        esi, 0xffffffe4
00a7a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a82 448b442408                     mov        r8d, dword ptr [rsp + 8]
00a87 44890424                       mov        dword ptr [rsp], r8d
00a8b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00a90 44895c2404                     mov        dword ptr [rsp + 4], r11d
00a95 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00a9a 4489442408                     mov        dword ptr [rsp + 8], r8d
00a9f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00aa4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00aa9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00aae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ab3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ab8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00abd 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ac2 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ac7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00acc 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ad1 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ad6 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00adb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ae0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ae5 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ae9 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00aee 90                             nop        
00aef e86c84aeff                     call       0x7ff77b6cda60
00af4 0f1f8400ec0b0005               nop        dword ptr [rax + rax + 0x5000bec]
00afc 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b0a e8d1a51718                     call       0x7ff793d5fbe0
00b0f f4                             hlt        
00b10 bee4ffffff                     mov        esi, 0xffffffe4
00b15 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b1d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00b22 44890c24                       mov        dword ptr [rsp], r9d
00b26 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b2b 4489542404                     mov        dword ptr [rsp + 4], r10d
00b30 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00b35 44894c2408                     mov        dword ptr [rsp + 8], r9d
00b3a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b3f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b44 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b49 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b4e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b53 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b58 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b5d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b62 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b67 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b6c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b71 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b76 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b7b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b80 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b85 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b8a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b8f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b94 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b99 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b9e 90                             nop        
00b9f e8bc83aeff                     call       0x7ff77b6cda60
00ba4 0f1f84009c0c0006               nop        dword ptr [rax + rax + 0x6000c9c]
00bac 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00bb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bba e821a51718                     call       0x7ff793d5fbe0
00bbf f4                             hlt        
00bc0 bee4ffffff                     mov        esi, 0xffffffe4
00bc5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bcd 448b442408                     mov        r8d, dword ptr [rsp + 8]
00bd2 44890424                       mov        dword ptr [rsp], r8d
00bd6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bdb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00be0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00be5 4489442408                     mov        dword ptr [rsp + 8], r8d
00bea 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bef 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bf4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bf9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bfe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c03 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c08 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00c0d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c12 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c17 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c1c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00c21 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c26 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c2b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c30 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c35 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c3a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c3f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c44 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c49 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c4e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c53 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c58 90                             nop        
00c59 90                             nop        
00c5a 90                             nop        
00c5b e80083aeff                     call       0x7ff77b6cda60
00c60 0f1f8400580d0007               nop        dword ptr [rax + rax + 0x7000d58]
00c68 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00c72 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c76 e865a41718                     call       0x7ff793d5fbe0
00c7b f4                             hlt        
00c7c 4533db                         xor        r11d, r11d
00c7f 4d3bcb                         cmp        r9, r11
00c82 bdffffffff                     mov        ebp, 0xffffffff
00c87 7c08                           jl         0x7ff77bbe5791
00c89 400f95c5                       setne      bpl
00c8d 400fb6ed                       movzx      ebp, bpl
00c91 be45ffffff                     mov        esi, 0xffffff45
00c96 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c9e 4c891c24                       mov        qword ptr [rsp], r11
00ca2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ca7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00cac 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00cb4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cb9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00cbe 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cc3 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00cc7 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00ccb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cd0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cd5 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00cd9 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00cdd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ce2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ce7 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00ceb 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00cef 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00cf4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00cf9 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00d00 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00d04 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d09 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d0e 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00d12 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00d16 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d1b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d20 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d25 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d2a 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d32 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d37 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d3f 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d44 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d4c 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d53 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d5b 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d63 e8f881aeff                     call       0x7ff77b6cda60
00d68 0f1f8400600e0008               nop        dword ptr [rax + rax + 0x8000e60]
00d70 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00d7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d7e e85da31718                     call       0x7ff793d5fbe0
00d83 f4                             hlt        
00d84 be45ffffff                     mov        esi, 0xffffff45
00d89 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d91 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d96 44891424                       mov        dword ptr [rsp], r10d
00d9a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d9f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00da4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00da9 4489542408                     mov        dword ptr [rsp + 8], r10d
00dae 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00db6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dbb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dc0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dc5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00dca 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00dcf 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dd4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00dd9 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00dde 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00de3 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00de8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ded 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00df2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00df7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00dfc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e01 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e06 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e0b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e10 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e15 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e1a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e1f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e24 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e29 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e2e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e33 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e38 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e3d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e45 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e4a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e52 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e57 e80481aeff                     call       0x7ff77b6cda60
00e5c 0f1f8400540f0009               nop        dword ptr [rax + rax + 0x9000f54]
00e64 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00e6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e72 e869a21718                     call       0x7ff793d5fbe0
00e77 f4                             hlt        
00e78 be45ffffff                     mov        esi, 0xffffff45
00e7d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e85 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e8a 44891c24                       mov        dword ptr [rsp], r11d
00e8e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e93 4489542404                     mov        dword ptr [rsp + 4], r10d
00e98 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e9d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ea2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eaa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00eaf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00eb4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00eb9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ebe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ec3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ec8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ecd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ed2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ed7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00edc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ee1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ee6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00eeb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ef0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ef5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00efa 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00eff 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f04 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f09 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f0e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f13 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f18 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f1d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f22 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f27 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f2c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f31 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f39 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f3e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f46 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f4b 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00f53 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00f58 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00f60 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f68 90                             nop        
00f69 90                             nop        
00f6a 90                             nop        
00f6b e8f07faeff                     call       0x7ff77b6cda60
00f70 0f1f84006810000a               nop        dword ptr [rax + rax + 0xa001068]
00f78 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
00f82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f86 e855a11718                     call       0x7ff793d5fbe0
00f8b f4                             hlt        
00f8c be45ffffff                     mov        esi, 0xffffff45
00f91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f99 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f9e 44891424                       mov        dword ptr [rsp], r10d
00fa2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fa7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fb1 4489542408                     mov        dword ptr [rsp + 8], r10d
00fb6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fbe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fc3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fc8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fcd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00fd2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00fd7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00fdc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00fe1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00fe6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00feb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ff0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ff5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ffa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00fff 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01004 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01009 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0100e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01013 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01018 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0101d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01022 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01027 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0102c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01031 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01036 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0103b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01040 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01045 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0104d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01052 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0105a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0105f 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
01067 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
0106c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01074 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0107b 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01083 e8d87eaeff                     call       0x7ff77b6cda60
01088 0f1f84008011000b               nop        dword ptr [rax + rax + 0xb001180]
01090 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
0109a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0109e e83da01718                     call       0x7ff793d5fbe0
010a3 f4                             hlt        
010a4 be45ffffff                     mov        esi, 0xffffff45
010a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010b1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
010b6 44890c24                       mov        dword ptr [rsp], r9d
010ba 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010bf 44895c2404                     mov        dword ptr [rsp + 4], r11d
010c4 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010c9 44894c2408                     mov        dword ptr [rsp + 8], r9d
010ce 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
010d3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
010d8 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
010dd 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
010e2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
010e7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
010ec 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
010f1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
010f6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
010fb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01100 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01105 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0110a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0110f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01114 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01119 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0111e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01123 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01128 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0112d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01132 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01137 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0113c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01141 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01146 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0114b 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01150 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01158 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0115d 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01165 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0116a 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0116f 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01176 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0117e 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
01186 90                             nop        
01187 e8d47daeff                     call       0x7ff77b6cda60
0118c 0f1f84008412000c               nop        dword ptr [rax + rax + 0xc001284]
01194 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
0119e 4883e4f0                       and        rsp, 0xfffffffffffffff0
011a2 e8399f1718                     call       0x7ff793d5fbe0
011a7 f4                             hlt        
011a8 41bbffffff7f                   mov        r11d, 0x7fffffff
011ae 4d3bcb                         cmp        r9, r11
011b1 bdffffffff                     mov        ebp, 0xffffffff
011b6 7c08                           jl         0x7ff77bbe5cc0
011b8 400f95c5                       setne      bpl
011bc 400fb6ed                       movzx      ebp, bpl
011c0 be45ffffff                     mov        esi, 0xffffff45
011c5 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
011cd 4c891c24                       mov        qword ptr [rsp], r11
011d1 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
011d6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011db 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
011e3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
011e8 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
011ec 894c2414                       mov        dword ptr [rsp + 0x14], ecx
011f0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
011f5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
011fa 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
011fe 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01202 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01207 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0120c 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01210 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01214 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01219 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0121e 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
01222 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01226 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0122e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01233 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01237 894c2450                       mov        dword ptr [rsp + 0x50], ecx
0123b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01240 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01245 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01249 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0124d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01252 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01257 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0125f 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01264 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0126c 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
01271 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01279 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
01280 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01288 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01290 90                             nop        
01291 90                             nop        
01292 90                             nop        
01293 e8c87caeff                     call       0x7ff77b6cda60
01298 0f1f84009013000d               nop        dword ptr [rax + rax + 0xd001390]
012a0 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
012aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
012ae e82d9e1718                     call       0x7ff793d5fbe0
012b3 f4                             hlt        
012b4 be45ffffff                     mov        esi, 0xffffff45
012b9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012c1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
012c6 44890c24                       mov        dword ptr [rsp], r9d
012ca 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
012cf 44894c2404                     mov        dword ptr [rsp + 4], r9d
012d4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012d9 44895c2408                     mov        dword ptr [rsp + 8], r11d
012de 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
012e3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
012e8 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
012ed 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
012f2 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
012f7 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
012fc 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01301 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01306 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0130b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01310 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01315 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0131a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0131f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01324 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01329 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0132e 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01333 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01338 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0133d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01342 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01347 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0134c 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01351 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01356 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0135b 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01360 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01368 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0136d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01372 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0137a 90                             nop        
0137b e8e07baeff                     call       0x7ff77b6cda60
01380 0f1f84007814000e               nop        dword ptr [rax + rax + 0xe001478]
01388 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01392 4883e4f0                       and        rsp, 0xfffffffffffffff0
01396 e8459d1718                     call       0x7ff793d5fbe0
0139b f4                             hlt        
0139c be45ffffff                     mov        esi, 0xffffff45
013a1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013a9 448b542408                     mov        r10d, dword ptr [rsp + 8]
013ae 44891424                       mov        dword ptr [rsp], r10d
013b2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013b7 4489542404                     mov        dword ptr [rsp + 4], r10d
013bc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013c1 44895c2408                     mov        dword ptr [rsp + 8], r11d
013c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013d0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
013d5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
013da 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013df 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013e4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
013e9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
013ee 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
013f3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
013f8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
013fd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01402 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01407 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0140c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01411 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01416 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0141b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01420 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01425 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0142a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0142f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01434 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01439 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0143e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01443 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01448 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01450 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01455 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0145a 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01461 90                             nop        
01462 90                             nop        
01463 e8f87aaeff                     call       0x7ff77b6cda60
01468 0f1f84006015000f               nop        dword ptr [rax + rax + 0xf001560]
01470 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
0147a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0147e e85d9c1718                     call       0x7ff793d5fbe0
01483 f4                             hlt        
01484 be3dffffff                     mov        esi, 0xffffff3d
01489 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01491 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01496 44890c24                       mov        dword ptr [rsp], r9d
0149a 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
0149e 894c2404                       mov        dword ptr [rsp + 4], ecx
014a2 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
014a6 894c2408                       mov        dword ptr [rsp + 8], ecx
014aa 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
014af 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
014b4 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
014b8 894c240c                       mov        dword ptr [rsp + 0xc], ecx
014bc 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014c1 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014c6 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
014ca 894c2424                       mov        dword ptr [rsp + 0x24], ecx
014ce 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014d3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014d8 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
014dc 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
014e0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
014e5 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
014ea 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
014ee 894c2434                       mov        dword ptr [rsp + 0x34], ecx
014f2 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
014f7 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
014fc 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01503 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01507 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0150c 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01511 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01515 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01519 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0151e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01523 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01528 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
0152d 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01535 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0153a 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01542 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01547 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0154c 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01554 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0155b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01563 e8f879aeff                     call       0x7ff77b6cda60
01568 0f1f840060160010               nop        dword ptr [rax + rax + 0x10001660]
01570 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
0157a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0157e e85d9b1718                     call       0x7ff793d5fbe0
01583 f4                             hlt        
01584 be45ffffff                     mov        esi, 0xffffff45
01589 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01591 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01596 44891c24                       mov        dword ptr [rsp], r11d
0159a 44894c2408                     mov        dword ptr [rsp + 8], r9d
0159f e8bc79aeff                     call       0x7ff77b6cda60
015a4 0f1f84009c160011               nop        dword ptr [rax + rax + 0x1100169c]
015ac 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
015b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ba e8219b1718                     call       0x7ff793d5fbe0
015bf f4                             hlt        
015c0 be45ffffff                     mov        esi, 0xffffff45
015c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015cd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015d2 44891c24                       mov        dword ptr [rsp], r11d
015d6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015db 44895c2404                     mov        dword ptr [rsp + 4], r11d
015e0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015e5 4489542408                     mov        dword ptr [rsp + 8], r10d
015ea 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015ef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015f4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015f9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015fe 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01603 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01608 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0160d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01612 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01617 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0161c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01621 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01626 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0162b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01630 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01635 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0163a 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0163f 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01644 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01648 90                             nop        
01649 90                             nop        
0164a 90                             nop        
0164b e81079aeff                     call       0x7ff77b6cda60
01650 0f1f840048170012               nop        dword ptr [rax + rax + 0x12001748]
01658 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01662 4883e4f0                       and        rsp, 0xfffffffffffffff0
01666 e8759a1718                     call       0x7ff793d5fbe0
0166b f4                             hlt        
0166c be45ffffff                     mov        esi, 0xffffff45
01671 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01679 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0167e 44890c24                       mov        dword ptr [rsp], r9d
01682 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01687 44895c2404                     mov        dword ptr [rsp + 4], r11d
0168c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01691 44895c2408                     mov        dword ptr [rsp + 8], r11d
01696 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0169b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
016a0 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
016a5 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
016aa 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
016af 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
016b4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
016b9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
016be 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
016c3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
016c8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016cd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
016d2 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
016d7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
016dc 4489542454                     mov        dword ptr [rsp + 0x54], r10d
016e1 4489442458                     mov        dword ptr [rsp + 0x58], r8d
016e6 90                             nop        
016e7 e87478aeff                     call       0x7ff77b6cda60
016ec 0f1f8400e4170013               nop        dword ptr [rax + rax + 0x130017e4]
016f4 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
016fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01702 e8d9991718                     call       0x7ff793d5fbe0
01707 f4                             hlt        
01708 be45ffffff                     mov        esi, 0xffffff45
0170d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01715 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0171a 44891c24                       mov        dword ptr [rsp], r11d
0171e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01723 44895c2404                     mov        dword ptr [rsp + 4], r11d
01728 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0172d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01732 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01737 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0173c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01741 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01746 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0174b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01750 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01755 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0175a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0175f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01764 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01769 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0176e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01773 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01778 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0177d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01782 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01787 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0178c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01791 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01796 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0179b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
017a0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017a5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
017aa 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017af 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017b4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017bc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
017c1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017c9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
017ce 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
017d6 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
017de 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
017e5 90                             nop        
017e6 90                             nop        
017e7 e87477aeff                     call       0x7ff77b6cda60
017ec 0f1f8400e4180014               nop        dword ptr [rax + rax + 0x140018e4]
017f4 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
017fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01802 e8d9981718                     call       0x7ff793d5fbe0
01807 f4                             hlt        
01808 4585c0                         test       r8d, r8d
0180b 7f08                           jg         0x7ff77bbe6315
0180d 4533ed                         xor        r13d, r13d
01810 e9a6e8ffff                     jmp        0x7ff77bbe4bbb
01815 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01819 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0181e 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01822 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01827 89442414                       mov        dword ptr [rsp + 0x14], eax
0182b 894c2410                       mov        dword ptr [rsp + 0x10], ecx
0182f 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01834 48894424f8                     mov        qword ptr [rsp - 8], rax
01839 8b0424                         mov        eax, dword ptr [rsp]
0183c 89442404                       mov        dword ptr [rsp + 4], eax
01840 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01845 48894424f8                     mov        qword ptr [rsp - 8], rax
0184a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01851 890424                         mov        dword ptr [rsp], eax
01854 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01859 488bee                         mov        rbp, rsi
0185c 8b542408                       mov        edx, dword ptr [rsp + 8]
01860 418bc8                         mov        ecx, r8d
01863 e8f898b4ff                     call       0x7ff77b72fc60
01868 0f1f840060190015               nop        dword ptr [rax + rax + 0x15001960]
01870 41bb40000000                   mov        r11d, 0x40
01876 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0187b c462a1f7e8                     shlx       r13, rax, r11
01880 48894424f8                     mov        qword ptr [rsp - 8], rax
01885 8b442404                       mov        eax, dword ptr [rsp + 4]
01889 890424                         mov        dword ptr [rsp], eax
0188c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01891 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01896 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0189a 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0189e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
018a3 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
018a7 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
018ac 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
018b0 e906e8ffff                     jmp        0x7ff77bbe4bbb
018b5 4585c0                         test       r8d, r8d
018b8 7f07                           jg         0x7ff77bbe63c1
018ba 33f6                           xor        esi, esi
018bc e93be8ffff                     jmp        0x7ff77bbe4bfc
018c1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018c6 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
018cb 8954242c                       mov        dword ptr [rsp + 0x2c], edx
018cf 4489742428                     mov        dword ptr [rsp + 0x28], r14d
018d4 897c241c                       mov        dword ptr [rsp + 0x1c], edi
018d8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
018dd 89442414                       mov        dword ptr [rsp + 0x14], eax
018e1 894c2410                       mov        dword ptr [rsp + 0x10], ecx
018e5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
018ea 48894424f8                     mov        qword ptr [rsp - 8], rax
018ef 8b0424                         mov        eax, dword ptr [rsp]
018f2 89442404                       mov        dword ptr [rsp + 4], eax
018f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01900 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01907 890424                         mov        dword ptr [rsp], eax
0190a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01917 488bf5                         mov        rsi, rbp
0191a 8b542408                       mov        edx, dword ptr [rsp + 8]
0191e 418bc8                         mov        ecx, r8d
01921 90                             nop        
01922 90                             nop        
01923 e83898b4ff                     call       0x7ff77b72fc60
01928 0f1f8400201a0016               nop        dword ptr [rax + rax + 0x16001a20]
01930 41bb80000000                   mov        r11d, 0x80
01936 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0193b c4e2a1f7f0                     shlx       rsi, rax, r11
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b442404                       mov        eax, dword ptr [rsp + 4]
01949 890424                         mov        dword ptr [rsp], eax
0194c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01951 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01955 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01959 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
0195d 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01962 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01966 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
0196b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01970 e987e7ffff                     jmp        0x7ff77bbe4bfc
01975 4533c0                         xor        r8d, r8d
01978 e935f0ffff                     jmp        0x7ff77bbe54b2
0197d bee4ffffff                     mov        esi, 0xffffffe4
01982 48ffb42490000000               push       qword ptr [rsp + 0x90]
0198a 488f0424                       pop        qword ptr [rsp]
0198e 90                             nop        
0198f e8cc75aeff                     call       0x7ff77b6cda60
01994 0f1f84008c1a0017               nop        dword ptr [rax + rax + 0x17001a8c]
0199c 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
019a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019aa e831971718                     call       0x7ff793d5fbe0
019af f4                             hlt        
019b0 be5d000000                     mov        esi, 0x5d
019b5 90                             nop        
019b6 90                             nop        
019b7 e8a475aeff                     call       0x7ff77b6cda60
019bc 0f1f8400b41a0018               nop        dword ptr [rax + rax + 0x18001ab4]
019c4 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
019ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
019d2 e809971718                     call       0x7ff793d5fbe0
019d7 f4                             hlt        
019d8 bef6ffffff                     mov        esi, 0xfffffff6
019dd 90                             nop        
019de 90                             nop        
019df e87c75aeff                     call       0x7ff77b6cda60
019e4 0f1f8400dc1a0019               nop        dword ptr [rax + rax + 0x19001adc]
019ec 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
019f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fa e8e1961718                     call       0x7ff793d5fbe0
019ff f4                             hlt        
01a00 bef6ffffff                     mov        esi, 0xfffffff6
01a05 90                             nop        
01a06 90                             nop        
01a07 e85475aeff                     call       0x7ff77b6cda60
01a0c 0f1f8400041b001a               nop        dword ptr [rax + rax + 0x1a001b04]
01a14 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01a1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a22 e8b9961718                     call       0x7ff793d5fbe0
01a27 f4                             hlt        
01a28 be6effffff                     mov        esi, 0xffffff6e
01a2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a35 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a3a 44891c24                       mov        dword ptr [rsp], r11d
01a3e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a43 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a48 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a4d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a52 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a57 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a5c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a61 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a66 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01a6b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a70 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a75 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a7a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01a7f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a89 90                             nop        
01a8a 90                             nop        
01a8b e8d074aeff                     call       0x7ff77b6cda60
01a90 0f1f8400881b001b               nop        dword ptr [rax + rax + 0x1b001b88]
01a98 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01aa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aa6 e835961718                     call       0x7ff793d5fbe0
01aab f4                             hlt        
01aac bee4ffffff                     mov        esi, 0xffffffe4
01ab1 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ab9 488f0424                       pop        qword ptr [rsp]
01abd 89442418                       mov        dword ptr [rsp + 0x18], eax
01ac1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01acd 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01ad1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad6 897c2428                       mov        dword ptr [rsp + 0x28], edi
01ada 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ade 90                             nop        
01adf e87c74aeff                     call       0x7ff77b6cda60
01ae4 0f1f8400dc1b001c               nop        dword ptr [rax + rax + 0x1c001bdc]
01aec 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01af6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01afa e8e1951718                     call       0x7ff793d5fbe0
01aff f4                             hlt        
01b00 bee4ffffff                     mov        esi, 0xffffffe4
01b05 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b0d 488f0424                       pop        qword ptr [rsp]
01b11 48894424f8                     mov        qword ptr [rsp - 8], rax
01b16 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b1d 89442418                       mov        dword ptr [rsp + 0x18], eax
01b21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b26 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01b2a 89542428                       mov        dword ptr [rsp + 0x28], edx
01b2e 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01b33 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b38 90                             nop        
01b39 90                             nop        
01b3a 90                             nop        
01b3b e82074aeff                     call       0x7ff77b6cda60
01b40 0f1f8400381c001d               nop        dword ptr [rax + rax + 0x1d001c38]
01b48 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b56 e885951718                     call       0x7ff793d5fbe0
01b5b f4                             hlt        
01b5c bebeffffff                     mov        esi, 0xffffffbe
01b61 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b69 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b6e 44891c24                       mov        dword ptr [rsp], r11d
01b72 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b77 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b7c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b81 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b86 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b8b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b90 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b95 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b9a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b9f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ba4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ba9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01bae 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01bb3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bb8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bbd 90                             nop        
01bbe 90                             nop        
01bbf e89c73aeff                     call       0x7ff77b6cda60
01bc4 0f1f8400bc1c001e               nop        dword ptr [rax + rax + 0x1e001cbc]
01bcc 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bda e801951718                     call       0x7ff793d5fbe0
01bdf f4                             hlt        
01be0 beccffffff                     mov        esi, 0xffffffcc
01be5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bed 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01bf2 44891c24                       mov        dword ptr [rsp], r11d
01bf6 89442410                       mov        dword ptr [rsp + 0x10], eax
01bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01bff 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c06 89442414                       mov        dword ptr [rsp + 0x14], eax
01c0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0f 897c2418                       mov        dword ptr [rsp + 0x18], edi
01c13 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01c17 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01c1b e84073aeff                     call       0x7ff77b6cda60
01c20 0f1f8400181d001f               nop        dword ptr [rax + rax + 0x1f001d18]
01c28 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c36 e8a5941718                     call       0x7ff793d5fbe0
01c3b f4                             hlt        
01c3c beccffffff                     mov        esi, 0xffffffcc
01c41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c49 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c4e 44891c24                       mov        dword ptr [rsp], r11d
01c52 48894424f8                     mov        qword ptr [rsp - 8], rax
01c57 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c5e 89442410                       mov        dword ptr [rsp + 0x10], eax
01c62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c67 897c2414                       mov        dword ptr [rsp + 0x14], edi
01c6b 89542418                       mov        dword ptr [rsp + 0x18], edx
01c6f 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01c74 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c79 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01c7d 90                             nop        
01c7e 90                             nop        
01c7f e8dc72aeff                     call       0x7ff77b6cda60
01c84 0f1f84007c1d0020               nop        dword ptr [rax + rax + 0x20001d7c]
01c8c 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9a e841941718                     call       0x7ff793d5fbe0
01c9f f4                             hlt        
01ca0 be45ffffff                     mov        esi, 0xffffff45
01ca5 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01caa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01caf 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01cb4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cb9 90                             nop        
01cba 90                             nop        
01cbb e8a072aeff                     call       0x7ff77b6cda60
01cc0 0f1f8400b81d0021               nop        dword ptr [rax + rax + 0x21001db8]
01cc8 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01cd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cd6 e805941718                     call       0x7ff793d5fbe0
01cdb f4                             hlt        
01cdc be45ffffff                     mov        esi, 0xffffff45
01ce1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ce6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ceb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01cf0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cf5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cfa 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01cff e85c72aeff                     call       0x7ff77b6cda60
01d04 0f1f8400fc1d0022               nop        dword ptr [rax + rax + 0x22001dfc]
01d0c 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d1a e8c1931718                     call       0x7ff793d5fbe0
01d1f f4                             hlt        
01d20 bef6ffffff                     mov        esi, 0xfffffff6
01d25 90                             nop        
01d26 90                             nop        
01d27 e83472aeff                     call       0x7ff77b6cda60
01d2c 0f1f8400241e0023               nop        dword ptr [rax + rax + 0x23001e24]
01d34 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d42 e899931718                     call       0x7ff793d5fbe0
01d47 f4                             hlt        
01d48 be5d000000                     mov        esi, 0x5d
01d4d 90                             nop        
01d4e 90                             nop        
01d4f e80c72aeff                     call       0x7ff77b6cda60
01d54 0f1f84004c1e0024               nop        dword ptr [rax + rax + 0x24001e4c]
01d5c 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01d66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6a e871931718                     call       0x7ff793d5fbe0
01d6f f4                             hlt        
01d70 be45ffffff                     mov        esi, 0xffffff45
01d75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d7d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d82 44891c24                       mov        dword ptr [rsp], r11d
01d86 90                             nop        
01d87 e8d471aeff                     call       0x7ff77b6cda60
01d8c 0f1f8400841e0025               nop        dword ptr [rax + rax + 0x25001e84]
01d94 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01d9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01da2 e839931718                     call       0x7ff793d5fbe0
01da7 f4                             hlt        
01da8 bef6ffffff                     mov        esi, 0xfffffff6
01dad 418bea                         mov        ebp, r10d
01db0 90                             nop        
01db1 90                             nop        
01db2 90                             nop        
01db3 e8a871aeff                     call       0x7ff77b6cda60
01db8 0f1f8400b01e0026               nop        dword ptr [rax + rax + 0x26001eb0]
01dc0 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dce e80d931718                     call       0x7ff793d5fbe0
01dd3 f4                             hlt        
01dd4 bef6ffffff                     mov        esi, 0xfffffff6
01dd9 418be8                         mov        ebp, r8d
01ddc 90                             nop        
01ddd 90                             nop        
01dde 90                             nop        
01ddf e87c71aeff                     call       0x7ff77b6cda60
01de4 0f1f8400dc1e0027               nop        dword ptr [rax + rax + 0x27001edc]
01dec 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01df6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dfa e8e1921718                     call       0x7ff793d5fbe0
01dff f4                             hlt        
01e00 bef6ffffff                     mov        esi, 0xfffffff6
01e05 418bea                         mov        ebp, r10d
01e08 90                             nop        
01e09 90                             nop        
01e0a 90                             nop        
01e0b e85071aeff                     call       0x7ff77b6cda60
01e10 0f1f8400081f0028               nop        dword ptr [rax + rax + 0x28001f08]
01e18 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01e22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e26 e8b5921718                     call       0x7ff793d5fbe0
01e2b f4                             hlt        
01e2c bef6ffffff                     mov        esi, 0xfffffff6
01e31 90                             nop        
01e32 90                             nop        
01e33 e82871aeff                     call       0x7ff77b6cda60
01e38 0f1f8400301f0029               nop        dword ptr [rax + rax + 0x29001f30]
01e40 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01e4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e4e e88d921718                     call       0x7ff793d5fbe0
01e53 f4                             hlt        
01e54 bef6ffffff                     mov        esi, 0xfffffff6
01e59 90                             nop        
01e5a 90                             nop        
01e5b e80071aeff                     call       0x7ff77b6cda60
01e60 0f1f8400581f002a               nop        dword ptr [rax + rax + 0x2a001f58]
01e68 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e76 e865921718                     call       0x7ff793d5fbe0
01e7b f4                             hlt        
01e7c bef6ffffff                     mov        esi, 0xfffffff6
01e81 90                             nop        
01e82 90                             nop        
01e83 e8d870aeff                     call       0x7ff77b6cda60
01e88 0f1f8400801f002b               nop        dword ptr [rax + rax + 0x2b001f80]
01e90 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01e9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9e e83d921718                     call       0x7ff793d5fbe0
01ea3 f4                             hlt        
01ea4 bef6ffffff                     mov        esi, 0xfffffff6
01ea9 90                             nop        
01eaa 90                             nop        
01eab e8b070aeff                     call       0x7ff77b6cda60
01eb0 0f1f8400a81f002c               nop        dword ptr [rax + rax + 0x2c001fa8]
01eb8 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01ec2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ec6 e815921718                     call       0x7ff793d5fbe0
01ecb f4                             hlt        
01ecc bef6ffffff                     mov        esi, 0xfffffff6
01ed1 90                             nop        
01ed2 90                             nop        
01ed3 e88870aeff                     call       0x7ff77b6cda60
01ed8 0f1f8400d01f002d               nop        dword ptr [rax + rax + 0x2d001fd0]
01ee0 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01eea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eee e8ed911718                     call       0x7ff793d5fbe0
01ef3 f4                             hlt        
01ef4 bef6ffffff                     mov        esi, 0xfffffff6
01ef9 90                             nop        
01efa 90                             nop        
01efb e86070aeff                     call       0x7ff77b6cda60
01f00 0f1f8400f81f002e               nop        dword ptr [rax + rax + 0x2e001ff8]
01f08 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e8c5911718                     call       0x7ff793d5fbe0
01f1b f4                             hlt        
01f1c bef6ffffff                     mov        esi, 0xfffffff6
01f21 90                             nop        
01f22 90                             nop        
01f23 e83870aeff                     call       0x7ff77b6cda60
01f28 0f1f84002020002f               nop        dword ptr [rax + rax + 0x2f002020]
01f30 48bf003d8e54f77f0000           movabs     rdi, 0x7ff7548e3d00
01f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f3e e89d911718                     call       0x7ff793d5fbe0
01f43 f4                             hlt        
01f44 eb08                           jmp        0x7ff77bbe6a4e
01f46 eb06                           jmp        0x7ff77bbe6a4e
01f48 eb04                           jmp        0x7ff77bbe6a4e
01f4a eb02                           jmp        0x7ff77bbe6a4e
01f4c eb00                           jmp        0x7ff77bbe6a4e
01f4e 488bf0                         mov        rsi, rax
01f51 e99aeaffff                     jmp        0x7ff77bbe54f0
01f56 49ba1b55be7bf77f0000           movabs     r10, 0x7ff77bbe551b
01f60 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01f67 e9f4b8b4ff                     jmp        0x7ff77b732360
01f6c e86f87b3ff                     call       0x7ff77b71f1e0
01f71 e9a8e0ffff                     jmp        0x7ff77bbe4b1e
01f76 f4                             hlt        
01f77 f4                             hlt        
