00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0cea8ff                   jne        0x7f4c1b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85702c0000                   jne        0x7f4c1be8572e
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742408                     mov        qword ptr [rsp + 8], rsi
00051 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00055 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00059 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0005e 458bc8                         mov        r9d, r8d
00061 452bca                         sub        r9d, r10d
00064 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
0006b 413bd9                         cmp        ebx, r9d
0006e 0f8fa4240000                   jg         0x7f4c1be84f98
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8f7b240000                   jg         0x7f4c1be84f98
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f8421130000                   je         0x7f4c1be83e54
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7308                       mov        esi, dword ptr [r11 + 8]
000bc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000c1 418b5b44                       mov        ebx, dword ptr [r11 + 0x44]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e1c1e0000                   jle        0x7f4c1be8496c
000d0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d8 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 458b5308                       mov        r10d, dword ptr [r11 + 8]
000ef 4585d2                         test       r10d, r10d
000f2 0f8638240000                   jbe        0x7f4c1be84fb0
000f8 4d63d2                         movsxd     r10, r10d
000fb 4863ff                         movsxd     rdi, edi
000fe 48ffcf                         dec        rdi
00101 493bfa                         cmp        rdi, r10
00104 0f8326240000                   jae        0x7f4c1be84fb0
0010a 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
00112 8b7808                         mov        edi, dword ptr [rax + 8]
00115 85ff                           test       edi, edi
00117 0f867b240000                   jbe        0x7f4c1be85018
0011d 83ff01                         cmp        edi, 1
00120 0f8672240000                   jbe        0x7f4c1be85018
00126 83ff02                         cmp        edi, 2
00129 0f8669240000                   jbe        0x7f4c1be85018
0012f 448d56f1                       lea        r10d, [rsi - 0xf]
00133 4585d2                         test       r10d, r10d
00136 0f8c5c240000                   jl         0x7f4c1be85018
0013c 8b6b08                         mov        ebp, dword ptr [rbx + 8]
0013f 448d55f1                       lea        r10d, [rbp - 0xf]
00143 4585d2                         test       r10d, r10d
00146 0f8c4c240000                   jl         0x7f4c1be85018
0014c 448d55f9                       lea        r10d, [rbp - 7]
00150 4585d2                         test       r10d, r10d
00153 0f8c3f240000                   jl         0x7f4c1be85018
00159 89ac24e8000000                 mov        dword ptr [rsp + 0xe8], ebp
00160 89bc24e4000000                 mov        dword ptr [rsp + 0xe4], edi
00167 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0016b 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00170 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
00177 89542438                       mov        dword ptr [rsp + 0x38], edx
0017b 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00180 4889442458                     mov        qword ptr [rsp + 0x58], rax
00185 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0018a 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0018f 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00194 4c8bd3                         mov        r10, rbx
00197 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0019c 895c2470                       mov        dword ptr [rsp + 0x70], ebx
001a0 448bd5                         mov        r10d, ebp
001a3 448bde                         mov        r11d, esi
001a6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
001ae 4d63da                         movsxd     r11, r10d
001b1 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001b6 448b8424ec000000               mov        r8d, dword ptr [rsp + 0xec]
001be 4183c0f1                       add        r8d, -0xf
001c2 4489442474                     mov        dword ptr [rsp + 0x74], r8d
001c7 4983c3f9                       add        r11, -7
001cb 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001d3 458d5af9                       lea        r11d, [r10 - 7]
001d7 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
001df 4183c2f1                       add        r10d, -0xf
001e3 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
001eb 4533d2                         xor        r10d, r10d
001ee 4533c9                         xor        r9d, r9d
001f1 e9d5030000                     jmp        0x7f4c1be8304b
001f6 458bd5                         mov        r10d, r13d
001f9 4d63d2                         movsxd     r10, r10d
001fc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00203 c442a8f5db                     bzhi       r11, r11, r10
00208 c4c1fb92fb                     kmovq      k7, r11
0020d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00213 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00219 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00221 4503dd                         add        r11d, r13d
00224 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0022c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00230 418502                         test       dword ptr [r10], eax
00233 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0023b 0f8d93090000                   jge        0x7f4c1be83654
00241 8bdd                           mov        ebx, ebp
00243 448bc3                         mov        r8d, ebx
00246 442b842494000000               sub        r8d, dword ptr [rsp + 0x94]
0024e 448bac2490000000               mov        r13d, dword ptr [rsp + 0x90]
00256 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
0025e 443bac2494000000               cmp        r13d, dword ptr [rsp + 0x94]
00266 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0026e 450f4feb                       cmovg      r13d, r11d
00272 4585c0                         test       r8d, r8d
00275 0f8c4d180000                   jl         0x7f4c1be84548
0027b 85db                           test       ebx, ebx
0027d 0f8c45180000                   jl         0x7f4c1be84548
00283 478d1c28                       lea        r11d, [r8 + r13]
00287 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
0028f 453bd3                         cmp        r10d, r11d
00292 0f8230180000                   jb         0x7f4c1be84548
00298 428d2c2b                       lea        ebp, [rbx + r13]
0029c 443bd5                         cmp        r10d, ebp
0029f 0f8223180000                   jb         0x7f4c1be84548
002a5 4585ed                         test       r13d, r13d
002a8 0f8c1a180000                   jl         0x7f4c1be84548
002ae 4585ed                         test       r13d, r13d
002b1 0f8462ffffff                   je         0x7f4c1be82c99
002b7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002bc 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
002c1 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
002c6 4963d5                         movsxd     rdx, r13d
002c9 4883fa20                       cmp        rdx, 0x20
002cd 0f8623ffffff                   jbe        0x7f4c1be82c76
002d3 c5f877                         vzeroupper 
002d6 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
002e0 41ffd2                         call       r10
002e3 0f1f840000000000               nop        dword ptr [rax + rax]
002eb e929ffffff                     jmp        0x7f4c1be82c99
002f0 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
002f8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002fd c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
00304 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0030c 4503d8                         add        r11d, r8d
0030f e991020000                     jmp        0x7f4c1be83025
00314 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00319 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
0031e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00326 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
0032b 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00333 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
0033b 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00343 4d63ca                         movsxd     r9, r10d
00346 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0034e 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00356 0f8c11060000                   jl         0x7f4c1be833ed
0035c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00364 4183fa30                       cmp        r10d, 0x30
00368 0f8e9c000000                   jle        0x7f4c1be82e8a
0036e 4585f6                         test       r14d, r14d
00371 0f8c0d180000                   jl         0x7f4c1be84604
00377 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0037f 4585db                         test       r11d, r11d
00382 0f8cfc170000                   jl         0x7f4c1be84604
00388 478d1c32                       lea        r11d, [r10 + r14]
0038c 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
00394 453bc3                         cmp        r8d, r11d
00397 0f82e7170000                   jb         0x7f4c1be84604
0039d 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
003a5 0f82d9170000                   jb         0x7f4c1be84604
003ab 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
003b3 4585db                         test       r11d, r11d
003b6 0f84d9010000                   je         0x7f4c1be83015
003bc 4963d3                         movsxd     rdx, r11d
003bf 4883fa20                       cmp        rdx, 0x20
003c3 7728                           ja         0x7f4c1be82e6d
003c5 458bd3                         mov        r10d, r11d
003c8 4d63d2                         movsxd     r10, r10d
003cb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003d2 c442a8f5db                     bzhi       r11, r11, r10
003d7 c4c1fb92fb                     kmovq      k7, r11
003dc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003e2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e8 e9a8010000                     jmp        0x7f4c1be83015
003ed c5f877                         vzeroupper 
003f0 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
003fa 41ffd2                         call       r10
003fd 0f1f840000000000               nop        dword ptr [rax + rax]
00405 e98b010000                     jmp        0x7f4c1be83015
0040a 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00412 0f8300140000                   jae        0x7f4c1be84298
00418 4963fe                         movsxd     rdi, r14d
0041b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00420 498b4c3b0c                     mov        rcx, qword ptr [r11 + rdi + 0xc]
00425 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0042d 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00435 0f8385140000                   jae        0x7f4c1be84340
0043b 458d4208                       lea        r8d, [r10 + 8]
0043f 4d63da                         movsxd     r11, r10d
00442 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00446 4a894c1b0c                     mov        qword ptr [rbx + r11 + 0xc], rcx
0044b 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
00453 0f8d3c010000                   jge        0x7f4c1be83015
00459 492bfb                         sub        rdi, r11
0045c 4963c8                         movsxd     rcx, r8d
0045f 4c8d1c39                       lea        r11, [rcx + rdi]
00463 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0046b 0f83ff140000                   jae        0x7f4c1be843f0
00471 4d8bd9                         mov        r11, r9
00474 4c2bd9                         sub        r11, rcx
00477 4983c307                       add        r11, 7
0047b 4983e3f8                       and        r11, 0xfffffffffffffff8
0047f 458bdb                         mov        r11d, r11d
00482 438d4c1308                     lea        ecx, [r11 + r10 + 8]
00487 4c63d9                         movsxd     r11, ecx
0048a 498d4c3bf8                     lea        rcx, [r11 + rdi - 8]
0048f 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
00497 0f83d3140000                   jae        0x7f4c1be843f0
0049d 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
004a5 0f83c5140000                   jae        0x7f4c1be843f0
004ab 4983c3f8                       add        r11, -8
004af 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004b7 0f83b3140000                   jae        0x7f4c1be843f0
004bd 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
004c5 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004cc 0f8f4a150000                   jg         0x7f4c1be8449c
004d2 452bf2                         sub        r14d, r10d
004d5 4183c210                       add        r10d, 0x10
004d9 438d0c06                       lea        ecx, [r14 + r8]
004dd 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
004e1 488b5c0b0c                     mov        rbx, qword ptr [rbx + rcx + 0xc]
004e6 458bd8                         mov        r11d, r8d
004e9 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
004ed 4a895c190c                     mov        qword ptr [rcx + r11 + 0xc], rbx
004f2 4183c008                       add        r8d, 8
004f6 453bc2                         cmp        r8d, r10d
004f9 7cde                           jl         0x7f4c1be82f59
004fb 4983c1f8                       add        r9, -8
004ff 4981f900000080                 cmp        r9, -0x80000000
00506 49c7c200000080                 mov        r10, 0xffffffff80000000
0050d 4d0f4cca                       cmovl      r9, r10
00511 418bc9                         mov        ecx, r9d
00514 443bc1                         cmp        r8d, ecx
00517 7d46                           jge        0x7f4c1be82fdf
00519 0f1f8000000000                 nop        dword ptr [rax]
00520 478d1406                       lea        r10d, [r14 + r8]
00524 458bc8                         mov        r9d, r8d
00527 4963d9                         movsxd     rbx, r9d
0052a 458bda                         mov        r11d, r10d
0052d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00532 4f8b4c190c                     mov        r9, qword ptr [r9 + r11 + 0xc]
00537 4963fa                         movsxd     rdi, r10d
0053a 458bd8                         mov        r11d, r8d
0053d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00542 4f894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], r9
00547 4d8b543a14                     mov        r10, qword ptr [r10 + rdi + 0x14]
0054c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00551 4d89541b14                     mov        qword ptr [r11 + rbx + 0x14], r10
00556 4183c010                       add        r8d, 0x10
0055a 443bc1                         cmp        r8d, ecx
0055d 7cc1                           jl         0x7f4c1be82fa0
0055f 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
00567 7d2c                           jge        0x7f4c1be83015
00569 666690                         nop        
0056c 478d1406                       lea        r10d, [r14 + r8]
00570 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00575 4f8b4c110c                     mov        r9, qword ptr [r9 + r10 + 0xc]
0057a 458bd0                         mov        r10d, r8d
0057d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00582 4f894c130c                     mov        qword ptr [r11 + r10 + 0xc], r9
00587 4183c008                       add        r8d, 8
0058b 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
00593 7cd7                           jl         0x7f4c1be82fec
00595 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0059d 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
005a5 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
005ad 41ffc1                         inc        r9d
005b0 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
005b5 0f8d270a0000                   jge        0x7f4c1be83a62
005bb 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
005c3 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
005cb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
005d0 4b8b4ccb10                     mov        rcx, qword ptr [r11 + r9*8 + 0x10]
005d5 4c8bd9                         mov        r11, rcx
005d8 49c1eb12                       shr        r11, 0x12
005dc 458bc3                         mov        r8d, r11d
005df 4181e0ffff0300                 and        r8d, 0x3ffff
005e6 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
005ee 448bd9                         mov        r11d, ecx
005f1 48c1f924                       sar        rcx, 0x24
005f5 4181e3ffff0100                 and        r11d, 0x1ffff
005fc 418bc3                         mov        eax, r11d
005ff 448bd9                         mov        r11d, ecx
00602 418bfb                         mov        edi, r11d
00605 4585db                         test       r11d, r11d
00608 0f8cde0f0000                   jl         0x7f4c1be8406c
0060e 448bc0                         mov        r8d, eax
00611 4585c0                         test       r8d, r8d
00614 0f8542020000                   jne        0x7f4c1be832dc
0061a 4533db                         xor        r11d, r11d
0061d 418bc3                         mov        eax, r11d
00620 448bdf                         mov        r11d, edi
00623 4183fb03                       cmp        r11d, 3
00627 0f8e88020000                   jle        0x7f4c1be83335
0062d 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00632 458b5b10                       mov        r11d, dword ptr [r11 + 0x10]
00636 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0063b 45895814                       mov        dword ptr [r8 + 0x14], r11d
0063f 458b400c                       mov        r8d, dword ptr [r8 + 0xc]
00643 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00648 45894310                       mov        dword ptr [r11 + 0x10], r8d
0064c 448d5ffd                       lea        r11d, [rdi - 3]
00650 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00658 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0065d 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00661 44898c24bc000000               mov        dword ptr [rsp + 0xbc], r9d
00669 48639c2494000000               movsxd     rbx, dword ptr [rsp + 0x94]
00671 488beb                         mov        rbp, rbx
00674 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
0067c 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00681 4863d0                         movsxd     rdx, eax
00684 4c03c2                         add        r8, rdx
00687 493bd8                         cmp        rbx, r8
0068a 0f8ff00f0000                   jg         0x7f4c1be84100
00690 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00698 4403e8                         add        r13d, eax
0069b 458bf5                         mov        r14d, r13d
0069e 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
006a6 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006ab 4585c9                         test       r9d, r9d
006ae 0f84d8010000                   je         0x7f4c1be8330c
006b4 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
006bc 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
006c4 4585db                         test       r11d, r11d
006c7 0f8efb0e0000                   jle        0x7f4c1be84048
006cd 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
006d5 4503c5                         add        r8d, r13d
006d8 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
006dd 0f8f15100000                   jg         0x7f4c1be84178
006e3 458d0402                       lea        r8d, [r10 + rax]
006e7 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
006ef 443b442460                     cmp        r8d, dword ptr [rsp + 0x60]
006f4 0f8f9a100000                   jg         0x7f4c1be84214
006fa 83f810                         cmp        eax, 0x10
006fd 0f8fde040000                   jg         0x7f4c1be83661
00703 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00708 0f83e50c0000                   jae        0x7f4c1be83e73
0070e 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00713 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
0071a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00722 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0072a 0f83680d0000                   jae        0x7f4c1be83f18
00730 468d0c10                       lea        r9d, [rax + r10]
00734 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
0073c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00741 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00748 468d1418                       lea        r10d, [rax + r11]
0074c 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00754 458bf2                         mov        r14d, r10d
00757 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
0075f 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00767 4183fb10                       cmp        r11d, 0x10
0076b 0f8fa3fbffff                   jg         0x7f4c1be82d94
00771 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00779 4183fa10                       cmp        r10d, 0x10
0077d 0f8c91fbffff                   jl         0x7f4c1be82d94
00783 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
0078b 0f83af0d0000                   jae        0x7f4c1be83fc0
00791 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00796 c4817a6f44330c                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 0xc]
0079d 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
007a5 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
007ad 0f823dfbffff                   jb         0x7f4c1be82d70
007b3 bee4ffffff                     mov        esi, 0xffffffe4
007b8 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
007bd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007c2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
007ca 448b1c24                       mov        r11d, dword ptr [rsp]
007ce 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
007d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007db 4c891424                       mov        qword ptr [rsp], r10
007df 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
007e4 4c89542408                     mov        qword ptr [rsp + 8], r10
007e9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
007ee 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
007f6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
007fb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00800 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00805 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0080a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0080f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00814 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00819 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0081e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00823 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00828 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0082d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00832 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00837 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0083c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00841 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00846 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0084c c5f877                         vzeroupper 
0084f e88c4ab5ff                     call       0x7f4c1b9d7d60
00854 0f1f84004c090001               nop        dword ptr [rax + rax + 0x100094c]
0085c 448b1c24                       mov        r11d, dword ptr [rsp]
00860 452bda                         sub        r11d, r10d
00863 453bc3                         cmp        r8d, r11d
00866 0f8eb4fdffff                   jle        0x7f4c1be830a0
0086c be45ffffff                     mov        esi, 0xffffff45
00871 418be8                         mov        ebp, r8d
00874 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0087c c5f877                         vzeroupper 
0087f e85c4ab5ff                     call       0x7f4c1b9d7d60
00884 0f1f84007c090002               nop        dword ptr [rax + rax + 0x200097c]
0088c 4d63de                         movsxd     r11, r14d
0088f 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
00894 0f8c92130000                   jl         0x7f4c1be846ac
0089a 483b5c2448                     cmp        rbx, qword ptr [rsp + 0x48]
0089f 0f8f17140000                   jg         0x7f4c1be8473c
008a5 4533c9                         xor        r9d, r9d
008a8 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
008b0 e907feffff                     jmp        0x7f4c1be8313c
008b5 85c0                           test       eax, eax
008b7 7407                           je         0x7f4c1be83340
008b9 448d5fff                       lea        r11d, [rdi - 1]
008bd 418bfb                         mov        edi, r11d
008c0 85ff                           test       edi, edi
008c2 7516                           jne        0x7f4c1be8335a
008c4 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
008c9 418b5b0c                       mov        ebx, dword ptr [r11 + 0xc]
008cd 44898c24bc000000               mov        dword ptr [rsp + 0xbc], r9d
008d5 e987000000                     jmp        0x7f4c1be833e1
008da 83ff03                         cmp        edi, 3
008dd 0f84d5160000                   je         0x7f4c1be84a38
008e3 83ff02                         cmp        edi, 2
008e6 0f876c170000                   ja         0x7f4c1be84ad8
008ec 3bbc24e4000000                 cmp        edi, dword ptr [rsp + 0xe4]
008f3 0f833b150000                   jae        0x7f4c1be848b4
008f9 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008fe 418b5cb80c                     mov        ebx, dword ptr [r8 + rdi*4 + 0xc]
00903 85ff                           test       edi, edi
00905 7e49                           jle        0x7f4c1be833d0
00907 448d47ff                       lea        r8d, [rdi - 1]
0090b 443b8424e4000000               cmp        r8d, dword ptr [rsp + 0xe4]
00913 0f83ed150000                   jae        0x7f4c1be84986
00919 44898c24bc000000               mov        dword ptr [rsp + 0xbc], r9d
00921 0f1f840000000000               nop        dword ptr [rax + rax]
00929 0f1f8000000000                 nop        dword ptr [rax]
00930 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
00935 458b5cb808                     mov        r11d, dword ptr [r8 + rdi*4 + 8]
0093a 4d8bc8                         mov        r9, r8
0093d 45895cb90c                     mov        dword ptr [r9 + rdi*4 + 0xc], r11d
00942 448d5fff                       lea        r11d, [rdi - 1]
00946 418bfb                         mov        edi, r11d
00949 4585db                         test       r11d, r11d
0094c 7fe2                           jg         0x7f4c1be833b0
0094e eb08                           jmp        0x7f4c1be833d8
00950 44898c24bc000000               mov        dword ptr [rsp + 0xbc], r9d
00958 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0095d 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
00961 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00968 e9fcfcffff                     jmp        0x7f4c1be830e9
0096d 4183fb10                       cmp        r11d, 0x10
00971 0f8d211b0000                   jge        0x7f4c1be84f18
00977 4183fb08                       cmp        r11d, 8
0097b 0f8d11070000                   jge        0x7f4c1be83b12
00981 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00989 4183fb10                       cmp        r11d, 0x10
0098d 0f8eac000000                   jle        0x7f4c1be834bf
00993 4585f6                         test       r14d, r14d
00996 0f8c541a0000                   jl         0x7f4c1be84e70
0099c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
009a4 4585d2                         test       r10d, r10d
009a7 0f8c431a0000                   jl         0x7f4c1be84e70
009ad 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
009b5 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
009bd 0f822d1a0000                   jb         0x7f4c1be84e70
009c3 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
009ca 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
009d1 443bdb                         cmp        r11d, ebx
009d4 0f82161a0000                   jb         0x7f4c1be84e70
009da 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009e2 4585db                         test       r11d, r11d
009e5 0f8c051a0000                   jl         0x7f4c1be84e70
009eb 4585db                         test       r11d, r11d
009ee 0f844ff8ffff                   je         0x7f4c1be82cc3
009f4 4883fd20                       cmp        rbp, 0x20
009f8 7725                           ja         0x7f4c1be8349f
009fa 4d63d3                         movsxd     r10, r11d
009fd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a04 c442a8f5db                     bzhi       r11, r11, r10
00a09 c4c1fb92fb                     kmovq      k7, r11
00a0e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a14 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a1a e924f8ffff                     jmp        0x7f4c1be82cc3
00a1f 488bd5                         mov        rdx, rbp
00a22 c5f877                         vzeroupper 
00a25 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00a2f 41ffd2                         call       r10
00a32 0f1f840000000000               nop        dword ptr [rax + rax]
00a3a e904f8ffff                     jmp        0x7f4c1be82cc3
00a3f 443bb424e8000000               cmp        r14d, dword ptr [rsp + 0xe8]
00a47 0f83ab160000                   jae        0x7f4c1be84b78
00a4d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00a52 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
00a58 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a60 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a68 0f8332170000                   jae        0x7f4c1be84c20
00a6e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00a73 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a7b 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00a80 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a88 41ffc0                         inc        r8d
00a8b 458d5603                       lea        r10d, [r14 + 3]
00a8f 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a97 0f8393170000                   jae        0x7f4c1be84cb0
00a9d 4d63ce                         movsxd     r9, r14d
00aa0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00aa5 430fbe6c0b0d                   movsx      ebp, byte ptr [r11 + r9 + 0xd]
00aab 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ab3 4183c303                       add        r11d, 3
00ab7 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00abf 0f8303180000                   jae        0x7f4c1be84d48
00ac5 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
00acd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ad2 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00ad7 470fbe5c0a0e                   movsx      r11d, byte ptr [r10 + r9 + 0xe]
00add 47885c020e                     mov        byte ptr [r10 + r8 + 0xe], r11b
00ae2 470fbe540a0f                   movsx      r10d, byte ptr [r10 + r9 + 0xf]
00ae8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00aed 478854030f                     mov        byte ptr [r11 + r8 + 0xf], r10b
00af2 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00afa 4183fb08                       cmp        r11d, 8
00afe 0f8358180000                   jae        0x7f4c1be84ddc
00b04 49bbe0df2fe300000000           movabs     r11, 0xe32fdfe0
00b0e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00b16 470374930c                     add        r14d, dword ptr [r11 + r10*4 + 0xc]
00b1b 4489742404                     mov        dword ptr [rsp + 4], r14d
00b20 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00b28 4183fa04                       cmp        r10d, 4
00b2c 7e3e                           jle        0x7f4c1be835ec
00b2e 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b35 83c504                         add        ebp, 4
00b38 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b3d 418bd6                         mov        edx, r14d
00b40 c5f877                         vzeroupper 
00b43 e898d2a8ff                     call       0x7f4c1b910860
00b48 0f1f8400400c0003               nop        dword ptr [rax + rax + 0x3000c40]
00b50 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b55 8bd5                           mov        edx, ebp
00b57 8bc8                           mov        ecx, eax
00b59 488bee                         mov        rbp, rsi
00b5c c5f877                         vzeroupper 
00b5f e87cd2a8ff                     call       0x7f4c1b910860
00b64 0f1f84005c0c0004               nop        dword ptr [rax + rax + 0x4000c5c]
00b6c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00b74 4183fb08                       cmp        r11d, 8
00b78 7e5a                           jle        0x7f4c1be83654
00b7a 8b542404                       mov        edx, dword ptr [rsp + 4]
00b7e 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00b88 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b90 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00b95 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b9c 83c508                         add        ebp, 8
00b9f 83c208                         add        edx, 8
00ba2 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00ba7 90                             nop        
00ba8 c5f877                         vzeroupper 
00bab e830d2a8ff                     call       0x7f4c1b910860
00bb0 0f1f8400a80c0005               nop        dword ptr [rax + rax + 0x5000ca8]
00bb8 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00bbd 8bd5                           mov        edx, ebp
00bbf 488bc8                         mov        rcx, rax
00bc2 6690                           nop        
00bc4 c5f877                         vzeroupper 
00bc7 e814d2a8ff                     call       0x7f4c1b910860
00bcc 0f1f8400c40c0006               nop        dword ptr [rax + rax + 0x6000cc4]
00bd4 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00bdc e9c4f9ffff                     jmp        0x7f4c1be83025
00be1 83f830                         cmp        eax, 0x30
00be4 0f8ea9000000                   jle        0x7f4c1be83713
00bea 4585d2                         test       r10d, r10d
00bed 0f8cc91b0000                   jl         0x7f4c1be8523c
00bf3 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00bfb 4585db                         test       r11d, r11d
00bfe 0f8cc01b0000                   jl         0x7f4c1be85244
00c04 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00c0c 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00c14 0f82aa1b0000                   jb         0x7f4c1be85244
00c1a 448b8c24e8000000               mov        r9d, dword ptr [rsp + 0xe8]
00c22 453bcd                         cmp        r9d, r13d
00c25 0f82991b0000                   jb         0x7f4c1be85244
00c2b 85c0                           test       eax, eax
00c2d 743d                           je         0x7f4c1be836ec
00c2f 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00c34 4b8d7c100c                     lea        rdi, [r8 + r10 + 0xc]
00c39 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00c3e 4b8d74180c                     lea        rsi, [r8 + r11 + 0xc]
00c43 4883fa20                       cmp        rdx, 0x20
00c47 7730                           ja         0x7f4c1be836f9
00c49 448bd0                         mov        r10d, eax
00c4c 4d63d2                         movsxd     r10, r10d
00c4f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c56 c442a8f5db                     bzhi       r11, r11, r10
00c5b c4c1fb92fb                     kmovq      k7, r11
00c60 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c66 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c6c 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00c74 e9e6faffff                     jmp        0x7f4c1be831df
00c79 c5f877                         vzeroupper 
00c7c 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00c86 41ffd2                         call       r10
00c89 0f1f840000000000               nop        dword ptr [rax + rax]
00c91 ebd9                           jmp        0x7f4c1be836ec
00c93 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00c98 0f83be190000                   jae        0x7f4c1be850dc
00c9e 4963ca                         movsxd     rcx, r10d
00ca1 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ca6 c4c17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xc]
00cad 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00cb5 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00cbd 0f83451a0000                   jae        0x7f4c1be85188
00cc3 4d63c1                         movsxd     r8, r9d
00cc6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ccb c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00cd2 458d5910                       lea        r11d, [r9 + 0x10]
00cd6 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00cde 453bdd                         cmp        r11d, r13d
00ce1 0f8dbd020000                   jge        0x7f4c1be83a24
00ce7 492bc8                         sub        rcx, r8
00cea 4d63c3                         movsxd     r8, r11d
00ced 4863bc24ec000000               movsxd     rdi, dword ptr [rsp + 0xec]
00cf5 4883c7f1                       add        rdi, -0xf
00cf9 498d1c08                       lea        rbx, [r8 + rcx]
00cfd 483bdf                         cmp        rbx, rdi
00d00 0f83721b0000                   jae        0x7f4c1be852f8
00d06 4963dd                         movsxd     rbx, r13d
00d09 488bd3                         mov        rdx, rbx
00d0c 492bd0                         sub        rdx, r8
00d0f 4883c20f                       add        rdx, 0xf
00d13 4883e2f0                       and        rdx, 0xfffffffffffffff0
00d17 448bc2                         mov        r8d, edx
00d1a 478d440810                     lea        r8d, [r8 + r9 + 0x10]
00d1f 4d63c0                         movsxd     r8, r8d
00d22 498d4c08f0                     lea        rcx, [r8 + rcx - 0x10]
00d27 483bcf                         cmp        rcx, rdi
00d2a 0f83481b0000                   jae        0x7f4c1be852f8
00d30 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00d38 0f833a1b0000                   jae        0x7f4c1be852f8
00d3e 4983c0f0                       add        r8, -0x10
00d42 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d47 4983c3f1                       add        r11, -0xf
00d4b 4d3bc3                         cmp        r8, r11
00d4e 0f83241b0000                   jae        0x7f4c1be852f8
00d54 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d5b 0f8fb71b0000                   jg         0x7f4c1be85398
00d61 418bca                         mov        ecx, r10d
00d64 412bc9                         sub        ecx, r9d
00d67 4183c120                       add        r9d, 0x20
00d6b 90                             nop        
00d6c 448bc1                         mov        r8d, ecx
00d6f 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00d77 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00d7c c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00d83 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d8b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00d90 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00d97 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d9f 4183c310                       add        r11d, 0x10
00da3 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00dab 453bd9                         cmp        r11d, r9d
00dae 7cbc                           jl         0x7f4c1be837ec
00db0 4881c310ffffff                 add        rbx, -0xf0
00db7 4881fb00000080                 cmp        rbx, -0x80000000
00dbe 49c7c000000080                 mov        r8, 0xffffffff80000000
00dc5 490f4cd8                       cmovl      rbx, r8
00dc9 8bfb                           mov        edi, ebx
00dcb 443bdf                         cmp        r11d, edi
00dce 0f8d92010000                   jge        0x7f4c1be839e6
00dd4 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00ddc 0f1f4000                       nop        dword ptr [rax]
00de0 448bc1                         mov        r8d, ecx
00de3 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00deb 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00df3 4963d9                         movsxd     rbx, r9d
00df6 458bd8                         mov        r11d, r8d
00df9 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
00dfe c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
00e05 4963d0                         movsxd     rdx, r8d
00e08 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00e10 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00e15 c4817a7f44010c                 vmovdqu    xmmword ptr [r9 + r8 + 0xc], xmm0
00e1c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e21 c4c17a6f44131c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x1c]
00e28 c4c17a7f44191c                 vmovdqu    xmmword ptr [r9 + rbx + 0x1c], xmm0
00e2f 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e34 c4c17a6f44132c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x2c]
00e3b c4c17a7f44192c                 vmovdqu    xmmword ptr [r9 + rbx + 0x2c], xmm0
00e42 c4c17a6f44133c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x3c]
00e49 c4c17a7f44193c                 vmovdqu    xmmword ptr [r9 + rbx + 0x3c], xmm0
00e50 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e55 c4c17a6f44134c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x4c]
00e5c c4c17a7f44194c                 vmovdqu    xmmword ptr [r9 + rbx + 0x4c], xmm0
00e63 c4c17a6f44135c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x5c]
00e6a c4c17a7f44195c                 vmovdqu    xmmword ptr [r9 + rbx + 0x5c], xmm0
00e71 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e76 c4c17a6f44136c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x6c]
00e7d c4c17a7f44196c                 vmovdqu    xmmword ptr [r9 + rbx + 0x6c], xmm0
00e84 c4c17a6f44137c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x7c]
00e8b c4c17a7f44197c                 vmovdqu    xmmword ptr [r9 + rbx + 0x7c], xmm0
00e92 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e97 c4c17a6f84138c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x8c]
00ea1 c4c17a7f84198c000000           vmovdqu    xmmword ptr [r9 + rbx + 0x8c], xmm0
00eab c4c17a6f84139c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x9c]
00eb5 c4c17a7f84199c000000           vmovdqu    xmmword ptr [r9 + rbx + 0x9c], xmm0
00ebf 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ec4 c4c17a6f8413ac000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xac]
00ece c4c17a7f8419ac000000           vmovdqu    xmmword ptr [r9 + rbx + 0xac], xmm0
00ed8 c4c17a6f8413bc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xbc]
00ee2 c4c17a7f8419bc000000           vmovdqu    xmmword ptr [r9 + rbx + 0xbc], xmm0
00eec 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ef1 c4c17a6f8413cc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xcc]
00efb c4c17a7f8419cc000000           vmovdqu    xmmword ptr [r9 + rbx + 0xcc], xmm0
00f05 c4c17a6f8413dc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xdc]
00f0f c4c17a7f8419dc000000           vmovdqu    xmmword ptr [r9 + rbx + 0xdc], xmm0
00f19 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00f1e c4c17a6f8413ec000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xec]
00f28 c4c17a7f8419ec000000           vmovdqu    xmmword ptr [r9 + rbx + 0xec], xmm0
00f32 c4c17a6f8413fc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xfc]
00f3c c4c17a7f8419fc000000           vmovdqu    xmmword ptr [r9 + rbx + 0xfc], xmm0
00f46 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f4e 4181c300010000                 add        r11d, 0x100
00f55 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f5d 443bdf                         cmp        r11d, edi
00f60 0f8c7afeffff                   jl         0x7f4c1be83860
00f66 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f6e 453bdd                         cmp        r11d, r13d
00f71 7d31                           jge        0x7f4c1be83a24
00f73 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00f7b 90                             nop        
00f7c 468d1c01                       lea        r11d, [rcx + r8]
00f80 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
00f85 c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
00f8c 458bd8                         mov        r11d, r8d
00f8f 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00f94 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
00f9b 4183c010                       add        r8d, 0x10
00f9f 453bc5                         cmp        r8d, r13d
00fa2 7cd8                           jl         0x7f4c1be839fc
00fa4 468d1c10                       lea        r11d, [rax + r10]
00fa8 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00fb0 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00fb8 e9a2f7ffff                     jmp        0x7f4c1be831df
00fbd 4d63d0                         movsxd     r10, r8d
00fc0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00fc7 c442a8f5db                     bzhi       r11, r11, r10
00fcc c4c1fb92fb                     kmovq      k7, r11
00fd1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00fd7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00fdd e991000000                     jmp        0x7f4c1be83af3
00fe2 448b1424                       mov        r10d, dword ptr [rsp]
00fe6 458bc2                         mov        r8d, r10d
00fe9 442b842498000000               sub        r8d, dword ptr [rsp + 0x98]
00ff1 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ff9 4585d2                         test       r10d, r10d
00ffc 0f8c1a160000                   jl         0x7f4c1be8509c
01002 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
01007 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
0100e 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01012 4585db                         test       r11d, r11d
01015 0f8c0a160000                   jl         0x7f4c1be850a5
0101b 3b3424                         cmp        esi, dword ptr [rsp]
0101e 0f8201160000                   jb         0x7f4c1be850a5
01024 8b4b08                         mov        ecx, dword ptr [rbx + 8]
01027 438d2c03                       lea        ebp, [r11 + r8]
0102b 3bcd                           cmp        ecx, ebp
0102d 0f82f2150000                   jb         0x7f4c1be850a5
01033 4585c0                         test       r8d, r8d
01036 0f8ce9150000                   jl         0x7f4c1be850a5
0103c 4585c0                         test       r8d, r8d
0103f 7432                           je         0x7f4c1be83af3
01041 4b8d7c160c                     lea        rdi, [r14 + r10 + 0xc]
01046 4c8bd3                         mov        r10, rbx
01049 4a8d741b0c                     lea        rsi, [rbx + r11 + 0xc]
0104e 4963d0                         movsxd     rdx, r8d
01051 4883fa20                       cmp        rdx, 0x20
01055 0f8662ffffff                   jbe        0x7f4c1be83a3d
0105b c5f877                         vzeroupper 
0105e 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
01068 41ffd2                         call       r10
0106b 0f1f840000000000               nop        dword ptr [rax + rax]
01073 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01078 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
0107c c5f877                         vzeroupper 
0107f 4881c4d0000000                 add        rsp, 0xd0
01086 5d                             pop        rbp
01087 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0108b 0f87071c0000                   ja         0x7f4c1be85718
01091 c3                             ret        
01092 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
0109a 0f831c190000                   jae        0x7f4c1be8543c
010a0 418bce                         mov        ecx, r14d
010a3 4863d1                         movsxd     rdx, ecx
010a6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
010ab 4d8b44130c                     mov        r8, qword ptr [r11 + rdx + 0xc]
010b0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
010b8 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
010c0 0f839e190000                   jae        0x7f4c1be854e4
010c6 8bbc249c000000                 mov        edi, dword ptr [rsp + 0x9c]
010cd 8d5f08                         lea        ebx, [rdi + 8]
010d0 4c63df                         movsxd     r11, edi
010d3 8b742470                       mov        esi, dword ptr [rsp + 0x70]
010d7 4e89441e0c                     mov        qword ptr [rsi + r11 + 0xc], r8
010dc 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
010e3 0f8dde020000                   jge        0x7f4c1be83e47
010e9 492bd3                         sub        rdx, r11
010ec 4863c3                         movsxd     rax, ebx
010ef 4c8d1c10                       lea        r11, [rax + rdx]
010f3 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
010fb 0f83071a0000                   jae        0x7f4c1be85588
01101 4d8bd9                         mov        r11, r9
01104 4c2bd8                         sub        r11, rax
01107 4983c307                       add        r11, 7
0110b 4983e3f8                       and        r11, 0xfffffffffffffff8
0110f 458bc3                         mov        r8d, r11d
01112 458d5c3808                     lea        r11d, [r8 + rdi + 8]
01117 4d63db                         movsxd     r11, r11d
0111a 4d8d4413f8                     lea        r8, [r11 + rdx - 8]
0111f 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
01127 0f83db190000                   jae        0x7f4c1be85588
0112d 3b9c2488000000                 cmp        ebx, dword ptr [rsp + 0x88]
01134 0f83ce190000                   jae        0x7f4c1be85588
0113a 4983c3f8                       add        r11, -8
0113e 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01146 0f83bc190000                   jae        0x7f4c1be85588
0114c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01154 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
0115b 0f8f431a0000                   jg         0x7f4c1be85624
01161 2bcf                           sub        ecx, edi
01163 448be9                         mov        r13d, ecx
01166 41baf4ffffff                   mov        r10d, 0xfffffff4
0116c 4d8d59c8                       lea        r11, [r9 - 0x38]
01170 4981fb00000080                 cmp        r11, -0x80000000
01177 49c7c000000080                 mov        r8, 0xffffffff80000000
0117e 4d0f4cd8                       cmovl      r11, r8
01182 418bcb                         mov        ecx, r11d
01185 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
0118d 8d5710                         lea        edx, [rdi + 0x10]
01190 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01195 4d8bc3                         mov        r8, r11
01198 4863ea                         movsxd     rbp, edx
0119b 8bf6                           mov        esi, esi
0119d 442bd6                         sub        r10d, esi
011a0 442bd7                         sub        r10d, edi
011a3 4183c2f0                       add        r10d, -0x10
011a7 41bb06000000                   mov        r11d, 6
011ad c442a0f5d2                     bzhi       r10, r10, r11
011b2 4903ea                         add        rbp, r10
011b5 493be9                         cmp        rbp, r9
011b8 4d8bd9                         mov        r11, r9
011bb 4c0f4cdd                       cmovl      r11, rbp
011bf 4d8bd3                         mov        r10, r11
011c2 4c2bd0                         sub        r10, rax
011c5 498d7aff                       lea        rdi, [r10 - 1]
011c9 48c1ff3f                       sar        rdi, 0x3f
011cd 48c1ef3d                       shr        rdi, 0x3d
011d1 4e8d5417ff                     lea        r10, [rdi + r10 - 1]
011d6 4983e2f8                       and        r10, 0xfffffffffffffff8
011da 4c03d0                         add        r10, rax
011dd 493bc2                         cmp        rax, r10
011e0 490f4cc2                       cmovl      rax, r10
011e4 8bf8                           mov        edi, eax
011e6 458d543e08                     lea        r10d, [r14 + rdi + 8]
011eb 83c708                         add        edi, 8
011ee 4963f2                         movsxd     rsi, r10d
011f1 4903f0                         add        rsi, r8
011f4 4863ff                         movsxd     rdi, edi
011f7 4903f8                         add        rdi, r8
011fa 4c8d460c                       lea        r8, [rsi + 0xc]
011fe 4883c64c                       add        rsi, 0x4c
01202 488d474c                       lea        rax, [rdi + 0x4c]
01206 4533d2                         xor        r10d, r10d
01209 493bc0                         cmp        rax, r8
0120c 410f96c2                       setbe      r10b
01210 4883c70c                       add        rdi, 0xc
01214 4533c0                         xor        r8d, r8d
01217 483bf7                         cmp        rsi, rdi
0121a 410f96c0                       setbe      r8b
0121e 450bd0                         or         r10d, r8d
01221 0f84250b0000                   je         0x7f4c1be847cc
01227 418bf3                         mov        esi, r11d
0122a 6690                           nop        
0122c 448bdb                         mov        r11d, ebx
0122f 468d142b                       lea        r10d, [rbx + r13]
01233 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01237 4e8b54170c                     mov        r10, qword ptr [rdi + r10 + 0xc]
0123c 4e89541f0c                     mov        qword ptr [rdi + r11 + 0xc], r10
01241 83c308                         add        ebx, 8
01244 3bde                           cmp        ebx, esi
01246 7ce4                           jl         0x7f4c1be83cac
01248 4981c108feffff                 add        r9, -0x1f8
0124f 4981f900000080                 cmp        r9, -0x80000000
01256 49c7c200000080                 mov        r10, 0xffffffff80000000
0125d 4d0f4cca                       cmovl      r9, r10
01261 458bc1                         mov        r8d, r9d
01264 413bd8                         cmp        ebx, r8d
01267 0f8d28010000                   jge        0x7f4c1be83e15
0126d 666690                         nop        
01270 448bdb                         mov        r11d, ebx
01273 4963fb                         movsxd     rdi, r11d
01276 448bd3                         mov        r10d, ebx
01279 428d342b                       lea        esi, [rbx + r13]
0127d 448d5b40                       lea        r11d, [rbx + 0x40]
01281 4503dd                         add        r11d, r13d
01284 448bce                         mov        r9d, esi
01287 8b542470                       mov        edx, dword ptr [rsp + 0x70]
0128b 62b17e486f840a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 0xc]
01296 62b17e487f84120c000000         vmovdqu32  zmmword ptr [rdx + r10 + 0xc], zmm0
012a1 62b17e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r11 + 0xc]
012ac 62f17e487f843a4c000000         vmovdqu32  zmmword ptr [rdx + rdi + 0x4c], zmm0
012b7 4c63ce                         movsxd     r9, esi
012ba 448d9380000000                 lea        r10d, [rbx + 0x80]
012c1 4503d5                         add        r10d, r13d
012c4 62b17e486f84120c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0xc]
012cf 62f17e487f843a8c000000         vmovdqu32  zmmword ptr [rdx + rdi + 0x8c], zmm0
012da 62b17e486f840acc000000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 0xcc]
012e5 62f17e487f843acc000000         vmovdqu32  zmmword ptr [rdx + rdi + 0xcc], zmm0
012f0 448d9b00010000                 lea        r11d, [rbx + 0x100]
012f7 4503dd                         add        r11d, r13d
012fa 418bf3                         mov        esi, r11d
012fd 62b17e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r11 + 0xc]
01308 62f17e487f843a0c010000         vmovdqu32  zmmword ptr [rdx + rdi + 0x10c], zmm0
01313 62b17e486f840a4c010000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 0x14c]
0131e 62f17e487f843a4c010000         vmovdqu32  zmmword ptr [rdx + rdi + 0x14c], zmm0
01329 62b17e486f840a8c010000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 0x18c]
01334 62f17e487f843a8c010000         vmovdqu32  zmmword ptr [rdx + rdi + 0x18c], zmm0
0133f 4c63d6                         movsxd     r10, esi
01342 62b17e486f8412cc000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0xcc]
0134d 62f17e487f843acc010000         vmovdqu32  zmmword ptr [rdx + rdi + 0x1cc], zmm0
01358 81c300020000                   add        ebx, 0x200
0135e 413bd8                         cmp        ebx, r8d
01361 0f8c09ffffff                   jl         0x7f4c1be83cf0
01367 3bd9                           cmp        ebx, ecx
01369 7d2a                           jge        0x7f4c1be83e15
0136b 90                             nop        
0136c 468d1c2b                       lea        r11d, [rbx + r13]
01370 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01375 62917e486f84180c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0xc]
01380 448bdb                         mov        r11d, ebx
01383 62917e487f84180c000000         vmovdqu32  zmmword ptr [r8 + r11 + 0xc], zmm0
0138e 83c340                         add        ebx, 0x40
01391 3bd9                           cmp        ebx, ecx
01393 7cd7                           jl         0x7f4c1be83dec
01395 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
0139c 7d29                           jge        0x7f4c1be83e47
0139e 6690                           nop        
013a0 468d1c2b                       lea        r11d, [rbx + r13]
013a4 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
013a9 4f8b54180c                     mov        r10, qword ptr [r8 + r11 + 0xc]
013ae 448bc3                         mov        r8d, ebx
013b1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
013b6 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
013bb 83c308                         add        ebx, 8
013be 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
013c5 7cd9                           jl         0x7f4c1be83e20
013c7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
013cf e9d1f1ffff                     jmp        0x7f4c1be83025
013d4 4c03c9                         add        r9, rcx
013d7 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
013dc 7e08                           jle        0x7f4c1be83e66
013de 4533c0                         xor        r8d, r8d
013e1 e9cdecffff                     jmp        0x7f4c1be82b33
013e6 4533c0                         xor        r8d, r8d
013e9 ba01000000                     mov        edx, 1
013ee e9c2ecffff                     jmp        0x7f4c1be82b35
013f3 bee4ffffff                     mov        esi, 0xffffffe4
013f8 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
013fd 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01402 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0140a 448b1c24                       mov        r11d, dword ptr [rsp]
0140e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01416 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0141b 4c891c24                       mov        qword ptr [rsp], r11
0141f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01424 4c895c2408                     mov        qword ptr [rsp + 8], r11
01429 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0142e 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01436 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0143b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01440 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01445 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0144a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0144f 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01454 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01459 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
0145e 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01463 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01468 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0146d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01472 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01477 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0147c 89442450                       mov        dword ptr [rsp + 0x50], eax
01480 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01485 666690                         nop        
01488 c5f877                         vzeroupper 
0148b e8503eb5ff                     call       0x7f4c1b9d7d60
01490 0f1f840088150007               nop        dword ptr [rax + rax + 0x7001588]
01498 bee4ffffff                     mov        esi, 0xffffffe4
0149d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014a2 448b0c24                       mov        r9d, dword ptr [rsp]
014a6 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
014ae 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014b3 4c890424                       mov        qword ptr [rsp], r8
014b7 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
014bc 4c89442408                     mov        qword ptr [rsp + 8], r8
014c1 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
014c6 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
014ce 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
014d3 4c89442410                     mov        qword ptr [rsp + 0x10], r8
014d8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
014dd 4489442418                     mov        dword ptr [rsp + 0x18], r8d
014e2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014e7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
014ec 4489542424                     mov        dword ptr [rsp + 0x24], r10d
014f1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014f6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014fb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01500 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01505 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0150a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0150f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01514 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01519 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0151e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01523 89442450                       mov        dword ptr [rsp + 0x50], eax
01527 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
0152d 666690                         nop        
01530 c5f877                         vzeroupper 
01533 e8a83db5ff                     call       0x7f4c1b9d7d60
01538 0f1f840030160008               nop        dword ptr [rax + rax + 0x8001630]
01540 bee4ffffff                     mov        esi, 0xffffffe4
01545 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0154a 448b1c24                       mov        r11d, dword ptr [rsp]
0154e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01556 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0155b 4c891424                       mov        qword ptr [rsp], r10
0155f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01564 4c89542408                     mov        qword ptr [rsp + 8], r10
01569 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0156e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01576 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0157b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01580 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01585 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0158a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0158f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01594 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01599 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0159e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
015a3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
015a8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
015ad 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015b2 4489742458                     mov        dword ptr [rsp + 0x58], r14d
015b7 90                             nop        
015b8 c5f877                         vzeroupper 
015bb e8203db5ff                     call       0x7f4c1b9d7d60
015c0 0f1f8400b8160009               nop        dword ptr [rax + rax + 0x90016b8]
015c8 be45ffffff                     mov        esi, 0xffffff45
015cd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015d2 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
015da 6690                           nop        
015dc c5f877                         vzeroupper 
015df e8fc3cb5ff                     call       0x7f4c1b9d7d60
015e4 0f1f8400dc16000a               nop        dword ptr [rax + rax + 0xa0016dc]
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015f6 448b1c24                       mov        r11d, dword ptr [rsp]
015fa 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01602 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01607 4c891c24                       mov        qword ptr [rsp], r11
0160b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01610 4c895c2408                     mov        qword ptr [rsp + 8], r11
01615 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0161a 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01622 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01627 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0162c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01631 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01636 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0163b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01640 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01645 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0164f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01654 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01659 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0165e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01663 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01668 89442450                       mov        dword ptr [rsp + 0x50], eax
0166c 897c2458                       mov        dword ptr [rsp + 0x58], edi
01670 c5f877                         vzeroupper 
01673 e8683cb5ff                     call       0x7f4c1b9d7d60
01678 0f1f84007017000b               nop        dword ptr [rax + rax + 0xb001770]
01680 493bd8                         cmp        rbx, r8
01683 bdffffffff                     mov        ebp, 0xffffffff
01688 7c08                           jl         0x7f4c1be84112
0168a 400f95c5                       setne      bpl
0168e 400fb6ed                       movzx      ebp, bpl
01692 be45ffffff                     mov        esi, 0xffffff45
01697 48ff742408                     push       qword ptr [rsp + 8]
0169c 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
016a4 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
016a9 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
016b1 48ff742420                     push       qword ptr [rsp + 0x20]
016b6 488f442408                     pop        qword ptr [rsp + 8]
016bb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016c0 44895c2404                     mov        dword ptr [rsp + 4], r11d
016c5 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
016ca 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
016cf 4489542428                     mov        dword ptr [rsp + 0x28], r10d
016d4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
016d9 4489542450                     mov        dword ptr [rsp + 0x50], r10d
016de 89442458                       mov        dword ptr [rsp + 0x58], eax
016e2 4c89442468                     mov        qword ptr [rsp + 0x68], r8
016e7 90                             nop        
016e8 c5f877                         vzeroupper 
016eb e8f03bb5ff                     call       0x7f4c1b9d7d60
016f0 0f1f8400e817000c               nop        dword ptr [rax + rax + 0xc0017e8]
016f8 be45ffffff                     mov        esi, 0xffffff45
016fd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01702 448b0c24                       mov        r9d, dword ptr [rsp]
01706 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
0170e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01713 4c891c24                       mov        qword ptr [rsp], r11
01717 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0171c 4c895c2408                     mov        qword ptr [rsp + 8], r11
01721 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01726 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0172e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01733 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01738 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0173d 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01742 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01747 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0174c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01751 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01756 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0175b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01760 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01765 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0176a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0176f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01774 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01779 89442450                       mov        dword ptr [rsp + 0x50], eax
0177d 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01782 6690                           nop        
01784 c5f877                         vzeroupper 
01787 e8543bb5ff                     call       0x7f4c1b9d7d60
0178c 0f1f84008418000d               nop        dword ptr [rax + rax + 0xd001884]
01794 be45ffffff                     mov        esi, 0xffffff45
01799 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0179e 448b1c24                       mov        r11d, dword ptr [rsp]
017a2 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
017aa 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017af 4c891c24                       mov        qword ptr [rsp], r11
017b3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017b8 4c895c2408                     mov        qword ptr [rsp + 8], r11
017bd 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
017c2 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
017ca 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
017cf 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
017d4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017d9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017de 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017e3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017e8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017ed 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017f2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017f7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
017fc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01801 89442450                       mov        dword ptr [rsp + 0x50], eax
01805 666690                         nop        
01808 c5f877                         vzeroupper 
0180b e8d03ab5ff                     call       0x7f4c1b9d7d60
01810 0f1f84000819000e               nop        dword ptr [rax + rax + 0xe001908]
01818 bee4ffffff                     mov        esi, 0xffffffe4
0181d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01822 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01827 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0182f 448b1424                       mov        r10d, dword ptr [rsp]
01833 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0183b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01840 4c891424                       mov        qword ptr [rsp], r10
01844 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01849 4c89542408                     mov        qword ptr [rsp + 8], r10
0184e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01853 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0185b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01860 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01865 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0186a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0186f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01874 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01879 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0187e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01883 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01888 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0188d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01892 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01897 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0189c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
018a1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018a6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018ab 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
018b0 c5f877                         vzeroupper 
018b3 e8283ab5ff                     call       0x7f4c1b9d7d60
018b8 0f1f8400b019000f               nop        dword ptr [rax + rax + 0xf0019b0]
018c0 bee4ffffff                     mov        esi, 0xffffffe4
018c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018ca 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018cf 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
018d7 448b1c24                       mov        r11d, dword ptr [rsp]
018db 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
018e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018e8 4c891424                       mov        qword ptr [rsp], r10
018ec 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018f1 4c89542408                     mov        qword ptr [rsp + 8], r10
018f6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018fb 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01903 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01908 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0190d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01912 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01917 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0191c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01921 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01926 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0192b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01930 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01935 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0193a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0193f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01944 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01949 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0194e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01953 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01958 48894c2460                     mov        qword ptr [rsp + 0x60], rcx
0195d 666690                         nop        
01960 c5f877                         vzeroupper 
01963 e87839b5ff                     call       0x7f4c1b9d7d60
01968 0f1f8400601a0010               nop        dword ptr [rax + rax + 0x10001a60]
01970 4183c608                       add        r14d, 8
01974 be6effffff                     mov        esi, 0xffffff6e
01979 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0197e 448b1c24                       mov        r11d, dword ptr [rsp]
01982 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0198a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0198f 4c891c24                       mov        qword ptr [rsp], r11
01993 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01998 4c895c2408                     mov        qword ptr [rsp + 8], r11
0199d 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
019a2 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
019aa 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
019af 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
019b4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019b9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
019be 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
019c3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019c8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
019cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
019dc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019e1 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
019e6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
019eb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
019f0 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019f5 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
019fd 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01a02 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01a07 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01a0c c5f877                         vzeroupper 
01a0f e8cc38b5ff                     call       0x7f4c1b9d7d60
01a14 0f1f84000c1b0011               nop        dword ptr [rax + rax + 0x11001b0c]
01a1c 4183c608                       add        r14d, 8
01a20 be66ffffff                     mov        esi, 0xffffff66
01a25 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a2a 448b1c24                       mov        r11d, dword ptr [rsp]
01a2e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01a36 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01a3b 4c891c24                       mov        qword ptr [rsp], r11
01a3f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a44 4c895c2408                     mov        qword ptr [rsp + 8], r11
01a49 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01a4e 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
01a56 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01a5b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01a60 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a65 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01a6a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a6f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a74 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a79 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a7e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a83 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a88 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a8d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01a92 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a97 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a9c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01aa1 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01aa9 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01aae 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01ab3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01ab8 c5f877                         vzeroupper 
01abb e82038b5ff                     call       0x7f4c1b9d7d60
01ac0 0f1f8400b81b0012               nop        dword ptr [rax + rax + 0x12001bb8]
01ac8 beccffffff                     mov        esi, 0xffffffcc
01acd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ad2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ad7 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01adf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae4 8b0424                         mov        eax, dword ptr [rsp]
01ae7 898424e8000000                 mov        dword ptr [rsp + 0xe8], eax
01aee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af3 48ff742420                     push       qword ptr [rsp + 0x20]
01af8 488f0424                       pop        qword ptr [rsp]
01afc 48ff742410                     push       qword ptr [rsp + 0x10]
01b01 488f442408                     pop        qword ptr [rsp + 8]
01b06 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b0b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01b13 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b18 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b1d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b22 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01b27 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b2c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b31 48ff742430                     push       qword ptr [rsp + 0x30]
01b36 488f442428                     pop        qword ptr [rsp + 0x28]
01b3b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b40 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b45 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b4a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b4f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01b54 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01b59 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b5e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01b63 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01b68 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01b6c 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01b71 666690                         nop        
01b74 c5f877                         vzeroupper 
01b77 e86437b5ff                     call       0x7f4c1b9d7d60
01b7c 0f1f8400741c0013               nop        dword ptr [rax + rax + 0x13001c74]
01b84 beccffffff                     mov        esi, 0xffffffcc
01b89 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b8e 448b1424                       mov        r10d, dword ptr [rsp]
01b92 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01b9a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b9f 4c891424                       mov        qword ptr [rsp], r10
01ba3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ba8 4c89542408                     mov        qword ptr [rsp + 8], r10
01bad 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01bb2 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01bba 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01bbf 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bc4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01bc9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01bce 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01bd3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bd8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bdd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01be2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01be7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01bec 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01bf1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01bf6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01bfb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01c00 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c05 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c0a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01c12 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01c17 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01c1c c5f877                         vzeroupper 
01c1f e8bc36b5ff                     call       0x7f4c1b9d7d60
01c24 0f1f84001c1d0014               nop        dword ptr [rax + rax + 0x14001d1c]
01c2c 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
01c31 4d3bd9                         cmp        r11, r9
01c34 bdffffffff                     mov        ebp, 0xffffffff
01c39 7c08                           jl         0x7f4c1be846c3
01c3b 400f95c5                       setne      bpl
01c3f 400fb6ed                       movzx      ebp, bpl
01c43 be45ffffff                     mov        esi, 0xffffff45
01c48 48ff742408                     push       qword ptr [rsp + 8]
01c4d 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01c55 48ff742420                     push       qword ptr [rsp + 0x20]
01c5a 488f442408                     pop        qword ptr [rsp + 8]
01c5f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c64 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c69 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01c6e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01c73 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01c78 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c7d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c82 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c87 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c8c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c91 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c96 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c9b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ca0 89442454                       mov        dword ptr [rsp + 0x54], eax
01ca4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01ca9 666690                         nop        
01cac c5f877                         vzeroupper 
01caf e82c36b5ff                     call       0x7f4c1b9d7d60
01cb4 0f1f8400ac1d0015               nop        dword ptr [rax + rax + 0x15001dac]
01cbc 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01cc1 493bdb                         cmp        rbx, r11
01cc4 bdffffffff                     mov        ebp, 0xffffffff
01cc9 7c08                           jl         0x7f4c1be84753
01ccb 400f95c5                       setne      bpl
01ccf 400fb6ed                       movzx      ebp, bpl
01cd3 be45ffffff                     mov        esi, 0xffffff45
01cd8 48ff742408                     push       qword ptr [rsp + 8]
01cdd 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01ce5 48ff742420                     push       qword ptr [rsp + 0x20]
01cea 488f442408                     pop        qword ptr [rsp + 8]
01cef 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01cf4 44895c2404                     mov        dword ptr [rsp + 4], r11d
01cf9 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01cfe 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d03 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01d08 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d0d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d12 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d17 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d1c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d21 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d26 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d2b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01d30 89442454                       mov        dword ptr [rsp + 0x54], eax
01d34 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01d39 666690                         nop        
01d3c c5f877                         vzeroupper 
01d3f e89c35b5ff                     call       0x7f4c1b9d7d60
01d44 0f1f84003c1e0016               nop        dword ptr [rax + rax + 0x16001e3c]
01d4c 448bd3                         mov        r10d, ebx
01d4f 468d042b                       lea        r8d, [rbx + r13]
01d53 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01d58 4f8b5c010c                     mov        r11, qword ptr [r9 + r8 + 0xc]
01d5d 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
01d62 448d5b08                       lea        r11d, [rbx + 8]
01d66 418bdb                         mov        ebx, r11d
01d69 443bda                         cmp        r11d, edx
01d6c 7cde                           jl         0x7f4c1be847cc
01d6e 443bd9                         cmp        r11d, ecx
01d71 0f8d7c000000                   jge        0x7f4c1be84873
01d77 418bdb                         mov        ebx, r11d
01d7a 660f1f440000                   nop        word ptr [rax + rax]
01d80 448bd3                         mov        r10d, ebx
01d83 4d63ca                         movsxd     r9, r10d
01d86 448bdb                         mov        r11d, ebx
01d89 468d142b                       lea        r10d, [rbx + r13]
01d8d 458bc2                         mov        r8d, r10d
01d90 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01d94 4e8b54170c                     mov        r10, qword ptr [rdi + r10 + 0xc]
01d99 4e89541f0c                     mov        qword ptr [rdi + r11 + 0xc], r10
01d9e 4d63d8                         movsxd     r11, r8d
01da1 4e8b541f14                     mov        r10, qword ptr [rdi + r11 + 0x14]
01da6 4e89540f14                     mov        qword ptr [rdi + r9 + 0x14], r10
01dab 4e8b541f1c                     mov        r10, qword ptr [rdi + r11 + 0x1c]
01db0 4e89540f1c                     mov        qword ptr [rdi + r9 + 0x1c], r10
01db5 4e8b541f24                     mov        r10, qword ptr [rdi + r11 + 0x24]
01dba 4e89540f24                     mov        qword ptr [rdi + r9 + 0x24], r10
01dbf 4e8b541f2c                     mov        r10, qword ptr [rdi + r11 + 0x2c]
01dc4 4e89540f2c                     mov        qword ptr [rdi + r9 + 0x2c], r10
01dc9 4e8b541f34                     mov        r10, qword ptr [rdi + r11 + 0x34]
01dce 4e89540f34                     mov        qword ptr [rdi + r9 + 0x34], r10
01dd3 4e8b541f3c                     mov        r10, qword ptr [rdi + r11 + 0x3c]
01dd8 4e89540f3c                     mov        qword ptr [rdi + r9 + 0x3c], r10
01ddd 4e8b541f44                     mov        r10, qword ptr [rdi + r11 + 0x44]
01de2 4e89540f44                     mov        qword ptr [rdi + r9 + 0x44], r10
01de7 448d5340                       lea        r10d, [rbx + 0x40]
01deb 418bda                         mov        ebx, r10d
01dee 443bd1                         cmp        r10d, ecx
01df1 7c8d                           jl         0x7f4c1be84800
01df3 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
01dfa 0f8dc7f5ffff                   jge        0x7f4c1be83e47
01e00 448bdb                         mov        r11d, ebx
01e03 90                             nop        
01e04 478d142b                       lea        r10d, [r11 + r13]
01e08 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01e0d 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
01e12 458bc3                         mov        r8d, r11d
01e15 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01e19 4e8954010c                     mov        qword ptr [rcx + r8 + 0xc], r10
01e1e 458d5308                       lea        r10d, [r11 + 8]
01e22 458bda                         mov        r11d, r10d
01e25 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01e2d 7cd5                           jl         0x7f4c1be84884
01e2f e993f5ffff                     jmp        0x7f4c1be83e47
01e34 bee4ffffff                     mov        esi, 0xffffffe4
01e39 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e3e 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01e43 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01e4b 448b0424                       mov        r8d, dword ptr [rsp]
01e4f 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01e57 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e5c 4c891c24                       mov        qword ptr [rsp], r11
01e60 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01e65 4c895c2408                     mov        qword ptr [rsp + 8], r11
01e6a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01e6f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01e77 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01e7c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01e81 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e86 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01e8b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01e90 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e95 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e9a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e9f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ea4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ea9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01eae 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01eb3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01eb8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ebd 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ec2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ec7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ecc 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01ed1 89442450                       mov        dword ptr [rsp + 0x50], eax
01ed5 897c2464                       mov        dword ptr [rsp + 0x64], edi
01ed9 666690                         nop        
01edc c5f877                         vzeroupper 
01edf e8fc33b5ff                     call       0x7f4c1b9d7d60
01ee4 0f1f8400dc1f0017               nop        dword ptr [rax + rax + 0x17001fdc]
01eec 85db                           test       ebx, ebx
01eee 0f844c0d0000                   je         0x7f4c1be856c0
01ef4 448b0c24                       mov        r9d, dword ptr [rsp]
01ef8 458bda                         mov        r11d, r10d
01efb 4533d2                         xor        r10d, r10d
01efe 458bc1                         mov        r8d, r9d
01f01 e90cf1ffff                     jmp        0x7f4c1be83a92
01f06 be6effffff                     mov        esi, 0xffffff6e
01f0b 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f10 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01f15 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01f1d 448b0424                       mov        r8d, dword ptr [rsp]
01f21 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01f29 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f2e 4c891c24                       mov        qword ptr [rsp], r11
01f32 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f37 4c895c2408                     mov        qword ptr [rsp + 8], r11
01f3c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f41 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01f49 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f4e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01f53 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01f58 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f5d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f62 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f67 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f6c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f71 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f76 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f7b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f80 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01f85 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01f8a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f8f 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01f94 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01f99 89442450                       mov        dword ptr [rsp + 0x50], eax
01f9d 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01fa1 897c2468                       mov        dword ptr [rsp + 0x68], edi
01fa5 666690                         nop        
01fa8 c5f877                         vzeroupper 
01fab e83033b5ff                     call       0x7f4c1b9d7d60
01fb0 0f1f8400a8200018               nop        dword ptr [rax + rax + 0x180020a8]
01fb8 be45ffffff                     mov        esi, 0xffffff45
01fbd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01fc2 448b0424                       mov        r8d, dword ptr [rsp]
01fc6 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01fce 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fd3 4c891c24                       mov        qword ptr [rsp], r11
01fd7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01fdc 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fe1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fe6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01fee 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ff3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ff8 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ffd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02002 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02007 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0200c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02011 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02016 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0201b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02020 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02025 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0202a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0202f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02034 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02039 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0203e 89442450                       mov        dword ptr [rsp + 0x50], eax
02042 897c2464                       mov        dword ptr [rsp + 0x64], edi
02046 6690                           nop        
02048 c5f877                         vzeroupper 
0204b e89032b5ff                     call       0x7f4c1b9d7d60
02050 0f1f840048210019               nop        dword ptr [rax + rax + 0x19002148]
02058 be3dffffff                     mov        esi, 0xffffff3d
0205d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02062 448b0424                       mov        r8d, dword ptr [rsp]
02066 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
0206e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02073 4c891c24                       mov        qword ptr [rsp], r11
02077 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0207c 4c895c2408                     mov        qword ptr [rsp + 8], r11
02081 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02086 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0208e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02093 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02098 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0209d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020a2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020a7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020ac 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
020b1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020b6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020bb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020c0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020c5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020ca 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020cf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020d4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
020d9 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
020de 89442450                       mov        dword ptr [rsp + 0x50], eax
020e2 897c2464                       mov        dword ptr [rsp + 0x64], edi
020e6 6690                           nop        
020e8 c5f877                         vzeroupper 
020eb e8f031b5ff                     call       0x7f4c1b9d7d60
020f0 0f1f8400e821001a               nop        dword ptr [rax + rax + 0x1a0021e8]
020f8 bee4ffffff                     mov        esi, 0xffffffe4
020fd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02102 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02107 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0210f 448b1c24                       mov        r11d, dword ptr [rsp]
02113 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0211b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02120 4c891424                       mov        qword ptr [rsp], r10
02124 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02129 4c89542408                     mov        qword ptr [rsp + 8], r10
0212e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02133 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0213b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02140 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02145 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0214a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0214f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02154 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02159 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0215e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02163 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02168 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0216d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02172 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02177 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0217c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02181 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02186 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0218b 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02190 c5f877                         vzeroupper 
02193 e84831b5ff                     call       0x7f4c1b9d7d60
02198 0f1f84009022001b               nop        dword ptr [rax + rax + 0x1b002290]
021a0 bee4ffffff                     mov        esi, 0xffffffe4
021a5 48ff742408                     push       qword ptr [rsp + 8]
021aa 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
021b2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021b7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
021bf 48ff742420                     push       qword ptr [rsp + 0x20]
021c4 488f442408                     pop        qword ptr [rsp + 8]
021c9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
021ce 4489542404                     mov        dword ptr [rsp + 4], r10d
021d3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
021d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021dd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
021e2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
021e7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
021ec 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
021f1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021f6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021fb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02200 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02205 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0220a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0220f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02214 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02219 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0221e 6690                           nop        
02220 c5f877                         vzeroupper 
02223 e8b830b5ff                     call       0x7f4c1b9d7d60
02228 0f1f84002023001c               nop        dword ptr [rax + rax + 0x1c002320]
02230 418d6e01                       lea        ebp, [r14 + 1]
02234 bee4ffffff                     mov        esi, 0xffffffe4
02239 48ff742408                     push       qword ptr [rsp + 8]
0223e 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02246 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0224b 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02253 48ff742420                     push       qword ptr [rsp + 0x20]
02258 488f442408                     pop        qword ptr [rsp + 8]
0225d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02262 44895c2404                     mov        dword ptr [rsp + 4], r11d
02267 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0226c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02271 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02276 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0227b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02280 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02285 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0228a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0228f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02294 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02299 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0229e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
022a3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022a8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
022ad 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
022b2 4489442470                     mov        dword ptr [rsp + 0x70], r8d
022b7 90                             nop        
022b8 c5f877                         vzeroupper 
022bb e82030b5ff                     call       0x7f4c1b9d7d60
022c0 0f1f8400b823001d               nop        dword ptr [rax + rax + 0x1d0023b8]
022c8 bee4ffffff                     mov        esi, 0xffffffe4
022cd 48ff742408                     push       qword ptr [rsp + 8]
022d2 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
022da 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022df 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
022e7 48ff742420                     push       qword ptr [rsp + 0x20]
022ec 488f442408                     pop        qword ptr [rsp + 8]
022f1 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
022f6 4489542404                     mov        dword ptr [rsp + 4], r10d
022fb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02300 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02305 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0230a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0230f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02314 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02319 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0231e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02323 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02328 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0232d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02332 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02337 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0233c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02341 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02346 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0234b 90                             nop        
0234c c5f877                         vzeroupper 
0234f e88c2fb5ff                     call       0x7f4c1b9d7d60
02354 0f1f84004c24001e               nop        dword ptr [rax + rax + 0x1e00244c]
0235c bee4ffffff                     mov        esi, 0xffffffe4
02361 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02366 448b1424                       mov        r10d, dword ptr [rsp]
0236a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02372 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02377 4c891424                       mov        qword ptr [rsp], r10
0237b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02380 4c89542408                     mov        qword ptr [rsp + 8], r10
02385 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0238a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02392 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02397 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0239c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023a1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
023a6 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
023ab 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
023b0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023b5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023ba 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023bf 4c89542430                     mov        qword ptr [rsp + 0x30], r10
023c4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
023c9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023ce 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
023d3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
023d8 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
023dd 666690                         nop        
023e0 c5f877                         vzeroupper 
023e3 e8f82eb5ff                     call       0x7f4c1b9d7d60
023e8 0f1f8400e024001f               nop        dword ptr [rax + rax + 0x1f0024e0]
023f0 beccffffff                     mov        esi, 0xffffffcc
023f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023fa 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023ff 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02407 448b1c24                       mov        r11d, dword ptr [rsp]
0240b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02413 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02418 4c891424                       mov        qword ptr [rsp], r10
0241c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02421 4c89542408                     mov        qword ptr [rsp + 8], r10
02426 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0242b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02433 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02438 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0243d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02442 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02447 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0244c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02451 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02456 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0245b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02460 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02465 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0246a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0246f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02474 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02479 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0247e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02483 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02488 c5f877                         vzeroupper 
0248b e8502eb5ff                     call       0x7f4c1b9d7d60
02490 0f1f840088250020               nop        dword ptr [rax + rax + 0x20002588]
02498 be45ffffff                     mov        esi, 0xffffff45
0249d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024a2 448b1424                       mov        r10d, dword ptr [rsp]
024a6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
024ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024b3 4c891424                       mov        qword ptr [rsp], r10
024b7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024bc 4c89542408                     mov        qword ptr [rsp + 8], r10
024c1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
024c6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
024ce 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
024d3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
024d8 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
024dd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
024e2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
024e7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024ec 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024f1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024f6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
024fb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02500 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02505 666690                         nop        
02508 c5f877                         vzeroupper 
0250b e8d02db5ff                     call       0x7f4c1b9d7d60
02510 0f1f840008260021               nop        dword ptr [rax + rax + 0x21002608]
02518 be17000000                     mov        esi, 0x17
0251d 666690                         nop        
02520 c5f877                         vzeroupper 
02523 e8b82db5ff                     call       0x7f4c1b9d7d60
02528 0f1f840020260022               nop        dword ptr [rax + rax + 0x22002620]
02530 be6effffff                     mov        esi, 0xffffff6e
02535 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0253a 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02542 4c895c2408                     mov        qword ptr [rsp + 8], r11
02547 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0254b 48894424f8                     mov        qword ptr [rsp - 8], rax
02550 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02554 89442420                       mov        dword ptr [rsp + 0x20], eax
02558 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255d 48ff742430                     push       qword ptr [rsp + 0x30]
02562 488f442428                     pop        qword ptr [rsp + 0x28]
02567 89542424                       mov        dword ptr [rsp + 0x24], edx
0256b 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02570 48ff742448                     push       qword ptr [rsp + 0x48]
02575 488f442438                     pop        qword ptr [rsp + 0x38]
0257a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0257e 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02583 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02588 c5f877                         vzeroupper 
0258b e8502db5ff                     call       0x7f4c1b9d7d60
02590 0f1f840088260023               nop        dword ptr [rax + rax + 0x23002688]
02598 bebeffffff                     mov        esi, 0xffffffbe
0259d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025a2 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
025aa 448b1424                       mov        r10d, dword ptr [rsp]
025ae 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
025b6 4c891c24                       mov        qword ptr [rsp], r11
025ba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
025bf 4c89542408                     mov        qword ptr [rsp + 8], r10
025c4 4889442410                     mov        qword ptr [rsp + 0x10], rax
025c9 895c2418                       mov        dword ptr [rsp + 0x18], ebx
025cd 48894424f8                     mov        qword ptr [rsp - 8], rax
025d2 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
025d6 89442420                       mov        dword ptr [rsp + 0x20], eax
025da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025df 48ff742430                     push       qword ptr [rsp + 0x30]
025e4 488f442428                     pop        qword ptr [rsp + 0x28]
025e9 89542424                       mov        dword ptr [rsp + 0x24], edx
025ed 4c89442430                     mov        qword ptr [rsp + 0x30], r8
025f2 48ff742448                     push       qword ptr [rsp + 0x48]
025f7 488f442438                     pop        qword ptr [rsp + 0x38]
025fc 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02600 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02605 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0260a 6690                           nop        
0260c c5f877                         vzeroupper 
0260f e8cc2cb5ff                     call       0x7f4c1b9d7d60
02614 0f1f84000c270024               nop        dword ptr [rax + rax + 0x2400270c]
0261c 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02621 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
02625 beccffffff                     mov        esi, 0xffffffcc
0262a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0262f 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
02637 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0263f 891c24                         mov        dword ptr [rsp], ebx
02642 44895c2404                     mov        dword ptr [rsp + 4], r11d
02647 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0264c c5f877                         vzeroupper 
0264f e88c2cb5ff                     call       0x7f4c1b9d7d60
02654 0f1f84004c270025               nop        dword ptr [rax + rax + 0x2500274c]
0265c bee4ffffff                     mov        esi, 0xffffffe4
02661 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02666 448b0424                       mov        r8d, dword ptr [rsp]
0266a 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02672 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02677 4c891c24                       mov        qword ptr [rsp], r11
0267b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02680 4c895c2408                     mov        qword ptr [rsp + 8], r11
02685 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0268a 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02692 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02697 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0269c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026a1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
026a6 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
026ab 4489442420                     mov        dword ptr [rsp + 0x20], r8d
026b0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
026b5 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
026ba 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
026bf 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
026c4 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
026c9 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
026ce 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
026d3 4489442440                     mov        dword ptr [rsp + 0x40], r8d
026d8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
026dd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
026e2 8944244c                       mov        dword ptr [rsp + 0x4c], eax
026e6 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
026eb 4489542460                     mov        dword ptr [rsp + 0x60], r10d
026f0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
026f5 666690                         nop        
026f8 c5f877                         vzeroupper 
026fb e8e02bb5ff                     call       0x7f4c1b9d7d60
02700 0f1f8400f8270026               nop        dword ptr [rax + rax + 0x260027f8]
02708 bee4ffffff                     mov        esi, 0xffffffe4
0270d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02712 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0271a 448b1c24                       mov        r11d, dword ptr [rsp]
0271e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02726 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0272b 4c891c24                       mov        qword ptr [rsp], r11
0272f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02734 4c895c2408                     mov        qword ptr [rsp + 8], r11
02739 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0273e 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02746 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0274b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02750 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02755 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0275a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0275f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02764 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02769 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0276e 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02773 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
02778 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0277d 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02782 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
02787 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0278c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02791 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02796 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0279a 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0279f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
027a4 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
027aa 6690                           nop        
027ac c5f877                         vzeroupper 
027af e82c2bb5ff                     call       0x7f4c1b9d7d60
027b4 0f1f8400ac280027               nop        dword ptr [rax + rax + 0x270028ac]
027bc 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
027c4 beccffffff                     mov        esi, 0xffffffcc
027c9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027ce 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
027d3 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
027db 448b0424                       mov        r8d, dword ptr [rsp]
027df 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
027e7 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
027ec 4c890424                       mov        qword ptr [rsp], r8
027f0 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
027f5 4c89442408                     mov        qword ptr [rsp + 8], r8
027fa 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
027ff 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02807 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0280c 4c89442410                     mov        qword ptr [rsp + 0x10], r8
02811 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02816 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0281b 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
02820 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
02825 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0282a 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0282f 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
02834 4c89442438                     mov        qword ptr [rsp + 0x38], r8
02839 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
0283e 4c89442440                     mov        qword ptr [rsp + 0x40], r8
02843 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
02848 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0284d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02852 4489442448                     mov        dword ptr [rsp + 0x48], r8d
02857 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0285c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02861 89442470                       mov        dword ptr [rsp + 0x70], eax
02865 666690                         nop        
02868 c5f877                         vzeroupper 
0286b e8702ab5ff                     call       0x7f4c1b9d7d60
02870 0f1f840068290028               nop        dword ptr [rax + rax + 0x28002968]
02878 418bea                         mov        ebp, r10d
0287b 83c510                         add        ebp, 0x10
0287e be6effffff                     mov        esi, 0xffffff6e
02883 48ff742408                     push       qword ptr [rsp + 8]
02888 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02890 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02895 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0289d 48ff742420                     push       qword ptr [rsp + 0x20]
028a2 488f442408                     pop        qword ptr [rsp + 8]
028a7 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
028ac 4489442404                     mov        dword ptr [rsp + 4], r8d
028b1 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
028b6 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
028bb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
028c0 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028c5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
028ca 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028cf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028d4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
028d9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
028de 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
028e3 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
028e8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
028ed 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
028f2 89442454                       mov        dword ptr [rsp + 0x54], eax
028f6 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
028fb 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02903 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02908 c5f877                         vzeroupper 
0290b e8d029b5ff                     call       0x7f4c1b9d7d60
02910 0f1f8400082a0029               nop        dword ptr [rax + rax + 0x29002a08]
02918 418bea                         mov        ebp, r10d
0291b 83c510                         add        ebp, 0x10
0291e be66ffffff                     mov        esi, 0xffffff66
02923 48ff742408                     push       qword ptr [rsp + 8]
02928 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02930 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02935 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0293d 48ff742420                     push       qword ptr [rsp + 0x20]
02942 488f442408                     pop        qword ptr [rsp + 8]
02947 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0294c 44895c2404                     mov        dword ptr [rsp + 4], r11d
02951 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02956 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0295b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02960 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02965 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0296a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0296f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02974 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02979 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0297e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02983 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02988 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0298d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02992 89442454                       mov        dword ptr [rsp + 0x54], eax
02996 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0299b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
029a3 458bda                         mov        r11d, r10d
029a6 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
029ab 90                             nop        
029ac c5f877                         vzeroupper 
029af e82c29b5ff                     call       0x7f4c1b9d7d60
029b4 0f1f8400ac2a002a               nop        dword ptr [rax + rax + 0x2a002aac]
029bc bee4ffffff                     mov        esi, 0xffffffe4
029c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029c6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
029cb 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
029d3 448b1424                       mov        r10d, dword ptr [rsp]
029d7 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
029df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
029e4 4c891424                       mov        qword ptr [rsp], r10
029e8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
029ed 4c89542408                     mov        qword ptr [rsp + 8], r10
029f2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
029f7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
029ff 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02a04 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a09 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a0e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02a13 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02a18 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02a1d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02a22 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a27 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a2c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a31 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a36 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a3b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02a40 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02a45 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02a4a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02a4f 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02a54 c5f877                         vzeroupper 
02a57 e88428b5ff                     call       0x7f4c1b9d7d60
02a5c 0f1f8400542b002b               nop        dword ptr [rax + rax + 0x2b002b54]
02a64 bee4ffffff                     mov        esi, 0xffffffe4
02a69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a6e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02a73 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02a7b 448b1c24                       mov        r11d, dword ptr [rsp]
02a7f 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02a87 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a8c 4c891424                       mov        qword ptr [rsp], r10
02a90 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a95 4c89542408                     mov        qword ptr [rsp + 8], r10
02a9a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02a9f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02aa7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02aac 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02ab1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ab6 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02abb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02ac0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02ac5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02aca 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02acf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ad4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ad9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02ade 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ae3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02ae8 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02aed 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02af1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
02af6 6690                           nop        
02af8 c5f877                         vzeroupper 
02afb e8e027b5ff                     call       0x7f4c1b9d7d60
02b00 0f1f8400f82b002c               nop        dword ptr [rax + rax + 0x2c002bf8]
02b08 448bd9                         mov        r11d, ecx
02b0b 4183c308                       add        r11d, 8
02b0f 458bc3                         mov        r8d, r11d
02b12 be6effffff                     mov        esi, 0xffffff6e
02b17 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b1c 448b1c24                       mov        r11d, dword ptr [rsp]
02b20 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02b28 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b2d 4c891424                       mov        qword ptr [rsp], r10
02b31 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b36 4c89542408                     mov        qword ptr [rsp + 8], r10
02b3b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b40 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02b48 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b4d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b52 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02b57 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02b5c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b61 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b66 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b6b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b70 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02b75 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b7a 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
02b82 458bd3                         mov        r10d, r11d
02b85 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02b8a 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02b8f 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02b93 90                             nop        
02b94 c5f877                         vzeroupper 
02b97 e84427b5ff                     call       0x7f4c1b9d7d60
02b9c 0f1f8400942c002d               nop        dword ptr [rax + rax + 0x2d002c94]
02ba4 448bd1                         mov        r10d, ecx
02ba7 4183c208                       add        r10d, 8
02bab 458bc2                         mov        r8d, r10d
02bae be66ffffff                     mov        esi, 0xffffff66
02bb3 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bb8 448b1c24                       mov        r11d, dword ptr [rsp]
02bbc 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02bc4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02bc9 4c891424                       mov        qword ptr [rsp], r10
02bcd 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02bd2 4c89542408                     mov        qword ptr [rsp + 8], r10
02bd7 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02bdc 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02be4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02be9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02bee 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02bf3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02bf8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02bfd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c02 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c07 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c0c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02c11 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c16 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
02c1e 458bd3                         mov        r10d, r11d
02c21 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02c26 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02c2b 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02c2f 90                             nop        
02c30 c5f877                         vzeroupper 
02c33 e8a826b5ff                     call       0x7f4c1b9d7d60
02c38 0f1f8400302d002e               nop        dword ptr [rax + rax + 0x2e002d30]
02c40 bef6ffffff                     mov        esi, 0xfffffff6
02c45 498bee                         mov        rbp, r14
02c48 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02c50 c5f877                         vzeroupper 
02c53 e88826b5ff                     call       0x7f4c1b9d7d60
02c58 0f1f8400502d002f               nop        dword ptr [rax + rax + 0x2f002d50]
02c60 488bf0                         mov        rsi, rax
02c63 eb0d                           jmp        0x7f4c1be856f2
02c65 488bf0                         mov        rsi, rax
02c68 eb08                           jmp        0x7f4c1be856f2
02c6a 488bf0                         mov        rsi, rax
02c6d eb03                           jmp        0x7f4c1be856f2
02c6f 488bf0                         mov        rsi, rax
02c72 c5f877                         vzeroupper 
02c75 4881c4d0000000                 add        rsp, 0xd0
02c7c 5d                             pop        rbp
02c7d e9de4eb5ff                     jmp        0x7f4c1b9da5e0
02c82 bef6ffffff                     mov        esi, 0xfffffff6
02c87 90                             nop        
02c88 c5f877                         vzeroupper 
02c8b e85026b5ff                     call       0x7f4c1b9d7d60
02c90 0f1f8400882d0030               nop        dword ptr [rax + rax + 0x30002d88]
02c98 49ba073be81b4c7f0000           movabs     r10, 0x7f4c1be83b07
02ca2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02ca9 e9b2d7a8ff                     jmp        0x7f4c1b912ee0
02cae e86da3a7ff                     call       0x7f4c1b8ffaa0
02cb3 e986d3ffff                     jmp        0x7f4c1be82abe
