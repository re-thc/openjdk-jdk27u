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
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85400bb4ff                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85703a0000                   jne        0x7f63dbc05cae
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 4c8bee                         mov        r13, rsi
0004e 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00051 8b6e38                         mov        ebp, dword ptr [rsi + 0x38]
00054 448bd5                         mov        r10d, ebp
00057 442bd0                         sub        r10d, eax
0005a 448b8c24d0000000               mov        r9d, dword ptr [rsp + 0xd0]
00062 453bca                         cmp        r9d, r10d
00065 0f8f112d0000                   jg         0x7f63dbc04f7c
0006b 4c8b4608                       mov        r8, qword ptr [rsi + 8]
0006f 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00073 4c639424d0000000               movsxd     r10, dword ptr [rsp + 0xd0]
0007b 4c63d8                         movsxd     r11, eax
0007e 4d03d8                         add        r11, r8
00081 492bcb                         sub        rcx, r11
00084 4c3bd1                         cmp        r10, rcx
00087 0f8fef2c0000                   jg         0x7f63dbc04f7c
0008d 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
00091 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00095 4d85c9                         test       r9, r9
00098 0f84ed0f0000                   je         0x7f63dbc0328b
0009e 33db                           xor        ebx, ebx
000a0 4c8bda                         mov        r11, rdx
000a3 8b7208                         mov        esi, dword ptr [rdx + 8]
000a6 458b7544                       mov        r14d, dword ptr [r13 + 0x44]
000aa 85ff                           test       edi, edi
000ac 0f8ebe210000                   jle        0x7f63dbc04470
000b2 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000b9 897c2438                       mov        dword ptr [rsp + 0x38], edi
000bd 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000c2 4c896c2478                     mov        qword ptr [rsp + 0x78], r13
000c7 4d2bc8                         sub        r9, r8
000ca 448d5ee0                       lea        r11d, [rsi - 0x20]
000ce 83c5e0                         add        ebp, -0x20
000d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d6 418b7a08                       mov        edi, dword ptr [r10 + 8]
000da 85ff                           test       edi, edi
000dc 0f86c62c0000                   jbe        0x7f63dbc04fa8
000e2 4c63d7                         movsxd     r10, edi
000e5 48637c2438                     movsxd     rdi, dword ptr [rsp + 0x38]
000ea 48ffcf                         dec        rdi
000ed 493bfa                         cmp        rdi, r10
000f0 0f83b22c0000                   jae        0x7f63dbc04fa8
000f6 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
000fe 458b6a08                       mov        r13d, dword ptr [r10 + 8]
00102 4585ed                         test       r13d, r13d
00105 0f86e92c0000                   jbe        0x7f63dbc04ff4
0010b 4183fd01                       cmp        r13d, 1
0010f 0f86df2c0000                   jbe        0x7f63dbc04ff4
00115 4183fd02                       cmp        r13d, 2
00119 0f86d52c0000                   jbe        0x7f63dbc04ff4
0011f 448d56f1                       lea        r10d, [rsi - 0xf]
00123 4585d2                         test       r10d, r10d
00126 0f8cc82c0000                   jl         0x7f63dbc04ff4
0012c 418b7e08                       mov        edi, dword ptr [r14 + 8]
00130 448d57f1                       lea        r10d, [rdi - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8cb72c0000                   jl         0x7f63dbc04ff4
0013d 448d57fd                       lea        r10d, [rdi - 3]
00141 4585d2                         test       r10d, r10d
00144 0f8caa2c0000                   jl         0x7f63dbc04ff4
0014a 448d57f9                       lea        r10d, [rdi - 7]
0014e 4585d2                         test       r10d, r10d
00151 0f8c9d2c0000                   jl         0x7f63dbc04ff4
00157 897c2410                       mov        dword ptr [rsp + 0x10], edi
0015b 44896c2404                     mov        dword ptr [rsp + 4], r13d
00160 896c2464                       mov        dword ptr [rsp + 0x64], ebp
00164 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00169 89b424d4000000                 mov        dword ptr [rsp + 0xd4], esi
00170 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00174 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00179 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
0017e 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00183 498bde                         mov        rbx, r14
00186 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
0018b 4489742460                     mov        dword ptr [rsp + 0x60], r14d
00190 448bef                         mov        r13d, edi
00193 8bde                           mov        ebx, esi
00195 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00199 418d5dfd                       lea        ebx, [r13 - 3]
0019d 895c2458                       mov        dword ptr [rsp + 0x58], ebx
001a1 8b5c2414                       mov        ebx, dword ptr [rsp + 0x14]
001a5 83c3f1                         add        ebx, -0xf
001a8 895c2468                       mov        dword ptr [rsp + 0x68], ebx
001ac 4d63f5                         movsxd     r14, r13d
001af 418d5df9                       lea        ebx, [r13 - 7]
001b3 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
001b7 4183c5f1                       add        r13d, -0xf
001bb 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
001c3 498d5ef1                       lea        rbx, [r14 - 0xf]
001c7 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
001cf 4983c6f9                       add        r14, -7
001d3 4c89b42490000000               mov        qword ptr [rsp + 0x90], r14
001db 4533d2                         xor        r10d, r10d
001de 33db                           xor        ebx, ebx
001e0 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
001e7 e97a040000                     jmp        0x7f63dbc02866
001ec 448bd5                         mov        r10d, ebp
001ef 4d63d2                         movsxd     r10, r10d
001f2 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f9 c442a8f5db                     bzhi       r11, r11, r10
001fe c4c1fb92fb                     kmovq      k7, r11
00203 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00209 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0020f 4403ed                         add        r13d, ebp
00212 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00216 418502                         test       dword ptr [r10], eax
00219 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
0021e 0f8d19040000                   jge        0x7f63dbc0283d
00224 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
00229 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0022e 452bd5                         sub        r10d, r13d
00231 458bca                         mov        r9d, r10d
00234 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
00238 412bed                         sub        ebp, r13d
0023b 413bed                         cmp        ebp, r13d
0023e 410f4fed                       cmovg      ebp, r13d
00242 4585d2                         test       r10d, r10d
00245 0f8ccd250000                   jl         0x7f63dbc04a18
0024b 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00250 4585f6                         test       r14d, r14d
00253 0f8cbf250000                   jl         0x7f63dbc04a18
00259 458d1c2a                       lea        r11d, [r10 + rbp]
0025d 448b742410                     mov        r14d, dword ptr [rsp + 0x10]
00262 453bf3                         cmp        r14d, r11d
00265 0f82ad250000                   jb         0x7f63dbc04a18
0026b 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00270 4403f5                         add        r14d, ebp
00273 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00278 453bde                         cmp        r11d, r14d
0027b 0f8297250000                   jb         0x7f63dbc04a18
00281 85ed                           test       ebp, ebp
00283 0f8c8f250000                   jl         0x7f63dbc04a18
00289 85ed                           test       ebp, ebp
0028b 0f847effffff                   je         0x7f63dbc0240f
00291 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00296 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0029b 4b8d74010c                     lea        rsi, [r9 + r8 + 0xc]
002a0 4b8d7c110c                     lea        rdi, [r9 + r10 + 0xc]
002a5 4863d5                         movsxd     rdx, ebp
002a8 4883fa20                       cmp        rdx, 0x20
002ac 0f863affffff                   jbe        0x7f63dbc023ec
002b2 c5f877                         vzeroupper 
002b5 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
002bf 41ffd2                         call       r10
002c2 0f1f840000000000               nop        dword ptr [rax + rax]
002ca e940ffffff                     jmp        0x7f63dbc0240f
002cf 48894424f8                     mov        qword ptr [rsp - 8], rax
002d4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002d8 89442444                       mov        dword ptr [rsp + 0x44], eax
002dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002e1 4585ed                         test       r13d, r13d
002e4 0f8ed2130000                   jle        0x7f63dbc038bc
002ea 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
002ef 44035c245c                     add        r11d, dword ptr [rsp + 0x5c]
002f4 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
002f9 0f8f59150000                   jg         0x7f63dbc03a58
002ff 458d1c1a                       lea        r11d, [r10 + rbx]
00303 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0030b 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00310 0f8f12160000                   jg         0x7f63dbc03b28
00316 83fb10                         cmp        ebx, 0x10
00319 0f8fc8060000                   jg         0x7f63dbc02be7
0031f 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00324 0f835a100000                   jae        0x7f63dbc03584
0032a 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0032f c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00336 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
0033d 0f832d110000                   jae        0x7f63dbc03670
00343 468d3413                       lea        r14d, [rbx + r10]
00347 4489b42498000000               mov        dword ptr [rsp + 0x98], r14d
0034f 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
00354 c4c17a7f44060c                 vmovdqu    xmmword ptr [r14 + rax + 0xc], xmm0
0035b 03d8                           add        ebx, eax
0035d 448bf3                         mov        r14d, ebx
00360 452bf5                         sub        r14d, r13d
00363 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00368 4183fb10                       cmp        r11d, 0x10
0036c 7f44                           jg         0x7f63dbc025b2
0036e 4183fd10                       cmp        r13d, 0x10
00372 7c3e                           jl         0x7f63dbc025b2
00374 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
0037c 0f83ce110000                   jae        0x7f63dbc03750
00382 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00387 c4817a6f44350c                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 0xc]
0038e 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00395 0f8359120000                   jae        0x7f63dbc037f4
0039b c4c17a7f441d0c                 vmovdqu    xmmword ptr [r13 + rbx + 0xc], xmm0
003a2 4403db                         add        r11d, ebx
003a5 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
003ad e98b020000                     jmp        0x7f63dbc0283d
003b2 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
003b7 4b8d7c300c                     lea        rdi, [r8 + r14 + 0xc]
003bc 498d74180c                     lea        rsi, [r8 + rbx + 0xc]
003c1 458d041b                       lea        r8d, [r11 + rbx]
003c5 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
003cd 4d63c8                         movsxd     r9, r8d
003d0 453beb                         cmp        r13d, r11d
003d3 0f8c35040000                   jl         0x7f63dbc02a0e
003d9 4183fb30                       cmp        r11d, 0x30
003dd 0f8e89000000                   jle        0x7f63dbc0266c
003e3 4585f6                         test       r14d, r14d
003e6 0f8c801b0000                   jl         0x7f63dbc0416c
003ec 85db                           test       ebx, ebx
003ee 0f8c781b0000                   jl         0x7f63dbc0416c
003f4 478d2c33                       lea        r13d, [r11 + r14]
003f8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
003fd 453bd5                         cmp        r10d, r13d
00400 0f82661b0000                   jb         0x7f63dbc0416c
00406 453bd0                         cmp        r10d, r8d
00409 0f825d1b0000                   jb         0x7f63dbc0416c
0040f 4585db                         test       r11d, r11d
00412 0f844c1b0000                   je         0x7f63dbc04164
00418 4963d3                         movsxd     rdx, r11d
0041b 4883fa20                       cmp        rdx, 0x20
0041f 772b                           ja         0x7f63dbc0264c
00421 458beb                         mov        r13d, r11d
00424 4d63d5                         movsxd     r10, r13d
00427 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
0042e c442a8f5c0                     bzhi       r8, r8, r10
00433 c4c1fb92f8                     kmovq      k7, r8
00438 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0043e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00444 418beb                         mov        ebp, r11d
00447 e9e8010000                     jmp        0x7f63dbc02834
0044c 418beb                         mov        ebp, r11d
0044f c5f877                         vzeroupper 
00452 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
0045c 41ffd2                         call       r10
0045f 0f1f840000000000               nop        dword ptr [rax + rax]
00467 e9c8010000                     jmp        0x7f63dbc02834
0046c 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
00471 0f83d9160000                   jae        0x7f63dbc03d50
00477 4963fe                         movsxd     rdi, r14d
0047a 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
0047f 4d8b543d0c                     mov        r10, qword ptr [r13 + rdi + 0xc]
00484 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
00488 0f83ba170000                   jae        0x7f63dbc03e48
0048e 8bcb                           mov        ecx, ebx
00490 8d5108                         lea        edx, [rcx + 8]
00493 4c63c1                         movsxd     r8, ecx
00496 4f8954050c                     mov        qword ptr [r13 + r8 + 0xc], r10
0049b 3b94249c000000                 cmp        edx, dword ptr [rsp + 0x9c]
004a2 7c08                           jl         0x7f63dbc026ac
004a4 418beb                         mov        ebp, r11d
004a7 e988010000                     jmp        0x7f63dbc02834
004ac 492bf8                         sub        rdi, r8
004af 4c63c2                         movsxd     r8, edx
004b2 4d8d1438                       lea        r10, [r8 + rdi]
004b6 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
004be 0f8370180000                   jae        0x7f63dbc03f34
004c4 4d8bd1                         mov        r10, r9
004c7 4d2bd0                         sub        r10, r8
004ca 4983c207                       add        r10, 7
004ce 4983e2f8                       and        r10, 0xfffffffffffffff8
004d2 458bd2                         mov        r10d, r10d
004d5 458d440a08                     lea        r8d, [r10 + rcx + 8]
004da 4d63d0                         movsxd     r10, r8d
004dd 4d8d443af8                     lea        r8, [r10 + rdi - 8]
004e2 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
004ea 0f8344180000                   jae        0x7f63dbc03f34
004f0 3b54246c                       cmp        edx, dword ptr [rsp + 0x6c]
004f4 0f833a180000                   jae        0x7f63dbc03f34
004fa 4983c2f8                       add        r10, -8
004fe 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00506 0f8328180000                   jae        0x7f63dbc03f34
0050c 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00514 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
0051b 0f8ff7180000                   jg         0x7f63dbc04018
00521 442bf1                         sub        r14d, ecx
00524 83c110                         add        ecx, 0x10
00527 418beb                         mov        ebp, r11d
0052a 458d1416                       lea        r10d, [r14 + rdx]
0052e 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00533 4f8b54150c                     mov        r10, qword ptr [r13 + r10 + 0xc]
00538 448bda                         mov        r11d, edx
0053b 4f89541d0c                     mov        qword ptr [r13 + r11 + 0xc], r10
00540 448d5208                       lea        r10d, [rdx + 8]
00544 443bd1                         cmp        r10d, ecx
00547 7d05                           jge        0x7f63dbc0274e
00549 418bd2                         mov        edx, r10d
0054c ebdc                           jmp        0x7f63dbc0272a
0054e 4983c1f8                       add        r9, -8
00552 4981f900000080                 cmp        r9, -0x80000000
00559 49c7c300000080                 mov        r11, 0xffffffff80000000
00560 4d0f4ccb                       cmovl      r9, r11
00564 418bc9                         mov        ecx, r9d
00567 443bd1                         cmp        r10d, ecx
0056a 0f8d75000000                   jge        0x7f63dbc027e5
00570 4d63da                         movsxd     r11, r10d
00573 4c03df                         add        r11, rdi
00576 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
0057e 0f8368190000                   jae        0x7f63dbc040ec
00584 83c210                         add        edx, 0x10
00587 4c63da                         movsxd     r11, edx
0058a 4c03df                         add        r11, rdi
0058d 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00595 0f8365190000                   jae        0x7f63dbc04100
0059b 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
005a0 0f836e190000                   jae        0x7f63dbc04114
005a6 3b54246c                       cmp        edx, dword ptr [rsp + 0x6c]
005aa 0f8378190000                   jae        0x7f63dbc04128
005b0 478d1c16                       lea        r11d, [r14 + r10]
005b4 458bc2                         mov        r8d, r10d
005b7 4963d0                         movsxd     rdx, r8d
005ba 458bcb                         mov        r9d, r11d
005bd 4b8b740d0c                     mov        rsi, qword ptr [r13 + r9 + 0xc]
005c2 4d63db                         movsxd     r11, r11d
005c5 458bca                         mov        r9d, r10d
005c8 4b89740d0c                     mov        qword ptr [r13 + r9 + 0xc], rsi
005cd 4f8b5c1d14                     mov        r11, qword ptr [r13 + r11 + 0x14]
005d2 4d895c1514                     mov        qword ptr [r13 + rdx + 0x14], r11
005d7 4183c210                       add        r10d, 0x10
005db 443bd1                         cmp        r10d, ecx
005de 7cd0                           jl         0x7f63dbc027b0
005e0 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
005e5 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
005ed 7d45                           jge        0x7f63dbc02834
005ef 4d63da                         movsxd     r11, r10d
005f2 4c03df                         add        r11, rdi
005f5 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
005fd 0f8339190000                   jae        0x7f63dbc0413c
00603 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00608 0f8342190000                   jae        0x7f63dbc04150
0060e 90                             nop        
0060f 90                             nop        
00610 478d1c16                       lea        r11d, [r14 + r10]
00614 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00619 4f8b5c1d0c                     mov        r11, qword ptr [r13 + r11 + 0xc]
0061e 458bc2                         mov        r8d, r10d
00621 4f895c050c                     mov        qword ptr [r13 + r8 + 0xc], r11
00626 4183c208                       add        r10d, 8
0062a 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00632 7cdc                           jl         0x7f63dbc02810
00634 03dd                           add        ebx, ebp
00636 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
0063d 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
00644 ffc3                           inc        ebx
00646 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
0064a 0f8d67050000                   jge        0x7f63dbc02db7
00650 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00657 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0065f 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00666 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0066b 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
00672 4d8b5cdb10                     mov        r11, qword ptr [r11 + rbx*8 + 0x10]
00677 418bdb                         mov        ebx, r11d
0067a 81e3ffff0100                   and        ebx, 0x1ffff
00680 4d8bc3                         mov        r8, r11
00683 49c1e812                       shr        r8, 0x12
00687 49c1fb24                       sar        r11, 0x24
0068b 458bf0                         mov        r14d, r8d
0068e 458beb                         mov        r13d, r11d
00691 4181e6ffff0300                 and        r14d, 0x3ffff
00698 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0069d 4585ed                         test       r13d, r13d
006a0 0f8c52100000                   jl         0x7f63dbc038f8
006a6 85db                           test       ebx, ebx
006a8 0f858e000000                   jne        0x7f63dbc0293c
006ae 33db                           xor        ebx, ebx
006b0 4183fd03                       cmp        r13d, 3
006b4 0f8ec6000000                   jle        0x7f63dbc02980
006ba 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
006c2 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
006c6 45894314                       mov        dword ptr [r11 + 0x14], r8d
006ca 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
006ce 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
006d6 45895810                       mov        dword ptr [r8 + 0x10], r11d
006da 4183c5fd                       add        r13d, -3
006de 4589680c                       mov        dword ptr [r8 + 0xc], r13d
006e2 4963ed                         movsxd     rbp, r13d
006e5 4c63d8                         movsxd     r11, eax
006e8 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
006ed 4863d3                         movsxd     rdx, ebx
006f0 4c03da                         add        r11, rdx
006f3 493beb                         cmp        rbp, r11
006f6 0f8fa8100000                   jg         0x7f63dbc039a4
006fc 448d3418                       lea        r14d, [rax + rbx]
00700 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
00705 452bf5                         sub        r14d, r13d
00708 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0070d 4585c9                         test       r9d, r9d
00710 0f85b9fbffff                   jne        0x7f63dbc024cf
00716 4d63c6                         movsxd     r8, r14d
00719 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
0071e 0f8cbc120000                   jl         0x7f63dbc03be0
00724 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00729 0f8f69130000                   jg         0x7f63dbc03c98
0072f 4533c0                         xor        r8d, r8d
00732 4489442444                     mov        dword ptr [rsp + 0x44], r8d
00737 e9a5fbffff                     jmp        0x7f63dbc024e1
0073c 448b1c24                       mov        r11d, dword ptr [rsp]
00740 452bda                         sub        r11d, r10d
00743 413bdb                         cmp        ebx, r11d
00746 0f8e64ffffff                   jle        0x7f63dbc028b0
0074c be45ffffff                     mov        esi, 0xffffff45
00751 8beb                           mov        ebp, ebx
00753 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0075b 90                             nop        
0075c c5f877                         vzeroupper 
0075f e8fc7daeff                     call       0x7f63db6ea760
00764 0f1f84005c080001               nop        dword ptr [rax + rax + 0x100085c]
0076c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
00776 4883e4f0                       and        rsp, 0xfffffffffffffff0
0077a e881dfb218                     call       0x7f63f4730900
0077f f4                             hlt        
00780 85db                           test       ebx, ebx
00782 7403                           je         0x7f63dbc02987
00784 41ffcd                         dec        r13d
00787 4585ed                         test       r13d, r13d
0078a 750e                           jne        0x7f63dbc0299a
0078c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00794 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00798 eb6c                           jmp        0x7f63dbc02a06
0079a 4183fd03                       cmp        r13d, 3
0079e 0f8404220000                   je         0x7f63dbc04ba8
007a4 4183fd02                       cmp        r13d, 2
007a8 0f87ca220000                   ja         0x7f63dbc04c78
007ae 443b6c2404                     cmp        r13d, dword ptr [rsp + 4]
007b3 0f83e9190000                   jae        0x7f63dbc043a2
007b9 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
007c1 478b4cab0c                     mov        r9d, dword ptr [r11 + r13*4 + 0xc]
007c6 4585ed                         test       r13d, r13d
007c9 7e2f                           jle        0x7f63dbc029fa
007cb 458d5dff                       lea        r11d, [r13 - 1]
007cf 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
007d4 0f83fa200000                   jae        0x7f63dbc04ad4
007da 90                             nop        
007db 90                             nop        
007dc 90                             nop        
007dd 90                             nop        
007de 90                             nop        
007df 90                             nop        
007e0 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
007e8 478b44ab08                     mov        r8d, dword ptr [r11 + r13*4 + 8]
007ed 478944ab0c                     mov        dword ptr [r11 + r13*4 + 0xc], r8d
007f2 41ffcd                         dec        r13d
007f5 4585ed                         test       r13d, r13d
007f8 7fe6                           jg         0x7f63dbc029e0
007fa 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00802 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
00806 458be9                         mov        r13d, r9d
00809 e9d4feffff                     jmp        0x7f63dbc028e2
0080e 4183fd10                       cmp        r13d, 0x10
00812 0f8d90080000                   jge        0x7f63dbc032a8
00818 4183fd08                       cmp        r13d, 8
0081c 0f8d4d040000                   jge        0x7f63dbc02e6f
00822 4183fb10                       cmp        r11d, 0x10
00826 0f8f28010000                   jg         0x7f63dbc02b54
0082c 443b742410                     cmp        r14d, dword ptr [rsp + 0x10]
00831 0f83541a0000                   jae        0x7f63dbc0448b
00837 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0083c 430fbe6c300c                   movsx      ebp, byte ptr [r8 + r14 + 0xc]
00842 3b5c2410                       cmp        ebx, dword ptr [rsp + 0x10]
00846 0f83181b0000                   jae        0x7f63dbc04564
0084c 41886c180c                     mov        byte ptr [r8 + rbx + 0xc], bpl
00851 448d5301                       lea        r10d, [rbx + 1]
00855 458bc2                         mov        r8d, r10d
00858 458d5603                       lea        r10d, [r14 + 3]
0085c 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00861 0f83b51b0000                   jae        0x7f63dbc0461c
00867 4d63ce                         movsxd     r9, r14d
0086a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0086f 430fbe6c0a0d                   movsx      ebp, byte ptr [r10 + r9 + 0xd]
00875 448d5303                       lea        r10d, [rbx + 3]
00879 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
0087e 0f83681c0000                   jae        0x7f63dbc046ec
00884 4863cb                         movsxd     rcx, ebx
00887 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0088c 41886c0a0d                     mov        byte ptr [r10 + rcx + 0xd], bpl
00891 470fbe540a0e                   movsx      r10d, byte ptr [r10 + r9 + 0xe]
00897 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0089b 4488540f0e                     mov        byte ptr [rdi + rcx + 0xe], r10b
008a0 460fbe440f0f                   movsx      r8d, byte ptr [rdi + r9 + 0xf]
008a6 4488440f0f                     mov        byte ptr [rdi + rcx + 0xf], r8b
008ab 4183fd08                       cmp        r13d, 8
008af 0f83f31c0000                   jae        0x7f63dbc047a8
008b5 49baf0ef2fe300000000           movabs     r10, 0xe32feff0
008bf 470374aa0c                     add        r14d, dword ptr [r10 + r13*4 + 0xc]
008c4 4183fb04                       cmp        r11d, 4
008c8 7e36                           jle        0x7f63dbc02b00
008ca 448d5304                       lea        r10d, [rbx + 4]
008ce 418bca                         mov        ecx, r10d
008d1 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
008d6 0f83881d0000                   jae        0x7f63dbc04864
008dc 458bd6                         mov        r10d, r14d
008df 458bca                         mov        r9d, r10d
008e2 428b6c170c                     mov        ebp, dword ptr [rdi + r10 + 0xc]
008e7 448bd1                         mov        r10d, ecx
008ea 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
008ef 0f835b1e0000                   jae        0x7f63dbc04950
008f5 448bc3                         mov        r8d, ebx
008f8 4d63d0                         movsxd     r10, r8d
008fb 42896c1710                     mov        dword ptr [rdi + r10 + 0x10], ebp
00900 4183fb08                       cmp        r11d, 8
00904 0f8e33fdffff                   jle        0x7f63dbc0283d
0090a 448d5308                       lea        r10d, [rbx + 8]
0090e 458bca                         mov        r9d, r10d
00911 49ba20f02fe300000000           movabs     r10, 0xe32ff020
0091b 478b44aa0c                     mov        r8d, dword ptr [r10 + r13*4 + 0xc]
00920 452bf0                         sub        r14d, r8d
00923 418d6e08                       lea        ebp, [r14 + 8]
00927 3b6c246c                       cmp        ebp, dword ptr [rsp + 0x6c]
0092b 0f8317220000                   jae        0x7f63dbc04d48
00931 4d63d6                         movsxd     r10, r14d
00934 4a8b6c1714                     mov        rbp, qword ptr [rdi + r10 + 0x14]
00939 458bd1                         mov        r10d, r9d
0093c 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00941 0f83b5220000                   jae        0x7f63dbc04dfc
00947 4c63d3                         movsxd     r10, ebx
0094a 4a896c1714                     mov        qword ptr [rdi + r10 + 0x14], rbp
0094f e9e9fcffff                     jmp        0x7f63dbc0283d
00954 4585f6                         test       r14d, r14d
00957 0f8c3f230000                   jl         0x7f63dbc04e9c
0095d 85db                           test       ebx, ebx
0095f 0f8c37230000                   jl         0x7f63dbc04e9c
00965 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0096a 443bc3                         cmp        r8d, ebx
0096d 0f8229230000                   jb         0x7f63dbc04e9c
00973 468d142b                       lea        r10d, [rbx + r13]
00977 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0097c 443b44245c                     cmp        r8d, dword ptr [rsp + 0x5c]
00981 0f8215230000                   jb         0x7f63dbc04e9c
00987 4585ed                         test       r13d, r13d
0098a 0f8c0c230000                   jl         0x7f63dbc04e9c
00990 4585ed                         test       r13d, r13d
00993 0f8490f8ffff                   je         0x7f63dbc02429
00999 4883fd20                       cmp        rbp, 0x20
0099d 7728                           ja         0x7f63dbc02bc7
0099f 458bd5                         mov        r10d, r13d
009a2 4d63d2                         movsxd     r10, r10d
009a5 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
009ac c442a8f5c0                     bzhi       r8, r8, r10
009b1 c4c1fb92f8                     kmovq      k7, r8
009b6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009bc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009c2 e962f8ffff                     jmp        0x7f63dbc02429
009c7 488bd5                         mov        rdx, rbp
009ca c5f877                         vzeroupper 
009cd 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
009d7 41ffd2                         call       r10
009da 0f1f840000000000               nop        dword ptr [rax + rax]
009e2 e942f8ffff                     jmp        0x7f63dbc02429
009e7 83fb30                         cmp        ebx, 0x30
009ea 0f8e98000000                   jle        0x7f63dbc02c88
009f0 4585d2                         test       r10d, r10d
009f3 0f8cbb260000                   jl         0x7f63dbc052b4
009f9 85c0                           test       eax, eax
009fb 0f8cb3260000                   jl         0x7f63dbc052b4
00a01 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
00a09 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00a11 0f829d260000                   jb         0x7f63dbc052b4
00a17 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00a1c 443b44245c                     cmp        r8d, dword ptr [rsp + 0x5c]
00a21 0f828d260000                   jb         0x7f63dbc052b4
00a27 85db                           test       ebx, ebx
00a29 743a                           je         0x7f63dbc02c65
00a2b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a30 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
00a35 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00a3a 498d74030c                     lea        rsi, [r11 + rax + 0xc]
00a3f 4883fa20                       cmp        rdx, 0x20
00a43 7729                           ja         0x7f63dbc02c6e
00a45 4c63d3                         movsxd     r10, ebx
00a48 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a4f c442a8f5db                     bzhi       r11, r11, r10
00a54 c4c1fb92fb                     kmovq      k7, r11
00a59 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a5f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a65 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00a69 e9f5f8ffff                     jmp        0x7f63dbc02563
00a6e c5f877                         vzeroupper 
00a71 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00a7b 41ffd2                         call       r10
00a7e 0f1f840000000000               nop        dword ptr [rax + rax]
00a86 ebdd                           jmp        0x7f63dbc02c65
00a88 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00a8d 0f830d240000                   jae        0x7f63dbc050a0
00a93 4963ca                         movsxd     rcx, r10d
00a96 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a9b c4c17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xc]
00aa2 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
00aa9 0f8301250000                   jae        0x7f63dbc051b0
00aaf 4863f8                         movsxd     rdi, eax
00ab2 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00ab7 c4c17a7f44380c                 vmovdqu    xmmword ptr [r8 + rdi + 0xc], xmm0
00abe 448d5810                       lea        r11d, [rax + 0x10]
00ac2 418bd3                         mov        edx, r11d
00ac5 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00aca 0f8dad000000                   jge        0x7f63dbc02d7d
00ad0 482bcf                         sub        rcx, rdi
00ad3 4d63c3                         movsxd     r8, r11d
00ad6 48637c2414                     movsxd     rdi, dword ptr [rsp + 0x14]
00adb 4883c7f1                       add        rdi, -0xf
00adf 4d8d1c08                       lea        r11, [r8 + rcx]
00ae3 4c3bdf                         cmp        r11, rdi
00ae6 0f83ac260000                   jae        0x7f63dbc05398
00aec 4c635c245c                     movsxd     r11, dword ptr [rsp + 0x5c]
00af1 4d2bd8                         sub        r11, r8
00af4 4983c30f                       add        r11, 0xf
00af8 4983e3f0                       and        r11, 0xfffffffffffffff0
00afc 458bc3                         mov        r8d, r11d
00aff 458d5c0010                     lea        r11d, [r8 + rax + 0x10]
00b04 4d63db                         movsxd     r11, r11d
00b07 4d8d440bf0                     lea        r8, [r11 + rcx - 0x10]
00b0c 4c3bc7                         cmp        r8, rdi
00b0f 0f8383260000                   jae        0x7f63dbc05398
00b15 3b942484000000                 cmp        edx, dword ptr [rsp + 0x84]
00b1c 0f8376260000                   jae        0x7f63dbc05398
00b22 4983c3f0                       add        r11, -0x10
00b26 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00b2e 0f8364260000                   jae        0x7f63dbc05398
00b34 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b39 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00b40 0f8f22270000                   jg         0x7f63dbc05468
00b46 418bca                         mov        ecx, r10d
00b49 2bc8                           sub        ecx, eax
00b4b 90                             nop        
00b4c 90                             nop        
00b4d 90                             nop        
00b4e 90                             nop        
00b4f 90                             nop        
00b50 448d1c11                       lea        r11d, [rcx + rdx]
00b54 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00b59 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00b60 448bc2                         mov        r8d, edx
00b63 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b68 c4817a7f44010c                 vmovdqu    xmmword ptr [r9 + r8 + 0xc], xmm0
00b6f 448d4210                       lea        r8d, [rdx + 0x10]
00b73 418bd0                         mov        edx, r8d
00b76 443b44245c                     cmp        r8d, dword ptr [rsp + 0x5c]
00b7b 7cd3                           jl         0x7f63dbc02d50
00b7d 468d1c13                       lea        r11d, [rbx + r10]
00b81 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00b85 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00b8d e9d1f7ffff                     jmp        0x7f63dbc02563
00b92 4c63d5                         movsxd     r10, ebp
00b95 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b9c c442a8f5db                     bzhi       r11, r11, r10
00ba1 c4c1fb92fb                     kmovq      k7, r11
00ba6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bac 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bb2 e99e000000                     jmp        0x7f63dbc02e55
00bb7 8b2c24                         mov        ebp, dword ptr [rsp]
00bba 2bac2498000000                 sub        ebp, dword ptr [rsp + 0x98]
00bc1 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00bc9 4585c0                         test       r8d, r8d
00bcc 0f8c6e220000                   jl         0x7f63dbc05040
00bd2 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
00bd7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bdc 8bb424d4000000                 mov        esi, dword ptr [rsp + 0xd4]
00be3 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
00be8 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00bf0 4585d2                         test       r10d, r10d
00bf3 0f8c5e220000                   jl         0x7f63dbc05057
00bf9 3b3424                         cmp        esi, dword ptr [rsp]
00bfc 0f8255220000                   jb         0x7f63dbc05057
00c02 418b4e08                       mov        ecx, dword ptr [r14 + 8]
00c06 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00c0d 03dd                           add        ebx, ebp
00c0f 3bcb                           cmp        ecx, ebx
00c11 0f8240220000                   jb         0x7f63dbc05057
00c17 85ed                           test       ebp, ebp
00c19 0f8c38220000                   jl         0x7f63dbc05057
00c1f 85ed                           test       ebp, ebp
00c21 7432                           je         0x7f63dbc02e55
00c23 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00c28 4d8bde                         mov        r11, r14
00c2b 4b8d74160c                     lea        rsi, [r14 + r10 + 0xc]
00c30 4863d5                         movsxd     rdx, ebp
00c33 4883fa20                       cmp        rdx, 0x20
00c37 0f8655ffffff                   jbe        0x7f63dbc02d92
00c3d c5f877                         vzeroupper 
00c40 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00c4a 41ffd2                         call       r10
00c4d 0f1f840000000000               nop        dword ptr [rax + rax]
00c55 41895d3c                       mov        dword ptr [r13 + 0x3c], ebx
00c59 c5f877                         vzeroupper 
00c5c 4881c4c0000000                 add        rsp, 0xc0
00c63 5d                             pop        rbp
00c64 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c68 0f872a2e0000                   ja         0x7f63dbc05c98
00c6e c3                             ret        
00c6f 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
00c74 0f83be260000                   jae        0x7f63dbc05538
00c7a 458bd6                         mov        r10d, r14d
00c7d 418bc2                         mov        eax, r10d
00c80 4963d2                         movsxd     rdx, r10d
00c83 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00c88 4d8b54150c                     mov        r10, qword ptr [r13 + rdx + 0xc]
00c8d 498bca                         mov        rcx, r10
00c90 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
00c94 0f8372270000                   jae        0x7f63dbc0560c
00c9a 448bdb                         mov        r11d, ebx
00c9d 458d5308                       lea        r10d, [r11 + 8]
00ca1 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00ca6 4d63c3                         movsxd     r8, r11d
00ca9 4c8bd1                         mov        r10, rcx
00cac 4f8954050c                     mov        qword ptr [r13 + r8 + 0xc], r10
00cb1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00cb6 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00cbe 0f8d79f9ffff                   jge        0x7f63dbc0283d
00cc4 492bd0                         sub        rdx, r8
00cc7 4963fa                         movsxd     rdi, r10d
00cca 4c8d0417                       lea        r8, [rdi + rdx]
00cce 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00cd6 0f83f4270000                   jae        0x7f63dbc056d0
00cdc 4d8bc1                         mov        r8, r9
00cdf 4c2bc7                         sub        r8, rdi
00ce2 4983c007                       add        r8, 7
00ce6 4983e0f8                       and        r8, 0xfffffffffffffff8
00cea 458bc0                         mov        r8d, r8d
00ced 478d441808                     lea        r8d, [r8 + r11 + 8]
00cf2 4d63c0                         movsxd     r8, r8d
00cf5 498d4c10f8                     lea        rcx, [r8 + rdx - 8]
00cfa 483b8c2490000000               cmp        rcx, qword ptr [rsp + 0x90]
00d02 0f83c8270000                   jae        0x7f63dbc056d0
00d08 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00d0d 0f83bd270000                   jae        0x7f63dbc056d0
00d13 4983c0f8                       add        r8, -8
00d17 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00d1f 0f83ab270000                   jae        0x7f63dbc056d0
00d25 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00d2d 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00d34 0f8f4e280000                   jg         0x7f63dbc05788
00d3a 448bd0                         mov        r10d, eax
00d3d 452bd3                         sub        r10d, r11d
00d40 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00d48 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00d4d 418bcd                         mov        ecx, r13d
00d50 41baf4ffffff                   mov        r10d, 0xfffffff4
00d56 442bd1                         sub        r10d, ecx
00d59 452bd3                         sub        r10d, r11d
00d5c 4183c310                       add        r11d, 0x10
00d60 4183c2f0                       add        r10d, -0x10
00d64 4c8b6c2418                     mov        r13, qword ptr [rsp + 0x18]
00d69 498bf5                         mov        rsi, r13
00d6c 4d8d41c8                       lea        r8, [r9 - 0x38]
00d70 4981f800000080                 cmp        r8, -0x80000000
00d77 48c7c100000080                 mov        rcx, 0xffffffff80000000
00d7e 4c0f4cc1                       cmovl      r8, rcx
00d82 458bc0                         mov        r8d, r8d
00d85 442bf3                         sub        r14d, ebx
00d88 4963db                         movsxd     rbx, r11d
00d8b b906000000                     mov        ecx, 6
00d90 c442f0f5d2                     bzhi       r10, r10, rcx
00d95 4903da                         add        rbx, r10
00d98 493bd9                         cmp        rbx, r9
00d9b 498bc1                         mov        rax, r9
00d9e 480f4cc3                       cmovl      rax, rbx
00da2 4c8bd0                         mov        r10, rax
00da5 4c2bd7                         sub        r10, rdi
00da8 498d4aff                       lea        rcx, [r10 - 1]
00dac 48c1f93f                       sar        rcx, 0x3f
00db0 48c1e93d                       shr        rcx, 0x3d
00db4 4e8d5411ff                     lea        r10, [rcx + r10 - 1]
00db9 4983e2f8                       and        r10, 0xfffffffffffffff8
00dbd 4c03d7                         add        r10, rdi
00dc0 493bfa                         cmp        rdi, r10
00dc3 490f4cfa                       cmovl      rdi, r10
00dc7 8bcf                           mov        ecx, edi
00dc9 458d540e08                     lea        r10d, [r14 + rcx + 8]
00dce 83c108                         add        ecx, 8
00dd1 4963da                         movsxd     rbx, r10d
00dd4 4803de                         add        rbx, rsi
00dd7 4863f9                         movsxd     rdi, ecx
00dda 4803fe                         add        rdi, rsi
00ddd 4c8d530c                       lea        r10, [rbx + 0xc]
00de1 4883c34c                       add        rbx, 0x4c
00de5 488d774c                       lea        rsi, [rdi + 0x4c]
00de9 33c9                           xor        ecx, ecx
00deb 493bf2                         cmp        rsi, r10
00dee 0f96c1                         setbe      cl
00df1 4883c70c                       add        rdi, 0xc
00df5 4533d2                         xor        r10d, r10d
00df8 483bdf                         cmp        rbx, rdi
00dfb 410f96c2                       setbe      r10b
00dff 410bca                         or         ecx, r10d
00e02 0f8440120000                   je         0x7f63dbc04248
00e08 448bd8                         mov        r11d, eax
00e0b eb07                           jmp        0x7f63dbc03014
00e0d 90                             nop        
00e0e 90                             nop        
00e0f 90                             nop        
00e10 897c2440                       mov        dword ptr [rsp + 0x40], edi
00e14 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
00e1c 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00e21 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00e26 4f8b54150c                     mov        r10, qword ptr [r13 + r10 + 0xc]
00e2b 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
00e2f 4d89540d0c                     mov        qword ptr [r13 + rcx + 0xc], r10
00e34 8b7c2440                       mov        edi, dword ptr [rsp + 0x40]
00e38 83c708                         add        edi, 8
00e3b 413bfb                         cmp        edi, r11d
00e3e 7cd0                           jl         0x7f63dbc03010
00e40 4981c108feffff                 add        r9, -0x1f8
00e47 4981f900000080                 cmp        r9, -0x80000000
00e4e 49c7c200000080                 mov        r10, 0xffffffff80000000
00e55 4d0f4cca                       cmovl      r9, r10
00e59 418bd9                         mov        ebx, r9d
00e5c 3bfb                           cmp        edi, ebx
00e5e 0f8dcc270000                   jge        0x7f63dbc05830
00e64 4c63d7                         movsxd     r10, edi
00e67 4c03d2                         add        r10, rdx
00e6a 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00e72 0f83c0270000                   jae        0x7f63dbc05838
00e78 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00e7d 4181c200020000                 add        r10d, 0x200
00e84 4d63da                         movsxd     r11, r10d
00e87 4c03da                         add        r11, rdx
00e8a 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00e92 0f83b4270000                   jae        0x7f63dbc0584c
00e98 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
00e9c 0f83be270000                   jae        0x7f63dbc05860
00ea2 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00ea7 0f83c7270000                   jae        0x7f63dbc05874
00ead 8b742460                       mov        esi, dword ptr [rsp + 0x60]
00eb1 eb10                           jmp        0x7f63dbc030c3
00eb3 90                             nop        
00eb4 90                             nop        
00eb5 90                             nop        
00eb6 90                             nop        
00eb7 90                             nop        
00eb8 90                             nop        
00eb9 90                             nop        
00eba 90                             nop        
00ebb 90                             nop        
00ebc 90                             nop        
00ebd 90                             nop        
00ebe 90                             nop        
00ebf 90                             nop        
00ec0 418bfa                         mov        edi, r10d
00ec3 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
00ecb 4403d7                         add        r10d, edi
00ece 448d9f00010000                 lea        r11d, [rdi + 0x100]
00ed5 44039c24d0000000               add        r11d, dword ptr [rsp + 0xd0]
00edd 418bca                         mov        ecx, r10d
00ee0 62f17e486f840e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0xc]
00eeb 4963ca                         movsxd     rcx, r10d
00eee 458bd3                         mov        r10d, r11d
00ef1 4963c3                         movsxd     rax, r11d
00ef4 448bdf                         mov        r11d, edi
00ef7 62b17e487f841e0c000000         vmovdqu32  zmmword ptr [rsi + r11 + 0xc], zmm0
00f02 448bcf                         mov        r9d, edi
00f05 4963e9                         movsxd     rbp, r9d
00f08 448d5f40                       lea        r11d, [rdi + 0x40]
00f0c 44039c24d0000000               add        r11d, dword ptr [rsp + 0xd0]
00f14 62b17e486f841e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc]
00f1f 62f17e487f842e4c000000         vmovdqu32  zmmword ptr [rsi + rbp + 0x4c], zmm0
00f2a 448d8f80000000                 lea        r9d, [rdi + 0x80]
00f31 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
00f39 62b17e486f840e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0xc]
00f44 62f17e487f842e8c000000         vmovdqu32  zmmword ptr [rsi + rbp + 0x8c], zmm0
00f4f 62f17e486f840ecc000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0xcc]
00f5a 62f17e487f842ecc000000         vmovdqu32  zmmword ptr [rsi + rbp + 0xcc], zmm0
00f65 62b17e486f84160c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0xc]
00f70 62f17e487f842e0c010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x10c], zmm0
00f7b 62f17e486f840e4c010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x14c]
00f86 62f17e487f842e4c010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x14c], zmm0
00f91 62f17e486f840e8c010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x18c]
00f9c 62f17e487f842e8c010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x18c], zmm0
00fa7 62f17e486f8406cc000000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0xcc]
00fb2 62f17e487f842ecc010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x1cc], zmm0
00fbd 448d9700020000                 lea        r10d, [rdi + 0x200]
00fc4 443bd3                         cmp        r10d, ebx
00fc7 0f8cf3feffff                   jl         0x7f63dbc030c0
00fcd 453bd0                         cmp        r10d, r8d
00fd0 7d59                           jge        0x7f63dbc0322b
00fd2 81c738020000                   add        edi, 0x238
00fd8 4c63df                         movsxd     r11, edi
00fdb 4c03da                         add        r11, rdx
00fde 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00fe6 0f83b0260000                   jae        0x7f63dbc0589c
00fec 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
00ff0 0f83ce260000                   jae        0x7f63dbc058c4
00ff6 8bde                           mov        ebx, esi
00ff8 448b8c24d0000000               mov        r9d, dword ptr [rsp + 0xd0]
01000 4503ca                         add        r9d, r10d
01003 62b17e486f840b0c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r9 + 0xc]
0100e 458bda                         mov        r11d, r10d
01011 62b17e487f841b0c000000         vmovdqu32  zmmword ptr [rbx + r11 + 0xc], zmm0
0101c 4183c240                       add        r10d, 0x40
01020 453bd0                         cmp        r10d, r8d
01023 7cd3                           jl         0x7f63dbc031f8
01025 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01029 eb04                           jmp        0x7f63dbc0322f
0102b 89742460                       mov        dword ptr [rsp + 0x60], esi
0102f 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01037 0f8d00f6ffff                   jge        0x7f63dbc0283d
0103d 4d63da                         movsxd     r11, r10d
01040 4c03da                         add        r11, rdx
01043 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
0104b 0f8337260000                   jae        0x7f63dbc05888
01051 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
01056 0f8354260000                   jae        0x7f63dbc058b0
0105c 448b8424d0000000               mov        r8d, dword ptr [rsp + 0xd0]
01064 4503c2                         add        r8d, r10d
01067 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0106b 4e8b44030c                     mov        r8, qword ptr [rbx + r8 + 0xc]
01070 458bda                         mov        r11d, r10d
01073 4e89441b0c                     mov        qword ptr [rbx + r11 + 0xc], r8
01078 4183c208                       add        r10d, 8
0107c 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01084 7cd6                           jl         0x7f63dbc0325c
01086 e9b2f5ffff                     jmp        0x7f63dbc0283d
0108b 4d03da                         add        r11, r10
0108e 4c3bd9                         cmp        r11, rcx
01091 7e08                           jle        0x7f63dbc0329b
01093 4533c9                         xor        r9d, r9d
01096 e903f0ffff                     jmp        0x7f63dbc0229e
0109b 4533c9                         xor        r9d, r9d
0109e bb01000000                     mov        ebx, 1
010a3 e9f8efffff                     jmp        0x7f63dbc022a0
010a8 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
010b0 0f8322260000                   jae        0x7f63dbc058d8
010b6 4963ce                         movsxd     rcx, r14d
010b9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
010be c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
010c5 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
010cc 0f83b6260000                   jae        0x7f63dbc05988
010d2 8d6b10                         lea        ebp, [rbx + 0x10]
010d5 4c63d3                         movsxd     r10, ebx
010d8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
010dd c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
010e4 413be8                         cmp        ebp, r8d
010e7 0f8d50f5ffff                   jge        0x7f63dbc0283d
010ed 492bca                         sub        rcx, r10
010f0 4c63dd                         movsxd     r11, ebp
010f3 4d8d140b                       lea        r10, [r11 + rcx]
010f7 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
010ff 0f834b270000                   jae        0x7f63dbc05a50
01105 4d8bd1                         mov        r10, r9
01108 4d2bd3                         sub        r10, r11
0110b 4983c20f                       add        r10, 0xf
0110f 4983e2f0                       and        r10, 0xfffffffffffffff0
01113 458bd2                         mov        r10d, r10d
01116 458d5c1a10                     lea        r11d, [r10 + rbx + 0x10]
0111b 4d63d3                         movsxd     r10, r11d
0111e 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
01123 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0112b 0f831f270000                   jae        0x7f63dbc05a50
01131 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
01138 0f8312270000                   jae        0x7f63dbc05a50
0113e 4983c2f0                       add        r10, -0x10
01142 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
0114a 0f8300270000                   jae        0x7f63dbc05a50
01150 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
01157 0f8f6f270000                   jg         0x7f63dbc05acc
0115d 442bf3                         sub        r14d, ebx
01160 83c320                         add        ebx, 0x20
01163 eb06                           jmp        0x7f63dbc0336b
01165 90                             nop        
01166 90                             nop        
01167 90                             nop        
01168 418bea                         mov        ebp, r10d
0116b 458d142e                       lea        r10d, [r14 + rbp]
0116f 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
01174 c4817a6f44150c                 vmovdqu    xmm0, xmmword ptr [r13 + r10 + 0xc]
0117b 448bd5                         mov        r10d, ebp
0117e c4817a7f44150c                 vmovdqu    xmmword ptr [r13 + r10 + 0xc], xmm0
01185 448d5510                       lea        r10d, [rbp + 0x10]
01189 443bd3                         cmp        r10d, ebx
0118c 7cda                           jl         0x7f63dbc03368
0118e 4981c110ffffff                 add        r9, -0xf0
01195 4981f900000080                 cmp        r9, -0x80000000
0119c 49c7c300000080                 mov        r11, 0xffffffff80000000
011a3 4d0f4ccb                       cmovl      r9, r11
011a7 418bd9                         mov        ebx, r9d
011aa 443bd3                         cmp        r10d, ebx
011ad 0f8d74010000                   jge        0x7f63dbc03527
011b3 4d63da                         movsxd     r11, r10d
011b6 4c03d9                         add        r11, rcx
011b9 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
011c1 0f8381270000                   jae        0x7f63dbc05b48
011c7 81c500010000                   add        ebp, 0x100
011cd 4c63dd                         movsxd     r11, ebp
011d0 4c03d9                         add        r11, rcx
011d3 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
011db 0f837b270000                   jae        0x7f63dbc05b5c
011e1 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
011e9 0f8381270000                   jae        0x7f63dbc05b70
011ef 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
011f6 0f8388270000                   jae        0x7f63dbc05b84
011fc 8b742460                       mov        esi, dword ptr [rsp + 0x60]
01200 478d0416                       lea        r8d, [r14 + r10]
01204 458bda                         mov        r11d, r10d
01207 4d63cb                         movsxd     r9, r11d
0120a 418bf8                         mov        edi, r8d
0120d c5fa6f443e0c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xc]
01213 4963f8                         movsxd     rdi, r8d
01216 458bc2                         mov        r8d, r10d
01219 c4a17a7f44060c                 vmovdqu    xmmword ptr [rsi + r8 + 0xc], xmm0
01220 c5fa6f443e1c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x1c]
01226 c4a17a7f440e1c                 vmovdqu    xmmword ptr [rsi + r9 + 0x1c], xmm0
0122d c5fa6f443e2c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x2c]
01233 c4a17a7f440e2c                 vmovdqu    xmmword ptr [rsi + r9 + 0x2c], xmm0
0123a c5fa6f443e3c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x3c]
01240 c4a17a7f440e3c                 vmovdqu    xmmword ptr [rsi + r9 + 0x3c], xmm0
01247 c5fa6f443e4c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x4c]
0124d c4a17a7f440e4c                 vmovdqu    xmmword ptr [rsi + r9 + 0x4c], xmm0
01254 c5fa6f443e5c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x5c]
0125a c4a17a7f440e5c                 vmovdqu    xmmword ptr [rsi + r9 + 0x5c], xmm0
01261 c5fa6f443e6c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x6c]
01267 c4a17a7f440e6c                 vmovdqu    xmmword ptr [rsi + r9 + 0x6c], xmm0
0126e c5fa6f443e7c                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x7c]
01274 c4a17a7f440e7c                 vmovdqu    xmmword ptr [rsi + r9 + 0x7c], xmm0
0127b c5fa6f843e8c000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x8c]
01284 c4a17a7f840e8c000000           vmovdqu    xmmword ptr [rsi + r9 + 0x8c], xmm0
0128e c5fa6f843e9c000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x9c]
01297 c4a17a7f840e9c000000           vmovdqu    xmmword ptr [rsi + r9 + 0x9c], xmm0
012a1 c5fa6f843eac000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xac]
012aa c4a17a7f840eac000000           vmovdqu    xmmword ptr [rsi + r9 + 0xac], xmm0
012b4 c5fa6f843ebc000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xbc]
012bd c4a17a7f840ebc000000           vmovdqu    xmmword ptr [rsi + r9 + 0xbc], xmm0
012c7 c5fa6f843ecc000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xcc]
012d0 c4a17a7f840ecc000000           vmovdqu    xmmword ptr [rsi + r9 + 0xcc], xmm0
012da c5fa6f843edc000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xdc]
012e3 c4a17a7f840edc000000           vmovdqu    xmmword ptr [rsi + r9 + 0xdc], xmm0
012ed c5fa6f843eec000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xec]
012f6 c4a17a7f840eec000000           vmovdqu    xmmword ptr [rsi + r9 + 0xec], xmm0
01300 c5fa6f843efc000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xfc]
01309 c4a17a7f840efc000000           vmovdqu    xmmword ptr [rsi + r9 + 0xfc], xmm0
01313 4181c200010000                 add        r10d, 0x100
0131a 443bd3                         cmp        r10d, ebx
0131d 0f8cddfeffff                   jl         0x7f63dbc03400
01323 89742460                       mov        dword ptr [rsp + 0x60], esi
01327 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
0132f 0f8d08f3ffff                   jge        0x7f63dbc0283d
01335 4d63da                         movsxd     r11, r10d
01338 4c03d9                         add        r11, rcx
0133b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
01343 0f834f260000                   jae        0x7f63dbc05b98
01349 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
01351 0f8355260000                   jae        0x7f63dbc05bac
01357 90                             nop        
01358 478d1c16                       lea        r11d, [r14 + r10]
0135c 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01360 c4a17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc]
01367 458bc2                         mov        r8d, r10d
0136a c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
01371 4183c210                       add        r10d, 0x10
01375 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
0137d 7cd9                           jl         0x7f63dbc03558
0137f e9b9f2ffff                     jmp        0x7f63dbc0283d
01384 bee4ffffff                     mov        esi, 0xffffffe4
01389 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0138e 448b1c24                       mov        r11d, dword ptr [rsp]
01392 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0139a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0139f 4c891c24                       mov        qword ptr [rsp], r11
013a3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
013a8 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
013b0 48894424f8                     mov        qword ptr [rsp - 8], rax
013b5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013b9 89442408                       mov        dword ptr [rsp + 8], eax
013bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c2 8944240c                       mov        dword ptr [rsp + 0xc], eax
013c6 48ff742420                     push       qword ptr [rsp + 0x20]
013cb 488f442418                     pop        qword ptr [rsp + 0x18]
013d0 48894424f8                     mov        qword ptr [rsp - 8], rax
013d5 8b442444                       mov        eax, dword ptr [rsp + 0x44]
013d9 89442414                       mov        dword ptr [rsp + 0x14], eax
013dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e2 48ff742428                     push       qword ptr [rsp + 0x28]
013e7 488f442420                     pop        qword ptr [rsp + 0x20]
013ec 48ff742430                     push       qword ptr [rsp + 0x30]
013f1 488f442428                     pop        qword ptr [rsp + 0x28]
013f6 48894424f8                     mov        qword ptr [rsp - 8], rax
013fb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
013ff 89442430                       mov        dword ptr [rsp + 0x30], eax
01403 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01408 48894424f8                     mov        qword ptr [rsp - 8], rax
0140d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01411 89442434                       mov        dword ptr [rsp + 0x34], eax
01415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141a 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0141e 48894424f8                     mov        qword ptr [rsp - 8], rax
01423 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01427 89442440                       mov        dword ptr [rsp + 0x40], eax
0142b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01430 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01435 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0143a 48894424f8                     mov        qword ptr [rsp - 8], rax
0143f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01443 89442454                       mov        dword ptr [rsp + 0x54], eax
01447 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144c c5f877                         vzeroupper 
0144f e80c71aeff                     call       0x7f63db6ea760
01454 0f1f84004c150002               nop        dword ptr [rax + rax + 0x200154c]
0145c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0146a e891d2b218                     call       0x7f63f4730900
0146f f4                             hlt        
01470 bee4ffffff                     mov        esi, 0xffffffe4
01475 498beb                         mov        rbp, r11
01478 448b0424                       mov        r8d, dword ptr [rsp]
0147c 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01484 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01489 4c891c24                       mov        qword ptr [rsp], r11
0148d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01492 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0149a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0149f 48ff742420                     push       qword ptr [rsp + 0x20]
014a4 488f442418                     pop        qword ptr [rsp + 0x18]
014a9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014b2 89442414                       mov        dword ptr [rsp + 0x14], eax
014b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bb 48ff742428                     push       qword ptr [rsp + 0x28]
014c0 488f442420                     pop        qword ptr [rsp + 0x20]
014c5 48ff742430                     push       qword ptr [rsp + 0x30]
014ca 488f442428                     pop        qword ptr [rsp + 0x28]
014cf 48894424f8                     mov        qword ptr [rsp - 8], rax
014d4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014d8 89442430                       mov        dword ptr [rsp + 0x30], eax
014dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e1 48894424f8                     mov        qword ptr [rsp - 8], rax
014e6 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
014ea 89442434                       mov        dword ptr [rsp + 0x34], eax
014ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
014f7 48894424f8                     mov        qword ptr [rsp - 8], rax
014fc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01500 89442440                       mov        dword ptr [rsp + 0x40], eax
01504 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01509 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0150e 48894424f8                     mov        qword ptr [rsp - 8], rax
01513 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01517 89442448                       mov        dword ptr [rsp + 0x48], eax
0151b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01520 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01524 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0152a 90                             nop        
0152b 90                             nop        
0152c c5f877                         vzeroupper 
0152f e82c70aeff                     call       0x7f63db6ea760
01534 0f1f84002c160003               nop        dword ptr [rax + rax + 0x300162c]
0153c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01546 4883e4f0                       and        rsp, 0xfffffffffffffff0
0154a e8b1d1b218                     call       0x7f63f4730900
0154f f4                             hlt        
01550 458bcb                         mov        r9d, r11d
01553 bee4ffffff                     mov        esi, 0xffffffe4
01558 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0155d 448b1424                       mov        r10d, dword ptr [rsp]
01561 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01569 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0156e 4c891424                       mov        qword ptr [rsp], r10
01572 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01577 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0157f 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01583 48ff742420                     push       qword ptr [rsp + 0x20]
01588 488f442418                     pop        qword ptr [rsp + 0x18]
0158d 48894424f8                     mov        qword ptr [rsp - 8], rax
01592 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01596 89442414                       mov        dword ptr [rsp + 0x14], eax
0159a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159f 48ff742428                     push       qword ptr [rsp + 0x28]
015a4 488f442420                     pop        qword ptr [rsp + 0x20]
015a9 48ff742430                     push       qword ptr [rsp + 0x30]
015ae 488f442428                     pop        qword ptr [rsp + 0x28]
015b3 48894424f8                     mov        qword ptr [rsp - 8], rax
015b8 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
015bc 89442434                       mov        dword ptr [rsp + 0x34], eax
015c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c5 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
015ca 4489742444                     mov        dword ptr [rsp + 0x44], r14d
015cf 90                             nop        
015d0 c5f877                         vzeroupper 
015d3 e8886faeff                     call       0x7f63db6ea760
015d8 0f1f8400d0160004               nop        dword ptr [rax + rax + 0x40016d0]
015e0 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
015ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ee e80dd1b218                     call       0x7f63f4730900
015f3 f4                             hlt        
015f4 bee4ffffff                     mov        esi, 0xffffffe4
015f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015fe 448b1424                       mov        r10d, dword ptr [rsp]
01602 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0160a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0160f 4c891424                       mov        qword ptr [rsp], r10
01613 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01618 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01620 48ff742420                     push       qword ptr [rsp + 0x20]
01625 488f442418                     pop        qword ptr [rsp + 0x18]
0162a 48894424f8                     mov        qword ptr [rsp - 8], rax
0162f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01633 89442414                       mov        dword ptr [rsp + 0x14], eax
01637 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163c 48ff742428                     push       qword ptr [rsp + 0x28]
01641 488f442420                     pop        qword ptr [rsp + 0x20]
01646 48ff742430                     push       qword ptr [rsp + 0x30]
0164b 488f442428                     pop        qword ptr [rsp + 0x28]
01650 48894424f8                     mov        qword ptr [rsp - 8], rax
01655 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01659 89442430                       mov        dword ptr [rsp + 0x30], eax
0165d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01662 48894424f8                     mov        qword ptr [rsp - 8], rax
01667 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0166b 89442434                       mov        dword ptr [rsp + 0x34], eax
0166f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01674 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01679 48894424f8                     mov        qword ptr [rsp - 8], rax
0167e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01682 89442440                       mov        dword ptr [rsp + 0x40], eax
01686 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0168f c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01695 90                             nop        
01696 90                             nop        
01697 90                             nop        
01698 c5f877                         vzeroupper 
0169b e8c06eaeff                     call       0x7f63db6ea760
016a0 0f1f840098170005               nop        dword ptr [rax + rax + 0x5001798]
016a8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
016b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016b6 e845d0b218                     call       0x7f63f4730900
016bb f4                             hlt        
016bc be45ffffff                     mov        esi, 0xffffff45
016c1 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
016c9 4489ac24d8000000               mov        dword ptr [rsp + 0xd8], r13d
016d1 90                             nop        
016d2 90                             nop        
016d3 90                             nop        
016d4 c5f877                         vzeroupper 
016d7 e8846eaeff                     call       0x7f63db6ea760
016dc 0f1f8400d4170006               nop        dword ptr [rax + rax + 0x60017d4]
016e4 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
016ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
016f2 e809d0b218                     call       0x7f63f4730900
016f7 f4                             hlt        
016f8 be45ffffff                     mov        esi, 0xffffff45
016fd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01702 448b1c24                       mov        r11d, dword ptr [rsp]
01706 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0170e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01713 4c891c24                       mov        qword ptr [rsp], r11
01717 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0171c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01724 8944240c                       mov        dword ptr [rsp + 0xc], eax
01728 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0172d 48ff742420                     push       qword ptr [rsp + 0x20]
01732 488f442418                     pop        qword ptr [rsp + 0x18]
01737 48894424f8                     mov        qword ptr [rsp - 8], rax
0173c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01740 89442414                       mov        dword ptr [rsp + 0x14], eax
01744 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01749 48ff742428                     push       qword ptr [rsp + 0x28]
0174e 488f442420                     pop        qword ptr [rsp + 0x20]
01753 48ff742430                     push       qword ptr [rsp + 0x30]
01758 488f442428                     pop        qword ptr [rsp + 0x28]
0175d 48894424f8                     mov        qword ptr [rsp - 8], rax
01762 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01766 89442434                       mov        dword ptr [rsp + 0x34], eax
0176a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01773 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01778 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0177d 90                             nop        
0177e 90                             nop        
0177f 90                             nop        
01780 c5f877                         vzeroupper 
01783 e8d86daeff                     call       0x7f63db6ea760
01788 0f1f840080180007               nop        dword ptr [rax + rax + 0x7001880]
01790 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0179a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179e e85dcfb218                     call       0x7f63f4730900
017a3 f4                             hlt        
017a4 493beb                         cmp        rbp, r11
017a7 bdffffffff                     mov        ebp, 0xffffffff
017ac 7c08                           jl         0x7f63dbc039b6
017ae 400f95c5                       setne      bpl
017b2 400fb6ed                       movzx      ebp, bpl
017b6 be45ffffff                     mov        esi, 0xffffff45
017bb 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
017c0 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
017c8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
017cd 44894c2404                     mov        dword ptr [rsp + 4], r9d
017d2 48894424f8                     mov        qword ptr [rsp - 8], rax
017d7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017db 89442410                       mov        dword ptr [rsp + 0x10], eax
017df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e4 89442414                       mov        dword ptr [rsp + 0x14], eax
017e8 4489542418                     mov        dword ptr [rsp + 0x18], r10d
017ed 48894424f8                     mov        qword ptr [rsp - 8], rax
017f2 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
017f6 8944241c                       mov        dword ptr [rsp + 0x1c], eax
017fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01804 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01808 89442438                       mov        dword ptr [rsp + 0x38], eax
0180c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01811 48894424f8                     mov        qword ptr [rsp - 8], rax
01816 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0181a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0181e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01823 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01827 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0182c 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01831 90                             nop        
01832 90                             nop        
01833 90                             nop        
01834 c5f877                         vzeroupper 
01837 e8246daeff                     call       0x7f63db6ea760
0183c 0f1f840034190008               nop        dword ptr [rax + rax + 0x8001934]
01844 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0184e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01852 e8a9ceb218                     call       0x7f63f4730900
01857 f4                             hlt        
01858 be45ffffff                     mov        esi, 0xffffff45
0185d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01862 448b0424                       mov        r8d, dword ptr [rsp]
01866 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0186e 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01873 4c890424                       mov        qword ptr [rsp], r8
01877 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0187c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01884 48894424f8                     mov        qword ptr [rsp - 8], rax
01889 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0188d 89442408                       mov        dword ptr [rsp + 8], eax
01891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01896 8944240c                       mov        dword ptr [rsp + 0xc], eax
0189a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0189f 48ff742420                     push       qword ptr [rsp + 0x20]
018a4 488f442418                     pop        qword ptr [rsp + 0x18]
018a9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ae 8b442444                       mov        eax, dword ptr [rsp + 0x44]
018b2 89442414                       mov        dword ptr [rsp + 0x14], eax
018b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bb 48ff742428                     push       qword ptr [rsp + 0x28]
018c0 488f442420                     pop        qword ptr [rsp + 0x20]
018c5 48ff742430                     push       qword ptr [rsp + 0x30]
018ca 488f442428                     pop        qword ptr [rsp + 0x28]
018cf 48894424f8                     mov        qword ptr [rsp - 8], rax
018d4 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018d8 89442434                       mov        dword ptr [rsp + 0x34], eax
018dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
018e5 48894424f8                     mov        qword ptr [rsp - 8], rax
018ea 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018ee 89442440                       mov        dword ptr [rsp + 0x40], eax
018f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f7 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
018fc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01901 90                             nop        
01902 90                             nop        
01903 90                             nop        
01904 c5f877                         vzeroupper 
01907 e8546caeff                     call       0x7f63db6ea760
0190c 0f1f8400041a0009               nop        dword ptr [rax + rax + 0x9001a04]
01914 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0191e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01922 e8d9cdb218                     call       0x7f63f4730900
01927 f4                             hlt        
01928 be45ffffff                     mov        esi, 0xffffff45
0192d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01932 448b1c24                       mov        r11d, dword ptr [rsp]
01936 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0193e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01943 4c891c24                       mov        qword ptr [rsp], r11
01947 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0194c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0195d 89442408                       mov        dword ptr [rsp + 8], eax
01961 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01966 8944240c                       mov        dword ptr [rsp + 0xc], eax
0196a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0196f 48ff742420                     push       qword ptr [rsp + 0x20]
01974 488f442418                     pop        qword ptr [rsp + 0x18]
01979 48894424f8                     mov        qword ptr [rsp - 8], rax
0197e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01982 89442414                       mov        dword ptr [rsp + 0x14], eax
01986 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198b 48ff742428                     push       qword ptr [rsp + 0x28]
01990 488f442420                     pop        qword ptr [rsp + 0x20]
01995 48ff742430                     push       qword ptr [rsp + 0x30]
0199a 488f442428                     pop        qword ptr [rsp + 0x28]
0199f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
019a3 48894424f8                     mov        qword ptr [rsp - 8], rax
019a8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019ac 89442440                       mov        dword ptr [rsp + 0x40], eax
019b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b5 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
019ba 90                             nop        
019bb 90                             nop        
019bc c5f877                         vzeroupper 
019bf e89c6baeff                     call       0x7f63db6ea760
019c4 0f1f8400bc1a000a               nop        dword ptr [rax + rax + 0xa001abc]
019cc 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
019d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019da e821cdb218                     call       0x7f63f4730900
019df f4                             hlt        
019e0 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
019e5 4d3bc1                         cmp        r8, r9
019e8 bdffffffff                     mov        ebp, 0xffffffff
019ed 7c08                           jl         0x7f63dbc03bf7
019ef 400f95c5                       setne      bpl
019f3 400fb6ed                       movzx      ebp, bpl
019f7 be45ffffff                     mov        esi, 0xffffff45
019fc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01a01 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01a09 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01a0e 44894c2404                     mov        dword ptr [rsp + 4], r9d
01a13 48894424f8                     mov        qword ptr [rsp - 8], rax
01a18 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a1c 89442410                       mov        dword ptr [rsp + 0x10], eax
01a20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a25 89442414                       mov        dword ptr [rsp + 0x14], eax
01a29 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01a2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a33 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a37 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a40 48894424f8                     mov        qword ptr [rsp - 8], rax
01a45 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01a49 89442438                       mov        dword ptr [rsp + 0x38], eax
01a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a52 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01a56 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a5f 89442444                       mov        dword ptr [rsp + 0x44], eax
01a63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a68 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01a6d 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01a72 90                             nop        
01a73 90                             nop        
01a74 c5f877                         vzeroupper 
01a77 e8e46aaeff                     call       0x7f63db6ea760
01a7c 0f1f8400741b000b               nop        dword ptr [rax + rax + 0xb001b74]
01a84 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01a8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a92 e869ccb218                     call       0x7f63f4730900
01a97 f4                             hlt        
01a98 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01a9d 493be8                         cmp        rbp, r8
01aa0 bdffffffff                     mov        ebp, 0xffffffff
01aa5 7c08                           jl         0x7f63dbc03caf
01aa7 400f95c5                       setne      bpl
01aab 400fb6ed                       movzx      ebp, bpl
01aaf be45ffffff                     mov        esi, 0xffffff45
01ab4 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01ab9 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01ac1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01ac6 44894c2404                     mov        dword ptr [rsp + 4], r9d
01acb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ad4 89442410                       mov        dword ptr [rsp + 0x10], eax
01ad8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01add 89442414                       mov        dword ptr [rsp + 0x14], eax
01ae1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aef 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01af3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af8 48894424f8                     mov        qword ptr [rsp - 8], rax
01afd 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01b01 89442438                       mov        dword ptr [rsp + 0x38], eax
01b05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0a 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b13 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b17 89442444                       mov        dword ptr [rsp + 0x44], eax
01b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b20 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01b25 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01b2a 90                             nop        
01b2b 90                             nop        
01b2c c5f877                         vzeroupper 
01b2f e82c6aaeff                     call       0x7f63db6ea760
01b34 0f1f84002c1c000c               nop        dword ptr [rax + rax + 0xc001c2c]
01b3c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01b46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b4a e8b1cbb218                     call       0x7f63f4730900
01b4f f4                             hlt        
01b50 bee4ffffff                     mov        esi, 0xffffffe4
01b55 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b5a 448b1424                       mov        r10d, dword ptr [rsp]
01b5e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b66 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b6b 4c891424                       mov        qword ptr [rsp], r10
01b6f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01b74 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01b7c 48ff742420                     push       qword ptr [rsp + 0x20]
01b81 488f442418                     pop        qword ptr [rsp + 0x18]
01b86 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01b8f 89442414                       mov        dword ptr [rsp + 0x14], eax
01b93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b98 48ff742428                     push       qword ptr [rsp + 0x28]
01b9d 488f442420                     pop        qword ptr [rsp + 0x20]
01ba2 48ff742430                     push       qword ptr [rsp + 0x30]
01ba7 488f442428                     pop        qword ptr [rsp + 0x28]
01bac 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01bb5 89442430                       mov        dword ptr [rsp + 0x30], eax
01bb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc3 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01bc7 89442434                       mov        dword ptr [rsp + 0x34], eax
01bcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bd0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01bd5 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01bd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01bde 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01be2 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01be6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01beb 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01bef 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bf8 89442454                       mov        dword ptr [rsp + 0x54], eax
01bfc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c01 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01c06 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c0f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01c13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c18 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c1d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01c22 90                             nop        
01c23 90                             nop        
01c24 c5f877                         vzeroupper 
01c27 e83469aeff                     call       0x7f63db6ea760
01c2c 0f1f8400241d000d               nop        dword ptr [rax + rax + 0xd001d24]
01c34 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01c3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c42 e8b9cab218                     call       0x7f63f4730900
01c47 f4                             hlt        
01c48 bee4ffffff                     mov        esi, 0xffffffe4
01c4d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01c52 448b0c24                       mov        r9d, dword ptr [rsp]
01c56 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
01c5e 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01c63 4c890424                       mov        qword ptr [rsp], r8
01c67 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01c6c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01c74 48ff742420                     push       qword ptr [rsp + 0x20]
01c79 488f442418                     pop        qword ptr [rsp + 0x18]
01c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c83 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01c87 89442414                       mov        dword ptr [rsp + 0x14], eax
01c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c90 48ff742428                     push       qword ptr [rsp + 0x28]
01c95 488f442420                     pop        qword ptr [rsp + 0x20]
01c9a 48ff742430                     push       qword ptr [rsp + 0x30]
01c9f 488f442428                     pop        qword ptr [rsp + 0x28]
01ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cad 89442430                       mov        dword ptr [rsp + 0x30], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbb 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01cbf 89442434                       mov        dword ptr [rsp + 0x34], eax
01cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ccd 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01cd1 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01cd6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01cdb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ce4 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ce8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ced 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01cf1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01cfa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01cfe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d03 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d08 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01d0d 90                             nop        
01d0e 90                             nop        
01d0f 90                             nop        
01d10 c5f877                         vzeroupper 
01d13 e84868aeff                     call       0x7f63db6ea760
01d18 0f1f8400101e000e               nop        dword ptr [rax + rax + 0xe001e10]
01d20 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01d2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d2e e8cdc9b218                     call       0x7f63f4730900
01d33 f4                             hlt        
01d34 4183c608                       add        r14d, 8
01d38 be6effffff                     mov        esi, 0xffffff6e
01d3d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01d42 448b0424                       mov        r8d, dword ptr [rsp]
01d46 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01d4e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d53 4c891424                       mov        qword ptr [rsp], r10
01d57 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d5c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01d64 48894424f8                     mov        qword ptr [rsp - 8], rax
01d69 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d6d 89442408                       mov        dword ptr [rsp + 8], eax
01d71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d76 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01d7a 48ff742420                     push       qword ptr [rsp + 0x20]
01d7f 488f442418                     pop        qword ptr [rsp + 0x18]
01d84 48894424f8                     mov        qword ptr [rsp - 8], rax
01d89 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01d8d 89442414                       mov        dword ptr [rsp + 0x14], eax
01d91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d96 48ff742428                     push       qword ptr [rsp + 0x28]
01d9b 488f442420                     pop        qword ptr [rsp + 0x20]
01da0 48ff742430                     push       qword ptr [rsp + 0x30]
01da5 488f442428                     pop        qword ptr [rsp + 0x28]
01daa 48894424f8                     mov        qword ptr [rsp - 8], rax
01daf 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01db3 89442430                       mov        dword ptr [rsp + 0x30], eax
01db7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbc 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc1 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01dc5 89442434                       mov        dword ptr [rsp + 0x34], eax
01dc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dce 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01dd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd8 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01ddf 89442440                       mov        dword ptr [rsp + 0x40], eax
01de3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de8 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01ded 8954244c                       mov        dword ptr [rsp + 0x4c], edx
01df1 90                             nop        
01df2 90                             nop        
01df3 90                             nop        
01df4 c5f877                         vzeroupper 
01df7 e86467aeff                     call       0x7f63db6ea760
01dfc 0f1f8400f41e000f               nop        dword ptr [rax + rax + 0xf001ef4]
01e04 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01e0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e12 e8e9c8b218                     call       0x7f63f4730900
01e17 f4                             hlt        
01e18 4183c608                       add        r14d, 8
01e1c be66ffffff                     mov        esi, 0xffffff66
01e21 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e26 448b0424                       mov        r8d, dword ptr [rsp]
01e2a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01e32 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e37 4c891424                       mov        qword ptr [rsp], r10
01e3b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01e40 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01e48 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e51 89442408                       mov        dword ptr [rsp + 8], eax
01e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5a 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01e5e 48ff742420                     push       qword ptr [rsp + 0x20]
01e63 488f442418                     pop        qword ptr [rsp + 0x18]
01e68 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6d 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01e71 89442414                       mov        dword ptr [rsp + 0x14], eax
01e75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7a 48ff742428                     push       qword ptr [rsp + 0x28]
01e7f 488f442420                     pop        qword ptr [rsp + 0x20]
01e84 48ff742430                     push       qword ptr [rsp + 0x30]
01e89 488f442428                     pop        qword ptr [rsp + 0x28]
01e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e93 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e97 89442430                       mov        dword ptr [rsp + 0x30], eax
01e9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea5 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01ea9 89442434                       mov        dword ptr [rsp + 0x34], eax
01ead 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01eb7 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01ebc 8954244c                       mov        dword ptr [rsp + 0x4c], edx
01ec0 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01ec5 90                             nop        
01ec6 90                             nop        
01ec7 90                             nop        
01ec8 c5f877                         vzeroupper 
01ecb e89066aeff                     call       0x7f63db6ea760
01ed0 0f1f8400c81f0010               nop        dword ptr [rax + rax + 0x10001fc8]
01ed8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
01ee2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee6 e815c8b218                     call       0x7f63f4730900
01eeb f4                             hlt        
01eec 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01ef6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01efa e801c8b218                     call       0x7f63f4730900
01eff f4                             hlt        
01f00 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0e e8edc7b218                     call       0x7f63f4730900
01f13 f4                             hlt        
01f14 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01f1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f22 e8d9c7b218                     call       0x7f63f4730900
01f27 f4                             hlt        
01f28 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01f32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f36 e8c5c7b218                     call       0x7f63f4730900
01f3b f4                             hlt        
01f3c 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01f46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4a e8b1c7b218                     call       0x7f63f4730900
01f4f f4                             hlt        
01f50 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
01f5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f5e e89dc7b218                     call       0x7f63f4730900
01f63 f4                             hlt        
01f64 418beb                         mov        ebp, r11d
01f67 e9c8e6ffff                     jmp        0x7f63dbc02834
01f6c beccffffff                     mov        esi, 0xffffffcc
01f71 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f76 448b0424                       mov        r8d, dword ptr [rsp]
01f7a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01f82 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f87 4c891424                       mov        qword ptr [rsp], r10
01f8b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f90 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01f98 48ff742420                     push       qword ptr [rsp + 0x20]
01f9d 488f442418                     pop        qword ptr [rsp + 0x18]
01fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01fab 89442414                       mov        dword ptr [rsp + 0x14], eax
01faf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb4 48ff742428                     push       qword ptr [rsp + 0x28]
01fb9 488f442420                     pop        qword ptr [rsp + 0x20]
01fbe 48ff742430                     push       qword ptr [rsp + 0x30]
01fc3 488f442428                     pop        qword ptr [rsp + 0x28]
01fc8 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fd1 89442430                       mov        dword ptr [rsp + 0x30], eax
01fd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fda 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdf 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01fe3 89442434                       mov        dword ptr [rsp + 0x34], eax
01fe7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fec 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ff5 89442440                       mov        dword ptr [rsp + 0x40], eax
01ff9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ffe 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02003 48894424f8                     mov        qword ptr [rsp - 8], rax
02008 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0200c 89442448                       mov        dword ptr [rsp + 0x48], eax
02010 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02015 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02019 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0201e 90                             nop        
0201f 90                             nop        
02020 c5f877                         vzeroupper 
02023 e83865aeff                     call       0x7f63db6ea760
02028 0f1f840020210011               nop        dword ptr [rax + rax + 0x11002120]
02030 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0203a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0203e e8bdc6b218                     call       0x7f63f4730900
02043 f4                             hlt        
02044 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02048 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
02050 4403542440                     add        r10d, dword ptr [rsp + 0x40]
02055 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0205a 4f8b54110c                     mov        r10, qword ptr [r9 + r10 + 0xc]
0205f 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
02063 4d8954090c                     mov        qword ptr [r9 + rcx + 0xc], r10
02068 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
0206c 83c308                         add        ebx, 8
0206f 413bdb                         cmp        ebx, r11d
02072 7cd0                           jl         0x7f63dbc04244
02074 413bd8                         cmp        ebx, r8d
02077 0f8dc9000000                   jge        0x7f63dbc04346
0207d 4c63d3                         movsxd     r10, ebx
02080 4c03d2                         add        r10, rdx
02083 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
0208b 0f832f190000                   jae        0x7f63dbc05bc0
02091 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02096 4183c240                       add        r10d, 0x40
0209a 458bda                         mov        r11d, r10d
0209d 4d63d2                         movsxd     r10, r10d
020a0 4c03d2                         add        r10, rdx
020a3 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
020ab 0f8323190000                   jae        0x7f63dbc05bd4
020b1 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
020b5 0f832d190000                   jae        0x7f63dbc05be8
020bb 443b5c246c                     cmp        r11d, dword ptr [rsp + 0x6c]
020c0 0f8336190000                   jae        0x7f63dbc05bfc
020c6 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
020ca 90                             nop        
020cb 90                             nop        
020cc 90                             nop        
020cd 90                             nop        
020ce 90                             nop        
020cf 90                             nop        
020d0 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
020d8 4403d3                         add        r10d, ebx
020db 448bdb                         mov        r11d, ebx
020de 4d63cb                         movsxd     r9, r11d
020e1 458bda                         mov        r11d, r10d
020e4 4a8b7c190c                     mov        rdi, qword ptr [rcx + r11 + 0xc]
020e9 4d63d2                         movsxd     r10, r10d
020ec 448bdb                         mov        r11d, ebx
020ef 4a897c190c                     mov        qword ptr [rcx + r11 + 0xc], rdi
020f4 4e8b5c1114                     mov        r11, qword ptr [rcx + r10 + 0x14]
020f9 4e895c0914                     mov        qword ptr [rcx + r9 + 0x14], r11
020fe 4e8b5c111c                     mov        r11, qword ptr [rcx + r10 + 0x1c]
02103 4e895c091c                     mov        qword ptr [rcx + r9 + 0x1c], r11
02108 4e8b5c1124                     mov        r11, qword ptr [rcx + r10 + 0x24]
0210d 4e895c0924                     mov        qword ptr [rcx + r9 + 0x24], r11
02112 4e8b5c112c                     mov        r11, qword ptr [rcx + r10 + 0x2c]
02117 4e895c092c                     mov        qword ptr [rcx + r9 + 0x2c], r11
0211c 4e8b5c1134                     mov        r11, qword ptr [rcx + r10 + 0x34]
02121 4e895c0934                     mov        qword ptr [rcx + r9 + 0x34], r11
02126 4e8b5c113c                     mov        r11, qword ptr [rcx + r10 + 0x3c]
0212b 4e895c093c                     mov        qword ptr [rcx + r9 + 0x3c], r11
02130 4e8b541144                     mov        r10, qword ptr [rcx + r10 + 0x44]
02135 4e89540944                     mov        qword ptr [rcx + r9 + 0x44], r10
0213a 83c340                         add        ebx, 0x40
0213d 413bd8                         cmp        ebx, r8d
02140 7c8e                           jl         0x7f63dbc042d0
02142 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02146 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
0214d 0f8deae4ffff                   jge        0x7f63dbc0283d
02153 4c63d3                         movsxd     r10, ebx
02156 4c03d2                         add        r10, rdx
02159 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
02161 0f83a9180000                   jae        0x7f63dbc05c10
02167 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
0216b 0f83b3180000                   jae        0x7f63dbc05c24
02171 90                             nop        
02172 90                             nop        
02173 90                             nop        
02174 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
0217c 4403db                         add        r11d, ebx
0217f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02184 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
02189 448bc3                         mov        r8d, ebx
0218c 4f895c020c                     mov        qword ptr [r10 + r8 + 0xc], r11
02191 83c308                         add        ebx, 8
02194 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
0219b 7cd7                           jl         0x7f63dbc04374
0219d e99be4ffff                     jmp        0x7f63dbc0283d
021a2 bee4ffffff                     mov        esi, 0xffffffe4
021a7 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
021ac 448b0424                       mov        r8d, dword ptr [rsp]
021b0 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
021b8 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
021bd 4c891c24                       mov        qword ptr [rsp], r11
021c1 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
021c6 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
021ce 48894424f8                     mov        qword ptr [rsp - 8], rax
021d3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021d7 89442408                       mov        dword ptr [rsp + 8], eax
021db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e0 8944240c                       mov        dword ptr [rsp + 0xc], eax
021e4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
021e9 48ff742420                     push       qword ptr [rsp + 0x20]
021ee 488f442418                     pop        qword ptr [rsp + 0x18]
021f3 48894424f8                     mov        qword ptr [rsp - 8], rax
021f8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
021fc 89442414                       mov        dword ptr [rsp + 0x14], eax
02200 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02205 48ff742428                     push       qword ptr [rsp + 0x28]
0220a 488f442420                     pop        qword ptr [rsp + 0x20]
0220f 48ff742430                     push       qword ptr [rsp + 0x30]
02214 488f442428                     pop        qword ptr [rsp + 0x28]
02219 48894424f8                     mov        qword ptr [rsp - 8], rax
0221e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02222 89442430                       mov        dword ptr [rsp + 0x30], eax
02226 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222b 48894424f8                     mov        qword ptr [rsp - 8], rax
02230 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02234 89442434                       mov        dword ptr [rsp + 0x34], eax
02238 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223d 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02241 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02246 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0224b 90                             nop        
0224c c5f877                         vzeroupper 
0224f e80c63aeff                     call       0x7f63db6ea760
02254 0f1f84004c230012               nop        dword ptr [rax + rax + 0x1200234c]
0225c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02266 4883e4f0                       and        rsp, 0xfffffffffffffff0
0226a e891c4b218                     call       0x7f63f4730900
0226f f4                             hlt        
02270 4585f6                         test       r14d, r14d
02273 0f84bf170000                   je         0x7f63dbc05c38
02279 8b2c24                         mov        ebp, dword ptr [rsp]
0227c 8984249c000000                 mov        dword ptr [rsp + 0x9c], eax
02283 4533c0                         xor        r8d, r8d
02286 e95de9ffff                     jmp        0x7f63dbc02de8
0228b bee4ffffff                     mov        esi, 0xffffffe4
02290 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02295 448b1424                       mov        r10d, dword ptr [rsp]
02299 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
022a1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022a6 4c891424                       mov        qword ptr [rsp], r10
022aa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
022af 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
022b7 48ff742420                     push       qword ptr [rsp + 0x20]
022bc 488f442410                     pop        qword ptr [rsp + 0x10]
022c1 48894424f8                     mov        qword ptr [rsp - 8], rax
022c6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
022ca 89442418                       mov        dword ptr [rsp + 0x18], eax
022ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d3 48ff742428                     push       qword ptr [rsp + 0x28]
022d8 488f442420                     pop        qword ptr [rsp + 0x20]
022dd 48ff742430                     push       qword ptr [rsp + 0x30]
022e2 488f442428                     pop        qword ptr [rsp + 0x28]
022e7 48894424f8                     mov        qword ptr [rsp - 8], rax
022ec 8b442464                       mov        eax, dword ptr [rsp + 0x64]
022f0 8944241c                       mov        dword ptr [rsp + 0x1c], eax
022f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f9 48894424f8                     mov        qword ptr [rsp - 8], rax
022fe 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02302 89442430                       mov        dword ptr [rsp + 0x30], eax
02306 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230b 48894424f8                     mov        qword ptr [rsp - 8], rax
02310 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02314 89442438                       mov        dword ptr [rsp + 0x38], eax
02318 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231d 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02322 48894424f8                     mov        qword ptr [rsp - 8], rax
02327 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0232b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0232f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02334 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02338 4489742458                     mov        dword ptr [rsp + 0x58], r14d
0233d 90                             nop        
0233e 90                             nop        
0233f 90                             nop        
02340 c5f877                         vzeroupper 
02343 e81862aeff                     call       0x7f63db6ea760
02348 0f1f840040240013               nop        dword ptr [rax + rax + 0x13002440]
02350 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0235a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0235e e89dc3b218                     call       0x7f63f4730900
02363 f4                             hlt        
02364 bee4ffffff                     mov        esi, 0xffffffe4
02369 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0236e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02376 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0237b 4489442404                     mov        dword ptr [rsp + 4], r8d
02380 48ff742420                     push       qword ptr [rsp + 0x20]
02385 488f442418                     pop        qword ptr [rsp + 0x18]
0238a 48894424f8                     mov        qword ptr [rsp - 8], rax
0238f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02393 89442420                       mov        dword ptr [rsp + 0x20], eax
02397 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0239c 48894424f8                     mov        qword ptr [rsp - 8], rax
023a1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023a5 89442424                       mov        dword ptr [rsp + 0x24], eax
023a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ae 48894424f8                     mov        qword ptr [rsp - 8], rax
023b3 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
023b7 89442438                       mov        dword ptr [rsp + 0x38], eax
023bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c0 48894424f8                     mov        qword ptr [rsp - 8], rax
023c5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023c9 89442440                       mov        dword ptr [rsp + 0x40], eax
023cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d2 4489742448                     mov        dword ptr [rsp + 0x48], r14d
023d7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
023dc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
023e1 48894424f8                     mov        qword ptr [rsp - 8], rax
023e6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023ea 89442454                       mov        dword ptr [rsp + 0x54], eax
023ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f3 895c2458                       mov        dword ptr [rsp + 0x58], ebx
023f7 90                             nop        
023f8 c5f877                         vzeroupper 
023fb e86061aeff                     call       0x7f63db6ea760
02400 0f1f8400f8240014               nop        dword ptr [rax + rax + 0x140024f8]
02408 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02412 4883e4f0                       and        rsp, 0xfffffffffffffff0
02416 e8e5c2b218                     call       0x7f63f4730900
0241b f4                             hlt        
0241c 458bcb                         mov        r9d, r11d
0241f 418d6e01                       lea        ebp, [r14 + 1]
02423 bee4ffffff                     mov        esi, 0xffffffe4
02428 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0242d 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02435 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0243a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0243f 48ff742420                     push       qword ptr [rsp + 0x20]
02444 488f442418                     pop        qword ptr [rsp + 0x18]
02449 48894424f8                     mov        qword ptr [rsp - 8], rax
0244e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02452 89442420                       mov        dword ptr [rsp + 0x20], eax
02456 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245b 48894424f8                     mov        qword ptr [rsp - 8], rax
02460 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02464 89442424                       mov        dword ptr [rsp + 0x24], eax
02468 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246d 48894424f8                     mov        qword ptr [rsp - 8], rax
02472 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02476 89442438                       mov        dword ptr [rsp + 0x38], eax
0247a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247f 48894424f8                     mov        qword ptr [rsp - 8], rax
02484 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02488 89442440                       mov        dword ptr [rsp + 0x40], eax
0248c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02491 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02495 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0249a 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0249f 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
024a4 48894424f8                     mov        qword ptr [rsp - 8], rax
024a9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024ad 89442454                       mov        dword ptr [rsp + 0x54], eax
024b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024bb 4c89542468                     mov        qword ptr [rsp + 0x68], r10
024c0 4489442470                     mov        dword ptr [rsp + 0x70], r8d
024c5 90                             nop        
024c6 90                             nop        
024c7 90                             nop        
024c8 c5f877                         vzeroupper 
024cb e89060aeff                     call       0x7f63db6ea760
024d0 0f1f8400c8250015               nop        dword ptr [rax + rax + 0x150025c8]
024d8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
024e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024e6 e815c2b218                     call       0x7f63f4730900
024eb f4                             hlt        
024ec bee4ffffff                     mov        esi, 0xffffffe4
024f1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
024f6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
024fe 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02503 4489542404                     mov        dword ptr [rsp + 4], r10d
02508 48ff742420                     push       qword ptr [rsp + 0x20]
0250d 488f442418                     pop        qword ptr [rsp + 0x18]
02512 48894424f8                     mov        qword ptr [rsp - 8], rax
02517 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0251b 89442420                       mov        dword ptr [rsp + 0x20], eax
0251f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02524 48894424f8                     mov        qword ptr [rsp - 8], rax
02529 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0252d 89442424                       mov        dword ptr [rsp + 0x24], eax
02531 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02536 48894424f8                     mov        qword ptr [rsp - 8], rax
0253b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0253f 89442438                       mov        dword ptr [rsp + 0x38], eax
02543 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02548 48894424f8                     mov        qword ptr [rsp - 8], rax
0254d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02551 89442440                       mov        dword ptr [rsp + 0x40], eax
02555 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0255e 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02563 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02568 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0256d 48894424f8                     mov        qword ptr [rsp - 8], rax
02572 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02576 89442454                       mov        dword ptr [rsp + 0x54], eax
0257a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02584 c5f877                         vzeroupper 
02587 e8d45faeff                     call       0x7f63db6ea760
0258c 0f1f840084260016               nop        dword ptr [rax + rax + 0x16002684]
02594 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0259e 4883e4f0                       and        rsp, 0xfffffffffffffff0
025a2 e859c1b218                     call       0x7f63f4730900
025a7 f4                             hlt        
025a8 458bcb                         mov        r9d, r11d
025ab bee4ffffff                     mov        esi, 0xffffffe4
025b0 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025b5 448b1c24                       mov        r11d, dword ptr [rsp]
025b9 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
025c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025c6 4c891424                       mov        qword ptr [rsp], r10
025ca 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
025cf 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
025d7 48ff742420                     push       qword ptr [rsp + 0x20]
025dc 488f442410                     pop        qword ptr [rsp + 0x10]
025e1 48894424f8                     mov        qword ptr [rsp - 8], rax
025e6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
025ea 89442418                       mov        dword ptr [rsp + 0x18], eax
025ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f3 48ff742428                     push       qword ptr [rsp + 0x28]
025f8 488f442420                     pop        qword ptr [rsp + 0x20]
025fd 48ff742430                     push       qword ptr [rsp + 0x30]
02602 488f442428                     pop        qword ptr [rsp + 0x28]
02607 48894424f8                     mov        qword ptr [rsp - 8], rax
0260c 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02610 89442430                       mov        dword ptr [rsp + 0x30], eax
02614 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02619 48894424f8                     mov        qword ptr [rsp - 8], rax
0261e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02622 89442438                       mov        dword ptr [rsp + 0x38], eax
02626 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0262b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0262f 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02634 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02639 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0263e 90                             nop        
0263f 90                             nop        
02640 c5f877                         vzeroupper 
02643 e8185faeff                     call       0x7f63db6ea760
02648 0f1f840040270017               nop        dword ptr [rax + rax + 0x17002740]
02650 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0265a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0265e e89dc0b218                     call       0x7f63f4730900
02663 f4                             hlt        
02664 458bc3                         mov        r8d, r11d
02667 bee4ffffff                     mov        esi, 0xffffffe4
0266c 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02671 448b1424                       mov        r10d, dword ptr [rsp]
02675 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0267d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02682 4c891424                       mov        qword ptr [rsp], r10
02686 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0268b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02693 48ff742420                     push       qword ptr [rsp + 0x20]
02698 488f442410                     pop        qword ptr [rsp + 0x10]
0269d 48894424f8                     mov        qword ptr [rsp - 8], rax
026a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
026a6 89442418                       mov        dword ptr [rsp + 0x18], eax
026aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026af 48ff742428                     push       qword ptr [rsp + 0x28]
026b4 488f442420                     pop        qword ptr [rsp + 0x20]
026b9 48ff742430                     push       qword ptr [rsp + 0x30]
026be 488f442428                     pop        qword ptr [rsp + 0x28]
026c3 48894424f8                     mov        qword ptr [rsp - 8], rax
026c8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026cc 8944241c                       mov        dword ptr [rsp + 0x1c], eax
026d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d5 48894424f8                     mov        qword ptr [rsp - 8], rax
026da 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
026de 89442430                       mov        dword ptr [rsp + 0x30], eax
026e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e7 48894424f8                     mov        qword ptr [rsp - 8], rax
026ec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026f0 89442438                       mov        dword ptr [rsp + 0x38], eax
026f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
026fd 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02702 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02707 48894424f8                     mov        qword ptr [rsp - 8], rax
0270c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02710 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02714 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02719 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0271e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02723 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02728 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0272c c5f877                         vzeroupper 
0272f e82c5eaeff                     call       0x7f63db6ea760
02734 0f1f84002c280018               nop        dword ptr [rax + rax + 0x1800282c]
0273c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02746 4883e4f0                       and        rsp, 0xfffffffffffffff0
0274a e8b1bfb218                     call       0x7f63f4730900
0274f f4                             hlt        
02750 418bfb                         mov        edi, r11d
02753 bee4ffffff                     mov        esi, 0xffffffe4
02758 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0275d 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02765 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0276a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0276f 48ff742420                     push       qword ptr [rsp + 0x20]
02774 488f442418                     pop        qword ptr [rsp + 0x18]
02779 48894424f8                     mov        qword ptr [rsp - 8], rax
0277e 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02782 89442420                       mov        dword ptr [rsp + 0x20], eax
02786 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278b 48894424f8                     mov        qword ptr [rsp - 8], rax
02790 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02794 89442424                       mov        dword ptr [rsp + 0x24], eax
02798 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279d 48894424f8                     mov        qword ptr [rsp - 8], rax
027a2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
027a6 89442438                       mov        dword ptr [rsp + 0x38], eax
027aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027af 48894424f8                     mov        qword ptr [rsp - 8], rax
027b4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027b8 89442440                       mov        dword ptr [rsp + 0x40], eax
027bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c1 895c2444                       mov        dword ptr [rsp + 0x44], ebx
027c5 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
027ca 897c244c                       mov        dword ptr [rsp + 0x4c], edi
027ce 48894424f8                     mov        qword ptr [rsp - 8], rax
027d3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027d7 89442450                       mov        dword ptr [rsp + 0x50], eax
027db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
027e5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
027ea 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
027ef 894c2470                       mov        dword ptr [rsp + 0x70], ecx
027f3 90                             nop        
027f4 c5f877                         vzeroupper 
027f7 e8645daeff                     call       0x7f63db6ea760
027fc 0f1f8400f4280019               nop        dword ptr [rax + rax + 0x190028f4]
02804 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0280e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02812 e8e9beb218                     call       0x7f63f4730900
02817 f4                             hlt        
02818 beccffffff                     mov        esi, 0xffffffcc
0281d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02822 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0282a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0282f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02834 48ff742420                     push       qword ptr [rsp + 0x20]
02839 488f442418                     pop        qword ptr [rsp + 0x18]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02847 89442420                       mov        dword ptr [rsp + 0x20], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 48894424f8                     mov        qword ptr [rsp - 8], rax
02855 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02859 89442424                       mov        dword ptr [rsp + 0x24], eax
0285d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02862 48894424f8                     mov        qword ptr [rsp - 8], rax
02867 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0286b 89442438                       mov        dword ptr [rsp + 0x38], eax
0286f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02874 48894424f8                     mov        qword ptr [rsp - 8], rax
02879 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0287d 89442440                       mov        dword ptr [rsp + 0x40], eax
02881 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02886 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0288a 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0288f 48894424f8                     mov        qword ptr [rsp - 8], rax
02894 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02898 89442450                       mov        dword ptr [rsp + 0x50], eax
0289c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
028a6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
028ab 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
028b0 c5f877                         vzeroupper 
028b3 e8a85caeff                     call       0x7f63db6ea760
028b8 0f1f8400b029001a               nop        dword ptr [rax + rax + 0x1a0029b0]
028c0 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
028ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ce e82dbeb218                     call       0x7f63f4730900
028d3 f4                             hlt        
028d4 be6effffff                     mov        esi, 0xffffff6e
028d9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
028de 448b1c24                       mov        r11d, dword ptr [rsp]
028e2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
028ea 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
028ef 4c891c24                       mov        qword ptr [rsp], r11
028f3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
028f8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02900 48894424f8                     mov        qword ptr [rsp - 8], rax
02905 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02909 89442408                       mov        dword ptr [rsp + 8], eax
0290d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02912 8944240c                       mov        dword ptr [rsp + 0xc], eax
02916 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0291b 48ff742420                     push       qword ptr [rsp + 0x20]
02920 488f442418                     pop        qword ptr [rsp + 0x18]
02925 48894424f8                     mov        qword ptr [rsp - 8], rax
0292a 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0292e 89442414                       mov        dword ptr [rsp + 0x14], eax
02932 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02937 48ff742428                     push       qword ptr [rsp + 0x28]
0293c 488f442420                     pop        qword ptr [rsp + 0x20]
02941 48ff742430                     push       qword ptr [rsp + 0x30]
02946 488f442428                     pop        qword ptr [rsp + 0x28]
0294b 48894424f8                     mov        qword ptr [rsp - 8], rax
02950 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02954 89442430                       mov        dword ptr [rsp + 0x30], eax
02958 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295d 48894424f8                     mov        qword ptr [rsp - 8], rax
02962 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02966 89442434                       mov        dword ptr [rsp + 0x34], eax
0296a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02973 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02978 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0297d 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02982 90                             nop        
02983 90                             nop        
02984 c5f877                         vzeroupper 
02987 e8d45baeff                     call       0x7f63db6ea760
0298c 0f1f8400842a001b               nop        dword ptr [rax + rax + 0x1b002a84]
02994 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0299e 4883e4f0                       and        rsp, 0xfffffffffffffff0
029a2 e859bdb218                     call       0x7f63f4730900
029a7 f4                             hlt        
029a8 be45ffffff                     mov        esi, 0xffffff45
029ad 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
029b2 448b0424                       mov        r8d, dword ptr [rsp]
029b6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
029be 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
029c3 4c891c24                       mov        qword ptr [rsp], r11
029c7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
029cc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
029d4 48894424f8                     mov        qword ptr [rsp - 8], rax
029d9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
029dd 89442408                       mov        dword ptr [rsp + 8], eax
029e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e6 8944240c                       mov        dword ptr [rsp + 0xc], eax
029ea 4489542410                     mov        dword ptr [rsp + 0x10], r10d
029ef 48ff742420                     push       qword ptr [rsp + 0x20]
029f4 488f442418                     pop        qword ptr [rsp + 0x18]
029f9 48894424f8                     mov        qword ptr [rsp - 8], rax
029fe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02a02 89442414                       mov        dword ptr [rsp + 0x14], eax
02a06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a0b 48ff742428                     push       qword ptr [rsp + 0x28]
02a10 488f442420                     pop        qword ptr [rsp + 0x20]
02a15 48ff742430                     push       qword ptr [rsp + 0x30]
02a1a 488f442428                     pop        qword ptr [rsp + 0x28]
02a1f 48894424f8                     mov        qword ptr [rsp - 8], rax
02a24 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a28 89442430                       mov        dword ptr [rsp + 0x30], eax
02a2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a31 48894424f8                     mov        qword ptr [rsp - 8], rax
02a36 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02a3a 89442434                       mov        dword ptr [rsp + 0x34], eax
02a3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a43 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02a47 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02a4c 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02a51 90                             nop        
02a52 90                             nop        
02a53 90                             nop        
02a54 c5f877                         vzeroupper 
02a57 e8045baeff                     call       0x7f63db6ea760
02a5c 0f1f8400542b001c               nop        dword ptr [rax + rax + 0x1c002b54]
02a64 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02a6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a72 e889bcb218                     call       0x7f63f4730900
02a77 f4                             hlt        
02a78 be3dffffff                     mov        esi, 0xffffff3d
02a7d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02a82 448b1c24                       mov        r11d, dword ptr [rsp]
02a86 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02a8e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02a93 4c891c24                       mov        qword ptr [rsp], r11
02a97 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02a9c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02aa4 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02aad 89442408                       mov        dword ptr [rsp + 8], eax
02ab1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab6 8944240c                       mov        dword ptr [rsp + 0xc], eax
02aba 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02abf 48ff742420                     push       qword ptr [rsp + 0x20]
02ac4 488f442418                     pop        qword ptr [rsp + 0x18]
02ac9 48894424f8                     mov        qword ptr [rsp - 8], rax
02ace 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02ad2 89442414                       mov        dword ptr [rsp + 0x14], eax
02ad6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02adb 48ff742428                     push       qword ptr [rsp + 0x28]
02ae0 488f442420                     pop        qword ptr [rsp + 0x20]
02ae5 48ff742430                     push       qword ptr [rsp + 0x30]
02aea 488f442428                     pop        qword ptr [rsp + 0x28]
02aef 48894424f8                     mov        qword ptr [rsp - 8], rax
02af4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02af8 89442430                       mov        dword ptr [rsp + 0x30], eax
02afc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b01 48894424f8                     mov        qword ptr [rsp - 8], rax
02b06 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02b0a 89442434                       mov        dword ptr [rsp + 0x34], eax
02b0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b13 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02b17 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02b1c 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02b21 90                             nop        
02b22 90                             nop        
02b23 90                             nop        
02b24 c5f877                         vzeroupper 
02b27 e8345aaeff                     call       0x7f63db6ea760
02b2c 0f1f8400242c001d               nop        dword ptr [rax + rax + 0x1d002c24]
02b34 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b42 e8b9bbb218                     call       0x7f63f4730900
02b47 f4                             hlt        
02b48 bee4ffffff                     mov        esi, 0xffffffe4
02b4d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b52 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02b5a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02b5f 4489542404                     mov        dword ptr [rsp + 4], r10d
02b64 48ff742420                     push       qword ptr [rsp + 0x20]
02b69 488f442418                     pop        qword ptr [rsp + 0x18]
02b6e 48894424f8                     mov        qword ptr [rsp - 8], rax
02b73 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02b77 89442420                       mov        dword ptr [rsp + 0x20], eax
02b7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b80 48894424f8                     mov        qword ptr [rsp - 8], rax
02b85 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b89 89442424                       mov        dword ptr [rsp + 0x24], eax
02b8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b92 48894424f8                     mov        qword ptr [rsp - 8], rax
02b97 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02b9b 89442438                       mov        dword ptr [rsp + 0x38], eax
02b9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba4 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02ba8 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02bad 48894424f8                     mov        qword ptr [rsp - 8], rax
02bb2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02bb6 89442448                       mov        dword ptr [rsp + 0x48], eax
02bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bbf 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02bc8 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02bcc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd1 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02bd6 90                             nop        
02bd7 90                             nop        
02bd8 c5f877                         vzeroupper 
02bdb e88059aeff                     call       0x7f63db6ea760
02be0 0f1f8400d82c001e               nop        dword ptr [rax + rax + 0x1e002cd8]
02be8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02bf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bf6 e805bbb218                     call       0x7f63f4730900
02bfb f4                             hlt        
02bfc bee4ffffff                     mov        esi, 0xffffffe4
02c01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c06 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02c0e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02c13 4489542404                     mov        dword ptr [rsp + 4], r10d
02c18 48ff742420                     push       qword ptr [rsp + 0x20]
02c1d 488f442418                     pop        qword ptr [rsp + 0x18]
02c22 48894424f8                     mov        qword ptr [rsp - 8], rax
02c27 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02c2b 89442420                       mov        dword ptr [rsp + 0x20], eax
02c2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c34 48894424f8                     mov        qword ptr [rsp - 8], rax
02c39 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c3d 89442424                       mov        dword ptr [rsp + 0x24], eax
02c41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c46 48894424f8                     mov        qword ptr [rsp - 8], rax
02c4b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02c4f 89442438                       mov        dword ptr [rsp + 0x38], eax
02c53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c58 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02c5c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02c61 48894424f8                     mov        qword ptr [rsp - 8], rax
02c66 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c6a 89442448                       mov        dword ptr [rsp + 0x48], eax
02c6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c73 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02c78 c5f877                         vzeroupper 
02c7b e8e058aeff                     call       0x7f63db6ea760
02c80 0f1f8400782d001f               nop        dword ptr [rax + rax + 0x1f002d78]
02c88 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02c92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c96 e865bab218                     call       0x7f63f4730900
02c9b f4                             hlt        
02c9c 458bcb                         mov        r9d, r11d
02c9f beccffffff                     mov        esi, 0xffffffcc
02ca4 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02ca9 448b1c24                       mov        r11d, dword ptr [rsp]
02cad 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02cb5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02cba 4c891424                       mov        qword ptr [rsp], r10
02cbe 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02cc3 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02ccb 48ff742420                     push       qword ptr [rsp + 0x20]
02cd0 488f442410                     pop        qword ptr [rsp + 0x10]
02cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
02cda 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02cde 89442418                       mov        dword ptr [rsp + 0x18], eax
02ce2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce7 48ff742428                     push       qword ptr [rsp + 0x28]
02cec 488f442420                     pop        qword ptr [rsp + 0x20]
02cf1 48ff742430                     push       qword ptr [rsp + 0x30]
02cf6 488f442428                     pop        qword ptr [rsp + 0x28]
02cfb 48894424f8                     mov        qword ptr [rsp - 8], rax
02d00 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d04 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02d08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d0d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d12 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02d16 89442430                       mov        dword ptr [rsp + 0x30], eax
02d1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d1f 48894424f8                     mov        qword ptr [rsp - 8], rax
02d24 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d28 89442438                       mov        dword ptr [rsp + 0x38], eax
02d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d31 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02d36 48894424f8                     mov        qword ptr [rsp - 8], rax
02d3b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d3f 89442448                       mov        dword ptr [rsp + 0x48], eax
02d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d48 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02d4d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02d51 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02d56 90                             nop        
02d57 90                             nop        
02d58 c5f877                         vzeroupper 
02d5b e80058aeff                     call       0x7f63db6ea760
02d60 0f1f8400582e0020               nop        dword ptr [rax + rax + 0x20002e58]
02d68 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d76 e885b9b218                     call       0x7f63f4730900
02d7b f4                             hlt        
02d7c be17000000                     mov        esi, 0x17
02d81 90                             nop        
02d82 90                             nop        
02d83 90                             nop        
02d84 c5f877                         vzeroupper 
02d87 e8d457aeff                     call       0x7f63db6ea760
02d8c 0f1f8400842e0021               nop        dword ptr [rax + rax + 0x21002e84]
02d94 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02d9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02da2 e859b9b218                     call       0x7f63f4730900
02da7 f4                             hlt        
02da8 be6effffff                     mov        esi, 0xffffff6e
02dad 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02db2 89442414                       mov        dword ptr [rsp + 0x14], eax
02db6 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02dbb 895c2420                       mov        dword ptr [rsp + 0x20], ebx
02dbf 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02dc4 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
02dc9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02dce 90                             nop        
02dcf 90                             nop        
02dd0 c5f877                         vzeroupper 
02dd3 e88857aeff                     call       0x7f63db6ea760
02dd8 0f1f8400d02e0022               nop        dword ptr [rax + rax + 0x22002ed0]
02de0 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02dea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dee e80db9b218                     call       0x7f63f4730900
02df3 f4                             hlt        
02df4 bebeffffff                     mov        esi, 0xffffffbe
02df9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02dfe 89442414                       mov        dword ptr [rsp + 0x14], eax
02e02 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02e07 895c2420                       mov        dword ptr [rsp + 0x20], ebx
02e0b 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02e10 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
02e15 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02e1a 90                             nop        
02e1b 90                             nop        
02e1c c5f877                         vzeroupper 
02e1f e83c57aeff                     call       0x7f63db6ea760
02e24 0f1f84001c2f0023               nop        dword ptr [rax + rax + 0x23002f1c]
02e2c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02e36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e3a e8c1b8b218                     call       0x7f63f4730900
02e3f f4                             hlt        
02e40 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
02e45 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02e4a 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
02e4f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
02e57 beccffffff                     mov        esi, 0xffffffcc
02e5c 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02e64 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02e6c 44893424                       mov        dword ptr [rsp], r14d
02e70 4489542404                     mov        dword ptr [rsp + 4], r10d
02e75 4c896c2408                     mov        qword ptr [rsp + 8], r13
02e7a 90                             nop        
02e7b 90                             nop        
02e7c c5f877                         vzeroupper 
02e7f e8dc56aeff                     call       0x7f63db6ea760
02e84 0f1f84007c2f0024               nop        dword ptr [rax + rax + 0x24002f7c]
02e8c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02e96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e9a e861b8b218                     call       0x7f63f4730900
02e9f f4                             hlt        
02ea0 bee4ffffff                     mov        esi, 0xffffffe4
02ea5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02eaa 448b1c24                       mov        r11d, dword ptr [rsp]
02eae 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02eb6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02ebb 4c891c24                       mov        qword ptr [rsp], r11
02ebf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02ec4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02ecc 48894424f8                     mov        qword ptr [rsp - 8], rax
02ed1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ed5 89442408                       mov        dword ptr [rsp + 8], eax
02ed9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ede 48ff742420                     push       qword ptr [rsp + 0x20]
02ee3 488f442410                     pop        qword ptr [rsp + 0x10]
02ee8 48894424f8                     mov        qword ptr [rsp - 8], rax
02eed 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02ef1 89442418                       mov        dword ptr [rsp + 0x18], eax
02ef5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02efa 48ff742428                     push       qword ptr [rsp + 0x28]
02eff 488f442420                     pop        qword ptr [rsp + 0x20]
02f04 48ff742430                     push       qword ptr [rsp + 0x30]
02f09 488f442428                     pop        qword ptr [rsp + 0x28]
02f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
02f13 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02f17 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02f1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f20 48894424f8                     mov        qword ptr [rsp - 8], rax
02f25 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02f29 89442430                       mov        dword ptr [rsp + 0x30], eax
02f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f32 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02f36 48894424f8                     mov        qword ptr [rsp - 8], rax
02f3b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02f3f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02f43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f48 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02f4d 48894424f8                     mov        qword ptr [rsp - 8], rax
02f52 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02f56 89442444                       mov        dword ptr [rsp + 0x44], eax
02f5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f5f 89442448                       mov        dword ptr [rsp + 0x48], eax
02f63 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02f68 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02f6d 48894424f8                     mov        qword ptr [rsp - 8], rax
02f72 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02f76 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02f7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f7f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02f84 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02f89 90                             nop        
02f8a 90                             nop        
02f8b 90                             nop        
02f8c c5f877                         vzeroupper 
02f8f e8cc55aeff                     call       0x7f63db6ea760
02f94 0f1f84008c300025               nop        dword ptr [rax + rax + 0x2500308c]
02f9c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
02fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02faa e851b7b218                     call       0x7f63f4730900
02faf f4                             hlt        
02fb0 bee4ffffff                     mov        esi, 0xffffffe4
02fb5 498beb                         mov        rbp, r11
02fb8 448b1c24                       mov        r11d, dword ptr [rsp]
02fbc 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02fc4 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02fc9 4c891c24                       mov        qword ptr [rsp], r11
02fcd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02fd2 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02fda 48ff742420                     push       qword ptr [rsp + 0x20]
02fdf 488f442410                     pop        qword ptr [rsp + 0x10]
02fe4 48894424f8                     mov        qword ptr [rsp - 8], rax
02fe9 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02fed 89442418                       mov        dword ptr [rsp + 0x18], eax
02ff1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ff6 48ff742428                     push       qword ptr [rsp + 0x28]
02ffb 488f442420                     pop        qword ptr [rsp + 0x20]
03000 48ff742430                     push       qword ptr [rsp + 0x30]
03005 488f442428                     pop        qword ptr [rsp + 0x28]
0300a 48894424f8                     mov        qword ptr [rsp - 8], rax
0300f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
03013 8944241c                       mov        dword ptr [rsp + 0x1c], eax
03017 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0301c 48894424f8                     mov        qword ptr [rsp - 8], rax
03021 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03025 89442430                       mov        dword ptr [rsp + 0x30], eax
03029 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0302e 895c2438                       mov        dword ptr [rsp + 0x38], ebx
03032 48894424f8                     mov        qword ptr [rsp - 8], rax
03037 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0303b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0303f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03044 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
03049 48894424f8                     mov        qword ptr [rsp - 8], rax
0304e 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
03052 89442444                       mov        dword ptr [rsp + 0x44], eax
03056 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0305b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
03060 48894424f8                     mov        qword ptr [rsp - 8], rax
03065 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03069 89442450                       mov        dword ptr [rsp + 0x50], eax
0306d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03072 89442454                       mov        dword ptr [rsp + 0x54], eax
03076 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0307b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
03080 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
03085 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0308a c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
03090 c5f877                         vzeroupper 
03093 e8c854aeff                     call       0x7f63db6ea760
03098 0f1f840090310026               nop        dword ptr [rax + rax + 0x26003190]
030a0 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
030aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
030ae e84db6b218                     call       0x7f63f4730900
030b3 f4                             hlt        
030b4 beccffffff                     mov        esi, 0xffffffcc
030b9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
030be 448b1c24                       mov        r11d, dword ptr [rsp]
030c2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
030ca 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
030cf 4c891c24                       mov        qword ptr [rsp], r11
030d3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
030d8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
030e0 48ff742420                     push       qword ptr [rsp + 0x20]
030e5 488f442418                     pop        qword ptr [rsp + 0x18]
030ea 48894424f8                     mov        qword ptr [rsp - 8], rax
030ef 8b442444                       mov        eax, dword ptr [rsp + 0x44]
030f3 89442414                       mov        dword ptr [rsp + 0x14], eax
030f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030fc 48ff742428                     push       qword ptr [rsp + 0x28]
03101 488f442420                     pop        qword ptr [rsp + 0x20]
03106 48ff742430                     push       qword ptr [rsp + 0x30]
0310b 488f442428                     pop        qword ptr [rsp + 0x28]
03110 48894424f8                     mov        qword ptr [rsp - 8], rax
03115 8b442464                       mov        eax, dword ptr [rsp + 0x64]
03119 89442430                       mov        dword ptr [rsp + 0x30], eax
0311d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03122 48894424f8                     mov        qword ptr [rsp - 8], rax
03127 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0312b 89442434                       mov        dword ptr [rsp + 0x34], eax
0312f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03134 48894424f8                     mov        qword ptr [rsp - 8], rax
03139 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0313d 89442440                       mov        dword ptr [rsp + 0x40], eax
03141 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03146 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0314b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
03150 48894424f8                     mov        qword ptr [rsp - 8], rax
03155 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03159 89442454                       mov        dword ptr [rsp + 0x54], eax
0315d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03162 89442458                       mov        dword ptr [rsp + 0x58], eax
03166 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0316a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0316f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
03174 c5f877                         vzeroupper 
03177 e8e453aeff                     call       0x7f63db6ea760
0317c 0f1f840074320027               nop        dword ptr [rax + rax + 0x27003274]
03184 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0318e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03192 e869b5b218                     call       0x7f63f4730900
03197 f4                             hlt        
03198 418bea                         mov        ebp, r10d
0319b 83c510                         add        ebp, 0x10
0319e be6effffff                     mov        esi, 0xffffff6e
031a3 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
031a8 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
031b0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
031b5 44895c2404                     mov        dword ptr [rsp + 4], r11d
031ba 48894424f8                     mov        qword ptr [rsp - 8], rax
031bf 8b442460                       mov        eax, dword ptr [rsp + 0x60]
031c3 89442410                       mov        dword ptr [rsp + 0x10], eax
031c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031cc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
031d1 48ff742420                     push       qword ptr [rsp + 0x20]
031d6 488f442418                     pop        qword ptr [rsp + 0x18]
031db 48894424f8                     mov        qword ptr [rsp - 8], rax
031e0 8b442444                       mov        eax, dword ptr [rsp + 0x44]
031e4 89442420                       mov        dword ptr [rsp + 0x20], eax
031e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ed 48894424f8                     mov        qword ptr [rsp - 8], rax
031f2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
031f6 89442424                       mov        dword ptr [rsp + 0x24], eax
031fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ff 48894424f8                     mov        qword ptr [rsp - 8], rax
03204 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03208 89442438                       mov        dword ptr [rsp + 0x38], eax
0320c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03211 895c2440                       mov        dword ptr [rsp + 0x40], ebx
03215 48894424f8                     mov        qword ptr [rsp - 8], rax
0321a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0321e 89442444                       mov        dword ptr [rsp + 0x44], eax
03222 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03227 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0322c 48894424f8                     mov        qword ptr [rsp - 8], rax
03231 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
03235 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03239 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0323e 8954246c                       mov        dword ptr [rsp + 0x6c], edx
03242 90                             nop        
03243 90                             nop        
03244 c5f877                         vzeroupper 
03247 e81453aeff                     call       0x7f63db6ea760
0324c 0f1f840044330028               nop        dword ptr [rax + rax + 0x28003344]
03254 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0325e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03262 e899b4b218                     call       0x7f63f4730900
03267 f4                             hlt        
03268 418bea                         mov        ebp, r10d
0326b 83c510                         add        ebp, 0x10
0326e be66ffffff                     mov        esi, 0xffffff66
03273 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
03278 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
03280 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
03285 4489442404                     mov        dword ptr [rsp + 4], r8d
0328a 48894424f8                     mov        qword ptr [rsp - 8], rax
0328f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03293 89442410                       mov        dword ptr [rsp + 0x10], eax
03297 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0329c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
032a1 48ff742420                     push       qword ptr [rsp + 0x20]
032a6 488f442418                     pop        qword ptr [rsp + 0x18]
032ab 48894424f8                     mov        qword ptr [rsp - 8], rax
032b0 8b442444                       mov        eax, dword ptr [rsp + 0x44]
032b4 89442420                       mov        dword ptr [rsp + 0x20], eax
032b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032bd 48894424f8                     mov        qword ptr [rsp - 8], rax
032c2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
032c6 89442424                       mov        dword ptr [rsp + 0x24], eax
032ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032cf 48894424f8                     mov        qword ptr [rsp - 8], rax
032d4 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
032d8 89442438                       mov        dword ptr [rsp + 0x38], eax
032dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032e1 895c2440                       mov        dword ptr [rsp + 0x40], ebx
032e5 48894424f8                     mov        qword ptr [rsp - 8], rax
032ea 8b442448                       mov        eax, dword ptr [rsp + 0x48]
032ee 89442444                       mov        dword ptr [rsp + 0x44], eax
032f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032f7 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
032fc 48894424f8                     mov        qword ptr [rsp - 8], rax
03301 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
03305 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03309 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0330e 8954246c                       mov        dword ptr [rsp + 0x6c], edx
03312 90                             nop        
03313 90                             nop        
03314 c5f877                         vzeroupper 
03317 e84452aeff                     call       0x7f63db6ea760
0331c 0f1f840014340029               nop        dword ptr [rax + rax + 0x29003414]
03324 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0332e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03332 e8c9b3b218                     call       0x7f63f4730900
03337 f4                             hlt        
03338 bee4ffffff                     mov        esi, 0xffffffe4
0333d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03342 448b1c24                       mov        r11d, dword ptr [rsp]
03346 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0334e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
03353 4c891424                       mov        qword ptr [rsp], r10
03357 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0335c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03364 48ff742420                     push       qword ptr [rsp + 0x20]
03369 488f442410                     pop        qword ptr [rsp + 0x10]
0336e 48894424f8                     mov        qword ptr [rsp - 8], rax
03373 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03377 89442418                       mov        dword ptr [rsp + 0x18], eax
0337b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03380 48ff742428                     push       qword ptr [rsp + 0x28]
03385 488f442420                     pop        qword ptr [rsp + 0x20]
0338a 48ff742430                     push       qword ptr [rsp + 0x30]
0338f 488f442428                     pop        qword ptr [rsp + 0x28]
03394 48894424f8                     mov        qword ptr [rsp - 8], rax
03399 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0339d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
033a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033a6 48894424f8                     mov        qword ptr [rsp - 8], rax
033ab 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
033af 89442430                       mov        dword ptr [rsp + 0x30], eax
033b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033b8 48894424f8                     mov        qword ptr [rsp - 8], rax
033bd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
033c1 89442444                       mov        dword ptr [rsp + 0x44], eax
033c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033ca 895c2448                       mov        dword ptr [rsp + 0x48], ebx
033ce 48894424f8                     mov        qword ptr [rsp - 8], rax
033d3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
033d7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
033db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033e0 4489742450                     mov        dword ptr [rsp + 0x50], r14d
033e5 90                             nop        
033e6 90                             nop        
033e7 90                             nop        
033e8 c5f877                         vzeroupper 
033eb e87051aeff                     call       0x7f63db6ea760
033f0 0f1f8400e834002a               nop        dword ptr [rax + rax + 0x2a0034e8]
033f8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
03402 4883e4f0                       and        rsp, 0xfffffffffffffff0
03406 e8f5b2b218                     call       0x7f63f4730900
0340b f4                             hlt        
0340c bee4ffffff                     mov        esi, 0xffffffe4
03411 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03416 448b1c24                       mov        r11d, dword ptr [rsp]
0341a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
03422 4c8b542408                     mov        r10, qword ptr [rsp + 8]
03427 4c891424                       mov        qword ptr [rsp], r10
0342b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
03430 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03438 48ff742420                     push       qword ptr [rsp + 0x20]
0343d 488f442410                     pop        qword ptr [rsp + 0x10]
03442 48894424f8                     mov        qword ptr [rsp - 8], rax
03447 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0344b 89442418                       mov        dword ptr [rsp + 0x18], eax
0344f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03454 48ff742428                     push       qword ptr [rsp + 0x28]
03459 488f442420                     pop        qword ptr [rsp + 0x20]
0345e 48ff742430                     push       qword ptr [rsp + 0x30]
03463 488f442428                     pop        qword ptr [rsp + 0x28]
03468 48894424f8                     mov        qword ptr [rsp - 8], rax
0346d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03471 89442430                       mov        dword ptr [rsp + 0x30], eax
03475 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0347a 48894424f8                     mov        qword ptr [rsp - 8], rax
0347f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03483 89442440                       mov        dword ptr [rsp + 0x40], eax
03487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0348c 895c2444                       mov        dword ptr [rsp + 0x44], ebx
03490 48894424f8                     mov        qword ptr [rsp - 8], rax
03495 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
03499 89442448                       mov        dword ptr [rsp + 0x48], eax
0349d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034a2 89442460                       mov        dword ptr [rsp + 0x60], eax
034a6 48894c2468                     mov        qword ptr [rsp + 0x68], rcx
034ab 90                             nop        
034ac c5f877                         vzeroupper 
034af e8ac50aeff                     call       0x7f63db6ea760
034b4 0f1f8400ac35002b               nop        dword ptr [rax + rax + 0x2b0035ac]
034bc 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
034c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
034ca e831b2b218                     call       0x7f63f4730900
034cf f4                             hlt        
034d0 448bd0                         mov        r10d, eax
034d3 458d5a08                       lea        r11d, [r10 + 8]
034d7 458bc3                         mov        r8d, r11d
034da be6effffff                     mov        esi, 0xffffff6e
034df 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
034e4 448b1424                       mov        r10d, dword ptr [rsp]
034e8 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
034f0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
034f5 4c891424                       mov        qword ptr [rsp], r10
034f9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
034fe 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
03506 48ff742420                     push       qword ptr [rsp + 0x20]
0350b 488f442410                     pop        qword ptr [rsp + 0x10]
03510 48894424f8                     mov        qword ptr [rsp - 8], rax
03515 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03519 89442418                       mov        dword ptr [rsp + 0x18], eax
0351d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03522 48ff742428                     push       qword ptr [rsp + 0x28]
03527 488f442420                     pop        qword ptr [rsp + 0x20]
0352c 48ff742430                     push       qword ptr [rsp + 0x30]
03531 488f442428                     pop        qword ptr [rsp + 0x28]
03536 48894424f8                     mov        qword ptr [rsp - 8], rax
0353b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0353f 89442430                       mov        dword ptr [rsp + 0x30], eax
03543 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03548 48894424f8                     mov        qword ptr [rsp - 8], rax
0354d 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
03554 89442438                       mov        dword ptr [rsp + 0x38], eax
03558 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0355d 4489442458                     mov        dword ptr [rsp + 0x58], r8d
03562 90                             nop        
03563 90                             nop        
03564 c5f877                         vzeroupper 
03567 e8f44faeff                     call       0x7f63db6ea760
0356c 0f1f84006436002c               nop        dword ptr [rax + rax + 0x2c003664]
03574 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0357e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03582 e879b1b218                     call       0x7f63f4730900
03587 f4                             hlt        
03588 448bd0                         mov        r10d, eax
0358b 458d5a08                       lea        r11d, [r10 + 8]
0358f 458bc3                         mov        r8d, r11d
03592 be66ffffff                     mov        esi, 0xffffff66
03597 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0359c 448b1424                       mov        r10d, dword ptr [rsp]
035a0 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
035a8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
035ad 4c891424                       mov        qword ptr [rsp], r10
035b1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
035b6 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
035be 48ff742420                     push       qword ptr [rsp + 0x20]
035c3 488f442410                     pop        qword ptr [rsp + 0x10]
035c8 48894424f8                     mov        qword ptr [rsp - 8], rax
035cd 8b442444                       mov        eax, dword ptr [rsp + 0x44]
035d1 89442418                       mov        dword ptr [rsp + 0x18], eax
035d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035da 48ff742428                     push       qword ptr [rsp + 0x28]
035df 488f442420                     pop        qword ptr [rsp + 0x20]
035e4 48ff742430                     push       qword ptr [rsp + 0x30]
035e9 488f442428                     pop        qword ptr [rsp + 0x28]
035ee 48894424f8                     mov        qword ptr [rsp - 8], rax
035f3 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
035f7 89442430                       mov        dword ptr [rsp + 0x30], eax
035fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03600 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
03605 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0360a 90                             nop        
0360b 90                             nop        
0360c c5f877                         vzeroupper 
0360f e84c4faeff                     call       0x7f63db6ea760
03614 0f1f84000c37002d               nop        dword ptr [rax + rax + 0x2d00370c]
0361c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
03626 4883e4f0                       and        rsp, 0xfffffffffffffff0
0362a e8d1b0b218                     call       0x7f63f4730900
0362f f4                             hlt        
03630 448bd7                         mov        r10d, edi
03633 e9f7d9ffff                     jmp        0x7f63dbc0322f
03638 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03642 4883e4f0                       and        rsp, 0xfffffffffffffff0
03646 e8b5b0b218                     call       0x7f63f4730900
0364b f4                             hlt        
0364c 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03656 4883e4f0                       and        rsp, 0xfffffffffffffff0
0365a e8a1b0b218                     call       0x7f63f4730900
0365f f4                             hlt        
03660 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
0366a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0366e e88db0b218                     call       0x7f63f4730900
03673 f4                             hlt        
03674 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
0367e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03682 e879b0b218                     call       0x7f63f4730900
03687 f4                             hlt        
03688 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03692 4883e4f0                       and        rsp, 0xfffffffffffffff0
03696 e865b0b218                     call       0x7f63f4730900
0369b f4                             hlt        
0369c 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
036a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
036aa e851b0b218                     call       0x7f63f4730900
036af f4                             hlt        
036b0 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
036ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
036be e83db0b218                     call       0x7f63f4730900
036c3 f4                             hlt        
036c4 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
036ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
036d2 e829b0b218                     call       0x7f63f4730900
036d7 f4                             hlt        
036d8 bee4ffffff                     mov        esi, 0xffffffe4
036dd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
036e2 448b1c24                       mov        r11d, dword ptr [rsp]
036e6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
036ee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
036f3 4c891424                       mov        qword ptr [rsp], r10
036f7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
036fc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03704 48ff742420                     push       qword ptr [rsp + 0x20]
03709 488f442410                     pop        qword ptr [rsp + 0x10]
0370e 48894424f8                     mov        qword ptr [rsp - 8], rax
03713 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03717 89442418                       mov        dword ptr [rsp + 0x18], eax
0371b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03720 48ff742428                     push       qword ptr [rsp + 0x28]
03725 488f442420                     pop        qword ptr [rsp + 0x20]
0372a 48ff742430                     push       qword ptr [rsp + 0x30]
0372f 488f442428                     pop        qword ptr [rsp + 0x28]
03734 48894424f8                     mov        qword ptr [rsp - 8], rax
03739 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0373d 89442430                       mov        dword ptr [rsp + 0x30], eax
03741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03746 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0374a 48894424f8                     mov        qword ptr [rsp - 8], rax
0374f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03753 89442444                       mov        dword ptr [rsp + 0x44], eax
03757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0375c 4489742448                     mov        dword ptr [rsp + 0x48], r14d
03761 90                             nop        
03762 90                             nop        
03763 90                             nop        
03764 c5f877                         vzeroupper 
03767 e8f44daeff                     call       0x7f63db6ea760
0376c 0f1f84006438002e               nop        dword ptr [rax + rax + 0x2e003864]
03774 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0377e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03782 e879afb218                     call       0x7f63f4730900
03787 f4                             hlt        
03788 bee4ffffff                     mov        esi, 0xffffffe4
0378d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03792 448b1c24                       mov        r11d, dword ptr [rsp]
03796 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0379e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
037a3 4c891424                       mov        qword ptr [rsp], r10
037a7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
037ac 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
037b4 48ff742420                     push       qword ptr [rsp + 0x20]
037b9 488f442410                     pop        qword ptr [rsp + 0x10]
037be 48894424f8                     mov        qword ptr [rsp - 8], rax
037c3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
037c7 89442418                       mov        dword ptr [rsp + 0x18], eax
037cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037d0 48ff742428                     push       qword ptr [rsp + 0x28]
037d5 488f442420                     pop        qword ptr [rsp + 0x20]
037da 48ff742430                     push       qword ptr [rsp + 0x30]
037df 488f442428                     pop        qword ptr [rsp + 0x28]
037e4 48894424f8                     mov        qword ptr [rsp - 8], rax
037e9 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
037ed 89442430                       mov        dword ptr [rsp + 0x30], eax
037f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037f6 4489742440                     mov        dword ptr [rsp + 0x40], r14d
037fb 48894424f8                     mov        qword ptr [rsp - 8], rax
03800 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03804 89442444                       mov        dword ptr [rsp + 0x44], eax
03808 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0380d 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03811 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
03816 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0381b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
03820 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03825 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
0382b 90                             nop        
0382c c5f877                         vzeroupper 
0382f e82c4daeff                     call       0x7f63db6ea760
03834 0f1f84002c39002f               nop        dword ptr [rax + rax + 0x2f00392c]
0383c 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
03846 4883e4f0                       and        rsp, 0xfffffffffffffff0
0384a e8b1aeb218                     call       0x7f63f4730900
0384f f4                             hlt        
03850 4183c610                       add        r14d, 0x10
03854 be6effffff                     mov        esi, 0xffffff6e
03859 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0385e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
03866 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0386b 4489542404                     mov        dword ptr [rsp + 4], r10d
03870 48ff742420                     push       qword ptr [rsp + 0x20]
03875 488f442418                     pop        qword ptr [rsp + 0x18]
0387a 48894424f8                     mov        qword ptr [rsp - 8], rax
0387f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03883 89442420                       mov        dword ptr [rsp + 0x20], eax
03887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0388c 48894424f8                     mov        qword ptr [rsp - 8], rax
03891 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03895 89442438                       mov        dword ptr [rsp + 0x38], eax
03899 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0389e 4489742444                     mov        dword ptr [rsp + 0x44], r14d
038a3 4489442448                     mov        dword ptr [rsp + 0x48], r8d
038a8 c5f877                         vzeroupper 
038ab e8b04caeff                     call       0x7f63db6ea760
038b0 0f1f8400a8390030               nop        dword ptr [rax + rax + 0x300039a8]
038b8 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
038c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
038c6 e835aeb218                     call       0x7f63f4730900
038cb f4                             hlt        
038cc 4183c610                       add        r14d, 0x10
038d0 be66ffffff                     mov        esi, 0xffffff66
038d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
038da 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
038e2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
038e7 44895c2404                     mov        dword ptr [rsp + 4], r11d
038ec 48ff742420                     push       qword ptr [rsp + 0x20]
038f1 488f442418                     pop        qword ptr [rsp + 0x18]
038f6 48894424f8                     mov        qword ptr [rsp - 8], rax
038fb 8b442444                       mov        eax, dword ptr [rsp + 0x44]
038ff 89442420                       mov        dword ptr [rsp + 0x20], eax
03903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03908 48894424f8                     mov        qword ptr [rsp - 8], rax
0390d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03911 89442438                       mov        dword ptr [rsp + 0x38], eax
03915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0391a 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0391f 4489442448                     mov        dword ptr [rsp + 0x48], r8d
03924 c5f877                         vzeroupper 
03927 e8344caeff                     call       0x7f63db6ea760
0392c 0f1f8400243a0031               nop        dword ptr [rax + rax + 0x31003a24]
03934 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
0393e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03942 e8b9adb218                     call       0x7f63f4730900
03947 f4                             hlt        
03948 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03952 4883e4f0                       and        rsp, 0xfffffffffffffff0
03956 e8a5adb218                     call       0x7f63f4730900
0395b f4                             hlt        
0395c 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03966 4883e4f0                       and        rsp, 0xfffffffffffffff0
0396a e891adb218                     call       0x7f63f4730900
0396f f4                             hlt        
03970 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
0397a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0397e e87dadb218                     call       0x7f63f4730900
03983 f4                             hlt        
03984 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
0398e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03992 e869adb218                     call       0x7f63f4730900
03997 f4                             hlt        
03998 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
039a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
039a6 e855adb218                     call       0x7f63f4730900
039ab f4                             hlt        
039ac 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
039b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
039ba e841adb218                     call       0x7f63f4730900
039bf f4                             hlt        
039c0 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
039ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
039ce e82dadb218                     call       0x7f63f4730900
039d3 f4                             hlt        
039d4 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
039de 4883e4f0                       and        rsp, 0xfffffffffffffff0
039e2 e819adb218                     call       0x7f63f4730900
039e7 f4                             hlt        
039e8 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
039f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
039f6 e805adb218                     call       0x7f63f4730900
039fb f4                             hlt        
039fc 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a0a e8f1acb218                     call       0x7f63f4730900
03a0f f4                             hlt        
03a10 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03a1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a1e e8ddacb218                     call       0x7f63f4730900
03a23 f4                             hlt        
03a24 48bff09a94b4637f0000           movabs     rdi, 0x7f63b4949af0
03a2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a32 e8c9acb218                     call       0x7f63f4730900
03a37 f4                             hlt        
03a38 bef6ffffff                     mov        esi, 0xfffffff6
03a3d 488bea                         mov        rbp, rdx
03a40 898424d0000000                 mov        dword ptr [rsp + 0xd0], eax
03a47 90                             nop        
03a48 c5f877                         vzeroupper 
03a4b e8104baeff                     call       0x7f63db6ea760
03a50 0f1f8400483b0032               nop        dword ptr [rax + rax + 0x32003b48]
03a58 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
03a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a66 e895acb218                     call       0x7f63f4730900
03a6b f4                             hlt        
03a6c bef6ffffff                     mov        esi, 0xfffffff6
03a71 90                             nop        
03a72 90                             nop        
03a73 90                             nop        
03a74 c5f877                         vzeroupper 
03a77 e8e44aaeff                     call       0x7f63db6ea760
03a7c 0f1f8400743b0033               nop        dword ptr [rax + rax + 0x33003b74]
03a84 48bf807f34b4637f0000           movabs     rdi, 0x7f63b4347f80
03a8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a92 e869acb218                     call       0x7f63f4730900
03a97 f4                             hlt        
03a98 49ba642ec0db637f0000           movabs     r10, 0x7f63dbc02e64
03aa2 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03aa9 e9b206b4ff                     jmp        0x7f63db746360
03aae e82dd5b2ff                     call       0x7f63db7331e0
03ab3 e986c5ffff                     jmp        0x7f63dbc0223e
