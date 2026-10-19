00000 e8cbcfd518                     call       0x7f63f495ad50
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
00018 4881ecd0000000                 sub        rsp, 0xd0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85b0420000                   jne        0x7f63dbc0205e
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bae38010000                 mov        r13, qword ptr [rsi + 0x138]
0003c 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
00040 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00045 4c8bb628010000                 mov        r14, qword ptr [rsi + 0x128]
0004c 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00053 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00058 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0005f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00066 4c89542408                     mov        qword ptr [rsp + 8], r10
0006b 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00072 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00077 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0007e 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00083 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
0008a 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00092 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
00099 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0009e 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
000b6 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000bd 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000c2 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000c9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000ce 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d2 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000d7 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000db 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000e0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000e7 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
000ec 488bfe                         mov        rdi, rsi
000ef c5f877                         vzeroupper 
000f2 49ba3083b1f4637f0000           movabs     r10, 0x7f63f4b18330
000fc 41ffd2                         call       r10
000ff 0f1f840000000000               nop        dword ptr [rax + rax]
00107 4885db                         test       rbx, rbx
0010a 0f8408220000                   je         0x7f63dbc00098
00110 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00114 41c1eb0a                       shr        r11d, 0xa
00118 4181fb2c080000                 cmp        r11d, 0x82c
0011f 0f857f310000                   jne        0x7f63dbc01024
00125 4c8bd3                         mov        r10, rbx
00128 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0012d 4d85ed                         test       r13, r13
00130 0f84ef210000                   je         0x7f63dbc000a5
00136 458b5504                       mov        r10d, dword ptr [r13 + 4]
0013a 41c1ea0a                       shr        r10d, 0xa
0013e 4181fa0a020000                 cmp        r10d, 0x20a
00145 0f8559310000                   jne        0x7f63dbc01024
0014b 4d8bd5                         mov        r10, r13
0014e 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00156 4d85f6                         test       r14, r14
00159 0f84d6210000                   je         0x7f63dbc000b5
0015f 458b5e04                       mov        r11d, dword ptr [r14 + 4]
00163 41c1eb0a                       shr        r11d, 0xa
00167 4181fb10020000                 cmp        r11d, 0x210
0016e 0f8530310000                   jne        0x7f63dbc01024
00174 4d8bd6                         mov        r10, r14
00177 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0017f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00184 4d85d2                         test       r10, r10
00187 0f84b8210000                   je         0x7f63dbc000c5
0018d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00191 41c1ea0a                       shr        r10d, 0xa
00195 4181fa0e020000                 cmp        r10d, 0x20e
0019c 0f8502310000                   jne        0x7f63dbc01024
001a2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ac 4885ed                         test       rbp, rbp
001af 0f849d210000                   je         0x7f63dbc000d2
001b5 448b5d04                       mov        r11d, dword ptr [rbp + 4]
001b9 41c1eb0a                       shr        r11d, 0xa
001bd 4181fb0e020000                 cmp        r11d, 0x20e
001c4 0f85da300000                   jne        0x7f63dbc01024
001ca 4c8bd5                         mov        r10, rbp
001cd 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001d5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001da 4d85d2                         test       r10, r10
001dd 0f847f210000                   je         0x7f63dbc000e2
001e3 458b5204                       mov        r10d, dword ptr [r10 + 4]
001e7 41c1ea0a                       shr        r10d, 0xa
001eb 4181fa0a020000                 cmp        r10d, 0x20a
001f2 0f85ac300000                   jne        0x7f63dbc01024
001f8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001fd 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00205 e90a050000                     jmp        0x7f63dbbfe494
0020a 448bd5                         mov        r10d, ebp
0020d 4d63d2                         movsxd     r10, r10d
00210 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00217 c442a8f5db                     bzhi       r11, r11, r10
0021c c4c1fb92fb                     kmovq      k7, r11
00221 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00227 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0022d 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00235 4403d5                         add        r10d, ebp
00238 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00240 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00244 418502                         test       dword ptr [r10], eax
00247 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0024f 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00257 0f8d5f080000                   jge        0x7f63dbbfe83c
0025d 448974247c                     mov        dword ptr [rsp + 0x7c], r14d
00262 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00267 442b84248c000000               sub        r8d, dword ptr [rsp + 0x8c]
0026f 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
00276 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
0027d 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
00284 448bb4248c000000               mov        r14d, dword ptr [rsp + 0x8c]
0028c 410f4fee                       cmovg      ebp, r14d
00290 4585c0                         test       r8d, r8d
00293 0f8ccf2a0000                   jl         0x7f63dbc00ae8
00299 448b74247c                     mov        r14d, dword ptr [rsp + 0x7c]
0029e 4585f6                         test       r14d, r14d
002a1 0f8cc12a0000                   jl         0x7f63dbc00ae8
002a7 458d1428                       lea        r10d, [r8 + rbp]
002ab 453bea                         cmp        r13d, r10d
002ae 0f82b42a0000                   jb         0x7f63dbc00ae8
002b4 4403f5                         add        r14d, ebp
002b7 453bee                         cmp        r13d, r14d
002ba 0f82a82a0000                   jb         0x7f63dbc00ae8
002c0 85ed                           test       ebp, ebp
002c2 0f8ca02a0000                   jl         0x7f63dbc00ae8
002c8 85ed                           test       ebp, ebp
002ca 0f845dffffff                   je         0x7f63dbbfdfad
002d0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002d5 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
002dd 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
002e2 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
002e7 4863d5                         movsxd     rdx, ebp
002ea 4883fa20                       cmp        rdx, 0x20
002ee 0f8616ffffff                   jbe        0x7f63dbbfdf8a
002f4 c5f877                         vzeroupper 
002f7 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00301 41ffd2                         call       r10
00304 0f1f840000000000               nop        dword ptr [rax + rax]
0030c e91cffffff                     jmp        0x7f63dbbfdfad
00311 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00316 8b8c248c000000                 mov        ecx, dword ptr [rsp + 0x8c]
0031d 85c9                           test       ecx, ecx
0031f 0f8e07180000                   jle        0x7f63dbbff8ac
00325 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0032d 4503d5                         add        r10d, r13d
00330 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00335 0f8f51190000                   jg         0x7f63dbbffa0c
0033b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00340 4403d3                         add        r10d, ebx
00343 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0034b 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00350 0f8fca190000                   jg         0x7f63dbbffaa0
00356 83fb10                         cmp        ebx, 0x10
00359 0f8f0e080000                   jg         0x7f63dbbfe8ed
0035f 4c8bac2490000000               mov        r13, qword ptr [rsp + 0x90]
00367 458b5d08                       mov        r11d, dword ptr [r13 + 8]
0036b 458d53f1                       lea        r10d, [r11 - 0xf]
0036f 4585d2                         test       r10d, r10d
00372 0f8c98130000                   jl         0x7f63dbbff490
00378 4183c3f1                       add        r11d, -0xf
0037c 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00381 453beb                         cmp        r13d, r11d
00384 0f830e120000                   jae        0x7f63dbbff318
0038a 4c8bac24a8000000               mov        r13, qword ptr [rsp + 0xa8]
00392 458b4508                       mov        r8d, dword ptr [r13 + 8]
00396 448b74247c                     mov        r14d, dword ptr [rsp + 0x7c]
0039b 4c8bac2490000000               mov        r13, qword ptr [rsp + 0x90]
003a3 c4817a6f44350c                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 0xc]
003aa 458d50f1                       lea        r10d, [r8 - 0xf]
003ae 4585d2                         test       r10d, r10d
003b1 0f8c09140000                   jl         0x7f63dbbff540
003b7 4183c0f1                       add        r8d, -0xf
003bb 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
003c3 453be8                         cmp        r13d, r8d
003c6 0f8378120000                   jae        0x7f63dbbff3c4
003cc 468d2c33                       lea        r13d, [rbx + r14]
003d0 4489ac24b0000000               mov        dword ptr [rsp + 0xb0], r13d
003d8 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
003e0 4c8bb424a8000000               mov        r14, qword ptr [rsp + 0xa8]
003e8 c4817a7f442e0c                 vmovdqu    xmmword ptr [r14 + r13 + 0xc], xmm0
003ef 4103dd                         add        ebx, r13d
003f2 448bf3                         mov        r14d, ebx
003f5 442bb4248c000000               sub        r14d, dword ptr [rsp + 0x8c]
003fd 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00405 458b6b08                       mov        r13d, dword ptr [r11 + 8]
00409 458d55f1                       lea        r10d, [r13 - 0xf]
0040d 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00415 4183f910                       cmp        r9d, 0x10
00419 7f44                           jg         0x7f63dbbfe1df
0041b 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00423 4183f810                       cmp        r8d, 0x10
00427 7c36                           jl         0x7f63dbbfe1df
00429 4585d2                         test       r10d, r10d
0042c 0f8c5a160000                   jl         0x7f63dbbff80c
00432 4183c5f1                       add        r13d, -0xf
00436 453bf5                         cmp        r14d, r13d
00439 0f8301150000                   jae        0x7f63dbbff6c0
0043f c4817a6f44330c                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 0xc]
00446 413bdd                         cmp        ebx, r13d
00449 0f8391150000                   jae        0x7f63dbbff760
0044f c4c17a7f441b0c                 vmovdqu    xmmword ptr [r11 + rbx + 0xc], xmm0
00456 458d2c19                       lea        r13d, [r9 + rbx]
0045a e98e020000                     jmp        0x7f63dbbfe46d
0045f 458d45f9                       lea        r8d, [r13 - 7]
00463 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
00468 4403cb                         add        r9d, ebx
0046b 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
00473 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
00478 4963d1                         movsxd     rdx, r9d
0047b 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00483 443b8c2480000000               cmp        r9d, dword ptr [rsp + 0x80]
0048b 0f8ccf040000                   jl         0x7f63dbbfe6e0
00491 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00499 4183fa30                       cmp        r10d, 0x30
0049d 0f8e8a000000                   jle        0x7f63dbbfe2ad
004a3 4585f6                         test       r14d, r14d
004a6 0f8cee1e0000                   jl         0x7f63dbc0011a
004ac 85db                           test       ebx, ebx
004ae 0f8ce61e0000                   jl         0x7f63dbc0011a
004b4 4503d6                         add        r10d, r14d
004b7 453bea                         cmp        r13d, r10d
004ba 0f82da1e0000                   jb         0x7f63dbc0011a
004c0 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
004c8 0f82cc1e0000                   jb         0x7f63dbc0011a
004ce 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
004d6 4585ed                         test       r13d, r13d
004d9 0f8404020000                   je         0x7f63dbbfe463
004df 4963d5                         movsxd     rdx, r13d
004e2 4883fa20                       cmp        rdx, 0x20
004e6 7728                           ja         0x7f63dbbfe290
004e8 458bd5                         mov        r10d, r13d
004eb 4d63d2                         movsxd     r10, r10d
004ee 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
004f5 c442a8f5c0                     bzhi       r8, r8, r10
004fa c4c1fb92f8                     kmovq      k7, r8
004ff 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00505 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0050b e9d3010000                     jmp        0x7f63dbbfe463
00510 c5f877                         vzeroupper 
00513 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
0051d 41ffd2                         call       r10
00520 0f1f840000000000               nop        dword ptr [rax + rax]
00528 e9b6010000                     jmp        0x7f63dbbfe463
0052d 4585c0                         test       r8d, r8d
00530 0f8c521b0000                   jl         0x7f63dbbffe08
00536 458d55f9                       lea        r10d, [r13 - 7]
0053a 453bf2                         cmp        r14d, r10d
0053d 0f83ad190000                   jae        0x7f63dbbffc70
00543 4963ce                         movsxd     rcx, r14d
00546 4d8b440b0c                     mov        r8, qword ptr [r11 + rcx + 0xc]
0054b 413bda                         cmp        ebx, r10d
0054e 0f836c1a0000                   jae        0x7f63dbbffd40
00554 448bcb                         mov        r9d, ebx
00557 418d7908                       lea        edi, [r9 + 8]
0055b 4963f1                         movsxd     rsi, r9d
0055e 4d8944330c                     mov        qword ptr [r11 + rsi + 0xc], r8
00563 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
0056a 0f8d73010000                   jge        0x7f63dbbfe463
00570 482bce                         sub        rcx, rsi
00573 4963f5                         movsxd     rsi, r13d
00576 4883c6f9                       add        rsi, -7
0057a 4863c7                         movsxd     rax, edi
0057d 4c8d0408                       lea        r8, [rax + rcx]
00581 4c3bc6                         cmp        r8, rsi
00584 0f83ce1b0000                   jae        0x7f63dbbffed8
0058a 4c8bc2                         mov        r8, rdx
0058d 4c2bc0                         sub        r8, rax
00590 4983c007                       add        r8, 7
00594 4983e0f8                       and        r8, 0xfffffffffffffff8
00598 458bc0                         mov        r8d, r8d
0059b 478d440808                     lea        r8d, [r8 + r9 + 8]
005a0 4d63c0                         movsxd     r8, r8d
005a3 498d4408f8                     lea        rax, [r8 + rcx - 8]
005a8 483bc6                         cmp        rax, rsi
005ab 0f83a71b0000                   jae        0x7f63dbbffed8
005b1 413bfa                         cmp        edi, r10d
005b4 0f839e1b0000                   jae        0x7f63dbbffed8
005ba 4983c0f8                       add        r8, -8
005be 4c3bc6                         cmp        r8, rsi
005c1 0f83911b0000                   jae        0x7f63dbbffed8
005c7 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
005cf 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
005d6 0f8f381c0000                   jg         0x7f63dbbfff94
005dc 452bf1                         sub        r14d, r9d
005df 4183c110                       add        r9d, 0x10
005e3 448bdf                         mov        r11d, edi
005e6 418d043e                       lea        eax, [r14 + rdi]
005ea 4c8bac24a8000000               mov        r13, qword ptr [rsp + 0xa8]
005f2 4d8b44050c                     mov        r8, qword ptr [r13 + rax + 0xc]
005f7 4f89441d0c                     mov        qword ptr [r13 + r11 + 0xc], r8
005fc 448d5f08                       lea        r11d, [rdi + 8]
00600 453bd9                         cmp        r11d, r9d
00603 7d05                           jge        0x7f63dbbfe38a
00605 418bfb                         mov        edi, r11d
00608 ebd9                           jmp        0x7f63dbbfe363
0060a 4883c2f8                       add        rdx, -8
0060e 4881fa00000080                 cmp        rdx, -0x80000000
00615 49c7c000000080                 mov        r8, 0xffffffff80000000
0061c 490f4cd0                       cmovl      rdx, r8
00620 448bca                         mov        r9d, edx
00623 453bd9                         cmp        r11d, r9d
00626 7d6f                           jge        0x7f63dbbfe417
00628 4d63c3                         movsxd     r8, r11d
0062b 4c03c1                         add        r8, rcx
0062e 4c3bc6                         cmp        r8, rsi
00631 0f83911c0000                   jae        0x7f63dbc00048
00637 83c710                         add        edi, 0x10
0063a 4c63c7                         movsxd     r8, edi
0063d 4c03c1                         add        r8, rcx
00640 4c3bc6                         cmp        r8, rsi
00643 0f83931c0000                   jae        0x7f63dbc0005c
00649 453bda                         cmp        r11d, r10d
0064c 0f839e1c0000                   jae        0x7f63dbc00070
00652 413bfa                         cmp        edi, r10d
00655 0f83a91c0000                   jae        0x7f63dbc00084
0065b 90                             nop        
0065c 90                             nop        
0065d 90                             nop        
0065e 90                             nop        
0065f 90                             nop        
00660 418bfb                         mov        edi, r11d
00663 4863ef                         movsxd     rbp, edi
00666 458bc3                         mov        r8d, r11d
00669 438d041e                       lea        eax, [r14 + r11]
0066d 8bf8                           mov        edi, eax
0066f 4c8bac24a8000000               mov        r13, qword ptr [rsp + 0xa8]
00677 498b54050c                     mov        rdx, qword ptr [r13 + rax + 0xc]
0067c 4b8954050c                     mov        qword ptr [r13 + r8 + 0xc], rdx
00681 4c63c7                         movsxd     r8, edi
00684 4f8b440514                     mov        r8, qword ptr [r13 + r8 + 0x14]
00689 4d89442d14                     mov        qword ptr [r13 + rbp + 0x14], r8
0068e 4183c310                       add        r11d, 0x10
00692 453bd9                         cmp        r11d, r9d
00695 7cc9                           jl         0x7f63dbbfe3e0
00697 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0069f 7d42                           jge        0x7f63dbbfe463
006a1 4d63c3                         movsxd     r8, r11d
006a4 4c03c1                         add        r8, rcx
006a7 4c3bc6                         cmp        r8, rsi
006aa 0f83c21c0000                   jae        0x7f63dbc000f2
006b0 453bda                         cmp        r11d, r10d
006b3 0f83cd1c0000                   jae        0x7f63dbc00106
006b9 90                             nop        
006ba 90                             nop        
006bb 90                             nop        
006bc 458bd3                         mov        r10d, r11d
006bf 478d0c1e                       lea        r9d, [r14 + r11]
006c3 4c8bac24a8000000               mov        r13, qword ptr [rsp + 0xa8]
006cb 4f8b440d0c                     mov        r8, qword ptr [r13 + r9 + 0xc]
006d0 4f8944150c                     mov        qword ptr [r13 + r10 + 0xc], r8
006d5 4183c308                       add        r11d, 8
006d9 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
006e1 7cd9                           jl         0x7f63dbbfe43c
006e3 039c2480000000                 add        ebx, dword ptr [rsp + 0x80]
006ea 448beb                         mov        r13d, ebx
006ed 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006f2 41ffc3                         inc        r11d
006f5 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006fa 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006fe 418502                         test       dword ptr [r10], eax
00701 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00709 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00710 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
00714 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
00719 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
00721 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00726 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0072b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0072f 3b4c2428                       cmp        ecx, dword ptr [rsp + 0x28]
00733 0f8d6b060000                   jge        0x7f63dbbfeb24
00739 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00741 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00744 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00748 3bd9                           cmp        ebx, ecx
0074a 0f83c80d0000                   jae        0x7f63dbbff298
00750 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00758 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0075d 4e8b5cdb10                     mov        r11, qword ptr [rbx + r11*8 + 0x10]
00762 418bdb                         mov        ebx, r11d
00765 81e3ffff0100                   and        ebx, 0x1ffff
0076b 498bcb                         mov        rcx, r11
0076e 48c1e912                       shr        rcx, 0x12
00772 49c1fb24                       sar        r11, 0x24
00776 448be9                         mov        r13d, ecx
00779 458bdb                         mov        r11d, r11d
0077c 418bfb                         mov        edi, r11d
0077f 4181e5ffff0300                 and        r13d, 0x3ffff
00786 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
0078e 4585db                         test       r11d, r11d
00791 0f8cc5130000                   jl         0x7f63dbbff8dc
00797 85db                           test       ebx, ebx
00799 0f85c8000000                   jne        0x7f63dbbfe5e7
0079f 33db                           xor        ebx, ebx
007a1 4183fb03                       cmp        r11d, 3
007a5 0f8ef5000000                   jle        0x7f63dbbfe620
007ab 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
007b3 458b5508                       mov        r10d, dword ptr [r13 + 8]
007b7 4183c3fd                       add        r11d, -3
007bb 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
007c3 4183fa02                       cmp        r10d, 2
007c7 0f86c7100000                   jbe        0x7f63dbbff614
007cd 458b5d10                       mov        r11d, dword ptr [r13 + 0x10]
007d1 45895d14                       mov        dword ptr [r13 + 0x14], r11d
007d5 458b550c                       mov        r10d, dword ptr [r13 + 0xc]
007d9 45895510                       mov        dword ptr [r13 + 0x10], r10d
007dd 4c8bb424a0000000               mov        r14, qword ptr [rsp + 0xa0]
007e5 448bac248c000000               mov        r13d, dword ptr [rsp + 0x8c]
007ed 45896e0c                       mov        dword ptr [r14 + 0xc], r13d
007f1 4c6394248c000000               movsxd     r10, dword ptr [rsp + 0x8c]
007f9 4c891424                       mov        qword ptr [rsp], r10
007fd 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
00805 4c03542450                     add        r10, qword ptr [rsp + 0x50]
0080a 4863d3                         movsxd     rdx, ebx
0080d 4c03d2                         add        r10, rdx
00810 488b0c24                       mov        rcx, qword ptr [rsp]
00814 493bca                         cmp        rcx, r10
00817 0f8fc7130000                   jg         0x7f63dbbff964
0081d 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00825 4403eb                         add        r13d, ebx
00828 458bf5                         mov        r14d, r13d
0082b 442bb4248c000000               sub        r14d, dword ptr [rsp + 0x8c]
00833 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00838 4585db                         test       r11d, r11d
0083b 0f85d0faffff                   jne        0x7f63dbbfe091
00841 4d63de                         movsxd     r11, r14d
00844 4c3b5c2458                     cmp        r11, qword ptr [rsp + 0x58]
00849 0f8c71150000                   jl         0x7f63dbbffb40
0084f 483b4c2460                     cmp        rcx, qword ptr [rsp + 0x60]
00854 0f8ffe150000                   jg         0x7f63dbbffbd8
0085a 4533db                         xor        r11d, r11d
0085d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00862 e9affaffff                     jmp        0x7f63dbbfe096
00867 413bda                         cmp        ebx, r10d
0086a 0f8e31ffffff                   jle        0x7f63dbbfe521
00870 be45ffffff                     mov        esi, 0xffffff45
00875 8beb                           mov        ebp, ebx
00877 44891424                       mov        dword ptr [rsp], r10d
0087b 90                             nop        
0087c c5f877                         vzeroupper 
0087f e85cc1aeff                     call       0x7f63db6ea760
00884 0f1f84007c090002               nop        dword ptr [rax + rax + 0x200097c]
0088c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
00896 4883e4f0                       and        rsp, 0xfffffffffffffff0
0089a e8e122b318                     call       0x7f63f4730900
0089f f4                             hlt        
008a0 85db                           test       ebx, ebx
008a2 7407                           je         0x7f63dbbfe62b
008a4 458d53ff                       lea        r10d, [r11 - 1]
008a8 418bfa                         mov        edi, r10d
008ab 85ff                           test       edi, edi
008ad 751e                           jne        0x7f63dbbfe64d
008af 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
008b7 458b5d08                       mov        r11d, dword ptr [r13 + 8]
008bb 4585db                         test       r11d, r11d
008be 0f86481e0000                   jbe        0x7f63dbc0048c
008c4 458b6d0c                       mov        r13d, dword ptr [r13 + 0xc]
008c8 e986000000                     jmp        0x7f63dbbfe6d3
008cd 83ff03                         cmp        edi, 3
008d0 0f84fe250000                   je         0x7f63dbc00c54
008d6 83ff02                         cmp        edi, 2
008d9 0f8799260000                   ja         0x7f63dbc00cf8
008df 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
008e7 458b5508                       mov        r10d, dword ptr [r13 + 8]
008eb 413bfa                         cmp        edi, r10d
008ee 0f83af1c0000                   jae        0x7f63dbc00323
008f4 458b6cbd0c                     mov        r13d, dword ptr [r13 + rdi*4 + 0xc]
008f9 85ff                           test       edi, edi
008fb 7e41                           jle        0x7f63dbbfe6be
008fd 4585d2                         test       r10d, r10d
00900 0f861a250000                   jbe        0x7f63dbc00ba0
00906 448d5fff                       lea        r11d, [rdi - 1]
0090a 453bda                         cmp        r11d, r10d
0090d 0f830d250000                   jae        0x7f63dbc00ba0
00913 4183fa01                       cmp        r10d, 1
00917 0f8603250000                   jbe        0x7f63dbc00ba0
0091d 90                             nop        
0091e 90                             nop        
0091f 90                             nop        
00920 4c8bb424a0000000               mov        r14, qword ptr [rsp + 0xa0]
00928 418b4cbe08                     mov        ecx, dword ptr [r14 + rdi*4 + 8]
0092d 41894cbe0c                     mov        dword ptr [r14 + rdi*4 + 0xc], ecx
00932 448d5fff                       lea        r11d, [rdi - 1]
00936 418bfb                         mov        edi, r11d
00939 4585db                         test       r11d, r11d
0093c 7fe2                           jg         0x7f63dbbfe6a0
0093e 4585d2                         test       r10d, r10d
00941 0f861d1d0000                   jbe        0x7f63dbc003e4
00947 4c8bb424a0000000               mov        r14, qword ptr [rsp + 0xa0]
0094f 45896e0c                       mov        dword ptr [r14 + 0xc], r13d
00953 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
0095b e991feffff                     jmp        0x7f63dbbfe571
00960 4183f910                       cmp        r9d, 0x10
00964 0f8dd1080000                   jge        0x7f63dbbfefbb
0096a 4183f908                       cmp        r9d, 8
0096e 0f8de3040000                   jge        0x7f63dbbfebd7
00974 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
0097c 4183f910                       cmp        r9d, 0x10
00980 0f8f43010000                   jg         0x7f63dbbfe849
00986 453bf5                         cmp        r14d, r13d
00989 0f83091e0000                   jae        0x7f63dbc00518
0098f 430fbe6c330c                   movsx      ebp, byte ptr [r11 + r14 + 0xc]
00995 413bdd                         cmp        ebx, r13d
00998 0f83ba1e0000                   jae        0x7f63dbc005d8
0099e 41886c1b0c                     mov        byte ptr [r11 + rbx + 0xc], bpl
009a3 8d4b01                         lea        ecx, [rbx + 1]
009a6 458d4e03                       lea        r9d, [r14 + 3]
009aa 453bcd                         cmp        r9d, r13d
009ad 0f83391f0000                   jae        0x7f63dbc0066c
009b3 4d63d6                         movsxd     r10, r14d
009b6 430fbe6c130d                   movsx      ebp, byte ptr [r11 + r10 + 0xd]
009bc 448d4b03                       lea        r9d, [rbx + 3]
009c0 453bcd                         cmp        r9d, r13d
009c3 0f83e31f0000                   jae        0x7f63dbc0072c
009c9 4863cb                         movsxd     rcx, ebx
009cc 41886c0b0d                     mov        byte ptr [r11 + rcx + 0xd], bpl
009d1 470fbe4c130e                   movsx      r9d, byte ptr [r11 + r10 + 0xe]
009d7 45884c0b0e                     mov        byte ptr [r11 + rcx + 0xe], r9b
009dc 470fbe4c130f                   movsx      r9d, byte ptr [r11 + r10 + 0xf]
009e2 45884c0b0f                     mov        byte ptr [r11 + rcx + 0xf], r9b
009e7 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
009ef 4183f908                       cmp        r9d, 8
009f3 0f8353200000                   jae        0x7f63dbc007cc
009f9 49b9f0ef2fe300000000           movabs     r9, 0xe32feff0
00a03 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a0b 470374910c                     add        r14d, dword ptr [r9 + r10*4 + 0xc]
00a10 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00a18 4183f904                       cmp        r9d, 4
00a1c 7e40                           jle        0x7f63dbbfe7de
00a1e 458d4dfd                       lea        r9d, [r13 - 3]
00a22 448d5304                       lea        r10d, [rbx + 4]
00a26 418bd2                         mov        edx, r10d
00a29 4585c9                         test       r9d, r9d
00a2c 0f8c56220000                   jl         0x7f63dbc00a08
00a32 458bcd                         mov        r9d, r13d
00a35 4183c1fd                       add        r9d, -3
00a39 453bf1                         cmp        r14d, r9d
00a3c 0f83b2200000                   jae        0x7f63dbc00874
00a42 418bce                         mov        ecx, r14d
00a45 418b6c0b0c                     mov        ebp, dword ptr [r11 + rcx + 0xc]
00a4a 453bd1                         cmp        r10d, r9d
00a4d 0f8381210000                   jae        0x7f63dbc00954
00a53 448bcb                         mov        r9d, ebx
00a56 4d63d1                         movsxd     r10, r9d
00a59 43896c1310                     mov        dword ptr [r11 + r10 + 0x10], ebp
00a5e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00a66 4183fa08                       cmp        r10d, 8
00a6a 7e50                           jle        0x7f63dbbfe83c
00a6c 8d4b08                         lea        ecx, [rbx + 8]
00a6f 49b920f02fe300000000           movabs     r9, 0xe32ff020
00a79 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a81 478b54910c                     mov        r10d, dword ptr [r9 + r10*4 + 0xc]
00a86 452bf2                         sub        r14d, r10d
00a89 418d6e08                       lea        ebp, [r14 + 8]
00a8d 4585c0                         test       r8d, r8d
00a90 0f8cba260000                   jl         0x7f63dbc00ed0
00a96 4183c5f9                       add        r13d, -7
00a9a 413bed                         cmp        ebp, r13d
00a9d 0f8379250000                   jae        0x7f63dbc00d9c
00aa3 4d63d6                         movsxd     r10, r14d
00aa6 4b8b6c1314                     mov        rbp, qword ptr [r11 + r10 + 0x14]
00aab 413bcd                         cmp        ecx, r13d
00aae 0f830c260000                   jae        0x7f63dbc00e40
00ab4 4c63d3                         movsxd     r10, ebx
00ab7 4b896c1314                     mov        qword ptr [r11 + r10 + 0x14], rbp
00abc 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00ac4 e924fcffff                     jmp        0x7f63dbbfe46d
00ac9 4585f6                         test       r14d, r14d
00acc 0f8c22270000                   jl         0x7f63dbc00f74
00ad2 85db                           test       ebx, ebx
00ad4 0f8c1a270000                   jl         0x7f63dbc00f74
00ada 443beb                         cmp        r13d, ebx
00add 0f8211270000                   jb         0x7f63dbc00f74
00ae3 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00aeb 4403d3                         add        r10d, ebx
00aee 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00af3 453bea                         cmp        r13d, r10d
00af6 0f82f8260000                   jb         0x7f63dbc00f74
00afc 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00b04 4585d2                         test       r10d, r10d
00b07 0f8ce7260000                   jl         0x7f63dbc00f74
00b0d 4585d2                         test       r10d, r10d
00b10 0f844cf7ffff                   je         0x7f63dbbfdfe2
00b16 4c8b1424                       mov        r10, qword ptr [rsp]
00b1a 4983fa20                       cmp        r10, 0x20
00b1e 772d                           ja         0x7f63dbbfe8cd
00b20 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00b28 4d63d0                         movsxd     r10, r8d
00b2b 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
00b32 c442a8f5c0                     bzhi       r8, r8, r10
00b37 c4c1fb92f8                     kmovq      k7, r8
00b3c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b42 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b48 e915f7ffff                     jmp        0x7f63dbbfdfe2
00b4d 498bd2                         mov        rdx, r10
00b50 c5f877                         vzeroupper 
00b53 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00b5d 41ffd2                         call       r10
00b60 0f1f840000000000               nop        dword ptr [rax + rax]
00b68 e9f5f6ffff                     jmp        0x7f63dbbfdfe2
00b6d 83fb30                         cmp        ebx, 0x30
00b70 0f8eb3000000                   jle        0x7f63dbbfe9a9
00b76 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00b7e 418b4a08                       mov        ecx, dword ptr [r10 + 8]
00b82 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b8a 418b7208                       mov        esi, dword ptr [r10 + 8]
00b8e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b93 4585d2                         test       r10d, r10d
00b96 0f8cec290000                   jl         0x7f63dbc01308
00b9c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00ba4 4585db                         test       r11d, r11d
00ba7 0f8cdb290000                   jl         0x7f63dbc01308
00bad 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
00bb4 0f82ce290000                   jb         0x7f63dbc01308
00bba 413bf5                         cmp        esi, r13d
00bbd 0f82c5290000                   jb         0x7f63dbc01308
00bc3 85db                           test       ebx, ebx
00bc5 7440                           je         0x7f63dbbfe987
00bc7 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00bcf 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00bd4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00bdc 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00be1 4883fa20                       cmp        rdx, 0x20
00be5 7728                           ja         0x7f63dbbfe98f
00be7 4c63d3                         movsxd     r10, ebx
00bea 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bf1 c442a8f5db                     bzhi       r11, r11, r10
00bf6 c4c1fb92fb                     kmovq      k7, r11
00bfb 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c01 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c07 418bdd                         mov        ebx, r13d
00c0a e9eef7ffff                     jmp        0x7f63dbbfe17d
00c0f c5f877                         vzeroupper 
00c12 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00c1c 41ffd2                         call       r10
00c1f 0f1f840000000000               nop        dword ptr [rax + rax]
00c27 ebde                           jmp        0x7f63dbbfe987
00c29 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00c31 418b4a08                       mov        ecx, dword ptr [r10 + 8]
00c35 8d69f1                         lea        ebp, [rcx - 0xf]
00c38 85ed                           test       ebp, ebp
00c3a 0f8ca0280000                   jl         0x7f63dbc01260
00c40 8d69f1                         lea        ebp, [rcx - 0xf]
00c43 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c48 443bdd                         cmp        r11d, ebp
00c4b 0f8307270000                   jae        0x7f63dbc010d8
00c51 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00c59 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00c5d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c62 418bc2                         mov        eax, r10d
00c65 418d6bf1                       lea        ebp, [r11 - 0xf]
00c69 4963fa                         movsxd     rdi, r10d
00c6c 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00c74 c4c17a6f443a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rdi + 0xc]
00c7b 85ed                           test       ebp, ebp
00c7d 0f8ccd290000                   jl         0x7f63dbc013d0
00c83 458d43f1                       lea        r8d, [r11 - 0xf]
00c87 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c8f 453bd0                         cmp        r10d, r8d
00c92 0f8368270000                   jae        0x7f63dbc01180
00c98 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00ca0 418bf1                         mov        esi, r9d
00ca3 4963d1                         movsxd     rdx, r9d
00ca6 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00cae c4c17a7f44120c                 vmovdqu    xmmword ptr [r10 + rdx + 0xc], xmm0
00cb5 458d5110                       lea        r10d, [r9 + 0x10]
00cb9 458bca                         mov        r9d, r10d
00cbc 453bd5                         cmp        r10d, r13d
00cbf 0f8da9000000                   jge        0x7f63dbbfeaee
00cc5 482bfa                         sub        rdi, rdx
00cc8 4863d1                         movsxd     rdx, ecx
00ccb 4883c2f1                       add        rdx, -0xf
00ccf 4963ca                         movsxd     rcx, r10d
00cd2 4c8d1439                       lea        r10, [rcx + rdi]
00cd6 4c3bd2                         cmp        r10, rdx
00cd9 0f83312a0000                   jae        0x7f63dbc01490
00cdf 4d63d5                         movsxd     r10, r13d
00ce2 4c2bd1                         sub        r10, rcx
00ce5 4983c20f                       add        r10, 0xf
00ce9 4983e2f0                       and        r10, 0xfffffffffffffff0
00ced 458bd2                         mov        r10d, r10d
00cf0 458d543210                     lea        r10d, [r10 + rsi + 0x10]
00cf5 4d63d2                         movsxd     r10, r10d
00cf8 498d4c3af0                     lea        rcx, [r10 + rdi - 0x10]
00cfd 483bca                         cmp        rcx, rdx
00d00 0f830a2a0000                   jae        0x7f63dbc01490
00d06 453bc8                         cmp        r9d, r8d
00d09 0f83012a0000                   jae        0x7f63dbc01490
00d0f 4d63db                         movsxd     r11, r11d
00d12 4983c2f0                       add        r10, -0x10
00d16 4983c3f1                       add        r11, -0xf
00d1a 4d3bd3                         cmp        r10, r11
00d1d 0f83ed290000                   jae        0x7f63dbc01490
00d23 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d2a 0f8f8c2a0000                   jg         0x7f63dbc0153c
00d30 448bc0                         mov        r8d, eax
00d33 442bc6                         sub        r8d, esi
00d36 90                             nop        
00d37 90                             nop        
00d38 90                             nop        
00d39 90                             nop        
00d3a 90                             nop        
00d3b 90                             nop        
00d3c 90                             nop        
00d3d 90                             nop        
00d3e 90                             nop        
00d3f 90                             nop        
00d40 458bd1                         mov        r10d, r9d
00d43 478d1c08                       lea        r11d, [r8 + r9]
00d47 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00d4f c4a17a6f44190c                 vmovdqu    xmm0, xmmword ptr [rcx + r11 + 0xc]
00d56 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00d5e c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00d65 4183c110                       add        r9d, 0x10
00d69 453bcd                         cmp        r9d, r13d
00d6c 7cd2                           jl         0x7f63dbbfeac0
00d6e 03d8                           add        ebx, eax
00d70 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
00d77 418bdd                         mov        ebx, r13d
00d7a e97ef6ffff                     jmp        0x7f63dbbfe17d
00d7f 4d63d2                         movsxd     r10, r10d
00d82 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d89 c442a8f5db                     bzhi       r11, r11, r10
00d8e c4c1fb92fb                     kmovq      k7, r11
00d93 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d99 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d9f e994000000                     jmp        0x7f63dbbfebb8
00da4 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00dac 448b5908                       mov        r11d, dword ptr [rcx + 8]
00db0 4c8bb424a8000000               mov        r14, qword ptr [rsp + 0xa8]
00db8 418b7e08                       mov        edi, dword ptr [r14 + 8]
00dbc 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00dc1 4585ed                         test       r13d, r13d
00dc4 0f8c4e250000                   jl         0x7f63dbc01098
00dca 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00dd1 85db                           test       ebx, ebx
00dd3 0f8c46250000                   jl         0x7f63dbc0109f
00dd9 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00dde 0f823b250000                   jb         0x7f63dbc0109f
00de4 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00deb 4103ea                         add        ebp, r10d
00dee 3bfd                           cmp        edi, ebp
00df0 0f8229250000                   jb         0x7f63dbc0109f
00df6 4585d2                         test       r10d, r10d
00df9 0f8c20250000                   jl         0x7f63dbc0109f
00dff 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e03 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e07 742f                           je         0x7f63dbbfebb8
00e09 4b8d740e0c                     lea        rsi, [r14 + r9 + 0xc]
00e0e 4a8d7c010c                     lea        rdi, [rcx + r8 + 0xc]
00e13 4963d2                         movsxd     rdx, r10d
00e16 4883fa20                       cmp        rdx, 0x20
00e1a 0f865fffffff                   jbe        0x7f63dbbfeaff
00e20 c5f877                         vzeroupper 
00e23 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00e2d 41ffd2                         call       r10
00e30 0f1f840000000000               nop        dword ptr [rax + rax]
00e38 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00e3d 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00e41 c5f877                         vzeroupper 
00e44 4881c4d0000000                 add        rsp, 0xd0
00e4b 5d                             pop        rbp
00e4c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e50 0f8772340000                   ja         0x7f63dbc02048
00e56 c3                             ret        
00e57 4585c0                         test       r8d, r8d
00e5a 0f8c5c2b0000                   jl         0x7f63dbc0173c
00e60 458d55f9                       lea        r10d, [r13 - 7]
00e64 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00e6c 453bf2                         cmp        r14d, r10d
00e6f 0f83f3290000                   jae        0x7f63dbc015e8
00e75 418bce                         mov        ecx, r14d
00e78 4863f9                         movsxd     rdi, ecx
00e7b 4d8b4c3b0c                     mov        r9, qword ptr [r11 + rdi + 0xc]
00e80 413bda                         cmp        ebx, r10d
00e83 0f83872a0000                   jae        0x7f63dbc01690
00e89 448bc3                         mov        r8d, ebx
00e8c 458d5008                       lea        r10d, [r8 + 8]
00e90 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00e95 4963f0                         movsxd     rsi, r8d
00e98 4d894c330c                     mov        qword ptr [r11 + rsi + 0xc], r9
00e9d 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00ea5 0f8d83030000                   jge        0x7f63dbbfefae
00eab 482bfe                         sub        rdi, rsi
00eae 4963f5                         movsxd     rsi, r13d
00eb1 4883c6f9                       add        rsi, -7
00eb5 4d63ca                         movsxd     r9, r10d
00eb8 498d0439                       lea        rax, [r9 + rdi]
00ebc 483bc6                         cmp        rax, rsi
00ebf 0f83a72b0000                   jae        0x7f63dbc017ec
00ec5 488bc2                         mov        rax, rdx
00ec8 492bc1                         sub        rax, r9
00ecb 4883c007                       add        rax, 7
00ecf 4883e0f8                       and        rax, 0xfffffffffffffff8
00ed3 448be8                         mov        r13d, eax
00ed6 478d6c0508                     lea        r13d, [r13 + r8 + 8]
00edb 4963c5                         movsxd     rax, r13d
00ede 488d6c38f8                     lea        rbp, [rax + rdi - 8]
00ee3 483bee                         cmp        rbp, rsi
00ee6 0f83802b0000                   jae        0x7f63dbc017ec
00eec 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00ef4 0f83722b0000                   jae        0x7f63dbc017ec
00efa 4883c0f8                       add        rax, -8
00efe 483bc6                         cmp        rax, rsi
00f01 0f83652b0000                   jae        0x7f63dbc017ec
00f07 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00f0f 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00f16 0f8ff42b0000                   jg         0x7f63dbc01890
00f1c 448be9                         mov        r13d, ecx
00f1f 452be8                         sub        r13d, r8d
00f22 44892c24                       mov        dword ptr [rsp], r13d
00f26 498bcb                         mov        rcx, r11
00f29 4c8d52c8                       lea        r10, [rdx - 0x38]
00f2d 4981fa00000080                 cmp        r10, -0x80000000
00f34 48c7c000000080                 mov        rax, 0xffffffff80000000
00f3b 4c0f4cd0                       cmovl      r10, rax
00f3f 458bea                         mov        r13d, r10d
00f42 442bf3                         sub        r14d, ebx
00f45 458bd3                         mov        r10d, r11d
00f48 bbf4ffffff                     mov        ebx, 0xfffffff4
00f4d 412bda                         sub        ebx, r10d
00f50 412bd8                         sub        ebx, r8d
00f53 4183c010                       add        r8d, 0x10
00f57 83c3f0                         add        ebx, -0x10
00f5a 4963c0                         movsxd     rax, r8d
00f5d 41ba06000000                   mov        r10d, 6
00f63 c462a8f5d3                     bzhi       r10, rbx, r10
00f68 4903c2                         add        rax, r10
00f6b 483bc2                         cmp        rax, rdx
00f6e 488bda                         mov        rbx, rdx
00f71 480f4cd8                       cmovl      rbx, rax
00f75 4c8bd3                         mov        r10, rbx
00f78 4d2bd1                         sub        r10, r9
00f7b 498d42ff                       lea        rax, [r10 - 1]
00f7f 48c1f83f                       sar        rax, 0x3f
00f83 48c1e83d                       shr        rax, 0x3d
00f87 4e8d5410ff                     lea        r10, [rax + r10 - 1]
00f8c 4983e2f8                       and        r10, 0xfffffffffffffff8
00f90 4d03d1                         add        r10, r9
00f93 4d3bca                         cmp        r9, r10
00f96 4d0f4cca                       cmovl      r9, r10
00f9a 458bd1                         mov        r10d, r9d
00f9d 478d741608                     lea        r14d, [r14 + r10 + 8]
00fa2 4183c208                       add        r10d, 8
00fa6 4963c6                         movsxd     rax, r14d
00fa9 4803c1                         add        rax, rcx
00fac 4963ea                         movsxd     rbp, r10d
00faf 4803e9                         add        rbp, rcx
00fb2 4c8d480c                       lea        r9, [rax + 0xc]
00fb6 4883c04c                       add        rax, 0x4c
00fba 488d4d4c                       lea        rcx, [rbp + 0x4c]
00fbe 4533d2                         xor        r10d, r10d
00fc1 493bc9                         cmp        rcx, r9
00fc4 410f96c2                       setbe      r10b
00fc8 4883c50c                       add        rbp, 0xc
00fcc 4533f6                         xor        r14d, r14d
00fcf 483bc5                         cmp        rax, rbp
00fd2 410f96c6                       setbe      r14b
00fd6 450bd6                         or         r10d, r14d
00fd9 0f8461140000                   je         0x7f63dbc001c0
00fdf 448bcb                         mov        r9d, ebx
00fe2 eb04                           jmp        0x7f63dbbfed68
00fe4 895c2468                       mov        dword ptr [rsp + 0x68], ebx
00fe8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00fed 448b0424                       mov        r8d, dword ptr [rsp]
00ff1 4403442468                     add        r8d, dword ptr [rsp + 0x68]
00ff6 4f8b44030c                     mov        r8, qword ptr [r11 + r8 + 0xc]
00ffb 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
01000 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01004 83c308                         add        ebx, 8
01007 413bd9                         cmp        ebx, r9d
0100a 7cd8                           jl         0x7f63dbbfed64
0100c 4881c208feffff                 add        rdx, -0x1f8
01013 4881fa00000080                 cmp        rdx, -0x80000000
0101a 49c7c200000080                 mov        r10, 0xffffffff80000000
01021 490f4cd2                       cmovl      rdx, r10
01025 8bca                           mov        ecx, edx
01027 3bd9                           cmp        ebx, ecx
01029 0f8d7d2b0000                   jge        0x7f63dbc0192c
0102f 4c63d3                         movsxd     r10, ebx
01032 4c03d7                         add        r10, rdi
01035 4c3bd6                         cmp        r10, rsi
01038 0f837e2b0000                   jae        0x7f63dbc0193c
0103e 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01043 4181c000020000                 add        r8d, 0x200
0104a 4d63d0                         movsxd     r10, r8d
0104d 4c03d7                         add        r10, rdi
01050 4c3bd6                         cmp        r10, rsi
01053 0f83772b0000                   jae        0x7f63dbc01950
01059 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
01060 0f837e2b0000                   jae        0x7f63dbc01964
01066 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
0106e 0f83842b0000                   jae        0x7f63dbc01978
01074 498bd3                         mov        rdx, r11
01077 eb0a                           jmp        0x7f63dbbfee03
01079 90                             nop        
0107a 90                             nop        
0107b 90                             nop        
0107c 90                             nop        
0107d 90                             nop        
0107e 90                             nop        
0107f 90                             nop        
01080 418bda                         mov        ebx, r10d
01083 448bd3                         mov        r10d, ebx
01086 4d63c2                         movsxd     r8, r10d
01089 448bd3                         mov        r10d, ebx
0108c 448b0c24                       mov        r9d, dword ptr [rsp]
01090 4403cb                         add        r9d, ebx
01093 8d8380000000                   lea        eax, [rbx + 0x80]
01099 030424                         add        eax, dword ptr [rsp]
0109c 458bd9                         mov        r11d, r9d
0109f 62b17e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r11 + 0xc]
010aa 62b17e487f84120c000000         vmovdqu32  zmmword ptr [rdx + r10 + 0xc], zmm0
010b5 4963e9                         movsxd     rbp, r9d
010b8 62f17e486f842a4c000000         vmovdqu32  zmm0, zmmword ptr [rdx + rbp + 0x4c]
010c3 62b17e487f84024c000000         vmovdqu32  zmmword ptr [rdx + r8 + 0x4c], zmm0
010ce 448bd8                         mov        r11d, eax
010d1 62b17e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r11 + 0xc]
010dc 62b17e487f84028c000000         vmovdqu32  zmmword ptr [rdx + r8 + 0x8c], zmm0
010e7 4c63d0                         movsxd     r10, eax
010ea 62b17e486f84124c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0x4c]
010f5 62b17e487f8402cc000000         vmovdqu32  zmmword ptr [rdx + r8 + 0xcc], zmm0
01100 448d9300010000                 lea        r10d, [rbx + 0x100]
01107 44031424                       add        r10d, dword ptr [rsp]
0110b 458bca                         mov        r9d, r10d
0110e 62b17e486f84120c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0xc]
01119 62b17e487f84020c010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x10c], zmm0
01124 4d63d1                         movsxd     r10, r9d
01127 62b17e486f84124c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r10 + 0x4c]
01132 62b17e487f84024c010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x14c], zmm0
0113d 62f17e486f842a8c010000         vmovdqu32  zmm0, zmmword ptr [rdx + rbp + 0x18c]
01148 62b17e487f84028c010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x18c], zmm0
01153 62f17e486f842acc010000         vmovdqu32  zmm0, zmmword ptr [rdx + rbp + 0x1cc]
0115e 62b17e487f8402cc010000         vmovdqu32  zmmword ptr [rdx + r8 + 0x1cc], zmm0
01169 448d9300020000                 lea        r10d, [rbx + 0x200]
01170 443bd1                         cmp        r10d, ecx
01173 0f8c07ffffff                   jl         0x7f63dbbfee00
01179 453bd5                         cmp        r10d, r13d
0117c 7d55                           jge        0x7f63dbbfef53
0117e 81c338020000                   add        ebx, 0x238
01184 4c63db                         movsxd     r11, ebx
01187 4c03df                         add        r11, rdi
0118a 4c3bde                         cmp        r11, rsi
0118d 0f83792a0000                   jae        0x7f63dbc0198c
01193 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
0119a 0f83942a0000                   jae        0x7f63dbc019b4
011a0 448b0424                       mov        r8d, dword ptr [rsp]
011a4 4503c2                         add        r8d, r10d
011a7 62b17e486f84020c000000         vmovdqu32  zmm0, zmmword ptr [rdx + r8 + 0xc]
011b2 458bda                         mov        r11d, r10d
011b5 62b17e487f841a0c000000         vmovdqu32  zmmword ptr [rdx + r11 + 0xc], zmm0
011c0 4183c240                       add        r10d, 0x40
011c4 453bd5                         cmp        r10d, r13d
011c7 7cd7                           jl         0x7f63dbbfef20
011c9 48899424a8000000               mov        qword ptr [rsp + 0xa8], rdx
011d1 eb08                           jmp        0x7f63dbbfef5b
011d3 48899424a8000000               mov        qword ptr [rsp + 0xa8], rdx
011db 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
011e3 7d49                           jge        0x7f63dbbfefae
011e5 4d63da                         movsxd     r11, r10d
011e8 4c03df                         add        r11, rdi
011eb 4c3bde                         cmp        r11, rsi
011ee 0f832c2a0000                   jae        0x7f63dbc019a0
011f4 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
011fc 0f83462a0000                   jae        0x7f63dbc019c8
01202 90                             nop        
01203 90                             nop        
01204 448b0424                       mov        r8d, dword ptr [rsp]
01208 4503c2                         add        r8d, r10d
0120b 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
01213 4e8b44030c                     mov        r8, qword ptr [rbx + r8 + 0xc]
01218 458bda                         mov        r11d, r10d
0121b 4e89441b0c                     mov        qword ptr [rbx + r11 + 0xc], r8
01220 4183c208                       add        r10d, 8
01224 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0122c 7cd6                           jl         0x7f63dbbfef84
0122e 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
01236 e9b2f4ffff                     jmp        0x7f63dbbfe46d
0123b 4585d2                         test       r10d, r10d
0123e 0f8c842b0000                   jl         0x7f63dbc01b48
01244 458d45f1                       lea        r8d, [r13 - 0xf]
01248 458bc8                         mov        r9d, r8d
0124b 453bf0                         cmp        r14d, r8d
0124e 0f83082a0000                   jae        0x7f63dbc019dc
01254 4d63c6                         movsxd     r8, r14d
01257 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
0125e 413bd9                         cmp        ebx, r9d
01261 0f83a12a0000                   jae        0x7f63dbc01a88
01267 8d6b10                         lea        ebp, [rbx + 0x10]
0126a 4c63d3                         movsxd     r10, ebx
0126d c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
01274 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
0127b 0f8d8a020000                   jge        0x7f63dbbff28b
01281 4d2bc2                         sub        r8, r10
01284 4963cd                         movsxd     rcx, r13d
01287 4883c1f1                       add        rcx, -0xf
0128b 4863fd                         movsxd     rdi, ebp
0128e 4e8d1407                       lea        r10, [rdi + r8]
01292 4c3bd1                         cmp        r10, rcx
01295 0f83d92b0000                   jae        0x7f63dbc01bf4
0129b 4c8bd2                         mov        r10, rdx
0129e 4c2bd7                         sub        r10, rdi
012a1 4983c20f                       add        r10, 0xf
012a5 4983e2f0                       and        r10, 0xfffffffffffffff0
012a9 458bd2                         mov        r10d, r10d
012ac 418d7c1a10                     lea        edi, [r10 + rbx + 0x10]
012b1 4c63d7                         movsxd     r10, edi
012b4 4b8d7c02f0                     lea        rdi, [r10 + r8 - 0x10]
012b9 483bf9                         cmp        rdi, rcx
012bc 0f83b22b0000                   jae        0x7f63dbc01bf4
012c2 413be9                         cmp        ebp, r9d
012c5 0f83a92b0000                   jae        0x7f63dbc01bf4
012cb 4983c2f0                       add        r10, -0x10
012cf 4c3bd1                         cmp        r10, rcx
012d2 0f839c2b0000                   jae        0x7f63dbc01bf4
012d8 8bbc2488000000                 mov        edi, dword ptr [rsp + 0x88]
012df 81fff0ffff7f                   cmp        edi, 0x7ffffff0
012e5 0f8f0d2c0000                   jg         0x7f63dbc01c78
012eb 442bf3                         sub        r14d, ebx
012ee 83c320                         add        ebx, 0x20
012f1 488bbc24a8000000               mov        rdi, qword ptr [rsp + 0xa8]
012f9 eb04                           jmp        0x7f63dbbff07f
012fb 90                             nop        
012fc 418bea                         mov        ebp, r10d
012ff 448bdd                         mov        r11d, ebp
01302 458d142e                       lea        r10d, [r14 + rbp]
01306 c4a17a6f44170c                 vmovdqu    xmm0, xmmword ptr [rdi + r10 + 0xc]
0130d c4a17a7f441f0c                 vmovdqu    xmmword ptr [rdi + r11 + 0xc], xmm0
01314 448d5510                       lea        r10d, [rbp + 0x10]
01318 443bd3                         cmp        r10d, ebx
0131b 7cdf                           jl         0x7f63dbbff07c
0131d 4881c210ffffff                 add        rdx, -0xf0
01324 4881fa00000080                 cmp        rdx, -0x80000000
0132b 49c7c300000080                 mov        r11, 0xffffffff80000000
01332 490f4cd3                       cmovl      rdx, r11
01336 8bda                           mov        ebx, edx
01338 443bd3                         cmp        r10d, ebx
0133b 0f8d332c0000                   jge        0x7f63dbc01cf4
01341 4d63da                         movsxd     r11, r10d
01344 4d03d8                         add        r11, r8
01347 4c3bd9                         cmp        r11, rcx
0134a 0f83312c0000                   jae        0x7f63dbc01d01
01350 81c500010000                   add        ebp, 0x100
01356 4c63dd                         movsxd     r11, ebp
01359 4d03d8                         add        r11, r8
0135c 4c3bd9                         cmp        r11, rcx
0135f 0f83302c0000                   jae        0x7f63dbc01d15
01365 453bd1                         cmp        r10d, r9d
01368 0f833b2c0000                   jae        0x7f63dbc01d29
0136e 413be9                         cmp        ebp, r9d
01371 0f83462c0000                   jae        0x7f63dbc01d3d
01377 4c8bef                         mov        r13, rdi
0137a 90                             nop        
0137b 90                             nop        
0137c 90                             nop        
0137d 90                             nop        
0137e 90                             nop        
0137f 90                             nop        
01380 458bda                         mov        r11d, r10d
01383 4963d3                         movsxd     rdx, r11d
01386 418bfa                         mov        edi, r10d
01389 478d1c16                       lea        r11d, [r14 + r10]
0138d 418bf3                         mov        esi, r11d
01390 c4817a6f441d0c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xc]
01397 c4c17a7f443d0c                 vmovdqu    xmmword ptr [r13 + rdi + 0xc], xmm0
0139e 4c63de                         movsxd     r11, esi
013a1 c4817a6f441d1c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x1c]
013a8 c4c17a7f44151c                 vmovdqu    xmmword ptr [r13 + rdx + 0x1c], xmm0
013af c4817a6f441d2c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x2c]
013b6 c4c17a7f44152c                 vmovdqu    xmmword ptr [r13 + rdx + 0x2c], xmm0
013bd c4817a6f441d3c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x3c]
013c4 c4c17a7f44153c                 vmovdqu    xmmword ptr [r13 + rdx + 0x3c], xmm0
013cb c4817a6f441d4c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x4c]
013d2 c4c17a7f44154c                 vmovdqu    xmmword ptr [r13 + rdx + 0x4c], xmm0
013d9 c4817a6f441d5c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x5c]
013e0 c4c17a7f44155c                 vmovdqu    xmmword ptr [r13 + rdx + 0x5c], xmm0
013e7 c4817a6f441d6c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x6c]
013ee c4c17a7f44156c                 vmovdqu    xmmword ptr [r13 + rdx + 0x6c], xmm0
013f5 c4817a6f441d7c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x7c]
013fc c4c17a7f44157c                 vmovdqu    xmmword ptr [r13 + rdx + 0x7c], xmm0
01403 c4817a6f841d8c000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x8c]
0140d c4c17a7f84158c000000           vmovdqu    xmmword ptr [r13 + rdx + 0x8c], xmm0
01417 c4817a6f841d9c000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x9c]
01421 c4c17a7f84159c000000           vmovdqu    xmmword ptr [r13 + rdx + 0x9c], xmm0
0142b c4817a6f841dac000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xac]
01435 c4c17a7f8415ac000000           vmovdqu    xmmword ptr [r13 + rdx + 0xac], xmm0
0143f c4817a6f841dbc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xbc]
01449 c4c17a7f8415bc000000           vmovdqu    xmmword ptr [r13 + rdx + 0xbc], xmm0
01453 c4817a6f841dcc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xcc]
0145d c4c17a7f8415cc000000           vmovdqu    xmmword ptr [r13 + rdx + 0xcc], xmm0
01467 c4817a6f841ddc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xdc]
01471 c4c17a7f8415dc000000           vmovdqu    xmmword ptr [r13 + rdx + 0xdc], xmm0
0147b c4817a6f841dec000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xec]
01485 c4c17a7f8415ec000000           vmovdqu    xmmword ptr [r13 + rdx + 0xec], xmm0
0148f c4817a6f841dfc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xfc]
01499 c4c17a7f8415fc000000           vmovdqu    xmmword ptr [r13 + rdx + 0xfc], xmm0
014a3 4181c200010000                 add        r10d, 0x100
014aa 443bd3                         cmp        r10d, ebx
014ad 0f8ccdfeffff                   jl         0x7f63dbbff100
014b3 4c89ac24a8000000               mov        qword ptr [rsp + 0xa8], r13
014bb 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
014c3 7d46                           jge        0x7f63dbbff28b
014c5 4d63da                         movsxd     r11, r10d
014c8 4d03d8                         add        r11, r8
014cb 4c3bd9                         cmp        r11, rcx
014ce 0f83fd2a0000                   jae        0x7f63dbc01d51
014d4 453bd1                         cmp        r10d, r9d
014d7 0f83082b0000                   jae        0x7f63dbc01d65
014dd 90                             nop        
014de 90                             nop        
014df 90                             nop        
014e0 458bc2                         mov        r8d, r10d
014e3 478d1c16                       lea        r11d, [r14 + r10]
014e7 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
014ef c4a17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc]
014f6 c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
014fd 4183c210                       add        r10d, 0x10
01501 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
01509 7cd5                           jl         0x7f63dbbff260
0150b 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
01513 e9d5f1ffff                     jmp        0x7f63dbbfe46d
01518 bee4ffffff                     mov        esi, 0xffffffe4
0151d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01522 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01527 44895c2408                     mov        dword ptr [rsp + 8], r11d
0152c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01531 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01536 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0153b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01540 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01545 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0154a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0154f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01554 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01559 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0155e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01563 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01568 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0156d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01572 90                             nop        
01573 90                             nop        
01574 c5f877                         vzeroupper 
01577 e864b4aeff                     call       0x7f63db6ea760
0157c 0f1f840074160003               nop        dword ptr [rax + rax + 0x3001674]
01584 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0158e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01592 e8e915b318                     call       0x7f63f4730900
01597 f4                             hlt        
01598 bee4ffffff                     mov        esi, 0xffffffe4
0159d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
015a2 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015a7 4489442408                     mov        dword ptr [rsp + 8], r8d
015ac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015b1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
015bb 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015c0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
015c5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015ca 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
015cf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015d4 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
015d9 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
015de 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
015e3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
015e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
015ed 4c89542450                     mov        qword ptr [rsp + 0x50], r10
015f2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
015f7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
015fc 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
01601 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01606 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0160b 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01610 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01614 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01619 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0161e 90                             nop        
0161f 90                             nop        
01620 c5f877                         vzeroupper 
01623 e8b8b3aeff                     call       0x7f63db6ea760
01628 0f1f840020170004               nop        dword ptr [rax + rax + 0x4001720]
01630 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0163a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0163e e83d15b318                     call       0x7f63f4730900
01643 f4                             hlt        
01644 bee4ffffff                     mov        esi, 0xffffffe4
01649 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0164e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01653 44895c2408                     mov        dword ptr [rsp + 8], r11d
01658 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0165d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01662 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01667 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0166c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01671 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01676 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0167b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01680 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01685 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0168a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0168f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01694 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01699 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0169e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
016a3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
016a8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016ad 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
016b2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
016b7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
016bc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
016c1 895c2464                       mov        dword ptr [rsp + 0x64], ebx
016c5 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
016cd 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
016d2 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
016d6 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
016db 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016e0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016e9 90                             nop        
016ea 90                             nop        
016eb 90                             nop        
016ec c5f877                         vzeroupper 
016ef e8ecb2aeff                     call       0x7f63db6ea760
016f4 0f1f8400ec170005               nop        dword ptr [rax + rax + 0x50017ec]
016fc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170a e87114b318                     call       0x7f63f4730900
0170f f4                             hlt        
01710 beccffffff                     mov        esi, 0xffffffcc
01715 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0171a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0171f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01724 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01729 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0172e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01733 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01738 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0173d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01742 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01747 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0174c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01751 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01756 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0175b 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01760 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01765 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0176a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0176f 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01774 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01779 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0177e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01783 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01788 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0178c 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01791 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01796 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0179b 90                             nop        
0179c c5f877                         vzeroupper 
0179f e83cb2aeff                     call       0x7f63db6ea760
017a4 0f1f84009c180006               nop        dword ptr [rax + rax + 0x600189c]
017ac 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
017b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ba e8c113b318                     call       0x7f63f4730900
017bf f4                             hlt        
017c0 beccffffff                     mov        esi, 0xffffffcc
017c5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
017ca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017cf 44895c2408                     mov        dword ptr [rsp + 8], r11d
017d4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017d9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017de 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017e3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017e8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
017ed 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
017f2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017f7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
017fc 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01801 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01806 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0180b 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01810 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01815 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
0181a 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0181f 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01824 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01829 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0182e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01833 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01838 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0183d 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01841 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
01849 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0184e 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
01852 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0185a 4489442478                     mov        dword ptr [rsp + 0x78], r8d
0185f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01864 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0186d 90                             nop        
0186e 90                             nop        
0186f 90                             nop        
01870 c5f877                         vzeroupper 
01873 e868b1aeff                     call       0x7f63db6ea760
01878 0f1f840070190007               nop        dword ptr [rax + rax + 0x7001970]
01880 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0188a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0188e e8ed12b318                     call       0x7f63f4730900
01893 f4                             hlt        
01894 bee4ffffff                     mov        esi, 0xffffffe4
01899 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0189e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018a3 4489542408                     mov        dword ptr [rsp + 8], r10d
018a8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018b2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018b7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018bc 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
018c1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
018c6 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
018cb 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018d0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018d5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018da 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018df 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018e4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018e9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
018ee 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
018f3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
018f8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018fd 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01902 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01907 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0190c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01911 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01916 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0191a 90                             nop        
0191b 90                             nop        
0191c c5f877                         vzeroupper 
0191f e8bcb0aeff                     call       0x7f63db6ea760
01924 0f1f84001c1a0008               nop        dword ptr [rax + rax + 0x8001a1c]
0192c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01936 4883e4f0                       and        rsp, 0xfffffffffffffff0
0193a e84112b318                     call       0x7f63f4730900
0193f f4                             hlt        
01940 bee4ffffff                     mov        esi, 0xffffffe4
01945 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0194a 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0194f 4489442408                     mov        dword ptr [rsp + 8], r8d
01954 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01959 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0195e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01963 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01968 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0196c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01971 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01976 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0197b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01980 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01985 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0198a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0198f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01994 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01999 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0199e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
019a3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
019a8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019ad 4489542460                     mov        dword ptr [rsp + 0x60], r10d
019b2 4489742470                     mov        dword ptr [rsp + 0x70], r14d
019b7 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
019bc c5f877                         vzeroupper 
019bf e81cb0aeff                     call       0x7f63db6ea760
019c4 0f1f8400bc1a0009               nop        dword ptr [rax + rax + 0x9001abc]
019cc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
019d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019da e8a111b318                     call       0x7f63f4730900
019df f4                             hlt        
019e0 bee4ffffff                     mov        esi, 0xffffffe4
019e5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
019ea 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
019ef 4489442408                     mov        dword ptr [rsp + 8], r8d
019f4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019f9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019fe 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01a03 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a08 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01a0d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01a12 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a17 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a1c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a21 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a26 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a2b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a30 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a35 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a3a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01a3f 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01a44 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01a49 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01a4e 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01a53 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01a57 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01a5c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01a65 90                             nop        
01a66 90                             nop        
01a67 90                             nop        
01a68 c5f877                         vzeroupper 
01a6b e870afaeff                     call       0x7f63db6ea760
01a70 0f1f8400681b000a               nop        dword ptr [rax + rax + 0xa001b68]
01a78 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01a82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a86 e8f510b318                     call       0x7f63f4730900
01a8b f4                             hlt        
01a8c beccffffff                     mov        esi, 0xffffffcc
01a91 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01a96 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01a9b 4489442408                     mov        dword ptr [rsp + 8], r8d
01aa0 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01aa5 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01aaa 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01aaf 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01ab4 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ab8 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01abd 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01ac2 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01ac7 4c89442440                     mov        qword ptr [rsp + 0x40], r8
01acc 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01ad1 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01ad6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01adb 4c89442448                     mov        qword ptr [rsp + 0x48], r8
01ae0 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
01ae5 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01aea 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01aef 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01af4 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01af9 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01afe 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01b03 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01b08 c5f877                         vzeroupper 
01b0b e8d0aeaeff                     call       0x7f63db6ea760
01b10 0f1f8400081c000b               nop        dword ptr [rax + rax + 0xb001c08]
01b18 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b26 e85510b318                     call       0x7f63f4730900
01b2b f4                             hlt        
01b2c be45ffffff                     mov        esi, 0xffffff45
01b31 4c89542408                     mov        qword ptr [rsp + 8], r10
01b36 90                             nop        
01b37 90                             nop        
01b38 c5f877                         vzeroupper 
01b3b e8a0aeaeff                     call       0x7f63db6ea760
01b40 0f1f8400381c000c               nop        dword ptr [rax + rax + 0xc001c38]
01b48 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b56 e82510b318                     call       0x7f63f4730900
01b5b f4                             hlt        
01b5c be45ffffff                     mov        esi, 0xffffff45
01b61 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01b66 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b6b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b70 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b75 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b7a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b7f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b84 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01b89 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01b8e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b93 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b98 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01b9d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ba2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ba7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01bac 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01bb1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01bb6 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01bba 897c246c                       mov        dword ptr [rsp + 0x6c], edi
01bbe 90                             nop        
01bbf 90                             nop        
01bc0 c5f877                         vzeroupper 
01bc3 e818aeaeff                     call       0x7f63db6ea760
01bc8 0f1f8400c01c000d               nop        dword ptr [rax + rax + 0xd001cc0]
01bd0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01bda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bde e89d0fb318                     call       0x7f63f4730900
01be3 f4                             hlt        
01be4 493bca                         cmp        rcx, r10
01be7 bdffffffff                     mov        ebp, 0xffffffff
01bec 7c08                           jl         0x7f63dbbff976
01bee 400f95c5                       setne      bpl
01bf2 400fb6ed                       movzx      ebp, bpl
01bf6 be45ffffff                     mov        esi, 0xffffff45
01bfb 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01c00 4c891c24                       mov        qword ptr [rsp], r11
01c04 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c09 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c0e 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01c13 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01c18 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01c1d 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01c22 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c27 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01c2c 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01c31 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01c36 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01c3b 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01c40 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01c45 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01c4a 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01c4f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01c54 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01c59 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01c5e 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01c62 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01c67 90                             nop        
01c68 c5f877                         vzeroupper 
01c6b e870adaeff                     call       0x7f63db6ea760
01c70 0f1f8400681d000e               nop        dword ptr [rax + rax + 0xe001d68]
01c78 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c86 e8f50eb318                     call       0x7f63f4730900
01c8b f4                             hlt        
01c8c be45ffffff                     mov        esi, 0xffffff45
01c91 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01c96 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01c9b 4489442408                     mov        dword ptr [rsp + 8], r8d
01ca0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ca5 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01caa 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01caf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01cb4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01cb9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cbe 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01cc3 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01cc8 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01ccd 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01cd2 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01cd7 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01cdc 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01ce1 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01ce6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ceb 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01cf0 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01cf4 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01cf9 90                             nop        
01cfa 90                             nop        
01cfb 90                             nop        
01cfc c5f877                         vzeroupper 
01cff e8dcacaeff                     call       0x7f63db6ea760
01d04 0f1f8400fc1d000f               nop        dword ptr [rax + rax + 0xf001dfc]
01d0c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d1a e8610eb318                     call       0x7f63f4730900
01d1f f4                             hlt        
01d20 be45ffffff                     mov        esi, 0xffffff45
01d25 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01d2a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d2f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d34 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d39 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d3e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d43 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d48 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d4d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d52 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01d57 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d5c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d61 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d66 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01d6b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d70 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d75 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01d7a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01d7f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01d84 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01d89 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01d8e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d93 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d98 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01d9c c5f877                         vzeroupper 
01d9f e83cacaeff                     call       0x7f63db6ea760
01da4 0f1f84009c1e0010               nop        dword ptr [rax + rax + 0x10001e9c]
01dac 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dba e8c10db318                     call       0x7f63f4730900
01dbf f4                             hlt        
01dc0 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01dc5 4d3bd8                         cmp        r11, r8
01dc8 bdffffffff                     mov        ebp, 0xffffffff
01dcd 7c08                           jl         0x7f63dbbffb57
01dcf 400f95c5                       setne      bpl
01dd3 400fb6ed                       movzx      ebp, bpl
01dd7 be45ffffff                     mov        esi, 0xffffff45
01ddc 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01de1 4c891c24                       mov        qword ptr [rsp], r11
01de5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01dea 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01def 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01df4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01df9 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01dfe 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01e03 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01e08 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01e0d 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01e12 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01e17 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01e1c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e21 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01e26 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01e2b 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01e2f 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01e34 c5f877                         vzeroupper 
01e37 e8a4abaeff                     call       0x7f63db6ea760
01e3c 0f1f8400341f0011               nop        dword ptr [rax + rax + 0x11001f34]
01e44 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01e4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e52 e8290db318                     call       0x7f63f4730900
01e57 f4                             hlt        
01e58 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01e5d 493bcb                         cmp        rcx, r11
01e60 bdffffffff                     mov        ebp, 0xffffffff
01e65 7c08                           jl         0x7f63dbbffbef
01e67 400f95c5                       setne      bpl
01e6b 400fb6ed                       movzx      ebp, bpl
01e6f be45ffffff                     mov        esi, 0xffffff45
01e74 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01e79 4c891c24                       mov        qword ptr [rsp], r11
01e7d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01e82 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01e87 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01e8c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01e91 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01e96 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01e9b 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01ea0 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01ea5 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01eaa 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01eaf 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
01eb4 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01eb9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ebe 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01ec3 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01ec7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01ecc c5f877                         vzeroupper 
01ecf e80cabaeff                     call       0x7f63db6ea760
01ed4 0f1f8400cc1f0012               nop        dword ptr [rax + rax + 0x12001fcc]
01edc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e8910cb318                     call       0x7f63f4730900
01eef f4                             hlt        
01ef0 bee4ffffff                     mov        esi, 0xffffffe4
01ef5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01efa 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01eff 44894c2408                     mov        dword ptr [rsp + 8], r9d
01f04 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01f09 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01f0e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01f13 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01f18 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01f1d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01f22 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01f27 4c89442440                     mov        qword ptr [rsp + 0x40], r8
01f2c 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01f31 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01f36 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01f3b 4c89442448                     mov        qword ptr [rsp + 0x48], r8
01f40 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
01f45 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01f4a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01f4f 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01f54 448b4c2478                     mov        r9d, dword ptr [rsp + 0x78]
01f59 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
01f5e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01f63 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01f68 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01f70 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01f75 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01f7d 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01f82 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01f86 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01f8a 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
01f92 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01f9a 90                             nop        
01f9b 90                             nop        
01f9c c5f877                         vzeroupper 
01f9f e83caaaeff                     call       0x7f63db6ea760
01fa4 0f1f84009c200013               nop        dword ptr [rax + rax + 0x1300209c]
01fac 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
01fb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fba e8c10bb318                     call       0x7f63f4730900
01fbf f4                             hlt        
01fc0 bee4ffffff                     mov        esi, 0xffffffe4
01fc5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01fca 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01fce 894c2408                       mov        dword ptr [rsp + 8], ecx
01fd2 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
01fd7 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01fdc 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01fe1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01fe6 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01feb 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01ff0 4c8b4c2450                     mov        r9, qword ptr [rsp + 0x50]
01ff5 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
01ffa 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01ffe 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
02002 4c8b4c2458                     mov        r9, qword ptr [rsp + 0x58]
02007 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
0200c 4c8b4c2460                     mov        r9, qword ptr [rsp + 0x60]
02011 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
02016 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0201b 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02020 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
02024 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02028 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0202d 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
02032 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
02039 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0203d 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
02045 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0204a 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0204e 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02053 4c89442478                     mov        qword ptr [rsp + 0x78], r8
02058 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0205c 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
02064 c5f877                         vzeroupper 
02067 e874a9aeff                     call       0x7f63db6ea760
0206c 0f1f840064210014               nop        dword ptr [rax + rax + 0x14002164]
02074 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0207e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02082 e8f90ab318                     call       0x7f63f4730900
02087 f4                             hlt        
02088 beccffffff                     mov        esi, 0xffffffcc
0208d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02092 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02097 4489542408                     mov        dword ptr [rsp + 8], r10d
0209c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020a6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020ab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020b0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
020b5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
020ba 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020bf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020c4 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
020c9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
020ce 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
020d3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
020d8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
020dd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020e2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020e7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020ec 448b4c2478                     mov        r9d, dword ptr [rsp + 0x78]
020f1 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
020f6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
020fb 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02100 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
02108 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0210d 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02115 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0211a 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0211e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02122 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
0212a 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
02132 90                             nop        
02133 90                             nop        
02134 c5f877                         vzeroupper 
02137 e8a4a8aeff                     call       0x7f63db6ea760
0213c 0f1f840034220015               nop        dword ptr [rax + rax + 0x15002234]
02144 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0214e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02152 e8290ab318                     call       0x7f63f4730900
02157 f4                             hlt        
02158 4183c608                       add        r14d, 8
0215c be6effffff                     mov        esi, 0xffffff6e
02161 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02166 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0216b 4489542408                     mov        dword ptr [rsp + 8], r10d
02170 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02175 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0217a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0217f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02184 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02189 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0218e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02193 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02198 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0219d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
021a2 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
021a7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
021ac 4c89542448                     mov        qword ptr [rsp + 0x48], r10
021b1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
021b6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
021bb 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
021c0 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
021c5 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
021ca 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021cf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
021d4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
021d9 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
021e1 4489742470                     mov        dword ptr [rsp + 0x70], r14d
021e6 897c2474                       mov        dword ptr [rsp + 0x74], edi
021ea 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
021ef 90                             nop        
021f0 c5f877                         vzeroupper 
021f3 e8e8a7aeff                     call       0x7f63db6ea760
021f8 0f1f8400f0220016               nop        dword ptr [rax + rax + 0x160022f0]
02200 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0220a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0220e e86d09b318                     call       0x7f63f4730900
02213 f4                             hlt        
02214 4183c608                       add        r14d, 8
02218 be66ffffff                     mov        esi, 0xffffff66
0221d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02222 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
02227 4489442408                     mov        dword ptr [rsp + 8], r8d
0222c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02231 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02236 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0223b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02240 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02245 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0224a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0224f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02254 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02259 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0225e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02263 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02268 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0226d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02272 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02277 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0227c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02281 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02286 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0228b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02290 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02295 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0229a 897c2474                       mov        dword ptr [rsp + 0x74], edi
0229e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
022a3 90                             nop        
022a4 c5f877                         vzeroupper 
022a7 e834a7aeff                     call       0x7f63db6ea760
022ac 0f1f8400a4230017               nop        dword ptr [rax + rax + 0x170023a4]
022b4 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
022be 4883e4f0                       and        rsp, 0xfffffffffffffff0
022c2 e8b908b318                     call       0x7f63f4730900
022c7 f4                             hlt        
022c8 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
022d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022d6 e8a508b318                     call       0x7f63f4730900
022db f4                             hlt        
022dc 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
022e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ea e89108b318                     call       0x7f63f4730900
022ef f4                             hlt        
022f0 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
022fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
022fe e87d08b318                     call       0x7f63f4730900
02303 f4                             hlt        
02304 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
0230e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02312 e86908b318                     call       0x7f63f4730900
02317 f4                             hlt        
02318 4533d2                         xor        r10d, r10d
0231b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02320 e908deffff                     jmp        0x7f63dbbfdead
02325 4533d2                         xor        r10d, r10d
02328 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
02330 e921deffff                     jmp        0x7f63dbbfded6
02335 4533d2                         xor        r10d, r10d
02338 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
02340 e93adeffff                     jmp        0x7f63dbbfdeff
02345 4533d2                         xor        r10d, r10d
02348 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0234d e95adeffff                     jmp        0x7f63dbbfdf2c
02352 4533d2                         xor        r10d, r10d
02355 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0235d e973deffff                     jmp        0x7f63dbbfdf55
02362 4533d2                         xor        r10d, r10d
02365 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0236d e993deffff                     jmp        0x7f63dbbfdf85
02372 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
0237c 4883e4f0                       and        rsp, 0xfffffffffffffff0
02380 e8fb07b318                     call       0x7f63f4730900
02385 f4                             hlt        
02386 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
02390 4883e4f0                       and        rsp, 0xfffffffffffffff0
02394 e8e707b318                     call       0x7f63f4730900
02399 f4                             hlt        
0239a beccffffff                     mov        esi, 0xffffffcc
0239f 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
023a4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023a9 4489542408                     mov        dword ptr [rsp + 8], r10d
023ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023b3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023b8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023bd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023c2 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023c7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
023cc 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023d1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023d6 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
023db 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
023e0 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
023e5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
023ea 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
023ef 4c89542450                     mov        qword ptr [rsp + 0x50], r10
023f4 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
023f9 4489542458                     mov        dword ptr [rsp + 0x58], r10d
023fe 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
02403 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
02408 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0240d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02412 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02417 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0241b 90                             nop        
0241c c5f877                         vzeroupper 
0241f e8bca5aeff                     call       0x7f63db6ea760
02424 0f1f84001c250018               nop        dword ptr [rax + rax + 0x1800251c]
0242c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02436 4883e4f0                       and        rsp, 0xfffffffffffffff0
0243a e84107b318                     call       0x7f63f4730900
0243f f4                             hlt        
02440 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
02448 eb07                           jmp        0x7f63dbc001d1
0244a 90                             nop        
0244b 90                             nop        
0244c 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02451 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02456 448b1c24                       mov        r11d, dword ptr [rsp]
0245a 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
0245f 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
02464 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
02469 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0246e 4183c308                       add        r11d, 8
02472 453bd8                         cmp        r11d, r8d
02475 7cd5                           jl         0x7f63dbc001cc
02477 453bdd                         cmp        r11d, r13d
0247a 0f8d791b0000                   jge        0x7f63dbc01d79
02480 4d63d3                         movsxd     r10, r11d
02483 4c03d7                         add        r10, rdi
02486 4c3bd6                         cmp        r10, rsi
02489 0f83771b0000                   jae        0x7f63dbc01d86
0248f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02494 4183c240                       add        r10d, 0x40
02498 4d63c2                         movsxd     r8, r10d
0249b 4c03c7                         add        r8, rdi
0249e 4c3bc6                         cmp        r8, rsi
024a1 0f83731b0000                   jae        0x7f63dbc01d9a
024a7 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
024af 0f83791b0000                   jae        0x7f63dbc01dae
024b5 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
024bd 0f837f1b0000                   jae        0x7f63dbc01dc2
024c3 498bd9                         mov        rbx, r9
024c6 90                             nop        
024c7 90                             nop        
024c8 90                             nop        
024c9 90                             nop        
024ca 90                             nop        
024cb 90                             nop        
024cc 90                             nop        
024cd 90                             nop        
024ce 90                             nop        
024cf 90                             nop        
024d0 458bc3                         mov        r8d, r11d
024d3 4d63c8                         movsxd     r9, r8d
024d6 448b0424                       mov        r8d, dword ptr [rsp]
024da 4503c3                         add        r8d, r11d
024dd 458bd3                         mov        r10d, r11d
024e0 418bc8                         mov        ecx, r8d
024e3 488b4c0b0c                     mov        rcx, qword ptr [rbx + rcx + 0xc]
024e8 4a894c130c                     mov        qword ptr [rbx + r10 + 0xc], rcx
024ed 4d63c0                         movsxd     r8, r8d
024f0 4e8b540314                     mov        r10, qword ptr [rbx + r8 + 0x14]
024f5 4e89540b14                     mov        qword ptr [rbx + r9 + 0x14], r10
024fa 4e8b54031c                     mov        r10, qword ptr [rbx + r8 + 0x1c]
024ff 4e89540b1c                     mov        qword ptr [rbx + r9 + 0x1c], r10
02504 4e8b540324                     mov        r10, qword ptr [rbx + r8 + 0x24]
02509 4e89540b24                     mov        qword ptr [rbx + r9 + 0x24], r10
0250e 4e8b54032c                     mov        r10, qword ptr [rbx + r8 + 0x2c]
02513 4e89540b2c                     mov        qword ptr [rbx + r9 + 0x2c], r10
02518 4e8b540334                     mov        r10, qword ptr [rbx + r8 + 0x34]
0251d 4e89540b34                     mov        qword ptr [rbx + r9 + 0x34], r10
02522 4e8b54033c                     mov        r10, qword ptr [rbx + r8 + 0x3c]
02527 4e89540b3c                     mov        qword ptr [rbx + r9 + 0x3c], r10
0252c 4e8b540344                     mov        r10, qword ptr [rbx + r8 + 0x44]
02531 4e89540b44                     mov        qword ptr [rbx + r9 + 0x44], r10
02536 4183c340                       add        r11d, 0x40
0253a 453bdd                         cmp        r11d, r13d
0253d 7c91                           jl         0x7f63dbc00250
0253f 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
02547 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0254f 0f8dd9ecffff                   jge        0x7f63dbbfefae
02555 4d63d3                         movsxd     r10, r11d
02558 4c03d7                         add        r10, rdi
0255b 4c3bd6                         cmp        r10, rsi
0255e 0f83f21a0000                   jae        0x7f63dbc01dd6
02564 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
0256c 0f83f81a0000                   jae        0x7f63dbc01dea
02572 90                             nop        
02573 90                             nop        
02574 448b0424                       mov        r8d, dword ptr [rsp]
02578 4503c3                         add        r8d, r11d
0257b 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
02583 4f8b44010c                     mov        r8, qword ptr [r9 + r8 + 0xc]
02588 458bd3                         mov        r10d, r11d
0258b 4f8944110c                     mov        qword ptr [r9 + r10 + 0xc], r8
02590 4183c308                       add        r11d, 8
02594 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0259c 7cd6                           jl         0x7f63dbc002f4
0259e e98becffff                     jmp        0x7f63dbbfefae
025a3 bee4ffffff                     mov        esi, 0xffffffe4
025a8 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
025ad 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025b2 44895c2408                     mov        dword ptr [rsp + 8], r11d
025b7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025c1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025c6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025cb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
025d0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025d5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
025da 4489542438                     mov        dword ptr [rsp + 0x38], r10d
025df 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025e4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
025e9 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
025ee 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
025f3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
025f8 4c89542448                     mov        qword ptr [rsp + 0x48], r10
025fd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02602 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02607 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0260c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02611 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02616 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0261b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02620 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02625 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02629 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02631 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02636 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0263d 90                             nop        
0263e 90                             nop        
0263f 90                             nop        
02640 c5f877                         vzeroupper 
02643 e898a3aeff                     call       0x7f63db6ea760
02648 0f1f840040270019               nop        dword ptr [rax + rax + 0x19002740]
02650 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0265a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0265e e81d05b318                     call       0x7f63f4730900
02663 f4                             hlt        
02664 bee4ffffff                     mov        esi, 0xffffffe4
02669 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0266e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02673 4489542408                     mov        dword ptr [rsp + 8], r10d
02678 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0267d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02682 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02687 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0268c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02691 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02696 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0269b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
026a0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
026a5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
026aa 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
026af 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026b4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
026b9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026be 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
026c3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
026c8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
026cd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
026d2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026d7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
026dc 895c2464                       mov        dword ptr [rsp + 0x64], ebx
026e0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
026e5 90                             nop        
026e6 90                             nop        
026e7 90                             nop        
026e8 c5f877                         vzeroupper 
026eb e8f0a2aeff                     call       0x7f63db6ea760
026f0 0f1f8400e827001a               nop        dword ptr [rax + rax + 0x1a0027e8]
026f8 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02702 4883e4f0                       and        rsp, 0xfffffffffffffff0
02706 e87504b318                     call       0x7f63f4730900
0270b f4                             hlt        
0270c bee4ffffff                     mov        esi, 0xffffffe4
02711 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02716 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0271b 4489542408                     mov        dword ptr [rsp + 8], r10d
02720 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02725 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0272a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0272f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02734 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02739 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0273e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02743 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02748 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0274d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02752 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02757 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0275c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02761 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02766 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0276b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02770 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02774 c5f877                         vzeroupper 
02777 e864a2aeff                     call       0x7f63db6ea760
0277c 0f1f84007428001b               nop        dword ptr [rax + rax + 0x1b002874]
02784 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0278e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02792 e8e903b318                     call       0x7f63f4730900
02797 f4                             hlt        
02798 bee4ffffff                     mov        esi, 0xffffffe4
0279d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
027a2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
027a7 4489542408                     mov        dword ptr [rsp + 8], r10d
027ac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027b1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027b6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
027bb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
027c0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
027c5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
027ca 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027cf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027d4 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
027d9 4489442440                     mov        dword ptr [rsp + 0x40], r8d
027de 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
027e3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
027e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
027ed 4c89542450                     mov        qword ptr [rsp + 0x50], r10
027f2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
027f7 4489542444                     mov        dword ptr [rsp + 0x44], r10d
027fc 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
02801 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02806 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0280b 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02810 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
02818 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0281d 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02822 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02829 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
02831 90                             nop        
02832 90                             nop        
02833 90                             nop        
02834 c5f877                         vzeroupper 
02837 e8a4a1aeff                     call       0x7f63db6ea760
0283c 0f1f84003429001c               nop        dword ptr [rax + rax + 0x1c002934]
02844 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0284e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02852 e82903b318                     call       0x7f63f4730900
02857 f4                             hlt        
02858 bee4ffffff                     mov        esi, 0xffffffe4
0285d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02862 4c891424                       mov        qword ptr [rsp], r10
02866 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0286b 4489442414                     mov        dword ptr [rsp + 0x14], r8d
02870 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
02875 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0287a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0287f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02884 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02889 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0288e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02893 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02898 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0289d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
028a2 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
028a7 4489442460                     mov        dword ptr [rsp + 0x60], r8d
028ac 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028b1 4489542464                     mov        dword ptr [rsp + 0x64], r10d
028b6 4489742474                     mov        dword ptr [rsp + 0x74], r14d
028bb 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
028c0 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
028c7 90                             nop        
028c8 c5f877                         vzeroupper 
028cb e810a1aeff                     call       0x7f63db6ea760
028d0 0f1f8400c829001d               nop        dword ptr [rax + rax + 0x1d0029c8]
028d8 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
028e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028e6 e89502b318                     call       0x7f63f4730900
028eb f4                             hlt        
028ec 418d6e01                       lea        ebp, [r14 + 1]
028f0 bee4ffffff                     mov        esi, 0xffffffe4
028f5 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
028fa 4c891424                       mov        qword ptr [rsp], r10
028fe 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02906 4c89542408                     mov        qword ptr [rsp + 8], r10
0290b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
02910 4489442414                     mov        dword ptr [rsp + 0x14], r8d
02915 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0291a 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0291f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02924 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02929 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0292e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02933 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02938 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0293d 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02942 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02947 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0294c 4489442460                     mov        dword ptr [rsp + 0x60], r8d
02951 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02956 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0295b 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0295f 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02964 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
0296c 4489442478                     mov        dword ptr [rsp + 0x78], r8d
02971 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02979 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0297e 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
02985 90                             nop        
02986 90                             nop        
02987 90                             nop        
02988 c5f877                         vzeroupper 
0298b e850a0aeff                     call       0x7f63db6ea760
02990 0f1f8400882a001e               nop        dword ptr [rax + rax + 0x1e002a88]
02998 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
029a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029a6 e8d501b318                     call       0x7f63f4730900
029ab f4                             hlt        
029ac bee4ffffff                     mov        esi, 0xffffffe4
029b1 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
029b6 4c891424                       mov        qword ptr [rsp], r10
029ba 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
029bf 4489442414                     mov        dword ptr [rsp + 0x14], r8d
029c4 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
029c9 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
029ce 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
029d3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
029d8 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
029dd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
029e2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
029e7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
029ec 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
029f1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
029f6 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
029fb 4489442460                     mov        dword ptr [rsp + 0x60], r8d
02a00 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02a05 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02a0a 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02a0e 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02a13 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02a1b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
02a20 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
02a27 90                             nop        
02a28 c5f877                         vzeroupper 
02a2b e8b09faeff                     call       0x7f63db6ea760
02a30 0f1f8400282b001f               nop        dword ptr [rax + rax + 0x1f002b28]
02a38 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02a42 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a46 e83501b318                     call       0x7f63f4730900
02a4b f4                             hlt        
02a4c bee4ffffff                     mov        esi, 0xffffffe4
02a51 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02a56 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
02a5b 4489442408                     mov        dword ptr [rsp + 8], r8d
02a60 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a65 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a6a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a6f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a74 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02a79 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02a7e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02a83 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a88 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02a8d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
02a92 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02a97 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02a9c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02aa1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02aa6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02aab 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02ab0 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
02ab5 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02aba 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02abf 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02ac4 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02ac8 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02acd 90                             nop        
02ace 90                             nop        
02acf 90                             nop        
02ad0 c5f877                         vzeroupper 
02ad3 e8089faeff                     call       0x7f63db6ea760
02ad8 0f1f8400d02b0020               nop        dword ptr [rax + rax + 0x20002bd0]
02ae0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aee e88d00b318                     call       0x7f63f4730900
02af3 f4                             hlt        
02af4 bee4ffffff                     mov        esi, 0xffffffe4
02af9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02afe 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02b06 4c891424                       mov        qword ptr [rsp], r10
02b0a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02b0f 4489542408                     mov        dword ptr [rsp + 8], r10d
02b14 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b19 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b1e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
02b23 448944240c                     mov        dword ptr [rsp + 0xc], r8d
02b28 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02b2d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02b32 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b37 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b3c 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02b41 4489442440                     mov        dword ptr [rsp + 0x40], r8d
02b46 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b4b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02b50 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02b55 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02b5a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02b5f 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02b64 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
02b69 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02b6e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02b73 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02b78 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02b7c 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
02b84 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02b89 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02b91 4489542470                     mov        dword ptr [rsp + 0x70], r10d
02b96 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02b9e 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
02ba5 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02bad 90                             nop        
02bae 90                             nop        
02baf 90                             nop        
02bb0 c5f877                         vzeroupper 
02bb3 e8289eaeff                     call       0x7f63db6ea760
02bb8 0f1f8400b02c0021               nop        dword ptr [rax + rax + 0x21002cb0]
02bc0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bce e8adffb218                     call       0x7f63f4730900
02bd3 f4                             hlt        
02bd4 bee4ffffff                     mov        esi, 0xffffffe4
02bd9 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02bde 4c891424                       mov        qword ptr [rsp], r10
02be2 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
02be7 4489442414                     mov        dword ptr [rsp + 0x14], r8d
02bec 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02bf1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02bf6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02bfb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02c00 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c05 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02c0a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02c0f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02c14 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
02c19 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02c1e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02c23 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02c28 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02c2d 4489442464                     mov        dword ptr [rsp + 0x64], r8d
02c32 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02c36 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
02c3e 4489542474                     mov        dword ptr [rsp + 0x74], r10d
02c43 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
02c4b 4489442478                     mov        dword ptr [rsp + 0x78], r8d
02c50 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
02c54 89942488000000                 mov        dword ptr [rsp + 0x88], edx
02c5b 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
02c63 90                             nop        
02c64 c5f877                         vzeroupper 
02c67 e8749daeff                     call       0x7f63db6ea760
02c6c 0f1f8400642d0022               nop        dword ptr [rax + rax + 0x22002d64]
02c74 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02c7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c82 e8f9feb218                     call       0x7f63f4730900
02c87 f4                             hlt        
02c88 beccffffff                     mov        esi, 0xffffffcc
02c8d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02c92 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02c9a 4c891424                       mov        qword ptr [rsp], r10
02c9e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
02ca3 4489442408                     mov        dword ptr [rsp + 8], r8d
02ca8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02cad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02cb2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02cb7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02cbc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02cc1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02cc6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ccb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02cd0 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02cd5 4489442440                     mov        dword ptr [rsp + 0x40], r8d
02cda 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02cdf 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02ce4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02ce9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02cee 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
02cf3 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02cf8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02cfd 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02d02 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02d07 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
02d0c 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02d10 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
02d18 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02d1d 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
02d25 4489442470                     mov        dword ptr [rsp + 0x70], r8d
02d2a 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02d32 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
02d39 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02d41 90                             nop        
02d42 90                             nop        
02d43 90                             nop        
02d44 c5f877                         vzeroupper 
02d47 e8949caeff                     call       0x7f63db6ea760
02d4c 0f1f8400442e0023               nop        dword ptr [rax + rax + 0x23002e44]
02d54 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d62 e819feb218                     call       0x7f63f4730900
02d67 f4                             hlt        
02d68 beccffffff                     mov        esi, 0xffffffcc
02d6d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02d72 4c891424                       mov        qword ptr [rsp], r10
02d76 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02d7e 4c89542408                     mov        qword ptr [rsp + 8], r10
02d83 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02d88 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02d8d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02d92 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d97 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d9c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02da1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02da6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02dab 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02db0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02db5 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02dba 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02dbf 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02dc4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02dc9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02dce 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02dd3 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02dd7 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02ddf 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02de4 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
02dec 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02df1 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
02df9 90                             nop        
02dfa 90                             nop        
02dfb 90                             nop        
02dfc c5f877                         vzeroupper 
02dff e8dc9baeff                     call       0x7f63db6ea760
02e04 0f1f8400fc2e0024               nop        dword ptr [rax + rax + 0x24002efc]
02e0c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02e16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e1a e861fdb218                     call       0x7f63f4730900
02e1f f4                             hlt        
02e20 be6effffff                     mov        esi, 0xffffff6e
02e25 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02e2a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02e2f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02e34 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02e39 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e3e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02e43 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02e48 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02e4d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02e52 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02e57 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02e5c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e61 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02e66 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02e6b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02e70 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02e75 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02e7a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02e7f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02e84 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02e89 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02e8e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02e93 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02e98 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02e9d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02ea2 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02ea6 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02eab 897c247c                       mov        dword ptr [rsp + 0x7c], edi
02eaf 90                             nop        
02eb0 c5f877                         vzeroupper 
02eb3 e8289baeff                     call       0x7f63db6ea760
02eb8 0f1f8400b02f0025               nop        dword ptr [rax + rax + 0x25002fb0]
02ec0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ece e8adfcb218                     call       0x7f63f4730900
02ed3 f4                             hlt        
02ed4 be45ffffff                     mov        esi, 0xffffff45
02ed9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02ede 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02ee3 44895c2408                     mov        dword ptr [rsp + 8], r11d
02ee8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02eed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ef2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ef7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02efc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02f01 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02f06 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f0b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02f10 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02f15 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02f1a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02f1f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02f24 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02f29 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02f2e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02f33 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02f38 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02f3d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02f42 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02f47 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02f4c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02f50 897c2478                       mov        dword ptr [rsp + 0x78], edi
02f54 c5f877                         vzeroupper 
02f57 e8849aaeff                     call       0x7f63db6ea760
02f5c 0f1f840054300026               nop        dword ptr [rax + rax + 0x26003054]
02f64 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
02f6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f72 e809fcb218                     call       0x7f63f4730900
02f77 f4                             hlt        
02f78 be3dffffff                     mov        esi, 0xffffff3d
02f7d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02f82 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02f87 44895c2408                     mov        dword ptr [rsp + 8], r11d
02f8c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02f91 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f96 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02f9b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02fa0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02fa5 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02faa 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02faf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02fb4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02fb9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02fbe 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02fc3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02fc8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02fcd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02fd2 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02fd7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02fdc 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02fe1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02fe6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02feb 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02ff0 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02ff4 897c2478                       mov        dword ptr [rsp + 0x78], edi
02ff8 c5f877                         vzeroupper 
02ffb e8e099aeff                     call       0x7f63db6ea760
03000 0f1f8400f8300027               nop        dword ptr [rax + rax + 0x270030f8]
03008 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03012 4883e4f0                       and        rsp, 0xfffffffffffffff0
03016 e865fbb218                     call       0x7f63f4730900
0301b f4                             hlt        
0301c bee4ffffff                     mov        esi, 0xffffffe4
03021 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
03026 4c891424                       mov        qword ptr [rsp], r10
0302a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0302f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
03034 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03039 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0303e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03043 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03048 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0304d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03052 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03057 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0305c 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
03061 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
03066 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0306b 4489542460                     mov        dword ptr [rsp + 0x60], r10d
03070 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
03075 4489442464                     mov        dword ptr [rsp + 0x64], r8d
0307a 895c2468                       mov        dword ptr [rsp + 0x68], ebx
0307e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
03086 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0308b 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03093 898c2484000000                 mov        dword ptr [rsp + 0x84], ecx
0309a 90                             nop        
0309b 90                             nop        
0309c c5f877                         vzeroupper 
0309f e83c99aeff                     call       0x7f63db6ea760
030a4 0f1f84009c310028               nop        dword ptr [rax + rax + 0x2800319c]
030ac 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
030b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
030ba e8c1fab218                     call       0x7f63f4730900
030bf f4                             hlt        
030c0 bee4ffffff                     mov        esi, 0xffffffe4
030c5 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
030ca 4c891424                       mov        qword ptr [rsp], r10
030ce 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
030d3 4489442414                     mov        dword ptr [rsp + 0x14], r8d
030d8 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
030dd 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
030e2 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
030e7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
030ec 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
030f1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
030f6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
030fb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03100 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03105 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0310a 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0310f 4489442460                     mov        dword ptr [rsp + 0x60], r8d
03114 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03119 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0311e 895c2468                       mov        dword ptr [rsp + 0x68], ebx
03122 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
03127 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0312b 90                             nop        
0312c c5f877                         vzeroupper 
0312f e8ac98aeff                     call       0x7f63db6ea760
03134 0f1f84002c320029               nop        dword ptr [rax + rax + 0x2900322c]
0313c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03146 4883e4f0                       and        rsp, 0xfffffffffffffff0
0314a e831fab218                     call       0x7f63f4730900
0314f f4                             hlt        
03150 beccffffff                     mov        esi, 0xffffffcc
03155 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0315a 4c891424                       mov        qword ptr [rsp], r10
0315e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
03163 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
03168 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0316d 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
03172 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03177 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0317c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03181 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03186 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0318b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03190 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03195 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0319a 448b4c2478                     mov        r9d, dword ptr [rsp + 0x78]
0319f 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
031a4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
031a9 4489542464                     mov        dword ptr [rsp + 0x64], r10d
031ae 895c2468                       mov        dword ptr [rsp + 0x68], ebx
031b2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
031ba 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
031bf 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
031c7 898c2484000000                 mov        dword ptr [rsp + 0x84], ecx
031ce 90                             nop        
031cf 90                             nop        
031d0 c5f877                         vzeroupper 
031d3 e80898aeff                     call       0x7f63db6ea760
031d8 0f1f8400d032002a               nop        dword ptr [rax + rax + 0x2a0032d0]
031e0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
031ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ee e88df9b218                     call       0x7f63f4730900
031f3 f4                             hlt        
031f4 beccffffff                     mov        esi, 0xffffffcc
031f9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
031fe 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
03203 4489442408                     mov        dword ptr [rsp + 8], r8d
03208 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0320d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03212 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03217 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0321c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03221 4489542434                     mov        dword ptr [rsp + 0x34], r10d
03226 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0322b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03230 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
03235 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0323a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0323f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03244 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03249 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0324e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03253 4489542444                     mov        dword ptr [rsp + 0x44], r10d
03258 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0325d 4489442458                     mov        dword ptr [rsp + 0x58], r8d
03262 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03267 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0326c 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
03271 4489742474                     mov        dword ptr [rsp + 0x74], r14d
03276 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0327d 90                             nop        
0327e 90                             nop        
0327f 90                             nop        
03280 c5f877                         vzeroupper 
03283 e85897aeff                     call       0x7f63db6ea760
03288 0f1f84008033002b               nop        dword ptr [rax + rax + 0x2b003380]
03290 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0329a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0329e e8ddf8b218                     call       0x7f63f4730900
032a3 f4                             hlt        
032a4 be85ffffff                     mov        esi, 0xffffff85
032a9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
032ae 44891c24                       mov        dword ptr [rsp], r11d
032b2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
032b7 4489542404                     mov        dword ptr [rsp + 4], r10d
032bc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
032c1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
032c6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
032d0 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
032d5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
032da 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
032df 4c89542430                     mov        qword ptr [rsp + 0x30], r10
032e4 48895c2450                     mov        qword ptr [rsp + 0x50], rbx
032e9 4c896c2458                     mov        qword ptr [rsp + 0x58], r13
032ee 4c89742460                     mov        qword ptr [rsp + 0x60], r14
032f3 90                             nop        
032f4 c5f877                         vzeroupper 
032f7 e8e496aeff                     call       0x7f63db6ea760
032fc 0f1f8400f433002c               nop        dword ptr [rax + rax + 0x2c0033f4]
03304 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0330e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03312 e869f8b218                     call       0x7f63f4730900
03317 f4                             hlt        
03318 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
0331f beccffffff                     mov        esi, 0xffffffcc
03324 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03329 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0332d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
03332 90                             nop        
03333 90                             nop        
03334 c5f877                         vzeroupper 
03337 e8a496aeff                     call       0x7f63db6ea760
0333c 0f1f84003434002d               nop        dword ptr [rax + rax + 0x2d003434]
03344 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0334e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03352 e829f8b218                     call       0x7f63f4730900
03357 f4                             hlt        
03358 bee4ffffff                     mov        esi, 0xffffffe4
0335d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
03362 4c891424                       mov        qword ptr [rsp], r10
03366 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0336b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
03370 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03375 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0337a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0337f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03384 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03389 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0338e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03393 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03398 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0339d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
033a2 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
033a7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
033ac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
033b1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
033b6 895c2468                       mov        dword ptr [rsp + 0x68], ebx
033ba 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
033c2 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
033c7 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
033cc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
033d4 4489542478                     mov        dword ptr [rsp + 0x78], r10d
033d9 90                             nop        
033da 90                             nop        
033db 90                             nop        
033dc c5f877                         vzeroupper 
033df e8fc95aeff                     call       0x7f63db6ea760
033e4 0f1f8400dc34002e               nop        dword ptr [rax + rax + 0x2e0034dc]
033ec 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
033f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
033fa e881f7b218                     call       0x7f63f4730900
033ff f4                             hlt        
03400 bee4ffffff                     mov        esi, 0xffffffe4
03405 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0340a 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
03412 4c891424                       mov        qword ptr [rsp], r10
03416 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0341b 4489542408                     mov        dword ptr [rsp + 8], r10d
03420 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
03428 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0342d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03432 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03437 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0343c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03441 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03446 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0344b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03450 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03455 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0345a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0345f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03464 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03469 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0346e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03473 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
03478 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0347d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
03482 4489542458                     mov        dword ptr [rsp + 0x58], r10d
03487 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0348c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
03491 895c2460                       mov        dword ptr [rsp + 0x60], ebx
03495 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0349d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
034a2 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
034a7 89442474                       mov        dword ptr [rsp + 0x74], eax
034ab 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
034b3 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
034bc c5f877                         vzeroupper 
034bf e81c95aeff                     call       0x7f63db6ea760
034c4 0f1f8400bc35002f               nop        dword ptr [rax + rax + 0x2f0035bc]
034cc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
034d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
034da e8a1f6b218                     call       0x7f63f4730900
034df f4                             hlt        
034e0 beccffffff                     mov        esi, 0xffffffcc
034e5 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
034ea 4c891424                       mov        qword ptr [rsp], r10
034ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
034f3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
034f8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
034fd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
03502 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03507 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0350c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03511 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03516 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0351b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03520 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
03525 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0352a 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0352f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
03534 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03539 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0353e 895c2468                       mov        dword ptr [rsp + 0x68], ebx
03542 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0354a 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0354f 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
03554 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0355c 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
03561 90                             nop        
03562 90                             nop        
03563 90                             nop        
03564 c5f877                         vzeroupper 
03567 e87494aeff                     call       0x7f63db6ea760
0356c 0f1f840064360030               nop        dword ptr [rax + rax + 0x30003664]
03574 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0357e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03582 e8f9f5b218                     call       0x7f63f4730900
03587 f4                             hlt        
03588 beccffffff                     mov        esi, 0xffffffcc
0358d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03592 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
03597 44895c2408                     mov        dword ptr [rsp + 8], r11d
0359c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
035a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
035a6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
035ab 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
035b0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
035b5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
035ba 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
035bf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
035c4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
035c9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
035ce 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
035d3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
035d8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
035dd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
035e2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
035e7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
035ec 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
035f1 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
035f6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
035fb 4489542460                     mov        dword ptr [rsp + 0x60], r10d
03600 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
03608 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0360d 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
03612 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
03617 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0361f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
03624 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0362b 90                             nop        
0362c c5f877                         vzeroupper 
0362f e8ac93aeff                     call       0x7f63db6ea760
03634 0f1f84002c370031               nop        dword ptr [rax + rax + 0x3100372c]
0363c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03646 4883e4f0                       and        rsp, 0xfffffffffffffff0
0364a e831f5b218                     call       0x7f63f4730900
0364f f4                             hlt        
03650 beccffffff                     mov        esi, 0xffffffcc
03655 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0365a 4c891424                       mov        qword ptr [rsp], r10
0365e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
03666 4c89542408                     mov        qword ptr [rsp + 8], r10
0366b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
03673 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03678 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0367d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
03682 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03687 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0368c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03691 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03696 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0369b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
036a0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
036a5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
036aa 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
036af 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
036b4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
036b9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
036be 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
036c3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
036c8 895c2468                       mov        dword ptr [rsp + 0x68], ebx
036cc 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
036d4 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
036d9 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
036de 8944247c                       mov        dword ptr [rsp + 0x7c], eax
036e2 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
036eb 90                             nop        
036ec c5f877                         vzeroupper 
036ef e8ec92aeff                     call       0x7f63db6ea760
036f4 0f1f8400ec370032               nop        dword ptr [rax + rax + 0x320037ec]
036fc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0370a e871f4b218                     call       0x7f63f4730900
0370f f4                             hlt        
03710 8be8                           mov        ebp, eax
03712 83c510                         add        ebp, 0x10
03715 be6effffff                     mov        esi, 0xffffff6e
0371a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0371f 4c891424                       mov        qword ptr [rsp], r10
03723 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
03728 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0372d 89442438                       mov        dword ptr [rsp + 0x38], eax
03731 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03736 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0373b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03740 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03745 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0374a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0374f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03754 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03759 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0375e 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
03763 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
03768 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0376d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03772 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
03777 895c2468                       mov        dword ptr [rsp + 0x68], ebx
0377b 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
03783 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
03788 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0378d 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
03795 90                             nop        
03796 90                             nop        
03797 90                             nop        
03798 c5f877                         vzeroupper 
0379b e84092aeff                     call       0x7f63db6ea760
037a0 0f1f840098380033               nop        dword ptr [rax + rax + 0x33003898]
037a8 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
037b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
037b6 e8c5f3b218                     call       0x7f63f4730900
037bb f4                             hlt        
037bc 8be8                           mov        ebp, eax
037be 83c510                         add        ebp, 0x10
037c1 be66ffffff                     mov        esi, 0xffffff66
037c6 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
037cb 4c891424                       mov        qword ptr [rsp], r10
037cf 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
037d4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
037d9 89442438                       mov        dword ptr [rsp + 0x38], eax
037dd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
037e2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
037e7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
037ec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
037f1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
037f6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
037fb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03800 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03805 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0380a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0380f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
03814 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
03819 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0381e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03823 895c2468                       mov        dword ptr [rsp + 0x68], ebx
03827 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0382f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
03834 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
03839 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
03841 90                             nop        
03842 90                             nop        
03843 90                             nop        
03844 c5f877                         vzeroupper 
03847 e89491aeff                     call       0x7f63db6ea760
0384c 0f1f840044390034               nop        dword ptr [rax + rax + 0x34003944]
03854 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0385e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03862 e819f3b218                     call       0x7f63f4730900
03867 f4                             hlt        
03868 bee4ffffff                     mov        esi, 0xffffffe4
0386d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03872 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
03877 4489442408                     mov        dword ptr [rsp + 8], r8d
0387c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03881 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03886 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0388b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
03890 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
03895 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0389a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0389f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
038a4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
038a9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
038ae 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
038b3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
038b8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
038bd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
038c2 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
038c7 4489442444                     mov        dword ptr [rsp + 0x44], r8d
038cc 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
038d1 4489542458                     mov        dword ptr [rsp + 0x58], r10d
038d6 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
038db 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
038e0 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
038e4 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
038ec c5f877                         vzeroupper 
038ef e8ec90aeff                     call       0x7f63db6ea760
038f4 0f1f8400ec390035               nop        dword ptr [rax + rax + 0x350039ec]
038fc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0390a e871f2b218                     call       0x7f63f4730900
0390f f4                             hlt        
03910 bee4ffffff                     mov        esi, 0xffffffe4
03915 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0391a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0391f 4489542408                     mov        dword ptr [rsp + 8], r10d
03924 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03929 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0392e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03933 448944240c                     mov        dword ptr [rsp + 0xc], r8d
03938 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0393d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
03942 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03947 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0394c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03951 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03956 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0395b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03960 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03965 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0396a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0396f 4489442444                     mov        dword ptr [rsp + 0x44], r8d
03974 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
03979 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0397e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
03983 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
03988 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0398c 894c2474                       mov        dword ptr [rsp + 0x74], ecx
03990 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
03995 90                             nop        
03996 90                             nop        
03997 90                             nop        
03998 c5f877                         vzeroupper 
0399b e84090aeff                     call       0x7f63db6ea760
039a0 0f1f8400983a0036               nop        dword ptr [rax + rax + 0x36003a98]
039a8 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
039b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
039b6 e8c5f1b218                     call       0x7f63f4730900
039bb f4                             hlt        
039bc beccffffff                     mov        esi, 0xffffffcc
039c1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
039c6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
039cb 4489542408                     mov        dword ptr [rsp + 8], r10d
039d0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
039d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039da 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
039df 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
039e4 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
039e9 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
039ee 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
039f3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
039f8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
039fd 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03a02 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03a07 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03a0c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03a11 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03a16 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
03a1b 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
03a20 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
03a25 4489542458                     mov        dword ptr [rsp + 0x58], r10d
03a2a 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
03a2f 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
03a34 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
03a38 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
03a40 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
03a48 c5f877                         vzeroupper 
03a4b e8908faeff                     call       0x7f63db6ea760
03a50 0f1f8400483b0037               nop        dword ptr [rax + rax + 0x37003b48]
03a58 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a66 e815f1b218                     call       0x7f63f4730900
03a6b f4                             hlt        
03a6c 448bc1                         mov        r8d, ecx
03a6f 458d5008                       lea        r10d, [r8 + 8]
03a73 458bca                         mov        r9d, r10d
03a76 be6effffff                     mov        esi, 0xffffff6e
03a7b 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03a80 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
03a85 4489442408                     mov        dword ptr [rsp + 8], r8d
03a8a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03a8f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03a94 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03a99 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03a9e 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03aa3 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
03aa8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03aad 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03ab2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03ab7 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03abc 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03ac1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03ac6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03acb 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03ad0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03ad5 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
03ada 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
03ae2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03ae7 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
03aec c5f877                         vzeroupper 
03aef e8ec8eaeff                     call       0x7f63db6ea760
03af4 0f1f8400ec3b0038               nop        dword ptr [rax + rax + 0x38003bec]
03afc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b0a e871f0b218                     call       0x7f63f4730900
03b0f f4                             hlt        
03b10 448bc1                         mov        r8d, ecx
03b13 458d5008                       lea        r10d, [r8 + 8]
03b17 458bca                         mov        r9d, r10d
03b1a be66ffffff                     mov        esi, 0xffffff66
03b1f 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03b24 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
03b29 4489542408                     mov        dword ptr [rsp + 8], r10d
03b2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03b33 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03b38 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03b3d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
03b42 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03b47 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
03b4c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03b51 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03b56 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03b5b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03b60 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03b65 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03b6a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03b6f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03b74 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03b79 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
03b7e 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
03b83 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
03b88 c5f877                         vzeroupper 
03b8b e8508eaeff                     call       0x7f63db6ea760
03b90 0f1f8400883c0039               nop        dword ptr [rax + rax + 0x39003c88]
03b98 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03ba2 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ba6 e8d5efb218                     call       0x7f63f4730900
03bab f4                             hlt        
03bac 448bd3                         mov        r10d, ebx
03baf 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
03bb7 e91fd6ffff                     jmp        0x7f63dbbfef5b
03bbc 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03bc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
03bca e8b1efb218                     call       0x7f63f4730900
03bcf f4                             hlt        
03bd0 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03bda 4883e4f0                       and        rsp, 0xfffffffffffffff0
03bde e89defb218                     call       0x7f63f4730900
03be3 f4                             hlt        
03be4 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
03bf2 e889efb218                     call       0x7f63f4730900
03bf7 f4                             hlt        
03bf8 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c06 e875efb218                     call       0x7f63f4730900
03c0b f4                             hlt        
03c0c 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03c16 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c1a e861efb218                     call       0x7f63f4730900
03c1f f4                             hlt        
03c20 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03c2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c2e e84defb218                     call       0x7f63f4730900
03c33 f4                             hlt        
03c34 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03c3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c42 e839efb218                     call       0x7f63f4730900
03c47 f4                             hlt        
03c48 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03c52 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c56 e825efb218                     call       0x7f63f4730900
03c5b f4                             hlt        
03c5c bee4ffffff                     mov        esi, 0xffffffe4
03c61 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03c66 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
03c6b 4489542408                     mov        dword ptr [rsp + 8], r10d
03c70 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03c75 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03c7a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03c7f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03c84 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03c89 4489542434                     mov        dword ptr [rsp + 0x34], r10d
03c8e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03c93 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03c98 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
03c9d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
03ca2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03ca7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03cac 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03cb1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03cb6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03cbb 4489542444                     mov        dword ptr [rsp + 0x44], r10d
03cc0 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
03cc5 4489442458                     mov        dword ptr [rsp + 0x58], r8d
03cca 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03ccf 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
03cd4 895c2464                       mov        dword ptr [rsp + 0x64], ebx
03cd8 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03cdd 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
03ce2 90                             nop        
03ce3 90                             nop        
03ce4 c5f877                         vzeroupper 
03ce7 e8f48caeff                     call       0x7f63db6ea760
03cec 0f1f8400e43d003a               nop        dword ptr [rax + rax + 0x3a003de4]
03cf4 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03cfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
03d02 e879eeb218                     call       0x7f63f4730900
03d07 f4                             hlt        
03d08 bee4ffffff                     mov        esi, 0xffffffe4
03d0d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03d12 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
03d17 4489442408                     mov        dword ptr [rsp + 8], r8d
03d1c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03d21 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03d26 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03d2b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
03d30 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
03d35 4489442434                     mov        dword ptr [rsp + 0x34], r8d
03d3a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03d3f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03d44 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03d49 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03d4e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03d53 4c89542448                     mov        qword ptr [rsp + 0x48], r10
03d58 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03d5d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03d62 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
03d67 4489442444                     mov        dword ptr [rsp + 0x44], r8d
03d6c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
03d71 4489542458                     mov        dword ptr [rsp + 0x58], r10d
03d76 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
03d7b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
03d80 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
03d88 4489542460                     mov        dword ptr [rsp + 0x60], r10d
03d8d 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03d92 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
03d96 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
03d9b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
03da4 c5f877                         vzeroupper 
03da7 e8348caeff                     call       0x7f63db6ea760
03dac 0f1f8400a43e003b               nop        dword ptr [rax + rax + 0x3b003ea4]
03db4 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03dbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
03dc2 e8b9edb218                     call       0x7f63f4730900
03dc7 f4                             hlt        
03dc8 beccffffff                     mov        esi, 0xffffffcc
03dcd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03dd2 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
03dd7 44894c2408                     mov        dword ptr [rsp + 8], r9d
03ddc 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
03de1 4c89442418                     mov        qword ptr [rsp + 0x18], r8
03de6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03deb 448944240c                     mov        dword ptr [rsp + 0xc], r8d
03df0 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
03df5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
03dfa 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
03dff 4c89442438                     mov        qword ptr [rsp + 0x38], r8
03e04 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
03e09 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
03e0e 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
03e13 4c89442448                     mov        qword ptr [rsp + 0x48], r8
03e18 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
03e1d 4c89442450                     mov        qword ptr [rsp + 0x50], r8
03e22 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
03e27 4489442444                     mov        dword ptr [rsp + 0x44], r8d
03e2c 448b4c2478                     mov        r9d, dword ptr [rsp + 0x78]
03e31 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
03e36 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
03e3b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
03e40 895c2464                       mov        dword ptr [rsp + 0x64], ebx
03e44 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03e49 4489542478                     mov        dword ptr [rsp + 0x78], r10d
03e4e 90                             nop        
03e4f 90                             nop        
03e50 c5f877                         vzeroupper 
03e53 e8888baeff                     call       0x7f63db6ea760
03e58 0f1f8400503f003c               nop        dword ptr [rax + rax + 0x3c003f50]
03e60 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03e6e e80dedb218                     call       0x7f63f4730900
03e73 f4                             hlt        
03e74 4183c610                       add        r14d, 0x10
03e78 be6effffff                     mov        esi, 0xffffff6e
03e7d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
03e82 4c891424                       mov        qword ptr [rsp], r10
03e86 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03e8b 4489442414                     mov        dword ptr [rsp + 0x14], r8d
03e90 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03e95 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03e9a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03e9f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03ea4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03ea9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03eae 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03eb3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03eb8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03ebd 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03ec2 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
03eca 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03ecf 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
03ed4 c5f877                         vzeroupper 
03ed7 e8048baeff                     call       0x7f63db6ea760
03edc 0f1f8400d43f003d               nop        dword ptr [rax + rax + 0x3d003fd4]
03ee4 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03eee 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ef2 e889ecb218                     call       0x7f63f4730900
03ef7 f4                             hlt        
03ef8 4183c610                       add        r14d, 0x10
03efc be66ffffff                     mov        esi, 0xffffff66
03f01 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
03f06 4c891424                       mov        qword ptr [rsp], r10
03f0a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
03f0f 4489442414                     mov        dword ptr [rsp + 0x14], r8d
03f14 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
03f19 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03f1e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03f23 4c89542440                     mov        qword ptr [rsp + 0x40], r10
03f28 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03f2d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03f32 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
03f37 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03f3c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03f41 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03f46 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03f4b 897c2470                       mov        dword ptr [rsp + 0x70], edi
03f4f 90                             nop        
03f50 c5f877                         vzeroupper 
03f53 e8888aaeff                     call       0x7f63db6ea760
03f58 0f1f84005040003e               nop        dword ptr [rax + rax + 0x3e004050]
03f60 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
03f6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f6e e80decb218                     call       0x7f63f4730900
03f73 f4                             hlt        
03f74 4889bc24a8000000               mov        qword ptr [rsp + 0xa8], rdi
03f7c e93ad5ffff                     jmp        0x7f63dbbff23b
03f81 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03f8b 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f8f e8ecebb218                     call       0x7f63f4730900
03f94 f4                             hlt        
03f95 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03f9f 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fa3 e8d8ebb218                     call       0x7f63f4730900
03fa8 f4                             hlt        
03fa9 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03fb3 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fb7 e8c4ebb218                     call       0x7f63f4730900
03fbc f4                             hlt        
03fbd 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03fc7 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fcb e8b0ebb218                     call       0x7f63f4730900
03fd0 f4                             hlt        
03fd1 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03fdb 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fdf e89cebb218                     call       0x7f63f4730900
03fe4 f4                             hlt        
03fe5 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
03fef 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ff3 e888ebb218                     call       0x7f63f4730900
03ff8 f4                             hlt        
03ff9 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
04001 e941e5ffff                     jmp        0x7f63dbc002c7
04006 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
04010 4883e4f0                       and        rsp, 0xfffffffffffffff0
04014 e867ebb218                     call       0x7f63f4730900
04019 f4                             hlt        
0401a 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
04024 4883e4f0                       and        rsp, 0xfffffffffffffff0
04028 e853ebb218                     call       0x7f63f4730900
0402d f4                             hlt        
0402e 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
04038 4883e4f0                       and        rsp, 0xfffffffffffffff0
0403c e83febb218                     call       0x7f63f4730900
04041 f4                             hlt        
04042 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
0404c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04050 e82bebb218                     call       0x7f63f4730900
04055 f4                             hlt        
04056 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
04060 4883e4f0                       and        rsp, 0xfffffffffffffff0
04064 e817ebb218                     call       0x7f63f4730900
04069 f4                             hlt        
0406a 48bfc0166db4637f0000           movabs     rdi, 0x7f63b46d16c0
04074 4883e4f0                       and        rsp, 0xfffffffffffffff0
04078 e803ebb218                     call       0x7f63f4730900
0407d f4                             hlt        
0407e bef6ffffff                     mov        esi, 0xfffffff6
04083 90                             nop        
04084 c5f877                         vzeroupper 
04087 e85489aeff                     call       0x7f63db6ea760
0408c 0f1f84008441003f               nop        dword ptr [rax + rax + 0x3f004184]
04094 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0409e 4883e4f0                       and        rsp, 0xfffffffffffffff0
040a2 e8d9eab218                     call       0x7f63f4730900
040a7 f4                             hlt        
040a8 bef6ffffff                     mov        esi, 0xfffffff6
040ad 90                             nop        
040ae 90                             nop        
040af 90                             nop        
040b0 c5f877                         vzeroupper 
040b3 e82889aeff                     call       0x7f63db6ea760
040b8 0f1f8400b0410040               nop        dword ptr [rax + rax + 0x400041b0]
040c0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
040ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
040ce e8adeab218                     call       0x7f63f4730900
040d3 f4                             hlt        
040d4 bef6ffffff                     mov        esi, 0xfffffff6
040d9 90                             nop        
040da 90                             nop        
040db 90                             nop        
040dc c5f877                         vzeroupper 
040df e8fc88aeff                     call       0x7f63db6ea760
040e4 0f1f8400dc410041               nop        dword ptr [rax + rax + 0x410041dc]
040ec 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
040f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
040fa e881eab218                     call       0x7f63f4730900
040ff f4                             hlt        
04100 bef6ffffff                     mov        esi, 0xfffffff6
04105 90                             nop        
04106 90                             nop        
04107 90                             nop        
04108 c5f877                         vzeroupper 
0410b e8d088aeff                     call       0x7f63db6ea760
04110 0f1f840008420042               nop        dword ptr [rax + rax + 0x42004208]
04118 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
04122 4883e4f0                       and        rsp, 0xfffffffffffffff0
04126 e855eab218                     call       0x7f63f4730900
0412b f4                             hlt        
0412c bef6ffffff                     mov        esi, 0xfffffff6
04131 8bef                           mov        ebp, edi
04133 90                             nop        
04134 c5f877                         vzeroupper 
04137 e8a488aeff                     call       0x7f63db6ea760
0413c 0f1f840034420043               nop        dword ptr [rax + rax + 0x43004234]
04144 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0414e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04152 e829eab218                     call       0x7f63f4730900
04157 f4                             hlt        
04158 bef6ffffff                     mov        esi, 0xfffffff6
0415d 90                             nop        
0415e 90                             nop        
0415f 90                             nop        
04160 c5f877                         vzeroupper 
04163 e87888aeff                     call       0x7f63db6ea760
04168 0f1f840060420044               nop        dword ptr [rax + rax + 0x44004260]
04170 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
0417a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0417e e8fde9b218                     call       0x7f63f4730900
04183 f4                             hlt        
04184 bef6ffffff                     mov        esi, 0xfffffff6
04189 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0418e 90                             nop        
0418f 90                             nop        
04190 c5f877                         vzeroupper 
04193 e84888aeff                     call       0x7f63db6ea760
04198 0f1f840090420045               nop        dword ptr [rax + rax + 0x45004290]
041a0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
041aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
041ae e8cde9b218                     call       0x7f63f4730900
041b3 f4                             hlt        
041b4 bef6ffffff                     mov        esi, 0xfffffff6
041b9 4489542408                     mov        dword ptr [rsp + 8], r10d
041be 90                             nop        
041bf 90                             nop        
041c0 c5f877                         vzeroupper 
041c3 e81888aeff                     call       0x7f63db6ea760
041c8 0f1f8400c0420046               nop        dword ptr [rax + rax + 0x460042c0]
041d0 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
041da 4883e4f0                       and        rsp, 0xfffffffffffffff0
041de e89de9b218                     call       0x7f63f4730900
041e3 f4                             hlt        
041e4 bef6ffffff                     mov        esi, 0xfffffff6
041e9 90                             nop        
041ea 90                             nop        
041eb 90                             nop        
041ec c5f877                         vzeroupper 
041ef e8ec87aeff                     call       0x7f63db6ea760
041f4 0f1f8400ec420047               nop        dword ptr [rax + rax + 0x470042ec]
041fc 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
04206 4883e4f0                       and        rsp, 0xfffffffffffffff0
0420a e871e9b218                     call       0x7f63f4730900
0420f f4                             hlt        
04210 bef6ffffff                     mov        esi, 0xfffffff6
04215 895c240c                       mov        dword ptr [rsp + 0xc], ebx
04219 90                             nop        
0421a 90                             nop        
0421b 90                             nop        
0421c c5f877                         vzeroupper 
0421f e8bc87aeff                     call       0x7f63db6ea760
04224 0f1f84001c430048               nop        dword ptr [rax + rax + 0x4800431c]
0422c 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
04236 4883e4f0                       and        rsp, 0xfffffffffffffff0
0423a e841e9b218                     call       0x7f63f4730900
0423f f4                             hlt        
04240 bef6ffffff                     mov        esi, 0xfffffff6
04245 90                             nop        
04246 90                             nop        
04247 90                             nop        
04248 c5f877                         vzeroupper 
0424b e89087aeff                     call       0x7f63db6ea760
04250 0f1f840048430049               nop        dword ptr [rax + rax + 0x49004348]
04258 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
04262 4883e4f0                       and        rsp, 0xfffffffffffffff0
04266 e815e9b218                     call       0x7f63f4730900
0426b f4                             hlt        
0426c bef6ffffff                     mov        esi, 0xfffffff6
04271 895c2408                       mov        dword ptr [rsp + 8], ebx
04275 90                             nop        
04276 90                             nop        
04277 90                             nop        
04278 c5f877                         vzeroupper 
0427b e86087aeff                     call       0x7f63db6ea760
04280 0f1f84007843004a               nop        dword ptr [rax + rax + 0x4a004378]
04288 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
04292 4883e4f0                       and        rsp, 0xfffffffffffffff0
04296 e8e5e8b218                     call       0x7f63f4730900
0429b f4                             hlt        
0429c bef6ffffff                     mov        esi, 0xfffffff6
042a1 90                             nop        
042a2 90                             nop        
042a3 90                             nop        
042a4 c5f877                         vzeroupper 
042a7 e83487aeff                     call       0x7f63db6ea760
042ac 0f1f8400a443004b               nop        dword ptr [rax + rax + 0x4b0043a4]
042b4 48bf804a4fb4637f0000           movabs     rdi, 0x7f63b44f4a80
042be 4883e4f0                       and        rsp, 0xfffffffffffffff0
042c2 e8b9e8b218                     call       0x7f63f4730900
042c7 f4                             hlt        
042c8 49baccebbfdb637f0000           movabs     r10, 0x7f63dbbfebcc
042d2 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
042d9 e90243b4ff                     jmp        0x7f63db746360
042de e87d11b3ff                     call       0x7f63db7331e0
042e3 e946bdffff                     jmp        0x7f63dbbfddae
