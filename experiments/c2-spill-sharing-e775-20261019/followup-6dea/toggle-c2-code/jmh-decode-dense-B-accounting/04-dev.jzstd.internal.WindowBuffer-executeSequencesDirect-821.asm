00000 e83b794e19                     call       0x7ff8693636c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecd0000000                 sub        rsp, 0xd0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8530220000                   jne        0x7ff84fe7dfde
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004d 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00095 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
000ac 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b8 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000bf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c4 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d0 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000d7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
000dc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e8 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ec 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f1 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000f5 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000fa 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00101 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00106 488bfe                         mov        rdi, rsi
00109 c5f877                         vzeroupper 
0010c 49ba009e4469f87f0000           movabs     r10, 0x7ff869449e00
00116 41ffd2                         call       r10
00119 0f1f840000000000               nop        dword ptr [rax + rax]
00121 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00126 4d85d2                         test       r10, r10
00129 0f8431150000                   je         0x7ff84fe7d3e0
0012f 458b1a                         mov        r11d, dword ptr [r10]
00132 41c1eb0d                       shr        r11d, 0xd
00136 4181fb2c420000                 cmp        r11d, 0x422c
0013d 0f859d180000                   jne        0x7ff84fe7d760
00143 4c891424                       mov        qword ptr [rsp], r10
00147 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
0014f 4885ed                         test       rbp, rbp
00152 0f8414150000                   je         0x7ff84fe7d3ec
00158 448b5500                       mov        r10d, dword ptr [rbp]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fadd050000                 cmp        r10d, 0x5dd
00167 0f8573180000                   jne        0x7ff84fe7d760
0016d 4c8bd5                         mov        r10, rbp
00170 4c89542408                     mov        qword ptr [rsp + 8], r10
00175 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017d 4885ed                         test       rbp, rbp
00180 0f84f3140000                   je         0x7ff84fe7d3f9
00186 448b5d00                       mov        r11d, dword ptr [rbp]
0018a 41c1eb0d                       shr        r11d, 0xd
0018e 4181fbe0050000                 cmp        r11d, 0x5e0
00195 0f8545180000                   jne        0x7ff84fe7d760
0019b 4c8bd5                         mov        r10, rbp
0019e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ab 4885ed                         test       rbp, rbp
001ae 0f84d2140000                   je         0x7ff84fe7d406
001b4 448b5500                       mov        r10d, dword ptr [rbp]
001b8 41c1ea0d                       shr        r10d, 0xd
001bc 4181fadf050000                 cmp        r10d, 0x5df
001c3 0f8517180000                   jne        0x7ff84fe7d760
001c9 4c8bd5                         mov        r10, rbp
001cc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d1 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001d9 4885ed                         test       rbp, rbp
001dc 0f84b1140000                   je         0x7ff84fe7d413
001e2 448b5500                       mov        r10d, dword ptr [rbp]
001e6 41c1ea0d                       shr        r10d, 0xd
001ea 4181fadf050000                 cmp        r10d, 0x5df
001f1 0f85e9170000                   jne        0x7ff84fe7d760
001f7 4c8bd5                         mov        r10, rbp
001fa 4c89542470                     mov        qword ptr [rsp + 0x70], r10
001ff 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00207 4885ed                         test       rbp, rbp
0020a 0f8490140000                   je         0x7ff84fe7d420
00210 448b5500                       mov        r10d, dword ptr [rbp]
00214 41c1ea0d                       shr        r10d, 0xd
00218 4181fadd050000                 cmp        r10d, 0x5dd
0021f 0f85bb170000                   jne        0x7ff84fe7d760
00225 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0022f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00233 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00238 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0023d 4585d2                         test       r10d, r10d
00240 0f84e6160000                   je         0x7ff84fe7d6ac
00246 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0024f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00254 4585db                         test       r11d, r11d
00257 0f86cf160000                   jbe        0x7ff84fe7d6ac
0025d 4183fb01                       cmp        r11d, 1
00261 0f86c5160000                   jbe        0x7ff84fe7d6ac
00267 4183fb02                       cmp        r11d, 2
0026b 0f86bb160000                   jbe        0x7ff84fe7d6ac
00271 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00276 458b5204                       mov        r10d, dword ptr [r10 + 4]
0027a 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0027f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00284 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00288 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00290 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00295 4183c3f1                       add        r11d, -0xf
00299 4585db                         test       r11d, r11d
0029c 0f8c8a160000                   jl         0x7ff84fe7d6ac
002a2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002aa 4183c2f1                       add        r10d, -0xf
002ae 4585d2                         test       r10d, r10d
002b1 0f8c75160000                   jl         0x7ff84fe7d6ac
002b7 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002bf 4183c3f9                       add        r11d, -7
002c3 4585db                         test       r11d, r11d
002c6 0f8c60160000                   jl         0x7ff84fe7d6ac
002cc 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002d1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002d9 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002e1 4d63d3                         movsxd     r10, r11d
002e4 4183c3f1                       add        r11d, -0xf
002e8 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002f0 4983c2f1                       add        r10, -0xf
002f4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
002fc 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
00304 4983c2f1                       add        r10, -0xf
00308 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00310 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00318 4183c2f1                       add        r10d, -0xf
0031c 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00324 e9cd010000                     jmp        0x7ff84fe7c276
00329 4533d2                         xor        r10d, r10d
0032c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00331 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00336 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0033a 83fa03                         cmp        edx, 3
0033d 0f8eab030000                   jle        0x7ff84fe7c46e
00343 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00348 45895310                       mov        dword ptr [r11 + 0x10], r10d
0034c 458b5308                       mov        r10d, dword ptr [r11 + 8]
00350 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00354 448d52fd                       lea        r10d, [rdx - 3]
00358 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00360 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00365 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0036d 45895a08                       mov        dword ptr [r10 + 8], r11d
00371 4c639c24a0000000               movsxd     r11, dword ptr [rsp + 0xa0]
00379 4c63d3                         movsxd     r10, ebx
0037c 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00381 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00386 4c03d2                         add        r10, rdx
00389 4d3bda                         cmp        r11, r10
0038c 0f8fb2100000                   jg         0x7ff84fe7d1c4
00392 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0039a 4585db                         test       r11d, r11d
0039d 0f8e910f0000                   jle        0x7ff84fe7d0b4
003a3 448beb                         mov        r13d, ebx
003a6 44036c246c                     add        r13d, dword ptr [rsp + 0x6c]
003ab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003b0 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
003b5 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
003bd 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
003c2 4503d5                         add        r10d, r13d
003c5 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
003ca 0f8f4f090000                   jg         0x7ff84fe7ca9f
003d0 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003d5 0f8fc1100000                   jg         0x7ff84fe7d21c
003db 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003e0 4183fb10                       cmp        r11d, 0x10
003e4 0f8fc2010000                   jg         0x7ff84fe7c32c
003ea 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003ef 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
003f7 0f83730e0000                   jae        0x7ff84fe7cff0
003fd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00402 458bc2                         mov        r8d, r10d
00405 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0040a c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00411 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
00418 0f83960e0000                   jae        0x7ff84fe7d034
0041e 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00423 4503d0                         add        r10d, r8d
00426 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0042e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00433 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0043a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0043f 4403db                         add        r11d, ebx
00442 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00447 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0044c 442b9c24a0000000               sub        r11d, dword ptr [rsp + 0xa0]
00454 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
0045c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00461 4183fa10                       cmp        r10d, 0x10
00465 0f8f15110000                   jg         0x7ff84fe7d300
0046b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00473 4183fb10                       cmp        r11d, 0x10
00477 0f8c47030000                   jl         0x7ff84fe7c544
0047d 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00485 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0048d 0f831d0d0000                   jae        0x7ff84fe7cf30
00493 458bda                         mov        r11d, r10d
00496 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0049b c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
004a2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
004a7 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
004af 0f834f0d0000                   jae        0x7ff84fe7cf84
004b5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
004ba 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004bf c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
004c6 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
004ca 4103da                         add        ebx, r10d
004cd 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004d1 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004d6 41ffc0                         inc        r8d
004d9 4489442468                     mov        dword ptr [rsp + 0x68], r8d
004de 418502                         test       dword ptr [r10], eax
004e1 48894424f8                     mov        qword ptr [rsp - 8], rax
004e6 8b8424a4000000                 mov        eax, dword ptr [rsp + 0xa4]
004ed 89442438                       mov        dword ptr [rsp + 0x38], eax
004f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004f6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004fb 498d741a08                     lea        rsi, [r10 + rbx + 8]
00500 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00505 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
0050a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0050f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00514 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00519 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0051e 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00523 0f8da10a0000                   jge        0x7ff84fe7cd4a
00529 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0052e 0f83420c0000                   jae        0x7ff84fe7cef6
00534 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00539 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
0053e 4d8bd3                         mov        r10, r11
00541 49c1ea12                       shr        r10, 0x12
00545 458bd2                         mov        r10d, r10d
00548 4181e2ffff0300                 and        r10d, 0x3ffff
0054f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00554 458bd3                         mov        r10d, r11d
00557 49c1fb24                       sar        r11, 0x24
0055b 4181e2ffff0100                 and        r10d, 0x1ffff
00562 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00567 458bd3                         mov        r10d, r11d
0056a 418bd2                         mov        edx, r10d
0056d 4585d2                         test       r10d, r10d
00570 0f8cde0d0000                   jl         0x7ff84fe7d0d4
00576 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0057b 4585db                         test       r11d, r11d
0057e 0f84a5fdffff                   je         0x7ff84fe7c0a9
00584 453bd9                         cmp        r11d, r9d
00587 0f8ea4fdffff                   jle        0x7ff84fe7c0b1
0058d be45ffffff                     mov        esi, 0xffffff45
00592 418beb                         mov        ebp, r11d
00595 44890c24                       mov        dword ptr [rsp], r9d
00599 666690                         nop        
0059c c5f877                         vzeroupper 
0059f e8bc8ab4ff                     call       0x7ff84f9c4de0
005a4 0f1f84009c060001               nop        dword ptr [rax + rax + 0x100069c]
005ac 4183fb30                       cmp        r11d, 0x30
005b0 0f8fcc050000                   jg         0x7ff84fe7c902
005b6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005bb 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
005c3 0f83e4100000                   jae        0x7ff84fe7d42d
005c9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005ce 418bfa                         mov        edi, r10d
005d1 4d63ca                         movsxd     r9, r10d
005d4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
005d9 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
005e0 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
005e7 0f8353110000                   jae        0x7ff84fe7d4c0
005ed 448d5b10                       lea        r11d, [rbx + 0x10]
005f1 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
005f9 4c63db                         movsxd     r11, ebx
005fc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00601 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00608 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00610 453bd5                         cmp        r10d, r13d
00613 0f8dbb000000                   jge        0x7ff84fe7c454
00619 4d2bcb                         sub        r9, r11
0061c 4d63c2                         movsxd     r8, r10d
0061f 4f8d1c08                       lea        r11, [r8 + r9]
00623 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
0062b 0f83d3110000                   jae        0x7ff84fe7d584
00631 4d63dd                         movsxd     r11, r13d
00634 4d2bd8                         sub        r11, r8
00637 4983c30f                       add        r11, 0xf
0063b 4983e3f0                       and        r11, 0xfffffffffffffff0
0063f 458bdb                         mov        r11d, r11d
00642 458d441b10                     lea        r8d, [r11 + rbx + 0x10]
00647 4d63d8                         movsxd     r11, r8d
0064a 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
0064f 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00657 0f83a7110000                   jae        0x7ff84fe7d584
0065d 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00665 0f8399110000                   jae        0x7ff84fe7d584
0066b 4983c3f0                       add        r11, -0x10
0066f 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00677 0f8387110000                   jae        0x7ff84fe7d584
0067d 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00684 0f8f0e120000                   jg         0x7ff84fe7d618
0068a 448bd7                         mov        r10d, edi
0068d 442bd3                         sub        r10d, ebx
00690 458bc2                         mov        r8d, r10d
00693 44038424a4000000               add        r8d, dword ptr [rsp + 0xa4]
0069b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006a0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
006a7 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
006af 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
006b4 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
006bb 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
006c3 4183c010                       add        r8d, 0x10
006c7 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
006cf 453bc5                         cmp        r8d, r13d
006d2 7cbc                           jl         0x7ff84fe7c410
006d4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
006d9 4403df                         add        r11d, edi
006dc 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
006e4 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
006e9 e959fdffff                     jmp        0x7ff84fe7c1c7
006ee 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
006f3 4585db                         test       r11d, r11d
006f6 7407                           je         0x7ff84fe7c47f
006f8 448d5aff                       lea        r11d, [rdx - 1]
006fc 418bd3                         mov        edx, r11d
006ff 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00704 458b4308                       mov        r8d, dword ptr [r11 + 8]
00708 85d2                           test       edx, edx
0070a 7473                           je         0x7ff84fe7c4ff
0070c 83fa03                         cmp        edx, 3
0070f 0f842d080000                   je         0x7ff84fe7ccc2
00715 83fa02                         cmp        edx, 2
00718 7772                           ja         0x7ff84fe7c50c
0071a 3b54244c                       cmp        edx, dword ptr [rsp + 0x4c]
0071e 0f83e4120000                   jae        0x7ff84fe7d788
00724 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00729 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
0072e 85d2                           test       edx, edx
00730 7e44                           jle        0x7ff84fe7c4f6
00732 448d52ff                       lea        r10d, [rdx - 1]
00736 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
0073b 0f83a3140000                   jae        0x7ff84fe7d964
00741 4c63ca                         movsxd     r9, edx
00744 33c9                           xor        ecx, ecx
00746 458bd3                         mov        r10d, r11d
00749 4183c2cc                       add        r10d, -0x34
0074d 41c1ea02                       shr        r10d, 2
00751 458d5c12ff                     lea        r11d, [r10 + rdx - 1]
00756 41ba04000000                   mov        r10d, 4
0075c c442a8f5d3                     bzhi       r10, r11, r10
00761 4d2bca                         sub        r9, r10
00764 49ffc9                         dec        r9
00767 4d85c9                         test       r9, r9
0076a 4c0f4cc9                       cmovl      r9, rcx
0076e 458bd9                         mov        r11d, r9d
00771 e97d040000                     jmp        0x7ff84fe7c973
00776 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0077b 45894208                       mov        dword ptr [r10 + 8], r8d
0077f 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00787 e9e5fbffff                     jmp        0x7ff84fe7c0f1
0078c 48be980fbce200000000           movabs     rsi, 0xe2bc0f98
00796 8beb                           mov        ebp, ebx
00798 c5f877                         vzeroupper 
0079b e840e3a7ff                     call       0x7ff84f8fa860
007a0 0f1f840098080002               nop        dword ptr [rax + rax + 0x2000898]
007a8 4885c0                         test       rax, rax
007ab 0f845b130000                   je         0x7ff84fe7d88c
007b1 488bf0                         mov        rsi, rax
007b4 c5f877                         vzeroupper 
007b7 4881c4d0000000                 add        rsp, 0xd0
007be 5d                             pop        rbp
007bf e91cb3b4ff                     jmp        0x7ff84f9c7860
007c4 458bda                         mov        r11d, r10d
007c7 44035c2438                     add        r11d, dword ptr [rsp + 0x38]
007cc 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
007d4 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
007dc 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
007e1 0f8db9020000                   jge        0x7ff84fe7c820
007e7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007ec 4183c208                       add        r10d, 8
007f0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
007f5 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
007fd 4183fb08                       cmp        r11d, 8
00801 0f8d99010000                   jge        0x7ff84fe7c720
00807 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0080f 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
00817 0f83ab160000                   jae        0x7ff84fe7dc48
0081d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00822 430fbe6c1308                   movsx      ebp, byte ptr [r11 + r10 + 8]
00828 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0082d 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00835 0f8301170000                   jae        0x7ff84fe7dcbc
0083b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00840 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00845 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0084d 4183c203                       add        r10d, 3
00851 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00856 41ffc0                         inc        r8d
00859 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00861 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
00869 0f83f9160000                   jae        0x7ff84fe7dce8
0086f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00874 4183c203                       add        r10d, 3
00878 4c639c24a8000000               movsxd     r11, dword ptr [rsp + 0xa8]
00880 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00885 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
0088b 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
00893 0f8303170000                   jae        0x7ff84fe7dd1c
00899 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
0089e 43886c1009                     mov        byte ptr [r8 + r10 + 9], bpl
008a3 470fbe4c180a                   movsx      r9d, byte ptr [r8 + r11 + 0xa]
008a9 47884c100a                     mov        byte ptr [r8 + r10 + 0xa], r9b
008ae 470fbe5c180b                   movsx      r11d, byte ptr [r8 + r11 + 0xb]
008b4 47885c100b                     mov        byte ptr [r8 + r10 + 0xb], r11b
008b9 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
008c1 4183fa08                       cmp        r10d, 8
008c5 0f83fd160000                   jae        0x7ff84fe7dd48
008cb 49bab87eb6e200000000           movabs     r10, 0xe2b67eb8
008d5 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
008dd 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
008e5 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
008ea 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
008ef 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
008f4 4183fb04                       cmp        r11d, 4
008f8 7e3e                           jle        0x7ff84fe7c6b8
008fa 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008fe 83c504                         add        ebp, 4
00901 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00906 8b542414                       mov        edx, dword ptr [rsp + 0x14]
0090a 6690                           nop        
0090c c5f877                         vzeroupper 
0090f e8cce1a7ff                     call       0x7ff84f8fa860
00914 0f1f84000c0a0003               nop        dword ptr [rax + rax + 0x3000a0c]
0091c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00921 8bd5                           mov        edx, ebp
00923 8bc8                           mov        ecx, eax
00925 666690                         nop        
00928 c5f877                         vzeroupper 
0092b e8b0e1a7ff                     call       0x7ff84f8fa860
00930 0f1f8400280a0004               nop        dword ptr [rax + rax + 0x4000a28]
00938 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0093d 4183fb08                       cmp        r11d, 8
00941 7e51                           jle        0x7ff84fe7c714
00943 49bae07eb6e200000000           movabs     r10, 0xe2b67ee0
0094d 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00951 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00959 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
0095e 83c208                         add        edx, 8
00961 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00966 6690                           nop        
00968 c5f877                         vzeroupper 
0096b e870e1a7ff                     call       0x7ff84f8fa860
00970 0f1f8400680a0005               nop        dword ptr [rax + rax + 0x5000a68]
00978 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0097d 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
00981 488bc8                         mov        rcx, rax
00984 c5f877                         vzeroupper 
00987 e854e1a7ff                     call       0x7ff84f8fa860
0098c 0f1f8400840a0006               nop        dword ptr [rax + rax + 0x6000a84]
00994 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
0099b e92dfbffff                     jmp        0x7ff84fe7c24d
009a0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009a5 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
009ac c5f877                         vzeroupper 
009af e82ce1a7ff                     call       0x7ff84f8fa860
009b4 0f1f8400ac0a0007               nop        dword ptr [rax + rax + 0x7000aac]
009bc 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009c1 8b542438                       mov        edx, dword ptr [rsp + 0x38]
009c5 488bc8                         mov        rcx, rax
009c8 c5f877                         vzeroupper 
009cb e810e1a7ff                     call       0x7ff84f8fa860
009d0 0f1f8400c80a0008               nop        dword ptr [rax + rax + 0x8000ac8]
009d8 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
009e0 4183c308                       add        r11d, 8
009e4 458bcb                         mov        r9d, r11d
009e7 be95ffffff                     mov        esi, 0xffffff95
009ec 488b2c24                       mov        rbp, qword ptr [rsp]
009f0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
009f5 4c891424                       mov        qword ptr [rsp], r10
009f9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009fe 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a03 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a08 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a0d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a12 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a17 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a1c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a21 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a26 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a2b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00a30 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a35 48ff742440                     push       qword ptr [rsp + 0x40]
00a3a 488f442438                     pop        qword ptr [rsp + 0x38]
00a3f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a44 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00a49 48ff742450                     push       qword ptr [rsp + 0x50]
00a4e 488f442448                     pop        qword ptr [rsp + 0x48]
00a53 48ff742458                     push       qword ptr [rsp + 0x58]
00a58 488f442450                     pop        qword ptr [rsp + 0x50]
00a5d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00a62 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00a67 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a6c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00a71 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00a76 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00a7b 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00a83 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00a88 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00a8d 666690                         nop        
00a90 c5f877                         vzeroupper 
00a93 e8c885b4ff                     call       0x7ff84f9c4de0
00a98 0f1f8400900b0009               nop        dword ptr [rax + rax + 0x9000b90]
00aa0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00aa5 4183fb30                       cmp        r11d, 0x30
00aa9 0f8fc9120000                   jg         0x7ff84fe7daf8
00aaf 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00ab6 83c5f9                         add        ebp, -7
00ab9 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00ac1 443bd5                         cmp        r10d, ebp
00ac4 0f835a100000                   jae        0x7ff84fe7d8a4
00aca 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ad2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ad7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00adf 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
00ae4 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00aec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00af1 443bd5                         cmp        r10d, ebp
00af4 0f836a100000                   jae        0x7ff84fe7d8e4
00afa 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00b02 48be28c122e200000000           movabs     rsi, 0xe222c128
00b0c 4963ca                         movsxd     rcx, r10d
00b0f 4883c108                       add        rcx, 8
00b13 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00b18 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
00b20 4533c9                         xor        r9d, r9d
00b23 90                             nop        
00b24 c5f877                         vzeroupper 
00b27 e8b4d5a7ff                     call       0x7ff84f8f9e60
00b2c 0f1f8400240c000a               nop        dword ptr [rax + rax + 0xa000c24]
00b34 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
00b3b 83c508                         add        ebp, 8
00b3e 3bac24ac000000                 cmp        ebp, dword ptr [rsp + 0xac]
00b45 0f8ca9110000                   jl         0x7ff84fe7da74
00b4b 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
00b4f 039c24a8000000                 add        ebx, dword ptr [rsp + 0xa8]
00b56 e972f9ffff                     jmp        0x7ff84fe7c24d
00b5b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b60 4d63d2                         movsxd     r10, r10d
00b63 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b6a c442a8f5db                     bzhi       r11, r11, r10
00b6f c4c1fb92fb                     kmovq      k7, r11
00b74 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b7a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b80 eb62                           jmp        0x7ff84fe7c964
00b82 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b87 4585db                         test       r11d, r11d
00b8a 0f8c10100000                   jl         0x7ff84fe7d920
00b90 85db                           test       ebx, ebx
00b92 0f8c08100000                   jl         0x7ff84fe7d920
00b98 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00b9d 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00ba5 0f82f50f0000                   jb         0x7ff84fe7d920
00bab 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00bb3 453bd5                         cmp        r10d, r13d
00bb6 0f82e40f0000                   jb         0x7ff84fe7d920
00bbc 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00bc1 4585db                         test       r11d, r11d
00bc4 741e                           je         0x7ff84fe7c964
00bc6 4883fa20                       cmp        rdx, 0x20
00bca 768f                           jbe        0x7ff84fe7c8db
00bcc c5f877                         vzeroupper 
00bcf 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00bd9 41ffd2                         call       r10
00bdc 0f1f840000000000               nop        dword ptr [rax + rax]
00be4 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00be9 e959f8ffff                     jmp        0x7ff84fe7c1c7
00bee 6690                           nop        
00bf0 418bd1                         mov        edx, r9d
00bf3 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00bf8 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
00bfd 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00c02 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
00c07 448d4aff                       lea        r9d, [rdx - 1]
00c0b 453bcb                         cmp        r9d, r11d
00c0e 7fe0                           jg         0x7ff84fe7c970
00c10 4183f93f                       cmp        r9d, 0x3f
00c14 0f8ed2100000                   jle        0x7ff84fe7da6c
00c1a 448bd2                         mov        r10d, edx
00c1d 41ffca                         dec        r10d
00c20 458bca                         mov        r9d, r10d
00c23 eb0e                           jmp        0x7ff84fe7c9b3
00c25 6666660f1f840000000000         nop        word ptr [rax + rax]
00c30 458bca                         mov        r9d, r10d
00c33 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00c38 62917e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x38]
00c43 62917e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x34], zmm0
00c4e 62917e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x78]
00c59 62917e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x74], zmm0
00c64 62917e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xb8]
00c6f 62917e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xb4], zmm0
00c7a 62917e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xf8]
00c85 62917e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xf4], zmm0
00c90 458d51c0                       lea        r10d, [r9 - 0x40]
00c94 4183fa3f                       cmp        r10d, 0x3f
00c98 7f96                           jg         0x7ff84fe7c9b0
00c9a 4183fa0f                       cmp        r10d, 0xf
00c9e 7e2d                           jle        0x7ff84fe7ca4d
00ca0 458bd1                         mov        r10d, r9d
00ca3 4183c2c0                       add        r10d, -0x40
00ca7 90                             nop        
00ca8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00cad 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00cb8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00cc3 4183c2f0                       add        r10d, -0x10
00cc7 4183fa0f                       cmp        r10d, 0xf
00ccb 7fdb                           jg         0x7ff84fe7ca28
00ccd 4585d2                         test       r10d, r10d
00cd0 0f8ea0faffff                   jle        0x7ff84fe7c4f6
00cd6 458bca                         mov        r9d, r10d
00cd9 666690                         nop        
00cdc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00ce1 478b548a04                     mov        r10d, dword ptr [r10 + r9*4 + 4]
00ce6 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00ceb 4789548b08                     mov        dword ptr [r11 + r9*4 + 8], r10d
00cf0 41ffc9                         dec        r9d
00cf3 4585c9                         test       r9d, r9d
00cf6 7fe4                           jg         0x7ff84fe7ca5c
00cf8 e979faffff                     jmp        0x7ff84fe7c4f6
00cfd 4d63d3                         movsxd     r10, r11d
00d00 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d07 c442a8f5db                     bzhi       r11, r11, r10
00d0c c4c1fb92fb                     kmovq      k7, r11
00d11 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d17 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d1d eb70                           jmp        0x7ff84fe7cb0f
00d1f 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00d24 4585d2                         test       r10d, r10d
00d27 0f8441040000                   je         0x7ff84fe7ceee
00d2d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d32 4585db                         test       r11d, r11d
00d35 0f8cf5120000                   jl         0x7ff84fe7ddb0
00d3b 85db                           test       ebx, ebx
00d3d 0f8ced120000                   jl         0x7ff84fe7ddb0
00d43 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d48 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00d50 0f82da120000                   jb         0x7ff84fe7ddb0
00d56 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00d5e 453bd5                         cmp        r10d, r13d
00d61 0f82c9120000                   jb         0x7ff84fe7ddb0
00d67 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d6c 4585db                         test       r11d, r11d
00d6f 741e                           je         0x7ff84fe7cb0f
00d71 4883fa20                       cmp        rdx, 0x20
00d75 7686                           jbe        0x7ff84fe7ca7d
00d77 c5f877                         vzeroupper 
00d7a 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00d84 41ffd2                         call       r10
00d87 0f1f840000000000               nop        dword ptr [rax + rax]
00d8f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d94 4585d2                         test       r10d, r10d
00d97 0f8e9a010000                   jle        0x7ff84fe7ccb7
00d9d 458bdd                         mov        r11d, r13d
00da0 442b9c24a0000000               sub        r11d, dword ptr [rsp + 0xa0]
00da8 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00db0 478d342a                       lea        r14d, [r10 + r13]
00db4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00db9 458bc3                         mov        r8d, r11d
00dbc 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00dc1 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00dc6 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00dce 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00dd3 0f8dd8000000                   jge        0x7ff84fe7cc31
00dd9 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00dde 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
00de6 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00dee 450f4fda                       cmovg      r11d, r10d
00df2 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00dfa 4585c0                         test       r8d, r8d
00dfd 0f8cbd120000                   jl         0x7ff84fe7de40
00e03 4585ed                         test       r13d, r13d
00e06 0f8cb4120000                   jl         0x7ff84fe7de40
00e0c 478d1418                       lea        r10d, [r8 + r11]
00e10 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00e18 453bc2                         cmp        r8d, r10d
00e1b 0f829f120000                   jb         0x7ff84fe7de40
00e21 458bd5                         mov        r10d, r13d
00e24 44039424a0000000               add        r10d, dword ptr [rsp + 0xa0]
00e2c 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00e34 458bd8                         mov        r11d, r8d
00e37 453bda                         cmp        r11d, r10d
00e3a 0f8280120000                   jb         0x7ff84fe7de40
00e40 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00e48 4585d2                         test       r10d, r10d
00e4b 0f8c6f120000                   jl         0x7ff84fe7de40
00e51 4585d2                         test       r10d, r10d
00e54 7429                           je         0x7ff84fe7cbff
00e56 4963d2                         movsxd     rdx, r10d
00e59 4883fa20                       cmp        rdx, 0x20
00e5d 7738                           ja         0x7ff84fe7cc17
00e5f 4d63d2                         movsxd     r10, r10d
00e62 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e69 c442a8f5db                     bzhi       r11, r11, r10
00e6e c4c1fb92fb                     kmovq      k7, r11
00e73 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e79 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e7f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00e87 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00e8c 0f8c11020000                   jl         0x7ff84fe7ce23
00e92 e9a3000000                     jmp        0x7ff84fe7ccba
00e97 c5f877                         vzeroupper 
00e9a 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00ea4 41ffd2                         call       r10
00ea7 0f1f840000000000               nop        dword ptr [rax + rax]
00eaf ebce                           jmp        0x7ff84fe7cbff
00eb1 4585db                         test       r11d, r11d
00eb4 0f8cba120000                   jl         0x7ff84fe7def4
00eba 4585ed                         test       r13d, r13d
00ebd 0f8cb1120000                   jl         0x7ff84fe7def4
00ec3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00ec8 4503d3                         add        r10d, r11d
00ecb 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00ed3 453bc2                         cmp        r8d, r10d
00ed6 0f8298120000                   jb         0x7ff84fe7def4
00edc 453bc6                         cmp        r8d, r14d
00edf 0f828f120000                   jb         0x7ff84fe7def4
00ee5 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00eea 4585db                         test       r11d, r11d
00eed 744b                           je         0x7ff84fe7ccba
00eef 4963d3                         movsxd     rdx, r11d
00ef2 4883fa20                       cmp        rdx, 0x20
00ef6 7725                           ja         0x7ff84fe7cc9d
00ef8 458bd3                         mov        r10d, r11d
00efb 4d63d2                         movsxd     r10, r10d
00efe 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f05 c442a8f5db                     bzhi       r11, r11, r10
00f0a c4c1fb92fb                     kmovq      k7, r11
00f0f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f15 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f1b eb1d                           jmp        0x7ff84fe7ccba
00f1d c5f877                         vzeroupper 
00f20 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
00f2a 41ffd2                         call       r10
00f2d 0f1f840000000000               nop        dword ptr [rax + rax]
00f35 eb03                           jmp        0x7ff84fe7ccba
00f37 458bf5                         mov        r14d, r13d
00f3a 418bde                         mov        ebx, r14d
00f3d e98bf5ffff                     jmp        0x7ff84fe7c24d
00f42 41ffc8                         dec        r8d
00f45 4585c0                         test       r8d, r8d
00f48 7e1f                           jle        0x7ff84fe7cce9
00f4a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00f4f 45895310                       mov        dword ptr [r11 + 0x10], r10d
00f53 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00f57 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00f5c 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00f60 45894208                       mov        dword ptr [r10 + 8], r8d
00f64 e916f8ffff                     jmp        0x7ff84fe7c4ff
00f69 48be680fbce200000000           movabs     rsi, 0xe2bc0f68
00f73 8beb                           mov        ebp, ebx
00f75 666690                         nop        
00f78 c5f877                         vzeroupper 
00f7b e860dba7ff                     call       0x7ff84f8fa860
00f80 0f1f84007810000b               nop        dword ptr [rax + rax + 0xb001078]
00f88 4885c0                         test       rax, rax
00f8b 0f8520f8ffff                   jne        0x7ff84fe7c531
00f91 bef6ffffff                     mov        esi, 0xfffffff6
00f96 6690                           nop        
00f98 c5f877                         vzeroupper 
00f9b e8c080b4ff                     call       0x7ff84f9c4de0
00fa0 0f1f84009810000c               nop        dword ptr [rax + rax + 0xc001098]
00fa8 4d63d1                         movsxd     r10, r9d
00fab 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fb2 c442a8f5db                     bzhi       r11, r11, r10
00fb7 c4c1fb92fb                     kmovq      k7, r11
00fbc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00fc2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00fc8 eb6c                           jmp        0x7ff84fe7cdb6
00fca 4585d2                         test       r10d, r10d
00fcd 0f8cc9100000                   jl         0x7ff84fe7de1c
00fd3 85db                           test       ebx, ebx
00fd5 0f8cc1100000                   jl         0x7ff84fe7de1c
00fdb 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00fe0 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00fe5 0f82b1100000                   jb         0x7ff84fe7de1c
00feb 428d2c0b                       lea        ebp, [rbx + r9]
00fef 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00ff7 443bdd                         cmp        r11d, ebp
00ffa 0f829c100000                   jb         0x7ff84fe7de1c
01000 4585c9                         test       r9d, r9d
01003 0f8c93100000                   jl         0x7ff84fe7de1c
01009 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0100e 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
01013 7421                           je         0x7ff84fe7cdb6
01015 4963d1                         movsxd     rdx, r9d
01018 4883fa20                       cmp        rdx, 0x20
0101c 768a                           jbe        0x7ff84fe7cd28
0101e c5f877                         vzeroupper 
01021 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
0102b 41ffd2                         call       r10
0102e 0f1f840000000000               nop        dword ptr [rax + rax]
01036 4c8b1424                       mov        r10, qword ptr [rsp]
0103a 41896a38                       mov        dword ptr [r10 + 0x38], ebp
0103e c5f877                         vzeroupper 
01041 4881c4d0000000                 add        rsp, 0xd0
01048 5d                             pop        rbp
01049 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0104d 0f87f5110000                   ja         0x7ff84fe7dfc8
01053 c3                             ret        
01054 448bdd                         mov        r11d, ebp
01057 4d63d3                         movsxd     r10, r11d
0105a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01061 c442a8f5db                     bzhi       r11, r11, r10
01066 c4c1fb92fb                     kmovq      k7, r11
0106b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01071 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01077 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0107f 4403dd                         add        r11d, ebp
01082 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0108a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0108e 418502                         test       dword ptr [r10], eax
01091 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
01096 0f8d9efeffff                   jge        0x7ff84fe7ccba
0109c 899c24ac000000                 mov        dword ptr [rsp + 0xac], ebx
010a3 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
010ab 442b9424a0000000               sub        r10d, dword ptr [rsp + 0xa0]
010b3 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
010bb 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
010bf 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
010c6 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
010cd 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
010d5 410f4feb                       cmovg      ebp, r11d
010d9 458bda                         mov        r11d, r10d
010dc 4585d2                         test       r10d, r10d
010df 0f8c6b0d0000                   jl         0x7ff84fe7dbd0
010e5 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
010ed 4585c0                         test       r8d, r8d
010f0 0f8c5a0d0000                   jl         0x7ff84fe7dbd0
010f6 458d142b                       lea        r10d, [r11 + rbp]
010fa 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
01102 453bc2                         cmp        r8d, r10d
01105 0f82450d0000                   jb         0x7ff84fe7dbd0
0110b 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
01112 03dd                           add        ebx, ebp
01114 443bc3                         cmp        r8d, ebx
01117 0f82330d0000                   jb         0x7ff84fe7dbd0
0111d 85ed                           test       ebp, ebp
0111f 0f8c2b0d0000                   jl         0x7ff84fe7dbd0
01125 85ed                           test       ebp, ebp
01127 0f844affffff                   je         0x7ff84fe7cdf7
0112d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01132 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
01137 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0113f 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
01144 4863d5                         movsxd     rdx, ebp
01147 4883fa20                       cmp        rdx, 0x20
0114b 0f8603ffffff                   jbe        0x7ff84fe7cdd4
01151 c5f877                         vzeroupper 
01154 49ba203f8e4ff87f0000           movabs     r10, 0x7ff84f8e3f20
0115e 41ffd2                         call       r10
01161 0f1f840000000000               nop        dword ptr [rax + rax]
01169 e909ffffff                     jmp        0x7ff84fe7cdf7
0116e 448beb                         mov        r13d, ebx
01171 e919fcffff                     jmp        0x7ff84fe7cb0f
01176 bee4ffffff                     mov        esi, 0xffffffe4
0117b 488b2c24                       mov        rbp, qword ptr [rsp]
0117f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01184 4c891424                       mov        qword ptr [rsp], r10
01188 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0118d 4489542408                     mov        dword ptr [rsp + 8], r10d
01192 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01197 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0119c 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
011a0 c5f877                         vzeroupper 
011a3 e8b87eb4ff                     call       0x7ff84f9c4de0
011a8 0f1f8400a012000e               nop        dword ptr [rax + rax + 0xe0012a0]
011b0 bee4ffffff                     mov        esi, 0xffffffe4
011b5 488b2c24                       mov        rbp, qword ptr [rsp]
011b9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011be 4c891424                       mov        qword ptr [rsp], r10
011c2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
011c7 4489542408                     mov        dword ptr [rsp + 8], r10d
011cc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
011d1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
011d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
011db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011e0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
011e5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011ea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
011ef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
011f4 c5f877                         vzeroupper 
011f7 e8647eb4ff                     call       0x7ff84f9c4de0
011fc 0f1f8400f412000f               nop        dword ptr [rax + rax + 0xf0012f4]
01204 bee4ffffff                     mov        esi, 0xffffffe4
01209 488b2c24                       mov        rbp, qword ptr [rsp]
0120d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01212 4c891424                       mov        qword ptr [rsp], r10
01216 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0121b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01220 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01225 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0122a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0122f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01234 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01239 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0123e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01243 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01248 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01250 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01255 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0125e 6690                           nop        
01260 c5f877                         vzeroupper 
01263 e8f87db4ff                     call       0x7ff84f9c4de0
01268 0f1f840060130010               nop        dword ptr [rax + rax + 0x10001360]
01270 bee4ffffff                     mov        esi, 0xffffffe4
01275 488b2c24                       mov        rbp, qword ptr [rsp]
01279 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0127e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01283 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01288 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0128d 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01291 48894424f8                     mov        qword ptr [rsp - 8], rax
01296 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0129a 89442470                       mov        dword ptr [rsp + 0x70], eax
0129e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a3 90                             nop        
012a4 c5f877                         vzeroupper 
012a7 e8b47db4ff                     call       0x7ff84f9c4de0
012ac 0f1f8400a4130011               nop        dword ptr [rax + rax + 0x110013a4]
012b4 bee4ffffff                     mov        esi, 0xffffffe4
012b9 488b2c24                       mov        rbp, qword ptr [rsp]
012bd 4c891c24                       mov        qword ptr [rsp], r11
012c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
012cb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
012d0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
012d5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012da 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012df 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
012e4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012e9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
012ee 4c89542420                     mov        qword ptr [rsp + 0x20], r10
012f3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
012f8 48894424f8                     mov        qword ptr [rsp - 8], rax
012fd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01301 89442470                       mov        dword ptr [rsp + 0x70], eax
01305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130a 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0130e 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01316 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0131b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01324 c5f877                         vzeroupper 
01327 e8347db4ff                     call       0x7ff84f9c4de0
0132c 0f1f840024140012               nop        dword ptr [rax + rax + 0x12001424]
01334 be45ffffff                     mov        esi, 0xffffff45
01339 488b2c24                       mov        rbp, qword ptr [rsp]
0133d 4c89542408                     mov        qword ptr [rsp + 8], r10
01342 6690                           nop        
01344 c5f877                         vzeroupper 
01347 e8147db4ff                     call       0x7ff84f9c4de0
0134c 0f1f840044140013               nop        dword ptr [rax + rax + 0x13001444]
01354 be45ffffff                     mov        esi, 0xffffff45
01359 488b2c24                       mov        rbp, qword ptr [rsp]
0135d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01362 4c891424                       mov        qword ptr [rsp], r10
01366 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0136b 4489542408                     mov        dword ptr [rsp + 8], r10d
01370 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01375 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0137a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0137f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01384 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01389 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0138e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01393 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01398 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0139c 48894424f8                     mov        qword ptr [rsp - 8], rax
013a1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013a5 89442434                       mov        dword ptr [rsp + 0x34], eax
013a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ae 48894424f8                     mov        qword ptr [rsp - 8], rax
013b3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013b7 89442438                       mov        dword ptr [rsp + 0x38], eax
013bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c0 48894424f8                     mov        qword ptr [rsp - 8], rax
013c5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013c9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d2 48ff742450                     push       qword ptr [rsp + 0x50]
013d7 488f442448                     pop        qword ptr [rsp + 0x48]
013dc 48ff742458                     push       qword ptr [rsp + 0x58]
013e1 488f442450                     pop        qword ptr [rsp + 0x50]
013e6 48894424f8                     mov        qword ptr [rsp - 8], rax
013eb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013ef 89442458                       mov        dword ptr [rsp + 0x58], eax
013f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f8 48894424f8                     mov        qword ptr [rsp - 8], rax
013fd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01401 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01405 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140a 48894424f8                     mov        qword ptr [rsp - 8], rax
0140f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01413 89442460                       mov        dword ptr [rsp + 0x60], eax
01417 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141c 48894424f8                     mov        qword ptr [rsp - 8], rax
01421 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01425 89442464                       mov        dword ptr [rsp + 0x64], eax
01429 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142e 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01432 6690                           nop        
01434 c5f877                         vzeroupper 
01437 e8247cb4ff                     call       0x7ff84f9c4de0
0143c 0f1f840034150014               nop        dword ptr [rax + rax + 0x14001534]
01444 4d3bda                         cmp        r11, r10
01447 bdffffffff                     mov        ebp, 0xffffffff
0144c 7c08                           jl         0x7ff84fe7d1d6
0144e 400f95c5                       setne      bpl
01452 400fb6ed                       movzx      ebp, bpl
01456 be45ffffff                     mov        esi, 0xffffff45
0145b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01460 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01465 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0146a 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0146f 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01473 48894424f8                     mov        qword ptr [rsp - 8], rax
01478 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0147c 89442470                       mov        dword ptr [rsp + 0x70], eax
01480 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01485 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0148a 6690                           nop        
0148c c5f877                         vzeroupper 
0148f e8cc7bb4ff                     call       0x7ff84f9c4de0
01494 0f1f84008c150015               nop        dword ptr [rax + rax + 0x1500158c]
0149c be45ffffff                     mov        esi, 0xffffff45
014a1 488b2c24                       mov        rbp, qword ptr [rsp]
014a5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014aa 4c891424                       mov        qword ptr [rsp], r10
014ae 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014b3 4489542408                     mov        dword ptr [rsp + 8], r10d
014b8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
014bd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014c2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014c7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014cc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014d1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014d6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014db 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014e0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014e5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014ea 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014ee 48894424f8                     mov        qword ptr [rsp - 8], rax
014f3 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014f7 89442434                       mov        dword ptr [rsp + 0x34], eax
014fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01500 48894424f8                     mov        qword ptr [rsp - 8], rax
01505 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01509 89442438                       mov        dword ptr [rsp + 0x38], eax
0150d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01512 48894424f8                     mov        qword ptr [rsp - 8], rax
01517 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0151b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0151f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01524 48ff742450                     push       qword ptr [rsp + 0x50]
01529 488f442448                     pop        qword ptr [rsp + 0x48]
0152e 48ff742458                     push       qword ptr [rsp + 0x58]
01533 488f442450                     pop        qword ptr [rsp + 0x50]
01538 48894424f8                     mov        qword ptr [rsp - 8], rax
0153d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01541 89442458                       mov        dword ptr [rsp + 0x58], eax
01545 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154a 48894424f8                     mov        qword ptr [rsp - 8], rax
0154f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01553 89442460                       mov        dword ptr [rsp + 0x60], eax
01557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155c 48894424f8                     mov        qword ptr [rsp - 8], rax
01561 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01565 89442468                       mov        dword ptr [rsp + 0x68], eax
01569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156e 6690                           nop        
01570 c5f877                         vzeroupper 
01573 e8e87ab4ff                     call       0x7ff84f9c4de0
01578 0f1f840070160016               nop        dword ptr [rax + rax + 0x16001670]
01580 be45ffffff                     mov        esi, 0xffffff45
01585 488b2c24                       mov        rbp, qword ptr [rsp]
01589 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0158e 4c891424                       mov        qword ptr [rsp], r10
01592 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01597 44895c2408                     mov        dword ptr [rsp + 8], r11d
0159c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
015a1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015a6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015ab 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015b5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015ba 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
015bf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
015c4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015c9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
015ce 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015d3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
015d8 48894424f8                     mov        qword ptr [rsp - 8], rax
015dd 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015e1 89442438                       mov        dword ptr [rsp + 0x38], eax
015e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ea 48894424f8                     mov        qword ptr [rsp - 8], rax
015ef 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015f3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fc 48ff742450                     push       qword ptr [rsp + 0x50]
01601 488f442448                     pop        qword ptr [rsp + 0x48]
01606 48ff742458                     push       qword ptr [rsp + 0x58]
0160b 488f442450                     pop        qword ptr [rsp + 0x50]
01610 48894424f8                     mov        qword ptr [rsp - 8], rax
01615 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01619 89442458                       mov        dword ptr [rsp + 0x58], eax
0161d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0162b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0162f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01634 48894424f8                     mov        qword ptr [rsp - 8], rax
01639 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0163d 89442460                       mov        dword ptr [rsp + 0x60], eax
01641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01646 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0164b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01650 c5f877                         vzeroupper 
01653 e8087ab4ff                     call       0x7ff84f9c4de0
01658 0f1f840050170017               nop        dword ptr [rax + rax + 0x17001750]
01660 4533d2                         xor        r10d, r10d
01663 4c891424                       mov        qword ptr [rsp], r10
01667 e9dbeaffff                     jmp        0x7ff84fe7bec7
0166c 4533d2                         xor        r10d, r10d
0166f 4c89542408                     mov        qword ptr [rsp + 8], r10
01674 e9fceaffff                     jmp        0x7ff84fe7bef5
01679 4533d2                         xor        r10d, r10d
0167c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01681 e91debffff                     jmp        0x7ff84fe7bf23
01686 4533d2                         xor        r10d, r10d
01689 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0168e e93eebffff                     jmp        0x7ff84fe7bf51
01693 4533d2                         xor        r10d, r10d
01696 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0169b e95febffff                     jmp        0x7ff84fe7bf7f
016a0 4533d2                         xor        r10d, r10d
016a3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016a8 e97debffff                     jmp        0x7ff84fe7bfaa
016ad bee4ffffff                     mov        esi, 0xffffffe4
016b2 488b2c24                       mov        rbp, qword ptr [rsp]
016b6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016bb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
016c0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
016c5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016ca 48894424f8                     mov        qword ptr [rsp - 8], rax
016cf 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016d3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
016d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016dc 48894424f8                     mov        qword ptr [rsp - 8], rax
016e1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016e5 89442460                       mov        dword ptr [rsp + 0x60], eax
016e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ee 48894424f8                     mov        qword ptr [rsp - 8], rax
016f3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016f7 89442464                       mov        dword ptr [rsp + 0x64], eax
016fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01700 48894424f8                     mov        qword ptr [rsp - 8], rax
01705 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01709 89442468                       mov        dword ptr [rsp + 0x68], eax
0170d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01712 48894424f8                     mov        qword ptr [rsp - 8], rax
01717 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0171b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0171f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01724 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01729 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0172d 666690                         nop        
01730 c5f877                         vzeroupper 
01733 e82879b4ff                     call       0x7ff84f9c4de0
01738 0f1f840030180018               nop        dword ptr [rax + rax + 0x18001830]
01740 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01749 bee4ffffff                     mov        esi, 0xffffffe4
0174e 488b2c24                       mov        rbp, qword ptr [rsp]
01752 4c891424                       mov        qword ptr [rsp], r10
01756 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0175b 4489542408                     mov        dword ptr [rsp + 8], r10d
01760 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01765 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0176a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0176f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01774 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01779 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0177e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01783 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01788 48894424f8                     mov        qword ptr [rsp - 8], rax
0178d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01791 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01795 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179a 48894424f8                     mov        qword ptr [rsp - 8], rax
0179f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017a3 89442460                       mov        dword ptr [rsp + 0x60], eax
017a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ac 48894424f8                     mov        qword ptr [rsp - 8], rax
017b1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017b5 89442464                       mov        dword ptr [rsp + 0x64], eax
017b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017be 48894424f8                     mov        qword ptr [rsp - 8], rax
017c3 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017c7 89442468                       mov        dword ptr [rsp + 0x68], eax
017cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d0 48894424f8                     mov        qword ptr [rsp - 8], rax
017d5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
017d9 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e2 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
017e7 897c247c                       mov        dword ptr [rsp + 0x7c], edi
017eb 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
017f2 6690                           nop        
017f4 c5f877                         vzeroupper 
017f7 e86478b4ff                     call       0x7ff84f9c4de0
017fc 0f1f8400f4180019               nop        dword ptr [rax + rax + 0x190018f4]
01804 8bef                           mov        ebp, edi
01806 83c510                         add        ebp, 0x10
01809 be6effffff                     mov        esi, 0xffffff6e
0180e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01813 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01818 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0181d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01822 897c2438                       mov        dword ptr [rsp + 0x38], edi
01826 48894424f8                     mov        qword ptr [rsp - 8], rax
0182b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0182f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01838 48894424f8                     mov        qword ptr [rsp - 8], rax
0183d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01841 89442460                       mov        dword ptr [rsp + 0x60], eax
01845 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184a 48894424f8                     mov        qword ptr [rsp - 8], rax
0184f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01853 89442464                       mov        dword ptr [rsp + 0x64], eax
01857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01865 89442468                       mov        dword ptr [rsp + 0x68], eax
01869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186e 48894424f8                     mov        qword ptr [rsp - 8], rax
01873 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01877 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01885 666690                         nop        
01888 c5f877                         vzeroupper 
0188b e8d077b4ff                     call       0x7ff84f9c4de0
01890 0f1f84008819001a               nop        dword ptr [rax + rax + 0x1a001988]
01898 8bef                           mov        ebp, edi
0189a 83c510                         add        ebp, 0x10
0189d be66ffffff                     mov        esi, 0xffffff66
018a2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018a7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018ac 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
018b1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018b6 897c2438                       mov        dword ptr [rsp + 0x38], edi
018ba 48894424f8                     mov        qword ptr [rsp - 8], rax
018bf 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018c3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
018c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cc 48894424f8                     mov        qword ptr [rsp - 8], rax
018d1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018d5 89442460                       mov        dword ptr [rsp + 0x60], eax
018d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018de 48894424f8                     mov        qword ptr [rsp - 8], rax
018e3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018e7 89442464                       mov        dword ptr [rsp + 0x64], eax
018eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f0 48894424f8                     mov        qword ptr [rsp - 8], rax
018f5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018f9 89442468                       mov        dword ptr [rsp + 0x68], eax
018fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01902 48894424f8                     mov        qword ptr [rsp - 8], rax
01907 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0190b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0190f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01914 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01919 666690                         nop        
0191c c5f877                         vzeroupper 
0191f e83c77b4ff                     call       0x7ff84f9c4de0
01924 0f1f84001c1a001b               nop        dword ptr [rax + rax + 0x1b001a1c]
0192c bebeffffff                     mov        esi, 0xffffffbe
01931 488b2c24                       mov        rbp, qword ptr [rsp]
01935 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0193a 4c891424                       mov        qword ptr [rsp], r10
0193e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01943 44895c2408                     mov        dword ptr [rsp + 8], r11d
01948 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0194d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01952 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01957 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0195c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01961 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01966 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0196b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01970 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01974 48894424f8                     mov        qword ptr [rsp - 8], rax
01979 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0197d 89442434                       mov        dword ptr [rsp + 0x34], eax
01981 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01986 48894424f8                     mov        qword ptr [rsp - 8], rax
0198b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0198f 89442438                       mov        dword ptr [rsp + 0x38], eax
01993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01998 48894424f8                     mov        qword ptr [rsp - 8], rax
0199d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019a1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019aa 48ff742450                     push       qword ptr [rsp + 0x50]
019af 488f442448                     pop        qword ptr [rsp + 0x48]
019b4 48ff742458                     push       qword ptr [rsp + 0x58]
019b9 488f442450                     pop        qword ptr [rsp + 0x50]
019be 48894424f8                     mov        qword ptr [rsp - 8], rax
019c3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019c7 89442458                       mov        dword ptr [rsp + 0x58], eax
019cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d0 c5f877                         vzeroupper 
019d3 e88876b4ff                     call       0x7ff84f9c4de0
019d8 0f1f8400d01a001c               nop        dword ptr [rax + rax + 0x1c001ad0]
019e0 be85ffffff                     mov        esi, 0xffffff85
019e5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
019e9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019ee 44891424                       mov        dword ptr [rsp], r10d
019f2 895c2404                       mov        dword ptr [rsp + 4], ebx
019f6 6690                           nop        
019f8 c5f877                         vzeroupper 
019fb e86076b4ff                     call       0x7ff84f9c4de0
01a00 0f1f8400f81a001d               nop        dword ptr [rax + rax + 0x1d001af8]
01a08 bee4ffffff                     mov        esi, 0xffffffe4
01a0d 488b2c24                       mov        rbp, qword ptr [rsp]
01a11 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a16 4c891424                       mov        qword ptr [rsp], r10
01a1a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a1f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a24 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01a29 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a33 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a38 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a3d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a42 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a47 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a4c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01a50 48894424f8                     mov        qword ptr [rsp - 8], rax
01a55 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a59 89442434                       mov        dword ptr [rsp + 0x34], eax
01a5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a62 48894424f8                     mov        qword ptr [rsp - 8], rax
01a67 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01a6b 89442438                       mov        dword ptr [rsp + 0x38], eax
01a6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a74 48894424f8                     mov        qword ptr [rsp - 8], rax
01a79 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a7d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a86 48ff742450                     push       qword ptr [rsp + 0x50]
01a8b 488f442448                     pop        qword ptr [rsp + 0x48]
01a90 48ff742458                     push       qword ptr [rsp + 0x58]
01a95 488f442450                     pop        qword ptr [rsp + 0x50]
01a9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01aa3 89442458                       mov        dword ptr [rsp + 0x58], eax
01aa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aac 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ab5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ab9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abe 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ac7 89442460                       mov        dword ptr [rsp + 0x60], eax
01acb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ad9 89442464                       mov        dword ptr [rsp + 0x64], eax
01add 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae7 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01aeb 89442468                       mov        dword ptr [rsp + 0x68], eax
01aef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af4 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01afb 90                             nop        
01afc c5f877                         vzeroupper 
01aff e85c75b4ff                     call       0x7ff84f9c4de0
01b04 0f1f8400fc1b001e               nop        dword ptr [rax + rax + 0x1e001bfc]
01b0c bef6ffffff                     mov        esi, 0xfffffff6
01b11 666690                         nop        
01b14 c5f877                         vzeroupper 
01b17 e84475b4ff                     call       0x7ff84f9c4de0
01b1c 0f1f8400141c001f               nop        dword ptr [rax + rax + 0x1f001c14]
01b24 bee4ffffff                     mov        esi, 0xffffffe4
01b29 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b2e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b33 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b38 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b3d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01b42 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01b4a 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01b52 6690                           nop        
01b54 c5f877                         vzeroupper 
01b57 e80475b4ff                     call       0x7ff84f9c4de0
01b5c 0f1f8400541c0020               nop        dword ptr [rax + rax + 0x20001c54]
01b64 bee4ffffff                     mov        esi, 0xffffffe4
01b69 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b6e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b73 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b78 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b82 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b86 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8f 90                             nop        
01b90 c5f877                         vzeroupper 
01b93 e8c874b4ff                     call       0x7ff84f9c4de0
01b98 0f1f8400901c0021               nop        dword ptr [rax + rax + 0x21001c90]
01ba0 beccffffff                     mov        esi, 0xffffffcc
01ba5 488b2c24                       mov        rbp, qword ptr [rsp]
01ba9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bae 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01bb3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01bb8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01bbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc2 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01bc6 89442470                       mov        dword ptr [rsp + 0x70], eax
01bca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcf 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01bd3 90                             nop        
01bd4 c5f877                         vzeroupper 
01bd7 e88474b4ff                     call       0x7ff84f9c4de0
01bdc 0f1f8400d41c0022               nop        dword ptr [rax + rax + 0x22001cd4]
01be4 be6effffff                     mov        esi, 0xffffff6e
01be9 488b2c24                       mov        rbp, qword ptr [rsp]
01bed 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bf2 4c891424                       mov        qword ptr [rsp], r10
01bf6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bfb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c00 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01c05 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c0a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c0f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c14 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c19 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c1e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c23 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c28 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c31 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c35 89442434                       mov        dword ptr [rsp + 0x34], eax
01c39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c43 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c47 89442438                       mov        dword ptr [rsp + 0x38], eax
01c4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c50 48894424f8                     mov        qword ptr [rsp - 8], rax
01c55 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c59 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c62 48ff742450                     push       qword ptr [rsp + 0x50]
01c67 488f442448                     pop        qword ptr [rsp + 0x48]
01c6c 48ff742458                     push       qword ptr [rsp + 0x58]
01c71 488f442450                     pop        qword ptr [rsp + 0x50]
01c76 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c7f 89442458                       mov        dword ptr [rsp + 0x58], eax
01c83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c88 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c91 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01c95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ca3 89442460                       mov        dword ptr [rsp + 0x60], eax
01ca7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cac 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01cb5 89442464                       mov        dword ptr [rsp + 0x64], eax
01cb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01cc7 89442468                       mov        dword ptr [rsp + 0x68], eax
01ccb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd0 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01cd5 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01cd9 666690                         nop        
01cdc c5f877                         vzeroupper 
01cdf e87c73b4ff                     call       0x7ff84f9c4de0
01ce4 0f1f8400dc1d0023               nop        dword ptr [rax + rax + 0x23001ddc]
01cec 458bd1                         mov        r10d, r9d
01cef e9d9efffff                     jmp        0x7ff84fe7ca4d
01cf4 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01cfc 4183c308                       add        r11d, 8
01d00 458bcb                         mov        r9d, r11d
01d03 be45ffffff                     mov        esi, 0xffffff45
01d08 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d0d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d12 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d17 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d21 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d25 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d33 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d37 89442460                       mov        dword ptr [rsp + 0x60], eax
01d3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d40 48894424f8                     mov        qword ptr [rsp - 8], rax
01d45 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d49 89442464                       mov        dword ptr [rsp + 0x64], eax
01d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d52 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
01d5a 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d5f 458bda                         mov        r11d, r10d
01d62 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01d67 90                             nop        
01d68 c5f877                         vzeroupper 
01d6b e8f072b4ff                     call       0x7ff84f9c4de0
01d70 0f1f8400681e0024               nop        dword ptr [rax + rax + 0x24001e68]
01d78 be45ffffff                     mov        esi, 0xffffff45
01d7d 488b2c24                       mov        rbp, qword ptr [rsp]
01d81 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d86 4c891424                       mov        qword ptr [rsp], r10
01d8a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d8f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d94 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d99 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d9e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01da3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01da8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dad 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01db2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01db7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dbc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01dc1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dcb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01dcf 89442438                       mov        dword ptr [rsp + 0x38], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01de1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01de5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dea 48ff742450                     push       qword ptr [rsp + 0x50]
01def 488f442448                     pop        qword ptr [rsp + 0x48]
01df4 48ff742458                     push       qword ptr [rsp + 0x58]
01df9 488f442450                     pop        qword ptr [rsp + 0x50]
01dfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01e03 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e07 89442458                       mov        dword ptr [rsp + 0x58], eax
01e0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e10 48894424f8                     mov        qword ptr [rsp - 8], rax
01e15 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e19 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e22 48894424f8                     mov        qword ptr [rsp - 8], rax
01e27 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e2b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e34 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01e39 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01e3e 6690                           nop        
01e40 c5f877                         vzeroupper 
01e43 e81872b4ff                     call       0x7ff84f9c4de0
01e48 0f1f8400401f0025               nop        dword ptr [rax + rax + 0x25001f40]
01e50 beccffffff                     mov        esi, 0xffffffcc
01e55 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e5a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e5f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e64 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e69 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e72 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e80 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e84 89442460                       mov        dword ptr [rsp + 0x60], eax
01e88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e92 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e96 89442464                       mov        dword ptr [rsp + 0x64], eax
01e9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ea8 89442468                       mov        dword ptr [rsp + 0x68], eax
01eac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb1 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01eb6 6690                           nop        
01eb8 c5f877                         vzeroupper 
01ebb e8a071b4ff                     call       0x7ff84f9c4de0
01ec0 0f1f8400b81f0026               nop        dword ptr [rax + rax + 0x26001fb8]
01ec8 bee4ffffff                     mov        esi, 0xffffffe4
01ecd 488b2c24                       mov        rbp, qword ptr [rsp]
01ed1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ed6 4c891424                       mov        qword ptr [rsp], r10
01eda 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01edf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ee4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ee9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01eee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ef3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ef8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01efd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f02 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f07 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f0c 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01f14 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01f19 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f22 89442474                       mov        dword ptr [rsp + 0x74], eax
01f26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2b 90                             nop        
01f2c c5f877                         vzeroupper 
01f2f e82c71b4ff                     call       0x7ff84f9c4de0
01f34 0f1f84002c200027               nop        dword ptr [rax + rax + 0x2700202c]
01f3c bee4ffffff                     mov        esi, 0xffffffe4
01f41 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f46 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f4b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f50 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f55 666690                         nop        
01f58 c5f877                         vzeroupper 
01f5b e80071b4ff                     call       0x7ff84f9c4de0
01f60 0f1f840058200028               nop        dword ptr [rax + rax + 0x28002058]
01f68 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
01f6f ffc5                           inc        ebp
01f71 bee4ffffff                     mov        esi, 0xffffffe4
01f76 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f7b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f80 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f85 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f8a 6690                           nop        
01f8c c5f877                         vzeroupper 
01f8f e8cc70b4ff                     call       0x7ff84f9c4de0
01f94 0f1f84008c200029               nop        dword ptr [rax + rax + 0x2900208c]
01f9c bee4ffffff                     mov        esi, 0xffffffe4
01fa1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fa6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01fab 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01fb0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fb5 666690                         nop        
01fb8 c5f877                         vzeroupper 
01fbb e8a070b4ff                     call       0x7ff84f9c4de0
01fc0 0f1f8400b820002a               nop        dword ptr [rax + rax + 0x2a0020b8]
01fc8 bee4ffffff                     mov        esi, 0xffffffe4
01fcd 488b2c24                       mov        rbp, qword ptr [rsp]
01fd1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01fd6 4c891424                       mov        qword ptr [rsp], r10
01fda 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01fdf 4489542408                     mov        dword ptr [rsp + 8], r10d
01fe4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01fe9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ff3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ff8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ffd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02002 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02007 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0200c 48894424f8                     mov        qword ptr [rsp - 8], rax
02011 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02015 89442470                       mov        dword ptr [rsp + 0x70], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 6690                           nop        
02020 c5f877                         vzeroupper 
02023 e83870b4ff                     call       0x7ff84f9c4de0
02028 0f1f84002021002b               nop        dword ptr [rax + rax + 0x2b002120]
02030 beccffffff                     mov        esi, 0xffffffcc
02035 488b2c24                       mov        rbp, qword ptr [rsp]
02039 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0203e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02043 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02048 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0204d 48894424f8                     mov        qword ptr [rsp - 8], rax
02052 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02056 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0205a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205f 48894424f8                     mov        qword ptr [rsp - 8], rax
02064 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02068 89442460                       mov        dword ptr [rsp + 0x60], eax
0206c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02071 48894424f8                     mov        qword ptr [rsp - 8], rax
02076 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0207a 89442464                       mov        dword ptr [rsp + 0x64], eax
0207e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02083 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
0208a 6690                           nop        
0208c c5f877                         vzeroupper 
0208f e8cc6fb4ff                     call       0x7ff84f9c4de0
02094 0f1f84008c21002c               nop        dword ptr [rax + rax + 0x2c00218c]
0209c beccffffff                     mov        esi, 0xffffffcc
020a1 488b2c24                       mov        rbp, qword ptr [rsp]
020a5 895c2414                       mov        dword ptr [rsp + 0x14], ebx
020a9 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
020ae 6690                           nop        
020b0 c5f877                         vzeroupper 
020b3 e8a86fb4ff                     call       0x7ff84f9c4de0
020b8 0f1f8400b021002d               nop        dword ptr [rax + rax + 0x2d0021b0]
020c0 beccffffff                     mov        esi, 0xffffffcc
020c5 488b2c24                       mov        rbp, qword ptr [rsp]
020c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020ce 4c891424                       mov        qword ptr [rsp], r10
020d2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020d7 4489542408                     mov        dword ptr [rsp + 8], r10d
020dc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
020e1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020f0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
020ff 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02104 48894424f8                     mov        qword ptr [rsp - 8], rax
02109 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0210d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02111 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02116 48894424f8                     mov        qword ptr [rsp - 8], rax
0211b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0211f 89442460                       mov        dword ptr [rsp + 0x60], eax
02123 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02128 48894424f8                     mov        qword ptr [rsp - 8], rax
0212d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02131 89442464                       mov        dword ptr [rsp + 0x64], eax
02135 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213a 48894424f8                     mov        qword ptr [rsp - 8], rax
0213f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02143 89442468                       mov        dword ptr [rsp + 0x68], eax
02147 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214c 48894424f8                     mov        qword ptr [rsp - 8], rax
02151 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02155 89442470                       mov        dword ptr [rsp + 0x70], eax
02159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215e 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02163 90                             nop        
02164 c5f877                         vzeroupper 
02167 e8f46eb4ff                     call       0x7ff84f9c4de0
0216c 0f1f84006422002e               nop        dword ptr [rax + rax + 0x2e002264]
02174 beccffffff                     mov        esi, 0xffffffcc
02179 488b2c24                       mov        rbp, qword ptr [rsp]
0217d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02182 4c891424                       mov        qword ptr [rsp], r10
02186 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0218b 4489542408                     mov        dword ptr [rsp + 8], r10d
02190 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02195 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0219a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0219f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021a4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021a9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021ae 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021b3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021b8 48894424f8                     mov        qword ptr [rsp - 8], rax
021bd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021c1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ca 48894424f8                     mov        qword ptr [rsp - 8], rax
021cf 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021d3 89442460                       mov        dword ptr [rsp + 0x60], eax
021d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021dc 48894424f8                     mov        qword ptr [rsp - 8], rax
021e1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021e5 89442464                       mov        dword ptr [rsp + 0x64], eax
021e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ee 48894424f8                     mov        qword ptr [rsp - 8], rax
021f3 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
021f7 89442468                       mov        dword ptr [rsp + 0x68], eax
021fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02200 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02205 666690                         nop        
02208 c5f877                         vzeroupper 
0220b e8506eb4ff                     call       0x7ff84f9c4de0
02210 0f1f84000823002f               nop        dword ptr [rax + rax + 0x2f002308]
02218 eb0e                           jmp        0x7ff84fe7dfa8
0221a eb0c                           jmp        0x7ff84fe7dfa8
0221c eb0a                           jmp        0x7ff84fe7dfa8
0221e eb08                           jmp        0x7ff84fe7dfa8
02220 eb06                           jmp        0x7ff84fe7dfa8
02222 eb04                           jmp        0x7ff84fe7dfa8
02224 eb02                           jmp        0x7ff84fe7dfa8
02226 eb00                           jmp        0x7ff84fe7dfa8
02228 488bf0                         mov        rsi, rax
0222b e984e5ffff                     jmp        0x7ff84fe7c534
02230 bef6ffffff                     mov        esi, 0xfffffff6
02235 666690                         nop        
02238 c5f877                         vzeroupper 
0223b e8206eb4ff                     call       0x7ff84f9c4de0
02240 0f1f840038230030               nop        dword ptr [rax + rax + 0x30002338]
02248 49bac9cde74ff87f0000           movabs     r10, 0x7ff84fe7cdc9
02252 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02259 e902efa7ff                     jmp        0x7ff84f8fcee0
0225e e8bdbaa6ff                     call       0x7ff84f8e9aa0
02263 e9c6ddffff                     jmp        0x7ff84fe7bdae
