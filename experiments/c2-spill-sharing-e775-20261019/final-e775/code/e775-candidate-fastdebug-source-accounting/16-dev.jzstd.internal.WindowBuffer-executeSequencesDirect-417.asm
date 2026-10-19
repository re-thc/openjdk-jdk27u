00000 e8fb633a18                     call       0x7ff793f8d300
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
0000f 90                             nop        
00010 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f855c370000                   jne        0x7ff77bbea68a
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00067 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0006e 4c8bae00010000                 mov        r13, qword ptr [rsi + 0x100]
00075 8b9e30010000                   mov        ebx, dword ptr [rsi + 0x130]
0007b 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0007f 8b9e18010000                   mov        ebx, dword ptr [rsi + 0x118]
00085 895c2428                       mov        dword ptr [rsp + 0x28], ebx
00089 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
0008f 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00096 8b9ef0000000                   mov        ebx, dword ptr [rsi + 0xf0]
0009c 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
000a0 8b9ee8000000                   mov        ebx, dword ptr [rsi + 0xe8]
000a6 895c2440                       mov        dword ptr [rsp + 0x40], ebx
000aa 488b9ed8000000                 mov        rbx, qword ptr [rsi + 0xd8]
000b1 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
000b9 488b9e90000000                 mov        rbx, qword ptr [rsi + 0x90]
000c0 48899c24b0000000               mov        qword ptr [rsp + 0xb0], rbx
000c8 488b9e80000000                 mov        rbx, qword ptr [rsi + 0x80]
000cf 48899c24b8000000               mov        qword ptr [rsp + 0xb8], rbx
000d7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
000da 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
000e1 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
000e4 899c24c0000000                 mov        dword ptr [rsp + 0xc0], ebx
000eb 8b9ea0000000                   mov        ebx, dword ptr [rsi + 0xa0]
000f1 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
000f5 488bfe                         mov        rdi, rsi
000f8 c5f877                         vzeroupper 
000fb 49ba70fa1494f77f0000           movabs     r10, 0x7ff79414fa70
00105 41ffd2                         call       r10
00108 0f1f840000000000               nop        dword ptr [rax + rax]
00110 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00115 4d85d2                         test       r10, r10
00118 0f841a1f0000                   je         0x7ff77bbe8f38
0011e 458b12                         mov        r10d, dword ptr [r10]
00121 41c1ea0d                       shr        r10d, 0xd
00125 4181fa15410000                 cmp        r10d, 0x4115
0012c 0f85e6290000                   jne        0x7ff77bbe9a18
00132 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
00137 48895c2408                     mov        qword ptr [rsp + 8], rbx
0013c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00141 4d85d2                         test       r10, r10
00144 0f84fb1e0000                   je         0x7ff77bbe8f45
0014a 458b1a                         mov        r11d, dword ptr [r10]
0014d 41c1eb0d                       shr        r11d, 0xd
00151 4181fbf9060000                 cmp        r11d, 0x6f9
00158 0f85ba290000                   jne        0x7ff77bbe9a18
0015e 498bda                         mov        rbx, r10
00161 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
00169 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0016e 4d85d2                         test       r10, r10
00171 0f84de1e0000                   je         0x7ff77bbe8f55
00177 458b12                         mov        r10d, dword ptr [r10]
0017a 41c1ea0d                       shr        r10d, 0xd
0017e 4181fafc060000                 cmp        r10d, 0x6fc
00185 0f858d290000                   jne        0x7ff77bbe9a18
0018b 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00190 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
00198 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0019d 4d85d2                         test       r10, r10
001a0 0f84bf1e0000                   je         0x7ff77bbe8f65
001a6 458b1a                         mov        r11d, dword ptr [r10]
001a9 41c1eb0d                       shr        r11d, 0xd
001ad 4181fbfb060000                 cmp        r11d, 0x6fb
001b4 0f855e290000                   jne        0x7ff77bbe9a18
001ba 498bda                         mov        rbx, r10
001bd 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
001c2 4885ed                         test       rbp, rbp
001c5 0f84a71e0000                   je         0x7ff77bbe8f72
001cb 448b5500                       mov        r10d, dword ptr [rbp]
001cf 41c1ea0d                       shr        r10d, 0xd
001d3 4181fafb060000                 cmp        r10d, 0x6fb
001da 0f8538290000                   jne        0x7ff77bbe9a18
001e0 488bdd                         mov        rbx, rbp
001e3 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
001eb 4d85ed                         test       r13, r13
001ee 0f848e1e0000                   je         0x7ff77bbe8f82
001f4 458b5d00                       mov        r11d, dword ptr [r13]
001f8 41c1eb0d                       shr        r11d, 0xd
001fc 4181fbf9060000                 cmp        r11d, 0x6f9
00203 0f850f290000                   jne        0x7ff77bbe9a18
00209 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00211 e91e050000                     jmp        0x7ff77bbe7634
00216 448bd5                         mov        r10d, ebp
00219 4d63d2                         movsxd     r10, r10d
0021c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00223 c442a8f5db                     bzhi       r11, r11, r10
00228 c4c1fb92fb                     kmovq      k7, r11
0022d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00233 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00239 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00241 4403dd                         add        r11d, ebp
00244 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0024c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00250 418502                         test       dword ptr [r10], eax
00253 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0025b 0f8db8080000                   jge        0x7ff77bbe7a19
00261 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00266 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0026b 442b9424a0000000               sub        r10d, dword ptr [rsp + 0xa0]
00273 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0027b 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
00282 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00289 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00290 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
00298 410f4fed                       cmovg      ebp, r13d
0029c 458bca                         mov        r9d, r10d
0029f 4585d2                         test       r10d, r10d
002a2 0f8ce8240000                   jl         0x7ff77bbe9690
002a8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002ad 4585db                         test       r11d, r11d
002b0 0f8cda240000                   jl         0x7ff77bbe9690
002b6 458d1429                       lea        r10d, [r9 + rbp]
002ba 453bf2                         cmp        r14d, r10d
002bd 0f82cd240000                   jb         0x7ff77bbe9690
002c3 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002c8 4403ed                         add        r13d, ebp
002cb 453bf5                         cmp        r14d, r13d
002ce 0f82bc240000                   jb         0x7ff77bbe9690
002d4 85ed                           test       ebp, ebp
002d6 0f8cb4240000                   jl         0x7ff77bbe9690
002dc 85ed                           test       ebp, ebp
002de 0f8455ffffff                   je         0x7ff77bbe7139
002e4 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002ec 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
002f1 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
002f6 4863d5                         movsxd     rdx, ebp
002f9 4883fa20                       cmp        rdx, 0x20
002fd 0f8613ffffff                   jbe        0x7ff77bbe7116
00303 c5f877                         vzeroupper 
00306 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00310 41ffd2                         call       r10
00313 0f1f840000000000               nop        dword ptr [rax + rax]
0031b e919ffffff                     jmp        0x7ff77bbe7139
00320 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00324 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0032c 4585c9                         test       r9d, r9d
0032f 0f8eff160000                   jle        0x7ff77bbe8934
00335 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
0033d 4503ce                         add        r9d, r14d
00340 443b8c24a4000000               cmp        r9d, dword ptr [rsp + 0xa4]
00348 0f8ffa170000                   jg         0x7ff77bbe8a48
0034e 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00353 4403cb                         add        r9d, ebx
00356 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0035e 443b8c24c0000000               cmp        r9d, dword ptr [rsp + 0xc0]
00366 0f8f5c180000                   jg         0x7ff77bbe8ac8
0036c 83fb10                         cmp        ebx, 0x10
0036f 0f8f4b080000                   jg         0x7ff77bbe7ac0
00375 4c8bac24c8000000               mov        r13, qword ptr [rsp + 0xc8]
0037d 458b5504                       mov        r10d, dword ptr [r13 + 4]
00381 458d5af1                       lea        r11d, [r10 - 0xf]
00385 4585db                         test       r11d, r11d
00388 0f8c96130000                   jl         0x7ff77bbe8624
0038e 4183c2f1                       add        r10d, -0xf
00392 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00397 453bda                         cmp        r11d, r10d
0039a 0f8368120000                   jae        0x7ff77bbe8508
003a0 4c8bac24e0000000               mov        r13, qword ptr [rsp + 0xe0]
003a8 458b5504                       mov        r10d, dword ptr [r13 + 4]
003ac 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
003b1 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
003b9 c4817a6f442e08                 vmovdqu    xmm0, xmmword ptr [r14 + r13 + 8]
003c0 458d42f1                       lea        r8d, [r10 - 0xf]
003c4 4585c0                         test       r8d, r8d
003c7 0f8cd7130000                   jl         0x7ff77bbe86a4
003cd 4183c2f1                       add        r10d, -0xf
003d1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
003d9 453bc2                         cmp        r8d, r10d
003dc 0f83a6120000                   jae        0x7ff77bbe8588
003e2 468d342b                       lea        r14d, [rbx + r13]
003e6 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
003ee 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003f6 4c8bac24e0000000               mov        r13, qword ptr [rsp + 0xe0]
003fe c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
00405 4103da                         add        ebx, r10d
00408 448beb                         mov        r13d, ebx
0040b 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
00413 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0041b 458b7004                       mov        r14d, dword ptr [r8 + 4]
0041f 458d56f1                       lea        r10d, [r14 - 0xf]
00423 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0042b 4183fb10                       cmp        r11d, 0x10
0042f 7f4b                           jg         0x7ff77bbe737c
00431 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00439 4183fb10                       cmp        r11d, 0x10
0043d 7c3d                           jl         0x7ff77bbe737c
0043f 4585d2                         test       r10d, r10d
00442 0f8c74150000                   jl         0x7ff77bbe88bc
00448 4183c6f1                       add        r14d, -0xf
0044c 453bee                         cmp        r13d, r14d
0044f 0f8363140000                   jae        0x7ff77bbe87b8
00455 c4817a6f442808                 vmovdqu    xmm0, xmmword ptr [r8 + r13 + 8]
0045c 413bde                         cmp        ebx, r14d
0045f 0f83cb140000                   jae        0x7ff77bbe8830
00465 c4c17a7f441808                 vmovdqu    xmmword ptr [r8 + rbx + 8], xmm0
0046c 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
00474 4403eb                         add        r13d, ebx
00477 e991020000                     jmp        0x7ff77bbe760d
0047c 458d5ef9                       lea        r11d, [r14 - 7]
00480 4b8d7c2808                     lea        rdi, [r8 + r13 + 8]
00485 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
0048c 03cb                           add        ecx, ebx
0048e 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00495 498d741808                     lea        rsi, [r8 + rbx + 8]
0049a 4863c1                         movsxd     rax, ecx
0049d 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004a4 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
004ab 0f8ccf040000                   jl         0x7ff77bbe7880
004b1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
004b9 4183fa30                       cmp        r10d, 0x30
004bd 0f8e8a000000                   jle        0x7ff77bbe744d
004c3 4585ed                         test       r13d, r13d
004c6 0f8cee1b0000                   jl         0x7ff77bbe8fba
004cc 85db                           test       ebx, ebx
004ce 0f8ce61b0000                   jl         0x7ff77bbe8fba
004d4 4503d5                         add        r10d, r13d
004d7 453bf2                         cmp        r14d, r10d
004da 0f82da1b0000                   jb         0x7ff77bbe8fba
004e0 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
004e8 0f82cc1b0000                   jb         0x7ff77bbe8fba
004ee 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
004f6 4585ed                         test       r13d, r13d
004f9 0f8404020000                   je         0x7ff77bbe7603
004ff 4963d5                         movsxd     rdx, r13d
00502 4883fa20                       cmp        rdx, 0x20
00506 7728                           ja         0x7ff77bbe7430
00508 458bd5                         mov        r10d, r13d
0050b 4d63d2                         movsxd     r10, r10d
0050e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00515 c442a8f5db                     bzhi       r11, r11, r10
0051a c4c1fb92fb                     kmovq      k7, r11
0051f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00525 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0052b e9d3010000                     jmp        0x7ff77bbe7603
00530 c5f877                         vzeroupper 
00533 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
0053d 41ffd2                         call       r10
00540 0f1f840000000000               nop        dword ptr [rax + rax]
00548 e9b6010000                     jmp        0x7ff77bbe7603
0054d 4585db                         test       r11d, r11d
00550 0f8cf2180000                   jl         0x7ff77bbe8d48
00556 458d56f9                       lea        r10d, [r14 - 7]
0055a 453bea                         cmp        r13d, r10d
0055d 0f83c9170000                   jae        0x7ff77bbe8c2c
00563 4963cd                         movsxd     rcx, r13d
00566 4d8b5c0808                     mov        r11, qword ptr [r8 + rcx + 8]
0056b 413bda                         cmp        ebx, r10d
0056e 0f8348180000                   jae        0x7ff77bbe8cbc
00574 448bcb                         mov        r9d, ebx
00577 418d7908                       lea        edi, [r9 + 8]
0057b 4963d1                         movsxd     rdx, r9d
0057e 4d895c1008                     mov        qword ptr [r8 + rdx + 8], r11
00583 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
0058a 0f8d73010000                   jge        0x7ff77bbe7603
00590 482bca                         sub        rcx, rdx
00593 4963d6                         movsxd     rdx, r14d
00596 4883c2f9                       add        rdx, -7
0059a 4863f7                         movsxd     rsi, edi
0059d 4c8d1c0e                       lea        r11, [rsi + rcx]
005a1 4c3bda                         cmp        r11, rdx
005a4 0f832e190000                   jae        0x7ff77bbe8dd8
005aa 4c8bd8                         mov        r11, rax
005ad 4c2bde                         sub        r11, rsi
005b0 4983c307                       add        r11, 7
005b4 4983e3f8                       and        r11, 0xfffffffffffffff8
005b8 458bdb                         mov        r11d, r11d
005bb 478d5c0b08                     lea        r11d, [r11 + r9 + 8]
005c0 4d63db                         movsxd     r11, r11d
005c3 498d740bf8                     lea        rsi, [r11 + rcx - 8]
005c8 483bf2                         cmp        rsi, rdx
005cb 0f8307190000                   jae        0x7ff77bbe8dd8
005d1 413bfa                         cmp        edi, r10d
005d4 0f83fe180000                   jae        0x7ff77bbe8dd8
005da 4983c3f8                       add        r11, -8
005de 4c3bda                         cmp        r11, rdx
005e1 0f83f1180000                   jae        0x7ff77bbe8dd8
005e7 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
005ef 4181fef8ffff7f                 cmp        r14d, 0x7ffffff8
005f6 0f8f68190000                   jg         0x7ff77bbe8e64
005fc 452be9                         sub        r13d, r9d
005ff 4183c110                       add        r9d, 0x10
00603 448bc7                         mov        r8d, edi
00606 468d1c2f                       lea        r11d, [rdi + r13]
0060a 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00612 4f8b5c1e08                     mov        r11, qword ptr [r14 + r11 + 8]
00617 4f895c0608                     mov        qword ptr [r14 + r8 + 8], r11
0061c 448d5f08                       lea        r11d, [rdi + 8]
00620 453bd9                         cmp        r11d, r9d
00623 7d05                           jge        0x7ff77bbe752a
00625 418bfb                         mov        edi, r11d
00628 ebd9                           jmp        0x7ff77bbe7503
0062a 4883c0f8                       add        rax, -8
0062e 483d00000080                   cmp        rax, -0x80000000
00634 49c7c000000080                 mov        r8, 0xffffffff80000000
0063b 490f4cc0                       cmovl      rax, r8
0063f 8bf0                           mov        esi, eax
00641 443bde                         cmp        r11d, esi
00644 7d71                           jge        0x7ff77bbe75b7
00646 4d63c3                         movsxd     r8, r11d
00649 4c03c1                         add        r8, rcx
0064c 4c3bc2                         cmp        r8, rdx
0064f 0f8393190000                   jae        0x7ff77bbe8ee8
00655 83c710                         add        edi, 0x10
00658 4c63c7                         movsxd     r8, edi
0065b 4c03c1                         add        r8, rcx
0065e 4c3bc2                         cmp        r8, rdx
00661 0f8395190000                   jae        0x7ff77bbe8efc
00667 453bda                         cmp        r11d, r10d
0066a 0f83a0190000                   jae        0x7ff77bbe8f10
00670 413bfa                         cmp        edi, r10d
00673 0f83ab190000                   jae        0x7ff77bbe8f24
00679 90                             nop        
0067a 90                             nop        
0067b 90                             nop        
0067c 90                             nop        
0067d 90                             nop        
0067e 90                             nop        
0067f 90                             nop        
00680 458bcb                         mov        r9d, r11d
00683 4963e9                         movsxd     rbp, r9d
00686 458bc3                         mov        r8d, r11d
00689 438d042b                       lea        eax, [r11 + r13]
0068d 8bf8                           mov        edi, eax
0068f 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00697 4d8b4c0608                     mov        r9, qword ptr [r14 + rax + 8]
0069c 4f894c0608                     mov        qword ptr [r14 + r8 + 8], r9
006a1 4c63c7                         movsxd     r8, edi
006a4 4f8b440610                     mov        r8, qword ptr [r14 + r8 + 0x10]
006a9 4d89442e10                     mov        qword ptr [r14 + rbp + 0x10], r8
006ae 4183c310                       add        r11d, 0x10
006b2 443bde                         cmp        r11d, esi
006b5 7cc9                           jl         0x7ff77bbe7580
006b7 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006bf 7d42                           jge        0x7ff77bbe7603
006c1 4d63c3                         movsxd     r8, r11d
006c4 4c03c1                         add        r8, rcx
006c7 4c3bc2                         cmp        r8, rdx
006ca 0f83c2190000                   jae        0x7ff77bbe8f92
006d0 453bda                         cmp        r11d, r10d
006d3 0f83cd190000                   jae        0x7ff77bbe8fa6
006d9 90                             nop        
006da 90                             nop        
006db 90                             nop        
006dc 478d142b                       lea        r10d, [r11 + r13]
006e0 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
006e8 4f8b541608                     mov        r10, qword ptr [r14 + r10 + 8]
006ed 458bc3                         mov        r8d, r11d
006f0 4f89540608                     mov        qword ptr [r14 + r8 + 8], r10
006f5 4183c308                       add        r11d, 8
006f9 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00701 7cd9                           jl         0x7ff77bbe75dc
00703 039c2480000000                 add        ebx, dword ptr [rsp + 0x80]
0070a 448beb                         mov        r13d, ebx
0070d 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00711 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00716 41ffc2                         inc        r10d
00719 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0071e 418503                         test       dword ptr [r11], eax
00721 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00729 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00730 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
00734 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
00739 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00741 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00746 442b4c247c                     sub        r9d, dword ptr [rsp + 0x7c]
0074b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00750 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00755 0f8db9060000                   jge        0x7ff77bbe7d14
0075b 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00763 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00766 443bd1                         cmp        r10d, ecx
00769 0f83390e0000                   jae        0x7ff77bbe84a8
0076f 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00777 4a8b4cd308                     mov        rcx, qword ptr [rbx + r10*8 + 8]
0077c 8bd9                           mov        ebx, ecx
0077e 81e3ffff0100                   and        ebx, 0x1ffff
00784 4c8bd1                         mov        r10, rcx
00787 49c1fa24                       sar        r10, 0x24
0078b 48c1e912                       shr        rcx, 0x12
0078f 458bd2                         mov        r10d, r10d
00792 418bd2                         mov        edx, r10d
00795 448be9                         mov        r13d, ecx
00798 4181e5ffff0300                 and        r13d, 0x3ffff
0079f 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
007a7 4585d2                         test       r10d, r10d
007aa 0f8cb8120000                   jl         0x7ff77bbe8968
007b0 85db                           test       ebx, ebx
007b2 0f85cf000000                   jne        0x7ff77bbe7787
007b8 33db                           xor        ebx, ebx
007ba 4183fa03                       cmp        r10d, 3
007be 0f8efc000000                   jle        0x7ff77bbe77c0
007c4 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007cc 458b4d04                       mov        r9d, dword ptr [r13 + 4]
007d0 4183c2fd                       add        r10d, -3
007d4 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
007dc 4183f902                       cmp        r9d, 2
007e0 0f865a100000                   jbe        0x7ff77bbe8740
007e6 458b550c                       mov        r10d, dword ptr [r13 + 0xc]
007ea 45895510                       mov        dword ptr [r13 + 0x10], r10d
007ee 458b4d08                       mov        r9d, dword ptr [r13 + 8]
007f2 45894d0c                       mov        dword ptr [r13 + 0xc], r9d
007f6 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
007fe 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
00806 45896e08                       mov        dword ptr [r14 + 8], r13d
0080a 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
00812 4c891424                       mov        qword ptr [rsp], r10
00816 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
0081e 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00826 4863d3                         movsxd     rdx, ebx
00829 4c03d2                         add        r10, rdx
0082c 488b3c24                       mov        rdi, qword ptr [rsp]
00830 493bfa                         cmp        rdi, r10
00833 0f8f97120000                   jg         0x7ff77bbe89d0
00839 448bb42488000000               mov        r14d, dword ptr [rsp + 0x88]
00841 4403f3                         add        r14d, ebx
00844 458bee                         mov        r13d, r14d
00847 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
0084f 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
00853 85c9                           test       ecx, ecx
00855 0f85c5faffff                   jne        0x7ff77bbe7220
0085b 4d63cd                         movsxd     r9, r13d
0085e 4c3b8c24b0000000               cmp        r9, qword ptr [rsp + 0xb0]
00866 0f8cd8130000                   jl         0x7ff77bbe8b44
0086c 483bbc24b8000000               cmp        rdi, qword ptr [rsp + 0xb8]
00874 0f8f3e140000                   jg         0x7ff77bbe8bb8
0087a 4533c9                         xor        r9d, r9d
0087d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00882 e99dfaffff                     jmp        0x7ff77bbe7224
00887 413bd9                         cmp        ebx, r9d
0088a 0f8e2affffff                   jle        0x7ff77bbe76ba
00890 be45ffffff                     mov        esi, 0xffffff45
00895 8beb                           mov        ebp, ebx
00897 44890c24                       mov        dword ptr [rsp], r9d
0089b 90                             nop        
0089c c5f877                         vzeroupper 
0089f e8bc62aeff                     call       0x7ff77b6cda60
008a4 0f1f84009c090002               nop        dword ptr [rax + rax + 0x200099c]
008ac 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
008b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ba e821841718                     call       0x7ff793d5fbe0
008bf f4                             hlt        
008c0 85db                           test       ebx, ebx
008c2 7406                           je         0x7ff77bbe77ca
008c4 41ffca                         dec        r10d
008c7 418bd2                         mov        edx, r10d
008ca 85d2                           test       edx, edx
008cc 751e                           jne        0x7ff77bbe77ec
008ce 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
008d6 458b5504                       mov        r10d, dword ptr [r13 + 4]
008da 4585d2                         test       r10d, r10d
008dd 0f86a11a0000                   jbe        0x7ff77bbe9284
008e3 458b6d08                       mov        r13d, dword ptr [r13 + 8]
008e7 e987000000                     jmp        0x7ff77bbe7873
008ec 83fa03                         cmp        edx, 3
008ef 0f84831f0000                   je         0x7ff77bbe9778
008f5 83fa02                         cmp        edx, 2
008f8 0f87ee1f0000                   ja         0x7ff77bbe97ec
008fe 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
00906 458b5504                       mov        r10d, dword ptr [r13 + 4]
0090a 413bd2                         cmp        edx, r10d
0090d 0f8370190000                   jae        0x7ff77bbe9183
00913 458b6c9508                     mov        r13d, dword ptr [r13 + rdx*4 + 8]
00918 85d2                           test       edx, edx
0091a 7e42                           jle        0x7ff77bbe785e
0091c 4585d2                         test       r10d, r10d
0091f 0f86cf1e0000                   jbe        0x7ff77bbe96f4
00925 448d4aff                       lea        r9d, [rdx - 1]
00929 453bca                         cmp        r9d, r10d
0092c 0f83c21e0000                   jae        0x7ff77bbe96f4
00932 4183fa01                       cmp        r10d, 1
00936 0f86b81e0000                   jbe        0x7ff77bbe96f4
0093c 90                             nop        
0093d 90                             nop        
0093e 90                             nop        
0093f 90                             nop        
00940 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
00948 418b4c9604                     mov        ecx, dword ptr [r14 + rdx*4 + 4]
0094d 41894c9608                     mov        dword ptr [r14 + rdx*4 + 8], ecx
00952 448d4aff                       lea        r9d, [rdx - 1]
00956 418bd1                         mov        edx, r9d
00959 4585c9                         test       r9d, r9d
0095c 7fe2                           jg         0x7ff77bbe7840
0095e 4585d2                         test       r10d, r10d
00961 0f86a9190000                   jbe        0x7ff77bbe9210
00967 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
0096f 45896e08                       mov        dword ptr [r14 + 8], r13d
00973 4489ac24a0000000               mov        dword ptr [rsp + 0xa0], r13d
0097b e98afeffff                     jmp        0x7ff77bbe770a
00980 83f910                         cmp        ecx, 0x10
00983 0f8d36090000                   jge        0x7ff77bbe81bf
00989 83f908                         cmp        ecx, 8
0098c 0f8d35050000                   jge        0x7ff77bbe7dc7
00992 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0099a 4183fa10                       cmp        r10d, 0x10
0099e 0f8f82010000                   jg         0x7ff77bbe7a26
009a4 453bee                         cmp        r13d, r14d
009a7 0f833b1a0000                   jae        0x7ff77bbe92e8
009ad 430fbe6c2808                   movsx      ebp, byte ptr [r8 + r13 + 8]
009b3 413bde                         cmp        ebx, r14d
009b6 0f83b41a0000                   jae        0x7ff77bbe9370
009bc 41886c1808                     mov        byte ptr [r8 + rbx + 8], bpl
009c1 448d5301                       lea        r10d, [rbx + 1]
009c5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
009cd 458d5503                       lea        r10d, [r13 + 3]
009d1 453bd6                         cmp        r10d, r14d
009d4 0f83021b0000                   jae        0x7ff77bbe93dc
009da 4d63d5                         movsxd     r10, r13d
009dd 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
009e3 448d4b03                       lea        r9d, [rbx + 3]
009e7 453bce                         cmp        r9d, r14d
009ea 0f83581b0000                   jae        0x7ff77bbe9448
009f0 4863cb                         movsxd     rcx, ebx
009f3 41886c0809                     mov        byte ptr [r8 + rcx + 9], bpl
009f8 470fbe4c100a                   movsx      r9d, byte ptr [r8 + r10 + 0xa]
009fe 45884c080a                     mov        byte ptr [r8 + rcx + 0xa], r9b
00a03 470fbe4c100b                   movsx      r9d, byte ptr [r8 + r10 + 0xb]
00a09 45884c080b                     mov        byte ptr [r8 + rcx + 0xb], r9b
00a0e 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a16 4183fa08                       cmp        r10d, 8
00a1a 0f83901b0000                   jae        0x7ff77bbe94b0
00a20 49baf03b27e300000000           movabs     r10, 0xe3273bf0
00a2a 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a32 47036c8a08                     add        r13d, dword ptr [r10 + r9*4 + 8]
00a37 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00a3f 4183f904                       cmp        r9d, 4
00a43 7e65                           jle        0x7ff77bbe79aa
00a45 418d6efd                       lea        ebp, [r14 - 3]
00a49 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00a50 448d4b04                       lea        r9d, [rbx + 4]
00a54 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00a5c 85ed                           test       ebp, ebp
00a5e 0f8ca81c0000                   jl         0x7ff77bbe960c
00a64 458bce                         mov        r9d, r14d
00a67 4183c1fd                       add        r9d, -3
00a6b 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
00a73 453be9                         cmp        r13d, r9d
00a76 0f83a81b0000                   jae        0x7ff77bbe9524
00a7c 458bcd                         mov        r9d, r13d
00a7f 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00a84 438b6c0808                     mov        ebp, dword ptr [r8 + r9 + 8]
00a89 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00a91 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00a99 0f83091c0000                   jae        0x7ff77bbe95a8
00a9f 448bcb                         mov        r9d, ebx
00aa2 4d63d1                         movsxd     r10, r9d
00aa5 43896c100c                     mov        dword ptr [r8 + r10 + 0xc], ebp
00aaa 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00ab2 4183fa08                       cmp        r10d, 8
00ab6 7e61                           jle        0x7ff77bbe7a19
00ab8 448d4b08                       lea        r9d, [rbx + 8]
00abc 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
00ac4 49b9183c27e300000000           movabs     r9, 0xe3273c18
00ace 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00ad6 478b549108                     mov        r10d, dword ptr [r9 + r10*4 + 8]
00adb 452bea                         sub        r13d, r10d
00ade 418d6d08                       lea        ebp, [r13 + 8]
00ae2 4585db                         test       r11d, r11d
00ae5 0f8c3d1f0000                   jl         0x7ff77bbe9928
00aeb 4183c6f9                       add        r14d, -7
00aef 413bee                         cmp        ebp, r14d
00af2 0f83681e0000                   jae        0x7ff77bbe9860
00af8 4d63d5                         movsxd     r10, r13d
00afb 4b8b6c1010                     mov        rbp, qword ptr [r8 + r10 + 0x10]
00b00 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b08 453bde                         cmp        r11d, r14d
00b0b 0f83bb1e0000                   jae        0x7ff77bbe98cc
00b11 4c63d3                         movsxd     r10, ebx
00b14 4b896c1010                     mov        qword ptr [r8 + r10 + 0x10], rbp
00b19 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00b21 e9e7fbffff                     jmp        0x7ff77bbe760d
00b26 4585ed                         test       r13d, r13d
00b29 0f8c651f0000                   jl         0x7ff77bbe9994
00b2f 85db                           test       ebx, ebx
00b31 0f8c5d1f0000                   jl         0x7ff77bbe9994
00b37 443bf3                         cmp        r14d, ebx
00b3a 0f82541f0000                   jb         0x7ff77bbe9994
00b40 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b48 4403d3                         add        r10d, ebx
00b4b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00b50 453bf2                         cmp        r14d, r10d
00b53 0f823b1f0000                   jb         0x7ff77bbe9994
00b59 85c9                           test       ecx, ecx
00b5b 0f8c331f0000                   jl         0x7ff77bbe9994
00b61 85c9                           test       ecx, ecx
00b63 0f84fdf6ffff                   je         0x7ff77bbe7166
00b69 4c8b1424                       mov        r10, qword ptr [rsp]
00b6d 4983fa20                       cmp        r10, 0x20
00b71 772d                           ja         0x7ff77bbe7aa0
00b73 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b7b 4d63d3                         movsxd     r10, r11d
00b7e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b85 c442a8f5db                     bzhi       r11, r11, r10
00b8a c4c1fb92fb                     kmovq      k7, r11
00b8f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b95 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b9b e9c6f6ffff                     jmp        0x7ff77bbe7166
00ba0 498bd2                         mov        rdx, r10
00ba3 c5f877                         vzeroupper 
00ba6 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00bb0 41ffd2                         call       r10
00bb3 0f1f840000000000               nop        dword ptr [rax + rax]
00bbb e9a6f6ffff                     jmp        0x7ff77bbe7166
00bc0 83fb30                         cmp        ebx, 0x30
00bc3 0f8eb3000000                   jle        0x7ff77bbe7b7c
00bc9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bd1 418b7a04                       mov        edi, dword ptr [r10 + 4]
00bd5 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bdd 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00be1 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00be6 4585c9                         test       r9d, r9d
00be9 0f8c2d210000                   jl         0x7ff77bbe9c1c
00bef 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00bf7 4585d2                         test       r10d, r10d
00bfa 0f8c1c210000                   jl         0x7ff77bbe9c1c
00c00 3bbc2494000000                 cmp        edi, dword ptr [rsp + 0x94]
00c07 0f820f210000                   jb         0x7ff77bbe9c1c
00c0d 413bce                         cmp        ecx, r14d
00c10 0f8206210000                   jb         0x7ff77bbe9c1c
00c16 85db                           test       ebx, ebx
00c18 7440                           je         0x7ff77bbe7b5a
00c1a 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c22 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00c27 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c2f 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00c34 4883fa20                       cmp        rdx, 0x20
00c38 7728                           ja         0x7ff77bbe7b62
00c3a 4c63d3                         movsxd     r10, ebx
00c3d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c44 c442a8f5db                     bzhi       r11, r11, r10
00c49 c4c1fb92fb                     kmovq      k7, r11
00c4e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c54 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c5a 418bde                         mov        ebx, r14d
00c5d e9b1f7ffff                     jmp        0x7ff77bbe7313
00c62 c5f877                         vzeroupper 
00c65 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00c6f 41ffd2                         call       r10
00c72 0f1f840000000000               nop        dword ptr [rax + rax]
00c7a ebde                           jmp        0x7ff77bbe7b5a
00c7c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c84 418b7a04                       mov        edi, dword ptr [r10 + 4]
00c88 8d6ff1                         lea        ebp, [rdi - 0xf]
00c8b 85ed                           test       ebp, ebp
00c8d 0f8c15200000                   jl         0x7ff77bbe9ba8
00c93 8d6ff1                         lea        ebp, [rdi - 0xf]
00c96 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c9b 443bd5                         cmp        r10d, ebp
00c9e 0f83001f0000                   jae        0x7ff77bbe9aa4
00ca4 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00cac 458b4a04                       mov        r9d, dword ptr [r10 + 4]
00cb0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00cb5 418bc3                         mov        eax, r11d
00cb8 418d69f1                       lea        ebp, [r9 - 0xf]
00cbc 4963cb                         movsxd     rcx, r11d
00cbf 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00cc7 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00cce 85ed                           test       ebp, ebp
00cd0 0f8cd6200000                   jl         0x7ff77bbe9cac
00cd6 458d51f1                       lea        r10d, [r9 - 0xf]
00cda 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ce2 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00cea 453bda                         cmp        r11d, r10d
00ced 0f83251f0000                   jae        0x7ff77bbe9b18
00cf3 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00cfb 418bd2                         mov        edx, r10d
00cfe 4d63d2                         movsxd     r10, r10d
00d01 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00d09 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00d10 448d5a10                       lea        r11d, [rdx + 0x10]
00d14 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00d19 458bc3                         mov        r8d, r11d
00d1c 453bde                         cmp        r11d, r14d
00d1f 0f8db9000000                   jge        0x7ff77bbe7cde
00d25 492bca                         sub        rcx, r10
00d28 4863ff                         movsxd     rdi, edi
00d2b 4883c7f1                       add        rdi, -0xf
00d2f 4d63db                         movsxd     r11, r11d
00d32 4d8d140b                       lea        r10, [r11 + rcx]
00d36 4c3bd7                         cmp        r10, rdi
00d39 0f83e1200000                   jae        0x7ff77bbe9d20
00d3f 4d63d6                         movsxd     r10, r14d
00d42 4d2bd3                         sub        r10, r11
00d45 4983c20f                       add        r10, 0xf
00d49 4983e2f0                       and        r10, 0xfffffffffffffff0
00d4d 458bd2                         mov        r10d, r10d
00d50 458d541210                     lea        r10d, [r10 + rdx + 0x10]
00d55 4d63d2                         movsxd     r10, r10d
00d58 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
00d5d 4c3bdf                         cmp        r11, rdi
00d60 0f83ba200000                   jae        0x7ff77bbe9d20
00d66 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
00d6e 0f83ac200000                   jae        0x7ff77bbe9d20
00d74 4d63d9                         movsxd     r11, r9d
00d77 4983c2f0                       add        r10, -0x10
00d7b 4983c3f1                       add        r11, -0xf
00d7f 4d3bd3                         cmp        r10, r11
00d82 0f8398200000                   jae        0x7ff77bbe9d20
00d88 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
00d8f 0f8fef200000                   jg         0x7ff77bbe9d84
00d95 448bc0                         mov        r8d, eax
00d98 442bc2                         sub        r8d, edx
00d9b 90                             nop        
00d9c 90                             nop        
00d9d 90                             nop        
00d9e 90                             nop        
00d9f 90                             nop        
00da0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00da5 458bd8                         mov        r11d, r8d
00da8 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00dad 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00db5 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00dbc 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00dc4 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00dcb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00dd0 4183c310                       add        r11d, 0x10
00dd4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00dd9 453bde                         cmp        r11d, r14d
00ddc 7cc2                           jl         0x7ff77bbe7ca0
00dde 03d8                           add        ebx, eax
00de0 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00de7 418bde                         mov        ebx, r14d
00dea e924f6ffff                     jmp        0x7ff77bbe7313
00def 4d63d1                         movsxd     r10, r9d
00df2 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df9 c442a8f5db                     bzhi       r11, r11, r10
00dfe c4c1fb92fb                     kmovq      k7, r11
00e03 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e09 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0f e994000000                     jmp        0x7ff77bbe7da8
00e14 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00e1c 448b5104                       mov        r10d, dword ptr [rcx + 4]
00e20 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00e28 418b5604                       mov        edx, dword ptr [r14 + 4]
00e2c 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00e31 4585ed                         test       r13d, r13d
00e34 0f8c2a1d0000                   jl         0x7ff77bbe9a64
00e3a 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00e41 85db                           test       ebx, ebx
00e43 0f8c221d0000                   jl         0x7ff77bbe9a6b
00e49 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00e4e 0f82171d0000                   jb         0x7ff77bbe9a6b
00e54 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00e5b 4103e9                         add        ebp, r9d
00e5e 3bd5                           cmp        edx, ebp
00e60 0f82051d0000                   jb         0x7ff77bbe9a6b
00e66 4585c9                         test       r9d, r9d
00e69 0f8cfc1c0000                   jl         0x7ff77bbe9a6b
00e6f 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e73 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e77 742f                           je         0x7ff77bbe7da8
00e79 4b8d740608                     lea        rsi, [r14 + r8 + 8]
00e7e 4a8d7c1908                     lea        rdi, [rcx + r11 + 8]
00e83 4963d1                         movsxd     rdx, r9d
00e86 4883fa20                       cmp        rdx, 0x20
00e8a 0f865fffffff                   jbe        0x7ff77bbe7cef
00e90 c5f877                         vzeroupper 
00e93 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00e9d 41ffd2                         call       r10
00ea0 0f1f840000000000               nop        dword ptr [rax + rax]
00ea8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00ead 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00eb1 c5f877                         vzeroupper 
00eb4 4881c400010000                 add        rsp, 0x100
00ebb 5d                             pop        rbp
00ebc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ec0 0f87ae280000                   ja         0x7ff77bbea674
00ec6 c3                             ret        
00ec7 4585db                         test       r11d, r11d
00eca 0f8c00210000                   jl         0x7ff77bbe9ed0
00ed0 418d6ef9                       lea        ebp, [r14 - 7]
00ed4 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00edb 443bed                         cmp        r13d, ebp
00ede 0f8304200000                   jae        0x7ff77bbe9de8
00ee4 458bd5                         mov        r10d, r13d
00ee7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00eec 4963fa                         movsxd     rdi, r10d
00eef 4d8b543808                     mov        r10, qword ptr [r8 + rdi + 8]
00ef4 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00ef9 3bdd                           cmp        ebx, ebp
00efb 0f835f200000                   jae        0x7ff77bbe9e60
00f01 448bdb                         mov        r11d, ebx
00f04 418d6b08                       lea        ebp, [r11 + 8]
00f08 896c2468                       mov        dword ptr [rsp + 0x68], ebp
00f0c 4d63cb                         movsxd     r9, r11d
00f0f 4f89540808                     mov        qword ptr [r8 + r9 + 8], r10
00f14 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00f1b 0f8d91030000                   jge        0x7ff77bbe81b2
00f21 492bf9                         sub        rdi, r9
00f24 4963f6                         movsxd     rsi, r14d
00f27 4883c6f9                       add        rsi, -7
00f2b 4c63cd                         movsxd     r9, ebp
00f2e 498d0c39                       lea        rcx, [r9 + rdi]
00f32 483bce                         cmp        rcx, rsi
00f35 0f8315210000                   jae        0x7ff77bbe9f50
00f3b 488bc8                         mov        rcx, rax
00f3e 492bc9                         sub        rcx, r9
00f41 4883c107                       add        rcx, 7
00f45 4883e1f8                       and        rcx, 0xfffffffffffffff8
00f49 448bf1                         mov        r14d, ecx
00f4c 478d741e08                     lea        r14d, [r14 + r11 + 8]
00f51 4963ce                         movsxd     rcx, r14d
00f54 488d5439f8                     lea        rdx, [rcx + rdi - 8]
00f59 483bd6                         cmp        rdx, rsi
00f5c 0f83ee200000                   jae        0x7ff77bbe9f50
00f62 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
00f69 0f83e1200000                   jae        0x7ff77bbe9f50
00f6f 4883c1f8                       add        rcx, -8
00f73 483bce                         cmp        rcx, rsi
00f76 0f83d4200000                   jae        0x7ff77bbe9f50
00f7c 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00f84 4181fef8ffff7f                 cmp        r14d, 0x7ffffff8
00f8b 0f8f3b210000                   jg         0x7ff77bbe9fcc
00f91 448b742474                     mov        r14d, dword ptr [rsp + 0x74]
00f96 452bf3                         sub        r14d, r11d
00f99 44893424                       mov        dword ptr [rsp], r14d
00f9d 498bd0                         mov        rdx, r8
00fa0 4c8d50c8                       lea        r10, [rax - 0x38]
00fa4 4981fa00000080                 cmp        r10, -0x80000000
00fab 48c7c100000080                 mov        rcx, 0xffffffff80000000
00fb2 4c0f4cd1                       cmovl      r10, rcx
00fb6 458bf2                         mov        r14d, r10d
00fb9 442beb                         sub        r13d, ebx
00fbc 458bd0                         mov        r10d, r8d
00fbf b9f8ffffff                     mov        ecx, 0xfffffff8
00fc4 412bca                         sub        ecx, r10d
00fc7 412bcb                         sub        ecx, r11d
00fca 4183c310                       add        r11d, 0x10
00fce 83c1f0                         add        ecx, -0x10
00fd1 4963db                         movsxd     rbx, r11d
00fd4 41ba06000000                   mov        r10d, 6
00fda c462a8f5d1                     bzhi       r10, rcx, r10
00fdf 4903da                         add        rbx, r10
00fe2 483bd8                         cmp        rbx, rax
00fe5 488bc8                         mov        rcx, rax
00fe8 480f4ccb                       cmovl      rcx, rbx
00fec 4c8bd1                         mov        r10, rcx
00fef 4d2bd1                         sub        r10, r9
00ff2 498d5aff                       lea        rbx, [r10 - 1]
00ff6 48c1fb3f                       sar        rbx, 0x3f
00ffa 48c1eb3d                       shr        rbx, 0x3d
00ffe 4e8d5413ff                     lea        r10, [rbx + r10 - 1]
01003 4983e2f8                       and        r10, 0xfffffffffffffff8
01007 4d03d1                         add        r10, r9
0100a 4d3bca                         cmp        r9, r10
0100d 4d0f4cca                       cmovl      r9, r10
01011 458bd1                         mov        r10d, r9d
01014 478d6c1508                     lea        r13d, [r13 + r10 + 8]
01019 4183c208                       add        r10d, 8
0101d 4963dd                         movsxd     rbx, r13d
01020 4803da                         add        rbx, rdx
01023 4963ea                         movsxd     rbp, r10d
01026 4803ea                         add        rbp, rdx
01029 4c8d4b08                       lea        r9, [rbx + 8]
0102d 4883c348                       add        rbx, 0x48
01031 488d5548                       lea        rdx, [rbp + 0x48]
01035 4533d2                         xor        r10d, r10d
01038 493bd1                         cmp        rdx, r9
0103b 410f96c2                       setbe      r10b
0103f 4883c508                       add        rbp, 8
01043 4533ed                         xor        r13d, r13d
01046 483bdd                         cmp        rbx, rbp
01049 410f96c5                       setbe      r13b
0104d 450bd5                         or         r10d, r13d
01050 0f84df100000                   je         0x7ff77bbe9035
01056 448bc9                         mov        r9d, ecx
01059 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01061 eb05                           jmp        0x7ff77bbe7f68
01063 90                             nop        
01064 894c2468                       mov        dword ptr [rsp + 0x68], ecx
01068 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0106d 448b0424                       mov        r8d, dword ptr [rsp]
01071 4403442468                     add        r8d, dword ptr [rsp + 0x68]
01076 4f8b440308                     mov        r8, qword ptr [r11 + r8 + 8]
0107b 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
01080 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01084 83c108                         add        ecx, 8
01087 413bc9                         cmp        ecx, r9d
0108a 7cd8                           jl         0x7ff77bbe7f64
0108c 480508feffff                   add        rax, -0x1f8
01092 483d00000080                   cmp        rax, -0x80000000
01098 49c7c200000080                 mov        r10, 0xffffffff80000000
0109f 490f4cc2                       cmovl      rax, r10
010a3 8bd8                           mov        ebx, eax
010a5 3bcb                           cmp        ecx, ebx
010a7 0f8d93200000                   jge        0x7ff77bbea040
010ad 4c63d1                         movsxd     r10, ecx
010b0 4c03d7                         add        r10, rdi
010b3 4c3bd6                         cmp        r10, rsi
010b6 0f8394200000                   jae        0x7ff77bbea050
010bc 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010c1 4181c200020000                 add        r10d, 0x200
010c8 4d63c2                         movsxd     r8, r10d
010cb 4c03c7                         add        r8, rdi
010ce 4c3bc6                         cmp        r8, rsi
010d1 0f838d200000                   jae        0x7ff77bbea064
010d7 3b8c2484000000                 cmp        ecx, dword ptr [rsp + 0x84]
010de 0f8394200000                   jae        0x7ff77bbea078
010e4 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
010ec 0f839a200000                   jae        0x7ff77bbea08c
010f2 498bd3                         mov        rdx, r11
010f5 eb0c                           jmp        0x7ff77bbe8003
010f7 90                             nop        
010f8 90                             nop        
010f9 90                             nop        
010fa 90                             nop        
010fb 90                             nop        
010fc 90                             nop        
010fd 90                             nop        
010fe 90                             nop        
010ff 90                             nop        
01100 418bc8                         mov        ecx, r8d
01103 448bd9                         mov        r11d, ecx
01106 4d63c3                         movsxd     r8, r11d
01109 448bd9                         mov        r11d, ecx
0110c 448b1424                       mov        r10d, dword ptr [rsp]
01110 4403d1                         add        r10d, ecx
01113 448d8980000000                 lea        r9d, [rcx + 0x80]
0111a 44030c24                       add        r9d, dword ptr [rsp]
0111e 418bc2                         mov        eax, r10d
01121 62f17e486f840208000000         vmovdqu32  zmm0, zmmword ptr [rdx + rax + 8]
0112c 62b17e487f841a08000000         vmovdqu32  zmmword ptr [rdx + r11 + 8], zmm0
01137 4963c2                         movsxd     rax, r10d
0113a 62f17e486f840248000000         vmovdqu32  zmm0, zmmword ptr [rdx + rax + 0x48]
01145 62b17e487f840248000000         vmovdqu32  zmmword ptr [rdx + r8 + 0x48], zmm0
01150 458bd1                         mov        r10d, r9d
01153 62b17e486f841208000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 8]
0115e 62b17e487f840288000000         vmovdqu32  zmmword ptr [rdx + r8 + 0x88], zmm0
01169 4d63d1                         movsxd     r10, r9d
0116c 62b17e486f841248000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0x48]
01177 62b17e487f8402c8000000         vmovdqu32  zmmword ptr [rdx + r8 + 0xc8], zmm0
01182 448d9900010000                 lea        r11d, [rcx + 0x100]
01189 44031c24                       add        r11d, dword ptr [rsp]
0118d 458bd3                         mov        r10d, r11d
01190 62b17e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [rdx + r11 + 8]
0119b 62b17e487f840208010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x108], zmm0
011a6 4d63d2                         movsxd     r10, r10d
011a9 62b17e486f841248000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0x48]
011b4 62b17e487f840248010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x148], zmm0
011bf 62f17e486f840288010000         vmovdqu32  zmm0, zmmword ptr [rdx + rax + 0x188]
011ca 62b17e487f840288010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x188], zmm0
011d5 62f17e486f8402c8010000         vmovdqu32  zmm0, zmmword ptr [rdx + rax + 0x1c8]
011e0 62b17e487f8402c8010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x1c8], zmm0
011eb 448d8100020000                 lea        r8d, [rcx + 0x200]
011f2 443bc3                         cmp        r8d, ebx
011f5 0f8c05ffffff                   jl         0x7ff77bbe8000
011fb 453bc6                         cmp        r8d, r14d
011fe 7d57                           jge        0x7ff77bbe8157
01200 81c138020000                   add        ecx, 0x238
01206 4c63d1                         movsxd     r10, ecx
01209 4c03d7                         add        r10, rdi
0120c 4c3bd6                         cmp        r10, rsi
0120f 0f838b1f0000                   jae        0x7ff77bbea0a0
01215 3b8c2484000000                 cmp        ecx, dword ptr [rsp + 0x84]
0121c 0f83a61f0000                   jae        0x7ff77bbea0c8
01222 90                             nop        
01223 90                             nop        
01224 458bd0                         mov        r10d, r8d
01227 448b0c24                       mov        r9d, dword ptr [rsp]
0122b 4503c8                         add        r9d, r8d
0122e 62b17e486f840a08000000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 8]
01239 62b17e487f841208000000         vmovdqu32  zmmword ptr [rdx + r10 + 8], zmm0
01244 4183c040                       add        r8d, 0x40
01248 453bc6                         cmp        r8d, r14d
0124b 7cd7                           jl         0x7ff77bbe8124
0124d 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
01255 eb08                           jmp        0x7ff77bbe815f
01257 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
0125f 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
01267 7d49                           jge        0x7ff77bbe81b2
01269 4d63d0                         movsxd     r10, r8d
0126c 4c03d7                         add        r10, rdi
0126f 4c3bd6                         cmp        r10, rsi
01272 0f833c1f0000                   jae        0x7ff77bbea0b4
01278 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
01280 0f83561f0000                   jae        0x7ff77bbea0dc
01286 90                             nop        
01287 90                             nop        
01288 458bd0                         mov        r10d, r8d
0128b 448b1c24                       mov        r11d, dword ptr [rsp]
0128f 4503d8                         add        r11d, r8d
01292 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0129a 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
0129f 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
012a4 4183c008                       add        r8d, 8
012a8 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
012b0 7cd6                           jl         0x7ff77bbe8188
012b2 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
012ba e94ef4ffff                     jmp        0x7ff77bbe760d
012bf 4585d2                         test       r10d, r10d
012c2 0f8c18200000                   jl         0x7ff77bbea1e0
012c8 458d56f1                       lea        r10d, [r14 - 0xf]
012cc 4489542478                     mov        dword ptr [rsp + 0x78], r10d
012d1 453bea                         cmp        r13d, r10d
012d4 0f83161f0000                   jae        0x7ff77bbea0f0
012da 4963cd                         movsxd     rcx, r13d
012dd c4c17a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 8]
012e4 413bda                         cmp        ebx, r10d
012e7 0f83771f0000                   jae        0x7ff77bbea164
012ed 8d6b10                         lea        ebp, [rbx + 0x10]
012f0 4c63d3                         movsxd     r10, ebx
012f3 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
012fa 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01301 0f8d94020000                   jge        0x7ff77bbe849b
01307 492bca                         sub        rcx, r10
0130a 4d63de                         movsxd     r11, r14d
0130d 4983c3f1                       add        r11, -0xf
01311 4c63cd                         movsxd     r9, ebp
01314 4d8d1409                       lea        r10, [r9 + rcx]
01318 4d3bd3                         cmp        r10, r11
0131b 0f8337200000                   jae        0x7ff77bbea258
01321 4c8bd0                         mov        r10, rax
01324 4d2bd1                         sub        r10, r9
01327 4983c20f                       add        r10, 0xf
0132b 4983e2f0                       and        r10, 0xfffffffffffffff0
0132f 458bd2                         mov        r10d, r10d
01332 458d4c1a10                     lea        r9d, [r10 + rbx + 0x10]
01337 4d63d1                         movsxd     r10, r9d
0133a 4d8d4c0af0                     lea        r9, [r10 + rcx - 0x10]
0133f 4d3bcb                         cmp        r9, r11
01342 0f8310200000                   jae        0x7ff77bbea258
01348 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
0134c 0f8306200000                   jae        0x7ff77bbea258
01352 4983c2f0                       add        r10, -0x10
01356 4d3bd3                         cmp        r10, r11
01359 0f83f91f0000                   jae        0x7ff77bbea258
0135f 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
01367 4181f9f0ffff7f                 cmp        r9d, 0x7ffffff0
0136e 0f8f4c200000                   jg         0x7ff77bbea2c0
01374 442beb                         sub        r13d, ebx
01377 83c320                         add        ebx, 0x20
0137a 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
01382 eb03                           jmp        0x7ff77bbe8287
01384 418bea                         mov        ebp, r10d
01387 448bc5                         mov        r8d, ebp
0138a 458bd5                         mov        r10d, r13d
0138d 4403d5                         add        r10d, ebp
01390 c4817a6f441108                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 8]
01397 c4817a7f440108                 vmovdqu    xmmword ptr [r9 + r8 + 8], xmm0
0139e 448d5510                       lea        r10d, [rbp + 0x10]
013a2 443bd3                         cmp        r10d, ebx
013a5 7cdd                           jl         0x7ff77bbe8284
013a7 480510ffffff                   add        rax, -0xf0
013ad 483d00000080                   cmp        rax, -0x80000000
013b3 49c7c000000080                 mov        r8, 0xffffffff80000000
013ba 490f4cc0                       cmovl      rax, r8
013be 8bd8                           mov        ebx, eax
013c0 443bd3                         cmp        r10d, ebx
013c3 0f8d57200000                   jge        0x7ff77bbea320
013c9 4d63c2                         movsxd     r8, r10d
013cc 4c03c1                         add        r8, rcx
013cf 4d3bc3                         cmp        r8, r11
013d2 0f8355200000                   jae        0x7ff77bbea32d
013d8 81c500010000                   add        ebp, 0x100
013de 4c63c5                         movsxd     r8, ebp
013e1 4c03c1                         add        r8, rcx
013e4 4d3bc3                         cmp        r8, r11
013e7 0f8354200000                   jae        0x7ff77bbea341
013ed 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
013f2 0f835d200000                   jae        0x7ff77bbea355
013f8 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
013fc 0f8367200000                   jae        0x7ff77bbea369
01402 4d8bf1                         mov        r14, r9
01405 90                             nop        
01406 90                             nop        
01407 90                             nop        
01408 90                             nop        
01409 90                             nop        
0140a 90                             nop        
0140b 90                             nop        
0140c 90                             nop        
0140d 90                             nop        
0140e 90                             nop        
0140f 90                             nop        
01410 458bc2                         mov        r8d, r10d
01413 4963f8                         movsxd     rdi, r8d
01416 458bca                         mov        r9d, r10d
01419 478d042a                       lea        r8d, [r10 + r13]
0141d 418bd0                         mov        edx, r8d
01420 c4817a6f440608                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 8]
01427 c4817a7f440e08                 vmovdqu    xmmword ptr [r14 + r9 + 8], xmm0
0142e 4c63c2                         movsxd     r8, edx
01431 c4817a6f440618                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x18]
01438 c4c17a7f443e18                 vmovdqu    xmmword ptr [r14 + rdi + 0x18], xmm0
0143f c4817a6f440628                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x28]
01446 c4c17a7f443e28                 vmovdqu    xmmword ptr [r14 + rdi + 0x28], xmm0
0144d c4817a6f440638                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x38]
01454 c4c17a7f443e38                 vmovdqu    xmmword ptr [r14 + rdi + 0x38], xmm0
0145b c4817a6f440648                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x48]
01462 c4c17a7f443e48                 vmovdqu    xmmword ptr [r14 + rdi + 0x48], xmm0
01469 c4817a6f440658                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x58]
01470 c4c17a7f443e58                 vmovdqu    xmmword ptr [r14 + rdi + 0x58], xmm0
01477 c4817a6f440668                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x68]
0147e c4c17a7f443e68                 vmovdqu    xmmword ptr [r14 + rdi + 0x68], xmm0
01485 c4817a6f440678                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x78]
0148c c4c17a7f443e78                 vmovdqu    xmmword ptr [r14 + rdi + 0x78], xmm0
01493 c4817a6f840688000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x88]
0149d c4c17a7f843e88000000           vmovdqu    xmmword ptr [r14 + rdi + 0x88], xmm0
014a7 c4817a6f840698000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x98]
014b1 c4c17a7f843e98000000           vmovdqu    xmmword ptr [r14 + rdi + 0x98], xmm0
014bb c4817a6f8406a8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xa8]
014c5 c4c17a7f843ea8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xa8], xmm0
014cf c4817a6f8406b8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xb8]
014d9 c4c17a7f843eb8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xb8], xmm0
014e3 c4817a6f8406c8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xc8]
014ed c4c17a7f843ec8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xc8], xmm0
014f7 c4817a6f8406d8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xd8]
01501 c4c17a7f843ed8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xd8], xmm0
0150b c4817a6f8406e8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xe8]
01515 c4c17a7f843ee8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xe8], xmm0
0151f c4817a6f8406f8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xf8]
01529 c4c17a7f843ef8000000           vmovdqu    xmmword ptr [r14 + rdi + 0xf8], xmm0
01533 4181c200010000                 add        r10d, 0x100
0153a 443bd3                         cmp        r10d, ebx
0153d 0f8ccdfeffff                   jl         0x7ff77bbe8310
01543 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
0154b 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01553 7d46                           jge        0x7ff77bbe849b
01555 4d63c2                         movsxd     r8, r10d
01558 4c03c1                         add        r8, rcx
0155b 4d3bc3                         cmp        r8, r11
0155e 0f83191f0000                   jae        0x7ff77bbea37d
01564 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
01569 0f83221f0000                   jae        0x7ff77bbea391
0156f 90                             nop        
01570 458bda                         mov        r11d, r10d
01573 478d0c2a                       lea        r9d, [r10 + r13]
01577 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0157f c4a17a6f440b08                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 8]
01586 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
0158d 4183c210                       add        r10d, 0x10
01591 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01599 7cd5                           jl         0x7ff77bbe8470
0159b 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
015a3 e965f1ffff                     jmp        0x7ff77bbe760d
015a8 bee4ffffff                     mov        esi, 0xffffffe4
015ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015b2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015b7 44895c2408                     mov        dword ptr [rsp + 8], r11d
015bc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015c1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015c6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015cb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015d0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
015d5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015da 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
015df 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
015e4 c5f877                         vzeroupper 
015e7 e87455aeff                     call       0x7ff77b6cda60
015ec 0f1f8400e4160003               nop        dword ptr [rax + rax + 0x30016e4]
015f4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
015fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01602 e8d9761718                     call       0x7ff793d5fbe0
01607 f4                             hlt        
01608 bee4ffffff                     mov        esi, 0xffffffe4
0160d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01612 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01617 4489442408                     mov        dword ptr [rsp + 8], r8d
0161c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01621 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01626 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0162b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01630 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01635 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0163a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0163f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01644 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01649 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0164e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01652 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01657 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0165c 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01661 90                             nop        
01662 90                             nop        
01663 90                             nop        
01664 c5f877                         vzeroupper 
01667 e8f454aeff                     call       0x7ff77b6cda60
0166c 0f1f840064170004               nop        dword ptr [rax + rax + 0x4001764]
01674 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0167e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01682 e859761718                     call       0x7ff793d5fbe0
01687 f4                             hlt        
01688 bee4ffffff                     mov        esi, 0xffffffe4
0168d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01692 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01697 4489442408                     mov        dword ptr [rsp + 8], r8d
0169c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016a1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
016a6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016ab 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016b0 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016b5 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
016ba 4489442438                     mov        dword ptr [rsp + 0x38], r8d
016bf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016c4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016c9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
016ce 4489442460                     mov        dword ptr [rsp + 0x60], r8d
016d3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
016d7 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
016df 4489442468                     mov        dword ptr [rsp + 0x68], r8d
016e4 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
016ec 4489442478                     mov        dword ptr [rsp + 0x78], r8d
016f1 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
016f6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016ff 90                             nop        
01700 c5f877                         vzeroupper 
01703 e85854aeff                     call       0x7ff77b6cda60
01708 0f1f840000180005               nop        dword ptr [rax + rax + 0x5001800]
01710 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0171a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0171e e8bd751718                     call       0x7ff793d5fbe0
01723 f4                             hlt        
01724 beccffffff                     mov        esi, 0xffffffcc
01729 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0172e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01733 4489542408                     mov        dword ptr [rsp + 8], r10d
01738 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0173d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01742 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01747 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0174c 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01751 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01756 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0175b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01760 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01765 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0176a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0176e 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01773 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01778 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0177d 90                             nop        
0177e 90                             nop        
0177f 90                             nop        
01780 c5f877                         vzeroupper 
01783 e8d853aeff                     call       0x7ff77b6cda60
01788 0f1f840080180006               nop        dword ptr [rax + rax + 0x6001880]
01790 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0179a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179e e83d751718                     call       0x7ff793d5fbe0
017a3 f4                             hlt        
017a4 beccffffff                     mov        esi, 0xffffffcc
017a9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ae 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017b3 4489542408                     mov        dword ptr [rsp + 8], r10d
017b8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017bd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017c2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017c7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017cc 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
017d1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
017d6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
017db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017e0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
017e5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017ea 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
017ef 895c2464                       mov        dword ptr [rsp + 0x64], ebx
017f3 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
017fb 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01800 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01808 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0180d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01812 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0181b 90                             nop        
0181c c5f877                         vzeroupper 
0181f e83c53aeff                     call       0x7ff77b6cda60
01824 0f1f84001c190007               nop        dword ptr [rax + rax + 0x700191c]
0182c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0183a e8a1741718                     call       0x7ff793d5fbe0
0183f f4                             hlt        
01840 bee4ffffff                     mov        esi, 0xffffffe4
01845 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0184a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0184f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01854 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01859 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0185e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01863 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01868 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0186d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01872 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01877 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0187c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01881 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01886 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0188b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01890 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01894 c5f877                         vzeroupper 
01897 e8c452aeff                     call       0x7ff77b6cda60
0189c 0f1f840094190008               nop        dword ptr [rax + rax + 0x8001994]
018a4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
018ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b2 e829741718                     call       0x7ff793d5fbe0
018b7 f4                             hlt        
018b8 bee4ffffff                     mov        esi, 0xffffffe4
018bd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018c2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018c7 44895c2408                     mov        dword ptr [rsp + 8], r11d
018cc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018d1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018d6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018db 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018e0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018e4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018e9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018ee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018f3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
018f8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018fd 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01902 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01907 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0190c c5f877                         vzeroupper 
0190f e84c52aeff                     call       0x7ff77b6cda60
01914 0f1f84000c1a0009               nop        dword ptr [rax + rax + 0x9001a0c]
0191c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e8b1731718                     call       0x7ff793d5fbe0
0192f f4                             hlt        
01930 bee4ffffff                     mov        esi, 0xffffffe4
01935 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0193a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0193f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01944 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01949 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0194e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01953 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01958 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0195d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01962 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01967 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0196c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01971 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01976 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0197e 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01983 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01987 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0198c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01995 90                             nop        
01996 90                             nop        
01997 90                             nop        
01998 c5f877                         vzeroupper 
0199b e8c051aeff                     call       0x7ff77b6cda60
019a0 0f1f8400981a000a               nop        dword ptr [rax + rax + 0xa001a98]
019a8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
019b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019b6 e825731718                     call       0x7ff793d5fbe0
019bb f4                             hlt        
019bc beccffffff                     mov        esi, 0xffffffcc
019c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019c6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019cb 44895c2408                     mov        dword ptr [rsp + 8], r11d
019d0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
019d5 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
019da 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
019df 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
019e4 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019e8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019ed 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019f2 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
019f7 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
019fc 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a01 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a06 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01a0b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01a10 c5f877                         vzeroupper 
01a13 e84851aeff                     call       0x7ff77b6cda60
01a18 0f1f8400101b000b               nop        dword ptr [rax + rax + 0xb001b10]
01a20 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a2e e8ad721718                     call       0x7ff793d5fbe0
01a33 f4                             hlt        
01a34 be45ffffff                     mov        esi, 0xffffff45
01a39 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a3e 4c89542408                     mov        qword ptr [rsp + 8], r10
01a43 90                             nop        
01a44 c5f877                         vzeroupper 
01a47 e81451aeff                     call       0x7ff77b6cda60
01a4c 0f1f8400441b000c               nop        dword ptr [rax + rax + 0xc001b44]
01a54 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a62 e879721718                     call       0x7ff793d5fbe0
01a67 f4                             hlt        
01a68 be45ffffff                     mov        esi, 0xffffff45
01a6d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a72 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a77 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a7c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a81 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a86 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a8b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a90 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a95 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a9a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a9f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01aa4 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01aa8 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01aac c5f877                         vzeroupper 
01aaf e8ac50aeff                     call       0x7ff77b6cda60
01ab4 0f1f8400ac1b000d               nop        dword ptr [rax + rax + 0xd001bac]
01abc 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01ac6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aca e811721718                     call       0x7ff793d5fbe0
01acf f4                             hlt        
01ad0 493bfa                         cmp        rdi, r10
01ad3 bdffffffff                     mov        ebp, 0xffffffff
01ad8 7c08                           jl         0x7ff77bbe89e2
01ada 400f95c5                       setne      bpl
01ade 400fb6ed                       movzx      ebp, bpl
01ae2 be45ffffff                     mov        esi, 0xffffff45
01ae7 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01aec 4c891c24                       mov        qword ptr [rsp], r11
01af0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01af5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01afa 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01aff 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b04 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01b09 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01b0e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b13 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01b18 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01b1c 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b21 90                             nop        
01b22 90                             nop        
01b23 90                             nop        
01b24 c5f877                         vzeroupper 
01b27 e83450aeff                     call       0x7ff77b6cda60
01b2c 0f1f8400241c000e               nop        dword ptr [rax + rax + 0xe001c24]
01b34 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b42 e899711718                     call       0x7ff793d5fbe0
01b47 f4                             hlt        
01b48 be45ffffff                     mov        esi, 0xffffff45
01b4d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b52 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b57 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b66 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b6b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b70 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01b75 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01b7a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b7f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b84 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01b8c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01b91 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b96 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01b9b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01b9f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01ba4 c5f877                         vzeroupper 
01ba7 e8b44faeff                     call       0x7ff77b6cda60
01bac 0f1f8400a41c000f               nop        dword ptr [rax + rax + 0xf001ca4]
01bb4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bc2 e819711718                     call       0x7ff793d5fbe0
01bc7 f4                             hlt        
01bc8 be45ffffff                     mov        esi, 0xffffff45
01bcd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bd2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bd7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bdc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01be1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01be6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01beb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01bf0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01bf5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01bfa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bff 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c04 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01c0c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01c11 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c16 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c1b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01c1f 90                             nop        
01c20 c5f877                         vzeroupper 
01c23 e8384faeff                     call       0x7ff77b6cda60
01c28 0f1f8400201d0010               nop        dword ptr [rax + rax + 0x10001d20]
01c30 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01c3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c3e e89d701718                     call       0x7ff793d5fbe0
01c43 f4                             hlt        
01c44 4c8b9c24b0000000               mov        r11, qword ptr [rsp + 0xb0]
01c4c 4d3bcb                         cmp        r9, r11
01c4f bdffffffff                     mov        ebp, 0xffffffff
01c54 7c08                           jl         0x7ff77bbe8b5e
01c56 400f95c5                       setne      bpl
01c5a 400fb6ed                       movzx      ebp, bpl
01c5e be45ffffff                     mov        esi, 0xffffff45
01c63 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01c68 4c891c24                       mov        qword ptr [rsp], r11
01c6c 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c71 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c76 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01c7b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01c80 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c85 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01c8a 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01c8e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01c93 90                             nop        
01c94 c5f877                         vzeroupper 
01c97 e8c44eaeff                     call       0x7ff77b6cda60
01c9c 0f1f8400941d0011               nop        dword ptr [rax + rax + 0x11001d94]
01ca4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01cae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cb2 e829701718                     call       0x7ff793d5fbe0
01cb7 f4                             hlt        
01cb8 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
01cc0 493bfb                         cmp        rdi, r11
01cc3 bdffffffff                     mov        ebp, 0xffffffff
01cc8 7c08                           jl         0x7ff77bbe8bd2
01cca 400f95c5                       setne      bpl
01cce 400fb6ed                       movzx      ebp, bpl
01cd2 be45ffffff                     mov        esi, 0xffffff45
01cd7 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01cdc 4c891c24                       mov        qword ptr [rsp], r11
01ce0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ce5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01cea 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01cef 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01cf4 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01cf9 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01cfe 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01d02 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d07 90                             nop        
01d08 c5f877                         vzeroupper 
01d0b e8504eaeff                     call       0x7ff77b6cda60
01d10 0f1f8400081e0012               nop        dword ptr [rax + rax + 0x12001e08]
01d18 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01d22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d26 e8b56f1718                     call       0x7ff793d5fbe0
01d2b f4                             hlt        
01d2c bee4ffffff                     mov        esi, 0xffffffe4
01d31 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d36 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01d3b 44894c2408                     mov        dword ptr [rsp + 8], r9d
01d40 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d45 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d4a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d4f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d54 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01d59 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d5e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01d63 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01d68 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d6d 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d72 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01d7a 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01d7f 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01d83 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d87 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01d8f 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01d97 90                             nop        
01d98 c5f877                         vzeroupper 
01d9b e8c04daeff                     call       0x7ff77b6cda60
01da0 0f1f8400981e0013               nop        dword ptr [rax + rax + 0x13001e98]
01da8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db6 e8256f1718                     call       0x7ff793d5fbe0
01dbb f4                             hlt        
01dbc bee4ffffff                     mov        esi, 0xffffffe4
01dc1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01dc6 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01dca 894c2408                       mov        dword ptr [rsp + 8], ecx
01dce 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
01dd3 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01dd8 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
01ddc 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01de0 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
01de4 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01de8 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01ded 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01df2 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01df6 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01dfa 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01e02 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e07 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01e0b 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01e10 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01e15 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01e19 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01e21 90                             nop        
01e22 90                             nop        
01e23 90                             nop        
01e24 c5f877                         vzeroupper 
01e27 e8344daeff                     call       0x7ff77b6cda60
01e2c 0f1f8400241f0014               nop        dword ptr [rax + rax + 0x14001f24]
01e34 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01e3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e42 e8996e1718                     call       0x7ff793d5fbe0
01e47 f4                             hlt        
01e48 beccffffff                     mov        esi, 0xffffffcc
01e4d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e52 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e57 4489542408                     mov        dword ptr [rsp + 8], r10d
01e5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e66 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e6b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e70 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e75 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e7a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01e7f 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01e84 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e89 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e8e 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01e96 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e9b 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01e9f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01ea3 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01eab 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01eb3 90                             nop        
01eb4 c5f877                         vzeroupper 
01eb7 e8a44caeff                     call       0x7ff77b6cda60
01ebc 0f1f8400b41f0015               nop        dword ptr [rax + rax + 0x15001fb4]
01ec4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01ece 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed2 e8096e1718                     call       0x7ff793d5fbe0
01ed7 f4                             hlt        
01ed8 4183c508                       add        r13d, 8
01edc be6effffff                     mov        esi, 0xffffff6e
01ee1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ee6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01eeb 4489542408                     mov        dword ptr [rsp + 8], r10d
01ef0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ef5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01efa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01eff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f04 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01f09 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f0e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f13 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f18 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f1d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f22 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f27 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01f2f 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01f34 897c2474                       mov        dword ptr [rsp + 0x74], edi
01f38 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01f3d 90                             nop        
01f3e 90                             nop        
01f3f 90                             nop        
01f40 c5f877                         vzeroupper 
01f43 e8184caeff                     call       0x7ff77b6cda60
01f48 0f1f840040200016               nop        dword ptr [rax + rax + 0x16002040]
01f50 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01f5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f5e e87d6d1718                     call       0x7ff793d5fbe0
01f63 f4                             hlt        
01f64 4183c508                       add        r13d, 8
01f68 be66ffffff                     mov        esi, 0xffffff66
01f6d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f72 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f77 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f7c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f81 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f86 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f8b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f90 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01f95 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01f9a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f9f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01fa4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01fa9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fae 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01fb3 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01fb8 897c2474                       mov        dword ptr [rsp + 0x74], edi
01fbc 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01fc1 90                             nop        
01fc2 90                             nop        
01fc3 90                             nop        
01fc4 c5f877                         vzeroupper 
01fc7 e8944baeff                     call       0x7ff77b6cda60
01fcc 0f1f8400c4200017               nop        dword ptr [rax + rax + 0x170020c4]
01fd4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
01fde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe2 e8f96c1718                     call       0x7ff793d5fbe0
01fe7 f4                             hlt        
01fe8 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
01ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff6 e8e56c1718                     call       0x7ff793d5fbe0
01ffb f4                             hlt        
01ffc 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
02006 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200a e8d16c1718                     call       0x7ff793d5fbe0
0200f f4                             hlt        
02010 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0201a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0201e e8bd6c1718                     call       0x7ff793d5fbe0
02023 f4                             hlt        
02024 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0202e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02032 e8a96c1718                     call       0x7ff793d5fbe0
02037 f4                             hlt        
02038 4533d2                         xor        r10d, r10d
0203b 4c89542408                     mov        qword ptr [rsp + 8], r10
02040 e9f7e0ffff                     jmp        0x7ff77bbe703c
02045 4533d2                         xor        r10d, r10d
02048 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02050 e914e1ffff                     jmp        0x7ff77bbe7069
02055 4533d2                         xor        r10d, r10d
02058 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02060 e933e1ffff                     jmp        0x7ff77bbe7098
02065 4533d2                         xor        r10d, r10d
02068 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0206d e950e1ffff                     jmp        0x7ff77bbe70c2
02072 4533d2                         xor        r10d, r10d
02075 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0207d e969e1ffff                     jmp        0x7ff77bbe70eb
02082 4533d2                         xor        r10d, r10d
02085 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0208d e97fe1ffff                     jmp        0x7ff77bbe7111
02092 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0209c 4883e4f0                       and        rsp, 0xfffffffffffffff0
020a0 e83b6c1718                     call       0x7ff793d5fbe0
020a5 f4                             hlt        
020a6 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
020b0 4883e4f0                       and        rsp, 0xfffffffffffffff0
020b4 e8276c1718                     call       0x7ff793d5fbe0
020b9 f4                             hlt        
020ba beccffffff                     mov        esi, 0xffffffcc
020bf 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020c4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020c9 4489542408                     mov        dword ptr [rsp + 8], r10d
020ce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020d3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020d8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020dd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020e2 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
020e7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020ec 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020f1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020f6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020fb 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02100 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02105 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02109 90                             nop        
0210a 90                             nop        
0210b 90                             nop        
0210c c5f877                         vzeroupper 
0210f e84c4aaeff                     call       0x7ff77b6cda60
02114 0f1f84000c220018               nop        dword ptr [rax + rax + 0x1800220c]
0211c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02126 4883e4f0                       and        rsp, 0xfffffffffffffff0
0212a e8b16b1718                     call       0x7ff793d5fbe0
0212f f4                             hlt        
02130 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02135 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0213a 448b0c24                       mov        r9d, dword ptr [rsp]
0213e 44034c2468                     add        r9d, dword ptr [rsp + 0x68]
02143 4f8b4c0808                     mov        r9, qword ptr [r8 + r9 + 8]
02148 4f894c1008                     mov        qword ptr [r8 + r10 + 8], r9
0214d 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
02152 4183c108                       add        r9d, 8
02156 453bcb                         cmp        r9d, r11d
02159 7cd5                           jl         0x7ff77bbe9030
0215b 453bce                         cmp        r9d, r14d
0215e 0f8d41130000                   jge        0x7ff77bbea3a5
02164 4d63d1                         movsxd     r10, r9d
02167 4c03d7                         add        r10, rdi
0216a 4c3bd6                         cmp        r10, rsi
0216d 0f833f130000                   jae        0x7ff77bbea3b2
02173 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02178 4183c240                       add        r10d, 0x40
0217c 4d63da                         movsxd     r11, r10d
0217f 4c03df                         add        r11, rdi
02182 4c3bde                         cmp        r11, rsi
02185 0f833b130000                   jae        0x7ff77bbea3c6
0218b 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
02193 0f8341130000                   jae        0x7ff77bbea3da
02199 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
021a1 0f8347130000                   jae        0x7ff77bbea3ee
021a7 498bd8                         mov        rbx, r8
021aa 90                             nop        
021ab 90                             nop        
021ac 90                             nop        
021ad 90                             nop        
021ae 90                             nop        
021af 90                             nop        
021b0 458bd1                         mov        r10d, r9d
021b3 4963ca                         movsxd     rcx, r10d
021b6 458bd1                         mov        r10d, r9d
021b9 448b0424                       mov        r8d, dword ptr [rsp]
021bd 4503c1                         add        r8d, r9d
021c0 458bd8                         mov        r11d, r8d
021c3 4e8b440308                     mov        r8, qword ptr [rbx + r8 + 8]
021c8 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
021cd 4d63db                         movsxd     r11, r11d
021d0 4e8b541b10                     mov        r10, qword ptr [rbx + r11 + 0x10]
021d5 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
021da 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
021df 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
021e4 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
021e9 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
021ee 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
021f3 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
021f8 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
021fd 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
02202 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
02207 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
0220c 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
02211 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
02216 4183c140                       add        r9d, 0x40
0221a 453bce                         cmp        r9d, r14d
0221d 7c91                           jl         0x7ff77bbe90b0
0221f 48899c24e0000000               mov        qword ptr [rsp + 0xe0], rbx
02227 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0222f 0f8d7df0ffff                   jge        0x7ff77bbe81b2
02235 4d63d1                         movsxd     r10, r9d
02238 4c03d7                         add        r10, rdi
0223b 4c3bd6                         cmp        r10, rsi
0223e 0f83be120000                   jae        0x7ff77bbea402
02244 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
0224c 0f83c4120000                   jae        0x7ff77bbea416
02252 90                             nop        
02253 90                             nop        
02254 458bd1                         mov        r10d, r9d
02257 448b1c24                       mov        r11d, dword ptr [rsp]
0225b 4503d9                         add        r11d, r9d
0225e 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
02266 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0226b 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
02270 4183c108                       add        r9d, 8
02274 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0227c 7cd6                           jl         0x7ff77bbe9154
0227e e92ff0ffff                     jmp        0x7ff77bbe81b2
02283 bee4ffffff                     mov        esi, 0xffffffe4
02288 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0228d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02292 44895c2408                     mov        dword ptr [rsp + 8], r11d
02297 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0229c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022a1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022a6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022ab 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
022b0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022b5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022ba 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
022bf 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
022c4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022c9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022ce 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
022d3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
022d7 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
022df 4489542468                     mov        dword ptr [rsp + 0x68], r10d
022e4 89942480000000                 mov        dword ptr [rsp + 0x80], edx
022eb 90                             nop        
022ec c5f877                         vzeroupper 
022ef e86c48aeff                     call       0x7ff77b6cda60
022f4 0f1f8400ec230019               nop        dword ptr [rax + rax + 0x190023ec]
022fc 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02306 4883e4f0                       and        rsp, 0xfffffffffffffff0
0230a e8d1691718                     call       0x7ff793d5fbe0
0230f f4                             hlt        
02310 bee4ffffff                     mov        esi, 0xffffffe4
02315 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0231a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0231f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02324 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02329 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0232e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02333 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02338 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0233d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02342 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02347 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0234c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02351 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02356 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0235a 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0235f 90                             nop        
02360 c5f877                         vzeroupper 
02363 e8f847aeff                     call       0x7ff77b6cda60
02368 0f1f84006024001a               nop        dword ptr [rax + rax + 0x1a002460]
02370 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0237a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0237e e85d691718                     call       0x7ff793d5fbe0
02383 f4                             hlt        
02384 bee4ffffff                     mov        esi, 0xffffffe4
02389 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0238e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02393 4489542408                     mov        dword ptr [rsp + 8], r10d
02398 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0239d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023a2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023a7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023ac 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023b1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
023b6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023bb 4489542460                     mov        dword ptr [rsp + 0x60], r10d
023c0 895c2464                       mov        dword ptr [rsp + 0x64], ebx
023c4 c5f877                         vzeroupper 
023c7 e89447aeff                     call       0x7ff77b6cda60
023cc 0f1f8400c424001b               nop        dword ptr [rax + rax + 0x1b0024c4]
023d4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
023de 4883e4f0                       and        rsp, 0xfffffffffffffff0
023e2 e8f9681718                     call       0x7ff793d5fbe0
023e7 f4                             hlt        
023e8 bee4ffffff                     mov        esi, 0xffffffe4
023ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023f2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023f7 44895c2408                     mov        dword ptr [rsp + 8], r11d
023fc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02401 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02406 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0240b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02410 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02415 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0241a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0241f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02424 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02429 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0242e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02436 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0243b 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02442 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
0244a 90                             nop        
0244b 90                             nop        
0244c c5f877                         vzeroupper 
0244f e80c47aeff                     call       0x7ff77b6cda60
02454 0f1f84004c25001c               nop        dword ptr [rax + rax + 0x1c00254c]
0245c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0246a e871681718                     call       0x7ff793d5fbe0
0246f f4                             hlt        
02470 bee4ffffff                     mov        esi, 0xffffffe4
02475 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0247a 4c891424                       mov        qword ptr [rsp], r10
0247e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02483 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02488 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0248d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02492 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02497 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0249c 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
024a1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
024a9 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
024ae 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
024b5 90                             nop        
024b6 90                             nop        
024b7 90                             nop        
024b8 c5f877                         vzeroupper 
024bb e8a046aeff                     call       0x7ff77b6cda60
024c0 0f1f8400b825001d               nop        dword ptr [rax + rax + 0x1d0025b8]
024c8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
024d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024d6 e805681718                     call       0x7ff793d5fbe0
024db f4                             hlt        
024dc 418d6d01                       lea        ebp, [r13 + 1]
024e0 bee4ffffff                     mov        esi, 0xffffffe4
024e5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024ea 4c891424                       mov        qword ptr [rsp], r10
024ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024f3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
024f8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
024fd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02502 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02507 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0250c 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02510 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02515 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0251d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
02522 90                             nop        
02523 90                             nop        
02524 c5f877                         vzeroupper 
02527 e83446aeff                     call       0x7ff77b6cda60
0252c 0f1f84002426001e               nop        dword ptr [rax + rax + 0x1e002624]
02534 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0253e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02542 e899671718                     call       0x7ff793d5fbe0
02547 f4                             hlt        
02548 bee4ffffff                     mov        esi, 0xffffffe4
0254d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02552 4c891424                       mov        qword ptr [rsp], r10
02556 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0255b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02560 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02565 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0256a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0256f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02574 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02578 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0257d 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02585 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0258a 90                             nop        
0258b 90                             nop        
0258c c5f877                         vzeroupper 
0258f e8cc45aeff                     call       0x7ff77b6cda60
02594 0f1f84008c26001f               nop        dword ptr [rax + rax + 0x1f00268c]
0259c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
025a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
025aa e831671718                     call       0x7ff793d5fbe0
025af f4                             hlt        
025b0 bee4ffffff                     mov        esi, 0xffffffe4
025b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025ba 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025bf 4489542408                     mov        dword ptr [rsp + 8], r10d
025c4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025c9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025ce 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025d3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025d8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
025dd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
025e2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025e7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025ec 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025f1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025f6 895c2468                       mov        dword ptr [rsp + 0x68], ebx
025fa 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025ff 90                             nop        
02600 c5f877                         vzeroupper 
02603 e85845aeff                     call       0x7ff77b6cda60
02608 0f1f840000270020               nop        dword ptr [rax + rax + 0x20002700]
02610 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0261a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0261e e8bd661718                     call       0x7ff793d5fbe0
02623 f4                             hlt        
02624 bee4ffffff                     mov        esi, 0xffffffe4
02629 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0262e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02633 44895c2408                     mov        dword ptr [rsp + 8], r11d
02638 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0263d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02642 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02647 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0264c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02651 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02656 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0265b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02660 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02665 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0266a 895c2468                       mov        dword ptr [rsp + 0x68], ebx
0266e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02676 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0267b 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02683 90                             nop        
02684 c5f877                         vzeroupper 
02687 e8d444aeff                     call       0x7ff77b6cda60
0268c 0f1f840084270021               nop        dword ptr [rax + rax + 0x21002784]
02694 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0269e 4883e4f0                       and        rsp, 0xfffffffffffffff0
026a2 e839661718                     call       0x7ff793d5fbe0
026a7 f4                             hlt        
026a8 bee4ffffff                     mov        esi, 0xffffffe4
026ad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
026b2 4c891424                       mov        qword ptr [rsp], r10
026b6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
026bb 4489542414                     mov        dword ptr [rsp + 0x14], r10d
026c0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
026c5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026ca 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026cf 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
026d4 895c2470                       mov        dword ptr [rsp + 0x70], ebx
026d8 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
026e0 4489542478                     mov        dword ptr [rsp + 0x78], r10d
026e5 90                             nop        
026e6 90                             nop        
026e7 90                             nop        
026e8 c5f877                         vzeroupper 
026eb e87044aeff                     call       0x7ff77b6cda60
026f0 0f1f8400e8270022               nop        dword ptr [rax + rax + 0x220027e8]
026f8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02702 4883e4f0                       and        rsp, 0xfffffffffffffff0
02706 e8d5651718                     call       0x7ff793d5fbe0
0270b f4                             hlt        
0270c beccffffff                     mov        esi, 0xffffffcc
02711 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02716 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0271b 4489542408                     mov        dword ptr [rsp + 8], r10d
02720 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02725 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0272a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0272f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02734 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02739 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0273e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02743 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02748 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0274d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02752 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02756 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0275e 4489542470                     mov        dword ptr [rsp + 0x70], r10d
02763 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
0276b 90                             nop        
0276c c5f877                         vzeroupper 
0276f e8ec43aeff                     call       0x7ff77b6cda60
02774 0f1f84006c280023               nop        dword ptr [rax + rax + 0x2300286c]
0277c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02786 4883e4f0                       and        rsp, 0xfffffffffffffff0
0278a e851651718                     call       0x7ff793d5fbe0
0278f f4                             hlt        
02790 beccffffff                     mov        esi, 0xffffffcc
02795 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0279a 4c891424                       mov        qword ptr [rsp], r10
0279e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027a3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
027a8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
027ad 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
027b2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027b7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
027bc 895c2470                       mov        dword ptr [rsp + 0x70], ebx
027c0 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
027c8 4489542474                     mov        dword ptr [rsp + 0x74], r10d
027cd 90                             nop        
027ce 90                             nop        
027cf 90                             nop        
027d0 c5f877                         vzeroupper 
027d3 e88843aeff                     call       0x7ff77b6cda60
027d8 0f1f8400d0280024               nop        dword ptr [rax + rax + 0x240028d0]
027e0 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
027ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ee e8ed641718                     call       0x7ff793d5fbe0
027f3 f4                             hlt        
027f4 be6effffff                     mov        esi, 0xffffff6e
027f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027fe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02803 4489542408                     mov        dword ptr [rsp + 8], r10d
02808 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0280d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02812 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02817 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0281c 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02821 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02826 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0282b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02830 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02835 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0283a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0283f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02844 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02848 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0284d 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02851 90                             nop        
02852 90                             nop        
02853 90                             nop        
02854 c5f877                         vzeroupper 
02857 e80443aeff                     call       0x7ff77b6cda60
0285c 0f1f840054290025               nop        dword ptr [rax + rax + 0x25002954]
02864 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0286e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02872 e869641718                     call       0x7ff793d5fbe0
02877 f4                             hlt        
02878 be45ffffff                     mov        esi, 0xffffff45
0287d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02882 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02887 44895c2408                     mov        dword ptr [rsp + 8], r11d
0288c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02891 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02896 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0289b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028a0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
028a5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
028aa 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
028af 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
028b4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028b9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
028be 895c2464                       mov        dword ptr [rsp + 0x64], ebx
028c2 89542478                       mov        dword ptr [rsp + 0x78], edx
028c6 90                             nop        
028c7 90                             nop        
028c8 c5f877                         vzeroupper 
028cb e89042aeff                     call       0x7ff77b6cda60
028d0 0f1f8400c8290026               nop        dword ptr [rax + rax + 0x260029c8]
028d8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
028e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028e6 e8f5631718                     call       0x7ff793d5fbe0
028eb f4                             hlt        
028ec be3dffffff                     mov        esi, 0xffffff3d
028f1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028f6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
028fb 44895c2408                     mov        dword ptr [rsp + 8], r11d
02900 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02905 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0290a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0290f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02914 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02919 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0291e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02923 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02928 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0292d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02932 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02936 89542478                       mov        dword ptr [rsp + 0x78], edx
0293a 90                             nop        
0293b 90                             nop        
0293c c5f877                         vzeroupper 
0293f e81c42aeff                     call       0x7ff77b6cda60
02944 0f1f84003c2a0027               nop        dword ptr [rax + rax + 0x27002a3c]
0294c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02956 4883e4f0                       and        rsp, 0xfffffffffffffff0
0295a e881631718                     call       0x7ff793d5fbe0
0295f f4                             hlt        
02960 bee4ffffff                     mov        esi, 0xffffffe4
02965 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0296a 4c891424                       mov        qword ptr [rsp], r10
0296e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02973 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02978 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0297d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02982 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02987 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0298c 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02990 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02998 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0299d 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
029a5 90                             nop        
029a6 90                             nop        
029a7 90                             nop        
029a8 c5f877                         vzeroupper 
029ab e8b041aeff                     call       0x7ff77b6cda60
029b0 0f1f8400a82a0028               nop        dword ptr [rax + rax + 0x28002aa8]
029b8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
029c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029c6 e815631718                     call       0x7ff793d5fbe0
029cb f4                             hlt        
029cc bee4ffffff                     mov        esi, 0xffffffe4
029d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
029d6 4c891424                       mov        qword ptr [rsp], r10
029da 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029df 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
029e4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
029e9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
029ee 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029f3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
029f8 895c2468                       mov        dword ptr [rsp + 0x68], ebx
029fc 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02a01 90                             nop        
02a02 90                             nop        
02a03 90                             nop        
02a04 c5f877                         vzeroupper 
02a07 e85441aeff                     call       0x7ff77b6cda60
02a0c 0f1f8400042b0029               nop        dword ptr [rax + rax + 0x29002b04]
02a14 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02a1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a22 e8b9621718                     call       0x7ff793d5fbe0
02a27 f4                             hlt        
02a28 beccffffff                     mov        esi, 0xffffffcc
02a2d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02a32 4c891424                       mov        qword ptr [rsp], r10
02a36 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a3b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02a40 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02a45 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02a4a 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
02a4f 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02a54 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02a58 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02a60 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02a65 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02a6d 90                             nop        
02a6e 90                             nop        
02a6f 90                             nop        
02a70 c5f877                         vzeroupper 
02a73 e8e840aeff                     call       0x7ff77b6cda60
02a78 0f1f8400702b002a               nop        dword ptr [rax + rax + 0x2a002b70]
02a80 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02a8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a8e e84d621718                     call       0x7ff793d5fbe0
02a93 f4                             hlt        
02a94 beccffffff                     mov        esi, 0xffffffcc
02a99 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a9e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02aa3 4489542408                     mov        dword ptr [rsp + 8], r10d
02aa8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02aad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ab2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ab7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02abc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02ac1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02ac6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02acb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02ad0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ad5 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02ada 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02ae2 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02ae7 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02aec 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02af3 90                             nop        
02af4 c5f877                         vzeroupper 
02af7 e86440aeff                     call       0x7ff77b6cda60
02afc 0f1f8400f42b002b               nop        dword ptr [rax + rax + 0x2b002bf4]
02b04 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02b0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b12 e8c9611718                     call       0x7ff793d5fbe0
02b17 f4                             hlt        
02b18 be85ffffff                     mov        esi, 0xffffff85
02b1d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02b22 44891424                       mov        dword ptr [rsp], r10d
02b26 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02b2b 44895c2404                     mov        dword ptr [rsp + 4], r11d
02b30 4c896c2408                     mov        qword ptr [rsp + 8], r13
02b35 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02b3a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b3f 90                             nop        
02b40 c5f877                         vzeroupper 
02b43 e81840aeff                     call       0x7ff77b6cda60
02b48 0f1f8400402c002c               nop        dword ptr [rax + rax + 0x2c002c40]
02b50 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5e e87d611718                     call       0x7ff793d5fbe0
02b63 f4                             hlt        
02b64 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
02b6b beccffffff                     mov        esi, 0xffffffcc
02b70 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b75 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02b79 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02b7e 90                             nop        
02b7f 90                             nop        
02b80 c5f877                         vzeroupper 
02b83 e8d83faeff                     call       0x7ff77b6cda60
02b88 0f1f8400802c002d               nop        dword ptr [rax + rax + 0x2d002c80]
02b90 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02b9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b9e e83d611718                     call       0x7ff793d5fbe0
02ba3 f4                             hlt        
02ba4 bee4ffffff                     mov        esi, 0xffffffe4
02ba9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02bae 4c891424                       mov        qword ptr [rsp], r10
02bb2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02bb7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02bbc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02bc1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02bc6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02bcb 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02bd0 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02bd4 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02bdc 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02be1 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02be6 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02bee 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02bf3 90                             nop        
02bf4 c5f877                         vzeroupper 
02bf7 e8643faeff                     call       0x7ff77b6cda60
02bfc 0f1f8400f42c002e               nop        dword ptr [rax + rax + 0x2e002cf4]
02c04 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02c0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c12 e8c9601718                     call       0x7ff793d5fbe0
02c17 f4                             hlt        
02c18 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02c21 bee4ffffff                     mov        esi, 0xffffffe4
02c26 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c2b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02c30 4489542408                     mov        dword ptr [rsp + 8], r10d
02c35 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c3a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c3f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02c44 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02c49 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02c4e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02c53 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02c58 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02c5d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02c62 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02c67 895c2460                       mov        dword ptr [rsp + 0x60], ebx
02c6b 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02c73 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02c78 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02c7d 89442474                       mov        dword ptr [rsp + 0x74], eax
02c81 90                             nop        
02c82 90                             nop        
02c83 90                             nop        
02c84 c5f877                         vzeroupper 
02c87 e8d43eaeff                     call       0x7ff77b6cda60
02c8c 0f1f8400842d002f               nop        dword ptr [rax + rax + 0x2f002d84]
02c94 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02c9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ca2 e839601718                     call       0x7ff793d5fbe0
02ca7 f4                             hlt        
02ca8 beccffffff                     mov        esi, 0xffffffcc
02cad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02cb2 4c891424                       mov        qword ptr [rsp], r10
02cb6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02cbb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02cc0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02cc5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02cca 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ccf 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02cd4 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02cd8 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02ce0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02ce5 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02cea 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02cf2 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02cf7 90                             nop        
02cf8 c5f877                         vzeroupper 
02cfb e8603eaeff                     call       0x7ff77b6cda60
02d00 0f1f8400f82d0030               nop        dword ptr [rax + rax + 0x30002df8]
02d08 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02d12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d16 e8c55f1718                     call       0x7ff793d5fbe0
02d1b f4                             hlt        
02d1c beccffffff                     mov        esi, 0xffffffcc
02d21 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d26 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02d2b 4489542408                     mov        dword ptr [rsp + 8], r10d
02d30 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02d3a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02d3f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d44 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02d49 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02d4e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02d53 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d58 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02d5d 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02d62 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02d6a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02d6f 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
02d74 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02d7c 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
02d81 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02d88 c5f877                         vzeroupper 
02d8b e8d03daeff                     call       0x7ff77b6cda60
02d90 0f1f8400882e0031               nop        dword ptr [rax + rax + 0x31002e88]
02d98 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02da2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02da6 e8355f1718                     call       0x7ff793d5fbe0
02dab f4                             hlt        
02dac c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02db5 beccffffff                     mov        esi, 0xffffffcc
02dba 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02dbf 4c891424                       mov        qword ptr [rsp], r10
02dc3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02dc8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02dcd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02dd2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02dd7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ddc 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02de1 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02de5 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02ded 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02df2 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02df7 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02dfb 90                             nop        
02dfc c5f877                         vzeroupper 
02dff e85c3daeff                     call       0x7ff77b6cda60
02e04 0f1f8400fc2e0032               nop        dword ptr [rax + rax + 0x32002efc]
02e0c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02e16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e1a e8c15e1718                     call       0x7ff793d5fbe0
02e1f f4                             hlt        
02e20 8be8                           mov        ebp, eax
02e22 83c510                         add        ebp, 0x10
02e25 be6effffff                     mov        esi, 0xffffff6e
02e2a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e2f 4c891424                       mov        qword ptr [rsp], r10
02e33 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02e38 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02e3d 89442438                       mov        dword ptr [rsp + 0x38], eax
02e41 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02e46 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e4b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02e50 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02e55 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02e59 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02e5e 90                             nop        
02e5f 90                             nop        
02e60 c5f877                         vzeroupper 
02e63 e8f83caeff                     call       0x7ff77b6cda60
02e68 0f1f8400602f0033               nop        dword ptr [rax + rax + 0x33002f60]
02e70 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e7e e85d5e1718                     call       0x7ff793d5fbe0
02e83 f4                             hlt        
02e84 8be8                           mov        ebp, eax
02e86 83c510                         add        ebp, 0x10
02e89 be66ffffff                     mov        esi, 0xffffff66
02e8e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e93 4c891424                       mov        qword ptr [rsp], r10
02e97 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02e9c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02ea1 89442438                       mov        dword ptr [rsp + 0x38], eax
02ea5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02eaa 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02eaf 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02eb4 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02eb9 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02ebd 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02ec2 90                             nop        
02ec3 90                             nop        
02ec4 c5f877                         vzeroupper 
02ec7 e8943caeff                     call       0x7ff77b6cda60
02ecc 0f1f8400c42f0034               nop        dword ptr [rax + rax + 0x34002fc4]
02ed4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ee2 e8f95d1718                     call       0x7ff793d5fbe0
02ee7 f4                             hlt        
02ee8 bee4ffffff                     mov        esi, 0xffffffe4
02eed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02ef2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02ef7 44895c2408                     mov        dword ptr [rsp + 8], r11d
02efc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02f01 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f06 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02f0b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02f10 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02f15 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02f1a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f1f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f24 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02f29 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02f2e 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02f32 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
02f3a 90                             nop        
02f3b 90                             nop        
02f3c c5f877                         vzeroupper 
02f3f e81c3caeff                     call       0x7ff77b6cda60
02f44 0f1f84003c300035               nop        dword ptr [rax + rax + 0x3500303c]
02f4c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02f56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f5a e8815d1718                     call       0x7ff793d5fbe0
02f5f f4                             hlt        
02f60 bee4ffffff                     mov        esi, 0xffffffe4
02f65 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02f6a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02f6f 4489542408                     mov        dword ptr [rsp + 8], r10d
02f74 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02f79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f7e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02f83 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02f88 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02f8d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02f92 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f97 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f9c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02fa1 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02fa6 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02faa 90                             nop        
02fab 90                             nop        
02fac c5f877                         vzeroupper 
02faf e8ac3baeff                     call       0x7ff77b6cda60
02fb4 0f1f8400ac300036               nop        dword ptr [rax + rax + 0x360030ac]
02fbc 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
02fc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02fca e8115d1718                     call       0x7ff793d5fbe0
02fcf f4                             hlt        
02fd0 beccffffff                     mov        esi, 0xffffffcc
02fd5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02fda 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02fdf 4489542408                     mov        dword ptr [rsp + 8], r10d
02fe4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02fe9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02fee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ff3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02ff8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02ffd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
03002 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
03007 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0300c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03011 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
03016 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0301a 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03022 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0302a 90                             nop        
0302b 90                             nop        
0302c c5f877                         vzeroupper 
0302f e82c3baeff                     call       0x7ff77b6cda60
03034 0f1f84002c310037               nop        dword ptr [rax + rax + 0x3700312c]
0303c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03046 4883e4f0                       and        rsp, 0xfffffffffffffff0
0304a e8915c1718                     call       0x7ff793d5fbe0
0304f f4                             hlt        
03050 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03055 458d5a08                       lea        r11d, [r10 + 8]
03059 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0305e be6effffff                     mov        esi, 0xffffff6e
03063 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03068 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0306d 4489542408                     mov        dword ptr [rsp + 8], r10d
03072 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03077 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0307c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03081 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03086 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0308b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
03090 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03095 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0309a 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
030a2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
030a7 90                             nop        
030a8 c5f877                         vzeroupper 
030ab e8b03aaeff                     call       0x7ff77b6cda60
030b0 0f1f8400a8310038               nop        dword ptr [rax + rax + 0x380031a8]
030b8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
030c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
030c6 e8155c1718                     call       0x7ff793d5fbe0
030cb f4                             hlt        
030cc 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
030d1 458d5a08                       lea        r11d, [r10 + 8]
030d5 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
030da be66ffffff                     mov        esi, 0xffffff66
030df 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
030e4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
030e9 44895c2408                     mov        dword ptr [rsp + 8], r11d
030ee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
030f3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
030f8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
030fd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03102 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03107 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0310c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03111 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03116 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0311b 90                             nop        
0311c c5f877                         vzeroupper 
0311f e83c3aaeff                     call       0x7ff77b6cda60
03124 0f1f84001c320039               nop        dword ptr [rax + rax + 0x3900321c]
0312c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0313a e8a15b1718                     call       0x7ff793d5fbe0
0313f f4                             hlt        
03140 448bc1                         mov        r8d, ecx
03143 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0314b e90fe1ffff                     jmp        0x7ff77bbe815f
03150 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0315a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0315e e87d5b1718                     call       0x7ff793d5fbe0
03163 f4                             hlt        
03164 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0316e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03172 e8695b1718                     call       0x7ff793d5fbe0
03177 f4                             hlt        
03178 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03182 4883e4f0                       and        rsp, 0xfffffffffffffff0
03186 e8555b1718                     call       0x7ff793d5fbe0
0318b f4                             hlt        
0318c 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03196 4883e4f0                       and        rsp, 0xfffffffffffffff0
0319a e8415b1718                     call       0x7ff793d5fbe0
0319f f4                             hlt        
031a0 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
031aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ae e82d5b1718                     call       0x7ff793d5fbe0
031b3 f4                             hlt        
031b4 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
031be 4883e4f0                       and        rsp, 0xfffffffffffffff0
031c2 e8195b1718                     call       0x7ff793d5fbe0
031c7 f4                             hlt        
031c8 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
031d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
031d6 e8055b1718                     call       0x7ff793d5fbe0
031db f4                             hlt        
031dc 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
031e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ea e8f15a1718                     call       0x7ff793d5fbe0
031ef f4                             hlt        
031f0 bee4ffffff                     mov        esi, 0xffffffe4
031f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031fa 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
031ff 4489542408                     mov        dword ptr [rsp + 8], r10d
03204 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03209 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0320e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03213 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03218 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0321d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
03222 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03227 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0322c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03231 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
03236 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0323a 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0323f 90                             nop        
03240 c5f877                         vzeroupper 
03243 e81839aeff                     call       0x7ff77b6cda60
03248 0f1f84004033003a               nop        dword ptr [rax + rax + 0x3a003340]
03250 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0325a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0325e e87d5a1718                     call       0x7ff793d5fbe0
03263 f4                             hlt        
03264 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0326d bee4ffffff                     mov        esi, 0xffffffe4
03272 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03277 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0327c 44895c2408                     mov        dword ptr [rsp + 8], r11d
03281 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03286 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0328b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
03290 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03295 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0329a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0329f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
032a4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
032a9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
032ae 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
032b3 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
032b8 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
032bc c5f877                         vzeroupper 
032bf e89c38aeff                     call       0x7ff77b6cda60
032c4 0f1f8400bc33003b               nop        dword ptr [rax + rax + 0x3b0033bc]
032cc 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
032d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
032da e8015a1718                     call       0x7ff793d5fbe0
032df f4                             hlt        
032e0 beccffffff                     mov        esi, 0xffffffcc
032e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
032ea 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
032ef 44894c2408                     mov        dword ptr [rsp + 8], r9d
032f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
032f9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
032fe 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
03303 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
03308 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0330d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
03312 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03317 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0331c 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
03321 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
03326 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0332a 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0332f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
03334 c5f877                         vzeroupper 
03337 e82438aeff                     call       0x7ff77b6cda60
0333c 0f1f84003434003c               nop        dword ptr [rax + rax + 0x3c003434]
03344 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0334e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03352 e889591718                     call       0x7ff793d5fbe0
03357 f4                             hlt        
03358 4183c510                       add        r13d, 0x10
0335c be6effffff                     mov        esi, 0xffffff6e
03361 4c8b542408                     mov        r10, qword ptr [rsp + 8]
03366 4c891424                       mov        qword ptr [rsp], r10
0336a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0336f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
03374 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03379 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0337e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03383 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03388 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
03390 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03395 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0339a 90                             nop        
0339b 90                             nop        
0339c c5f877                         vzeroupper 
0339f e8bc37aeff                     call       0x7ff77b6cda60
033a4 0f1f84009c34003d               nop        dword ptr [rax + rax + 0x3d00349c]
033ac 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
033b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
033ba e821591718                     call       0x7ff793d5fbe0
033bf f4                             hlt        
033c0 4183c510                       add        r13d, 0x10
033c4 be66ffffff                     mov        esi, 0xffffff66
033c9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
033ce 4c891424                       mov        qword ptr [rsp], r10
033d2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
033d7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
033dc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
033e1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
033e6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
033eb 4489542464                     mov        dword ptr [rsp + 0x64], r10d
033f0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
033f5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
033fa 90                             nop        
033fb 90                             nop        
033fc c5f877                         vzeroupper 
033ff e85c37aeff                     call       0x7ff77b6cda60
03404 0f1f8400fc34003e               nop        dword ptr [rax + rax + 0x3e0034fc]
0340c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03416 4883e4f0                       and        rsp, 0xfffffffffffffff0
0341a e8c1581718                     call       0x7ff793d5fbe0
0341f f4                             hlt        
03420 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
03428 e91ee1ffff                     jmp        0x7ff77bbe844b
0342d 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03437 4883e4f0                       and        rsp, 0xfffffffffffffff0
0343b e8a0581718                     call       0x7ff793d5fbe0
03440 f4                             hlt        
03441 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0344b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0344f e88c581718                     call       0x7ff793d5fbe0
03454 f4                             hlt        
03455 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0345f 4883e4f0                       and        rsp, 0xfffffffffffffff0
03463 e878581718                     call       0x7ff793d5fbe0
03468 f4                             hlt        
03469 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03473 4883e4f0                       and        rsp, 0xfffffffffffffff0
03477 e864581718                     call       0x7ff793d5fbe0
0347c f4                             hlt        
0347d 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03487 4883e4f0                       and        rsp, 0xfffffffffffffff0
0348b e850581718                     call       0x7ff793d5fbe0
03490 f4                             hlt        
03491 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0349b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0349f e83c581718                     call       0x7ff793d5fbe0
034a4 f4                             hlt        
034a5 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
034ad e975edffff                     jmp        0x7ff77bbe9127
034b2 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
034bc 4883e4f0                       and        rsp, 0xfffffffffffffff0
034c0 e81b581718                     call       0x7ff793d5fbe0
034c5 f4                             hlt        
034c6 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
034d0 4883e4f0                       and        rsp, 0xfffffffffffffff0
034d4 e807581718                     call       0x7ff793d5fbe0
034d9 f4                             hlt        
034da 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
034e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
034e8 e8f3571718                     call       0x7ff793d5fbe0
034ed f4                             hlt        
034ee 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
034f8 4883e4f0                       and        rsp, 0xfffffffffffffff0
034fc e8df571718                     call       0x7ff793d5fbe0
03501 f4                             hlt        
03502 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
0350c 4883e4f0                       and        rsp, 0xfffffffffffffff0
03510 e8cb571718                     call       0x7ff793d5fbe0
03515 f4                             hlt        
03516 48bf806c5e54f77f0000           movabs     rdi, 0x7ff7545e6c80
03520 4883e4f0                       and        rsp, 0xfffffffffffffff0
03524 e8b7571718                     call       0x7ff793d5fbe0
03529 f4                             hlt        
0352a bef6ffffff                     mov        esi, 0xfffffff6
0352f 90                             nop        
03530 c5f877                         vzeroupper 
03533 e82836aeff                     call       0x7ff77b6cda60
03538 0f1f84003036003f               nop        dword ptr [rax + rax + 0x3f003630]
03540 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0354a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0354e e88d571718                     call       0x7ff793d5fbe0
03553 f4                             hlt        
03554 bef6ffffff                     mov        esi, 0xfffffff6
03559 90                             nop        
0355a 90                             nop        
0355b 90                             nop        
0355c c5f877                         vzeroupper 
0355f e8fc35aeff                     call       0x7ff77b6cda60
03564 0f1f84005c360040               nop        dword ptr [rax + rax + 0x4000365c]
0356c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03576 4883e4f0                       and        rsp, 0xfffffffffffffff0
0357a e861571718                     call       0x7ff793d5fbe0
0357f f4                             hlt        
03580 bef6ffffff                     mov        esi, 0xfffffff6
03585 90                             nop        
03586 90                             nop        
03587 90                             nop        
03588 c5f877                         vzeroupper 
0358b e8d035aeff                     call       0x7ff77b6cda60
03590 0f1f840088360041               nop        dword ptr [rax + rax + 0x41003688]
03598 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
035a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
035a6 e835571718                     call       0x7ff793d5fbe0
035ab f4                             hlt        
035ac bef6ffffff                     mov        esi, 0xfffffff6
035b1 90                             nop        
035b2 90                             nop        
035b3 90                             nop        
035b4 c5f877                         vzeroupper 
035b7 e8a435aeff                     call       0x7ff77b6cda60
035bc 0f1f8400b4360042               nop        dword ptr [rax + rax + 0x420036b4]
035c4 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
035ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
035d2 e809571718                     call       0x7ff793d5fbe0
035d7 f4                             hlt        
035d8 bef6ffffff                     mov        esi, 0xfffffff6
035dd 8bea                           mov        ebp, edx
035df 90                             nop        
035e0 c5f877                         vzeroupper 
035e3 e87835aeff                     call       0x7ff77b6cda60
035e8 0f1f8400e0360043               nop        dword ptr [rax + rax + 0x430036e0]
035f0 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
035fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
035fe e8dd561718                     call       0x7ff793d5fbe0
03603 f4                             hlt        
03604 bef6ffffff                     mov        esi, 0xfffffff6
03609 90                             nop        
0360a 90                             nop        
0360b 90                             nop        
0360c c5f877                         vzeroupper 
0360f e84c35aeff                     call       0x7ff77b6cda60
03614 0f1f84000c370044               nop        dword ptr [rax + rax + 0x4400370c]
0361c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03626 4883e4f0                       and        rsp, 0xfffffffffffffff0
0362a e8b1561718                     call       0x7ff793d5fbe0
0362f f4                             hlt        
03630 bef6ffffff                     mov        esi, 0xfffffff6
03635 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0363a 90                             nop        
0363b 90                             nop        
0363c c5f877                         vzeroupper 
0363f e81c35aeff                     call       0x7ff77b6cda60
03644 0f1f84003c370045               nop        dword ptr [rax + rax + 0x4500373c]
0364c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03656 4883e4f0                       and        rsp, 0xfffffffffffffff0
0365a e881561718                     call       0x7ff793d5fbe0
0365f f4                             hlt        
03660 bef6ffffff                     mov        esi, 0xfffffff6
03665 44894c2408                     mov        dword ptr [rsp + 8], r9d
0366a 90                             nop        
0366b 90                             nop        
0366c c5f877                         vzeroupper 
0366f e8ec34aeff                     call       0x7ff77b6cda60
03674 0f1f84006c370046               nop        dword ptr [rax + rax + 0x4600376c]
0367c 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
03686 4883e4f0                       and        rsp, 0xfffffffffffffff0
0368a e851561718                     call       0x7ff793d5fbe0
0368f f4                             hlt        
03690 bef6ffffff                     mov        esi, 0xfffffff6
03695 90                             nop        
03696 90                             nop        
03697 90                             nop        
03698 c5f877                         vzeroupper 
0369b e8c034aeff                     call       0x7ff77b6cda60
036a0 0f1f840098370047               nop        dword ptr [rax + rax + 0x47003798]
036a8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
036b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
036b6 e825561718                     call       0x7ff793d5fbe0
036bb f4                             hlt        
036bc bef6ffffff                     mov        esi, 0xfffffff6
036c1 895c240c                       mov        dword ptr [rsp + 0xc], ebx
036c5 90                             nop        
036c6 90                             nop        
036c7 90                             nop        
036c8 c5f877                         vzeroupper 
036cb e89034aeff                     call       0x7ff77b6cda60
036d0 0f1f8400c8370048               nop        dword ptr [rax + rax + 0x480037c8]
036d8 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
036e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
036e6 e8f5551718                     call       0x7ff793d5fbe0
036eb f4                             hlt        
036ec bef6ffffff                     mov        esi, 0xfffffff6
036f1 90                             nop        
036f2 90                             nop        
036f3 90                             nop        
036f4 c5f877                         vzeroupper 
036f7 e86434aeff                     call       0x7ff77b6cda60
036fc 0f1f8400f4370049               nop        dword ptr [rax + rax + 0x490037f4]
03704 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0370e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03712 e8c9551718                     call       0x7ff793d5fbe0
03717 f4                             hlt        
03718 bef6ffffff                     mov        esi, 0xfffffff6
0371d 895c2408                       mov        dword ptr [rsp + 8], ebx
03721 90                             nop        
03722 90                             nop        
03723 90                             nop        
03724 c5f877                         vzeroupper 
03727 e83434aeff                     call       0x7ff77b6cda60
0372c 0f1f84002438004a               nop        dword ptr [rax + rax + 0x4a003824]
03734 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0373e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03742 e899551718                     call       0x7ff793d5fbe0
03747 f4                             hlt        
03748 bef6ffffff                     mov        esi, 0xfffffff6
0374d 90                             nop        
0374e 90                             nop        
0374f 90                             nop        
03750 c5f877                         vzeroupper 
03753 e80834aeff                     call       0x7ff77b6cda60
03758 0f1f84005038004b               nop        dword ptr [rax + rax + 0x4b003850]
03760 48bf80177654f77f0000           movabs     rdi, 0x7ff754761780
0376a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0376e e86d551718                     call       0x7ff793d5fbe0
03773 f4                             hlt        
03774 49babc7dbe7bf77f0000           movabs     r10, 0x7ff77bbe7dbc
0377e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03785 e9d67cb4ff                     jmp        0x7ff77b732360
0378a e8514bb3ff                     call       0x7ff77b71f1e0
0378f e99ac8ffff                     jmp        0x7ff77bbe6f2e
03794 f4                             hlt        
03795 f4                             hlt        
03796 f4                             hlt        
03797 f4                             hlt        
