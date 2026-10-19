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
0001a 0f8540f8b3ff                   jne        0x7ff77b72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85ef370000                   jne        0x7ff77bbf2d2d
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 4d8bd8                         mov        r11, r8
0004a 448bcf                         mov        r9d, edi
0004d 4c8bf6                         mov        r14, rsi
00050 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00054 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00059 448b5604                       mov        r10d, dword ptr [rsi + 4]
0005d 458bc2                         mov        r8d, r10d
00060 442b442464                     sub        r8d, dword ptr [rsp + 0x64]
00065 8b9c24f0000000                 mov        ebx, dword ptr [rsp + 0xf0]
0006c 413bd8                         cmp        ebx, r8d
0006f 0f8f4b2e0000                   jg         0x7ff77bbf23c0
00075 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00079 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0007e 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00082 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
0008a 48635c2464                     movsxd     rbx, dword ptr [rsp + 0x64]
0008f 48035c2428                     add        rbx, qword ptr [rsp + 0x28]
00094 4c2bc3                         sub        r8, rbx
00097 493bc8                         cmp        rcx, r8
0009a 0f8f202e0000                   jg         0x7ff77bbf23c0
000a0 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a4 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a9 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ad 4d85c0                         test       r8, r8
000b0 0f8405150000                   je         0x7ff77bbf0abb
000b6 33ff                           xor        edi, edi
000b8 4c8bea                         mov        r13, rdx
000bb 8b7204                         mov        esi, dword ptr [rdx + 4]
000be 418b5e40                       mov        ebx, dword ptr [r14 + 0x40]
000c2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
000c9 418be9                         mov        ebp, r9d
000cc 4585c9                         test       r9d, r9d
000cf 0f8e2f270000                   jle        0x7ff77bbf1d04
000d5 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e6 418d4ae0                       lea        ecx, [r10 - 0x20]
000ea 458b5304                       mov        r10d, dword ptr [r11 + 4]
000ee 4585d2                         test       r10d, r10d
000f1 0f86f52d0000                   jbe        0x7ff77bbf23ec
000f7 4d63d2                         movsxd     r10, r10d
000fa 4863dd                         movsxd     rbx, ebp
000fd 48ffcb                         dec        rbx
00100 493bda                         cmp        rbx, r10
00103 0f83e32d0000                   jae        0x7ff77bbf23ec
00109 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00111 8b5a04                         mov        ebx, dword ptr [rdx + 4]
00114 85db                           test       ebx, ebx
00116 0f86342e0000                   jbe        0x7ff77bbf2450
0011c 83fb01                         cmp        ebx, 1
0011f 0f862b2e0000                   jbe        0x7ff77bbf2450
00125 83fb02                         cmp        ebx, 2
00128 0f86222e0000                   jbe        0x7ff77bbf2450
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8c152e0000                   jl         0x7ff77bbf2450
0013b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00143 418b4204                       mov        eax, dword ptr [r10 + 4]
00147 448d50f1                       lea        r10d, [rax - 0xf]
0014b 4585d2                         test       r10d, r10d
0014e 0f8cfc2d0000                   jl         0x7ff77bbf2450
00154 448d50fd                       lea        r10d, [rax - 3]
00158 4585d2                         test       r10d, r10d
0015b 0f8cef2d0000                   jl         0x7ff77bbf2450
00161 448d50f9                       lea        r10d, [rax - 7]
00165 4585d2                         test       r10d, r10d
00168 0f8ce22d0000                   jl         0x7ff77bbf2450
0016e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00172 899c24fc000000                 mov        dword ptr [rsp + 0xfc], ebx
00179 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0017d 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00182 89b424f8000000                 mov        dword ptr [rsp + 0xf8], esi
00189 897c2430                       mov        dword ptr [rsp + 0x30], edi
0018d 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00192 4889542450                     mov        qword ptr [rsp + 0x50], rdx
00197 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0019c 896c2418                       mov        dword ptr [rsp + 0x18], ebp
001a0 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a5 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001aa 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
001b2 4d8bd3                         mov        r10, r11
001b5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ba 448bd0                         mov        r10d, eax
001bd 448bc6                         mov        r8d, esi
001c0 458d5afd                       lea        r11d, [r10 - 3]
001c4 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
001cc 4d63d8                         movsxd     r11, r8d
001cf 4183c0f1                       add        r8d, -0xf
001d3 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
001db 4983c3f1                       add        r11, -0xf
001df 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
001e7 458d42f9                       lea        r8d, [r10 - 7]
001eb 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
001f3 4d63da                         movsxd     r11, r10d
001f6 4183c2f1                       add        r10d, -0xf
001fa 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00202 4d8d53f1                       lea        r10, [r11 - 0xf]
00206 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020e 4983c3f9                       add        r11, -7
00212 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
0021a 4533c9                         xor        r9d, r9d
0021d 4533c0                         xor        r8d, r8d
00220 e904050000                     jmp        0x7ff77bbefc29
00225 448bd5                         mov        r10d, ebp
00228 4d63d2                         movsxd     r10, r10d
0022b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00232 c442a8f5db                     bzhi       r11, r11, r10
00237 c4c1fb92fb                     kmovq      k7, r11
0023c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00242 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00248 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00250 4403d5                         add        r10d, ebp
00253 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0025b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0025f 418502                         test       dword ptr [r10], eax
00262 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0026a 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
0026f 0f8d74080000                   jge        0x7ff77bbeffe9
00275 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
0027d 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00285 442b9424b0000000               sub        r10d, dword ptr [rsp + 0xb0]
0028d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00295 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00299 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
002a0 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
002a7 448bb424b0000000               mov        r14d, dword ptr [rsp + 0xb0]
002af 410f4fee                       cmovg      ebp, r14d
002b3 458bc2                         mov        r8d, r10d
002b6 4585d2                         test       r10d, r10d
002b9 0f8c29200000                   jl         0x7ff77bbf17e8
002bf 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
002c7 4585db                         test       r11d, r11d
002ca 0f8c18200000                   jl         0x7ff77bbf17e8
002d0 458d1c2a                       lea        r11d, [r10 + rbp]
002d4 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
002d9 453bd3                         cmp        r10d, r11d
002dc 0f8206200000                   jb         0x7ff77bbf17e8
002e2 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002ea 4403f5                         add        r14d, ebp
002ed 453bd6                         cmp        r10d, r14d
002f0 0f82f21f0000                   jb         0x7ff77bbf17e8
002f6 85ed                           test       ebp, ebp
002f8 0f8cea1f0000                   jl         0x7ff77bbf17e8
002fe 85ed                           test       ebp, ebp
00300 0f8442ffffff                   je         0x7ff77bbef748
00306 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0030e 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00316 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0031b 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00320 4863d5                         movsxd     rdx, ebp
00323 4883fa20                       cmp        rdx, 0x20
00327 0f86f8feffff                   jbe        0x7ff77bbef725
0032d c5f877                         vzeroupper 
00330 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
0033a 41ffd2                         call       r10
0033d 0f1f840000000000               nop        dword ptr [rax + rax]
00345 e9fefeffff                     jmp        0x7ff77bbef748
0034a 458bea                         mov        r13d, r10d
0034d 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00355 4585c0                         test       r8d, r8d
00358 0f8ed2150000                   jle        0x7ff77bbf0e30
0035e 458d1401                       lea        r10d, [r9 + rax]
00362 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00367 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0036c 4403d3                         add        r10d, ebx
0036f 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00374 0f8f60120000                   jg         0x7ff77bbf0ada
0037a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0037f 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
00384 0f8f12170000                   jg         0x7ff77bbf0f9c
0038a 83f810                         cmp        eax, 0x10
0038d 0f8f16080000                   jg         0x7ff77bbf00a9
00393 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
0039b 0f83c4120000                   jae        0x7ff77bbf0b65
003a1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
003a6 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
003ad 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
003b2 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
003ba 0f8350130000                   jae        0x7ff77bbf0c10
003c0 468d1c08                       lea        r11d, [rax + r9]
003c4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
003c9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003d1 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
003d8 468d1c10                       lea        r11d, [rax + r10]
003dc 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
003e1 458bf3                         mov        r14d, r11d
003e4 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003ec 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003f0 83fb10                         cmp        ebx, 0x10
003f3 7f53                           jg         0x7ff77bbef948
003f5 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003fc 83fb10                         cmp        ebx, 0x10
003ff 7c47                           jl         0x7ff77bbef948
00401 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
00409 0f83d1130000                   jae        0x7ff77bbf0ce0
0040f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00417 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0041e 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00422 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
00429 0f8351140000                   jae        0x7ff77bbf0d80
0042f c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00436 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
0043b 4403eb                         add        r13d, ebx
0043e 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00443 e9c6020000                     jmp        0x7ff77bbefc0e
00448 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00450 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
00455 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00459 498d741b08                     lea        rsi, [r11 + rbx + 8]
0045e 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00462 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00466 4c63c3                         movsxd     r8, ebx
00469 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00471 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00476 0f8cb1040000                   jl         0x7ff77bbefe2d
0047c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00481 4183fa30                       cmp        r10d, 0x30
00485 0f8e90000000                   jle        0x7ff77bbefa1b
0048b 4585f6                         test       r14d, r14d
0048e 0f8c5c1b0000                   jl         0x7ff77bbf14f0
00494 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00499 4585d2                         test       r10d, r10d
0049c 0f8c4e1b0000                   jl         0x7ff77bbf14f0
004a2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
004a7 4503d6                         add        r10d, r14d
004aa 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
004af 453bda                         cmp        r11d, r10d
004b2 0f82381b0000                   jb         0x7ff77bbf14f0
004b8 443bdb                         cmp        r11d, ebx
004bb 0f822f1b0000                   jb         0x7ff77bbf14f0
004c1 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004c5 85db                           test       ebx, ebx
004c7 0f8435020000                   je         0x7ff77bbefc02
004cd 4863d3                         movsxd     rdx, ebx
004d0 4883fa20                       cmp        rdx, 0x20
004d4 7728                           ja         0x7ff77bbef9fe
004d6 448bdb                         mov        r11d, ebx
004d9 4d63d3                         movsxd     r10, r11d
004dc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004e3 c442a8f5db                     bzhi       r11, r11, r10
004e8 c4c1fb92fb                     kmovq      k7, r11
004ed 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004f3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004f9 e904020000                     jmp        0x7ff77bbefc02
004fe c5f877                         vzeroupper 
00501 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
0050b 41ffd2                         call       r10
0050e 0f1f840000000000               nop        dword ptr [rax + rax]
00516 e9e7010000                     jmp        0x7ff77bbefc02
0051b 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00523 0f830b160000                   jae        0x7ff77bbf1034
00529 4963fe                         movsxd     rdi, r14d
0052c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00534 4d8b4c3a08                     mov        r9, qword ptr [r10 + rdi + 8]
00539 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0053e 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00546 0f83b8160000                   jae        0x7ff77bbf1104
0054c 418d4b08                       lea        ecx, [r11 + 8]
00550 4963d3                         movsxd     rdx, r11d
00553 4d894c1208                     mov        qword ptr [r10 + rdx + 8], r9
00558 3bcb                           cmp        ecx, ebx
0055a 0f8da2010000                   jge        0x7ff77bbefc02
00560 482bfa                         sub        rdi, rdx
00563 4c63c9                         movsxd     r9, ecx
00566 4d8d1439                       lea        r10, [r9 + rdi]
0056a 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00572 0f8390180000                   jae        0x7ff77bbf1308
00578 4d8bd0                         mov        r10, r8
0057b 4d2bd1                         sub        r10, r9
0057e 4983c207                       add        r10, 7
00582 4983e2f8                       and        r10, 0xfffffffffffffff8
00586 458bd2                         mov        r10d, r10d
00589 478d4c1a08                     lea        r9d, [r10 + r11 + 8]
0058e 4d63d1                         movsxd     r10, r9d
00591 4d8d4c3af8                     lea        r9, [r10 + rdi - 8]
00596 4c3b8c24a8000000               cmp        r9, qword ptr [rsp + 0xa8]
0059e 0f8364180000                   jae        0x7ff77bbf1308
005a4 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
005ab 0f8357180000                   jae        0x7ff77bbf1308
005b1 4983c2f8                       add        r10, -8
005b5 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
005bd 0f8345180000                   jae        0x7ff77bbf1308
005c3 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005c9 0f8ff1180000                   jg         0x7ff77bbf13c0
005cf 452bf3                         sub        r14d, r11d
005d2 4183c310                       add        r11d, 0x10
005d6 458d140e                       lea        r10d, [r14 + rcx]
005da 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
005e2 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
005e7 448bc9                         mov        r9d, ecx
005ea 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
005f1 4e89540a08                     mov        qword ptr [rdx + r9 + 8], r10
005f6 448d4908                       lea        r9d, [rcx + 8]
005fa 453bcb                         cmp        r9d, r11d
005fd 7d05                           jge        0x7ff77bbefb04
005ff 418bc9                         mov        ecx, r9d
00602 ebd2                           jmp        0x7ff77bbefad6
00604 4983c0f8                       add        r8, -8
00608 4981f800000080                 cmp        r8, -0x80000000
0060f 49c7c200000080                 mov        r10, 0xffffffff80000000
00616 4d0f4cc2                       cmovl      r8, r10
0061a 418bd0                         mov        edx, r8d
0061d 443bca                         cmp        r9d, edx
00620 0f8d89000000                   jge        0x7ff77bbefbaf
00626 4d63d1                         movsxd     r10, r9d
00629 4c03d7                         add        r10, rdi
0062c 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00634 0f833e190000                   jae        0x7ff77bbf1478
0063a 83c110                         add        ecx, 0x10
0063d 4c63d1                         movsxd     r10, ecx
00640 4c03d7                         add        r10, rdi
00643 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0064b 0f833b190000                   jae        0x7ff77bbf148c
00651 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
00659 0f8341190000                   jae        0x7ff77bbf14a0
0065f 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
00666 0f8348190000                   jae        0x7ff77bbf14b4
0066c 90                             nop        
0066d 90                             nop        
0066e 90                             nop        
0066f 90                             nop        
00670 478d040e                       lea        r8d, [r14 + r9]
00674 458bd1                         mov        r10d, r9d
00677 4963ca                         movsxd     rcx, r10d
0067a 458bd0                         mov        r10d, r8d
0067d 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
00684 4e8b5c1608                     mov        r11, qword ptr [rsi + r10 + 8]
00689 4963f0                         movsxd     rsi, r8d
0068c 458bd1                         mov        r10d, r9d
0068f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00697 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
0069c 4d8b543010                     mov        r10, qword ptr [r8 + rsi + 0x10]
006a1 4d89540810                     mov        qword ptr [r8 + rcx + 0x10], r10
006a6 4183c110                       add        r9d, 0x10
006aa 443bca                         cmp        r9d, edx
006ad 7cc1                           jl         0x7ff77bbefb70
006af 443bcb                         cmp        r9d, ebx
006b2 7d4e                           jge        0x7ff77bbefc02
006b4 4d63d1                         movsxd     r10, r9d
006b7 4c03d7                         add        r10, rdi
006ba 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
006c2 0f8300190000                   jae        0x7ff77bbf14c8
006c8 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
006d0 0f8306190000                   jae        0x7ff77bbf14dc
006d6 90                             nop        
006d7 90                             nop        
006d8 478d140e                       lea        r10d, [r14 + r9]
006dc 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
006e4 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
006e9 458bd9                         mov        r11d, r9d
006ec 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
006f4 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
006f9 4183c108                       add        r9d, 8
006fd 443bcb                         cmp        r9d, ebx
00700 7cd6                           jl         0x7ff77bbefbd8
00702 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00706 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
0070a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0070e 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00716 41ffc0                         inc        r8d
00719 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
0071e 0f8ddd050000                   jge        0x7ff77bbf0201
00724 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00729 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0072e 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00733 4d8bd3                         mov        r10, r11
00736 49c1fa24                       sar        r10, 0x24
0073a 458bd2                         mov        r10d, r10d
0073d 418bfa                         mov        edi, r10d
00740 458bd3                         mov        r10d, r11d
00743 49c1eb12                       shr        r11, 0x12
00747 4181e2ffff0100                 and        r10d, 0x1ffff
0074e 418bc2                         mov        eax, r10d
00751 418bdb                         mov        ebx, r11d
00754 81e3ffff0300                   and        ebx, 0x3ffff
0075a 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0075e 448bd7                         mov        r10d, edi
00761 4585d2                         test       r10d, r10d
00764 0f8cfa110000                   jl         0x7ff77bbf0e64
0076a 448bd0                         mov        r10d, eax
0076d 4585d2                         test       r10d, r10d
00770 0f85ba000000                   jne        0x7ff77bbefd30
00776 4533d2                         xor        r10d, r10d
00779 418bc2                         mov        eax, r10d
0077c 448bd7                         mov        r10d, edi
0077f 4183fa03                       cmp        r10d, 3
00783 0f8eef000000                   jle        0x7ff77bbefd78
00789 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0078e 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00792 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00797 45895310                       mov        dword ptr [r11 + 0x10], r10d
0079b 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0079f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007a4 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
007a8 448d57fd                       lea        r10d, [rdi - 3]
007ac 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
007b4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007b9 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
007c0 41895a08                       mov        dword ptr [r10 + 8], ebx
007c4 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
007cc 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
007d4 488beb                         mov        rbp, rbx
007d7 4c635c2464                     movsxd     r11, dword ptr [rsp + 0x64]
007dc 4c035c2428                     add        r11, qword ptr [rsp + 0x28]
007e1 4863d0                         movsxd     rdx, eax
007e4 4c03da                         add        r11, rdx
007e7 493bdb                         cmp        rbx, r11
007ea 0f8f18120000                   jg         0x7ff77bbf0f08
007f0 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
007f4 03d8                           add        ebx, eax
007f6 448bf3                         mov        r14d, ebx
007f9 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
00801 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00806 4585d2                         test       r10d, r10d
00809 0f853bfbffff                   jne        0x7ff77bbef84a
0080f 4d63c6                         movsxd     r8, r14d
00812 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00817 0f8caf140000                   jl         0x7ff77bbf11cc
0081d 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
00822 0f8f40150000                   jg         0x7ff77bbf1268
00828 4533ed                         xor        r13d, r13d
0082b e91dfbffff                     jmp        0x7ff77bbef84d
00830 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00835 452bd9                         sub        r11d, r9d
00838 453bd3                         cmp        r10d, r11d
0083b 0f8e3bffffff                   jle        0x7ff77bbefc7c
00841 be45ffffff                     mov        esi, 0xffffff45
00846 418bea                         mov        ebp, r10d
00849 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00851 90                             nop        
00852 90                             nop        
00853 90                             nop        
00854 c5f877                         vzeroupper 
00857 e804ddadff                     call       0x7ff77b6cda60
0085c 0f1f840054090001               nop        dword ptr [rax + rax + 0x1000954]
00864 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0086e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00872 e869fe1618                     call       0x7ff793d5fbe0
00877 f4                             hlt        
00878 85c0                           test       eax, eax
0087a 7407                           je         0x7ff77bbefd83
0087c 448d57ff                       lea        r10d, [rdi - 1]
00880 418bfa                         mov        edi, r10d
00883 85ff                           test       edi, edi
00885 7516                           jne        0x7ff77bbefd9d
00887 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0088c 418b5a08                       mov        ebx, dword ptr [r10 + 8]
00890 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00898 e984000000                     jmp        0x7ff77bbefe21
0089d 83ff03                         cmp        edi, 3
008a0 0f842a200000                   je         0x7ff77bbf1dd0
008a6 83ff02                         cmp        edi, 2
008a9 0f87c9200000                   ja         0x7ff77bbf1e78
008af 3bbc24fc000000                 cmp        edi, dword ptr [rsp + 0xfc]
008b6 0f8366190000                   jae        0x7ff77bbf1722
008bc 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
008c1 418b5cbb08                     mov        ebx, dword ptr [r11 + rdi*4 + 8]
008c6 85ff                           test       edi, edi
008c8 7e46                           jle        0x7ff77bbefe10
008ca 448d5fff                       lea        r11d, [rdi - 1]
008ce 443b9c24fc000000               cmp        r11d, dword ptr [rsp + 0xfc]
008d6 0f83401f0000                   jae        0x7ff77bbf1d1c
008dc 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
008e4 90                             nop        
008e5 90                             nop        
008e6 90                             nop        
008e7 90                             nop        
008e8 90                             nop        
008e9 90                             nop        
008ea 90                             nop        
008eb 90                             nop        
008ec 90                             nop        
008ed 90                             nop        
008ee 90                             nop        
008ef 90                             nop        
008f0 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
008f5 458b54bb04                     mov        r10d, dword ptr [r11 + rdi*4 + 4]
008fa 4d8bc3                         mov        r8, r11
008fd 458954b808                     mov        dword ptr [r8 + rdi*4 + 8], r10d
00902 448d57ff                       lea        r10d, [rdi - 1]
00906 418bfa                         mov        edi, r10d
00909 4585d2                         test       r10d, r10d
0090c 7fe2                           jg         0x7ff77bbefdf0
0090e eb08                           jmp        0x7ff77bbefe18
00910 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00918 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0091d 41895a08                       mov        dword ptr [r10 + 8], ebx
00921 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
00928 e99ffeffff                     jmp        0x7ff77bbefccc
0092d 4183fb10                       cmp        r11d, 0x10
00931 0f8d77090000                   jge        0x7ff77bbf07ae
00937 4183fb08                       cmp        r11d, 8
0093b 0f8d7a040000                   jge        0x7ff77bbf02bb
00941 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00946 4183fa10                       cmp        r10d, 0x10
0094a 0f8fa2010000                   jg         0x7ff77bbefff2
00950 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
00955 0f83291a0000                   jae        0x7ff77bbf1884
0095b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00963 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00969 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0096e 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00973 0f83d31a0000                   jae        0x7ff77bbf194c
00979 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00981 43886c1308                     mov        byte ptr [r11 + r10 + 8], bpl
00986 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0098b 41ffc3                         inc        r11d
0098e 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00996 458d5603                       lea        r10d, [r14 + 3]
0099a 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
0099f 0f833f1b0000                   jae        0x7ff77bbf19e4
009a5 4d63c6                         movsxd     r8, r14d
009a8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
009b0 430fbe6c0309                   movsx      ebp, byte ptr [r11 + r8 + 9]
009b6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009bb 4183c203                       add        r10d, 3
009bf 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
009c4 0f83be1b0000                   jae        0x7ff77bbf1a88
009ca 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
009cf 43886c0b09                     mov        byte ptr [r11 + r9 + 9], bpl
009d4 470fbe5c030a                   movsx      r11d, byte ptr [r11 + r8 + 0xa]
009da 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
009e1 46885c090a                     mov        byte ptr [rcx + r9 + 0xa], r11b
009e6 460fbe5c010b                   movsx      r11d, byte ptr [rcx + r8 + 0xb]
009ec 46885c090b                     mov        byte ptr [rcx + r9 + 0xb], r11b
009f1 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
009f9 4183fa08                       cmp        r10d, 8
009fd 0f831d1c0000                   jae        0x7ff77bbf1b20
00a03 49baf03b27e300000000           movabs     r10, 0xe3273bf0
00a0d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a15 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00a1a 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00a1f 4183fa04                       cmp        r10d, 4
00a23 7e52                           jle        0x7ff77bbeff77
00a25 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a2a 4183c304                       add        r11d, 4
00a2e 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00a36 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00a3e 0f837c1c0000                   jae        0x7ff77bbf1bc0
00a44 458bd6                         mov        r10d, r14d
00a47 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00a4f 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00a57 428b6c0108                     mov        ebp, dword ptr [rcx + r8 + 8]
00a5c 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00a64 0f830e1d0000                   jae        0x7ff77bbf1c78
00a6a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a6f 4d63d2                         movsxd     r10, r10d
00a72 42896c110c                     mov        dword ptr [rcx + r10 + 0xc], ebp
00a77 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00a7c 4183fb08                       cmp        r11d, 8
00a80 7e67                           jle        0x7ff77bbeffe9
00a82 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a87 4183c208                       add        r10d, 8
00a8b 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a93 49ba183c27e300000000           movabs     r10, 0xe3273c18
00a9d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00aa5 478b5c9a08                     mov        r11d, dword ptr [r10 + r11*4 + 8]
00aaa 452bf3                         sub        r14d, r11d
00aad 418d6e08                       lea        ebp, [r14 + 8]
00ab1 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00ab8 0f83621f0000                   jae        0x7ff77bbf1f20
00abe 4d63d6                         movsxd     r10, r14d
00ac1 4a8b6c1110                     mov        rbp, qword ptr [rcx + r10 + 0x10]
00ac6 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00ace 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00ad6 0f83d01f0000                   jae        0x7ff77bbf1fac
00adc 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00ae1 4d63dd                         movsxd     r11, r13d
00ae4 4a896c1910                     mov        qword ptr [rcx + r11 + 0x10], rbp
00ae9 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00aed e91cfcffff                     jmp        0x7ff77bbefc0e
00af2 4585f6                         test       r14d, r14d
00af5 0f8c31200000                   jl         0x7ff77bbf202c
00afb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b00 4585db                         test       r11d, r11d
00b03 0f8c23200000                   jl         0x7ff77bbf202c
00b09 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00b0e 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
00b13 0f8213200000                   jb         0x7ff77bbf202c
00b19 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b21 4403542464                     add        r10d, dword ptr [rsp + 0x64]
00b26 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00b2e 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
00b36 0f82f01f0000                   jb         0x7ff77bbf202c
00b3c 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00b44 4585db                         test       r11d, r11d
00b47 0f8cdf1f0000                   jl         0x7ff77bbf202c
00b4d 4585db                         test       r11d, r11d
00b50 0f8427f7ffff                   je         0x7ff77bbef77d
00b56 4883fd20                       cmp        rbp, 0x20
00b5a 772d                           ja         0x7ff77bbf0089
00b5c 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b64 4d63d2                         movsxd     r10, r10d
00b67 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b6e c442a8f5db                     bzhi       r11, r11, r10
00b73 c4c1fb92fb                     kmovq      k7, r11
00b78 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b7e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b84 e9f4f6ffff                     jmp        0x7ff77bbef77d
00b89 488bd5                         mov        rdx, rbp
00b8c c5f877                         vzeroupper 
00b8f 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00b99 41ffd2                         call       r10
00b9c 0f1f840000000000               nop        dword ptr [rax + rax]
00ba4 e9d4f6ffff                     jmp        0x7ff77bbef77d
00ba9 83f830                         cmp        eax, 0x30
00bac 0f8f79060000                   jg         0x7ff77bbf072b
00bb2 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00bba 0f8334200000                   jae        0x7ff77bbf20f4
00bc0 4963c9                         movsxd     rcx, r9d
00bc3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00bc8 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00bcf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00bd4 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00bdc 0f83d6200000                   jae        0x7ff77bbf21b8
00be2 418bfa                         mov        edi, r10d
00be5 4183c210                       add        r10d, 0x10
00be9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00bee 4c63d7                         movsxd     r10, edi
00bf1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00bf9 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00c00 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c05 443bdb                         cmp        r11d, ebx
00c08 0f8dbc000000                   jge        0x7ff77bbf01ca
00c0e 492bca                         sub        rcx, r10
00c11 4d63c3                         movsxd     r8, r11d
00c14 4d8d1408                       lea        r10, [r8 + rcx]
00c18 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00c20 0f836a210000                   jae        0x7ff77bbf2290
00c26 4c63d3                         movsxd     r10, ebx
00c29 4d2bd0                         sub        r10, r8
00c2c 4983c20f                       add        r10, 0xf
00c30 4983e2f0                       and        r10, 0xfffffffffffffff0
00c34 458bd2                         mov        r10d, r10d
00c37 458d443a10                     lea        r8d, [r10 + rdi + 0x10]
00c3c 4d63d0                         movsxd     r10, r8d
00c3f 4d8d440af0                     lea        r8, [r10 + rcx - 0x10]
00c44 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00c4c 0f833e210000                   jae        0x7ff77bbf2290
00c52 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00c5a 0f8330210000                   jae        0x7ff77bbf2290
00c60 4983c2f0                       add        r10, -0x10
00c64 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00c6c 0f831e210000                   jae        0x7ff77bbf2290
00c72 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00c78 0f8faa210000                   jg         0x7ff77bbf2328
00c7e 458bd1                         mov        r10d, r9d
00c81 442bd7                         sub        r10d, edi
00c84 90                             nop        
00c85 90                             nop        
00c86 90                             nop        
00c87 90                             nop        
00c88 90                             nop        
00c89 90                             nop        
00c8a 90                             nop        
00c8b 90                             nop        
00c8c 90                             nop        
00c8d 90                             nop        
00c8e 90                             nop        
00c8f 90                             nop        
00c90 458bda                         mov        r11d, r10d
00c93 44035c2460                     add        r11d, dword ptr [rsp + 0x60]
00c98 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00c9d c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00ca4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ca9 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00cb0 c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
00cb7 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00cbc 4183c010                       add        r8d, 0x10
00cc0 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00cc5 443bc3                         cmp        r8d, ebx
00cc8 7cc6                           jl         0x7ff77bbf0190
00cca 468d1408                       lea        r10d, [rax + r9]
00cce 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00cd3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00cd7 e910f7ffff                     jmp        0x7ff77bbef8ec
00cdc 4d63d2                         movsxd     r10, r10d
00cdf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ce6 c442a8f5db                     bzhi       r11, r11, r10
00ceb c4c1fb92fb                     kmovq      k7, r11
00cf0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cf6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cfc e9a0000000                     jmp        0x7ff77bbf02a1
00d01 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00d06 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00d0b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d13 4585db                         test       r11d, r11d
00d16 0f84a8220000                   je         0x7ff77bbf24c4
00d1c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00d21 4585c0                         test       r8d, r8d
00d24 0f8c42230000                   jl         0x7ff77bbf256c
00d2a 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00d2f 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00d34 8bb424f8000000                 mov        esi, dword ptr [rsp + 0xf8]
00d3b 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d3f 85db                           test       ebx, ebx
00d41 0f8cc5220000                   jl         0x7ff77bbf250c
00d47 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00d4b 0f82c1220000                   jb         0x7ff77bbf2512
00d51 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00d55 4103ea                         add        ebp, r10d
00d58 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00d5c 3bcd                           cmp        ecx, ebp
00d5e 0f82b4220000                   jb         0x7ff77bbf2518
00d64 4585d2                         test       r10d, r10d
00d67 0f8cb1220000                   jl         0x7ff77bbf251e
00d6d 4585d2                         test       r10d, r10d
00d70 742f                           je         0x7ff77bbf02a1
00d72 498d741b08                     lea        rsi, [r11 + rbx + 8]
00d77 4b8d7c0508                     lea        rdi, [r13 + r8 + 8]
00d7c 4963d2                         movsxd     rdx, r10d
00d7f 4883fa20                       cmp        rdx, 0x20
00d83 0f8653ffffff                   jbe        0x7ff77bbf01dc
00d89 c5f877                         vzeroupper 
00d8c 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00d96 41ffd2                         call       r10
00d99 0f1f840000000000               nop        dword ptr [rax + rax]
00da1 41896e38                       mov        dword ptr [r14 + 0x38], ebp
00da5 c5f877                         vzeroupper 
00da8 4881c4e0000000                 add        rsp, 0xe0
00daf 5d                             pop        rbp
00db0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00db4 0f875d2a0000                   ja         0x7ff77bbf2d17
00dba c3                             ret        
00dbb 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00dc3 0f83b3220000                   jae        0x7ff77bbf257c
00dc9 418bee                         mov        ebp, r14d
00dcc 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00dd0 4c63cd                         movsxd     r9, ebp
00dd3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ddb 4b8b6c0b08                     mov        rbp, qword ptr [r11 + r9 + 8]
00de0 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00de8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ded 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00df5 0f8339230000                   jae        0x7ff77bbf2634
00dfb 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00dff 8d6a08                         lea        ebp, [rdx + 8]
00e02 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00e06 4c63da                         movsxd     r11, edx
00e09 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00e11 488bac24b0000000               mov        rbp, qword ptr [rsp + 0xb0]
00e19 4b896c1a08                     mov        qword ptr [r10 + r11 + 8], rbp
00e1e 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00e22 3beb                           cmp        ebp, ebx
00e24 0f8dd3030000                   jge        0x7ff77bbf06fd
00e2a 4d2bcb                         sub        r9, r11
00e2d 4863fd                         movsxd     rdi, ebp
00e30 4e8d140f                       lea        r10, [rdi + r9]
00e34 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00e3c 0f8392230000                   jae        0x7ff77bbf26d4
00e42 4d8bd0                         mov        r10, r8
00e45 4c2bd7                         sub        r10, rdi
00e48 4983c207                       add        r10, 7
00e4c 4983e2f8                       and        r10, 0xfffffffffffffff8
00e50 458bd2                         mov        r10d, r10d
00e53 458d5c1208                     lea        r11d, [r10 + rdx + 8]
00e58 4d63d3                         movsxd     r10, r11d
00e5b 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
00e60 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00e68 0f8366230000                   jae        0x7ff77bbf26d4
00e6e 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00e75 0f8359230000                   jae        0x7ff77bbf26d4
00e7b 4983c2f8                       add        r10, -8
00e7f 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00e87 0f8347230000                   jae        0x7ff77bbf26d4
00e8d 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00e93 0f8fdb230000                   jg         0x7ff77bbf2774
00e99 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00e9d 2bea                           sub        ebp, edx
00e9f 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00ea6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00eae 418bcb                         mov        ecx, r11d
00eb1 41baf8ffffff                   mov        r10d, 0xfffffff8
00eb7 442bd1                         sub        r10d, ecx
00eba 442bd2                         sub        r10d, edx
00ebd 83c210                         add        edx, 0x10
00ec0 4183c2f0                       add        r10d, -0x10
00ec4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00ec9 498bc3                         mov        rax, r11
00ecc 4d8d58c8                       lea        r11, [r8 - 0x38]
00ed0 4981fb00000080                 cmp        r11, -0x80000000
00ed7 48c7c100000080                 mov        rcx, 0xffffffff80000000
00ede 4c0f4cd9                       cmovl      r11, rcx
00ee2 418bcb                         mov        ecx, r11d
00ee5 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00eea 4c63da                         movsxd     r11, edx
00eed be06000000                     mov        esi, 6
00ef2 c442c8f5d2                     bzhi       r10, r10, rsi
00ef7 4d03da                         add        r11, r10
00efa 4d3bd8                         cmp        r11, r8
00efd 498bf0                         mov        rsi, r8
00f00 490f4cf3                       cmovl      rsi, r11
00f04 4c8bd6                         mov        r10, rsi
00f07 4c2bd7                         sub        r10, rdi
00f0a 4d8d5aff                       lea        r11, [r10 - 1]
00f0e 49c1fb3f                       sar        r11, 0x3f
00f12 49c1eb3d                       shr        r11, 0x3d
00f16 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
00f1b 4983e2f8                       and        r10, 0xfffffffffffffff8
00f1f 4c03d7                         add        r10, rdi
00f22 493bfa                         cmp        rdi, r10
00f25 490f4cfa                       cmovl      rdi, r10
00f29 448bd7                         mov        r10d, edi
00f2c 478d5c1608                     lea        r11d, [r14 + r10 + 8]
00f31 4183c208                       add        r10d, 8
00f35 4963fb                         movsxd     rdi, r11d
00f38 4803f8                         add        rdi, rax
00f3b 4963ea                         movsxd     rbp, r10d
00f3e 4803e8                         add        rbp, rax
00f41 4c8d5f08                       lea        r11, [rdi + 8]
00f45 4883c748                       add        rdi, 0x48
00f49 488d4548                       lea        rax, [rbp + 0x48]
00f4d 4533d2                         xor        r10d, r10d
00f50 493bc3                         cmp        rax, r11
00f53 410f96c2                       setbe      r10b
00f57 4883c508                       add        rbp, 8
00f5b 4533db                         xor        r11d, r11d
00f5e 483bfd                         cmp        rdi, rbp
00f61 410f96c3                       setbe      r11b
00f65 450bd3                         or         r10d, r11d
00f68 0f842f110000                   je         0x7ff77bbf159d
00f6e 448bd6                         mov        r10d, esi
00f71 eb05                           jmp        0x7ff77bbf0478
00f73 90                             nop        
00f74 8954244c                       mov        dword ptr [rsp + 0x4c], edx
00f78 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00f80 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
00f85 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00f8c 4a8b541a08                     mov        rdx, qword ptr [rdx + r11 + 8]
00f91 8b7c244c                       mov        edi, dword ptr [rsp + 0x4c]
00f95 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00f9d 4989543b08                     mov        qword ptr [r11 + rdi + 8], rdx
00fa2 8b54244c                       mov        edx, dword ptr [rsp + 0x4c]
00fa6 83c208                         add        edx, 8
00fa9 413bd2                         cmp        edx, r10d
00fac 7cc6                           jl         0x7ff77bbf0474
00fae 4981c008feffff                 add        r8, -0x1f8
00fb5 4981f800000080                 cmp        r8, -0x80000000
00fbc 49c7c200000080                 mov        r10, 0xffffffff80000000
00fc3 4d0f4cc2                       cmovl      r8, r10
00fc7 458bc0                         mov        r8d, r8d
00fca 413bd0                         cmp        edx, r8d
00fcd 0f8d41230000                   jge        0x7ff77bbf2814
00fd3 4c63d2                         movsxd     r10, edx
00fd6 4d03d1                         add        r10, r9
00fd9 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00fe1 0f8335230000                   jae        0x7ff77bbf281c
00fe7 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00feb 81c500020000                   add        ebp, 0x200
00ff1 4c63d5                         movsxd     r10, ebp
00ff4 4d03d1                         add        r10, r9
00ff7 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00fff 0f832b230000                   jae        0x7ff77bbf2830
01005 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
0100c 0f8332230000                   jae        0x7ff77bbf2844
01012 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01019 0f8339230000                   jae        0x7ff77bbf2858
0101f eb12                           jmp        0x7ff77bbf0533
01021 90                             nop        
01022 90                             nop        
01023 90                             nop        
01024 90                             nop        
01025 90                             nop        
01026 90                             nop        
01027 90                             nop        
01028 90                             nop        
01029 90                             nop        
0102a 90                             nop        
0102b 90                             nop        
0102c 90                             nop        
0102d 90                             nop        
0102e 90                             nop        
0102f 90                             nop        
01030 418bd3                         mov        edx, r11d
01033 8b8424f0000000                 mov        eax, dword ptr [rsp + 0xf0]
0103a 03c2                           add        eax, edx
0103c 448bda                         mov        r11d, edx
0103f 4d63d3                         movsxd     r10, r11d
01042 8bf8                           mov        edi, eax
01044 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0104c 62d17e486f843b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdi + 8]
01057 4c63e8                         movsxd     r13, eax
0105a 8d7a40                         lea        edi, [rdx + 0x40]
0105d 03bc24f0000000                 add        edi, dword ptr [rsp + 0xf0]
01064 8db280000000                   lea        esi, [rdx + 0x80]
0106a 03b424f0000000                 add        esi, dword ptr [rsp + 0xf0]
01071 8daa00010000                   lea        ebp, [rdx + 0x100]
01077 03ac24f0000000                 add        ebp, dword ptr [rsp + 0xf0]
0107e 448bda                         mov        r11d, edx
01081 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01088 62b17e487f841808000000         vmovdqu32  zmmword ptr [rax + r11 + 8], zmm0
01093 62f17e486f843808000000         vmovdqu32  zmm0, zmmword ptr [rax + rdi + 8]
0109e 62b17e487f841048000000         vmovdqu32  zmmword ptr [rax + r10 + 0x48], zmm0
010a9 62f17e486f843008000000         vmovdqu32  zmm0, zmmword ptr [rax + rsi + 8]
010b4 62b17e487f841088000000         vmovdqu32  zmmword ptr [rax + r10 + 0x88], zmm0
010bf 62b17e486f8428c8000000         vmovdqu32  zmm0, zmmword ptr [rax + r13 + 0xc8]
010ca 62b17e487f8410c8000000         vmovdqu32  zmmword ptr [rax + r10 + 0xc8], zmm0
010d5 8bfd                           mov        edi, ebp
010d7 62f17e486f843808000000         vmovdqu32  zmm0, zmmword ptr [rax + rdi + 8]
010e2 62b17e487f841008010000         vmovdqu32  zmmword ptr [rax + r10 + 0x108], zmm0
010ed 62b17e486f842848010000         vmovdqu32  zmm0, zmmword ptr [rax + r13 + 0x148]
010f8 62b17e487f841048010000         vmovdqu32  zmmword ptr [rax + r10 + 0x148], zmm0
01103 62b17e486f842888010000         vmovdqu32  zmm0, zmmword ptr [rax + r13 + 0x188]
0110e 62b17e487f841088010000         vmovdqu32  zmmword ptr [rax + r10 + 0x188], zmm0
01119 4c63dd                         movsxd     r11, ebp
0111c 62b17e486f8418c8000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 0xc8]
01127 62b17e487f8410c8010000         vmovdqu32  zmmword ptr [rax + r10 + 0x1c8], zmm0
01132 448d9a00020000                 lea        r11d, [rdx + 0x200]
01139 453bd8                         cmp        r11d, r8d
0113c 0f8ceefeffff                   jl         0x7ff77bbf0530
01142 443bd9                         cmp        r11d, ecx
01145 7d5d                           jge        0x7ff77bbf06a4
01147 81c238020000                   add        edx, 0x238
0114d 4c63d2                         movsxd     r10, edx
01150 4d03d1                         add        r10, r9
01153 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0115b 0f8377250000                   jae        0x7ff77bbf2bd8
01161 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01168 0f8392250000                   jae        0x7ff77bbf2c00
0116e 90                             nop        
0116f 90                             nop        
01170 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
01178 4503d3                         add        r10d, r11d
0117b 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01182 62b17e486f841708000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 8]
0118d 458bc3                         mov        r8d, r11d
01190 62b17e487f840708000000         vmovdqu32  zmmword ptr [rdi + r8 + 8], zmm0
0119b 4183c340                       add        r11d, 0x40
0119f 443bd9                         cmp        r11d, ecx
011a2 7ccc                           jl         0x7ff77bbf0670
011a4 443bdb                         cmp        r11d, ebx
011a7 7d54                           jge        0x7ff77bbf06fd
011a9 4d63d3                         movsxd     r10, r11d
011ac 4d03d1                         add        r10, r9
011af 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
011b7 0f832f250000                   jae        0x7ff77bbf2bec
011bd 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
011c5 0f8349250000                   jae        0x7ff77bbf2c14
011cb 90                             nop        
011cc 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
011d4 4503d3                         add        r10d, r11d
011d7 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
011df 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
011e4 458bc3                         mov        r8d, r11d
011e7 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
011ef 4f89540108                     mov        qword ptr [r9 + r8 + 8], r10
011f4 4183c308                       add        r11d, 8
011f8 443bdb                         cmp        r11d, ebx
011fb 7ccf                           jl         0x7ff77bbf06cc
011fd 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01201 e908f5ffff                     jmp        0x7ff77bbefc0e
01206 448bd0                         mov        r10d, eax
01209 4d63d2                         movsxd     r10, r10d
0120c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01213 c442a8f5db                     bzhi       r11, r11, r10
01218 c4c1fb92fb                     kmovq      k7, r11
0121d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01223 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01229 eb7a                           jmp        0x7ff77bbf07a5
0122b 4585c9                         test       r9d, r9d
0122e 0f8c38210000                   jl         0x7ff77bbf286c
01234 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01239 4585db                         test       r11d, r11d
0123c 0f8c2a210000                   jl         0x7ff77bbf286c
01242 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
0124a 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
0124f 0f8217210000                   jb         0x7ff77bbf286c
01255 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0125a 443bdb                         cmp        r11d, ebx
0125d 0f8209210000                   jb         0x7ff77bbf286c
01263 85c0                           test       eax, eax
01265 743e                           je         0x7ff77bbf07a5
01267 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0126c 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
01271 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01279 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0127e 4b8d741308                     lea        rsi, [r11 + r10 + 8]
01283 4883fa20                       cmp        rdx, 0x20
01287 0f8679ffffff                   jbe        0x7ff77bbf0706
0128d c5f877                         vzeroupper 
01290 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
0129a 41ffd2                         call       r10
0129d 0f1f840000000000               nop        dword ptr [rax + rax]
012a5 895c2464                       mov        dword ptr [rsp + 0x64], ebx
012a9 e93ef1ffff                     jmp        0x7ff77bbef8ec
012ae 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
012b6 0f8368210000                   jae        0x7ff77bbf2924
012bc 4963ce                         movsxd     rcx, r14d
012bf 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
012c7 c4c17a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 8]
012ce 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
012d3 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
012db 0f83ef210000                   jae        0x7ff77bbf29d0
012e1 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
012e6 418bfb                         mov        edi, r11d
012e9 418d6b10                       lea        ebp, [r11 + 0x10]
012ed 4d63d3                         movsxd     r10, r11d
012f0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
012f8 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
012ff 3beb                           cmp        ebp, ebx
01301 0f8dab020000                   jge        0x7ff77bbf0ab2
01307 492bca                         sub        rcx, r10
0130a 4c63dd                         movsxd     r11, ebp
0130d 4d8d140b                       lea        r10, [r11 + rcx]
01311 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01319 0f8369220000                   jae        0x7ff77bbf2a88
0131f 4d8bd0                         mov        r10, r8
01322 4d2bd3                         sub        r10, r11
01325 4983c20f                       add        r10, 0xf
01329 4983e2f0                       and        r10, 0xfffffffffffffff0
0132d 458bd2                         mov        r10d, r10d
01330 448bdf                         mov        r11d, edi
01333 478d541a10                     lea        r10d, [r10 + r11 + 0x10]
01338 4d63d2                         movsxd     r10, r10d
0133b 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
01340 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01348 0f833a220000                   jae        0x7ff77bbf2a88
0134e 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01355 0f832d220000                   jae        0x7ff77bbf2a88
0135b 4983c2f0                       add        r10, -0x10
0135f 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01367 0f831b220000                   jae        0x7ff77bbf2a88
0136d 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01373 0f8f8f220000                   jg         0x7ff77bbf2b08
01379 442bf7                         sub        r14d, edi
0137c 448d5f20                       lea        r11d, [rdi + 0x20]
01380 eb05                           jmp        0x7ff77bbf0887
01382 90                             nop        
01383 90                             nop        
01384 418bea                         mov        ebp, r10d
01387 458d0c2e                       lea        r9d, [r14 + rbp]
0138b 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01392 c4a17a6f440f08                 vmovdqu    xmm0, xmmword ptr [rdi + r9 + 8]
01399 448bd5                         mov        r10d, ebp
0139c c4a17a7f441708                 vmovdqu    xmmword ptr [rdi + r10 + 8], xmm0
013a3 448d5510                       lea        r10d, [rbp + 0x10]
013a7 453bd3                         cmp        r10d, r11d
013aa 7cd8                           jl         0x7ff77bbf0884
013ac 4981c010ffffff                 add        r8, -0xf0
013b3 4981f800000080                 cmp        r8, -0x80000000
013ba 49c7c300000080                 mov        r11, 0xffffffff80000000
013c1 4d0f4cc3                       cmovl      r8, r11
013c5 418bd0                         mov        edx, r8d
013c8 443bd2                         cmp        r10d, edx
013cb 0f8d91010000                   jge        0x7ff77bbf0a62
013d1 4d63da                         movsxd     r11, r10d
013d4 4c03d9                         add        r11, rcx
013d7 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
013df 0f83a3220000                   jae        0x7ff77bbf2b88
013e5 81c500010000                   add        ebp, 0x100
013eb 4c63dd                         movsxd     r11, ebp
013ee 4c03d9                         add        r11, rcx
013f1 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
013f9 0f839d220000                   jae        0x7ff77bbf2b9c
013ff 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01407 0f83a3220000                   jae        0x7ff77bbf2bb0
0140d 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01414 0f83aa220000                   jae        0x7ff77bbf2bc4
0141a 90                             nop        
0141b 90                             nop        
0141c 90                             nop        
0141d 90                             nop        
0141e 90                             nop        
0141f 90                             nop        
01420 478d1c16                       lea        r11d, [r14 + r10]
01424 458bca                         mov        r9d, r10d
01427 4d63c9                         movsxd     r9, r9d
0142a 458bc3                         mov        r8d, r11d
0142d 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01434 c4a17a6f440708                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 8]
0143b 4963fb                         movsxd     rdi, r11d
0143e 458bda                         mov        r11d, r10d
01441 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01449 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
01450 c4c17a6f443818                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x18]
01457 c4817a7f440818                 vmovdqu    xmmword ptr [r8 + r9 + 0x18], xmm0
0145e c4c17a6f443828                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x28]
01465 c4817a7f440828                 vmovdqu    xmmword ptr [r8 + r9 + 0x28], xmm0
0146c c4c17a6f443838                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x38]
01473 c4817a7f440838                 vmovdqu    xmmword ptr [r8 + r9 + 0x38], xmm0
0147a c4c17a6f443848                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x48]
01481 c4817a7f440848                 vmovdqu    xmmword ptr [r8 + r9 + 0x48], xmm0
01488 c4c17a6f443858                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x58]
0148f c4817a7f440858                 vmovdqu    xmmword ptr [r8 + r9 + 0x58], xmm0
01496 c4c17a6f443868                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x68]
0149d c4817a7f440868                 vmovdqu    xmmword ptr [r8 + r9 + 0x68], xmm0
014a4 c4c17a6f443878                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x78]
014ab c4817a7f440878                 vmovdqu    xmmword ptr [r8 + r9 + 0x78], xmm0
014b2 c4c17a6f843888000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x88]
014bc c4817a7f840888000000           vmovdqu    xmmword ptr [r8 + r9 + 0x88], xmm0
014c6 c4c17a6f843898000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0x98]
014d0 c4817a7f840898000000           vmovdqu    xmmword ptr [r8 + r9 + 0x98], xmm0
014da c4c17a6f8438a8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xa8]
014e4 c4817a7f8408a8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xa8], xmm0
014ee c4c17a6f8438b8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xb8]
014f8 c4817a7f8408b8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xb8], xmm0
01502 c4c17a6f8438c8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xc8]
0150c c4817a7f8408c8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xc8], xmm0
01516 c4c17a6f8438d8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xd8]
01520 c4817a7f8408d8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xd8], xmm0
0152a c4c17a6f8438e8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xe8]
01534 c4817a7f8408e8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xe8], xmm0
0153e c4c17a6f8438f8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdi + 0xf8]
01548 c4817a7f8408f8000000           vmovdqu    xmmword ptr [r8 + r9 + 0xf8], xmm0
01552 4181c200010000                 add        r10d, 0x100
01559 443bd2                         cmp        r10d, edx
0155c 0f8cbefeffff                   jl         0x7ff77bbf0920
01562 443bd3                         cmp        r10d, ebx
01565 7d4b                           jge        0x7ff77bbf0ab2
01567 4d63da                         movsxd     r11, r10d
0156a 4c03d9                         add        r11, rcx
0156d 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01575 0f83ad210000                   jae        0x7ff77bbf2c28
0157b 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01583 0f83b3210000                   jae        0x7ff77bbf2c3c
01589 90                             nop        
0158a 90                             nop        
0158b 90                             nop        
0158c 478d0416                       lea        r8d, [r14 + r10]
01590 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01598 c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
0159f 458bda                         mov        r11d, r10d
015a2 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
015a9 4183c210                       add        r10d, 0x10
015ad 443bd3                         cmp        r10d, ebx
015b0 7cda                           jl         0x7ff77bbf0a8c
015b2 895c2464                       mov        dword ptr [rsp + 0x64], ebx
015b6 e953f1ffff                     jmp        0x7ff77bbefc0e
015bb 4803d9                         add        rbx, rcx
015be 483b5c2440                     cmp        rbx, qword ptr [rsp + 0x40]
015c3 7e08                           jle        0x7ff77bbf0acd
015c5 4533c0                         xor        r8d, r8d
015c8 e9e9eaffff                     jmp        0x7ff77bbef5b6
015cd 4533c0                         xor        r8d, r8d
015d0 bf01000000                     mov        edi, 1
015d5 e9deeaffff                     jmp        0x7ff77bbef5b8
015da 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
015e2 4d8bd3                         mov        r10, r11
015e5 4c3b252c09da18                 cmp        r12, qword ptr [rip + 0x18da092c]
015ec 0f8414000000                   je         0x7ff77bbf0b06
015f2 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
015fc 4883e4f0                       and        rsp, 0xfffffffffffffff0
01600 e8dbf01618                     call       0x7ff793d5fbe0
01605 f4                             hlt        
01606 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0160e 418be9                         mov        ebp, r9d
01611 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
01619 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
01620 498bf2                         mov        rsi, r10
01623 8b542464                       mov        edx, dword ptr [rsp + 0x64]
01627 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
0162e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01633 8bf8                           mov        edi, eax
01635 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0163d 44891424                       mov        dword ptr [rsp], r10d
01641 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01646 44895c2408                     mov        dword ptr [rsp + 8], r11d
0164b 90                             nop        
0164c c5f877                         vzeroupper 
0164f e80cf1b3ff                     call       0x7ff77b72fc60
01654 0f1f84004c170002               nop        dword ptr [rax + rax + 0x200174c]
0165c 89442464                       mov        dword ptr [rsp + 0x64], eax
01660 e9a9f0ffff                     jmp        0x7ff77bbefc0e
01665 bee4ffffff                     mov        esi, 0xffffffe4
0166a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0166f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01674 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0167c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01681 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01689 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0168e 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01696 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0169b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016a0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016a5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016aa 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016af 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016b4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016b9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
016be 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016c3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016c8 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016cd 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
016d2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
016d7 89442448                       mov        dword ptr [rsp + 0x48], eax
016db 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
016e0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
016e5 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
016ea 90                             nop        
016eb 90                             nop        
016ec c5f877                         vzeroupper 
016ef e86cceadff                     call       0x7ff77b6cda60
016f4 0f1f8400ec170003               nop        dword ptr [rax + rax + 0x30017ec]
016fc 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170a e8d1ef1618                     call       0x7ff793d5fbe0
0170f f4                             hlt        
01710 bee4ffffff                     mov        esi, 0xffffffe4
01715 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0171a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0171f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01727 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0172c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01734 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01739 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01741 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01746 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0174b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01753 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01758 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0175d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01762 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01767 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0176c 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01771 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01776 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0177b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01780 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01785 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0178a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0178f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01794 89442448                       mov        dword ptr [rsp + 0x48], eax
01798 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0179d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
017a2 48894424f8                     mov        qword ptr [rsp - 8], rax
017a7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017ab 89442458                       mov        dword ptr [rsp + 0x58], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
017ba 90                             nop        
017bb 90                             nop        
017bc c5f877                         vzeroupper 
017bf e89ccdadff                     call       0x7ff77b6cda60
017c4 0f1f8400bc180004               nop        dword ptr [rax + rax + 0x40018bc]
017cc 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
017d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017da e801ef1618                     call       0x7ff793d5fbe0
017df f4                             hlt        
017e0 bee4ffffff                     mov        esi, 0xffffffe4
017e5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
017ea 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
017ef 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
017f7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017fc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01804 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01809 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01811 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01816 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0181b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01823 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01828 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0182d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01832 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01837 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0183c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01841 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01846 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0184b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01850 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01855 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0185a 90                             nop        
0185b 90                             nop        
0185c c5f877                         vzeroupper 
0185f e8fcccadff                     call       0x7ff77b6cda60
01864 0f1f84005c190005               nop        dword ptr [rax + rax + 0x500195c]
0186c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01876 4883e4f0                       and        rsp, 0xfffffffffffffff0
0187a e861ee1618                     call       0x7ff793d5fbe0
0187f f4                             hlt        
01880 bee4ffffff                     mov        esi, 0xffffffe4
01885 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0188a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0188f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01897 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0189c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018a4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
018a9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
018b1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018bb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
018c3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018c8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018cd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
018d2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
018d7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018dc 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
018e1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
018e6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
018eb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018f0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018f5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018fa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
018ff 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01903 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01909 90                             nop        
0190a 90                             nop        
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e84cccadff                     call       0x7ff77b6cda60
01914 0f1f84000c1a0006               nop        dword ptr [rax + rax + 0x6001a0c]
0191c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e8b1ed1618                     call       0x7ff793d5fbe0
0192f f4                             hlt        
01930 be45ffffff                     mov        esi, 0xffffff45
01935 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
0193d 90                             nop        
0193e 90                             nop        
0193f 90                             nop        
01940 c5f877                         vzeroupper 
01943 e818ccadff                     call       0x7ff77b6cda60
01948 0f1f8400401a0007               nop        dword ptr [rax + rax + 0x7001a40]
01950 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0195a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0195e e87ded1618                     call       0x7ff793d5fbe0
01963 f4                             hlt        
01964 be45ffffff                     mov        esi, 0xffffff45
01969 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0196e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01973 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0197b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01980 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01988 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0198d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01995 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0199a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0199f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
019a4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019a9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019ae 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019b3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019b8 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
019bd 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019c2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019c7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019cc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019d1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019d6 4489442444                     mov        dword ptr [rsp + 0x44], r8d
019db 89442448                       mov        dword ptr [rsp + 0x48], eax
019df 897c2450                       mov        dword ptr [rsp + 0x50], edi
019e3 90                             nop        
019e4 c5f877                         vzeroupper 
019e7 e874cbadff                     call       0x7ff77b6cda60
019ec 0f1f8400e41a0008               nop        dword ptr [rax + rax + 0x8001ae4]
019f4 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
019fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a02 e8d9ec1618                     call       0x7ff793d5fbe0
01a07 f4                             hlt        
01a08 493bdb                         cmp        rbx, r11
01a0b bdffffffff                     mov        ebp, 0xffffffff
01a10 7c08                           jl         0x7ff77bbf0f1a
01a12 400f95c5                       setne      bpl
01a16 400fb6ed                       movzx      ebp, bpl
01a1a be45ffffff                     mov        esi, 0xffffff45
01a1f 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01a24 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01a2c 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a31 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01a39 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a3e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a43 48894424f8                     mov        qword ptr [rsp - 8], rax
01a48 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a4c 89442420                       mov        dword ptr [rsp + 0x20], eax
01a50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a55 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a5a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a5f 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a64 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01a69 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01a6e 89442450                       mov        dword ptr [rsp + 0x50], eax
01a72 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01a77 90                             nop        
01a78 c5f877                         vzeroupper 
01a7b e8e0caadff                     call       0x7ff77b6cda60
01a80 0f1f8400781b0009               nop        dword ptr [rax + rax + 0x9001b78]
01a88 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a96 e845ec1618                     call       0x7ff793d5fbe0
01a9b f4                             hlt        
01a9c be45ffffff                     mov        esi, 0xffffff45
01aa1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01aa6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01aab 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01ab3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ab8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01ac0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01ac5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01acd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ad2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ad7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01adc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01ae1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ae6 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01aeb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01af0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01af5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01afa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01aff 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b04 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b09 89442448                       mov        dword ptr [rsp + 0x48], eax
01b0d 90                             nop        
01b0e 90                             nop        
01b0f 90                             nop        
01b10 c5f877                         vzeroupper 
01b13 e848caadff                     call       0x7ff77b6cda60
01b18 0f1f8400101c000a               nop        dword ptr [rax + rax + 0xa001c10]
01b20 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01b2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2e e8adeb1618                     call       0x7ff793d5fbe0
01b33 f4                             hlt        
01b34 bee4ffffff                     mov        esi, 0xffffffe4
01b39 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b3e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b43 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01b4b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b50 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01b58 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b5d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01b65 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b6f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01b77 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b7c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01b81 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b86 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b8b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b90 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01b95 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01b9a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b9f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ba4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ba9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bae 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bb3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01bb8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01bbd 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01bc2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01bc7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01bcb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01bd0 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01bd5 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01bda 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01bdf 90                             nop        
01be0 c5f877                         vzeroupper 
01be3 e878c9adff                     call       0x7ff77b6cda60
01be8 0f1f8400e01c000b               nop        dword ptr [rax + rax + 0xb001ce0]
01bf0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01bfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfe e8ddea1618                     call       0x7ff793d5fbe0
01c03 f4                             hlt        
01c04 bee4ffffff                     mov        esi, 0xffffffe4
01c09 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c0e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c13 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01c1b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c20 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01c28 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c2d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01c35 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c3a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c3f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01c47 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c4c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c51 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c56 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c5b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c60 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c65 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c6a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c6f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c74 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c79 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c7e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c83 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c88 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01c8d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01c92 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c97 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01c9b 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01ca0 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01ca5 90                             nop        
01ca6 90                             nop        
01ca7 90                             nop        
01ca8 c5f877                         vzeroupper 
01cab e8b0c8adff                     call       0x7ff77b6cda60
01cb0 0f1f8400a81d000c               nop        dword ptr [rax + rax + 0xc001da8]
01cb8 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01cc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cc6 e815ea1618                     call       0x7ff793d5fbe0
01ccb f4                             hlt        
01ccc 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01cd1 4d3bc2                         cmp        r8, r10
01cd4 bdffffffff                     mov        ebp, 0xffffffff
01cd9 7c08                           jl         0x7ff77bbf11e3
01cdb 400f95c5                       setne      bpl
01cdf 400fb6ed                       movzx      ebp, bpl
01ce3 be45ffffff                     mov        esi, 0xffffff45
01ce8 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01cec 898c24f8000000                 mov        dword ptr [rsp + 0xf8], ecx
01cf3 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01cf7 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
01cfe 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01d03 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01d08 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01d0d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01d12 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d17 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d1c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d21 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d26 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01d2b 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01d30 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d34 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01d39 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01d3e 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01d43 90                             nop        
01d44 c5f877                         vzeroupper 
01d47 e814c8adff                     call       0x7ff77b6cda60
01d4c 0f1f8400441e000d               nop        dword ptr [rax + rax + 0xd001e44]
01d54 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d62 e879e91618                     call       0x7ff793d5fbe0
01d67 f4                             hlt        
01d68 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d6d 493bea                         cmp        rbp, r10
01d70 bdffffffff                     mov        ebp, 0xffffffff
01d75 7c08                           jl         0x7ff77bbf127f
01d77 400f95c5                       setne      bpl
01d7b 400fb6ed                       movzx      ebp, bpl
01d7f be45ffffff                     mov        esi, 0xffffff45
01d84 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01d89 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01d91 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01d96 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01d9e 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01da3 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01da8 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01dad 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01db2 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01db7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01dbc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01dc1 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01dc6 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01dcb 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01dd0 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01dd4 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01dd9 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01dde 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01de3 90                             nop        
01de4 c5f877                         vzeroupper 
01de7 e874c7adff                     call       0x7ff77b6cda60
01dec 0f1f8400e41e000e               nop        dword ptr [rax + rax + 0xe001ee4]
01df4 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e8d9e81618                     call       0x7ff793d5fbe0
01e07 f4                             hlt        
01e08 4183c608                       add        r14d, 8
01e0c be6effffff                     mov        esi, 0xffffff6e
01e11 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e16 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01e1b 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
01e23 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e28 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e30 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01e35 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
01e3d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e42 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e47 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01e4c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e51 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e56 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01e5b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01e60 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01e65 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e6a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e6f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e74 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01e79 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01e7e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01e83 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01e88 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01e8d 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01e92 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01e96 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01e9a 90                             nop        
01e9b 90                             nop        
01e9c c5f877                         vzeroupper 
01e9f e8bcc6adff                     call       0x7ff77b6cda60
01ea4 0f1f84009c1f000f               nop        dword ptr [rax + rax + 0xf001f9c]
01eac 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eba e821e81618                     call       0x7ff793d5fbe0
01ebf f4                             hlt        
01ec0 4183c608                       add        r14d, 8
01ec4 be66ffffff                     mov        esi, 0xffffff66
01ec9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01ece 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01ed3 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01edb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ee0 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01ee8 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01eed 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01ef5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01efa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01eff 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01f04 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01f09 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f0e 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01f13 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01f18 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01f1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f22 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f27 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f2c 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01f31 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01f36 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01f3b 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01f40 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01f45 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01f4a 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01f4e 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01f52 90                             nop        
01f53 90                             nop        
01f54 c5f877                         vzeroupper 
01f57 e804c6adff                     call       0x7ff77b6cda60
01f5c 0f1f840054200010               nop        dword ptr [rax + rax + 0x10002054]
01f64 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
01f6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f72 e869e71618                     call       0x7ff793d5fbe0
01f77 f4                             hlt        
01f78 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01f82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f86 e855e71618                     call       0x7ff793d5fbe0
01f8b f4                             hlt        
01f8c 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9a e841e71618                     call       0x7ff793d5fbe0
01f9f f4                             hlt        
01fa0 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01faa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fae e82de71618                     call       0x7ff793d5fbe0
01fb3 f4                             hlt        
01fb4 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01fbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc2 e819e71618                     call       0x7ff793d5fbe0
01fc7 f4                             hlt        
01fc8 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01fd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fd6 e805e71618                     call       0x7ff793d5fbe0
01fdb f4                             hlt        
01fdc 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
01fe6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fea e8f1e61618                     call       0x7ff793d5fbe0
01fef f4                             hlt        
01ff0 beccffffff                     mov        esi, 0xffffffcc
01ff5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01ffa 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01fff 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02007 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0200c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02014 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02019 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02021 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02026 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0202b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02033 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02038 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0203d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02042 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
02047 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0204c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02051 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02056 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0205b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02060 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02065 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0206a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0206f 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02074 c5f877                         vzeroupper 
02077 e8e4c4adff                     call       0x7ff77b6cda60
0207c 0f1f840074210011               nop        dword ptr [rax + rax + 0x11002174]
02084 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0208e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02092 e849e61618                     call       0x7ff793d5fbe0
02097 f4                             hlt        
02098 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0209d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
020a5 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
020aa 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
020b2 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
020b7 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
020bc 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
020c4 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
020c9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
020ce 4183c308                       add        r11d, 8
020d2 443bda                         cmp        r11d, edx
020d5 7cc1                           jl         0x7ff77bbf1598
020d7 443bd9                         cmp        r11d, ecx
020da 0f8dde000000                   jge        0x7ff77bbf16be
020e0 4d63d3                         movsxd     r10, r11d
020e3 4d03d1                         add        r10, r9
020e6 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
020ee 0f835c160000                   jae        0x7ff77bbf2c50
020f4 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
020f9 4183c240                       add        r10d, 0x40
020fd 458bc2                         mov        r8d, r10d
02100 4d63d2                         movsxd     r10, r10d
02103 4d03d1                         add        r10, r9
02106 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0210e 0f8350160000                   jae        0x7ff77bbf2c64
02114 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0211c 0f8356160000                   jae        0x7ff77bbf2c78
02122 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
0212a 0f835c160000                   jae        0x7ff77bbf2c8c
02130 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
02138 4503d3                         add        r10d, r11d
0213b 458bc3                         mov        r8d, r11d
0213e 4963d0                         movsxd     rdx, r8d
02141 418bfa                         mov        edi, r10d
02144 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
0214b 488b7c3e08                     mov        rdi, qword ptr [rsi + rdi + 8]
02150 4963f2                         movsxd     rsi, r10d
02153 458bd3                         mov        r10d, r11d
02156 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0215e 4b897c1008                     mov        qword ptr [r8 + r10 + 8], rdi
02163 4d8b543010                     mov        r10, qword ptr [r8 + rsi + 0x10]
02168 4d89541010                     mov        qword ptr [r8 + rdx + 0x10], r10
0216d 4d8b543018                     mov        r10, qword ptr [r8 + rsi + 0x18]
02172 4d89541018                     mov        qword ptr [r8 + rdx + 0x18], r10
02177 4d8b543020                     mov        r10, qword ptr [r8 + rsi + 0x20]
0217c 4d89541020                     mov        qword ptr [r8 + rdx + 0x20], r10
02181 4d8b543028                     mov        r10, qword ptr [r8 + rsi + 0x28]
02186 4d89541028                     mov        qword ptr [r8 + rdx + 0x28], r10
0218b 4d8b543030                     mov        r10, qword ptr [r8 + rsi + 0x30]
02190 4d89541030                     mov        qword ptr [r8 + rdx + 0x30], r10
02195 4d8b543038                     mov        r10, qword ptr [r8 + rsi + 0x38]
0219a 4d89541038                     mov        qword ptr [r8 + rdx + 0x38], r10
0219f 4d8b443040                     mov        r8, qword ptr [r8 + rsi + 0x40]
021a4 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021ac 4d89441240                     mov        qword ptr [r10 + rdx + 0x40], r8
021b1 4183c340                       add        r11d, 0x40
021b5 443bd9                         cmp        r11d, ecx
021b8 0f8c72ffffff                   jl         0x7ff77bbf1630
021be 443bdb                         cmp        r11d, ebx
021c1 0f8d36f0ffff                   jge        0x7ff77bbf06fd
021c7 4d63d3                         movsxd     r10, r11d
021ca 4d03d1                         add        r10, r9
021cd 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
021d5 0f83c5150000                   jae        0x7ff77bbf2ca0
021db 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
021e3 0f83cb150000                   jae        0x7ff77bbf2cb4
021e9 90                             nop        
021ea 90                             nop        
021eb 90                             nop        
021ec 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
021f4 4503d3                         add        r10d, r11d
021f7 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
021ff 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
02204 458bc3                         mov        r8d, r11d
02207 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
0220f 4f89540108                     mov        qword ptr [r9 + r8 + 8], r10
02214 4183c308                       add        r11d, 8
02218 443bdb                         cmp        r11d, ebx
0221b 7ccf                           jl         0x7ff77bbf16ec
0221d e9dbefffff                     jmp        0x7ff77bbf06fd
02222 bee4ffffff                     mov        esi, 0xffffffe4
02227 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0222c 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02231 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02239 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0223e 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02246 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0224b 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02253 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02258 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0225d 48894424f8                     mov        qword ptr [rsp - 8], rax
02262 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02266 89442418                       mov        dword ptr [rsp + 0x18], eax
0226a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0226f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02274 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02279 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0227e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02283 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02288 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0228d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02292 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02297 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0229c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022a1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
022a6 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
022ab 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022b0 4489442444                     mov        dword ptr [rsp + 0x44], r8d
022b5 89442448                       mov        dword ptr [rsp + 0x48], eax
022b9 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
022bd 897c245c                       mov        dword ptr [rsp + 0x5c], edi
022c1 90                             nop        
022c2 90                             nop        
022c3 90                             nop        
022c4 c5f877                         vzeroupper 
022c7 e894c2adff                     call       0x7ff77b6cda60
022cc 0f1f8400c4230012               nop        dword ptr [rax + rax + 0x120023c4]
022d4 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
022de 4883e4f0                       and        rsp, 0xfffffffffffffff0
022e2 e8f9e31618                     call       0x7ff793d5fbe0
022e7 f4                             hlt        
022e8 beccffffff                     mov        esi, 0xffffffcc
022ed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
022f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
022fa 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
022ff 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02307 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0230c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02311 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02319 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0231e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02323 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02328 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0232d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02332 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02337 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0233c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02341 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02346 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0234b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02350 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02355 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0235a 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0235f 90                             nop        
02360 c5f877                         vzeroupper 
02363 e8f8c1adff                     call       0x7ff77b6cda60
02368 0f1f840060240013               nop        dword ptr [rax + rax + 0x13002460]
02370 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0237a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0237e e85de31618                     call       0x7ff793d5fbe0
02383 f4                             hlt        
02384 bee4ffffff                     mov        esi, 0xffffffe4
02389 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0238e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02393 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0239b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023a0 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
023a8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023ad 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
023b5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023ba 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023bf 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
023c7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023cc 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
023d1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
023d6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023db 4c89542420                     mov        qword ptr [rsp + 0x20], r10
023e0 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
023e5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
023ea 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023ef 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023f4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
023f9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
023fe 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02403 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02408 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0240d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02412 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02417 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0241c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02421 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02426 90                             nop        
02427 90                             nop        
02428 c5f877                         vzeroupper 
0242b e830c1adff                     call       0x7ff77b6cda60
02430 0f1f840028250014               nop        dword ptr [rax + rax + 0x14002528]
02438 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02442 4883e4f0                       and        rsp, 0xfffffffffffffff0
02446 e895e21618                     call       0x7ff793d5fbe0
0244b f4                             hlt        
0244c bee4ffffff                     mov        esi, 0xffffffe4
02451 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02456 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0245e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02463 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0246b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02470 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02475 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0247d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02482 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02487 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0248c 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02491 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02496 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0249b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024a0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024a5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
024aa 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
024af 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
024b4 4489542444                     mov        dword ptr [rsp + 0x44], r10d
024b9 4489742454                     mov        dword ptr [rsp + 0x54], r14d
024be 90                             nop        
024bf 90                             nop        
024c0 c5f877                         vzeroupper 
024c3 e898c0adff                     call       0x7ff77b6cda60
024c8 0f1f8400c0250015               nop        dword ptr [rax + rax + 0x150025c0]
024d0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
024da 4883e4f0                       and        rsp, 0xfffffffffffffff0
024de e8fde11618                     call       0x7ff793d5fbe0
024e3 f4                             hlt        
024e4 418d6e01                       lea        ebp, [r14 + 1]
024e8 bee4ffffff                     mov        esi, 0xffffffe4
024ed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
024f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
024fa 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
024ff 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02507 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0250c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02511 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02519 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0251e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02523 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02528 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0252d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02532 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02537 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0253c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02541 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02546 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0254b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02550 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02555 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0255a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0255f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02564 c5f877                         vzeroupper 
02567 e8f4bfadff                     call       0x7ff77b6cda60
0256c 0f1f840064260016               nop        dword ptr [rax + rax + 0x16002664]
02574 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0257e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02582 e859e11618                     call       0x7ff793d5fbe0
02587 f4                             hlt        
02588 bee4ffffff                     mov        esi, 0xffffffe4
0258d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02592 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0259a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0259f 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
025a7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025b1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
025b9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025be 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
025c3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
025c8 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
025cd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
025d2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025d7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025e1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025e6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025eb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
025f0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025f5 4489742454                     mov        dword ptr [rsp + 0x54], r14d
025fa 90                             nop        
025fb 90                             nop        
025fc c5f877                         vzeroupper 
025ff e85cbfadff                     call       0x7ff77b6cda60
02604 0f1f8400fc260017               nop        dword ptr [rax + rax + 0x170026fc]
0260c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02616 4883e4f0                       and        rsp, 0xfffffffffffffff0
0261a e8c1e01618                     call       0x7ff793d5fbe0
0261f f4                             hlt        
02620 bee4ffffff                     mov        esi, 0xffffffe4
02625 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0262a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0262f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02637 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0263c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02644 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02649 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02651 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02656 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0265b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02660 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02665 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0266a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0266f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02674 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02679 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0267e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02683 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02688 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0268d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02692 894c2444                       mov        dword ptr [rsp + 0x44], ecx
02696 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0269b 90                             nop        
0269c c5f877                         vzeroupper 
0269f e8bcbeadff                     call       0x7ff77b6cda60
026a4 0f1f84009c270018               nop        dword ptr [rax + rax + 0x1800279c]
026ac 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
026b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ba e821e01618                     call       0x7ff793d5fbe0
026bf f4                             hlt        
026c0 bee4ffffff                     mov        esi, 0xffffffe4
026c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
026ca 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
026cf 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
026d7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
026dc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
026e4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
026e9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
026f1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
026f6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026fb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02700 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02705 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0270a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0270f 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02714 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02719 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0271e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02723 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02728 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0272d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02732 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02737 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0273c 894c2444                       mov        dword ptr [rsp + 0x44], ecx
02740 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02745 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0274a 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0274e 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02753 90                             nop        
02754 c5f877                         vzeroupper 
02757 e804beadff                     call       0x7ff77b6cda60
0275c 0f1f840054280019               nop        dword ptr [rax + rax + 0x19002854]
02764 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0276e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02772 e869df1618                     call       0x7ff793d5fbe0
02777 f4                             hlt        
02778 bee4ffffff                     mov        esi, 0xffffffe4
0277d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02782 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0278a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0278f 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02797 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0279c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027a1 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
027a6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
027ab 4c89542430                     mov        qword ptr [rsp + 0x30], r10
027b0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027b5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027ba 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
027bf 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
027c4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
027c9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
027ce 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
027d2 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
027d7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
027dc 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
027e0 c5f877                         vzeroupper 
027e3 e878bdadff                     call       0x7ff77b6cda60
027e8 0f1f8400e028001a               nop        dword ptr [rax + rax + 0x1a0028e0]
027f0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
027fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
027fe e8ddde1618                     call       0x7ff793d5fbe0
02803 f4                             hlt        
02804 85db                           test       ebx, ebx
02806 0f84bc0f0000                   je         0x7ff77bbf2cc8
0280c 4c8bdb                         mov        r11, rbx
0280f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02814 4533c0                         xor        r8d, r8d
02817 e91fe5ffff                     jmp        0x7ff77bbf023b
0281c be6effffff                     mov        esi, 0xffffff6e
02821 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02826 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0282b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02833 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02838 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02840 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02845 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0284d 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02852 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02857 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0285c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02861 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02866 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0286b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02870 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02875 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0287a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0287f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02884 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02889 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0288e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02893 89442448                       mov        dword ptr [rsp + 0x48], eax
02897 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0289c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
028a1 895c2458                       mov        dword ptr [rsp + 0x58], ebx
028a5 897c2460                       mov        dword ptr [rsp + 0x60], edi
028a9 90                             nop        
028aa 90                             nop        
028ab 90                             nop        
028ac c5f877                         vzeroupper 
028af e8acbcadff                     call       0x7ff77b6cda60
028b4 0f1f8400ac29001b               nop        dword ptr [rax + rax + 0x1b0029ac]
028bc 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
028c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ca e811de1618                     call       0x7ff793d5fbe0
028cf f4                             hlt        
028d0 be45ffffff                     mov        esi, 0xffffff45
028d5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
028da 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
028df 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
028e7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
028ec 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
028f4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028f9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02901 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02906 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0290b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02910 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02915 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0291a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0291f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02924 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02929 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0292e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02933 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02938 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0293d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02942 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02947 89442448                       mov        dword ptr [rsp + 0x48], eax
0294b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0294f 897c245c                       mov        dword ptr [rsp + 0x5c], edi
02953 90                             nop        
02954 c5f877                         vzeroupper 
02957 e804bcadff                     call       0x7ff77b6cda60
0295c 0f1f8400542a001c               nop        dword ptr [rax + rax + 0x1c002a54]
02964 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0296e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02972 e869dd1618                     call       0x7ff793d5fbe0
02977 f4                             hlt        
02978 be3dffffff                     mov        esi, 0xffffff3d
0297d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02982 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02987 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0298f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02994 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0299c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
029a1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
029a9 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
029ae 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
029b3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
029b8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
029bd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
029c2 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
029c7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
029cc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
029d1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029d6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
029db 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
029e0 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
029e5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
029ea 4489442444                     mov        dword ptr [rsp + 0x44], r8d
029ef 89442448                       mov        dword ptr [rsp + 0x48], eax
029f3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
029f7 897c245c                       mov        dword ptr [rsp + 0x5c], edi
029fb 90                             nop        
029fc c5f877                         vzeroupper 
029ff e85cbbadff                     call       0x7ff77b6cda60
02a04 0f1f8400fc2a001d               nop        dword ptr [rax + rax + 0x1d002afc]
02a0c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1a e8c1dc1618                     call       0x7ff793d5fbe0
02a1f f4                             hlt        
02a20 bee4ffffff                     mov        esi, 0xffffffe4
02a25 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02a2a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02a32 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02a37 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02a3f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02a44 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a49 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02a4e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a53 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a58 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a5d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a62 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a67 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02a6c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02a71 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02a76 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02a7b 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02a80 894c2454                       mov        dword ptr [rsp + 0x54], ecx
02a84 894c2458                       mov        dword ptr [rsp + 0x58], ecx
02a88 c5f877                         vzeroupper 
02a8b e8d0baadff                     call       0x7ff77b6cda60
02a90 0f1f8400882b001e               nop        dword ptr [rax + rax + 0x1e002b88]
02a98 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02aa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aa6 e835dc1618                     call       0x7ff793d5fbe0
02aab f4                             hlt        
02aac bee4ffffff                     mov        esi, 0xffffffe4
02ab1 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02ab6 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02abe 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ac3 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02acb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ad0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ad5 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02ada 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02adf 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ae4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ae9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02aee 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02af3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02af8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02afd 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02b02 894c2454                       mov        dword ptr [rsp + 0x54], ecx
02b06 90                             nop        
02b07 90                             nop        
02b08 c5f877                         vzeroupper 
02b0b e850baadff                     call       0x7ff77b6cda60
02b10 0f1f8400082c001f               nop        dword ptr [rax + rax + 0x1f002c08]
02b18 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b26 e8b5db1618                     call       0x7ff793d5fbe0
02b2b f4                             hlt        
02b2c beccffffff                     mov        esi, 0xffffffcc
02b31 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b36 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02b3b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02b43 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b48 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02b50 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02b55 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02b5d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b62 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b67 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02b6f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02b74 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b79 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b7e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b83 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b88 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02b8d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b92 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b97 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b9c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ba1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02ba6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02bab 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02bb0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02bb5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02bba 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02bbf 4489742458                     mov        dword ptr [rsp + 0x58], r14d
02bc4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02bc9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02bce 90                             nop        
02bcf 90                             nop        
02bd0 c5f877                         vzeroupper 
02bd3 e888b9adff                     call       0x7ff77b6cda60
02bd8 0f1f8400d02c0020               nop        dword ptr [rax + rax + 0x20002cd0]
02be0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02bea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bee e8edda1618                     call       0x7ff793d5fbe0
02bf3 f4                             hlt        
02bf4 bee4ffffff                     mov        esi, 0xffffffe4
02bf9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02bfe 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02c03 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02c0b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c10 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02c18 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c1d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02c25 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c2a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c2f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02c34 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02c39 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02c3e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c43 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c48 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c4d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c52 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02c57 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02c5c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02c61 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02c66 89442444                       mov        dword ptr [rsp + 0x44], eax
02c6a 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02c6f 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02c74 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02c78 48894424f8                     mov        qword ptr [rsp - 8], rax
02c7d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c81 89442454                       mov        dword ptr [rsp + 0x54], eax
02c85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c8a 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02c8f 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02c94 c5f877                         vzeroupper 
02c97 e8c4b8adff                     call       0x7ff77b6cda60
02c9c 0f1f8400942d0021               nop        dword ptr [rax + rax + 0x21002d94]
02ca4 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02cae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cb2 e829da1618                     call       0x7ff793d5fbe0
02cb7 f4                             hlt        
02cb8 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02cc1 bee4ffffff                     mov        esi, 0xffffffe4
02cc6 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ccb 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02cd0 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02cd8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02cdd 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02ce5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02cea 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02cf2 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02cf7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02cfc 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02d04 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d09 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02d0e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02d13 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02d18 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d1d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d22 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d27 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d2c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02d31 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02d36 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02d3b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d40 89442444                       mov        dword ptr [rsp + 0x44], eax
02d44 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02d49 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02d4e 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02d52 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02d57 48894424f8                     mov        qword ptr [rsp - 8], rax
02d5c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d60 89442460                       mov        dword ptr [rsp + 0x60], eax
02d64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d69 90                             nop        
02d6a 90                             nop        
02d6b 90                             nop        
02d6c c5f877                         vzeroupper 
02d6f e8ecb7adff                     call       0x7ff77b6cda60
02d74 0f1f84006c2e0022               nop        dword ptr [rax + rax + 0x22002e6c]
02d7c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d8a e851d91618                     call       0x7ff793d5fbe0
02d8f f4                             hlt        
02d90 418be9                         mov        ebp, r9d
02d93 83c510                         add        ebp, 0x10
02d96 be6effffff                     mov        esi, 0xffffff6e
02d9b 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02da0 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02da8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02dad 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02db5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02dba 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02dbf 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02dc4 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02dc9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02dce 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02dd3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02dd8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ddd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02de2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02de7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02dec 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02df1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02df5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02dfa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02dff 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02e03 90                             nop        
02e04 c5f877                         vzeroupper 
02e07 e854b7adff                     call       0x7ff77b6cda60
02e0c 0f1f8400042f0023               nop        dword ptr [rax + rax + 0x23002f04]
02e14 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02e1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e22 e8b9d81618                     call       0x7ff793d5fbe0
02e27 f4                             hlt        
02e28 418be9                         mov        ebp, r9d
02e2b 83c510                         add        ebp, 0x10
02e2e be66ffffff                     mov        esi, 0xffffff66
02e33 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02e38 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02e40 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02e45 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02e4d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e52 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e57 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02e5c 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02e61 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e66 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e6b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e70 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02e75 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e7a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02e7f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e84 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02e89 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e8d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02e92 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02e97 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02e9b 90                             nop        
02e9c c5f877                         vzeroupper 
02e9f e8bcb6adff                     call       0x7ff77b6cda60
02ea4 0f1f84009c2f0024               nop        dword ptr [rax + rax + 0x24002f9c]
02eac 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eba e821d81618                     call       0x7ff793d5fbe0
02ebf f4                             hlt        
02ec0 be17000000                     mov        esi, 0x17
02ec5 90                             nop        
02ec6 90                             nop        
02ec7 90                             nop        
02ec8 c5f877                         vzeroupper 
02ecb e890b6adff                     call       0x7ff77b6cda60
02ed0 0f1f8400c82f0025               nop        dword ptr [rax + rax + 0x25002fc8]
02ed8 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02ee2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ee6 e8f5d71618                     call       0x7ff793d5fbe0
02eeb f4                             hlt        
02eec be6effffff                     mov        esi, 0xffffff6e
02ef1 48899424f0000000               mov        qword ptr [rsp + 0xf0], rdx
02ef9 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02efe 48ff742428                     push       qword ptr [rsp + 0x28]
02f03 488f442420                     pop        qword ptr [rsp + 0x20]
02f08 897c2428                       mov        dword ptr [rsp + 0x28], edi
02f0c 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02f11 48ff742440                     push       qword ptr [rsp + 0x40]
02f16 488f442438                     pop        qword ptr [rsp + 0x38]
02f1b 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02f1f 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02f24 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02f29 90                             nop        
02f2a 90                             nop        
02f2b 90                             nop        
02f2c c5f877                         vzeroupper 
02f2f e82cb6adff                     call       0x7ff77b6cda60
02f34 0f1f84002c300026               nop        dword ptr [rax + rax + 0x2600302c]
02f3c 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02f46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f4a e891d71618                     call       0x7ff793d5fbe0
02f4f f4                             hlt        
02f50 bebeffffff                     mov        esi, 0xffffffbe
02f55 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02f5d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02f62 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02f6a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02f6f 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02f74 48ff742428                     push       qword ptr [rsp + 0x28]
02f79 488f442420                     pop        qword ptr [rsp + 0x20]
02f7e 897c2428                       mov        dword ptr [rsp + 0x28], edi
02f82 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02f87 48ff742440                     push       qword ptr [rsp + 0x40]
02f8c 488f442438                     pop        qword ptr [rsp + 0x38]
02f91 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02f95 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02f9a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02f9f 90                             nop        
02fa0 c5f877                         vzeroupper 
02fa3 e8b8b5adff                     call       0x7ff77b6cda60
02fa8 0f1f8400a0300027               nop        dword ptr [rax + rax + 0x270030a0]
02fb0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
02fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02fbe e81dd71618                     call       0x7ff793d5fbe0
02fc3 f4                             hlt        
02fc4 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02fc9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
02fce bef6ffffff                     mov        esi, 0xfffffff6
02fd3 498bed                         mov        rbp, r13
02fd6 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
02fde 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02fe6 90                             nop        
02fe7 90                             nop        
02fe8 c5f877                         vzeroupper 
02feb e870b5adff                     call       0x7ff77b6cda60
02ff0 0f1f8400e8300028               nop        dword ptr [rax + rax + 0x280030e8]
02ff8 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
03002 4883e4f0                       and        rsp, 0xfffffffffffffff0
03006 e8d5d61618                     call       0x7ff793d5fbe0
0300b f4                             hlt        
0300c 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03010 eb10                           jmp        0x7ff77bbf2522
03012 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03016 eb0a                           jmp        0x7ff77bbf2522
03018 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
0301c eb04                           jmp        0x7ff77bbf2522
0301e 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03022 beccffffff                     mov        esi, 0xffffffcc
03027 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
0302f 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
03037 4c89742410                     mov        qword ptr [rsp + 0x10], r14
0303c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
03041 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03046 90                             nop        
03047 90                             nop        
03048 c5f877                         vzeroupper 
0304b e810b5adff                     call       0x7ff77b6cda60
03050 0f1f840048310029               nop        dword ptr [rax + rax + 0x29003148]
03058 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
03062 4883e4f0                       and        rsp, 0xfffffffffffffff0
03066 e875d61618                     call       0x7ff793d5fbe0
0306b f4                             hlt        
0306c 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03070 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
03075 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
0307a eba6                           jmp        0x7ff77bbf2522
0307c bee4ffffff                     mov        esi, 0xffffffe4
03081 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03086 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0308b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
03093 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03098 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
030a0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
030a5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
030ad 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
030b2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
030b7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
030bf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
030c4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
030c9 4489542418                     mov        dword ptr [rsp + 0x18], r10d
030ce 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
030d3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
030d8 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
030dd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
030e2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
030e7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
030ec 4c89542430                     mov        qword ptr [rsp + 0x30], r10
030f1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
030f6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
030fb 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03100 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03105 895c2444                       mov        dword ptr [rsp + 0x44], ebx
03109 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0310e 90                             nop        
0310f 90                             nop        
03110 c5f877                         vzeroupper 
03113 e848b4adff                     call       0x7ff77b6cda60
03118 0f1f84001032002a               nop        dword ptr [rax + rax + 0x2a003210]
03120 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0312a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0312e e8add51618                     call       0x7ff793d5fbe0
03133 f4                             hlt        
03134 bee4ffffff                     mov        esi, 0xffffffe4
03139 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0313e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03143 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0314b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03150 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03158 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0315d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
03165 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0316a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0316f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
03177 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0317c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03181 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03186 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0318b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03190 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03195 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0319a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0319f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
031a4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
031a9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
031ad 90                             nop        
031ae 90                             nop        
031af 90                             nop        
031b0 c5f877                         vzeroupper 
031b3 e8a8b3adff                     call       0x7ff77b6cda60
031b8 0f1f8400b032002b               nop        dword ptr [rax + rax + 0x2b0032b0]
031c0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
031ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ce e80dd51618                     call       0x7ff793d5fbe0
031d3 f4                             hlt        
031d4 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
031d9 4183c308                       add        r11d, 8
031dd be6effffff                     mov        esi, 0xffffff6e
031e2 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
031e7 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
031ec 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
031f4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
031f9 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03201 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
03206 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
0320e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03213 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03218 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0321d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03222 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03227 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0322c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03231 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03236 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0323b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03240 4489542438                     mov        dword ptr [rsp + 0x38], r10d
03245 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03249 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0324e 90                             nop        
0324f 90                             nop        
03250 c5f877                         vzeroupper 
03253 e808b3adff                     call       0x7ff77b6cda60
03258 0f1f84005033002c               nop        dword ptr [rax + rax + 0x2c003350]
03260 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0326a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0326e e86dd41618                     call       0x7ff793d5fbe0
03273 f4                             hlt        
03274 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
03279 4183c308                       add        r11d, 8
0327d be66ffffff                     mov        esi, 0xffffff66
03282 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03287 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0328c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
03294 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03299 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
032a1 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
032a6 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
032ae 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032b3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
032b8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
032bd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
032c2 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
032c7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
032cc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
032d1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
032d6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
032db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
032e0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
032e5 895c2448                       mov        dword ptr [rsp + 0x48], ebx
032e9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
032ee 90                             nop        
032ef 90                             nop        
032f0 c5f877                         vzeroupper 
032f3 e868b2adff                     call       0x7ff77b6cda60
032f8 0f1f8400f033002d               nop        dword ptr [rax + rax + 0x2d0033f0]
03300 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0330a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0330e e8cdd31618                     call       0x7ff793d5fbe0
03313 f4                             hlt        
03314 448bda                         mov        r11d, edx
03317 e988deffff                     jmp        0x7ff77bbf06a4
0331c 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03326 4883e4f0                       and        rsp, 0xfffffffffffffff0
0332a e8b1d31618                     call       0x7ff793d5fbe0
0332f f4                             hlt        
03330 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0333a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0333e e89dd31618                     call       0x7ff793d5fbe0
03343 f4                             hlt        
03344 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0334e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03352 e889d31618                     call       0x7ff793d5fbe0
03357 f4                             hlt        
03358 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03362 4883e4f0                       and        rsp, 0xfffffffffffffff0
03366 e875d31618                     call       0x7ff793d5fbe0
0336b f4                             hlt        
0336c beccffffff                     mov        esi, 0xffffffcc
03371 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03376 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0337b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
03383 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03388 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03390 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03395 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0339d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
033a2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
033a7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
033af 448954240c                     mov        dword ptr [rsp + 0xc], r10d
033b4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
033b9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
033be 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
033c3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
033c8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
033cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
033d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
033d7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
033dc 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
033e1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
033e6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
033eb 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
033f0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
033f5 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
033fa 89442468                       mov        dword ptr [rsp + 0x68], eax
033fe 90                             nop        
033ff 90                             nop        
03400 c5f877                         vzeroupper 
03403 e858b1adff                     call       0x7ff77b6cda60
03408 0f1f84000035002e               nop        dword ptr [rax + rax + 0x2e003500]
03410 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0341a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0341e e8bdd21618                     call       0x7ff793d5fbe0
03423 f4                             hlt        
03424 bee4ffffff                     mov        esi, 0xffffffe4
03429 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0342e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03433 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0343b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03440 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03448 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0344d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
03455 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0345a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0345f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
03467 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0346c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03471 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03476 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0347b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03480 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03485 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0348a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0348f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03494 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
03499 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0349e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
034a3 895c2444                       mov        dword ptr [rsp + 0x44], ebx
034a7 4489742454                     mov        dword ptr [rsp + 0x54], r14d
034ac c5f877                         vzeroupper 
034af e8acb0adff                     call       0x7ff77b6cda60
034b4 0f1f8400ac35002f               nop        dword ptr [rax + rax + 0x2f0035ac]
034bc 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
034c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
034ca e811d21618                     call       0x7ff793d5fbe0
034cf f4                             hlt        
034d0 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
034d9 bee4ffffff                     mov        esi, 0xffffffe4
034de 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
034e3 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
034e8 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
034f0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
034f5 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
034fd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03502 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0350a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0350f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03514 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0351c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03521 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03526 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0352b 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03530 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03535 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0353a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0353f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03544 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03549 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0354e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03553 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03558 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0355c 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
03561 90                             nop        
03562 90                             nop        
03563 90                             nop        
03564 c5f877                         vzeroupper 
03567 e8f4afadff                     call       0x7ff77b6cda60
0356c 0f1f840064360030               nop        dword ptr [rax + rax + 0x30003664]
03574 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0357e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03582 e859d11618                     call       0x7ff793d5fbe0
03587 f4                             hlt        
03588 4183c610                       add        r14d, 0x10
0358c be6effffff                     mov        esi, 0xffffff6e
03591 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03596 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0359e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
035a3 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
035ab 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
035b0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
035b5 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
035ba 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
035bf 4c89542430                     mov        qword ptr [rsp + 0x30], r10
035c4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
035c9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
035ce 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
035d3 4489542440                     mov        dword ptr [rsp + 0x40], r10d
035d8 4489742450                     mov        dword ptr [rsp + 0x50], r14d
035dd 895c2454                       mov        dword ptr [rsp + 0x54], ebx
035e1 90                             nop        
035e2 90                             nop        
035e3 90                             nop        
035e4 c5f877                         vzeroupper 
035e7 e874afadff                     call       0x7ff77b6cda60
035ec 0f1f8400e4360031               nop        dword ptr [rax + rax + 0x310036e4]
035f4 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
035fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
03602 e8d9d01618                     call       0x7ff793d5fbe0
03607 f4                             hlt        
03608 4183c610                       add        r14d, 0x10
0360c be66ffffff                     mov        esi, 0xffffff66
03611 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03616 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0361e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03623 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0362b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03630 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03635 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0363a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0363f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03644 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03649 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0364e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03653 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03658 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0365d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
03661 90                             nop        
03662 90                             nop        
03663 90                             nop        
03664 c5f877                         vzeroupper 
03667 e8f4aeadff                     call       0x7ff77b6cda60
0366c 0f1f840064370032               nop        dword ptr [rax + rax + 0x32003764]
03674 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
0367e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03682 e859d01618                     call       0x7ff793d5fbe0
03687 f4                             hlt        
03688 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03692 4883e4f0                       and        rsp, 0xfffffffffffffff0
03696 e845d01618                     call       0x7ff793d5fbe0
0369b f4                             hlt        
0369c 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
036a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
036aa e831d01618                     call       0x7ff793d5fbe0
036af f4                             hlt        
036b0 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
036ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
036be e81dd01618                     call       0x7ff793d5fbe0
036c3 f4                             hlt        
036c4 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
036ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
036d2 e809d01618                     call       0x7ff793d5fbe0
036d7 f4                             hlt        
036d8 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
036e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
036e6 e8f5cf1618                     call       0x7ff793d5fbe0
036eb f4                             hlt        
036ec 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
036f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
036fa e8e1cf1618                     call       0x7ff793d5fbe0
036ff f4                             hlt        
03700 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0370a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0370e e8cdcf1618                     call       0x7ff793d5fbe0
03713 f4                             hlt        
03714 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0371e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03722 e8b9cf1618                     call       0x7ff793d5fbe0
03727 f4                             hlt        
03728 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03732 4883e4f0                       and        rsp, 0xfffffffffffffff0
03736 e8a5cf1618                     call       0x7ff793d5fbe0
0373b f4                             hlt        
0373c 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03746 4883e4f0                       and        rsp, 0xfffffffffffffff0
0374a e891cf1618                     call       0x7ff793d5fbe0
0374f f4                             hlt        
03750 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0375a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0375e e87dcf1618                     call       0x7ff793d5fbe0
03763 f4                             hlt        
03764 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
0376e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03772 e869cf1618                     call       0x7ff793d5fbe0
03777 f4                             hlt        
03778 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03782 4883e4f0                       and        rsp, 0xfffffffffffffff0
03786 e855cf1618                     call       0x7ff793d5fbe0
0378b f4                             hlt        
0378c 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
03796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0379a e841cf1618                     call       0x7ff793d5fbe0
0379f f4                             hlt        
037a0 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
037aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
037ae e82dcf1618                     call       0x7ff793d5fbe0
037b3 f4                             hlt        
037b4 48bf30db6254f77f0000           movabs     rdi, 0x7ff75462db30
037be 4883e4f0                       and        rsp, 0xfffffffffffffff0
037c2 e819cf1618                     call       0x7ff793d5fbe0
037c7 f4                             hlt        
037c8 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
037cd 4533c9                         xor        r9d, r9d
037d0 458bd3                         mov        r10d, r11d
037d3 e9f6f7ffff                     jmp        0x7ff77bbf24ce
037d8 bef6ffffff                     mov        esi, 0xfffffff6
037dd 90                             nop        
037de 90                             nop        
037df 90                             nop        
037e0 c5f877                         vzeroupper 
037e3 e878adadff                     call       0x7ff77b6cda60
037e8 0f1f8400e0380033               nop        dword ptr [rax + rax + 0x330038e0]
037f0 48bfc01eb254f77f0000           movabs     rdi, 0x7ff754b21ec0
037fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
037fe e8ddce1618                     call       0x7ff793d5fbe0
03803 f4                             hlt        
03804 488bf0                         mov        rsi, rax
03807 c5f877                         vzeroupper 
0380a 4881c4e0000000                 add        rsp, 0xe0
03811 5d                             pop        rbp
03812 e9c94badff                     jmp        0x7ff77b6c78e0
03817 49bab002bf7bf77f0000           movabs     r10, 0x7ff77bbf02b0
03821 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03828 e933f6b3ff                     jmp        0x7ff77b732360
0382d e8aec4b2ff                     call       0x7ff77b71f1e0
03832 e907c8ffff                     jmp        0x7ff77bbef53e
03837 f4                             hlt        
