00000 e8fb27a217                     call       0x7ffb03887280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec30010000                 sub        rsp, 0x130
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f858e290000                   jne        0x7ffaebe6743c
0002e 4c8b96e8010000                 mov        r10, qword ptr [rsi + 0x1e8]
00035 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0003a 4c8b96d0010000                 mov        r10, qword ptr [rsi + 0x1d0]
00041 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00046 448b96d0000000                 mov        r10d, dword ptr [rsi + 0xd0]
0004d 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
00055 4c8b96c8010000                 mov        r10, qword ptr [rsi + 0x1c8]
0005c 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00061 4c8b9660010000                 mov        r10, qword ptr [rsi + 0x160]
00068 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0006d 4c8b9658010000                 mov        r10, qword ptr [rsi + 0x158]
00074 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0007c 4c8b9650010000                 mov        r10, qword ptr [rsi + 0x150]
00083 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0008b 4c8b9610010000                 mov        r10, qword ptr [rsi + 0x110]
00092 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0009a 4c8bae08010000                 mov        r13, qword ptr [rsi + 0x108]
000a1 448b96e0010000                 mov        r10d, dword ptr [rsi + 0x1e0]
000a8 4489542408                     mov        dword ptr [rsp + 8], r10d
000ad 448b9ed8010000                 mov        r11d, dword ptr [rsi + 0x1d8]
000b4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
000b9 448b96c0010000                 mov        r10d, dword ptr [rsi + 0x1c0]
000c0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
000c5 448b9eb8010000                 mov        r11d, dword ptr [rsi + 0x1b8]
000cc 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
000d1 448b96a0010000                 mov        r10d, dword ptr [rsi + 0x1a0]
000d8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000dd 488b9e88010000                 mov        rbx, qword ptr [rsi + 0x188]
000e4 4c8b9678010000                 mov        r10, qword ptr [rsi + 0x178]
000eb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
000f0 448b9670010000                 mov        r10d, dword ptr [rsi + 0x170]
000f7 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000fc 448b9e68010000                 mov        r11d, dword ptr [rsi + 0x168]
00103 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00108 448b9628010000                 mov        r10d, dword ptr [rsi + 0x128]
0010f 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00117 448b9e20010000                 mov        r11d, dword ptr [rsi + 0x120]
0011e 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00126 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0012d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00135 4c8b96f8000000                 mov        r10, qword ptr [rsi + 0xf8]
0013c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00144 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
0014b 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00153 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
0015a 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00162 448b9ee0000000                 mov        r11d, dword ptr [rsi + 0xe0]
00169 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00171 448b96d8000000                 mov        r10d, dword ptr [rsi + 0xd8]
00178 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00180 448b9e98010000                 mov        r11d, dword ptr [rsi + 0x198]
00187 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0018c 488bfe                         mov        rdi, rsi
0018f 49bac0d99603fb7f0000           movabs     r10, 0x7ffb0396d9c0
00199 41ffd2                         call       r10
0019c 0f1f840000000000               nop        dword ptr [rax + rax]
001a4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a9 4d85d2                         test       r10, r10
001ac 0f8482250000                   je         0x7ffaebe671b4
001b2 458b12                         mov        r10d, dword ptr [r10]
001b5 41c1ea0d                       shr        r10d, 0xd
001b9 4181fa05010000                 cmp        r10d, 0x105
001c0 0f85c2260000                   jne        0x7ffaebe67308
001c6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001cb 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
001d3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001d8 4d85d2                         test       r10, r10
001db 0f8463250000                   je         0x7ffaebe671c4
001e1 458b1a                         mov        r11d, dword ptr [r10]
001e4 41c1eb0d                       shr        r11d, 0xd
001e8 4181fb16040000                 cmp        r11d, 0x416
001ef 0f8593260000                   jne        0x7ffaebe67308
001f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
001fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
001ff 4d85d2                         test       r10, r10
00202 0f8449250000                   je         0x7ffaebe671d1
00208 458b12                         mov        r10d, dword ptr [r10]
0020b 41c1ea0d                       shr        r10d, 0xd
0020f 4181fa0a040000                 cmp        r10d, 0x40a
00216 0f856c260000                   jne        0x7ffaebe67308
0021c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00221 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00226 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0022b 4d85d2                         test       r10, r10
0022e 0f842a250000                   je         0x7ffaebe671de
00234 458b1a                         mov        r11d, dword ptr [r10]
00237 41c1eb0d                       shr        r11d, 0xd
0023b 4181fb0d040000                 cmp        r11d, 0x40d
00242 0f8540260000                   jne        0x7ffaebe67308
00248 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0024d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00255 4d85d2                         test       r10, r10
00258 0f840d250000                   je         0x7ffaebe671eb
0025e 458b12                         mov        r10d, dword ptr [r10]
00261 41c1ea0d                       shr        r10d, 0xd
00265 4181fa0d040000                 cmp        r10d, 0x40d
0026c 0f8516260000                   jne        0x7ffaebe67308
00272 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0027a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0027f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00287 4d85d2                         test       r10, r10
0028a 0f84e8240000                   je         0x7ffaebe671f8
00290 458b1a                         mov        r11d, dword ptr [r10]
00293 41c1eb0d                       shr        r11d, 0xd
00297 4181fb0d040000                 cmp        r11d, 0x40d
0029e 0f85e4250000                   jne        0x7ffaebe67308
002a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
002a9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002b1 4d85d2                         test       r10, r10
002b4 0f84cb240000                   je         0x7ffaebe67205
002ba 458b12                         mov        r10d, dword ptr [r10]
002bd 41c1ea0d                       shr        r10d, 0xd
002c1 4181fa08010000                 cmp        r10d, 0x108
002c8 0f85ba250000                   jne        0x7ffaebe67308
002ce 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002d6 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
002de 4d85ed                         test       r13, r13
002e1 0f84ae240000                   je         0x7ffaebe67215
002e7 458b5d00                       mov        r11d, dword ptr [r13]
002eb 41c1eb0d                       shr        r11d, 0xd
002ef 4181fb07010000                 cmp        r11d, 0x107
002f6 0f858c250000                   jne        0x7ffaebe67308
002fc 4c89ac24d0000000               mov        qword ptr [rsp + 0xd0], r13
00304 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00309 4d85d2                         test       r10, r10
0030c 0f8493240000                   je         0x7ffaebe67225
00312 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00317 4d85d2                         test       r10, r10
0031a 0f8485240000                   je         0x7ffaebe67225
00320 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00325 4d85d2                         test       r10, r10
00328 0f8477240000                   je         0x7ffaebe67225
0032e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00336 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0033a 892c24                         mov        dword ptr [rsp], ebp
0033d 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00345 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00349 458d53f9                       lea        r10d, [r11 - 7]
0034d 4585d2                         test       r10d, r10d
00350 0f8c4f240000                   jl         0x7ffaebe67225
00356 4183c3f9                       add        r11d, -7
0035a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00362 e963020000                     jmp        0x7ffaebe6504a
00367 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
0036f 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00374 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00379 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0037e 48894424f8                     mov        qword ptr [rsp - 8], rax
00383 8b442430                       mov        eax, dword ptr [rsp + 0x30]
00387 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0038b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00390 8bac24f4000000                 mov        ebp, dword ptr [rsp + 0xf4]
00397 83fd40                         cmp        ebp, 0x40
0039a 0f8dc80f0000                   jge        0x7ffaebe65de8
003a0 c462d3f79c2408010000           shrx       r11, qword ptr [rsp + 0x108], rbp
003aa 41ba01000000                   mov        r10d, 1
003b0 c442d1f7d2                     shlx       r10, r10, rbp
003b5 49ffca                         dec        r10
003b8 4c23942408010000               and        r10, qword ptr [rsp + 0x108]
003c0 458bd2                         mov        r10d, r10d
003c3 8bac24fc000000                 mov        ebp, dword ptr [rsp + 0xfc]
003ca 83fd40                         cmp        ebp, 0x40
003cd 0f8d65110000                   jge        0x7ffaebe65fb8
003d3 c442d3f7cb                     shrx       r9, r11, rbp
003d8 41b801000000                   mov        r8d, 1
003de c442d1f7c0                     shlx       r8, r8, rbp
003e3 49ffc8                         dec        r8
003e6 4d23c3                         and        r8, r11
003e9 458bc0                         mov        r8d, r8d
003ec 8bac24f8000000                 mov        ebp, dword ptr [rsp + 0xf8]
003f3 83fd40                         cmp        ebp, 0x40
003f6 0f8d34130000                   jge        0x7ffaebe661b0
003fc c442d3f7d9                     shrx       r11, r9, rbp
00401 b901000000                     mov        ecx, 1
00406 c4e2d1f7c9                     shlx       rcx, rcx, rbp
0040b 48ffc9                         dec        rcx
0040e 4923c9                         and        rcx, r9
00411 8bc9                           mov        ecx, ecx
00413 8bac2400010000                 mov        ebp, dword ptr [rsp + 0x100]
0041a 83fd40                         cmp        ebp, 0x40
0041d 0f8d0d150000                   jge        0x7ffaebe663b0
00423 41b901000000                   mov        r9d, 1
00429 c442d1f7c9                     shlx       r9, r9, rbp
0042e 49ffc9                         dec        r9
00431 4d23cb                         and        r9, r11
00434 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
0043c 458bdb                         mov        r11d, r11d
0043f 4403d9                         add        r11d, ecx
00442 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
0044a 8bc9                           mov        ecx, ecx
0044c 4103c8                         add        ecx, r8d
0044f 4963fb                         movsxd     rdi, r11d
00452 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0045a 458bc0                         mov        r8d, r8d
0045d 4d03c8                         add        r9, r8
00460 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00468 4c03c7                         add        r8, rdi
0046b 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
00473 4d85c9                         test       r9, r9
00476 0f8e940b0000                   jle        0x7ffaebe65a90
0047c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00483 0f8f87160000                   jg         0x7ffaebe66590
00489 81f9ffff0100                   cmp        ecx, 0x1ffff
0048f 0f8faf170000                   jg         0x7ffaebe666c4
00495 4181fbffff0300                 cmp        r11d, 0x3ffff
0049c 0f8f36190000                   jg         0x7ffaebe66858
004a2 458bc1                         mov        r8d, r9d
004a5 4181f800000010                 cmp        r8d, 0x10000000
004ac 0f83ba1a0000                   jae        0x7ffaebe669ec
004b2 4c63c9                         movsxd     r9, ecx
004b5 4d63d8                         movsxd     r11, r8d
004b8 48c1e712                       shl        rdi, 0x12
004bc 49c1e324                       shl        r11, 0x24
004c0 4c0bdf                         or         r11, rdi
004c3 4d0bd9                         or         r11, r9
004c6 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
004ce 443b0424                       cmp        r8d, dword ptr [rsp]
004d2 0f8364090000                   jae        0x7ffaebe658bc
004d8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004e0 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
004e8 4f895cc808                     mov        qword ptr [r8 + r9*8 + 8], r11
004ed 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
004f1 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
004f5 0f8dc1000000                   jge        0x7ffaebe6503c
004fb 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00503 49c1eb30                       shr        r11, 0x30
00507 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0050f 49c1e830                       shr        r8, 0x30
00513 458bdb                         mov        r11d, r11d
00516 418bf8                         mov        edi, r8d
00519 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00521 44038c24bc000000               add        r9d, dword ptr [rsp + 0xbc]
00529 c44233f7c2                     shrx       r8d, r10d, r9d
0052e 4103f8                         add        edi, r8d
00531 89bc24a0000000                 mov        dword ptr [rsp + 0xa0], edi
00538 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00540 c44233f7ca                     shrx       r9d, r10d, r9d
00545 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
0054d 4183f820                       cmp        r8d, 0x20
00551 0f8d211c0000                   jge        0x7ffaebe66bf8
00557 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0055f 49c1e830                       shr        r8, 0x30
00563 458bc0                         mov        r8d, r8d
00566 bf01000000                     mov        edi, 1
0056b 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00572 c4e271f7ff                     shlx       edi, edi, ecx
00577 ffcf                           dec        edi
00579 4123f9                         and        edi, r9d
0057c 4103fb                         add        edi, r11d
0057f 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00586 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
0058e 4183fb20                       cmp        r11d, 0x20
00592 0f8de01c0000                   jge        0x7ffaebe66cf8
00598 41bb01000000                   mov        r11d, 1
0059e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
005a6 c44231f7cb                     shlx       r9d, r11d, r9d
005ab 41ffc9                         dec        r9d
005ae 4523ca                         and        r9d, r10d
005b1 4503c8                         add        r9d, r8d
005b4 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
005bc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
005c0 418502                         test       dword ptr [r10], eax
005c3 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
005ca 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
005d2 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
005d7 0f8d69040000                   jge        0x7ffaebe654c6
005dd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005e2 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
005e6 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
005ed 238c24b0000000                 and        ecx, dword ptr [rsp + 0xb0]
005f4 458b4204                       mov        r8d, dword ptr [r10 + 4]
005f8 413bc8                         cmp        ecx, r8d
005fb 0f83e5040000                   jae        0x7ffaebe65566
00601 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00606 418b7b14                       mov        edi, dword ptr [r11 + 0x14]
0060a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00612 44238424b4000000               and        r8d, dword ptr [rsp + 0xb4]
0061a 448b5f04                       mov        r11d, dword ptr [rdi + 4]
0061e 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
00623 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0062b 453bc3                         cmp        r8d, r11d
0062e 0f83a4050000                   jae        0x7ffaebe65658
00634 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00639 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0063d 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00645 44238c24b8000000               and        r9d, dword ptr [rsp + 0xb8]
0064d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00651 4e8b44c708                     mov        r8, qword ptr [rdi + r8*8 + 8]
00656 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0065e 453bcb                         cmp        r9d, r11d
00661 0f838d060000                   jae        0x7ffaebe65774
00667 4f8b54ca08                     mov        r10, qword ptr [r10 + r9*8 + 8]
0066c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00674 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0067b ffc5                           inc        ebp
0067d 896c2404                       mov        dword ptr [rsp + 4], ebp
00681 3b6c2420                       cmp        ebp, dword ptr [rsp + 0x20]
00685 0f8d2c040000                   jge        0x7ffaebe65537
0068b 49c1ea28                       shr        r10, 0x28
0068f 458bda                         mov        r11d, r10d
00692 450fb6db                       movzx      r11d, r11b
00696 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0069e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
006a6 49c1ea28                       shr        r10, 0x28
006aa 458bd2                         mov        r10d, r10d
006ad 450fb6ca                       movzx      r9d, r10b
006b1 4503cb                         add        r9d, r11d
006b4 4d8bd0                         mov        r10, r8
006b7 49c1ea28                       shr        r10, 0x28
006bb 458bda                         mov        r11d, r10d
006be 450fb6d3                       movzx      r10d, r11b
006c2 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
006ca 4503ca                         add        r9d, r10d
006cd 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
006d5 41bb01000000                   mov        r11d, 1
006db 44899c2404010000               mov        dword ptr [rsp + 0x104], r11d
006e3 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
006eb 49c1ea20                       shr        r10, 0x20
006ef 458bd2                         mov        r10d, r10d
006f2 410fb6ea                       movzx      ebp, r10b
006f6 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
006fd 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00705 49c1ea20                       shr        r10, 0x20
00709 458bda                         mov        r11d, r10d
0070c 410fb6eb                       movzx      ebp, r11b
00710 89ac24fc000000                 mov        dword ptr [rsp + 0xfc], ebp
00717 4d8bd0                         mov        r10, r8
0071a 49c1ea20                       shr        r10, 0x20
0071e 458bd2                         mov        r10d, r10d
00721 410fb6ea                       movzx      ebp, r10b
00725 89ac2400010000                 mov        dword ptr [rsp + 0x100], ebp
0072c 448bc5                         mov        r8d, ebp
0072f 44038424f8000000               add        r8d, dword ptr [rsp + 0xf8]
00737 44038424fc000000               add        r8d, dword ptr [rsp + 0xfc]
0073f 44038424f4000000               add        r8d, dword ptr [rsp + 0xf4]
00747 4585c0                         test       r8d, r8d
0074a 0f84f0090000                   je         0x7ffaebe65bc0
00750 4183f83f                       cmp        r8d, 0x3f
00754 0f8fae0b0000                   jg         0x7ffaebe65d88
0075a 41ba40000000                   mov        r10d, 0x40
00760 442b542440                     sub        r10d, dword ptr [rsp + 0x40]
00765 453bc2                         cmp        r8d, r10d
00768 7e43                           jle        0x7ffaebe6522d
0076a 458bd8                         mov        r11d, r8d
0076d 452bda                         sub        r11d, r10d
00770 4183fa40                       cmp        r10d, 0x40
00774 0f8dd21d0000                   jge        0x7ffaebe66fcc
0077a 41b901000000                   mov        r9d, 1
00780 c442a9f7d1                     shlx       r10, r9, r10
00785 49ffca                         dec        r10
00788 4c23d3                         and        r10, rbx
0078b c442a1f7ca                     shlx       r9, r10, r11
00790 41ba40000000                   mov        r10d, 0x40
00796 452bd3                         sub        r10d, r11d
00799 c462abf7542438                 shrx       r10, qword ptr [rsp + 0x38], r10
007a0 4d0bca                         or         r9, r10
007a3 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
007ab eb2b                           jmp        0x7ffaebe65258
007ad 452bd0                         sub        r10d, r8d
007b0 c462abf7d3                     shrx       r10, rbx, r10
007b5 4183f840                       cmp        r8d, 0x40
007b9 0f8dad1b0000                   jge        0x7ffaebe66dec
007bf 41bb01000000                   mov        r11d, 1
007c5 c442b9f7db                     shlx       r11, r11, r8
007ca 49ffcb                         dec        r11
007cd 4d23da                         and        r11, r10
007d0 4c899c2408010000               mov        qword ptr [rsp + 0x108], r11
007d8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
007dd 4503d8                         add        r11d, r8d
007e0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007e5 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
007ea 4503d0                         add        r10d, r8d
007ed 4489542444                     mov        dword ptr [rsp + 0x44], r10d
007f2 4183fb40                       cmp        r11d, 0x40
007f6 0f8c94fbffff                   jl         0x7ffaebe64e10
007fc 4183c3c0                       add        r11d, -0x40
00800 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00805 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00809 83c5f8                         add        ebp, -8
0080c 896c2430                       mov        dword ptr [rsp + 0x30], ebp
00810 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
00814 2b4c240c                       sub        ecx, dword ptr [rsp + 0xc]
00818 83c1f0                         add        ecx, -0x10
0081b 83f908                         cmp        ecx, 8
0081e 0f8cd4010000                   jl         0x7ffaebe65478
00824 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00829 4183c2e8                       add        r10d, -0x18
0082d 443b9424dc000000               cmp        r10d, dword ptr [rsp + 0xdc]
00835 0f822cfbffff                   jb         0x7ffaebe64de7
0083b bee4ffffff                     mov        esi, 0xffffffe4
00840 48894424f8                     mov        qword ptr [rsp - 8], rax
00845 8b442408                       mov        eax, dword ptr [rsp + 8]
00849 890424                         mov        dword ptr [rsp], eax
0084c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00851 48894424f8                     mov        qword ptr [rsp - 8], rax
00856 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0085a 89442404                       mov        dword ptr [rsp + 4], eax
0085e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00863 48ff742410                     push       qword ptr [rsp + 0x10]
00868 488f442408                     pop        qword ptr [rsp + 8]
0086d 48ff742418                     push       qword ptr [rsp + 0x18]
00872 488f442410                     pop        qword ptr [rsp + 0x10]
00877 48894424f8                     mov        qword ptr [rsp - 8], rax
0087c 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00880 89442418                       mov        dword ptr [rsp + 0x18], eax
00884 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00889 48894424f8                     mov        qword ptr [rsp - 8], rax
0088e 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00892 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00896 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089b 48894424f8                     mov        qword ptr [rsp - 8], rax
008a0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008a4 89442420                       mov        dword ptr [rsp + 0x20], eax
008a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ad 48894424f8                     mov        qword ptr [rsp - 8], rax
008b2 8b442430                       mov        eax, dword ptr [rsp + 0x30]
008b6 89442424                       mov        dword ptr [rsp + 0x24], eax
008ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008bf 48ff742438                     push       qword ptr [rsp + 0x38]
008c4 488f442428                     pop        qword ptr [rsp + 0x28]
008c9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
008ce 48894424f8                     mov        qword ptr [rsp - 8], rax
008d3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
008d7 89442434                       mov        dword ptr [rsp + 0x34], eax
008db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e0 48ff742448                     push       qword ptr [rsp + 0x48]
008e5 488f442438                     pop        qword ptr [rsp + 0x38]
008ea 48ff742450                     push       qword ptr [rsp + 0x50]
008ef 488f442440                     pop        qword ptr [rsp + 0x40]
008f4 48ff742458                     push       qword ptr [rsp + 0x58]
008f9 488f442448                     pop        qword ptr [rsp + 0x48]
008fe 48894424f8                     mov        qword ptr [rsp - 8], rax
00903 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0090a 89442450                       mov        dword ptr [rsp + 0x50], eax
0090e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00913 48894424f8                     mov        qword ptr [rsp - 8], rax
00918 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0091f 89442454                       mov        dword ptr [rsp + 0x54], eax
00923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00928 48894424f8                     mov        qword ptr [rsp - 8], rax
0092d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00934 89442458                       mov        dword ptr [rsp + 0x58], eax
00938 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093d 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00945 488f442460                     pop        qword ptr [rsp + 0x60]
0094a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
00952 488f442468                     pop        qword ptr [rsp + 0x68]
00957 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0095f 488f442470                     pop        qword ptr [rsp + 0x70]
00964 48894424f8                     mov        qword ptr [rsp - 8], rax
00969 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00970 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00974 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00979 48894424f8                     mov        qword ptr [rsp - 8], rax
0097e 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00985 89442478                       mov        dword ptr [rsp + 0x78], eax
00989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098e 48894424f8                     mov        qword ptr [rsp - 8], rax
00993 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
0099a 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0099e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a3 48894424f8                     mov        qword ptr [rsp - 8], rax
009a8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
009af 89842480000000                 mov        dword ptr [rsp + 0x80], eax
009b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009bb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
009c3 488f842488000000               pop        qword ptr [rsp + 0x88]
009cb 48894424f8                     mov        qword ptr [rsp - 8], rax
009d0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
009d7 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
009de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009e3 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
009eb e8f0e1b5ff                     call       0x7ffaeb9c3660
009f0 0f1f8400e80a0001               nop        dword ptr [rax + rax + 0x1000ae8]
009f8 85c9                           test       ecx, ecx
009fa 7f08                           jg         0x7ffaebe65484
009fc 4533d2                         xor        r10d, r10d
009ff e970f9ffff                     jmp        0x7ffaebe64df4
00a04 8be9                           mov        ebp, ecx
00a06 488bb42410010000               mov        rsi, qword ptr [rsp + 0x110]
00a0e 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a12 90                             nop        
00a13 e8c863a9ff                     call       0x7ffaeb8fb860
00a18 0f1f8400100b0002               nop        dword ptr [rax + rax + 0x2000b10]
00a20 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00a25 41c1e003                       shl        r8d, 3
00a29 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00a2e 41c1e303                       shl        r11d, 3
00a32 452bd8                         sub        r11d, r8d
00a35 4181c3c0000000                 add        r11d, 0xc0
00a3c c462a1f7d0                     shlx       r10, rax, r11
00a41 e92ef9ffff                     jmp        0x7ffaebe64df4
00a46 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
00a4e 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00a56 4c635c2424                     movsxd     r11, dword ptr [rsp + 0x24]
00a5b 4d3bd3                         cmp        r10, r11
00a5e 7e31                           jle        0x7ffaebe65511
00a60 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a6a 90                             nop        
00a6b e87063a9ff                     call       0x7ffaeb8fb860
00a70 0f1f8400680b0003               nop        dword ptr [rax + rax + 0x3000b68]
00a78 4885c0                         test       rax, rax
00a7b 0f84af1e0000                   je         0x7ffaebe673b0
00a81 488bf0                         mov        rsi, rax
00a84 4881c430010000                 add        rsp, 0x130
00a8b 5d                             pop        rbp
00a8c e9cf42b6ff                     jmp        0x7ffaeb9c97e0
00a91 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00a96 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00a9b 0f85a31e0000                   jne        0x7ffaebe673c4
00aa1 418bc2                         mov        eax, r10d
00aa4 4881c430010000                 add        rsp, 0x130
00aab 5d                             pop        rbp
00aac 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ab0 0f87f01e0000                   ja         0x7ffaebe67426
00ab6 c3                             ret        
00ab7 4533db                         xor        r11d, r11d
00aba 33ed                           xor        ebp, ebp
00abc 4533d2                         xor        r10d, r10d
00abf 4533c9                         xor        r9d, r9d
00ac2 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00aca 89ac24f4000000                 mov        dword ptr [rsp + 0xf4], ebp
00ad1 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00ad9 44898c2404010000               mov        dword ptr [rsp + 0x104], r9d
00ae1 e9fdfbffff                     jmp        0x7ffaebe65163
00ae6 bee4ffffff                     mov        esi, 0xffffffe4
00aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
00af0 8b442408                       mov        eax, dword ptr [rsp + 8]
00af4 890424                         mov        dword ptr [rsp], eax
00af7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00afc 48894424f8                     mov        qword ptr [rsp - 8], rax
00b01 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00b05 89442404                       mov        dword ptr [rsp + 4], eax
00b09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b0e 48ff742410                     push       qword ptr [rsp + 0x10]
00b13 488f442408                     pop        qword ptr [rsp + 8]
00b18 48ff742418                     push       qword ptr [rsp + 0x18]
00b1d 488f442410                     pop        qword ptr [rsp + 0x10]
00b22 48894424f8                     mov        qword ptr [rsp - 8], rax
00b27 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00b2b 89442418                       mov        dword ptr [rsp + 0x18], eax
00b2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b34 48894424f8                     mov        qword ptr [rsp - 8], rax
00b39 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00b3d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b46 48894424f8                     mov        qword ptr [rsp - 8], rax
00b4b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00b4f 89442420                       mov        dword ptr [rsp + 0x20], eax
00b53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b58 48894424f8                     mov        qword ptr [rsp - 8], rax
00b5d 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00b61 89442424                       mov        dword ptr [rsp + 0x24], eax
00b65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b6a 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00b6f 48ff742438                     push       qword ptr [rsp + 0x38]
00b74 488f442430                     pop        qword ptr [rsp + 0x30]
00b79 48894424f8                     mov        qword ptr [rsp - 8], rax
00b7e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00b82 89442438                       mov        dword ptr [rsp + 0x38], eax
00b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
00b90 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00b94 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b9d 48ff742448                     push       qword ptr [rsp + 0x48]
00ba2 488f442440                     pop        qword ptr [rsp + 0x40]
00ba7 48ff742450                     push       qword ptr [rsp + 0x50]
00bac 488f442448                     pop        qword ptr [rsp + 0x48]
00bb1 48ff742458                     push       qword ptr [rsp + 0x58]
00bb6 488f442450                     pop        qword ptr [rsp + 0x50]
00bbb 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00bc3 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00bca 90                             nop        
00bcb e810e0b5ff                     call       0x7ffaeb9c3660
00bd0 0f1f8400c80c0004               nop        dword ptr [rax + rax + 0x4000cc8]
00bd8 bee4ffffff                     mov        esi, 0xffffffe4
00bdd 48894424f8                     mov        qword ptr [rsp - 8], rax
00be2 8b442408                       mov        eax, dword ptr [rsp + 8]
00be6 890424                         mov        dword ptr [rsp], eax
00be9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00bee 48894424f8                     mov        qword ptr [rsp - 8], rax
00bf3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00bf7 89442404                       mov        dword ptr [rsp + 4], eax
00bfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c00 48ff742410                     push       qword ptr [rsp + 0x10]
00c05 488f442408                     pop        qword ptr [rsp + 8]
00c0a 48ff742418                     push       qword ptr [rsp + 0x18]
00c0f 488f442410                     pop        qword ptr [rsp + 0x10]
00c14 48894424f8                     mov        qword ptr [rsp - 8], rax
00c19 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00c1d 89442418                       mov        dword ptr [rsp + 0x18], eax
00c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c26 48894424f8                     mov        qword ptr [rsp - 8], rax
00c2b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00c2f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c38 48894424f8                     mov        qword ptr [rsp - 8], rax
00c3d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00c41 89442420                       mov        dword ptr [rsp + 0x20], eax
00c45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00c53 89442424                       mov        dword ptr [rsp + 0x24], eax
00c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00c61 48ff742438                     push       qword ptr [rsp + 0x38]
00c66 488f442430                     pop        qword ptr [rsp + 0x30]
00c6b 48894424f8                     mov        qword ptr [rsp - 8], rax
00c70 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00c74 89442438                       mov        dword ptr [rsp + 0x38], eax
00c78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00c82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00c86 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00c8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c8f 48ff742448                     push       qword ptr [rsp + 0x48]
00c94 488f442440                     pop        qword ptr [rsp + 0x40]
00c99 48ff742450                     push       qword ptr [rsp + 0x50]
00c9e 488f442448                     pop        qword ptr [rsp + 0x48]
00ca3 48ff742458                     push       qword ptr [rsp + 0x58]
00ca8 488f442450                     pop        qword ptr [rsp + 0x50]
00cad 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00cb9 89442458                       mov        dword ptr [rsp + 0x58], eax
00cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
00cc7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00cce 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cd7 89bc2498000000                 mov        dword ptr [rsp + 0x98], edi
00cde 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00ce6 90                             nop        
00ce7 e8f4deb5ff                     call       0x7ffaeb9c3660
00cec 0f1f8400e40d0005               nop        dword ptr [rax + rax + 0x5000de4]
00cf4 bee4ffffff                     mov        esi, 0xffffffe4
00cf9 48894424f8                     mov        qword ptr [rsp - 8], rax
00cfe 8b442408                       mov        eax, dword ptr [rsp + 8]
00d02 890424                         mov        dword ptr [rsp], eax
00d05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00d0f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00d13 89442404                       mov        dword ptr [rsp + 4], eax
00d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d1c 48ff742410                     push       qword ptr [rsp + 0x10]
00d21 488f442408                     pop        qword ptr [rsp + 8]
00d26 48ff742418                     push       qword ptr [rsp + 0x18]
00d2b 488f442410                     pop        qword ptr [rsp + 0x10]
00d30 48894424f8                     mov        qword ptr [rsp - 8], rax
00d35 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00d39 89442418                       mov        dword ptr [rsp + 0x18], eax
00d3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d42 48894424f8                     mov        qword ptr [rsp - 8], rax
00d47 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00d4b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d54 48894424f8                     mov        qword ptr [rsp - 8], rax
00d59 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00d5d 89442420                       mov        dword ptr [rsp + 0x20], eax
00d61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d66 48894424f8                     mov        qword ptr [rsp - 8], rax
00d6b 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00d6f 89442424                       mov        dword ptr [rsp + 0x24], eax
00d73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d78 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00d7d 48ff742438                     push       qword ptr [rsp + 0x38]
00d82 488f442430                     pop        qword ptr [rsp + 0x30]
00d87 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00d90 89442438                       mov        dword ptr [rsp + 0x38], eax
00d94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d99 48894424f8                     mov        qword ptr [rsp - 8], rax
00d9e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00da2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00da6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dab 48ff742448                     push       qword ptr [rsp + 0x48]
00db0 488f442440                     pop        qword ptr [rsp + 0x40]
00db5 48ff742450                     push       qword ptr [rsp + 0x50]
00dba 488f442448                     pop        qword ptr [rsp + 0x48]
00dbf 48ff742458                     push       qword ptr [rsp + 0x58]
00dc4 488f442450                     pop        qword ptr [rsp + 0x50]
00dc9 48894424f8                     mov        qword ptr [rsp - 8], rax
00dce 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00dd5 89442458                       mov        dword ptr [rsp + 0x58], eax
00dd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00dde 48894424f8                     mov        qword ptr [rsp - 8], rax
00de3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00dea 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00dee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00df3 48894424f8                     mov        qword ptr [rsp - 8], rax
00df8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00dff 89442460                       mov        dword ptr [rsp + 0x60], eax
00e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e08 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0d 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00e14 89442464                       mov        dword ptr [rsp + 0x64], eax
00e18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e1d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00e25 44898c24a4000000               mov        dword ptr [rsp + 0xa4], r9d
00e2d 6690                           nop        
00e2f e8acddb5ff                     call       0x7ffaeb9c3660
00e34 0f1f84002c0f0006               nop        dword ptr [rax + rax + 0x6000f2c]
00e3c bee4ffffff                     mov        esi, 0xffffffe4
00e41 48894424f8                     mov        qword ptr [rsp - 8], rax
00e46 8b442408                       mov        eax, dword ptr [rsp + 8]
00e4a 890424                         mov        dword ptr [rsp], eax
00e4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e52 48894424f8                     mov        qword ptr [rsp - 8], rax
00e57 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
00e5b 89442404                       mov        dword ptr [rsp + 4], eax
00e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e64 48ff742410                     push       qword ptr [rsp + 0x10]
00e69 488f442408                     pop        qword ptr [rsp + 8]
00e6e 48ff742418                     push       qword ptr [rsp + 0x18]
00e73 488f442410                     pop        qword ptr [rsp + 0x10]
00e78 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
00e81 89442418                       mov        dword ptr [rsp + 0x18], eax
00e85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e8f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00e93 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00e97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00ea1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ea5 89442420                       mov        dword ptr [rsp + 0x20], eax
00ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eae 48894424f8                     mov        qword ptr [rsp - 8], rax
00eb3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
00eb7 89442424                       mov        dword ptr [rsp + 0x24], eax
00ebb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
00ec5 48ff742438                     push       qword ptr [rsp + 0x38]
00eca 488f442430                     pop        qword ptr [rsp + 0x30]
00ecf 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
00ed8 89442438                       mov        dword ptr [rsp + 0x38], eax
00edc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
00eea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00eee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef3 48ff742448                     push       qword ptr [rsp + 0x48]
00ef8 488f442440                     pop        qword ptr [rsp + 0x40]
00efd 48ff742450                     push       qword ptr [rsp + 0x50]
00f02 488f442448                     pop        qword ptr [rsp + 0x48]
00f07 48ff742458                     push       qword ptr [rsp + 0x58]
00f0c 488f442450                     pop        qword ptr [rsp + 0x50]
00f11 48894424f8                     mov        qword ptr [rsp - 8], rax
00f16 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
00f1d 89442458                       mov        dword ptr [rsp + 0x58], eax
00f21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f26 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00f32 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00f36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f3b 48894424f8                     mov        qword ptr [rsp - 8], rax
00f40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
00f47 89442460                       mov        dword ptr [rsp + 0x60], eax
00f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f50 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
00f58 488f442478                     pop        qword ptr [rsp + 0x78]
00f5d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f62 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
00f69 89442464                       mov        dword ptr [rsp + 0x64], eax
00f6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f72 48894424f8                     mov        qword ptr [rsp - 8], rax
00f77 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00f7e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
00f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f8a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
00f96 89842484000000                 mov        dword ptr [rsp + 0x84], eax
00f9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
00fae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
00fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fba 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
00fc2 488f842490000000               pop        qword ptr [rsp + 0x90]
00fca 48894424f8                     mov        qword ptr [rsp - 8], rax
00fcf 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
00fd6 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00fdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe2 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00fea 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00ff2 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
00ffa 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
01002 90                             nop        
01003 e8d8dbb5ff                     call       0x7ffaeb9c3660
01008 0f1f840000110007               nop        dword ptr [rax + rax + 0x7001100]
01010 4533c0                         xor        r8d, r8d
01013 4d3bc8                         cmp        r9, r8
01016 bdffffffff                     mov        ebp, 0xffffffff
0101b 7c08                           jl         0x7ffaebe65aa5
0101d 400f95c5                       setne      bpl
01021 400fb6ed                       movzx      ebp, bpl
01025 be45ffffff                     mov        esi, 0xffffff45
0102a 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
0102f 48894424f8                     mov        qword ptr [rsp - 8], rax
01034 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0103b 89442460                       mov        dword ptr [rsp + 0x60], eax
0103f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01044 48894424f8                     mov        qword ptr [rsp - 8], rax
01049 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01050 89442464                       mov        dword ptr [rsp + 0x64], eax
01054 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01059 48894424f8                     mov        qword ptr [rsp - 8], rax
0105e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01065 89442468                       mov        dword ptr [rsp + 0x68], eax
01069 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0106e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01076 488f842480000000               pop        qword ptr [rsp + 0x80]
0107e 48894424f8                     mov        qword ptr [rsp - 8], rax
01083 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0108a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0108e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01093 48894424f8                     mov        qword ptr [rsp - 8], rax
01098 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0109f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
010a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ab 48894424f8                     mov        qword ptr [rsp - 8], rax
010b0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
010b7 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
010be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c3 48894424f8                     mov        qword ptr [rsp - 8], rax
010c8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
010cf 89842490000000                 mov        dword ptr [rsp + 0x90], eax
010d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010db 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
010e3 488f842498000000               pop        qword ptr [rsp + 0x98]
010eb 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
010f3 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
010fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01100 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01107 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0110e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01113 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0111b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01123 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
0112a 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01132 90                             nop        
01133 e8a8dab5ff                     call       0x7ffaeb9c3660
01138 0f1f840030120008               nop        dword ptr [rax + rax + 0x8001230]
01140 be45ffffff                     mov        esi, 0xffffff45
01145 48894424f8                     mov        qword ptr [rsp - 8], rax
0114a 8b442408                       mov        eax, dword ptr [rsp + 8]
0114e 890424                         mov        dword ptr [rsp], eax
01151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01156 48894424f8                     mov        qword ptr [rsp - 8], rax
0115b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0115f 89442404                       mov        dword ptr [rsp + 4], eax
01163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01168 48ff742410                     push       qword ptr [rsp + 0x10]
0116d 488f442408                     pop        qword ptr [rsp + 8]
01172 48ff742418                     push       qword ptr [rsp + 0x18]
01177 488f442410                     pop        qword ptr [rsp + 0x10]
0117c 48894424f8                     mov        qword ptr [rsp - 8], rax
01181 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01185 89442418                       mov        dword ptr [rsp + 0x18], eax
01189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118e 48894424f8                     mov        qword ptr [rsp - 8], rax
01193 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01197 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0119b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a0 48894424f8                     mov        qword ptr [rsp - 8], rax
011a5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011a9 89442420                       mov        dword ptr [rsp + 0x20], eax
011ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b2 48894424f8                     mov        qword ptr [rsp - 8], rax
011b7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
011bb 89442424                       mov        dword ptr [rsp + 0x24], eax
011bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011c9 48ff742438                     push       qword ptr [rsp + 0x38]
011ce 488f442430                     pop        qword ptr [rsp + 0x30]
011d3 48894424f8                     mov        qword ptr [rsp - 8], rax
011d8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
011dc 89442438                       mov        dword ptr [rsp + 0x38], eax
011e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011e5 48894424f8                     mov        qword ptr [rsp - 8], rax
011ea 8b442444                       mov        eax, dword ptr [rsp + 0x44]
011ee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f7 48ff742448                     push       qword ptr [rsp + 0x48]
011fc 488f442440                     pop        qword ptr [rsp + 0x40]
01201 48ff742450                     push       qword ptr [rsp + 0x50]
01206 488f442448                     pop        qword ptr [rsp + 0x48]
0120b 48ff742458                     push       qword ptr [rsp + 0x58]
01210 488f442450                     pop        qword ptr [rsp + 0x50]
01215 48894424f8                     mov        qword ptr [rsp - 8], rax
0121a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01221 89442458                       mov        dword ptr [rsp + 0x58], eax
01225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122a 48894424f8                     mov        qword ptr [rsp - 8], rax
0122f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01236 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0123a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123f 48894424f8                     mov        qword ptr [rsp - 8], rax
01244 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0124b 89442460                       mov        dword ptr [rsp + 0x60], eax
0124f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01254 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0125c 488f442468                     pop        qword ptr [rsp + 0x68]
01261 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01269 488f442478                     pop        qword ptr [rsp + 0x78]
0126e 48894424f8                     mov        qword ptr [rsp - 8], rax
01273 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0127a 89442464                       mov        dword ptr [rsp + 0x64], eax
0127e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01283 48894424f8                     mov        qword ptr [rsp - 8], rax
01288 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0128f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01296 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129b 48894424f8                     mov        qword ptr [rsp - 8], rax
012a0 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
012a7 89842484000000                 mov        dword ptr [rsp + 0x84], eax
012ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b3 48894424f8                     mov        qword ptr [rsp - 8], rax
012b8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
012bf 89842488000000                 mov        dword ptr [rsp + 0x88], eax
012c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
012d3 488f842490000000               pop        qword ptr [rsp + 0x90]
012db 48894424f8                     mov        qword ptr [rsp - 8], rax
012e0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
012e7 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
012ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f3 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
012fb e8e0d8b5ff                     call       0x7ffaeb9c3660
01300 0f1f8400f8130009               nop        dword ptr [rax + rax + 0x90013f8]
01308 be45ffffff                     mov        esi, 0xffffff45
0130d 48894424f8                     mov        qword ptr [rsp - 8], rax
01312 8b442408                       mov        eax, dword ptr [rsp + 8]
01316 890424                         mov        dword ptr [rsp], eax
01319 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131e 48894424f8                     mov        qword ptr [rsp - 8], rax
01323 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01327 89442404                       mov        dword ptr [rsp + 4], eax
0132b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01330 48ff742410                     push       qword ptr [rsp + 0x10]
01335 488f442408                     pop        qword ptr [rsp + 8]
0133a 48ff742418                     push       qword ptr [rsp + 0x18]
0133f 488f442410                     pop        qword ptr [rsp + 0x10]
01344 48894424f8                     mov        qword ptr [rsp - 8], rax
01349 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0134d 89442418                       mov        dword ptr [rsp + 0x18], eax
01351 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01356 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0135b e880d8b5ff                     call       0x7ffaeb9c3660
01360 0f1f84005814000a               nop        dword ptr [rax + rax + 0xa001458]
01368 be45ffffff                     mov        esi, 0xffffff45
0136d 48894424f8                     mov        qword ptr [rsp - 8], rax
01372 8b442408                       mov        eax, dword ptr [rsp + 8]
01376 890424                         mov        dword ptr [rsp], eax
01379 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137e 48894424f8                     mov        qword ptr [rsp - 8], rax
01383 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01387 89442404                       mov        dword ptr [rsp + 4], eax
0138b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01390 48ff742410                     push       qword ptr [rsp + 0x10]
01395 488f442408                     pop        qword ptr [rsp + 8]
0139a 48ff742418                     push       qword ptr [rsp + 0x18]
0139f 488f442410                     pop        qword ptr [rsp + 0x10]
013a4 48894424f8                     mov        qword ptr [rsp - 8], rax
013a9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013ad 89442418                       mov        dword ptr [rsp + 0x18], eax
013b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b6 48894424f8                     mov        qword ptr [rsp - 8], rax
013bb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
013bf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c8 48894424f8                     mov        qword ptr [rsp - 8], rax
013cd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
013d1 89442420                       mov        dword ptr [rsp + 0x20], eax
013d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013da 48894424f8                     mov        qword ptr [rsp - 8], rax
013df 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
013e3 89442424                       mov        dword ptr [rsp + 0x24], eax
013e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ec 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
013f1 48ff742438                     push       qword ptr [rsp + 0x38]
013f6 488f442430                     pop        qword ptr [rsp + 0x30]
013fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01400 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01404 89442438                       mov        dword ptr [rsp + 0x38], eax
01408 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140d 48894424f8                     mov        qword ptr [rsp - 8], rax
01412 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01416 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0141a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141f 48ff742448                     push       qword ptr [rsp + 0x48]
01424 488f442440                     pop        qword ptr [rsp + 0x40]
01429 48ff742450                     push       qword ptr [rsp + 0x50]
0142e 488f442448                     pop        qword ptr [rsp + 0x48]
01433 48ff742458                     push       qword ptr [rsp + 0x58]
01438 488f442450                     pop        qword ptr [rsp + 0x50]
0143d 48894424f8                     mov        qword ptr [rsp - 8], rax
01442 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01449 89442458                       mov        dword ptr [rsp + 0x58], eax
0144d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01452 48894424f8                     mov        qword ptr [rsp - 8], rax
01457 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0145e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01462 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01467 48894424f8                     mov        qword ptr [rsp - 8], rax
0146c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01473 89442460                       mov        dword ptr [rsp + 0x60], eax
01477 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01484 488f442468                     pop        qword ptr [rsp + 0x68]
01489 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01491 488f442470                     pop        qword ptr [rsp + 0x70]
01496 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0149e 488f442478                     pop        qword ptr [rsp + 0x78]
014a3 48894424f8                     mov        qword ptr [rsp - 8], rax
014a8 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
014af 89442464                       mov        dword ptr [rsp + 0x64], eax
014b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b8 48894424f8                     mov        qword ptr [rsp - 8], rax
014bd 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
014c4 89842480000000                 mov        dword ptr [rsp + 0x80], eax
014cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d0 48894424f8                     mov        qword ptr [rsp - 8], rax
014d5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
014dc 89842484000000                 mov        dword ptr [rsp + 0x84], eax
014e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ed 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
014f4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
014fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01500 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01508 488f842490000000               pop        qword ptr [rsp + 0x90]
01510 48894424f8                     mov        qword ptr [rsp - 8], rax
01515 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
0151c 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
01523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01528 666690                         nop        
0152b e8b0d6b5ff                     call       0x7ffaeb9c3660
01530 0f1f84002816000b               nop        dword ptr [rax + rax + 0xb001628]
01538 be45ffffff                     mov        esi, 0xffffff45
0153d 48894424f8                     mov        qword ptr [rsp - 8], rax
01542 8b442408                       mov        eax, dword ptr [rsp + 8]
01546 890424                         mov        dword ptr [rsp], eax
01549 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154e 48894424f8                     mov        qword ptr [rsp - 8], rax
01553 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01557 89442404                       mov        dword ptr [rsp + 4], eax
0155b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01560 48ff742410                     push       qword ptr [rsp + 0x10]
01565 488f442408                     pop        qword ptr [rsp + 8]
0156a 48ff742418                     push       qword ptr [rsp + 0x18]
0156f 488f442410                     pop        qword ptr [rsp + 0x10]
01574 48894424f8                     mov        qword ptr [rsp - 8], rax
01579 8b442420                       mov        eax, dword ptr [rsp + 0x20]
0157d 89442418                       mov        dword ptr [rsp + 0x18], eax
01581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
0158f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 48894424f8                     mov        qword ptr [rsp - 8], rax
0159d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015a1 89442420                       mov        dword ptr [rsp + 0x20], eax
015a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015aa 48894424f8                     mov        qword ptr [rsp - 8], rax
015af 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
015b3 89442424                       mov        dword ptr [rsp + 0x24], eax
015b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
015c1 48ff742438                     push       qword ptr [rsp + 0x38]
015c6 488f442430                     pop        qword ptr [rsp + 0x30]
015cb 48894424f8                     mov        qword ptr [rsp - 8], rax
015d0 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015d4 89442438                       mov        dword ptr [rsp + 0x38], eax
015d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015dd 48894424f8                     mov        qword ptr [rsp - 8], rax
015e2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
015e6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ef 48ff742448                     push       qword ptr [rsp + 0x48]
015f4 488f442440                     pop        qword ptr [rsp + 0x40]
015f9 48ff742450                     push       qword ptr [rsp + 0x50]
015fe 488f442448                     pop        qword ptr [rsp + 0x48]
01603 48ff742458                     push       qword ptr [rsp + 0x58]
01608 488f442450                     pop        qword ptr [rsp + 0x50]
0160d 48894424f8                     mov        qword ptr [rsp - 8], rax
01612 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01619 89442458                       mov        dword ptr [rsp + 0x58], eax
0161d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0162e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01637 48894424f8                     mov        qword ptr [rsp - 8], rax
0163c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01643 89442460                       mov        dword ptr [rsp + 0x60], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01654 488f442468                     pop        qword ptr [rsp + 0x68]
01659 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01661 488f442470                     pop        qword ptr [rsp + 0x70]
01666 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0166e 488f442478                     pop        qword ptr [rsp + 0x78]
01673 48894424f8                     mov        qword ptr [rsp - 8], rax
01678 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0167f 89442464                       mov        dword ptr [rsp + 0x64], eax
01683 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01688 48894424f8                     mov        qword ptr [rsp - 8], rax
0168d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01694 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0169b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a0 48894424f8                     mov        qword ptr [rsp - 8], rax
016a5 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
016ac 89842484000000                 mov        dword ptr [rsp + 0x84], eax
016b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b8 48894424f8                     mov        qword ptr [rsp - 8], rax
016bd 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
016c4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
016cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d0 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
016d8 488f842490000000               pop        qword ptr [rsp + 0x90]
016e0 48894424f8                     mov        qword ptr [rsp - 8], rax
016e5 8b8424fc000000                 mov        eax, dword ptr [rsp + 0xfc]
016ec 898424b0000000                 mov        dword ptr [rsp + 0xb0], eax
016f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f8 48894424f8                     mov        qword ptr [rsp - 8], rax
016fd 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01704 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
0170b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01710 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
01718 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01720 666690                         nop        
01723 e8b8d4b5ff                     call       0x7ffaeb9c3660
01728 0f1f84002018000c               nop        dword ptr [rax + rax + 0xc001820]
01730 be45ffffff                     mov        esi, 0xffffff45
01735 48894424f8                     mov        qword ptr [rsp - 8], rax
0173a 8b442408                       mov        eax, dword ptr [rsp + 8]
0173e 890424                         mov        dword ptr [rsp], eax
01741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01746 48894424f8                     mov        qword ptr [rsp - 8], rax
0174b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0174f 89442404                       mov        dword ptr [rsp + 4], eax
01753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01758 48ff742410                     push       qword ptr [rsp + 0x10]
0175d 488f442408                     pop        qword ptr [rsp + 8]
01762 48ff742418                     push       qword ptr [rsp + 0x18]
01767 488f442410                     pop        qword ptr [rsp + 0x10]
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01775 89442418                       mov        dword ptr [rsp + 0x18], eax
01779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177e 48894424f8                     mov        qword ptr [rsp - 8], rax
01783 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01787 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0178b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01790 48894424f8                     mov        qword ptr [rsp - 8], rax
01795 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01799 89442420                       mov        dword ptr [rsp + 0x20], eax
0179d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a2 48894424f8                     mov        qword ptr [rsp - 8], rax
017a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
017ab 89442424                       mov        dword ptr [rsp + 0x24], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
017b9 48ff742438                     push       qword ptr [rsp + 0x38]
017be 488f442430                     pop        qword ptr [rsp + 0x30]
017c3 48894424f8                     mov        qword ptr [rsp - 8], rax
017c8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017cc 89442438                       mov        dword ptr [rsp + 0x38], eax
017d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d5 48894424f8                     mov        qword ptr [rsp - 8], rax
017da 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e7 48ff742448                     push       qword ptr [rsp + 0x48]
017ec 488f442440                     pop        qword ptr [rsp + 0x40]
017f1 48ff742450                     push       qword ptr [rsp + 0x50]
017f6 488f442448                     pop        qword ptr [rsp + 0x48]
017fb 48ff742458                     push       qword ptr [rsp + 0x58]
01800 488f442450                     pop        qword ptr [rsp + 0x50]
01805 48894424f8                     mov        qword ptr [rsp - 8], rax
0180a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01811 89442458                       mov        dword ptr [rsp + 0x58], eax
01815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181a 48894424f8                     mov        qword ptr [rsp - 8], rax
0181f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01826 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0182a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182f 48894424f8                     mov        qword ptr [rsp - 8], rax
01834 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0183b 89442460                       mov        dword ptr [rsp + 0x60], eax
0183f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01844 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
0184c 488f442468                     pop        qword ptr [rsp + 0x68]
01851 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
01859 488f442470                     pop        qword ptr [rsp + 0x70]
0185e 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01866 488f442478                     pop        qword ptr [rsp + 0x78]
0186b 48894424f8                     mov        qword ptr [rsp - 8], rax
01870 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01877 89442464                       mov        dword ptr [rsp + 0x64], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 48894424f8                     mov        qword ptr [rsp - 8], rax
01885 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
0188c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01893 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01898 48894424f8                     mov        qword ptr [rsp - 8], rax
0189d 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
018a4 89842484000000                 mov        dword ptr [rsp + 0x84], eax
018ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b0 48894424f8                     mov        qword ptr [rsp - 8], rax
018b5 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
018bc 89842488000000                 mov        dword ptr [rsp + 0x88], eax
018c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c8 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
018d0 488f842490000000               pop        qword ptr [rsp + 0x90]
018d8 48894424f8                     mov        qword ptr [rsp - 8], rax
018dd 8b8424f8000000                 mov        eax, dword ptr [rsp + 0xf8]
018e4 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
018eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f0 48894424f8                     mov        qword ptr [rsp - 8], rax
018f5 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
018fc 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01910 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01918 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
01920 666690                         nop        
01923 e8b8d2b5ff                     call       0x7ffaeb9c3660
01928 0f1f8400201a000d               nop        dword ptr [rax + rax + 0xd001a20]
01930 be45ffffff                     mov        esi, 0xffffff45
01935 48894424f8                     mov        qword ptr [rsp - 8], rax
0193a 8b442408                       mov        eax, dword ptr [rsp + 8]
0193e 890424                         mov        dword ptr [rsp], eax
01941 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01946 48894424f8                     mov        qword ptr [rsp - 8], rax
0194b 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0194f 89442404                       mov        dword ptr [rsp + 4], eax
01953 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01958 48ff742410                     push       qword ptr [rsp + 0x10]
0195d 488f442408                     pop        qword ptr [rsp + 8]
01962 48ff742418                     push       qword ptr [rsp + 0x18]
01967 488f442410                     pop        qword ptr [rsp + 0x10]
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01975 89442418                       mov        dword ptr [rsp + 0x18], eax
01979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197e 48894424f8                     mov        qword ptr [rsp - 8], rax
01983 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01987 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48894424f8                     mov        qword ptr [rsp - 8], rax
01995 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01999 89442420                       mov        dword ptr [rsp + 0x20], eax
0199d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a2 48894424f8                     mov        qword ptr [rsp - 8], rax
019a7 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
019ab 89442424                       mov        dword ptr [rsp + 0x24], eax
019af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b4 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
019b9 48ff742438                     push       qword ptr [rsp + 0x38]
019be 488f442430                     pop        qword ptr [rsp + 0x30]
019c3 48894424f8                     mov        qword ptr [rsp - 8], rax
019c8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019cc 89442438                       mov        dword ptr [rsp + 0x38], eax
019d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d5 48894424f8                     mov        qword ptr [rsp - 8], rax
019da 8b442444                       mov        eax, dword ptr [rsp + 0x44]
019de 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e7 48ff742448                     push       qword ptr [rsp + 0x48]
019ec 488f442440                     pop        qword ptr [rsp + 0x40]
019f1 48ff742450                     push       qword ptr [rsp + 0x50]
019f6 488f442448                     pop        qword ptr [rsp + 0x48]
019fb 48ff742458                     push       qword ptr [rsp + 0x58]
01a00 488f442450                     pop        qword ptr [rsp + 0x50]
01a05 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0a 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a11 89442458                       mov        dword ptr [rsp + 0x58], eax
01a15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1f 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01a26 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a34 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a3b 89442460                       mov        dword ptr [rsp + 0x60], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01a4c 488f442468                     pop        qword ptr [rsp + 0x68]
01a51 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01a59 488f442478                     pop        qword ptr [rsp + 0x78]
01a5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a63 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01a6a 89442464                       mov        dword ptr [rsp + 0x64], eax
01a6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a73 48894424f8                     mov        qword ptr [rsp - 8], rax
01a78 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01a7f 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a90 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01a97 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa8 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01aaf 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ab6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abb 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01ac3 488f842490000000               pop        qword ptr [rsp + 0x90]
01acb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad0 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01ad7 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
01ade 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae3 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01aeb 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
01af3 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
01afa 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01b02 90                             nop        
01b03 e8d8d0b5ff                     call       0x7ffaeb9c3660
01b08 0f1f8400001c000e               nop        dword ptr [rax + rax + 0xe001c00]
01b10 be45ffffff                     mov        esi, 0xffffff45
01b15 41b8ffffff7f                   mov        r8d, 0x7fffffff
01b1b 4d3bc8                         cmp        r9, r8
01b1e bdffffffff                     mov        ebp, 0xffffffff
01b23 7c08                           jl         0x7ffaebe665ad
01b25 400f95c5                       setne      bpl
01b29 400fb6ed                       movzx      ebp, bpl
01b2d 48895c2430                     mov        qword ptr [rsp + 0x30], rbx
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01b3e 89442460                       mov        dword ptr [rsp + 0x60], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4c 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b53 89442464                       mov        dword ptr [rsp + 0x64], eax
01b57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b61 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b68 89442468                       mov        dword ptr [rsp + 0x68], eax
01b6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b71 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
01b79 488f842480000000               pop        qword ptr [rsp + 0x80]
01b81 48894424f8                     mov        qword ptr [rsp - 8], rax
01b86 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01b8d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b96 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ba2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01ba9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bae 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb3 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01bba 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcb 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01bd2 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bde 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
01be6 488f842498000000               pop        qword ptr [rsp + 0x98]
01bee 48ffb424e0000000               push       qword ptr [rsp + 0xe0]
01bf6 488f8424a0000000               pop        qword ptr [rsp + 0xa0]
01bfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01c03 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
01c0a 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
01c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c16 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
01c1e 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01c26 898c24c4000000                 mov        dword ptr [rsp + 0xc4], ecx
01c2d 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
01c35 6690                           nop        
01c37 e8a4cfb5ff                     call       0x7ffaeb9c3660
01c3c 0f1f8400341d000f               nop        dword ptr [rax + rax + 0xf001d34]
01c44 be45ffffff                     mov        esi, 0xffffff45
01c49 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4e 8b442408                       mov        eax, dword ptr [rsp + 8]
01c52 890424                         mov        dword ptr [rsp], eax
01c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5f 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01c63 89442404                       mov        dword ptr [rsp + 4], eax
01c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6c 48ff742410                     push       qword ptr [rsp + 0x10]
01c71 488f442408                     pop        qword ptr [rsp + 8]
01c76 48ff742418                     push       qword ptr [rsp + 0x18]
01c7b 488f442410                     pop        qword ptr [rsp + 0x10]
01c80 48894424f8                     mov        qword ptr [rsp - 8], rax
01c85 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01c89 89442418                       mov        dword ptr [rsp + 0x18], eax
01c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c92 48894424f8                     mov        qword ptr [rsp - 8], rax
01c97 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01c9b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cad 89442420                       mov        dword ptr [rsp + 0x20], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbb 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01cbf 89442424                       mov        dword ptr [rsp + 0x24], eax
01cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc8 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ccd 48ff742438                     push       qword ptr [rsp + 0x38]
01cd2 488f442430                     pop        qword ptr [rsp + 0x30]
01cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ce0 89442438                       mov        dword ptr [rsp + 0x38], eax
01ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cee 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cf2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfb 48ff742448                     push       qword ptr [rsp + 0x48]
01d00 488f442440                     pop        qword ptr [rsp + 0x40]
01d05 48ff742450                     push       qword ptr [rsp + 0x50]
01d0a 488f442448                     pop        qword ptr [rsp + 0x48]
01d0f 48ff742458                     push       qword ptr [rsp + 0x58]
01d14 488f442450                     pop        qword ptr [rsp + 0x50]
01d19 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1e 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01d25 89442458                       mov        dword ptr [rsp + 0x58], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d33 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01d3a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 48894424f8                     mov        qword ptr [rsp - 8], rax
01d48 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d4f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d58 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d62 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01d69 89442464                       mov        dword ptr [rsp + 0x64], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d7e 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8f 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01d96 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01d9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da2 48894424f8                     mov        qword ptr [rsp - 8], rax
01da7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01dae 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01db5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dba 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01dc2 898c24b8000000                 mov        dword ptr [rsp + 0xb8], ecx
01dc9 6690                           nop        
01dcb e810ceb5ff                     call       0x7ffaeb9c3660
01dd0 0f1f8400c81e0010               nop        dword ptr [rax + rax + 0x10001ec8]
01dd8 be45ffffff                     mov        esi, 0xffffff45
01ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
01de2 8b442408                       mov        eax, dword ptr [rsp + 8]
01de6 890424                         mov        dword ptr [rsp], eax
01de9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dee 48894424f8                     mov        qword ptr [rsp - 8], rax
01df3 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01df7 89442404                       mov        dword ptr [rsp + 4], eax
01dfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e00 48ff742410                     push       qword ptr [rsp + 0x10]
01e05 488f442408                     pop        qword ptr [rsp + 8]
01e0a 48ff742418                     push       qword ptr [rsp + 0x18]
01e0f 488f442410                     pop        qword ptr [rsp + 0x10]
01e14 48894424f8                     mov        qword ptr [rsp - 8], rax
01e19 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01e1d 89442418                       mov        dword ptr [rsp + 0x18], eax
01e21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e26 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2b 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01e2f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01e33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e38 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e41 89442420                       mov        dword ptr [rsp + 0x20], eax
01e45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4f 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01e53 89442424                       mov        dword ptr [rsp + 0x24], eax
01e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5c 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01e61 48ff742438                     push       qword ptr [rsp + 0x38]
01e66 488f442430                     pop        qword ptr [rsp + 0x30]
01e6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e70 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e74 89442438                       mov        dword ptr [rsp + 0x38], eax
01e78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e86 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8f 48ff742448                     push       qword ptr [rsp + 0x48]
01e94 488f442440                     pop        qword ptr [rsp + 0x40]
01e99 48ff742450                     push       qword ptr [rsp + 0x50]
01e9e 488f442448                     pop        qword ptr [rsp + 0x48]
01ea3 48ff742458                     push       qword ptr [rsp + 0x58]
01ea8 488f442450                     pop        qword ptr [rsp + 0x50]
01ead 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb2 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01eb9 89442458                       mov        dword ptr [rsp + 0x58], eax
01ebd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec7 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ece 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ed2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed7 48894424f8                     mov        qword ptr [rsp - 8], rax
01edc 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ee3 89442460                       mov        dword ptr [rsp + 0x60], eax
01ee7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eec 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
01efd 89442464                       mov        dword ptr [rsp + 0x64], eax
01f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f06 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0b 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f12 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f23 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
01f2a 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f36 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3b 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f42 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01f49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01f56 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01f5e 90                             nop        
01f5f e87cccb5ff                     call       0x7ffaeb9c3660
01f64 0f1f84005c200011               nop        dword ptr [rax + rax + 0x1100205c]
01f6c be3dffffff                     mov        esi, 0xffffff3d
01f71 48894424f8                     mov        qword ptr [rsp - 8], rax
01f76 8b442408                       mov        eax, dword ptr [rsp + 8]
01f7a 890424                         mov        dword ptr [rsp], eax
01f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f82 48894424f8                     mov        qword ptr [rsp - 8], rax
01f87 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
01f8b 89442404                       mov        dword ptr [rsp + 4], eax
01f8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f94 48ff742410                     push       qword ptr [rsp + 0x10]
01f99 488f442408                     pop        qword ptr [rsp + 8]
01f9e 48ff742418                     push       qword ptr [rsp + 0x18]
01fa3 488f442410                     pop        qword ptr [rsp + 0x10]
01fa8 48894424f8                     mov        qword ptr [rsp - 8], rax
01fad 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01fb1 89442418                       mov        dword ptr [rsp + 0x18], eax
01fb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fba 48894424f8                     mov        qword ptr [rsp - 8], rax
01fbf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
01fc3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fcc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fd5 89442420                       mov        dword ptr [rsp + 0x20], eax
01fd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fde 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
01fe7 89442424                       mov        dword ptr [rsp + 0x24], eax
01feb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
01ff5 48ff742438                     push       qword ptr [rsp + 0x38]
01ffa 488f442430                     pop        qword ptr [rsp + 0x30]
01fff 48894424f8                     mov        qword ptr [rsp - 8], rax
02004 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02008 89442438                       mov        dword ptr [rsp + 0x38], eax
0200c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02011 48894424f8                     mov        qword ptr [rsp - 8], rax
02016 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0201a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0201e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02023 48ff742448                     push       qword ptr [rsp + 0x48]
02028 488f442440                     pop        qword ptr [rsp + 0x40]
0202d 48ff742450                     push       qword ptr [rsp + 0x50]
02032 488f442448                     pop        qword ptr [rsp + 0x48]
02037 48ff742458                     push       qword ptr [rsp + 0x58]
0203c 488f442450                     pop        qword ptr [rsp + 0x50]
02041 48894424f8                     mov        qword ptr [rsp - 8], rax
02046 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0204d 89442458                       mov        dword ptr [rsp + 0x58], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 48894424f8                     mov        qword ptr [rsp - 8], rax
0205b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02062 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02066 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206b 48894424f8                     mov        qword ptr [rsp - 8], rax
02070 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02077 89442460                       mov        dword ptr [rsp + 0x60], eax
0207b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02080 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
02088 488f442478                     pop        qword ptr [rsp + 0x78]
0208d 48894424f8                     mov        qword ptr [rsp - 8], rax
02092 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
02099 89442464                       mov        dword ptr [rsp + 0x64], eax
0209d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020a2 48894424f8                     mov        qword ptr [rsp - 8], rax
020a7 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
020ae 89842480000000                 mov        dword ptr [rsp + 0x80], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
020c6 89842484000000                 mov        dword ptr [rsp + 0x84], eax
020cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d2 48894424f8                     mov        qword ptr [rsp - 8], rax
020d7 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
020de 89842488000000                 mov        dword ptr [rsp + 0x88], eax
020e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ea 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
020f2 488f842490000000               pop        qword ptr [rsp + 0x90]
020fa 48894424f8                     mov        qword ptr [rsp - 8], rax
020ff 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02106 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
0210d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02112 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0211a 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02122 488f8424b8000000               pop        qword ptr [rsp + 0xb8]
0212a 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02132 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0213a 48894424f8                     mov        qword ptr [rsp - 8], rax
0213f 8b8424d8000000                 mov        eax, dword ptr [rsp + 0xd8]
02146 898424c8000000                 mov        dword ptr [rsp + 0xc8], eax
0214d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02152 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
02159 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02161 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02169 6690                           nop        
0216b e870cab5ff                     call       0x7ffaeb9c3660
02170 0f1f840068220012               nop        dword ptr [rax + rax + 0x12002268]
02178 be45ffffff                     mov        esi, 0xffffff45
0217d 48894424f8                     mov        qword ptr [rsp - 8], rax
02182 8b442408                       mov        eax, dword ptr [rsp + 8]
02186 890424                         mov        dword ptr [rsp], eax
02189 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218e 48894424f8                     mov        qword ptr [rsp - 8], rax
02193 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02197 89442404                       mov        dword ptr [rsp + 4], eax
0219b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a0 48ff742410                     push       qword ptr [rsp + 0x10]
021a5 488f442408                     pop        qword ptr [rsp + 8]
021aa 48ff742418                     push       qword ptr [rsp + 0x18]
021af 488f442410                     pop        qword ptr [rsp + 0x10]
021b4 48894424f8                     mov        qword ptr [rsp - 8], rax
021b9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
021bd 89442418                       mov        dword ptr [rsp + 0x18], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
021cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
021d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d8 48894424f8                     mov        qword ptr [rsp - 8], rax
021dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021e1 89442420                       mov        dword ptr [rsp + 0x20], eax
021e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ea 48894424f8                     mov        qword ptr [rsp - 8], rax
021ef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
021f3 89442424                       mov        dword ptr [rsp + 0x24], eax
021f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02201 48ff742438                     push       qword ptr [rsp + 0x38]
02206 488f442430                     pop        qword ptr [rsp + 0x30]
0220b 48894424f8                     mov        qword ptr [rsp - 8], rax
02210 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02214 89442438                       mov        dword ptr [rsp + 0x38], eax
02218 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221d 48894424f8                     mov        qword ptr [rsp - 8], rax
02222 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02226 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0222a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222f 48ff742448                     push       qword ptr [rsp + 0x48]
02234 488f442440                     pop        qword ptr [rsp + 0x40]
02239 48ff742450                     push       qword ptr [rsp + 0x50]
0223e 488f442448                     pop        qword ptr [rsp + 0x48]
02243 48ff742458                     push       qword ptr [rsp + 0x58]
02248 488f442450                     pop        qword ptr [rsp + 0x50]
0224d 897c2458                       mov        dword ptr [rsp + 0x58], edi
02251 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
02259 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
02261 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
02269 6690                           nop        
0226b e870c9b5ff                     call       0x7ffaeb9c3660
02270 0f1f840068230013               nop        dword ptr [rax + rax + 0x13002368]
02278 be45ffffff                     mov        esi, 0xffffff45
0227d 48894424f8                     mov        qword ptr [rsp - 8], rax
02282 8b442408                       mov        eax, dword ptr [rsp + 8]
02286 890424                         mov        dword ptr [rsp], eax
02289 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228e 48894424f8                     mov        qword ptr [rsp - 8], rax
02293 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
02297 89442404                       mov        dword ptr [rsp + 4], eax
0229b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a0 48ff742410                     push       qword ptr [rsp + 0x10]
022a5 488f442408                     pop        qword ptr [rsp + 8]
022aa 48ff742418                     push       qword ptr [rsp + 0x18]
022af 488f442410                     pop        qword ptr [rsp + 0x10]
022b4 48894424f8                     mov        qword ptr [rsp - 8], rax
022b9 8b442420                       mov        eax, dword ptr [rsp + 0x20]
022bd 89442418                       mov        dword ptr [rsp + 0x18], eax
022c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c6 48894424f8                     mov        qword ptr [rsp - 8], rax
022cb 8b442424                       mov        eax, dword ptr [rsp + 0x24]
022cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d8 48894424f8                     mov        qword ptr [rsp - 8], rax
022dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022e1 89442420                       mov        dword ptr [rsp + 0x20], eax
022e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ea 48894424f8                     mov        qword ptr [rsp - 8], rax
022ef 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
022f3 89442424                       mov        dword ptr [rsp + 0x24], eax
022f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fc 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
02301 48ff742438                     push       qword ptr [rsp + 0x38]
02306 488f442430                     pop        qword ptr [rsp + 0x30]
0230b 48894424f8                     mov        qword ptr [rsp - 8], rax
02310 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02314 89442438                       mov        dword ptr [rsp + 0x38], eax
02318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02326 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 48ff742448                     push       qword ptr [rsp + 0x48]
02334 488f442440                     pop        qword ptr [rsp + 0x40]
02339 48ff742450                     push       qword ptr [rsp + 0x50]
0233e 488f442448                     pop        qword ptr [rsp + 0x48]
02343 48ff742458                     push       qword ptr [rsp + 0x58]
02348 488f442450                     pop        qword ptr [rsp + 0x50]
0234d 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02355 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0235d 6690                           nop        
0235f e87cc8b5ff                     call       0x7ffaeb9c3660
02364 0f1f84005c240014               nop        dword ptr [rax + rax + 0x1400245c]
0236c be45ffffff                     mov        esi, 0xffffff45
02371 48894424f8                     mov        qword ptr [rsp - 8], rax
02376 8b442408                       mov        eax, dword ptr [rsp + 8]
0237a 890424                         mov        dword ptr [rsp], eax
0237d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02382 48894424f8                     mov        qword ptr [rsp - 8], rax
02387 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0238b 89442404                       mov        dword ptr [rsp + 4], eax
0238f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02394 48ff742410                     push       qword ptr [rsp + 0x10]
02399 488f442408                     pop        qword ptr [rsp + 8]
0239e 48ff742418                     push       qword ptr [rsp + 0x18]
023a3 488f442410                     pop        qword ptr [rsp + 0x10]
023a8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ad 8b442420                       mov        eax, dword ptr [rsp + 0x20]
023b1 89442418                       mov        dword ptr [rsp + 0x18], eax
023b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ba 48894424f8                     mov        qword ptr [rsp - 8], rax
023bf 8b442424                       mov        eax, dword ptr [rsp + 0x24]
023c3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
023c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023cc 48894424f8                     mov        qword ptr [rsp - 8], rax
023d1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023d5 89442420                       mov        dword ptr [rsp + 0x20], eax
023d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023de 48894424f8                     mov        qword ptr [rsp - 8], rax
023e3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
023e7 89442424                       mov        dword ptr [rsp + 0x24], eax
023eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f0 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
023f5 48ff742438                     push       qword ptr [rsp + 0x38]
023fa 488f442430                     pop        qword ptr [rsp + 0x30]
023ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02404 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02408 89442438                       mov        dword ptr [rsp + 0x38], eax
0240c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02411 48894424f8                     mov        qword ptr [rsp - 8], rax
02416 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0241a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0241e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02423 48ff742448                     push       qword ptr [rsp + 0x48]
02428 488f442440                     pop        qword ptr [rsp + 0x40]
0242d 48ff742450                     push       qword ptr [rsp + 0x50]
02432 488f442448                     pop        qword ptr [rsp + 0x48]
02437 48ff742458                     push       qword ptr [rsp + 0x58]
0243c 488f442450                     pop        qword ptr [rsp + 0x50]
02441 48894424f8                     mov        qword ptr [rsp - 8], rax
02446 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0244d 89442458                       mov        dword ptr [rsp + 0x58], eax
02451 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02456 48894424f8                     mov        qword ptr [rsp - 8], rax
0245b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02462 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02466 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246b 48894424f8                     mov        qword ptr [rsp - 8], rax
02470 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02477 89442460                       mov        dword ptr [rsp + 0x60], eax
0247b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02480 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02488 488f442468                     pop        qword ptr [rsp + 0x68]
0248d 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02495 488f442470                     pop        qword ptr [rsp + 0x70]
0249a 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
024a2 488f442478                     pop        qword ptr [rsp + 0x78]
024a7 48894424f8                     mov        qword ptr [rsp - 8], rax
024ac 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
024b3 89442464                       mov        dword ptr [rsp + 0x64], eax
024b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024bc 48894424f8                     mov        qword ptr [rsp - 8], rax
024c1 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
024c8 89842480000000                 mov        dword ptr [rsp + 0x80], eax
024cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d4 48894424f8                     mov        qword ptr [rsp - 8], rax
024d9 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
024e0 89842484000000                 mov        dword ptr [rsp + 0x84], eax
024e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ec 48894424f8                     mov        qword ptr [rsp - 8], rax
024f1 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
024f8 89842488000000                 mov        dword ptr [rsp + 0x88], eax
024ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02504 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
0250c 488f842490000000               pop        qword ptr [rsp + 0x90]
02514 48894424f8                     mov        qword ptr [rsp - 8], rax
02519 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
02520 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02527 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02534 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0253c 666690                         nop        
0253f e89cc6b5ff                     call       0x7ffaeb9c3660
02544 0f1f84003c260015               nop        dword ptr [rax + rax + 0x1500263c]
0254c be45ffffff                     mov        esi, 0xffffff45
02551 48894424f8                     mov        qword ptr [rsp - 8], rax
02556 8b442408                       mov        eax, dword ptr [rsp + 8]
0255a 890424                         mov        dword ptr [rsp], eax
0255d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02562 48894424f8                     mov        qword ptr [rsp - 8], rax
02567 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0256b 89442404                       mov        dword ptr [rsp + 4], eax
0256f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02574 48ff742410                     push       qword ptr [rsp + 0x10]
02579 488f442408                     pop        qword ptr [rsp + 8]
0257e 48ff742418                     push       qword ptr [rsp + 0x18]
02583 488f442410                     pop        qword ptr [rsp + 0x10]
02588 48894424f8                     mov        qword ptr [rsp - 8], rax
0258d 8b442420                       mov        eax, dword ptr [rsp + 0x20]
02591 89442418                       mov        dword ptr [rsp + 0x18], eax
02595 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259a 48894424f8                     mov        qword ptr [rsp - 8], rax
0259f 8b442424                       mov        eax, dword ptr [rsp + 0x24]
025a3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
025a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ac 48894424f8                     mov        qword ptr [rsp - 8], rax
025b1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025b5 89442420                       mov        dword ptr [rsp + 0x20], eax
025b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025be 48894424f8                     mov        qword ptr [rsp - 8], rax
025c3 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
025c7 89442424                       mov        dword ptr [rsp + 0x24], eax
025cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d0 48ff742438                     push       qword ptr [rsp + 0x38]
025d5 488f442430                     pop        qword ptr [rsp + 0x30]
025da 48894424f8                     mov        qword ptr [rsp - 8], rax
025df 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025e3 89442438                       mov        dword ptr [rsp + 0x38], eax
025e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025ec 48894424f8                     mov        qword ptr [rsp - 8], rax
025f1 8b442444                       mov        eax, dword ptr [rsp + 0x44]
025f5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025fe 48ff742448                     push       qword ptr [rsp + 0x48]
02603 488f442440                     pop        qword ptr [rsp + 0x40]
02608 48ff742450                     push       qword ptr [rsp + 0x50]
0260d 488f442448                     pop        qword ptr [rsp + 0x48]
02612 48ff742458                     push       qword ptr [rsp + 0x58]
02617 488f442450                     pop        qword ptr [rsp + 0x50]
0261c 48894424f8                     mov        qword ptr [rsp - 8], rax
02621 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
02628 89442458                       mov        dword ptr [rsp + 0x58], eax
0262c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02631 48894424f8                     mov        qword ptr [rsp - 8], rax
02636 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0263d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02646 48894424f8                     mov        qword ptr [rsp - 8], rax
0264b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02652 89442460                       mov        dword ptr [rsp + 0x60], eax
02656 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0265b 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
02663 488f442468                     pop        qword ptr [rsp + 0x68]
02668 48ffb424d0000000               push       qword ptr [rsp + 0xd0]
02670 488f442470                     pop        qword ptr [rsp + 0x70]
02675 48ffb424a8000000               push       qword ptr [rsp + 0xa8]
0267d 488f442478                     pop        qword ptr [rsp + 0x78]
02682 48894424f8                     mov        qword ptr [rsp - 8], rax
02687 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
0268e 89442464                       mov        dword ptr [rsp + 0x64], eax
02692 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02697 48894424f8                     mov        qword ptr [rsp - 8], rax
0269c 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
026a3 89842480000000                 mov        dword ptr [rsp + 0x80], eax
026aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026af 48894424f8                     mov        qword ptr [rsp - 8], rax
026b4 8b8424b4000000                 mov        eax, dword ptr [rsp + 0xb4]
026bb 89842484000000                 mov        dword ptr [rsp + 0x84], eax
026c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c7 48894424f8                     mov        qword ptr [rsp - 8], rax
026cc 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
026d3 89842488000000                 mov        dword ptr [rsp + 0x88], eax
026da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026df 48ffb424c0000000               push       qword ptr [rsp + 0xc0]
026e7 488f842490000000               pop        qword ptr [rsp + 0x90]
026ef 48894424f8                     mov        qword ptr [rsp - 8], rax
026f4 8b8424bc000000                 mov        eax, dword ptr [rsp + 0xbc]
026fb 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
02702 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02707 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0270f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
02717 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0271f 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
02727 e8b4c4b5ff                     call       0x7ffaeb9c3660
0272c 0f1f840024280016               nop        dword ptr [rax + rax + 0x16002824]
02734 4533d2                         xor        r10d, r10d
02737 4c89942410010000               mov        qword ptr [rsp + 0x110], r10
0273f e98fdaffff                     jmp        0x7ffaebe64c53
02744 4533d2                         xor        r10d, r10d
02747 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0274c e9a9daffff                     jmp        0x7ffaebe64c7a
02751 4533d2                         xor        r10d, r10d
02754 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02759 e9c8daffff                     jmp        0x7ffaebe64ca6
0275e 4533d2                         xor        r10d, r10d
02761 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02766 e9e2daffff                     jmp        0x7ffaebe64ccd
0276b 4533d2                         xor        r10d, r10d
0276e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02773 e907dbffff                     jmp        0x7ffaebe64cff
02778 4533d2                         xor        r10d, r10d
0277b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02780 e924dbffff                     jmp        0x7ffaebe64d29
02785 4533d2                         xor        r10d, r10d
02788 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02790 e949dbffff                     jmp        0x7ffaebe64d5e
02795 4533d2                         xor        r10d, r10d
02798 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
027a0 e95fdbffff                     jmp        0x7ffaebe64d84
027a5 bebeffffff                     mov        esi, 0xffffffbe
027aa 48894424f8                     mov        qword ptr [rsp - 8], rax
027af 8b442408                       mov        eax, dword ptr [rsp + 8]
027b3 890424                         mov        dword ptr [rsp], eax
027b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bb 48894424f8                     mov        qword ptr [rsp - 8], rax
027c0 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
027c4 89442404                       mov        dword ptr [rsp + 4], eax
027c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cd 48ff742410                     push       qword ptr [rsp + 0x10]
027d2 488f442408                     pop        qword ptr [rsp + 8]
027d7 48ff742418                     push       qword ptr [rsp + 0x18]
027dc 488f442410                     pop        qword ptr [rsp + 0x10]
027e1 48894424f8                     mov        qword ptr [rsp - 8], rax
027e6 8b442420                       mov        eax, dword ptr [rsp + 0x20]
027ea 89442418                       mov        dword ptr [rsp + 0x18], eax
027ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f3 48894424f8                     mov        qword ptr [rsp - 8], rax
027f8 8b442424                       mov        eax, dword ptr [rsp + 0x24]
027fc 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02800 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02805 48894424f8                     mov        qword ptr [rsp - 8], rax
0280a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0280e 89442420                       mov        dword ptr [rsp + 0x20], eax
02812 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02817 48894424f8                     mov        qword ptr [rsp - 8], rax
0281c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02820 89442424                       mov        dword ptr [rsp + 0x24], eax
02824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02829 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
0282e 48ff742438                     push       qword ptr [rsp + 0x38]
02833 488f442430                     pop        qword ptr [rsp + 0x30]
02838 48894424f8                     mov        qword ptr [rsp - 8], rax
0283d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02841 89442438                       mov        dword ptr [rsp + 0x38], eax
02845 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284a 48894424f8                     mov        qword ptr [rsp - 8], rax
0284f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02853 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285c 48ff742448                     push       qword ptr [rsp + 0x48]
02861 488f442440                     pop        qword ptr [rsp + 0x40]
02866 48ff742450                     push       qword ptr [rsp + 0x50]
0286b 488f442448                     pop        qword ptr [rsp + 0x48]
02870 48ff742458                     push       qword ptr [rsp + 0x58]
02875 488f442450                     pop        qword ptr [rsp + 0x50]
0287a 90                             nop        
0287b e860c3b5ff                     call       0x7ffaeb9c3660
02880 0f1f840078290017               nop        dword ptr [rax + rax + 0x17002978]
02888 be85ffffff                     mov        esi, 0xffffff85
0288d 8b6c2408                       mov        ebp, dword ptr [rsp + 8]
02891 48894424f8                     mov        qword ptr [rsp - 8], rax
02896 8b44240c                       mov        eax, dword ptr [rsp + 0xc]
0289a 890424                         mov        dword ptr [rsp], eax
0289d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a2 48894424f8                     mov        qword ptr [rsp - 8], rax
028a7 8b442420                       mov        eax, dword ptr [rsp + 0x20]
028ab 89442404                       mov        dword ptr [rsp + 4], eax
028af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b4 48894424f8                     mov        qword ptr [rsp - 8], rax
028b9 8b442424                       mov        eax, dword ptr [rsp + 0x24]
028bd 89442408                       mov        dword ptr [rsp + 8], eax
028c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c6 48894424f8                     mov        qword ptr [rsp - 8], rax
028cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
028d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d8 48894424f8                     mov        qword ptr [rsp - 8], rax
028dd 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
028e1 89442410                       mov        dword ptr [rsp + 0x10], eax
028e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ea 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
028ef 48ff742438                     push       qword ptr [rsp + 0x38]
028f4 488f442420                     pop        qword ptr [rsp + 0x20]
028f9 48894424f8                     mov        qword ptr [rsp - 8], rax
028fe 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02902 89442414                       mov        dword ptr [rsp + 0x14], eax
02906 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0290b 48894424f8                     mov        qword ptr [rsp - 8], rax
02910 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02914 89442428                       mov        dword ptr [rsp + 0x28], eax
02918 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291d 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
02922 90                             nop        
02923 e8b8c2b5ff                     call       0x7ffaeb9c3660
02928 0f1f8400202a0018               nop        dword ptr [rax + rax + 0x18002a20]
02930 bef6ffffff                     mov        esi, 0xfffffff6
02935 6690                           nop        
02937 e8a4c2b5ff                     call       0x7ffaeb9c3660
0293c 0f1f8400342a0019               nop        dword ptr [rax + rax + 0x19002a34]
02944 be5d000000                     mov        esi, 0x5d
02949 6690                           nop        
0294b e890c2b5ff                     call       0x7ffaeb9c3660
02950 0f1f8400482a001a               nop        dword ptr [rax + rax + 0x1a002a48]
02958 bef6ffffff                     mov        esi, 0xfffffff6
0295d 8be9                           mov        ebp, ecx
0295f e87cc2b5ff                     call       0x7ffaeb9c3660
02964 0f1f84005c2a001b               nop        dword ptr [rax + rax + 0x1b002a5c]
0296c bef6ffffff                     mov        esi, 0xfffffff6
02971 418be8                         mov        ebp, r8d
02974 666690                         nop        
02977 e864c2b5ff                     call       0x7ffaeb9c3660
0297c 0f1f8400742a001c               nop        dword ptr [rax + rax + 0x1c002a74]
02984 bef6ffffff                     mov        esi, 0xfffffff6
02989 418be9                         mov        ebp, r9d
0298c 666690                         nop        
0298f e84cc2b5ff                     call       0x7ffaeb9c3660
02994 0f1f84008c2a001d               nop        dword ptr [rax + rax + 0x1d002a8c]
0299c eb00                           jmp        0x7ffaebe6741e
0299e 488bf0                         mov        rsi, rax
029a1 e9dee0ffff                     jmp        0x7ffaebe65504
029a6 49ba2c55e6ebfa7f0000           movabs     r10, 0x7ffaebe6552c
029b0 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
029b7 e9a46aa9ff                     jmp        0x7ffaeb8fdee0
029bc e85f36a8ff                     call       0x7ffaeb8eaaa0
029c1 e968d6ffff                     jmp        0x7ffaebe64aae
029c6 f4                             hlt        
029c7 f4                             hlt        
