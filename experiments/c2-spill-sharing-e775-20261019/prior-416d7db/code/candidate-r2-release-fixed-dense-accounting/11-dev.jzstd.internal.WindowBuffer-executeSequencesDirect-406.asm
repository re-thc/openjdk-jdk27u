00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85402aa9ff                   jne        0x7fa87b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85da270000                   jne        0x7fa87be7f718
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8be8                         mov        r13, r8
00049 8bcf                           mov        ecx, edi
0004b 488bee                         mov        rbp, rsi
0004e 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00052 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
00056 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0005b 452bda                         sub        r11d, r10d
0005e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00066 453bcb                         cmp        r9d, r11d
00069 0f8f3d1b0000                   jg         0x7fa87be7eaac
0006f 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00073 488b5e20                       mov        rbx, qword ptr [rsi + 0x20]
00077 4c638c24f0000000               movsxd     r9, dword ptr [rsp + 0xf0]
0007f 4d63c2                         movsxd     r8, r10d
00082 4d03c3                         add        r8, r11
00085 492bd8                         sub        rbx, r8
00088 4c3bcb                         cmp        r9, rbx
0008b 0f8f1b1b0000                   jg         0x7fa87be7eaac
00091 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
00095 488b4628                       mov        rax, qword ptr [rsi + 0x28]
00099 4885c0                         test       rax, rax
0009c 0f845a120000                   je         0x7fa87be7e1fc
000a2 33db                           xor        ebx, ebx
000a4 4c8bc2                         mov        r8, rdx
000a7 8b7208                         mov        esi, dword ptr [rdx + 8]
000aa 8b7d44                         mov        edi, dword ptr [rbp + 0x44]
000ad 448bc9                         mov        r9d, ecx
000b0 4585c9                         test       r9d, r9d
000b3 0f8e33180000                   jle        0x7fa87be7e7ec
000b9 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
000c1 492bc3                         sub        rax, r11
000c4 8d4ee0                         lea        ecx, [rsi - 0x20]
000c7 8b542454                       mov        edx, dword ptr [rsp + 0x54]
000cb 83c2e0                         add        edx, -0x20
000ce 458b5508                       mov        r10d, dword ptr [r13 + 8]
000d2 4585d2                         test       r10d, r10d
000d5 0f86f51a0000                   jbe        0x7fa87be7ead0
000db 89542430                       mov        dword ptr [rsp + 0x30], edx
000df 894c2438                       mov        dword ptr [rsp + 0x38], ecx
000e3 897c2448                       mov        dword ptr [rsp + 0x48], edi
000e7 89742404                       mov        dword ptr [rsp + 4], esi
000eb 4889442470                     mov        qword ptr [rsp + 0x70], rax
000f0 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f5 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
000fa 4c896c2408                     mov        qword ptr [rsp + 8], r13
000ff 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00104 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00109 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
0010e 4d63d2                         movsxd     r10, r10d
00111 4d63d9                         movsxd     r11, r9d
00114 49ffcb                         dec        r11
00117 4d3bda                         cmp        r11, r10
0011a 0f83a41a0000                   jae        0x7fa87be7eac4
00120 85db                           test       ebx, ebx
00122 0f84a31a0000                   je         0x7fa87be7eacb
00128 4c8b9424f8000000               mov        r10, qword ptr [rsp + 0xf8]
00130 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00134 4585db                         test       r11d, r11d
00137 0f86e01a0000                   jbe        0x7fa87be7eb1d
0013d 4183fb01                       cmp        r11d, 1
00141 0f86d61a0000                   jbe        0x7fa87be7eb1d
00147 4183fb02                       cmp        r11d, 2
0014b 0f86cc1a0000                   jbe        0x7fa87be7eb1d
00151 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
00159 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00160 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00165 448b5708                       mov        r10d, dword ptr [rdi + 8]
00169 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
00171 448d5ef1                       lea        r11d, [rsi - 0xf]
00175 4585db                         test       r11d, r11d
00178 0f8cea1a0000                   jl         0x7fa87be7eb68
0017e 4183c2f1                       add        r10d, -0xf
00182 4585d2                         test       r10d, r10d
00185 0f8ce41a0000                   jl         0x7fa87be7eb6f
0018b 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
00193 4183c3f9                       add        r11d, -7
00197 4585db                         test       r11d, r11d
0019a 0f8cd61a0000                   jl         0x7fa87be7eb76
001a0 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
001a8 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
001ad 4c8bd7                         mov        r10, rdi
001b0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001b5 4d63d3                         movsxd     r10, r11d
001b8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001c0 4183c3f1                       add        r11d, -0xf
001c4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001c9 4983c2f1                       add        r10, -0xf
001cd 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
001d5 448bd6                         mov        r10d, esi
001d8 458d42f1                       lea        r8d, [r10 - 0xf]
001dc 4489442450                     mov        dword ptr [rsp + 0x50], r8d
001e1 4d63d2                         movsxd     r10, r10d
001e4 4983c2f1                       add        r10, -0xf
001e8 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001f0 4533c0                         xor        r8d, r8d
001f3 33db                           xor        ebx, ebx
001f5 e9ee010000                     jmp        0x7fa87be7d2e8
001fa 4533ed                         xor        r13d, r13d
001fd 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00205 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0020a 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
0020e 83f803                         cmp        eax, 3
00211 0f8e61030000                   jle        0x7fa87be7d478
00217 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0021c 45895314                       mov        dword ptr [r11 + 0x14], r10d
00220 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00224 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00229 45895a10                       mov        dword ptr [r10 + 0x10], r11d
0022d 448d50fd                       lea        r10d, [rax - 3]
00231 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00239 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0023e 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00246 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0024a 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00252 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
0025a 4c639c24a8000000               movsxd     r11, dword ptr [rsp + 0xa8]
00262 4c035c2428                     add        r11, qword ptr [rsp + 0x28]
00267 4c63842484000000               movsxd     r8, dword ptr [rsp + 0x84]
0026f 498bc8                         mov        rcx, r8
00272 4d03d8                         add        r11, r8
00275 4d3bd3                         cmp        r10, r11
00278 0f8fc2140000                   jg         0x7fa87be7e640
0027e 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00286 4585d2                         test       r10d, r10d
00289 0f8efd130000                   jle        0x7fa87be7e58c
0028f 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00297 4403ac2484000000               add        r13d, dword ptr [rsp + 0x84]
0029f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
002a4 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
002ac 4b8d74030c                     lea        rsi, [r11 + r8 + 0xc]
002b1 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
002b6 4503cd                         add        r9d, r13d
002b9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
002be 498d7c1a0c                     lea        rdi, [r10 + rbx + 0xc]
002c3 448bd3                         mov        r10d, ebx
002c6 4403942484000000               add        r10d, dword ptr [rsp + 0x84]
002ce 4489542434                     mov        dword ptr [rsp + 0x34], r10d
002d3 48636c243c                     movsxd     rbp, dword ptr [rsp + 0x3c]
002d8 443b4c2430                     cmp        r9d, dword ptr [rsp + 0x30]
002dd 0f8f160c0000                   jg         0x7fa87be7ddf9
002e3 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
002e8 0f8fee140000                   jg         0x7fa87be7e6dc
002ee 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
002f6 4183fe10                       cmp        r14d, 0x10
002fa 0f8f68010000                   jg         0x7fa87be7d368
00300 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00304 0f8366120000                   jae        0x7fa87be7e470
0030a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0030f c4c17a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 0xc]
00316 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
0031b 0f83db120000                   jae        0x7fa87be7e4fc
00321 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00329 4403d3                         add        r10d, ebx
0032c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00331 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00338 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
0033f 4103d8                         add        ebx, r8d
00342 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
00349 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00351 442b9424a0000000               sub        r10d, dword ptr [rsp + 0xa0]
00359 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00361 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00366 4183fb10                       cmp        r11d, 0x10
0036a 0f8fec140000                   jg         0x7fa87be7e75c
00370 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00378 4183fa10                       cmp        r10d, 0x10
0037c 0f8c66030000                   jl         0x7fa87be7d5e8
00382 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0038a 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0038f 0f83a4100000                   jae        0x7fa87be7e339
00395 458bd3                         mov        r10d, r11d
00398 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0039d c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
003a4 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003ac 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
003b1 0f831d110000                   jae        0x7fa87be7e3d4
003b7 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
003be 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
003c3 4503da                         add        r11d, r10d
003c6 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
003ce 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
003d6 41ffc0                         inc        r8d
003d9 443b442420                     cmp        r8d, dword ptr [rsp + 0x20]
003de 0f8d760d0000                   jge        0x7fa87be7e05a
003e4 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
003e8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003ed 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
003f2 4d8bd3                         mov        r10, r11
003f5 49c1ea12                       shr        r10, 0x12
003f9 458bd2                         mov        r10d, r10d
003fc 4181e2ffff0300                 and        r10d, 0x3ffff
00403 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00408 458beb                         mov        r13d, r11d
0040b 49c1fb24                       sar        r11, 0x24
0040f 4181e5ffff0100                 and        r13d, 0x1ffff
00416 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
0041e 458bd3                         mov        r10d, r11d
00421 418bc2                         mov        eax, r10d
00424 4585d2                         test       r10d, r10d
00427 0f8c7f120000                   jl         0x7fa87be7e5ac
0042d 4585ed                         test       r13d, r13d
00430 0f84c4fdffff                   je         0x7fa87be7d0fa
00436 448b1c24                       mov        r11d, dword ptr [rsp]
0043a 442bdb                         sub        r11d, ebx
0043d 453beb                         cmp        r13d, r11d
00440 0f8ebffdffff                   jle        0x7fa87be7d105
00446 be45ffffff                     mov        esi, 0xffffff45
0044b 418bed                         mov        ebp, r13d
0044e 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00456 6690                           nop        
00458 c5f877                         vzeroupper 
0045b e800aab5ff                     call       0x7fa87b9d7d60
00460 0f1f840058050000               nop        dword ptr [rax + rax + 0x558]
00468 4183fe30                       cmp        r14d, 0x30
0046c 0f8f74080000                   jg         0x7fa87be7dbe6
00472 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00476 0f8391140000                   jae        0x7fa87be7e80d
0047c 4863cb                         movsxd     rcx, ebx
0047f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00484 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
0048b 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00490 0f8302150000                   jae        0x7fa87be7e898
00496 458d5010                       lea        r10d, [r8 + 0x10]
0049a 458bca                         mov        r9d, r10d
0049d 4d63d0                         movsxd     r10, r8d
004a0 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
004a7 453bcd                         cmp        r9d, r13d
004aa 0f8dab000000                   jge        0x7fa87be7d45b
004b0 492bca                         sub        rcx, r10
004b3 4d63d9                         movsxd     r11, r9d
004b6 4d8d140b                       lea        r10, [r11 + rcx]
004ba 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
004c2 0f837c150000                   jae        0x7fa87be7e944
004c8 4d63d5                         movsxd     r10, r13d
004cb 4d2bd3                         sub        r10, r11
004ce 4983c20f                       add        r10, 0xf
004d2 4983e2f0                       and        r10, 0xfffffffffffffff0
004d6 458bd2                         mov        r10d, r10d
004d9 478d5c0210                     lea        r11d, [r10 + r8 + 0x10]
004de 4d63d3                         movsxd     r10, r11d
004e1 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
004e6 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
004ee 0f8350150000                   jae        0x7fa87be7e944
004f4 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
004f9 0f8345150000                   jae        0x7fa87be7e944
004ff 4983c2f0                       add        r10, -0x10
00503 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
0050b 0f8333150000                   jae        0x7fa87be7e944
00511 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00518 0f8fda150000                   jg         0x7fa87be7e9f8
0051e 448bd3                         mov        r10d, ebx
00521 452bd0                         sub        r10d, r8d
00524 660f1f440000                   nop        word ptr [rax + rax]
0052a 660f1f440000                   nop        word ptr [rax + rax]
00530 478d1c0a                       lea        r11d, [r10 + r9]
00534 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00539 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00540 458bc1                         mov        r8d, r9d
00543 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00548 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
0054f 458d5910                       lea        r11d, [r9 + 0x10]
00553 458bcb                         mov        r9d, r11d
00556 453bdd                         cmp        r11d, r13d
00559 7cd5                           jl         0x7fa87be7d430
0055b 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00563 4403f3                         add        r14d, ebx
00566 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0056b 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00573 e9d1fdffff                     jmp        0x7fa87be7d249
00578 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00580 4585ed                         test       r13d, r13d
00583 7407                           je         0x7fa87be7d48c
00585 448d58ff                       lea        r11d, [rax - 1]
00589 418bc3                         mov        eax, r11d
0058c 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00591 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00595 85c0                           test       eax, eax
00597 0f84ac080000                   je         0x7fa87be7dd49
0059d 83f803                         cmp        eax, 3
005a0 0f84710c0000                   je         0x7fa87be7e117
005a6 83f802                         cmp        eax, 2
005a9 0f8787000000                   ja         0x7fa87be7d536
005af 3b8424f8000000                 cmp        eax, dword ptr [rsp + 0xf8]
005b6 0f83c1160000                   jae        0x7fa87be7eb7d
005bc 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
005c1 458b4c830c                     mov        r9d, dword ptr [r11 + rax*4 + 0xc]
005c6 85c0                           test       eax, eax
005c8 7e4e                           jle        0x7fa87be7d518
005ca 448d50ff                       lea        r10d, [rax - 1]
005ce 443b9424f8000000               cmp        r10d, dword ptr [rsp + 0xf8]
005d6 0f83bc190000                   jae        0x7fa87be7ee98
005dc 4863f8                         movsxd     rdi, eax
005df 458bdb                         mov        r11d, r11d
005e2 4183c3d0                       add        r11d, -0x30
005e6 41c1eb02                       shr        r11d, 2
005ea 458d5403ff                     lea        r10d, [r11 + rax - 1]
005ef b904000000                     mov        ecx, 4
005f4 c442f0f5d2                     bzhi       r10, r10, rcx
005f9 492bfa                         sub        rdi, r10
005fc 48ffcf                         dec        rdi
005ff 4533d2                         xor        r10d, r10d
00602 4885ff                         test       rdi, rdi
00605 490f4cfa                       cmovl      rdi, r10
00609 8bcf                           mov        ecx, edi
0060b 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00613 e937070000                     jmp        0x7fa87be7dc4f
00618 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00620 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00625 45894a0c                       mov        dword ptr [r10 + 0xc], r9d
00629 44898c24a0000000               mov        dword ptr [rsp + 0xa0], r9d
00631 e91cfcffff                     jmp        0x7fa87be7d152
00636 48be68387ce200000000           movabs     rsi, 0xe27c3868
00640 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00645 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0064d 448b1c24                       mov        r11d, dword ptr [rsp]
00651 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
00659 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0065e 4c891424                       mov        qword ptr [rsp], r10
00662 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00667 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0066f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00674 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00679 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0067d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00682 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00687 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0068c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00691 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00696 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0069b 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006a0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
006a5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
006aa 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
006af 4489542448                     mov        dword ptr [rsp + 0x48], r10d
006b4 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
006b9 666690                         nop        
006bc c5f877                         vzeroupper 
006bf e89c32a9ff                     call       0x7fa87b910860
006c4 0f1f8400bc070001               nop        dword ptr [rax + rax + 0x10007bc]
006cc 4885c0                         test       rax, rax
006cf 0f8447160000                   je         0x7fa87be7ec1c
006d5 488bf0                         mov        rsi, rax
006d8 c5f877                         vzeroupper 
006db 4881c4e0000000                 add        rsp, 0xe0
006e2 5d                             pop        rbp
006e3 e978d0b5ff                     jmp        0x7fa87b9da660
006e8 458bd3                         mov        r10d, r11d
006eb 4403942484000000               add        r10d, dword ptr [rsp + 0x84]
006f3 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
006fb 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00703 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00708 0f8df2020000                   jge        0x7fa87be7d900
0070e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00716 4183c208                       add        r10d, 8
0071a 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00722 4183fb08                       cmp        r11d, 8
00726 0f8da1010000                   jge        0x7fa87be7d7cd
0072c 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00734 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
0073c 0f83321b0000                   jae        0x7fa87be7f174
00742 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00747 430fbe6c100c                   movsx      ebp, byte ptr [r8 + r10 + 0xc]
0074d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00755 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
0075d 0f83b11b0000                   jae        0x7fa87be7f214
00763 43886c100c                     mov        byte ptr [r8 + r10 + 0xc], bpl
00768 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00770 4183c203                       add        r10d, 3
00774 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
0077c 41ffc1                         inc        r9d
0077f 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
00787 0f83131c0000                   jae        0x7fa87be7f2a0
0078d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00795 4183c203                       add        r10d, 3
00799 4c639c24a4000000               movsxd     r11, dword ptr [rsp + 0xa4]
007a1 430fbe6c180d                   movsx      ebp, byte ptr [r8 + r11 + 0xd]
007a7 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
007af 0f838f1c0000                   jae        0x7fa87be7f344
007b5 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
007bd 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
007c2 470fbe4c180e                   movsx      r9d, byte ptr [r8 + r11 + 0xe]
007c8 47884c100e                     mov        byte ptr [r8 + r10 + 0xe], r9b
007cd 470fbe5c180f                   movsx      r11d, byte ptr [r8 + r11 + 0xf]
007d3 47885c100f                     mov        byte ptr [r8 + r10 + 0xf], r11b
007d8 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
007e0 4183fb08                       cmp        r11d, 8
007e4 0f83ea1c0000                   jae        0x7fa87be7f3d4
007ea 49bad08c79e200000000           movabs     r10, 0xe2798cd0
007f4 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
007fc 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
00801 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
00809 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0080e 4183fa04                       cmp        r10d, 4
00812 7e40                           jle        0x7fa87be7d754
00814 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
0081b 83c504                         add        ebp, 4
0081e 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00823 418bd1                         mov        edx, r9d
00826 6690                           nop        
00828 c5f877                         vzeroupper 
0082b e83031a9ff                     call       0x7fa87b910860
00830 0f1f840028090002               nop        dword ptr [rax + rax + 0x2000928]
00838 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
0083d 8bd5                           mov        edx, ebp
0083f 8bc8                           mov        ecx, eax
00841 488bee                         mov        rbp, rsi
00844 c5f877                         vzeroupper 
00847 e81431a9ff                     call       0x7fa87b910860
0084c 0f1f840044090003               nop        dword ptr [rax + rax + 0x3000944]
00854 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00859 4183fa08                       cmp        r10d, 8
0085d 0f8e6bfbffff                   jle        0x7fa87be7d2ce
00863 49ba008d79e200000000           movabs     r10, 0xe2798d00
0086d 8b9424f0000000                 mov        edx, dword ptr [rsp + 0xf0]
00874 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0087c 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00881 83c208                         add        edx, 8
00884 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00889 488bee                         mov        rbp, rsi
0088c c5f877                         vzeroupper 
0088f e8cc30a9ff                     call       0x7fa87b910860
00894 0f1f84008c090004               nop        dword ptr [rax + rax + 0x400098c]
0089c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008a1 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
008a9 488bf5                         mov        rsi, rbp
008ac 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
008b3 488bc8                         mov        rcx, rax
008b6 6690                           nop        
008b8 c5f877                         vzeroupper 
008bb e8a030a9ff                     call       0x7fa87b910860
008c0 0f1f8400b8090005               nop        dword ptr [rax + rax + 0x50009b8]
008c8 e901fbffff                     jmp        0x7fa87be7d2ce
008cd 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
008d2 8b9424a4000000                 mov        edx, dword ptr [rsp + 0xa4]
008d9 666690                         nop        
008dc c5f877                         vzeroupper 
008df e87c30a9ff                     call       0x7fa87b910860
008e4 0f1f8400dc090006               nop        dword ptr [rax + rax + 0x60009dc]
008ec 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008f4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
008fc 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00901 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00908 488bc8                         mov        rcx, rax
0090b 90                             nop        
0090c c5f877                         vzeroupper 
0090f e84c30a9ff                     call       0x7fa87b910860
00914 0f1f84000c0a0007               nop        dword ptr [rax + rax + 0x7000a0c]
0091c 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00924 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
0092c 0f8d9cfaffff                   jge        0x7fa87be7d2ce
00932 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0093a 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00941 0f8e21050000                   jle        0x7fa87be7dd68
00947 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0094f 4183c208                       add        r10d, 8
00953 be66ffffff                     mov        esi, 0xffffff66
00958 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0095d 448b1c24                       mov        r11d, dword ptr [rsp]
00961 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00969 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0096e 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
00976 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0097b 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00983 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00988 44895c2408                     mov        dword ptr [rsp + 8], r11d
0098d 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00992 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00997 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0099c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
009a1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
009a6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
009ab 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
009b0 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
009b5 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
009bd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
009c2 458bd0                         mov        r10d, r8d
009c5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
009ca 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009cf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009d4 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
009d9 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
009de 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
009e6 458bd3                         mov        r10d, r11d
009e9 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
009ee 6690                           nop        
009f0 c5f877                         vzeroupper 
009f3 e868a4b5ff                     call       0x7fa87b9d7d60
009f8 0f1f8400f00a0008               nop        dword ptr [rax + rax + 0x8000af0]
00a00 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00a05 4183fa30                       cmp        r10d, 0x30
00a09 0f8f17020000                   jg         0x7fa87be7db26
00a0f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a14 4183c3f9                       add        r11d, -7
00a18 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00a20 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00a28 453bd3                         cmp        r10d, r11d
00a2b 0f837b130000                   jae        0x7fa87be7ecac
00a31 458bda                         mov        r11d, r10d
00a34 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00a3c 4d63d3                         movsxd     r10, r11d
00a3f 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
00a47 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00a4c 4c8b9c24f0000000               mov        r11, qword ptr [rsp + 0xf0]
00a54 4f8b441a0c                     mov        r8, qword ptr [r10 + r11 + 0xc]
00a59 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a61 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
00a69 0f83e5130000                   jae        0x7fa87be7ed54
00a6f 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00a77 4d63d3                         movsxd     r10, r11d
00a7a 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00a82 498d4a0c                       lea        rcx, [r10 + 0xc]
00a86 48be00b722e200000000           movabs     rsi, 0xe222b700
00a90 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00a95 4533c9                         xor        r9d, r9d
00a98 c5f877                         vzeroupper 
00a9b e8c024a9ff                     call       0x7fa87b90fe60
00aa0 0f1f8400980b0009               nop        dword ptr [rax + rax + 0x9000b98]
00aa8 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00ab0 4183c308                       add        r11d, 8
00ab4 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00abc 418bcb                         mov        ecx, r11d
00abf 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00ac7 0f8d3f010000                   jge        0x7fa87be7db0c
00acd 4c8b8c24f0000000               mov        r9, qword ptr [rsp + 0xf0]
00ad5 4c2b8c24b0000000               sub        r9, qword ptr [rsp + 0xb0]
00add 4d63d3                         movsxd     r10, r11d
00ae0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00ae8 4983c3f9                       add        r11, -7
00aec 4f8d040a                       lea        r8, [r10 + r9]
00af0 4d3bc3                         cmp        r8, r11
00af3 0f833f150000                   jae        0x7fa87be7ef38
00af9 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00b01 4d2bc2                         sub        r8, r10
00b04 4983c007                       add        r8, 7
00b08 4983e0f8                       and        r8, 0xfffffffffffffff8
00b0c 458bc0                         mov        r8d, r8d
00b0f 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00b17 478d541008                     lea        r10d, [r8 + r10 + 8]
00b1c 4d63d2                         movsxd     r10, r10d
00b1f 4f8d440af8                     lea        r8, [r10 + r9 - 8]
00b24 4d3bc3                         cmp        r8, r11
00b27 0f830b150000                   jae        0x7fa87be7ef38
00b2d 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
00b34 0f83fe140000                   jae        0x7fa87be7ef38
00b3a 4983c2f8                       add        r10, -8
00b3e 4d3bd3                         cmp        r10, r11
00b41 0f83f1140000                   jae        0x7fa87be7ef38
00b47 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00b4f 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00b56 0f8fa4150000                   jg         0x7fa87be7f000
00b5c 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00b64 442b9424ac000000               sub        r10d, dword ptr [rsp + 0xac]
00b6c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00b74 660f1f440000                   nop        word ptr [rax + rax]
00b7a 660f1f440000                   nop        word ptr [rax + rax]
00b80 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00b88 4963ca                         movsxd     rcx, r10d
00b8b 4883c10c                       add        rcx, 0xc
00b8f 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00b96 03ac24b8000000                 add        ebp, dword ptr [rsp + 0xb8]
00b9d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ba2 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00ba7 48be00b722e200000000           movabs     rsi, 0xe222b700
00bb1 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00bb6 4533c9                         xor        r9d, r9d
00bb9 666690                         nop        
00bbc c5f877                         vzeroupper 
00bbf e89c23a9ff                     call       0x7fa87b90fe60
00bc4 0f1f8400bc0c000a               nop        dword ptr [rax + rax + 0xa000cbc]
00bcc 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00bd4 4183c308                       add        r11d, 8
00bd8 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00be0 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00be8 7c96                           jl         0x7fa87be7da80
00bea eb20                           jmp        0x7fa87be7db0c
00bec 4d63d3                         movsxd     r10, r11d
00bef 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bf6 c442a8f5db                     bzhi       r11, r11, r10
00bfb c4c1fb92fb                     kmovq      k7, r11
00c00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c0c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00c14 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
00c19 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00c21 e9a8f7ffff                     jmp        0x7fa87be7d2ce
00c26 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00c2e 4585c0                         test       r8d, r8d
00c31 0f8cd1120000                   jl         0x7fa87be7ee08
00c37 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00c3f 4585d2                         test       r10d, r10d
00c42 0f8cc0120000                   jl         0x7fa87be7ee08
00c48 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c4d 4503d8                         add        r11d, r8d
00c50 448b8c24fc000000               mov        r9d, dword ptr [rsp + 0xfc]
00c58 453bcb                         cmp        r9d, r11d
00c5b 0f82a7120000                   jb         0x7fa87be7ee08
00c61 458bd1                         mov        r10d, r9d
00c64 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00c6c 0f8296120000                   jb         0x7fa87be7ee08
00c72 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c77 4585db                         test       r11d, r11d
00c7a 7490                           je         0x7fa87be7db0c
00c7c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00c81 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00c89 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00c8e 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00c93 4883fd20                       cmp        rbp, 0x20
00c97 0f864fffffff                   jbe        0x7fa87be7daec
00c9d 488bd5                         mov        rdx, rbp
00ca0 c5f877                         vzeroupper 
00ca3 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00cad 41ffd2                         call       r10
00cb0 0f1f840000000000               nop        dword ptr [rax + rax]
00cb8 e94fffffff                     jmp        0x7fa87be7db0c
00cbd 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
00cc4 4c63d3                         movsxd     r10, ebx
00cc7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cce c442a8f5db                     bzhi       r11, r11, r10
00cd3 c4c1fb92fb                     kmovq      k7, r11
00cd8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cde 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ce4 eb58                           jmp        0x7fa87be7dc3e
00ce6 85db                           test       ebx, ebx
00ce8 0f8c46100000                   jl         0x7fa87be7ec34
00cee 4585c0                         test       r8d, r8d
00cf1 0f8c3d100000                   jl         0x7fa87be7ec34
00cf7 448b542404                     mov        r10d, dword ptr [rsp + 4]
00cfc 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00d01 0f822d100000                   jb         0x7fa87be7ec34
00d07 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
00d0f 453bdd                         cmp        r11d, r13d
00d12 0f821c100000                   jb         0x7fa87be7ec34
00d18 4585f6                         test       r14d, r14d
00d1b 7421                           je         0x7fa87be7dc3e
00d1d 4883f920                       cmp        rcx, 0x20
00d21 769a                           jbe        0x7fa87be7dbbd
00d23 488bd1                         mov        rdx, rcx
00d26 c5f877                         vzeroupper 
00d29 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00d33 41ffd2                         call       r10
00d36 0f1f840000000000               nop        dword ptr [rax + rax]
00d3e 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00d46 e9fef5ffff                     jmp        0x7fa87be7d249
00d4b 90                             nop        
00d4c 418bc3                         mov        eax, r11d
00d4f 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d54 458b548308                     mov        r10d, dword ptr [r11 + rax*4 + 8]
00d59 4d8bc3                         mov        r8, r11
00d5c 458954800c                     mov        dword ptr [r8 + rax*4 + 0xc], r10d
00d61 448d58ff                       lea        r11d, [rax - 1]
00d65 443bd9                         cmp        r11d, ecx
00d68 7fe2                           jg         0x7fa87be7dc4c
00d6a 4183fb3f                       cmp        r11d, 0x3f
00d6e 0f8ebc120000                   jle        0x7fa87be7ef30
00d74 448bd0                         mov        r10d, eax
00d77 41ffca                         dec        r10d
00d7a 418bca                         mov        ecx, r10d
00d7d eb04                           jmp        0x7fa87be7dc83
00d7f 90                             nop        
00d80 418bca                         mov        ecx, r10d
00d83 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d88 62d17e486f848bccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x34]
00d93 62d17e487f848bd0ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x30], zmm0
00d9e 62d17e486f848b8cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x74]
00da9 62d17e487f848b90ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x70], zmm0
00db4 62d17e486f848b4cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb4]
00dbf 62d17e487f848b50ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb0], zmm0
00dca 62d17e486f848b0cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf4]
00dd5 62d17e487f848b10ffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf0], zmm0
00de0 448d51c0                       lea        r10d, [rcx - 0x40]
00de4 4183fa3f                       cmp        r10d, 0x3f
00de8 7f96                           jg         0x7fa87be7dc80
00dea 4183fa0f                       cmp        r10d, 0xf
00dee 7e2d                           jle        0x7fa87be7dd1d
00df0 448bd1                         mov        r10d, ecx
00df3 4183c2c0                       add        r10d, -0x40
00df7 90                             nop        
00df8 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00dfd 62917e486f8493ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x34]
00e08 62917e487f8493d0ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x30], zmm0
00e13 4183c2f0                       add        r10d, -0x10
00e17 4183fa0f                       cmp        r10d, 0xf
00e1b 7fdb                           jg         0x7fa87be7dcf8
00e1d 4585d2                         test       r10d, r10d
00e20 0f8efaf7ffff                   jle        0x7fa87be7d520
00e26 6690                           nop        
00e28 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00e2d 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
00e32 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00e37 47895c900c                     mov        dword ptr [r8 + r10*4 + 0xc], r11d
00e3c 41ffca                         dec        r10d
00e3f 4585d2                         test       r10d, r10d
00e42 7fe4                           jg         0x7fa87be7dd28
00e44 e9d7f7ffff                     jmp        0x7fa87be7d520
00e49 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00e51 e9d3f7ffff                     jmp        0x7fa87be7d529
00e56 66660f1f840000000000           nop        word ptr [rax + rax]
00e60 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00e68 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00e6f 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00e76 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00e7b 8bd5                           mov        edx, ebp
00e7d 4c8bd6                         mov        r10, rsi
00e80 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
00e88 c5f877                         vzeroupper 
00e8b e8d02aa9ff                     call       0x7fa87b910860
00e90 0f1f8400880f000b               nop        dword ptr [rax + rax + 0xb000f88]
00e98 488bb424f0000000               mov        rsi, qword ptr [rsp + 0xf0]
00ea0 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00ea7 488bc8                         mov        rcx, rax
00eaa 6690                           nop        
00eac c5f877                         vzeroupper 
00eaf e8ac2aa9ff                     call       0x7fa87b910860
00eb4 0f1f8400ac0f000c               nop        dword ptr [rax + rax + 0xc000fac]
00ebc 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00ec4 4183c208                       add        r10d, 8
00ec8 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00ed0 7c8e                           jl         0x7fa87be7dd60
00ed2 e9f7f4ffff                     jmp        0x7fa87be7d2ce
00ed7 4d63d3                         movsxd     r10, r11d
00eda 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ee1 c442a8f5db                     bzhi       r11, r11, r10
00ee6 c4c1fb92fb                     kmovq      k7, r11
00eeb 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ef1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ef7 eb71                           jmp        0x7fa87be7de6a
00ef9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00f01 4585d2                         test       r10d, r10d
00f04 0f8422050000                   je         0x7fa87be7e32c
00f0a 85db                           test       ebx, ebx
00f0c 0f8cc6160000                   jl         0x7fa87be7f4d8
00f12 4585c0                         test       r8d, r8d
00f15 0f8cbd160000                   jl         0x7fa87be7f4d8
00f1b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00f20 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00f25 0f82ad160000                   jb         0x7fa87be7f4d8
00f2b 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
00f33 453bd5                         cmp        r10d, r13d
00f36 0f829c160000                   jb         0x7fa87be7f4d8
00f3c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00f44 4585db                         test       r11d, r11d
00f47 7421                           je         0x7fa87be7de6a
00f49 4883f920                       cmp        rcx, 0x20
00f4d 7688                           jbe        0x7fa87be7ddd7
00f4f 488bd1                         mov        rdx, rcx
00f52 c5f877                         vzeroupper 
00f55 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00f5f 41ffd2                         call       r10
00f62 0f1f840000000000               nop        dword ptr [rax + rax]
00f6a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f6f 4585d2                         test       r10d, r10d
00f72 0f8e98010000                   jle        0x7fa87be7e010
00f78 458bc5                         mov        r8d, r13d
00f7b 442b8424a0000000               sub        r8d, dword ptr [rsp + 0xa0]
00f83 478d1c2a                       lea        r11d, [r10 + r13]
00f87 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00f8f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f94 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00f99 4b8d742b0c                     lea        rsi, [r11 + r13 + 0xc]
00f9e 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00fa6 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00fab 0f8dd1000000                   jge        0x7fa87be7df82
00fb1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fb6 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00fbe 458bda                         mov        r11d, r10d
00fc1 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00fc9 450f4fda                       cmovg      r11d, r10d
00fcd 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00fd5 4585c0                         test       r8d, r8d
00fd8 0f8c7a160000                   jl         0x7fa87be7f558
00fde 4585ed                         test       r13d, r13d
00fe1 0f8c71160000                   jl         0x7fa87be7f558
00fe7 478d1403                       lea        r10d, [r11 + r8]
00feb 448b8c24fc000000               mov        r9d, dword ptr [rsp + 0xfc]
00ff3 453bca                         cmp        r9d, r10d
00ff6 0f825c160000                   jb         0x7fa87be7f558
00ffc 478d142b                       lea        r10d, [r11 + r13]
01000 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
01008 453bca                         cmp        r9d, r10d
0100b 0f8247160000                   jb         0x7fa87be7f558
01011 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01019 4585d2                         test       r10d, r10d
0101c 0f8c36160000                   jl         0x7fa87be7f558
01022 4585d2                         test       r10d, r10d
01025 7429                           je         0x7fa87be7df50
01027 4963d2                         movsxd     rdx, r10d
0102a 4883fa20                       cmp        rdx, 0x20
0102e 7738                           ja         0x7fa87be7df68
01030 4d63d2                         movsxd     r10, r10d
01033 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0103a c442a8f5db                     bzhi       r11, r11, r10
0103f c4c1fb92fb                     kmovq      k7, r11
01044 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0104a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01050 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01058 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0105d 0f8db5000000                   jge        0x7fa87be7e018
01063 e9ff020000                     jmp        0x7fa87be7e267
01068 c5f877                         vzeroupper 
0106b 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
01075 41ffd2                         call       r10
01078 0f1f840000000000               nop        dword ptr [rax + rax]
01080 ebce                           jmp        0x7fa87be7df50
01082 4585c0                         test       r8d, r8d
01085 0f8c8d160000                   jl         0x7fa87be7f618
0108b 4585ed                         test       r13d, r13d
0108e 0f8c84160000                   jl         0x7fa87be7f618
01094 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01099 4503d8                         add        r11d, r8d
0109c 448b8c24fc000000               mov        r9d, dword ptr [rsp + 0xfc]
010a4 453bcb                         cmp        r9d, r11d
010a7 0f826b160000                   jb         0x7fa87be7f618
010ad 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
010b5 453bca                         cmp        r9d, r10d
010b8 0f825a160000                   jb         0x7fa87be7f618
010be 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
010c3 4585db                         test       r11d, r11d
010c6 7450                           je         0x7fa87be7e018
010c8 4883fd20                       cmp        rbp, 0x20
010cc 7725                           ja         0x7fa87be7dff3
010ce 458bd3                         mov        r10d, r11d
010d1 4d63d2                         movsxd     r10, r10d
010d4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010db c442a8f5db                     bzhi       r11, r11, r10
010e0 c4c1fb92fb                     kmovq      k7, r11
010e5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010eb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010f1 eb25                           jmp        0x7fa87be7e018
010f3 488bd5                         mov        rdx, rbp
010f6 c5f877                         vzeroupper 
010f9 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
01103 41ffd2                         call       r10
01106 0f1f840000000000               nop        dword ptr [rax + rax]
0110e eb08                           jmp        0x7fa87be7e018
01110 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
01118 48894424f8                     mov        qword ptr [rsp - 8], rax
0111d 8b8424f0000000                 mov        eax, dword ptr [rsp + 0xf0]
01124 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
0112b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01130 e999f2ffff                     jmp        0x7fa87be7d2ce
01135 4d63d2                         movsxd     r10, r10d
01138 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0113f c442a8f5db                     bzhi       r11, r11, r10
01144 c4c1fb92fb                     kmovq      k7, r11
01149 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0114f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01155 e9a4000000                     jmp        0x7fa87be7e0fe
0115a 448b1c24                       mov        r11d, dword ptr [rsp]
0115e 458bd3                         mov        r10d, r11d
01161 442b542434                     sub        r10d, dword ptr [rsp + 0x34]
01166 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0116b 4585c0                         test       r8d, r8d
0116e 0f84ec130000                   je         0x7fa87be7f460
01174 4d8bd8                         mov        r11, r8
01177 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0117c 4585c9                         test       r9d, r9d
0117f 0f8c0f140000                   jl         0x7fa87be7f494
01185 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
0118a 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
0118f 8b742404                       mov        esi, dword ptr [rsp + 4]
01193 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
0119a 85c9                           test       ecx, ecx
0119c 0f8c03140000                   jl         0x7fa87be7f4a5
011a2 3b3424                         cmp        esi, dword ptr [rsp]
011a5 0f82fa130000                   jb         0x7fa87be7f4a5
011ab 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
011b2 4103da                         add        ebx, r10d
011b5 418b7b08                       mov        edi, dword ptr [r11 + 8]
011b9 3bfb                           cmp        edi, ebx
011bb 0f82e4130000                   jb         0x7fa87be7f4a5
011c1 4585d2                         test       r10d, r10d
011c4 0f8cdb130000                   jl         0x7fa87be7f4a5
011ca 4585d2                         test       r10d, r10d
011cd 742f                           je         0x7fa87be7e0fe
011cf 498d740b0c                     lea        rsi, [r11 + rcx + 0xc]
011d4 4b8d7c080c                     lea        rdi, [r8 + r9 + 0xc]
011d9 4963d2                         movsxd     rdx, r10d
011dc 4883fa20                       cmp        rdx, 0x20
011e0 0f864fffffff                   jbe        0x7fa87be7e035
011e6 c5f877                         vzeroupper 
011e9 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
011f3 41ffd2                         call       r10
011f6 0f1f840000000000               nop        dword ptr [rax + rax]
011fe 895d3c                         mov        dword ptr [rbp + 0x3c], ebx
01201 c5f877                         vzeroupper 
01204 4881c4e0000000                 add        rsp, 0xe0
0120b 5d                             pop        rbp
0120c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01210 0f87ec150000                   ja         0x7fa87be7f702
01216 c3                             ret        
01217 41ffc9                         dec        r9d
0121a 4585c9                         test       r9d, r9d
0121d 7e27                           jle        0x7fa87be7e146
0121f 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01224 45895314                       mov        dword ptr [r11 + 0x14], r10d
01228 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
0122c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01231 45895a10                       mov        dword ptr [r10 + 0x10], r11d
01235 45894a0c                       mov        dword ptr [r10 + 0xc], r9d
01239 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
01241 e9e3f3ffff                     jmp        0x7fa87be7d529
01246 48be28387ce200000000           movabs     rsi, 0xe27c3828
01250 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01255 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0125d 448b1424                       mov        r10d, dword ptr [rsp]
01261 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01269 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0126e 4c891424                       mov        qword ptr [rsp], r10
01272 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01277 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0127f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01284 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01289 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0128d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01292 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01297 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0129c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
012a1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
012a6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
012ab 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
012b0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
012b5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
012ba 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
012bf 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
012c4 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
012c9 666690                         nop        
012cc c5f877                         vzeroupper 
012cf e88c26a9ff                     call       0x7fa87b910860
012d4 0f1f8400cc13000d               nop        dword ptr [rax + rax + 0xd0013cc]
012dc 4885c0                         test       rax, rax
012df 0f85f0f3ffff                   jne        0x7fa87be7d5d5
012e5 bef6ffffff                     mov        esi, 0xfffffff6
012ea 6690                           nop        
012ec c5f877                         vzeroupper 
012ef e86c9bb5ff                     call       0x7fa87b9d7d60
012f4 0f1f8400ec13000e               nop        dword ptr [rax + rax + 0xe0013ec]
012fc 4d03c1                         add        r8, r9
012ff 4d3bc6                         cmp        r8, r14
01302 7e07                           jle        0x7fa87be7e20b
01304 33c0                           xor        eax, eax
01306 e997edffff                     jmp        0x7fa87be7cfa2
0130b 33c0                           xor        eax, eax
0130d bb01000000                     mov        ebx, 1
01312 e98dedffff                     jmp        0x7fa87be7cfa4
01317 448bd5                         mov        r10d, ebp
0131a 4d63d2                         movsxd     r10, r10d
0131d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01324 c442a8f5db                     bzhi       r11, r11, r10
01329 c4c1fb92fb                     kmovq      k7, r11
0132e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01334 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0133a 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01342 4403dd                         add        r11d, ebp
01345 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0134d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01351 418502                         test       dword ptr [r10], eax
01354 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
01359 0f8db9fdffff                   jge        0x7fa87be7e018
0135f 4489b424a4000000               mov        dword ptr [rsp + 0xa4], r14d
01367 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
0136f 442b8424a0000000               sub        r8d, dword ptr [rsp + 0xa0]
01377 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
0137b 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
01382 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
01389 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01391 410f4fea                       cmovg      ebp, r10d
01395 4585c0                         test       r8d, r8d
01398 0f8c2a0e0000                   jl         0x7fa87be7f0c8
0139e 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
013a6 4585db                         test       r11d, r11d
013a9 0f8c190e0000                   jl         0x7fa87be7f0c8
013af 458d1428                       lea        r10d, [r8 + rbp]
013b3 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
013bb 453bda                         cmp        r11d, r10d
013be 0f82040e0000                   jb         0x7fa87be7f0c8
013c4 448bb424a4000000               mov        r14d, dword ptr [rsp + 0xa4]
013cc 4403f5                         add        r14d, ebp
013cf 453bde                         cmp        r11d, r14d
013d2 0f82f00d0000                   jb         0x7fa87be7f0c8
013d8 85ed                           test       ebp, ebp
013da 0f8ce80d0000                   jl         0x7fa87be7f0c8
013e0 85ed                           test       ebp, ebp
013e2 0f8452ffffff                   je         0x7fa87be7e23a
013e8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
013ed 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
013f2 458bda                         mov        r11d, r10d
013f5 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
013fd 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
01402 4863d5                         movsxd     rdx, ebp
01405 4883fa20                       cmp        rdx, 0x20
01409 0f8608ffffff                   jbe        0x7fa87be7e217
0140f c5f877                         vzeroupper 
01412 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
0141c 41ffd2                         call       r10
0141f 0f1f840000000000               nop        dword ptr [rax + rax]
01427 e90effffff                     jmp        0x7fa87be7e23a
0142c 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
01434 e931fbffff                     jmp        0x7fa87be7de6a
01439 bee4ffffff                     mov        esi, 0xffffffe4
0143e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01443 448b1c24                       mov        r11d, dword ptr [rsp]
01447 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0144f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01454 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0145c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01461 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01469 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0146e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01473 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01478 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0147d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01482 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01487 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0148c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01491 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01496 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0149b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
014a0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
014a5 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014aa 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
014af 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
014b4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014b9 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
014be 4489542448                     mov        dword ptr [rsp + 0x48], r10d
014c3 90                             nop        
014c4 c5f877                         vzeroupper 
014c7 e89499b5ff                     call       0x7fa87b9d7d60
014cc 0f1f8400c4150010               nop        dword ptr [rax + rax + 0x100015c4]
014d4 bee4ffffff                     mov        esi, 0xffffffe4
014d9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
014de 448b1424                       mov        r10d, dword ptr [rsp]
014e2 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
014ea 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014ef 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
014f7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
014fc 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01504 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01509 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0150e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01513 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01518 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0151d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01522 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01527 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0152c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01531 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01536 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0153b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01540 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01545 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0154b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01550 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01555 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0155a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0155f 90                             nop        
01560 c5f877                         vzeroupper 
01563 e8f898b5ff                     call       0x7fa87b9d7d60
01568 0f1f840060160011               nop        dword ptr [rax + rax + 0x11001660]
01570 bee4ffffff                     mov        esi, 0xffffffe4
01575 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0157a 448b1c24                       mov        r11d, dword ptr [rsp]
0157e 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01586 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0158b 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01593 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01598 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
015a0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
015a5 44895c2408                     mov        dword ptr [rsp + 8], r11d
015aa 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
015af 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
015b9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015be 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015c3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015c8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015cd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
015d2 895c2434                       mov        dword ptr [rsp + 0x34], ebx
015d6 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
015db 4489542440                     mov        dword ptr [rsp + 0x40], r10d
015e0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
015e5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
015ea 6690                           nop        
015ec c5f877                         vzeroupper 
015ef e86c98b5ff                     call       0x7fa87b9d7d60
015f4 0f1f8400ec160012               nop        dword ptr [rax + rax + 0x120016ec]
015fc bee4ffffff                     mov        esi, 0xffffffe4
01601 498bea                         mov        rbp, r10
01604 448b1c24                       mov        r11d, dword ptr [rsp]
01608 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01610 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01615 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0161d 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01622 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0162a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0162f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01634 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01638 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0163d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01642 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01647 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0164c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01651 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01656 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0165b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01660 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01665 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0166a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01670 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01675 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0167a 6690                           nop        
0167c c5f877                         vzeroupper 
0167f e8dc97b5ff                     call       0x7fa87b9d7d60
01684 0f1f84007c170013               nop        dword ptr [rax + rax + 0x1300177c]
0168c be45ffffff                     mov        esi, 0xffffff45
01691 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
01699 666690                         nop        
0169c c5f877                         vzeroupper 
0169f e8bc97b5ff                     call       0x7fa87b9d7d60
016a4 0f1f84009c170014               nop        dword ptr [rax + rax + 0x1400179c]
016ac be45ffffff                     mov        esi, 0xffffff45
016b1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016b6 448b1424                       mov        r10d, dword ptr [rsp]
016ba 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
016c2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016c7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
016cf 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016d4 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
016dc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016e1 4489542408                     mov        dword ptr [rsp + 8], r10d
016e6 895c2410                       mov        dword ptr [rsp + 0x10], ebx
016ea 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016ef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
016f9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016fe 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01703 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01708 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0170d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01712 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01717 89442430                       mov        dword ptr [rsp + 0x30], eax
0171b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01720 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01725 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0172a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0172f 90                             nop        
01730 c5f877                         vzeroupper 
01733 e82897b5ff                     call       0x7fa87b9d7d60
01738 0f1f840030180015               nop        dword ptr [rax + rax + 0x15001830]
01740 4d3bd3                         cmp        r10, r11
01743 bdffffffff                     mov        ebp, 0xffffffff
01748 7c08                           jl         0x7fa87be7e652
0174a 400f95c5                       setne      bpl
0174e 400fb6ed                       movzx      ebp, bpl
01752 be45ffffff                     mov        esi, 0xffffff45
01757 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0175c 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01764 448b1424                       mov        r10d, dword ptr [rsp]
01768 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01770 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01775 4c891424                       mov        qword ptr [rsp], r10
01779 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0177e 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01786 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0178b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01790 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01794 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01799 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0179e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
017a3 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
017a8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
017ad 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017b2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017b7 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017bc 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
017c1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
017c6 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017cb 90                             nop        
017cc c5f877                         vzeroupper 
017cf e88c96b5ff                     call       0x7fa87b9d7d60
017d4 0f1f8400cc180016               nop        dword ptr [rax + rax + 0x160018cc]
017dc be45ffffff                     mov        esi, 0xffffff45
017e1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017e6 448b1424                       mov        r10d, dword ptr [rsp]
017ea 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
017f2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017f7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
017ff 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01804 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0180c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01811 4489542408                     mov        dword ptr [rsp + 8], r10d
01816 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0181a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0181f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01824 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01829 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0182e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01833 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01838 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0183d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01842 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01847 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0184c c5f877                         vzeroupper 
0184f e80c96b5ff                     call       0x7fa87b9d7d60
01854 0f1f84004c190017               nop        dword ptr [rax + rax + 0x1700194c]
0185c be45ffffff                     mov        esi, 0xffffff45
01861 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01866 448b1424                       mov        r10d, dword ptr [rsp]
0186a 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01872 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01877 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0187f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01884 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0188c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01891 4489542408                     mov        dword ptr [rsp + 8], r10d
01896 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0189b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018a0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
018a5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018aa 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
018af 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018b4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
018b9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018be 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018c3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
018c8 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018cd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018d2 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
018d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
018dc c5f877                         vzeroupper 
018df e87c95b5ff                     call       0x7fa87b9d7d60
018e4 0f1f8400dc190018               nop        dword ptr [rax + rax + 0x180019dc]
018ec 85ff                           test       edi, edi
018ee 0f84c40e0000                   je         0x7fa87be7f6b8
018f4 4c8bdf                         mov        r11, rdi
018f7 8b0c24                         mov        ecx, dword ptr [rsp]
018fa 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
01902 4533c9                         xor        r9d, r9d
01905 448bd1                         mov        r10d, ecx
01908 e986f8ffff                     jmp        0x7fa87be7e093
0190d bee4ffffff                     mov        esi, 0xffffffe4
01912 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01917 448b1c24                       mov        r11d, dword ptr [rsp]
0191b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01923 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01928 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01930 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01935 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0193d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01942 4489542408                     mov        dword ptr [rsp + 8], r10d
01947 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0194c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01951 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01956 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0195b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01960 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01965 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0196a 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0196f 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01974 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01978 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0197c 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01981 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01986 6690                           nop        
01988 c5f877                         vzeroupper 
0198b e8d094b5ff                     call       0x7fa87b9d7d60
01990 0f1f8400881a0019               nop        dword ptr [rax + rax + 0x19001a88]
01998 bee4ffffff                     mov        esi, 0xffffffe4
0199d 498bea                         mov        rbp, r10
019a0 448b1424                       mov        r10d, dword ptr [rsp]
019a4 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
019ac 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019b1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
019b9 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
019be 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
019c6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019cb 4c891424                       mov        qword ptr [rsp], r10
019cf 44895c2408                     mov        dword ptr [rsp + 8], r11d
019d4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019d9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019de 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019e3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019e8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019ed 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019f2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019f7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019fc 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01a01 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a05 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01a0a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01a0f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a14 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a19 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01a1e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01a23 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a28 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a2d c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
01a33 90                             nop        
01a34 c5f877                         vzeroupper 
01a37 e82494b5ff                     call       0x7fa87b9d7d60
01a3c 0f1f8400341b001a               nop        dword ptr [rax + rax + 0x1a001b34]
01a44 8beb                           mov        ebp, ebx
01a46 83c510                         add        ebp, 0x10
01a49 be6effffff                     mov        esi, 0xffffff6e
01a4e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a53 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01a5b 448b1c24                       mov        r11d, dword ptr [rsp]
01a5f 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01a67 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a6c 4c891424                       mov        qword ptr [rsp], r10
01a70 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a75 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01a7d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a82 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a87 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01a8b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01a90 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a95 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01a9a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a9f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01aa4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01aa9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01aae 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ab3 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01ab8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01abd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ac2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ac7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01acc 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01ad1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01ad6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01adb 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01ae0 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01ae5 666690                         nop        
01ae8 c5f877                         vzeroupper 
01aeb e87093b5ff                     call       0x7fa87b9d7d60
01af0 0f1f8400e81b001b               nop        dword ptr [rax + rax + 0x1b001be8]
01af8 8beb                           mov        ebp, ebx
01afa 83c510                         add        ebp, 0x10
01afd be66ffffff                     mov        esi, 0xffffff66
01b02 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b07 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01b0f 448b1424                       mov        r10d, dword ptr [rsp]
01b13 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01b1b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b20 4c891424                       mov        qword ptr [rsp], r10
01b24 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b29 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01b31 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b36 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b3b 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01b3f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b44 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b49 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b4e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b53 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b58 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b5d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b62 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b67 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01b6c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b71 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b76 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b7b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b80 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01b85 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01b8a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b8f 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01b94 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01b99 666690                         nop        
01b9c c5f877                         vzeroupper 
01b9f e8bc92b5ff                     call       0x7fa87b9d7d60
01ba4 0f1f84009c1c001c               nop        dword ptr [rax + rax + 0x1c001c9c]
01bac be17000000                     mov        esi, 0x17
01bb1 666690                         nop        
01bb4 c5f877                         vzeroupper 
01bb7 e8a492b5ff                     call       0x7fa87b9d7d60
01bbc 0f1f8400b41c001d               nop        dword ptr [rax + rax + 0x1d001cb4]
01bc4 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
01bc9 eb05                           jmp        0x7fa87be7ead0
01bcb 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
01bd0 be6effffff                     mov        esi, 0xffffff6e
01bd5 4c898424f0000000               mov        qword ptr [rsp + 0xf0], r8
01bdd 4c896c2408                     mov        qword ptr [rsp + 8], r13
01be2 897c2410                       mov        dword ptr [rsp + 0x10], edi
01be6 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01beb 89542420                       mov        dword ptr [rsp + 0x20], edx
01bef 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01bf3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01bf8 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01bfc 4889442440                     mov        qword ptr [rsp + 0x40], rax
01c01 4c89742448                     mov        qword ptr [rsp + 0x48], r14
01c06 6690                           nop        
01c08 c5f877                         vzeroupper 
01c0b e85092b5ff                     call       0x7fa87b9d7d60
01c10 0f1f8400081d001e               nop        dword ptr [rax + rax + 0x1e001d08]
01c18 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c1d bebeffffff                     mov        esi, 0xffffffbe
01c22 498be8                         mov        rbp, r8
01c25 448b1c24                       mov        r11d, dword ptr [rsp]
01c29 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01c31 4c89ac24f8000000               mov        qword ptr [rsp + 0xf8], r13
01c39 4c891424                       mov        qword ptr [rsp], r10
01c3d 897c2408                       mov        dword ptr [rsp + 8], edi
01c41 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c4b 89542418                       mov        dword ptr [rsp + 0x18], edx
01c4f 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01c53 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01c57 90                             nop        
01c58 c5f877                         vzeroupper 
01c5b e80092b5ff                     call       0x7fa87b9d7d60
01c60 0f1f8400581d001f               nop        dword ptr [rax + rax + 0x1f001d58]
01c68 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c6d ebae                           jmp        0x7fa87be7eb1d
01c6f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c74 eba7                           jmp        0x7fa87be7eb1d
01c76 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c7b eba0                           jmp        0x7fa87be7eb1d
01c7d bee4ffffff                     mov        esi, 0xffffffe4
01c82 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01c87 448b1c24                       mov        r11d, dword ptr [rsp]
01c8b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01c93 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c98 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01ca0 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01ca5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01cad 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cb2 4c891424                       mov        qword ptr [rsp], r10
01cb6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cbb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cc0 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01cc4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01cc9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cce 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01cd3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01cd8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cdd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ce2 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01ce7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01cec 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cf1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cf5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01cfa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cff 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01d04 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d09 666690                         nop        
01d0c c5f877                         vzeroupper 
01d0f e84c91b5ff                     call       0x7fa87b9d7d60
01d14 0f1f84000c1e0020               nop        dword ptr [rax + rax + 0x20001e0c]
01d1c bef6ffffff                     mov        esi, 0xfffffff6
01d21 666690                         nop        
01d24 c5f877                         vzeroupper 
01d27 e83491b5ff                     call       0x7fa87b9d7d60
01d2c 0f1f8400241e0021               nop        dword ptr [rax + rax + 0x21001e24]
01d34 beccffffff                     mov        esi, 0xffffffcc
01d39 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d3e 448b1c24                       mov        r11d, dword ptr [rsp]
01d42 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01d4a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d4f 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01d57 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d5c 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01d64 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d69 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d6e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01d73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d78 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01d7d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01d82 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d87 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d8c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d91 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01d96 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01d9a 6690                           nop        
01d9c c5f877                         vzeroupper 
01d9f e8bc90b5ff                     call       0x7fa87b9d7d60
01da4 0f1f84009c1e0022               nop        dword ptr [rax + rax + 0x22001e9c]
01dac bee4ffffff                     mov        esi, 0xffffffe4
01db1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01db6 448b1424                       mov        r10d, dword ptr [rsp]
01dba 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01dc2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dc7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01dcf 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01dd4 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01ddc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01de1 4489542408                     mov        dword ptr [rsp + 8], r10d
01de6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01deb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01df0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01df5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dfa 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01dff 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e04 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e09 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e0e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e13 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e18 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01e20 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01e25 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e2a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e2f 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01e34 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01e39 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e3e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01e43 90                             nop        
01e44 c5f877                         vzeroupper 
01e47 e81490b5ff                     call       0x7fa87b9d7d60
01e4c 0f1f8400441f0023               nop        dword ptr [rax + rax + 0x23001f44]
01e54 bee4ffffff                     mov        esi, 0xffffffe4
01e59 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e5e 448b1424                       mov        r10d, dword ptr [rsp]
01e62 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01e6a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e6f 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e77 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01e7c 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01e84 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01e89 4489542408                     mov        dword ptr [rsp + 8], r10d
01e8e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01e93 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e98 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e9d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ea2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ea7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01eac 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01eb1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01eb6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ebb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ec0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01ec5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01eca 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ecf 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01ed4 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01ed9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01ede 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ee3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ee8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01eed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01ef2 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01ef7 90                             nop        
01ef8 c5f877                         vzeroupper 
01efb e8608fb5ff                     call       0x7fa87b9d7d60
01f00 0f1f8400f81f0024               nop        dword ptr [rax + rax + 0x24001ff8]
01f08 beccffffff                     mov        esi, 0xffffffcc
01f0d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01f12 448b1c24                       mov        r11d, dword ptr [rsp]
01f16 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01f1e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f23 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01f2b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01f30 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01f38 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f3d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f42 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01f47 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01f4c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01f51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f56 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f5b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f60 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f65 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01f6a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f6f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f74 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01f79 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f7e 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01f83 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01f88 c5f877                         vzeroupper 
01f8b e8d08eb5ff                     call       0x7fa87b9d7d60
01f90 0f1f840088200025               nop        dword ptr [rax + rax + 0x25002088]
01f98 be6effffff                     mov        esi, 0xffffff6e
01f9d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fa2 448b1c24                       mov        r11d, dword ptr [rsp]
01fa6 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01fae 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01fb3 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01fbb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01fc0 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01fc8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fcd 4c891424                       mov        qword ptr [rsp], r10
01fd1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01fd6 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fdb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01fdf 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fe4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fe9 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01fee 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ff3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ff8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ffd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02002 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02007 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0200c 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
02011 89442440                       mov        dword ptr [rsp + 0x40], eax
02015 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0201a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0201f 90                             nop        
02020 c5f877                         vzeroupper 
02023 e8388eb5ff                     call       0x7fa87b9d7d60
02028 0f1f840020210026               nop        dword ptr [rax + rax + 0x26002120]
02030 458bd3                         mov        r10d, r11d
02033 e9e5edffff                     jmp        0x7fa87be7dd1d
02038 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
02040 458d5308                       lea        r10d, [r11 + 8]
02044 458bc2                         mov        r8d, r10d
02047 be6effffff                     mov        esi, 0xffffff6e
0204c 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02051 448b1424                       mov        r10d, dword ptr [rsp]
02055 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0205d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02062 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0206a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0206f 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02077 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0207c 4489542408                     mov        dword ptr [rsp + 8], r10d
02081 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
02086 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0208b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02090 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02095 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0209a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0209f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
020a4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
020a9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
020ae 4489542424                     mov        dword ptr [rsp + 0x24], r10d
020b3 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
020bb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
020c0 458bd3                         mov        r10d, r11d
020c3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
020c8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
020cd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020d2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
020d7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020dc 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
020e1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
020e6 448bd9                         mov        r11d, ecx
020e9 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
020ee 6690                           nop        
020f0 c5f877                         vzeroupper 
020f3 e8688db5ff                     call       0x7fa87b9d7d60
020f8 0f1f8400f0210027               nop        dword ptr [rax + rax + 0x270021f0]
02100 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
02108 458d5308                       lea        r10d, [r11 + 8]
0210c 458bca                         mov        r9d, r10d
0210f be66ffffff                     mov        esi, 0xffffff66
02114 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02119 448b1424                       mov        r10d, dword ptr [rsp]
0211d 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02125 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0212a 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02132 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02137 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0213f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02144 4489542408                     mov        dword ptr [rsp + 8], r10d
02149 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0214e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02153 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02158 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0215d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02162 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02167 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0216c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02171 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02176 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0217b 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
02183 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
02188 458bd3                         mov        r10d, r11d
0218b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02190 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02195 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0219a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0219f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021a4 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
021a9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
021ae 448bd9                         mov        r11d, ecx
021b1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
021b6 6690                           nop        
021b8 c5f877                         vzeroupper 
021bb e8a08cb5ff                     call       0x7fa87b9d7d60
021c0 0f1f8400b8220028               nop        dword ptr [rax + rax + 0x280022b8]
021c8 beccffffff                     mov        esi, 0xffffffcc
021cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021d2 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
021da 448b1424                       mov        r10d, dword ptr [rsp]
021de 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
021e6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021eb 4c891424                       mov        qword ptr [rsp], r10
021ef 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
021f4 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
021fc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02201 4c89542408                     mov        qword ptr [rsp + 8], r10
02206 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0220b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02210 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02214 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02219 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0221e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02223 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02228 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0222d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02232 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
02237 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0223c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02241 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02246 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0224b 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
02250 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02255 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0225a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0225f 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02264 c5f877                         vzeroupper 
02267 e8f48bb5ff                     call       0x7fa87b9d7d60
0226c 0f1f840064230029               nop        dword ptr [rax + rax + 0x29002364]
02274 bee4ffffff                     mov        esi, 0xffffffe4
02279 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0227e 448b1c24                       mov        r11d, dword ptr [rsp]
02282 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0228a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0228f 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02297 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0229c 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
022a4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
022a9 44895c2408                     mov        dword ptr [rsp + 8], r11d
022ae 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
022b3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022b8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022bd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
022c2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
022c7 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
022cc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
022d1 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
022d6 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
022de 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
022e3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
022e8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022ed 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
022f2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
022f7 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
022fc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02301 666690                         nop        
02304 c5f877                         vzeroupper 
02307 e8548bb5ff                     call       0x7fa87b9d7d60
0230c 0f1f84000424002a               nop        dword ptr [rax + rax + 0x2a002404]
02314 bee4ffffff                     mov        esi, 0xffffffe4
02319 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0231e 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02326 448b1c24                       mov        r11d, dword ptr [rsp]
0232a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02332 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02337 4c891424                       mov        qword ptr [rsp], r10
0233b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02340 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02348 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0234d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02352 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02357 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0235c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02361 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02366 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0236b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02370 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
02375 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0237a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0237f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02384 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
02389 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0238e 6690                           nop        
02390 c5f877                         vzeroupper 
02393 e8c88ab5ff                     call       0x7fa87b9d7d60
02398 0f1f84009024002b               nop        dword ptr [rax + rax + 0x2b002490]
023a0 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
023a7 ffc5                           inc        ebp
023a9 bee4ffffff                     mov        esi, 0xffffffe4
023ae 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023b3 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
023bb 448b1424                       mov        r10d, dword ptr [rsp]
023bf 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
023c7 4c8b542408                     mov        r10, qword ptr [rsp + 8]
023cc 4c891424                       mov        qword ptr [rsp], r10
023d0 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
023d5 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
023dd 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
023e2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
023e7 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023f1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
023f6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
023fb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02400 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02405 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0240a 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0240f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02414 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02419 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0241e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02423 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02428 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0242d 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02432 6690                           nop        
02434 c5f877                         vzeroupper 
02437 e8248ab5ff                     call       0x7fa87b9d7d60
0243c 0f1f84003425002c               nop        dword ptr [rax + rax + 0x2c002534]
02444 bee4ffffff                     mov        esi, 0xffffffe4
02449 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0244e 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02456 448b1c24                       mov        r11d, dword ptr [rsp]
0245a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02462 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02467 4c891424                       mov        qword ptr [rsp], r10
0246b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02470 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02478 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0247d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02482 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02487 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0248c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02491 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02496 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0249b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
024a0 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
024a5 4489442440                     mov        dword ptr [rsp + 0x40], r8d
024aa 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
024af 4c89542448                     mov        qword ptr [rsp + 0x48], r10
024b4 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
024b9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
024be 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
024c3 90                             nop        
024c4 c5f877                         vzeroupper 
024c7 e89489b5ff                     call       0x7fa87b9d7d60
024cc 0f1f8400c425002d               nop        dword ptr [rax + rax + 0x2d0025c4]
024d4 bee4ffffff                     mov        esi, 0xffffffe4
024d9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
024de 448b1c24                       mov        r11d, dword ptr [rsp]
024e2 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
024ea 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024ef 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
024f7 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
024fc 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02504 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
02509 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0250e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02513 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02518 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0251d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02522 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02527 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0252c 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02531 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02536 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0253b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02540 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02545 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0254a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0254f 90                             nop        
02550 c5f877                         vzeroupper 
02553 e80889b5ff                     call       0x7fa87b9d7d60
02558 0f1f84005026002e               nop        dword ptr [rax + rax + 0x2e002650]
02560 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
02565 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0256a bef6ffffff                     mov        esi, 0xfffffff6
0256f 498be8                         mov        rbp, r8
02572 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0257a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02582 6690                           nop        
02584 c5f877                         vzeroupper 
02587 e8d488b5ff                     call       0x7fa87b9d7d60
0258c 0f1f84008426002f               nop        dword ptr [rax + rax + 0x2f002684]
02594 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
02599 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
0259e 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
025a5 beccffffff                     mov        esi, 0xffffffcc
025aa 4c898424f8000000               mov        qword ptr [rsp + 0xf8], r8
025b2 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
025ba 890c24                         mov        dword ptr [rsp], ecx
025bd 4c895c2408                     mov        qword ptr [rsp + 8], r11
025c2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
025c7 90                             nop        
025c8 c5f877                         vzeroupper 
025cb e89088b5ff                     call       0x7fa87b9d7d60
025d0 0f1f8400c8260030               nop        dword ptr [rax + rax + 0x300026c8]
025d8 beccffffff                     mov        esi, 0xffffffcc
025dd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
025e2 448b1c24                       mov        r11d, dword ptr [rsp]
025e6 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
025ee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025f3 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
025fb 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02600 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02608 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0260d 4c891424                       mov        qword ptr [rsp], r10
02611 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02616 44895c2408                     mov        dword ptr [rsp + 8], r11d
0261b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02620 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02625 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0262a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0262f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02634 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02639 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0263e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02643 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02647 90                             nop        
02648 c5f877                         vzeroupper 
0264b e81088b5ff                     call       0x7fa87b9d7d60
02650 0f1f840048270031               nop        dword ptr [rax + rax + 0x31002748]
02658 beccffffff                     mov        esi, 0xffffffcc
0265d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02662 448b1c24                       mov        r11d, dword ptr [rsp]
02666 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0266e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02673 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0267b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02680 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02688 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0268d 4489542408                     mov        dword ptr [rsp + 8], r10d
02692 895c240c                       mov        dword ptr [rsp + 0xc], ebx
02696 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0269b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026a0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
026a5 4489542418                     mov        dword ptr [rsp + 0x18], r10d
026aa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
026af 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
026b4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
026b9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
026be 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
026c3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
026c8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
026cd 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
026d2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026d7 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
026dc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
026e1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
026e6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
026eb 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026f0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
026f5 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
026fd 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02702 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02707 90                             nop        
02708 c5f877                         vzeroupper 
0270b e85087b5ff                     call       0x7fa87b9d7d60
02710 0f1f840008280032               nop        dword ptr [rax + rax + 0x32002808]
02718 beccffffff                     mov        esi, 0xffffffcc
0271d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02722 448b1c24                       mov        r11d, dword ptr [rsp]
02726 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0272e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02733 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0273b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02740 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02748 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0274d 44895c2408                     mov        dword ptr [rsp + 8], r11d
02752 895c240c                       mov        dword ptr [rsp + 0xc], ebx
02756 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0275b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02760 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02765 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0276a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0276f 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02774 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
02779 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0277e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02783 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02788 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0278d 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
02792 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02797 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0279c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
027a1 4489442468                     mov        dword ptr [rsp + 0x68], r8d
027a6 6690                           nop        
027a8 c5f877                         vzeroupper 
027ab e8b086b5ff                     call       0x7fa87b9d7d60
027b0 0f1f8400a8280033               nop        dword ptr [rax + rax + 0x330028a8]
027b8 448b0c24                       mov        r9d, dword ptr [rsp]
027bc 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
027c4 4533db                         xor        r11d, r11d
027c7 458bd1                         mov        r10d, r9d
027ca e99bfdffff                     jmp        0x7fa87be7f46a
027cf bef6ffffff                     mov        esi, 0xfffffff6
027d4 c5f877                         vzeroupper 
027d7 e88486b5ff                     call       0x7fa87b9d7d60
027dc 0f1f8400d4280034               nop        dword ptr [rax + rax + 0x340028d4]
027e4 eb14                           jmp        0x7fa87be7f6fa
027e6 eb12                           jmp        0x7fa87be7f6fa
027e8 eb10                           jmp        0x7fa87be7f6fa
027ea eb0e                           jmp        0x7fa87be7f6fa
027ec eb0c                           jmp        0x7fa87be7f6fa
027ee eb0a                           jmp        0x7fa87be7f6fa
027f0 eb08                           jmp        0x7fa87be7f6fa
027f2 eb06                           jmp        0x7fa87be7f6fa
027f4 eb04                           jmp        0x7fa87be7f6fa
027f6 eb02                           jmp        0x7fa87be7f6fa
027f8 eb00                           jmp        0x7fa87be7f6fa
027fa 488bf0                         mov        rsi, rax
027fd e9d6deffff                     jmp        0x7fa87be7d5d8
02802 49ba0ce1e77ba87f0000           movabs     r10, 0x7fa87be7e10c
0280c 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02813 e9c837a9ff                     jmp        0x7fa87b912ee0
02818 e88303a8ff                     call       0x7fa87b8ffaa0
0281d e91cd8ffff                     jmp        0x7fa87be7cf3e
02822 f4                             hlt        
02823 f4                             hlt        
02824 f4                             hlt        
02825 f4                             hlt        
02826 f4                             hlt        
02827 f4                             hlt        
