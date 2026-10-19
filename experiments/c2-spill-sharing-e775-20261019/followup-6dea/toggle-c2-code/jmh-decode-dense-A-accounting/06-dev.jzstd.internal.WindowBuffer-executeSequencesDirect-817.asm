00000 e8bb810316                     call       0x7fec15eb76c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8544220000                   jne        0x7febffe81772
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004d 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00095 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
000ac 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b8 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000bf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c4 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e8 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ec 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f1 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fa 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00101 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00106 488bfe                         mov        rdi, rsi
00109 c5f877                         vzeroupper 
0010c 49ba00def915ec7f0000           movabs     r10, 0x7fec15f9de00
00116 41ffd2                         call       r10
00119 0f1f840000000000               nop        dword ptr [rax + rax]
00121 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00126 4d85d2                         test       r10, r10
00129 0f8429150000                   je         0x7febffe80b58
0012f 458b1a                         mov        r11d, dword ptr [r10]
00132 41c1eb0d                       shr        r11d, 0xd
00136 4181fb2c420000                 cmp        r11d, 0x422c
0013d 0f856d170000                   jne        0x7febffe80db0
00143 4c891424                       mov        qword ptr [rsp], r10
00147 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
0014f 4885ed                         test       rbp, rbp
00152 0f840c150000                   je         0x7febffe80b64
00158 448b5500                       mov        r10d, dword ptr [rbp]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fadd050000                 cmp        r10d, 0x5dd
00167 0f8543170000                   jne        0x7febffe80db0
0016d 4c8bd5                         mov        r10, rbp
00170 4c89542408                     mov        qword ptr [rsp + 8], r10
00175 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017d 4885ed                         test       rbp, rbp
00180 0f84eb140000                   je         0x7febffe80b71
00186 448b5d00                       mov        r11d, dword ptr [rbp]
0018a 41c1eb0d                       shr        r11d, 0xd
0018e 4181fbe0050000                 cmp        r11d, 0x5e0
00195 0f8515170000                   jne        0x7febffe80db0
0019b 4c8bd5                         mov        r10, rbp
0019e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ab 4885ed                         test       rbp, rbp
001ae 0f84ca140000                   je         0x7febffe80b7e
001b4 448b5500                       mov        r10d, dword ptr [rbp]
001b8 41c1ea0d                       shr        r10d, 0xd
001bc 4181fadf050000                 cmp        r10d, 0x5df
001c3 0f85e7160000                   jne        0x7febffe80db0
001c9 4c8bd5                         mov        r10, rbp
001cc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d1 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001d9 4885ed                         test       rbp, rbp
001dc 0f84a9140000                   je         0x7febffe80b8b
001e2 448b5500                       mov        r10d, dword ptr [rbp]
001e6 41c1ea0d                       shr        r10d, 0xd
001ea 4181fadf050000                 cmp        r10d, 0x5df
001f1 0f85b9160000                   jne        0x7febffe80db0
001f7 4c8bd5                         mov        r10, rbp
001fa 4c89542470                     mov        qword ptr [rsp + 0x70], r10
001ff 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00207 4885ed                         test       rbp, rbp
0020a 0f8488140000                   je         0x7febffe80b98
00210 448b5500                       mov        r10d, dword ptr [rbp]
00214 41c1ea0d                       shr        r10d, 0xd
00218 4181fadd050000                 cmp        r10d, 0x5dd
0021f 0f858b160000                   jne        0x7febffe80db0
00225 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0022f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00233 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00238 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0023d 4585d2                         test       r10d, r10d
00240 0f84b6150000                   je         0x7febffe80cfc
00246 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0024f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00254 4585d2                         test       r10d, r10d
00257 0f869f150000                   jbe        0x7febffe80cfc
0025d 4183fa01                       cmp        r10d, 1
00261 0f8695150000                   jbe        0x7febffe80cfc
00267 4183fa02                       cmp        r10d, 2
0026b 0f868b150000                   jbe        0x7febffe80cfc
00271 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00276 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027a 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0027f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00284 458b5204                       mov        r10d, dword ptr [r10 + 4]
00288 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
00290 4183c3f1                       add        r11d, -0xf
00294 4585db                         test       r11d, r11d
00297 0f8c5f150000                   jl         0x7febffe80cfc
0029d 4183c2f1                       add        r10d, -0xf
002a1 4585d2                         test       r10d, r10d
002a4 0f8c52150000                   jl         0x7febffe80cfc
002aa 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002b2 4183c3f9                       add        r11d, -7
002b6 4585db                         test       r11d, r11d
002b9 0f8c3d150000                   jl         0x7febffe80cfc
002bf 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002c4 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002cc 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002d4 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
002dc 4183c2f1                       add        r10d, -0xf
002e0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002e8 4183c3f1                       add        r11d, -0xf
002ec 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
002f4 e9cd010000                     jmp        0x7febffe7f9c6
002f9 4533d2                         xor        r10d, r10d
002fc 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00301 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00306 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0030a 83f803                         cmp        eax, 3
0030d 0f8e61020000                   jle        0x7febffe7fa74
00313 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00318 45895310                       mov        dword ptr [r11 + 0x10], r10d
0031c 458b5308                       mov        r10d, dword ptr [r11 + 8]
00320 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00324 448d50fd                       lea        r10d, [rax - 3]
00328 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00330 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00335 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0033d 45895a08                       mov        dword ptr [r10 + 8], r11d
00341 4c639c2494000000               movsxd     r11, dword ptr [rsp + 0x94]
00349 4c63d3                         movsxd     r10, ebx
0034c 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00351 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00356 4c03d2                         add        r10, rdx
00359 4d3bda                         cmp        r11, r10
0035c 0f8fda100000                   jg         0x7febffe8093c
00362 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0036a 4585db                         test       r11d, r11d
0036d 0f8eb90f0000                   jle        0x7febffe8082c
00373 448beb                         mov        r13d, ebx
00376 44036c246c                     add        r13d, dword ptr [rsp + 0x6c]
0037b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00380 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00385 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0038d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00392 4503d5                         add        r10d, r13d
00395 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
0039a 0f8f630a0000                   jg         0x7febffe80303
003a0 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003a5 0f8fe9100000                   jg         0x7febffe80994
003ab 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003b0 4183fb10                       cmp        r11d, 0x10
003b4 0f8f92020000                   jg         0x7febffe7fb4c
003ba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003bf 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
003c7 0f83a70e0000                   jae        0x7febffe80774
003cd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003d2 458bca                         mov        r9d, r10d
003d5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003da c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
003e1 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003e8 0f83ca0e0000                   jae        0x7febffe807b8
003ee 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003f3 4503d1                         add        r10d, r9d
003f6 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003fe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00403 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0040a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0040f 4403db                         add        r11d, ebx
00412 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00417 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0041c 442b942494000000               sub        r10d, dword ptr [rsp + 0x94]
00424 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0042c 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00431 4183fb10                       cmp        r11d, 0x10
00435 0f8f3d110000                   jg         0x7febffe80a78
0043b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00443 4183fa10                       cmp        r10d, 0x10
00447 0f8c51030000                   jl         0x7febffe7fc9e
0044d 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00455 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0045d 0f835d0d0000                   jae        0x7febffe806c0
00463 458bd3                         mov        r10d, r11d
00466 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0046b c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00472 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00477 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0047f 0f838f0d0000                   jae        0x7febffe80714
00485 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0048a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0048f c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00496 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
0049a 4103da                         add        ebx, r10d
0049d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004a1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
004a6 41ffc3                         inc        r11d
004a9 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004ae 418502                         test       dword ptr [r10], eax
004b1 48894424f8                     mov        qword ptr [rsp - 8], rax
004b6 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
004bd 89442438                       mov        dword ptr [rsp + 0x38], eax
004c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004c6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004cb 498d741a08                     lea        rsi, [r10 + rbx + 8]
004d0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
004d5 442b442438                     sub        r8d, dword ptr [rsp + 0x38]
004da 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
004df 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
004e4 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
004e9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
004ee 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
004f3 0f8d59080000                   jge        0x7febffe80252
004f9 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
004fe 0f837f0c0000                   jae        0x7febffe80683
00504 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00509 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
0050e 4d8bda                         mov        r11, r10
00511 49c1eb12                       shr        r11, 0x12
00515 458bdb                         mov        r11d, r11d
00518 4181e3ffff0300                 and        r11d, 0x3ffff
0051f 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00524 458bda                         mov        r11d, r10d
00527 49c1fa24                       sar        r10, 0x24
0052b 4181e3ffff0100                 and        r11d, 0x1ffff
00532 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00537 458bd2                         mov        r10d, r10d
0053a 418bc2                         mov        eax, r10d
0053d 4585d2                         test       r10d, r10d
00540 0f8c060e0000                   jl         0x7febffe8084c
00546 4585db                         test       r11d, r11d
00549 0f84aafdffff                   je         0x7febffe7f7f9
0054f 453bd8                         cmp        r11d, r8d
00552 0f8ea9fdffff                   jle        0x7febffe7f801
00558 be45ffffff                     mov        esi, 0xffffff45
0055d 418beb                         mov        ebp, r11d
00560 44890424                       mov        dword ptr [rsp], r8d
00564 c5f877                         vzeroupper 
00567 e87453b4ff                     call       0x7febff9c4de0
0056c 0f1f840064060001               nop        dword ptr [rax + rax + 0x1000664]
00574 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00579 4585db                         test       r11d, r11d
0057c 7407                           je         0x7febffe7fa85
0057e 448d58ff                       lea        r11d, [rax - 1]
00582 418bc3                         mov        eax, r11d
00585 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0058a 458b4308                       mov        r8d, dword ptr [r11 + 8]
0058e 85c0                           test       eax, eax
00590 7474                           je         0x7febffe7fb06
00592 83f803                         cmp        eax, 3
00595 0f8430070000                   je         0x7febffe801cb
0059b 83f802                         cmp        eax, 2
0059e 7773                           ja         0x7febffe7fb13
005a0 3b44244c                       cmp        eax, dword ptr [rsp + 0x4c]
005a4 0f83b6130000                   jae        0x7febffe80e60
005aa 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
005af 458b448308                     mov        r8d, dword ptr [r11 + rax*4 + 8]
005b4 85c0                           test       eax, eax
005b6 7e45                           jle        0x7febffe7fafd
005b8 448d50ff                       lea        r10d, [rax - 1]
005bc 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
005c1 0f83dd150000                   jae        0x7febffe810a4
005c7 4533c9                         xor        r9d, r9d
005ca 458bd3                         mov        r10d, r11d
005cd 4183c2cc                       add        r10d, -0x34
005d1 41c1ea02                       shr        r10d, 2
005d5 458d5c02ff                     lea        r11d, [r10 + rax - 1]
005da 4863c8                         movsxd     rcx, eax
005dd 41ba04000000                   mov        r10d, 4
005e3 c442a8f5d3                     bzhi       r10, r11, r10
005e8 492bca                         sub        rcx, r10
005eb 48ffc9                         dec        rcx
005ee 4885c9                         test       rcx, rcx
005f1 490f4cc9                       cmovl      rcx, r9
005f5 448bd9                         mov        r11d, ecx
005f8 e93a050000                     jmp        0x7febffe80037
005fd 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00602 45894208                       mov        dword ptr [r10 + 8], r8d
00606 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0060e e92efdffff                     jmp        0x7febffe7f841
00613 48bef011bce200000000           movabs     rsi, 0xe2bc11f0
0061d 8beb                           mov        ebp, ebx
0061f 90                             nop        
00620 c5f877                         vzeroupper 
00623 e838ada7ff                     call       0x7febff8fa860
00628 0f1f840020070002               nop        dword ptr [rax + rax + 0x2000720]
00630 4885c0                         test       rax, rax
00633 0f842b140000                   je         0x7febffe80f64
00639 488bf0                         mov        rsi, rax
0063c c5f877                         vzeroupper 
0063f 4881c4c0000000                 add        rsp, 0xc0
00646 5d                             pop        rbp
00647 e91474b4ff                     jmp        0x7febff9c6f60
0064c 4183fb30                       cmp        r11d, 0x30
00650 0f8f09060000                   jg         0x7febffe8015f
00656 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0065b 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00663 0f833c100000                   jae        0x7febffe80ba5
00669 418bfa                         mov        edi, r10d
0066c 4d63c2                         movsxd     r8, r10d
0066f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00674 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
0067b 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
00682 0f83b0100000                   jae        0x7febffe80c38
00688 448d5310                       lea        r10d, [rbx + 0x10]
0068c 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00694 4c63d3                         movsxd     r10, ebx
00697 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0069c c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
006a3 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
006ab 453bdd                         cmp        r11d, r13d
006ae 0f8dd0000000                   jge        0x7febffe7fc84
006b4 4d2bc2                         sub        r8, r10
006b7 4d63db                         movsxd     r11, r11d
006ba 4c638c2484000000               movsxd     r9, dword ptr [rsp + 0x84]
006c2 4983c1f1                       add        r9, -0xf
006c6 4f8d1403                       lea        r10, [r11 + r8]
006ca 4d3bd1                         cmp        r10, r9
006cd 0f83a9130000                   jae        0x7febffe80f7c
006d3 4d63d5                         movsxd     r10, r13d
006d6 4d2bd3                         sub        r10, r11
006d9 4983c20f                       add        r10, 0xf
006dd 4983e2f0                       and        r10, 0xfffffffffffffff0
006e1 458bd2                         mov        r10d, r10d
006e4 458d5c1a10                     lea        r11d, [r10 + rbx + 0x10]
006e9 4d63d3                         movsxd     r10, r11d
006ec 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
006f1 4d3bd9                         cmp        r11, r9
006f4 0f8382130000                   jae        0x7febffe80f7c
006fa 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00702 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0070a 0f836c130000                   jae        0x7febffe80f7c
00710 4983c2f0                       add        r10, -0x10
00714 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
0071c 4983c3f1                       add        r11, -0xf
00720 4d3bd3                         cmp        r10, r11
00723 0f8353130000                   jae        0x7febffe80f7c
00729 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00730 0f8fda130000                   jg         0x7febffe81010
00736 448bd7                         mov        r10d, edi
00739 442bd3                         sub        r10d, ebx
0073c 0f1f4000                       nop        dword ptr [rax]
00740 458bc2                         mov        r8d, r10d
00743 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0074b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00750 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00757 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0075f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00764 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0076b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00773 4183c310                       add        r11d, 0x10
00777 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0077f 453bdd                         cmp        r11d, r13d
00782 7cbc                           jl         0x7febffe7fc40
00784 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00789 4403df                         add        r11d, edi
0078c 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00794 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00799 e979fcffff                     jmp        0x7febffe7f917
0079e 44035c2438                     add        r11d, dword ptr [rsp + 0x38]
007a3 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
007ab 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
007b0 0f8dc2020000                   jge        0x7febffe7ff78
007b6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007bb 4183c208                       add        r10d, 8
007bf 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
007c4 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007cc 4183fb08                       cmp        r11d, 8
007d0 0f8da2010000                   jge        0x7febffe7fe78
007d6 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
007de 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
007e6 0f8368160000                   jae        0x7febffe81354
007ec 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007f1 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
007f9 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
007ff 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00804 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0080c 0f83b6160000                   jae        0x7febffe813c8
00812 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00817 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0081c 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00821 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00829 4183c303                       add        r11d, 3
0082d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00832 41ffc2                         inc        r10d
00835 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0083d 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00845 0f83a9160000                   jae        0x7febffe813f4
0084b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00850 4183c303                       add        r11d, 3
00854 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
0085c 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00861 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
00867 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0086f 0f83b3160000                   jae        0x7febffe81428
00875 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
0087a 43886c1809                     mov        byte ptr [r8 + r11 + 9], bpl
0087f 470fbe44100a                   movsx      r8d, byte ptr [r8 + r10 + 0xa]
00885 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0088a 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
0088f 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
00895 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
0089a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
008a2 4183fb08                       cmp        r11d, 8
008a6 0f83a8160000                   jae        0x7febffe81454
008ac 49ba1081b6e200000000           movabs     r10, 0xe2b68110
008b6 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
008be 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
008c3 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
008c8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
008cd 4183fa04                       cmp        r10d, 4
008d1 7e3d                           jle        0x7febffe7fe10
008d3 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008d7 83c504                         add        ebp, 4
008da 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008df 418bd1                         mov        edx, r9d
008e2 6690                           nop        
008e4 c5f877                         vzeroupper 
008e7 e874aaa7ff                     call       0x7febff8fa860
008ec 0f1f8400e4090003               nop        dword ptr [rax + rax + 0x30009e4]
008f4 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008f9 8bd5                           mov        edx, ebp
008fb 8bc8                           mov        ecx, eax
008fd 666690                         nop        
00900 c5f877                         vzeroupper 
00903 e858aaa7ff                     call       0x7febff8fa860
00908 0f1f8400000a0004               nop        dword ptr [rax + rax + 0x4000a00]
00910 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00915 4183fa08                       cmp        r10d, 8
00919 7e51                           jle        0x7febffe7fe6c
0091b 49ba3881b6e200000000           movabs     r10, 0xe2b68138
00925 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00929 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00931 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00936 83c208                         add        edx, 8
00939 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0093e 6690                           nop        
00940 c5f877                         vzeroupper 
00943 e818aaa7ff                     call       0x7febff8fa860
00948 0f1f8400400a0005               nop        dword ptr [rax + rax + 0x5000a40]
00950 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00955 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
00959 488bc8                         mov        rcx, rax
0095c c5f877                         vzeroupper 
0095f e8fca9a7ff                     call       0x7febff8fa860
00964 0f1f84005c0a0006               nop        dword ptr [rax + rax + 0x6000a5c]
0096c 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
00973 e925fbffff                     jmp        0x7febffe7f99d
00978 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0097d 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00984 c5f877                         vzeroupper 
00987 e8d4a9a7ff                     call       0x7febff8fa860
0098c 0f1f8400840a0007               nop        dword ptr [rax + rax + 0x7000a84]
00994 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00999 8b542438                       mov        edx, dword ptr [rsp + 0x38]
0099d 488bc8                         mov        rcx, rax
009a0 c5f877                         vzeroupper 
009a3 e8b8a9a7ff                     call       0x7febff8fa860
009a8 0f1f8400a00a0008               nop        dword ptr [rax + rax + 0x8000aa0]
009b0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
009b8 4183c208                       add        r10d, 8
009bc 458bc2                         mov        r8d, r10d
009bf be95ffffff                     mov        esi, 0xffffff95
009c4 488b2c24                       mov        rbp, qword ptr [rsp]
009c8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
009cd 4c891424                       mov        qword ptr [rsp], r10
009d1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009d6 4489542408                     mov        dword ptr [rsp + 8], r10d
009db 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
009e0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
009e5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009ea 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009ef 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009f4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
009f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
009fe 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a03 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00a08 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a0d 48ff742440                     push       qword ptr [rsp + 0x40]
00a12 488f442438                     pop        qword ptr [rsp + 0x38]
00a17 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a1c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00a21 48ff742450                     push       qword ptr [rsp + 0x50]
00a26 488f442448                     pop        qword ptr [rsp + 0x48]
00a2b 48ff742458                     push       qword ptr [rsp + 0x58]
00a30 488f442450                     pop        qword ptr [rsp + 0x50]
00a35 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00a3a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00a3f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a44 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00a49 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00a4e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00a53 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00a5b 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00a60 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00a65 666690                         nop        
00a68 c5f877                         vzeroupper 
00a6b e8704eb4ff                     call       0x7febff9c4de0
00a70 0f1f8400680b0009               nop        dword ptr [rax + rax + 0x9000b68]
00a78 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00a7d 4183fb30                       cmp        r11d, 0x30
00a81 0f8fb1120000                   jg         0x7febffe81238
00a87 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00a8e 83c5f9                         add        ebp, -7
00a91 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a99 443bd5                         cmp        r10d, ebp
00a9c 0f83360e0000                   jae        0x7febffe80dd8
00aa2 458bda                         mov        r11d, r10d
00aa5 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00aad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ab2 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
00ab7 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00abf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ac4 443bdd                         cmp        r11d, ebp
00ac7 0f83570e0000                   jae        0x7febffe80e24
00acd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ad2 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00ada 48be28c122e200000000           movabs     rsi, 0xe222c128
00ae4 4963ca                         movsxd     rcx, r10d
00ae7 4883c108                       add        rcx, 8
00aeb 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00af0 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00af8 4533c9                         xor        r9d, r9d
00afb 90                             nop        
00afc c5f877                         vzeroupper 
00aff e85c9ea7ff                     call       0x7febff8f9e60
00b04 0f1f8400fc0b000a               nop        dword ptr [rax + rax + 0xa000bfc]
00b0c 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b13 83c508                         add        ebp, 8
00b16 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00b1d 0f8c91110000                   jl         0x7febffe811b4
00b23 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
00b27 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00b2e e96af9ffff                     jmp        0x7febffe7f99d
00b33 90                             nop        
00b34 418bc1                         mov        eax, r9d
00b37 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00b3c 458b548104                     mov        r10d, dword ptr [r9 + rax*4 + 4]
00b41 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00b46 4489548108                     mov        dword ptr [rcx + rax*4 + 8], r10d
00b4b 448d48ff                       lea        r9d, [rax - 1]
00b4f 453bcb                         cmp        r9d, r11d
00b52 7fe0                           jg         0x7febffe80034
00b54 4183f93f                       cmp        r9d, 0x3f
00b58 0f8e4e110000                   jle        0x7febffe811ac
00b5e 448bd0                         mov        r10d, eax
00b61 41ffca                         dec        r10d
00b64 418bca                         mov        ecx, r10d
00b67 eb0a                           jmp        0x7febffe80073
00b69 0f1f8000000000                 nop        dword ptr [rax]
00b70 418bca                         mov        ecx, r10d
00b73 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00b78 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00b83 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00b8e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00b99 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00ba4 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00baf 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00bba 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00bc5 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00bd0 448d51c0                       lea        r10d, [rcx - 0x40]
00bd4 4183fa3f                       cmp        r10d, 0x3f
00bd8 7f96                           jg         0x7febffe80070
00bda 4183fa0f                       cmp        r10d, 0xf
00bde 7e2d                           jle        0x7febffe8010d
00be0 448bd1                         mov        r10d, ecx
00be3 4183c2c0                       add        r10d, -0x40
00be7 90                             nop        
00be8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00bed 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00bf8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00c03 4183c2f0                       add        r10d, -0x10
00c07 4183fa0f                       cmp        r10d, 0xf
00c0b 7fdb                           jg         0x7febffe800e8
00c0d 4585d2                         test       r10d, r10d
00c10 0f8ee7f9ffff                   jle        0x7febffe7fafd
00c16 458bca                         mov        r9d, r10d
00c19 666690                         nop        
00c1c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00c21 478b548a04                     mov        r10d, dword ptr [r10 + r9*4 + 4]
00c26 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00c2b 4789548b08                     mov        dword ptr [r11 + r9*4 + 8], r10d
00c30 41ffc9                         dec        r9d
00c33 4585c9                         test       r9d, r9d
00c36 7fe4                           jg         0x7febffe8011c
00c38 e9c0f9ffff                     jmp        0x7febffe7fafd
00c3d 4d63d3                         movsxd     r10, r11d
00c40 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c47 c442a8f5db                     bzhi       r11, r11, r10
00c4c c4c1fb92fb                     kmovq      k7, r11
00c51 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c57 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c5d eb62                           jmp        0x7febffe801c1
00c5f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c64 4585db                         test       r11d, r11d
00c67 0f8ca3110000                   jl         0x7febffe81310
00c6d 85db                           test       ebx, ebx
00c6f 0f8c9b110000                   jl         0x7febffe81310
00c75 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c7a 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00c82 0f8288110000                   jb         0x7febffe81310
00c88 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00c90 453bd5                         cmp        r10d, r13d
00c93 0f8277110000                   jb         0x7febffe81310
00c99 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00c9e 4585db                         test       r11d, r11d
00ca1 741e                           je         0x7febffe801c1
00ca3 4883fa20                       cmp        rdx, 0x20
00ca7 7694                           jbe        0x7febffe8013d
00ca9 c5f877                         vzeroupper 
00cac 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00cb6 41ffd2                         call       r10
00cb9 0f1f840000000000               nop        dword ptr [rax + rax]
00cc1 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00cc6 e94cf7ffff                     jmp        0x7febffe7f917
00ccb 41ffc8                         dec        r8d
00cce 4585c0                         test       r8d, r8d
00cd1 7e1f                           jle        0x7febffe801f2
00cd3 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00cd8 45895310                       mov        dword ptr [r11 + 0x10], r10d
00cdc 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00ce0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00ce5 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00ce9 45894208                       mov        dword ptr [r10 + 8], r8d
00ced e914f9ffff                     jmp        0x7febffe7fb06
00cf2 48bec011bce200000000           movabs     rsi, 0xe2bc11c0
00cfc 8beb                           mov        ebp, ebx
00cfe 6690                           nop        
00d00 c5f877                         vzeroupper 
00d03 e858a6a7ff                     call       0x7febff8fa860
00d08 0f1f8400000e000b               nop        dword ptr [rax + rax + 0xb000e00]
00d10 4885c0                         test       rax, rax
00d13 0f8520f9ffff                   jne        0x7febffe7fb39
00d19 bef6ffffff                     mov        esi, 0xfffffff6
00d1e 6690                           nop        
00d20 c5f877                         vzeroupper 
00d23 e8b84bb4ff                     call       0x7febff9c4de0
00d28 0f1f8400200e000c               nop        dword ptr [rax + rax + 0xc000e20]
00d30 4d63d0                         movsxd     r10, r8d
00d33 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d3a c442a8f5db                     bzhi       r11, r11, r10
00d3f c4c1fb92fb                     kmovq      k7, r11
00d44 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d4a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d50 eb71                           jmp        0x7febffe802c3
00d52 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d57 4585db                         test       r11d, r11d
00d5a 0f8c5c120000                   jl         0x7febffe814bc
00d60 85db                           test       ebx, ebx
00d62 0f8c54120000                   jl         0x7febffe814bc
00d68 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d6d 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00d72 0f8244120000                   jb         0x7febffe814bc
00d78 428d2c03                       lea        ebp, [rbx + r8]
00d7c 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00d84 443bd5                         cmp        r10d, ebp
00d87 0f822f120000                   jb         0x7febffe814bc
00d8d 4585c0                         test       r8d, r8d
00d90 0f8c26120000                   jl         0x7febffe814bc
00d96 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d9b 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00da0 7421                           je         0x7febffe802c3
00da2 4963d0                         movsxd     rdx, r8d
00da5 4883fa20                       cmp        rdx, 0x20
00da9 7685                           jbe        0x7febffe80230
00dab c5f877                         vzeroupper 
00dae 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00db8 41ffd2                         call       r10
00dbb 0f1f840000000000               nop        dword ptr [rax + rax]
00dc3 4c8b1424                       mov        r10, qword ptr [rsp]
00dc7 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00dcb c5f877                         vzeroupper 
00dce 4881c4c0000000                 add        rsp, 0xc0
00dd5 5d                             pop        rbp
00dd6 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00dda 0f877c140000                   ja         0x7febffe8175c
00de0 c3                             ret        
00de1 4d63d2                         movsxd     r10, r10d
00de4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00deb c442a8f5db                     bzhi       r11, r11, r10
00df0 c4c1fb92fb                     kmovq      k7, r11
00df5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dfb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e01 eb70                           jmp        0x7febffe80373
00e03 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00e08 4585db                         test       r11d, r11d
00e0b 0f846a030000                   je         0x7febffe8067b
00e11 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e16 4585d2                         test       r10d, r10d
00e19 0f8c39120000                   jl         0x7febffe81558
00e1f 85db                           test       ebx, ebx
00e21 0f8c31120000                   jl         0x7febffe81558
00e27 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00e2c 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00e34 0f821e120000                   jb         0x7febffe81558
00e3a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00e42 453bdd                         cmp        r11d, r13d
00e45 0f820d120000                   jb         0x7febffe81558
00e4b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00e50 4585d2                         test       r10d, r10d
00e53 741e                           je         0x7febffe80373
00e55 4883fa20                       cmp        rdx, 0x20
00e59 7686                           jbe        0x7febffe802e1
00e5b c5f877                         vzeroupper 
00e5e 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00e68 41ffd2                         call       r10
00e6b 0f1f840000000000               nop        dword ptr [rax + rax]
00e73 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00e78 4585db                         test       r11d, r11d
00e7b 0f8ebe010000                   jle        0x7febffe8053f
00e81 458bd5                         mov        r10d, r13d
00e84 442b942494000000               sub        r10d, dword ptr [rsp + 0x94]
00e8c 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00e94 418bdd                         mov        ebx, r13d
00e97 035c2478                       add        ebx, dword ptr [rsp + 0x78]
00e9b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ea0 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00ea8 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00ead 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00eb2 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00eba 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00ebf 0f8dea000000                   jge        0x7febffe804af
00ec5 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00eca 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00ed2 458bd3                         mov        r10d, r11d
00ed5 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00edd 450f4fd0                       cmovg      r10d, r8d
00ee1 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00ee9 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00ef1 4585d2                         test       r10d, r10d
00ef4 0f8cda110000                   jl         0x7febffe815d4
00efa 4585ed                         test       r13d, r13d
00efd 0f8cd1110000                   jl         0x7febffe815d4
00f03 458bda                         mov        r11d, r10d
00f06 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
00f0e 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00f16 453bc3                         cmp        r8d, r11d
00f19 0f82b5110000                   jb         0x7febffe815d4
00f1f 458bd5                         mov        r10d, r13d
00f22 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00f2a 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00f32 453bc2                         cmp        r8d, r10d
00f35 0f8299110000                   jb         0x7febffe815d4
00f3b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00f43 4585d2                         test       r10d, r10d
00f46 0f8c88110000                   jl         0x7febffe815d4
00f4c 4585d2                         test       r10d, r10d
00f4f 742c                           je         0x7febffe8047d
00f51 4963d2                         movsxd     rdx, r10d
00f54 4883fa20                       cmp        rdx, 0x20
00f58 773b                           ja         0x7febffe80495
00f5a 458bda                         mov        r11d, r10d
00f5d 4d63d3                         movsxd     r10, r11d
00f60 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f67 c442a8f5db                     bzhi       r11, r11, r10
00f6c c4c1fb92fb                     kmovq      k7, r11
00f71 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f77 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f7d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00f85 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00f8a 0f8c0f010000                   jl         0x7febffe8059f
00f90 e908f5ffff                     jmp        0x7febffe7f99d
00f95 c5f877                         vzeroupper 
00f98 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
00fa2 41ffd2                         call       r10
00fa5 0f1f840000000000               nop        dword ptr [rax + rax]
00fad ebce                           jmp        0x7febffe8047d
00faf 4585c0                         test       r8d, r8d
00fb2 0f8cd0110000                   jl         0x7febffe81688
00fb8 4585ed                         test       r13d, r13d
00fbb 0f8cc7110000                   jl         0x7febffe81688
00fc1 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00fc6 4503d0                         add        r10d, r8d
00fc9 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00fd1 453bda                         cmp        r11d, r10d
00fd4 0f82ae110000                   jb         0x7febffe81688
00fda 443bdb                         cmp        r11d, ebx
00fdd 0f82a5110000                   jb         0x7febffe81688
00fe3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00fe8 4585d2                         test       r10d, r10d
00feb 0f84acf4ffff                   je         0x7febffe7f99d
00ff1 4963d2                         movsxd     rdx, r10d
00ff4 4883fa20                       cmp        rdx, 0x20
00ff8 7728                           ja         0x7febffe80522
00ffa 458bda                         mov        r11d, r10d
00ffd 4d63d3                         movsxd     r10, r11d
01000 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01007 c442a8f5db                     bzhi       r11, r11, r10
0100c c4c1fb92fb                     kmovq      k7, r11
01011 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01017 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0101d e97bf4ffff                     jmp        0x7febffe7f99d
01022 c5f877                         vzeroupper 
01025 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
0102f 41ffd2                         call       r10
01032 0f1f840000000000               nop        dword ptr [rax + rax]
0103a e95ef4ffff                     jmp        0x7febffe7f99d
0103f 418bdd                         mov        ebx, r13d
01042 e956f4ffff                     jmp        0x7febffe7f99d
01047 448bdd                         mov        r11d, ebp
0104a 4d63d3                         movsxd     r10, r11d
0104d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01054 c442a8f5db                     bzhi       r11, r11, r10
01059 c4c1fb92fb                     kmovq      k7, r11
0105e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01064 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0106a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01072 4403dd                         add        r11d, ebp
01075 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0107d 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
01081 418503                         test       dword ptr [r11], eax
01084 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0108c 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
01091 0f8d06f4ffff                   jge        0x7febffe7f99d
01097 4489b424a0000000               mov        dword ptr [rsp + 0xa0], r14d
0109f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
010a7 442b9c2494000000               sub        r11d, dword ptr [rsp + 0x94]
010af 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
010b7 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
010bb 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
010c2 3bac2494000000                 cmp        ebp, dword ptr [rsp + 0x94]
010c9 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
010d1 410f4fea                       cmovg      ebp, r10d
010d5 4585db                         test       r11d, r11d
010d8 0f8c020f0000                   jl         0x7febffe814e0
010de 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
010e6 4585d2                         test       r10d, r10d
010e9 0f8cf10e0000                   jl         0x7febffe814e0
010ef 448bdd                         mov        r11d, ebp
010f2 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
010fa 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
01102 453bc3                         cmp        r8d, r11d
01105 0f82d50e0000                   jb         0x7febffe814e0
0110b 448bb424a0000000               mov        r14d, dword ptr [rsp + 0xa0]
01113 4403f5                         add        r14d, ebp
01116 458bd0                         mov        r10d, r8d
01119 453bd6                         cmp        r10d, r14d
0111c 0f82be0e0000                   jb         0x7febffe814e0
01122 85ed                           test       ebp, ebp
01124 0f8cb60e0000                   jl         0x7febffe814e0
0112a 85ed                           test       ebp, ebp
0112c 0f8438ffffff                   je         0x7febffe8056a
01132 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01137 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0113f 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
01144 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0114c 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
01151 4863d5                         movsxd     rdx, ebp
01154 4883fa20                       cmp        rdx, 0x20
01158 0f86e9feffff                   jbe        0x7febffe80547
0115e c5f877                         vzeroupper 
01161 49ba203f8effeb7f0000           movabs     r10, 0x7febff8e3f20
0116b 41ffd2                         call       r10
0116e 0f1f840000000000               nop        dword ptr [rax + rax]
01176 e9effeffff                     jmp        0x7febffe8056a
0117b 448beb                         mov        r13d, ebx
0117e e9f0fcffff                     jmp        0x7febffe80373
01183 bee4ffffff                     mov        esi, 0xffffffe4
01188 488b2c24                       mov        rbp, qword ptr [rsp]
0118c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01191 4c891424                       mov        qword ptr [rsp], r10
01195 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0119a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0119f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
011a4 448954240c                     mov        dword ptr [rsp + 0xc], r10d
011a9 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
011ad 666690                         nop        
011b0 c5f877                         vzeroupper 
011b3 e82847b4ff                     call       0x7febff9c4de0
011b8 0f1f8400b012000e               nop        dword ptr [rax + rax + 0xe0012b0]
011c0 bee4ffffff                     mov        esi, 0xffffffe4
011c5 488b2c24                       mov        rbp, qword ptr [rsp]
011c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011ce 4c891424                       mov        qword ptr [rsp], r10
011d2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011d7 44895c2408                     mov        dword ptr [rsp + 8], r11d
011dc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
011e1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
011e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
011eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011f0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
011f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011fa 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
011ff 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01204 c5f877                         vzeroupper 
01207 e8d446b4ff                     call       0x7febff9c4de0
0120c 0f1f84000413000f               nop        dword ptr [rax + rax + 0xf001304]
01214 bee4ffffff                     mov        esi, 0xffffffe4
01219 488b2c24                       mov        rbp, qword ptr [rsp]
0121d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01222 4c891424                       mov        qword ptr [rsp], r10
01226 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0122b 4489542408                     mov        dword ptr [rsp + 8], r10d
01230 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01235 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0123a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0123f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01244 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01249 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0124e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01253 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01258 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01261 666690                         nop        
01264 c5f877                         vzeroupper 
01267 e87446b4ff                     call       0x7febff9c4de0
0126c 0f1f840064130010               nop        dword ptr [rax + rax + 0x10001364]
01274 bee4ffffff                     mov        esi, 0xffffffe4
01279 488b2c24                       mov        rbp, qword ptr [rsp]
0127d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01282 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0128c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01291 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01295 48894424f8                     mov        qword ptr [rsp - 8], rax
0129a 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0129e 89442470                       mov        dword ptr [rsp + 0x70], eax
012a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a7 90                             nop        
012a8 c5f877                         vzeroupper 
012ab e83046b4ff                     call       0x7febff9c4de0
012b0 0f1f8400a8130011               nop        dword ptr [rax + rax + 0x110013a8]
012b8 bee4ffffff                     mov        esi, 0xffffffe4
012bd 488b2c24                       mov        rbp, qword ptr [rsp]
012c1 4c891c24                       mov        qword ptr [rsp], r11
012c5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012ca 44895c2408                     mov        dword ptr [rsp + 8], r11d
012cf 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
012d4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
012d9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012de 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012e3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
012e8 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012ed 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
012f2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
012f7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
012fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01301 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01305 89442470                       mov        dword ptr [rsp + 0x70], eax
01309 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01312 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0131b 90                             nop        
0131c c5f877                         vzeroupper 
0131f e8bc45b4ff                     call       0x7febff9c4de0
01324 0f1f84001c140012               nop        dword ptr [rax + rax + 0x1200141c]
0132c be45ffffff                     mov        esi, 0xffffff45
01331 488b2c24                       mov        rbp, qword ptr [rsp]
01335 4c89542408                     mov        qword ptr [rsp + 8], r10
0133a 6690                           nop        
0133c c5f877                         vzeroupper 
0133f e89c45b4ff                     call       0x7febff9c4de0
01344 0f1f84003c140013               nop        dword ptr [rax + rax + 0x1300143c]
0134c be45ffffff                     mov        esi, 0xffffff45
01351 488b2c24                       mov        rbp, qword ptr [rsp]
01355 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0135a 4c891424                       mov        qword ptr [rsp], r10
0135e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01363 44895c2408                     mov        dword ptr [rsp + 8], r11d
01368 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0136d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01372 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01377 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0137c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01381 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01386 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0138b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01390 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01394 48894424f8                     mov        qword ptr [rsp - 8], rax
01399 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0139d 89442434                       mov        dword ptr [rsp + 0x34], eax
013a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a6 48894424f8                     mov        qword ptr [rsp - 8], rax
013ab 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013af 89442438                       mov        dword ptr [rsp + 0x38], eax
013b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b8 48894424f8                     mov        qword ptr [rsp - 8], rax
013bd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013c1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ca 48ff742450                     push       qword ptr [rsp + 0x50]
013cf 488f442448                     pop        qword ptr [rsp + 0x48]
013d4 48ff742458                     push       qword ptr [rsp + 0x58]
013d9 488f442450                     pop        qword ptr [rsp + 0x50]
013de 48894424f8                     mov        qword ptr [rsp - 8], rax
013e3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013e7 89442458                       mov        dword ptr [rsp + 0x58], eax
013eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f0 48894424f8                     mov        qword ptr [rsp - 8], rax
013f5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
013f9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
013fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01402 48894424f8                     mov        qword ptr [rsp - 8], rax
01407 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0140b 89442460                       mov        dword ptr [rsp + 0x60], eax
0140f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01414 48894424f8                     mov        qword ptr [rsp - 8], rax
01419 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0141d 89442464                       mov        dword ptr [rsp + 0x64], eax
01421 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01426 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0142a 6690                           nop        
0142c c5f877                         vzeroupper 
0142f e8ac44b4ff                     call       0x7febff9c4de0
01434 0f1f84002c150014               nop        dword ptr [rax + rax + 0x1400152c]
0143c 4d3bda                         cmp        r11, r10
0143f bdffffffff                     mov        ebp, 0xffffffff
01444 7c08                           jl         0x7febffe8094e
01446 400f95c5                       setne      bpl
0144a 400fb6ed                       movzx      ebp, bpl
0144e be45ffffff                     mov        esi, 0xffffff45
01453 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01458 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0145d 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
01462 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01467 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0146b 48894424f8                     mov        qword ptr [rsp - 8], rax
01470 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01474 89442470                       mov        dword ptr [rsp + 0x70], eax
01478 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147d 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01482 6690                           nop        
01484 c5f877                         vzeroupper 
01487 e85444b4ff                     call       0x7febff9c4de0
0148c 0f1f840084150015               nop        dword ptr [rax + rax + 0x15001584]
01494 be45ffffff                     mov        esi, 0xffffff45
01499 488b2c24                       mov        rbp, qword ptr [rsp]
0149d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014a2 4c891424                       mov        qword ptr [rsp], r10
014a6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014ab 44895c2408                     mov        dword ptr [rsp + 8], r11d
014b0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
014b5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014c9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014ce 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014d3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014d8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014dd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014e2 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014ef 89442434                       mov        dword ptr [rsp + 0x34], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 48894424f8                     mov        qword ptr [rsp - 8], rax
014fd 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01501 89442438                       mov        dword ptr [rsp + 0x38], eax
01505 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150a 48894424f8                     mov        qword ptr [rsp - 8], rax
0150f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01513 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151c 48ff742450                     push       qword ptr [rsp + 0x50]
01521 488f442448                     pop        qword ptr [rsp + 0x48]
01526 48ff742458                     push       qword ptr [rsp + 0x58]
0152b 488f442450                     pop        qword ptr [rsp + 0x50]
01530 48894424f8                     mov        qword ptr [rsp - 8], rax
01535 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01539 89442458                       mov        dword ptr [rsp + 0x58], eax
0153d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01542 48894424f8                     mov        qword ptr [rsp - 8], rax
01547 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0154b 89442460                       mov        dword ptr [rsp + 0x60], eax
0154f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01554 48894424f8                     mov        qword ptr [rsp - 8], rax
01559 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0155d 89442468                       mov        dword ptr [rsp + 0x68], eax
01561 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01566 6690                           nop        
01568 c5f877                         vzeroupper 
0156b e87043b4ff                     call       0x7febff9c4de0
01570 0f1f840068160016               nop        dword ptr [rax + rax + 0x16001668]
01578 be45ffffff                     mov        esi, 0xffffff45
0157d 488b2c24                       mov        rbp, qword ptr [rsp]
01581 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01586 4c891424                       mov        qword ptr [rsp], r10
0158a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0158f 4489542408                     mov        dword ptr [rsp + 8], r10d
01594 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01599 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0159e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015a3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015a8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015ad 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015b2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
015b7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
015bc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
015c1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
015c6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015cb 4489542430                     mov        dword ptr [rsp + 0x30], r10d
015d0 48894424f8                     mov        qword ptr [rsp - 8], rax
015d5 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015d9 89442438                       mov        dword ptr [rsp + 0x38], eax
015dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e2 48894424f8                     mov        qword ptr [rsp - 8], rax
015e7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015eb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f4 48ff742450                     push       qword ptr [rsp + 0x50]
015f9 488f442448                     pop        qword ptr [rsp + 0x48]
015fe 48ff742458                     push       qword ptr [rsp + 0x58]
01603 488f442450                     pop        qword ptr [rsp + 0x50]
01608 48894424f8                     mov        qword ptr [rsp - 8], rax
0160d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01611 89442458                       mov        dword ptr [rsp + 0x58], eax
01615 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161a 48894424f8                     mov        qword ptr [rsp - 8], rax
0161f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01623 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01627 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162c 48894424f8                     mov        qword ptr [rsp - 8], rax
01631 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01635 89442460                       mov        dword ptr [rsp + 0x60], eax
01639 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01643 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01648 c5f877                         vzeroupper 
0164b e89042b4ff                     call       0x7febff9c4de0
01650 0f1f840048170017               nop        dword ptr [rax + rax + 0x17001748]
01658 4533d2                         xor        r10d, r10d
0165b 4c891424                       mov        qword ptr [rsp], r10
0165f e9e3eaffff                     jmp        0x7febffe7f647
01664 4533d2                         xor        r10d, r10d
01667 4c89542408                     mov        qword ptr [rsp + 8], r10
0166c e904ebffff                     jmp        0x7febffe7f675
01671 4533d2                         xor        r10d, r10d
01674 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01679 e925ebffff                     jmp        0x7febffe7f6a3
0167e 4533d2                         xor        r10d, r10d
01681 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01686 e946ebffff                     jmp        0x7febffe7f6d1
0168b 4533d2                         xor        r10d, r10d
0168e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01693 e967ebffff                     jmp        0x7febffe7f6ff
01698 4533d2                         xor        r10d, r10d
0169b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016a0 e985ebffff                     jmp        0x7febffe7f72a
016a5 bee4ffffff                     mov        esi, 0xffffffe4
016aa 488b2c24                       mov        rbp, qword ptr [rsp]
016ae 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016b3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016b8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
016bd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016c2 48894424f8                     mov        qword ptr [rsp - 8], rax
016c7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016cb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
016cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d4 48894424f8                     mov        qword ptr [rsp - 8], rax
016d9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016dd 89442460                       mov        dword ptr [rsp + 0x60], eax
016e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e6 48894424f8                     mov        qword ptr [rsp - 8], rax
016eb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016ef 89442464                       mov        dword ptr [rsp + 0x64], eax
016f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f8 48894424f8                     mov        qword ptr [rsp - 8], rax
016fd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01701 89442468                       mov        dword ptr [rsp + 0x68], eax
01705 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170a 48894424f8                     mov        qword ptr [rsp - 8], rax
0170f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01713 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01717 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171c 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01721 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01725 666690                         nop        
01728 c5f877                         vzeroupper 
0172b e8b041b4ff                     call       0x7febff9c4de0
01730 0f1f840028180018               nop        dword ptr [rax + rax + 0x18001828]
01738 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01741 bee4ffffff                     mov        esi, 0xffffffe4
01746 488b2c24                       mov        rbp, qword ptr [rsp]
0174a 4c891424                       mov        qword ptr [rsp], r10
0174e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01753 44895c2408                     mov        dword ptr [rsp + 8], r11d
01758 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0175d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01762 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01767 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0176c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01771 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01776 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0177b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01780 48894424f8                     mov        qword ptr [rsp - 8], rax
01785 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01789 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0178d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01792 48894424f8                     mov        qword ptr [rsp - 8], rax
01797 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0179b 89442460                       mov        dword ptr [rsp + 0x60], eax
0179f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a4 48894424f8                     mov        qword ptr [rsp - 8], rax
017a9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017ad 89442464                       mov        dword ptr [rsp + 0x64], eax
017b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b6 48894424f8                     mov        qword ptr [rsp - 8], rax
017bb 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017bf 89442468                       mov        dword ptr [rsp + 0x68], eax
017c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c8 48894424f8                     mov        qword ptr [rsp - 8], rax
017cd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
017d1 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017da 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
017df 897c247c                       mov        dword ptr [rsp + 0x7c], edi
017e3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
017ea 6690                           nop        
017ec c5f877                         vzeroupper 
017ef e8ec40b4ff                     call       0x7febff9c4de0
017f4 0f1f8400ec180019               nop        dword ptr [rax + rax + 0x190018ec]
017fc bebeffffff                     mov        esi, 0xffffffbe
01801 488b2c24                       mov        rbp, qword ptr [rsp]
01805 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0180a 4c891424                       mov        qword ptr [rsp], r10
0180e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01813 4489542408                     mov        dword ptr [rsp + 8], r10d
01818 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0181d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01822 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01827 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0182c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01831 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01836 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0183b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01840 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01844 48894424f8                     mov        qword ptr [rsp - 8], rax
01849 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0184d 89442434                       mov        dword ptr [rsp + 0x34], eax
01851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01856 48894424f8                     mov        qword ptr [rsp - 8], rax
0185b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0185f 89442438                       mov        dword ptr [rsp + 0x38], eax
01863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01868 48894424f8                     mov        qword ptr [rsp - 8], rax
0186d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01871 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01875 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187a 48ff742450                     push       qword ptr [rsp + 0x50]
0187f 488f442448                     pop        qword ptr [rsp + 0x48]
01884 48ff742458                     push       qword ptr [rsp + 0x58]
01889 488f442450                     pop        qword ptr [rsp + 0x50]
0188e 48894424f8                     mov        qword ptr [rsp - 8], rax
01893 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01897 89442458                       mov        dword ptr [rsp + 0x58], eax
0189b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a0 c5f877                         vzeroupper 
018a3 e83840b4ff                     call       0x7febff9c4de0
018a8 0f1f8400a019001a               nop        dword ptr [rax + rax + 0x1a0019a0]
018b0 be85ffffff                     mov        esi, 0xffffff85
018b5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
018b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018be 44891424                       mov        dword ptr [rsp], r10d
018c2 895c2404                       mov        dword ptr [rsp + 4], ebx
018c6 6690                           nop        
018c8 c5f877                         vzeroupper 
018cb e81040b4ff                     call       0x7febff9c4de0
018d0 0f1f8400c819001b               nop        dword ptr [rax + rax + 0x1b0019c8]
018d8 bee4ffffff                     mov        esi, 0xffffffe4
018dd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018e2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018e7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
018ec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018f1 48894424f8                     mov        qword ptr [rsp - 8], rax
018f6 8b442478                       mov        eax, dword ptr [rsp + 0x78]
018fa 8944246c                       mov        dword ptr [rsp + 0x6c], eax
018fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01903 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0190b 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01913 90                             nop        
01914 c5f877                         vzeroupper 
01917 e8c43fb4ff                     call       0x7febff9c4de0
0191c 0f1f8400141a001c               nop        dword ptr [rax + rax + 0x1c001a14]
01924 bee4ffffff                     mov        esi, 0xffffffe4
01929 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0192e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01933 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01938 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0193d 48894424f8                     mov        qword ptr [rsp - 8], rax
01942 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01946 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 90                             nop        
01950 c5f877                         vzeroupper 
01953 e8883fb4ff                     call       0x7febff9c4de0
01958 0f1f8400501a001d               nop        dword ptr [rax + rax + 0x1d001a50]
01960 bee4ffffff                     mov        esi, 0xffffffe4
01965 488b2c24                       mov        rbp, qword ptr [rsp]
01969 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0196e 4c891424                       mov        qword ptr [rsp], r10
01972 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01977 4489542408                     mov        dword ptr [rsp + 8], r10d
0197c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01981 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01986 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0198b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01990 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01995 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0199a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0199f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
019a4 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019a8 48894424f8                     mov        qword ptr [rsp - 8], rax
019ad 8b442438                       mov        eax, dword ptr [rsp + 0x38]
019b1 89442434                       mov        dword ptr [rsp + 0x34], eax
019b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ba 48894424f8                     mov        qword ptr [rsp - 8], rax
019bf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
019c3 89442438                       mov        dword ptr [rsp + 0x38], eax
019c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cc 48894424f8                     mov        qword ptr [rsp - 8], rax
019d1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019d5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019de 48ff742450                     push       qword ptr [rsp + 0x50]
019e3 488f442448                     pop        qword ptr [rsp + 0x48]
019e8 48ff742458                     push       qword ptr [rsp + 0x58]
019ed 488f442450                     pop        qword ptr [rsp + 0x50]
019f2 48894424f8                     mov        qword ptr [rsp - 8], rax
019f7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019fb 89442458                       mov        dword ptr [rsp + 0x58], eax
019ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a04 48894424f8                     mov        qword ptr [rsp - 8], rax
01a09 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a0d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a16 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a1f 89442460                       mov        dword ptr [rsp + 0x60], eax
01a23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a28 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a31 89442464                       mov        dword ptr [rsp + 0x64], eax
01a35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a43 89442468                       mov        dword ptr [rsp + 0x68], eax
01a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01a53 90                             nop        
01a54 c5f877                         vzeroupper 
01a57 e8843eb4ff                     call       0x7febff9c4de0
01a5c 0f1f8400541b001e               nop        dword ptr [rax + rax + 0x1e001b54]
01a64 bef6ffffff                     mov        esi, 0xfffffff6
01a69 666690                         nop        
01a6c c5f877                         vzeroupper 
01a6f e86c3eb4ff                     call       0x7febff9c4de0
01a74 0f1f84006c1b001f               nop        dword ptr [rax + rax + 0x1f001b6c]
01a7c 8bef                           mov        ebp, edi
01a7e 83c510                         add        ebp, 0x10
01a81 be6effffff                     mov        esi, 0xffffff6e
01a86 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a8b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a90 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a95 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a9a 897c2438                       mov        dword ptr [rsp + 0x38], edi
01a9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01aa7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01aab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ab9 89442460                       mov        dword ptr [rsp + 0x60], eax
01abd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01acb 89442464                       mov        dword ptr [rsp + 0x64], eax
01acf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01add 89442468                       mov        dword ptr [rsp + 0x68], eax
01ae1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01aef 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01af3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af8 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01afd 666690                         nop        
01b00 c5f877                         vzeroupper 
01b03 e8d83db4ff                     call       0x7febff9c4de0
01b08 0f1f8400001c0020               nop        dword ptr [rax + rax + 0x20001c00]
01b10 8bef                           mov        ebp, edi
01b12 83c510                         add        ebp, 0x10
01b15 be66ffffff                     mov        esi, 0xffffff66
01b1a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b1f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b24 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b29 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b2e 897c2438                       mov        dword ptr [rsp + 0x38], edi
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b3b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b44 48894424f8                     mov        qword ptr [rsp - 8], rax
01b49 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b4d 89442460                       mov        dword ptr [rsp + 0x60], eax
01b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b56 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b5f 89442464                       mov        dword ptr [rsp + 0x64], eax
01b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b68 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b71 89442468                       mov        dword ptr [rsp + 0x68], eax
01b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b83 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8c 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01b91 666690                         nop        
01b94 c5f877                         vzeroupper 
01b97 e8443db4ff                     call       0x7febff9c4de0
01b9c 0f1f8400941c0021               nop        dword ptr [rax + rax + 0x21001c94]
01ba4 be6effffff                     mov        esi, 0xffffff6e
01ba9 488b2c24                       mov        rbp, qword ptr [rsp]
01bad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bb2 4c891424                       mov        qword ptr [rsp], r10
01bb6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bbb 4489542408                     mov        dword ptr [rsp + 8], r10d
01bc0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bc5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bcf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bd4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bd9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01bde 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01be3 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01be8 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01bec 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bf5 89442434                       mov        dword ptr [rsp + 0x34], eax
01bf9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01c03 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c07 89442438                       mov        dword ptr [rsp + 0x38], eax
01c0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c10 48894424f8                     mov        qword ptr [rsp - 8], rax
01c15 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c19 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c22 48ff742450                     push       qword ptr [rsp + 0x50]
01c27 488f442448                     pop        qword ptr [rsp + 0x48]
01c2c 48ff742458                     push       qword ptr [rsp + 0x58]
01c31 488f442450                     pop        qword ptr [rsp + 0x50]
01c36 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c3f 89442458                       mov        dword ptr [rsp + 0x58], eax
01c43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c48 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c51 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c63 89442460                       mov        dword ptr [rsp + 0x60], eax
01c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c71 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c75 89442464                       mov        dword ptr [rsp + 0x64], eax
01c79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c83 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c87 89442468                       mov        dword ptr [rsp + 0x68], eax
01c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c90 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c95 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01c99 666690                         nop        
01c9c c5f877                         vzeroupper 
01c9f e83c3cb4ff                     call       0x7febff9c4de0
01ca4 0f1f84009c1d0022               nop        dword ptr [rax + rax + 0x22001d9c]
01cac 458bd1                         mov        r10d, r9d
01caf e959efffff                     jmp        0x7febffe8010d
01cb4 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01cbc 4183c308                       add        r11d, 8
01cc0 458bc3                         mov        r8d, r11d
01cc3 be45ffffff                     mov        esi, 0xffffff45
01cc8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ccd 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01cd2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01cd7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ce5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ce9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cee 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cf7 89442460                       mov        dword ptr [rsp + 0x60], eax
01cfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d00 48894424f8                     mov        qword ptr [rsp - 8], rax
01d05 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d09 89442464                       mov        dword ptr [rsp + 0x64], eax
01d0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d12 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01d1a 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01d1f 458bda                         mov        r11d, r10d
01d22 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01d27 90                             nop        
01d28 c5f877                         vzeroupper 
01d2b e8b03bb4ff                     call       0x7febff9c4de0
01d30 0f1f8400281e0023               nop        dword ptr [rax + rax + 0x23001e28]
01d38 be45ffffff                     mov        esi, 0xffffff45
01d3d 488b2c24                       mov        rbp, qword ptr [rsp]
01d41 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d46 4c891424                       mov        qword ptr [rsp], r10
01d4a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d4f 4489542408                     mov        dword ptr [rsp + 8], r10d
01d54 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d59 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d5e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d63 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d68 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d6d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d72 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d77 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d7c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d81 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01d86 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d8f 89442438                       mov        dword ptr [rsp + 0x38], eax
01d93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d98 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01da1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01da5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daa 48ff742450                     push       qword ptr [rsp + 0x50]
01daf 488f442448                     pop        qword ptr [rsp + 0x48]
01db4 48ff742458                     push       qword ptr [rsp + 0x58]
01db9 488f442450                     pop        qword ptr [rsp + 0x50]
01dbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01dc7 89442458                       mov        dword ptr [rsp + 0x58], eax
01dcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd0 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01dd9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ddd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de2 48894424f8                     mov        qword ptr [rsp - 8], rax
01de7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01deb 89442460                       mov        dword ptr [rsp + 0x60], eax
01def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df4 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01df9 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01dfe 6690                           nop        
01e00 c5f877                         vzeroupper 
01e03 e8d83ab4ff                     call       0x7febff9c4de0
01e08 0f1f8400001f0024               nop        dword ptr [rax + rax + 0x24001f00]
01e10 beccffffff                     mov        esi, 0xffffffcc
01e15 488b2c24                       mov        rbp, qword ptr [rsp]
01e19 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e1e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e23 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e28 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e32 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e36 89442470                       mov        dword ptr [rsp + 0x70], eax
01e3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3f 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01e43 90                             nop        
01e44 c5f877                         vzeroupper 
01e47 e8943ab4ff                     call       0x7febff9c4de0
01e4c 0f1f8400441f0025               nop        dword ptr [rax + rax + 0x25001f44]
01e54 bee4ffffff                     mov        esi, 0xffffffe4
01e59 488b2c24                       mov        rbp, qword ptr [rsp]
01e5d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e62 4c891424                       mov        qword ptr [rsp], r10
01e66 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e6b 4489542408                     mov        dword ptr [rsp + 8], r10d
01e70 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e75 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e7a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e7f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e84 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e89 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e8e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e93 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e98 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01ea0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ea5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eaa 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01eae 89442474                       mov        dword ptr [rsp + 0x74], eax
01eb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb7 90                             nop        
01eb8 c5f877                         vzeroupper 
01ebb e8203ab4ff                     call       0x7febff9c4de0
01ec0 0f1f8400b81f0026               nop        dword ptr [rax + rax + 0x26001fb8]
01ec8 bee4ffffff                     mov        esi, 0xffffffe4
01ecd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ed2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ed7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01edc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ee1 666690                         nop        
01ee4 c5f877                         vzeroupper 
01ee7 e8f439b4ff                     call       0x7febff9c4de0
01eec 0f1f8400e41f0027               nop        dword ptr [rax + rax + 0x27001fe4]
01ef4 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01efb ffc5                           inc        ebp
01efd bee4ffffff                     mov        esi, 0xffffffe4
01f02 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f07 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f0c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f11 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f16 6690                           nop        
01f18 c5f877                         vzeroupper 
01f1b e8c039b4ff                     call       0x7febff9c4de0
01f20 0f1f840018200028               nop        dword ptr [rax + rax + 0x28002018]
01f28 bee4ffffff                     mov        esi, 0xffffffe4
01f2d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f32 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f37 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f3c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f41 666690                         nop        
01f44 c5f877                         vzeroupper 
01f47 e89439b4ff                     call       0x7febff9c4de0
01f4c 0f1f840044200029               nop        dword ptr [rax + rax + 0x29002044]
01f54 bee4ffffff                     mov        esi, 0xffffffe4
01f59 488b2c24                       mov        rbp, qword ptr [rsp]
01f5d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f62 4c891424                       mov        qword ptr [rsp], r10
01f66 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f6b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f70 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f75 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f7a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f7f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f84 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f89 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f8e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f93 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f98 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01fa1 89442470                       mov        dword ptr [rsp + 0x70], eax
01fa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01faa 6690                           nop        
01fac c5f877                         vzeroupper 
01faf e82c39b4ff                     call       0x7febff9c4de0
01fb4 0f1f8400ac20002a               nop        dword ptr [rax + rax + 0x2a0020ac]
01fbc beccffffff                     mov        esi, 0xffffffcc
01fc1 488b2c24                       mov        rbp, qword ptr [rsp]
01fc5 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01fc9 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01fce 6690                           nop        
01fd0 c5f877                         vzeroupper 
01fd3 e80839b4ff                     call       0x7febff9c4de0
01fd8 0f1f8400d020002b               nop        dword ptr [rax + rax + 0x2b0020d0]
01fe0 beccffffff                     mov        esi, 0xffffffcc
01fe5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fea 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01fef 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ff4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffe 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02002 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02006 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200b 48894424f8                     mov        qword ptr [rsp - 8], rax
02010 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02014 89442460                       mov        dword ptr [rsp + 0x60], eax
02018 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201d 48894424f8                     mov        qword ptr [rsp - 8], rax
02022 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02026 89442464                       mov        dword ptr [rsp + 0x64], eax
0202a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202f 48894424f8                     mov        qword ptr [rsp - 8], rax
02034 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02038 89442468                       mov        dword ptr [rsp + 0x68], eax
0203c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02041 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02046 6690                           nop        
02048 c5f877                         vzeroupper 
0204b e89038b4ff                     call       0x7febff9c4de0
02050 0f1f84004821002c               nop        dword ptr [rax + rax + 0x2c002148]
02058 beccffffff                     mov        esi, 0xffffffcc
0205d 488b2c24                       mov        rbp, qword ptr [rsp]
02061 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02066 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0206b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02070 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02075 48894424f8                     mov        qword ptr [rsp - 8], rax
0207a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0207e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02082 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02087 48894424f8                     mov        qword ptr [rsp - 8], rax
0208c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02090 89442460                       mov        dword ptr [rsp + 0x60], eax
02094 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02099 48894424f8                     mov        qword ptr [rsp - 8], rax
0209e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020a2 89442464                       mov        dword ptr [rsp + 0x64], eax
020a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ab 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
020b3 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
020bb 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
020c2 6690                           nop        
020c4 c5f877                         vzeroupper 
020c7 e81438b4ff                     call       0x7febff9c4de0
020cc 0f1f8400c421002d               nop        dword ptr [rax + rax + 0x2d0021c4]
020d4 beccffffff                     mov        esi, 0xffffffcc
020d9 488b2c24                       mov        rbp, qword ptr [rsp]
020dd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020e2 4c891424                       mov        qword ptr [rsp], r10
020e6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020eb 44895c2408                     mov        dword ptr [rsp + 8], r11d
020f0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
020f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02104 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02109 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0210e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02113 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02118 48894424f8                     mov        qword ptr [rsp - 8], rax
0211d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02121 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02125 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212a 48894424f8                     mov        qword ptr [rsp - 8], rax
0212f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02133 89442460                       mov        dword ptr [rsp + 0x60], eax
02137 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213c 48894424f8                     mov        qword ptr [rsp - 8], rax
02141 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02145 89442464                       mov        dword ptr [rsp + 0x64], eax
02149 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214e 48894424f8                     mov        qword ptr [rsp - 8], rax
02153 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02157 89442468                       mov        dword ptr [rsp + 0x68], eax
0215b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02160 48894424f8                     mov        qword ptr [rsp - 8], rax
02165 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02169 89442470                       mov        dword ptr [rsp + 0x70], eax
0216d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02172 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02177 90                             nop        
02178 c5f877                         vzeroupper 
0217b e86037b4ff                     call       0x7febff9c4de0
02180 0f1f84007822002e               nop        dword ptr [rax + rax + 0x2e002278]
02188 beccffffff                     mov        esi, 0xffffffcc
0218d 488b2c24                       mov        rbp, qword ptr [rsp]
02191 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02196 4c891424                       mov        qword ptr [rsp], r10
0219a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0219f 44895c2408                     mov        dword ptr [rsp + 8], r11d
021a4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021a9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021b3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021b8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021bd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021c2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021c7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021cc 48894424f8                     mov        qword ptr [rsp - 8], rax
021d1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021d5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021e7 89442460                       mov        dword ptr [rsp + 0x60], eax
021eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f0 48894424f8                     mov        qword ptr [rsp - 8], rax
021f5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021f9 89442464                       mov        dword ptr [rsp + 0x64], eax
021fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02202 48894424f8                     mov        qword ptr [rsp - 8], rax
02207 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0220b 89442468                       mov        dword ptr [rsp + 0x68], eax
0220f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02214 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02219 666690                         nop        
0221c c5f877                         vzeroupper 
0221f e8bc36b4ff                     call       0x7febff9c4de0
02224 0f1f84001c23002f               nop        dword ptr [rax + rax + 0x2f00231c]
0222c eb0e                           jmp        0x7febffe8173c
0222e eb0c                           jmp        0x7febffe8173c
02230 eb0a                           jmp        0x7febffe8173c
02232 eb08                           jmp        0x7febffe8173c
02234 eb06                           jmp        0x7febffe8173c
02236 eb04                           jmp        0x7febffe8173c
02238 eb02                           jmp        0x7febffe8173c
0223a eb00                           jmp        0x7febffe8173c
0223c 488bf0                         mov        rsi, rax
0223f e9f8e3ffff                     jmp        0x7febffe7fb3c
02244 bef6ffffff                     mov        esi, 0xfffffff6
02249 666690                         nop        
0224c c5f877                         vzeroupper 
0224f e88c36b4ff                     call       0x7febff9c4de0
02254 0f1f84004c230030               nop        dword ptr [rax + rax + 0x3000234c]
0225c 49bad602e8ffeb7f0000           movabs     r10, 0x7febffe802d6
02266 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0226d e96eb7a7ff                     jmp        0x7febff8fcee0
02272 e82983a6ff                     call       0x7febff8e9aa0
02277 e9b2ddffff                     jmp        0x7febffe7f52e
0227c f4                             hlt        
0227d f4                             hlt        
0227e f4                             hlt        
0227f f4                             hlt        
