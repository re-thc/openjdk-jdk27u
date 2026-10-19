00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f855c0c0000                   jne        0x7f2cebbb2e7a
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5604                       mov        r10d, dword ptr [rsi + 4]
00038 4585d2                         test       r10d, r10d
0003b 0f865f060000                   jbe        0x7f2cebbb28a0
00041 4183fa01                       cmp        r10d, 1
00045 0f8681060000                   jbe        0x7f2cebbb28cc
0004b 4183fa02                       cmp        r10d, 2
0004f 0f86a3060000                   jbe        0x7f2cebbb28f8
00055 4183fa03                       cmp        r10d, 3
00059 0f86c5060000                   jbe        0x7f2cebbb2924
0005f 4183fa04                       cmp        r10d, 4
00063 0f86e7060000                   jbe        0x7f2cebbb2950
00069 4183fa05                       cmp        r10d, 5
0006d 0f8609070000                   jbe        0x7f2cebbb297c
00073 4183fa06                       cmp        r10d, 6
00077 0f862b070000                   jbe        0x7f2cebbb29a8
0007d 4183fa07                       cmp        r10d, 7
00081 0f864d070000                   jbe        0x7f2cebbb29d4
00087 4183fa08                       cmp        r10d, 8
0008b 0f866f070000                   jbe        0x7f2cebbb2a00
00091 4183fa09                       cmp        r10d, 9
00095 0f8691070000                   jbe        0x7f2cebbb2a2c
0009b 4183fa0a                       cmp        r10d, 0xa
0009f 0f86b3070000                   jbe        0x7f2cebbb2a58
000a5 4183fa0b                       cmp        r10d, 0xb
000a9 0f86d5070000                   jbe        0x7f2cebbb2a84
000af 4183fa0c                       cmp        r10d, 0xc
000b3 0f86f7070000                   jbe        0x7f2cebbb2ab0
000b9 4183fa0d                       cmp        r10d, 0xd
000bd 0f8619080000                   jbe        0x7f2cebbb2adc
000c3 4183fa0e                       cmp        r10d, 0xe
000c7 0f863b080000                   jbe        0x7f2cebbb2b08
000cd 4183fa0f                       cmp        r10d, 0xf
000d1 0f865d080000                   jbe        0x7f2cebbb2b34
000d7 4183fa10                       cmp        r10d, 0x10
000db 0f867f080000                   jbe        0x7f2cebbb2b60
000e1 4183fa11                       cmp        r10d, 0x11
000e5 0f86a1080000                   jbe        0x7f2cebbb2b8c
000eb 4183fa12                       cmp        r10d, 0x12
000ef 0f86c3080000                   jbe        0x7f2cebbb2bb8
000f5 4183fa13                       cmp        r10d, 0x13
000f9 0f86e5080000                   jbe        0x7f2cebbb2be4
000ff 4183fa14                       cmp        r10d, 0x14
00103 0f8607090000                   jbe        0x7f2cebbb2c10
00109 4183fa15                       cmp        r10d, 0x15
0010d 0f8629090000                   jbe        0x7f2cebbb2c3c
00113 4183fa16                       cmp        r10d, 0x16
00117 0f864b090000                   jbe        0x7f2cebbb2c68
0011d 4183fa17                       cmp        r10d, 0x17
00121 0f866d090000                   jbe        0x7f2cebbb2c94
00127 4c8b96c0000000                 mov        r10, qword ptr [rsi + 0xc0]
0012e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00133 4c8b5608                       mov        r10, qword ptr [rsi + 8]
00137 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0013b 4c8b4e18                       mov        r9, qword ptr [rsi + 0x18]
0013f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00144 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00149 4d33d3                         xor        r10, r11
0014c 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00150 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
00155 4d33d1                         xor        r10, r9
00158 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
0015c 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00161 4d33d0                         xor        r10, r8
00164 4c8b4630                       mov        r8, qword ptr [rsi + 0x30]
00168 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
0016d 4d33d3                         xor        r10, r11
00170 4c89442450                     mov        qword ptr [rsp + 0x50], r8
00175 4d33d0                         xor        r10, r8
00178 4c8b5e40                       mov        r11, qword ptr [rsi + 0x40]
0017c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00181 4c8b5e48                       mov        r11, qword ptr [rsi + 0x48]
00185 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0018a 4c8b5e50                       mov        r11, qword ptr [rsi + 0x50]
0018e 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00193 4c8b5e58                       mov        r11, qword ptr [rsi + 0x58]
00197 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
0019c 4c8b5e60                       mov        r11, qword ptr [rsi + 0x60]
001a0 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001a5 4c8b5e68                       mov        r11, qword ptr [rsi + 0x68]
001a9 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001b1 4c8b5e70                       mov        r11, qword ptr [rsi + 0x70]
001b5 4c899c2488000000               mov        qword ptr [rsp + 0x88], r11
001bd 4c8b5e78                       mov        r11, qword ptr [rsi + 0x78]
001c1 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
001c9 4c8b9e80000000                 mov        r11, qword ptr [rsi + 0x80]
001d0 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
001d8 4c8b9e88000000                 mov        r11, qword ptr [rsi + 0x88]
001df 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
001e7 4c8b9e90000000                 mov        r11, qword ptr [rsi + 0x90]
001ee 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
001f6 4c8b9e98000000                 mov        r11, qword ptr [rsi + 0x98]
001fd 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00205 4c8b9ea0000000                 mov        r11, qword ptr [rsi + 0xa0]
0020c 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00214 4c8b9ea8000000                 mov        r11, qword ptr [rsi + 0xa8]
0021b 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00223 4c8b9eb0000000                 mov        r11, qword ptr [rsi + 0xb0]
0022a 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00232 4c8b9eb8000000                 mov        r11, qword ptr [rsi + 0xb8]
00239 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
00241 4c8b5e38                       mov        r11, qword ptr [rsi + 0x38]
00245 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0024d 4d33d3                         xor        r10, r11
00250 4c33542458                     xor        r10, qword ptr [rsp + 0x58]
00255 4c33542460                     xor        r10, qword ptr [rsp + 0x60]
0025a 4c33542468                     xor        r10, qword ptr [rsp + 0x68]
0025f 4c33542470                     xor        r10, qword ptr [rsp + 0x70]
00264 4c33542478                     xor        r10, qword ptr [rsp + 0x78]
00269 4c33942480000000               xor        r10, qword ptr [rsp + 0x80]
00271 4c33942488000000               xor        r10, qword ptr [rsp + 0x88]
00279 4c33942490000000               xor        r10, qword ptr [rsp + 0x90]
00281 4c33942498000000               xor        r10, qword ptr [rsp + 0x98]
00289 4c339424a0000000               xor        r10, qword ptr [rsp + 0xa0]
00291 4c339424a8000000               xor        r10, qword ptr [rsp + 0xa8]
00299 4c339424b0000000               xor        r10, qword ptr [rsp + 0xb0]
002a1 4c339424b8000000               xor        r10, qword ptr [rsp + 0xb8]
002a9 4c339424c0000000               xor        r10, qword ptr [rsp + 0xc0]
002b1 4c339424c8000000               xor        r10, qword ptr [rsp + 0xc8]
002b9 4c339424d0000000               xor        r10, qword ptr [rsp + 0xd0]
002c1 4c33542420                     xor        r10, qword ptr [rsp + 0x20]
002c6 458bd2                         mov        r10d, r10d
002c9 4181e2ff030000                 and        r10d, 0x3ff
002d0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
002d8 33f6                           xor        esi, esi
002da 90                             nop        
002db e880f7b6ff                     call       0x7f2ceb721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 4885ed                         test       rbp, rbp
002eb 0f8464020000                   je         0x7f2cebbb2755
002f1 448b5504                       mov        r10d, dword ptr [rbp + 4]
002f5 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
002fd 453bc2                         cmp        r8d, r10d
00300 0f8376020000                   jae        0x7f2cebbb277c
00306 428b4c8508                     mov        ecx, dword ptr [rbp + r8*4 + 8]
0030b 8be9                           mov        ebp, ecx
0030d 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
00313 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00318 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0031c 453bc3                         cmp        r8d, r11d
0031f 0f837f020000                   jae        0x7f2cebbb27a4
00325 43896c8208                     mov        dword ptr [r10 + r8*4 + 8], ebp
0032a 4c8b1424                       mov        r10, qword ptr [rsp]
0032e 4d85d2                         test       r10, r10
00331 0f8495020000                   je         0x7f2cebbb27cc
00337 458b5204                       mov        r10d, dword ptr [r10 + 4]
0033b 453bc2                         cmp        r8d, r10d
0033e 0f83b0020000                   jae        0x7f2cebbb27f4
00344 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00349 4d85d2                         test       r10, r10
0034c 0f84ce020000                   je         0x7f2cebbb2820
00352 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00356 453bc3                         cmp        r8d, r11d
00359 0f83e9020000                   jae        0x7f2cebbb2848
0035f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00364 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00368 453bc3                         cmp        r8d, r11d
0036b 0f8303030000                   jae        0x7f2cebbb2874
00371 4863e9                         movsxd     rbp, ecx
00374 be01000000                     mov        esi, 1
00379 4c8b1424                       mov        r10, qword ptr [rsp]
0037d 478b5c8208                     mov        r11d, dword ptr [r10 + r8*4 + 8]
00382 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00387 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
0038c 4d63db                         movsxd     r11, r11d
0038f 4d63d2                         movsxd     r10, r10d
00392 4d03da                         add        r11, r10
00395 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0039a 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
0039f 4d63d2                         movsxd     r10, r10d
003a2 4d03da                         add        r11, r10
003a5 4903eb                         add        rbp, r11
003a8 90                             nop        
003a9 90                             nop        
003aa 90                             nop        
003ab e8b0f6b6ff                     call       0x7f2ceb721c60
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003c0 458b5a04                       mov        r11d, dword ptr [r10 + 4]
003c4 4585db                         test       r11d, r11d
003c7 0f86f3060000                   jbe        0x7f2cebbb2cc0
003cd 458b4208                       mov        r8d, dword ptr [r10 + 8]
003d1 4d8b4808                       mov        r9, qword ptr [r8 + 8]
003d5 4183fb01                       cmp        r11d, 1
003d9 0f8609070000                   jbe        0x7f2cebbb2ce8
003df 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
003e3 4d8b4008                       mov        r8, qword ptr [r8 + 8]
003e7 4183fb02                       cmp        r11d, 2
003eb 0f861f070000                   jbe        0x7f2cebbb2d10
003f1 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
003f5 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
003f9 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003fe 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
00405 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
0040a 4833c5                         xor        rax, rbp
0040d c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00415 4903c2                         add        rax, r10
00418 c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
00420 4903c2                         add        rax, r10
00423 c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
0042b 4903c2                         add        rax, r10
0042e c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
00436 4903c2                         add        rax, r10
00439 c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
00441 4903c2                         add        rax, r10
00444 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
0044c 4903c2                         add        rax, r10
0044f c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
0045a 4903c2                         add        rax, r10
0045d c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00465 4903c2                         add        rax, r10
00468 c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
00470 4903c2                         add        rax, r10
00473 c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
0047b 4903c2                         add        rax, r10
0047e c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
00486 4903c2                         add        rax, r10
00489 c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
00491 4903c2                         add        rax, r10
00494 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
0049f 4903c2                         add        rax, r10
004a2 c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
004ad 4903c2                         add        rax, r10
004b0 c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004bb 4903c2                         add        rax, r10
004be c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004c9 4903c2                         add        rax, r10
004cc c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004d7 4903c2                         add        rax, r10
004da c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
004e5 4903c2                         add        rax, r10
004e8 c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
004f3 4903c2                         add        rax, r10
004f6 c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
00501 4903c2                         add        rax, r10
00504 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
0050f 4903c2                         add        rax, r10
00512 c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
0051d 4903c2                         add        rax, r10
00520 c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
0052b 4903c2                         add        rax, r10
0052e c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
00536 4903c2                         add        rax, r10
00539 4933c1                         xor        rax, r9
0053c 4933c0                         xor        rax, r8
0053f 4933c3                         xor        rax, r11
00542 4881c400010000                 add        rsp, 0x100
00549 5d                             pop        rbp
0054a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0054e 0f8710070000                   ja         0x7f2cebbb2e64
00554 c3                             ret        
00555 bef7ffffff                     mov        esi, 0xfffffff7
0055a 90                             nop        
0055b e880e0a9ff                     call       0x7f2ceb6507e0
00560 0f1f840058060002               nop        dword ptr [rax + rax + 0x2000658]
00568 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00572 4883e4f0                       and        rsp, 0xfffffffffffffff0
00576 e8f5158b17                     call       0x7f2d03463d70
0057b f4                             hlt        
0057c bee7ffffff                     mov        esi, 0xffffffe7
00581 90                             nop        
00582 90                             nop        
00583 e858e0a9ff                     call       0x7f2ceb6507e0
00588 0f1f840080060003               nop        dword ptr [rax + rax + 0x3000680]
00590 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0059a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0059e e8cd158b17                     call       0x7f2d03463d70
005a3 f4                             hlt        
005a4 bee6ffffff                     mov        esi, 0xffffffe6
005a9 90                             nop        
005aa 90                             nop        
005ab e830e0a9ff                     call       0x7f2ceb6507e0
005b0 0f1f8400a8060004               nop        dword ptr [rax + rax + 0x40006a8]
005b8 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
005c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
005c6 e8a5158b17                     call       0x7f2d03463d70
005cb f4                             hlt        
005cc bef7ffffff                     mov        esi, 0xfffffff7
005d1 90                             nop        
005d2 90                             nop        
005d3 e808e0a9ff                     call       0x7f2ceb6507e0
005d8 0f1f8400d0060005               nop        dword ptr [rax + rax + 0x50006d0]
005e0 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
005ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ee e87d158b17                     call       0x7f2d03463d70
005f3 f4                             hlt        
005f4 bee7ffffff                     mov        esi, 0xffffffe7
005f9 488b2c24                       mov        rbp, qword ptr [rsp]
005fd 90                             nop        
005fe 90                             nop        
005ff e8dcdfa9ff                     call       0x7f2ceb6507e0
00604 0f1f8400fc060006               nop        dword ptr [rax + rax + 0x60006fc]
0060c 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00616 4883e4f0                       and        rsp, 0xfffffffffffffff0
0061a e851158b17                     call       0x7f2d03463d70
0061f f4                             hlt        
00620 bef7ffffff                     mov        esi, 0xfffffff7
00625 90                             nop        
00626 90                             nop        
00627 e8b4dfa9ff                     call       0x7f2ceb6507e0
0062c 0f1f840024070007               nop        dword ptr [rax + rax + 0x7000724]
00634 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0063e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00642 e829158b17                     call       0x7f2d03463d70
00647 f4                             hlt        
00648 bee7ffffff                     mov        esi, 0xffffffe7
0064d 498bea                         mov        rbp, r10
00650 90                             nop        
00651 90                             nop        
00652 90                             nop        
00653 e888dfa9ff                     call       0x7f2ceb6507e0
00658 0f1f840050070008               nop        dword ptr [rax + rax + 0x8000750]
00660 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0066a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0066e e8fd148b17                     call       0x7f2d03463d70
00673 f4                             hlt        
00674 bee6ffffff                     mov        esi, 0xffffffe6
00679 498bea                         mov        rbp, r10
0067c 90                             nop        
0067d 90                             nop        
0067e 90                             nop        
0067f e85cdfa9ff                     call       0x7f2ceb6507e0
00684 0f1f84007c070009               nop        dword ptr [rax + rax + 0x900077c]
0068c 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00696 4883e4f0                       and        rsp, 0xfffffffffffffff0
0069a e8d1148b17                     call       0x7f2d03463d70
0069f f4                             hlt        
006a0 488bee                         mov        rbp, rsi
006a3 bee6ffffff                     mov        esi, 0xffffffe6
006a8 90                             nop        
006a9 90                             nop        
006aa 90                             nop        
006ab e830dfa9ff                     call       0x7f2ceb6507e0
006b0 0f1f8400a807000a               nop        dword ptr [rax + rax + 0xa0007a8]
006b8 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
006c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
006c6 e8a5148b17                     call       0x7f2d03463d70
006cb f4                             hlt        
006cc 488bee                         mov        rbp, rsi
006cf bee6ffffff                     mov        esi, 0xffffffe6
006d4 90                             nop        
006d5 90                             nop        
006d6 90                             nop        
006d7 e804dfa9ff                     call       0x7f2ceb6507e0
006dc 0f1f8400d407000b               nop        dword ptr [rax + rax + 0xb0007d4]
006e4 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
006ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
006f2 e879148b17                     call       0x7f2d03463d70
006f7 f4                             hlt        
006f8 488bee                         mov        rbp, rsi
006fb bee6ffffff                     mov        esi, 0xffffffe6
00700 90                             nop        
00701 90                             nop        
00702 90                             nop        
00703 e8d8dea9ff                     call       0x7f2ceb6507e0
00708 0f1f84000008000c               nop        dword ptr [rax + rax + 0xc000800]
00710 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0071a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0071e e84d148b17                     call       0x7f2d03463d70
00723 f4                             hlt        
00724 488bee                         mov        rbp, rsi
00727 bee6ffffff                     mov        esi, 0xffffffe6
0072c 90                             nop        
0072d 90                             nop        
0072e 90                             nop        
0072f e8acdea9ff                     call       0x7f2ceb6507e0
00734 0f1f84002c08000d               nop        dword ptr [rax + rax + 0xd00082c]
0073c 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00746 4883e4f0                       and        rsp, 0xfffffffffffffff0
0074a e821148b17                     call       0x7f2d03463d70
0074f f4                             hlt        
00750 488bee                         mov        rbp, rsi
00753 bee6ffffff                     mov        esi, 0xffffffe6
00758 90                             nop        
00759 90                             nop        
0075a 90                             nop        
0075b e880dea9ff                     call       0x7f2ceb6507e0
00760 0f1f84005808000e               nop        dword ptr [rax + rax + 0xe000858]
00768 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00772 4883e4f0                       and        rsp, 0xfffffffffffffff0
00776 e8f5138b17                     call       0x7f2d03463d70
0077b f4                             hlt        
0077c 488bee                         mov        rbp, rsi
0077f bee6ffffff                     mov        esi, 0xffffffe6
00784 90                             nop        
00785 90                             nop        
00786 90                             nop        
00787 e854dea9ff                     call       0x7f2ceb6507e0
0078c 0f1f84008408000f               nop        dword ptr [rax + rax + 0xf000884]
00794 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0079e 4883e4f0                       and        rsp, 0xfffffffffffffff0
007a2 e8c9138b17                     call       0x7f2d03463d70
007a7 f4                             hlt        
007a8 488bee                         mov        rbp, rsi
007ab bee6ffffff                     mov        esi, 0xffffffe6
007b0 90                             nop        
007b1 90                             nop        
007b2 90                             nop        
007b3 e828dea9ff                     call       0x7f2ceb6507e0
007b8 0f1f8400b0080010               nop        dword ptr [rax + rax + 0x100008b0]
007c0 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
007ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ce e89d138b17                     call       0x7f2d03463d70
007d3 f4                             hlt        
007d4 488bee                         mov        rbp, rsi
007d7 bee6ffffff                     mov        esi, 0xffffffe6
007dc 90                             nop        
007dd 90                             nop        
007de 90                             nop        
007df e8fcdda9ff                     call       0x7f2ceb6507e0
007e4 0f1f8400dc080011               nop        dword ptr [rax + rax + 0x110008dc]
007ec 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
007f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
007fa e871138b17                     call       0x7f2d03463d70
007ff f4                             hlt        
00800 488bee                         mov        rbp, rsi
00803 bee6ffffff                     mov        esi, 0xffffffe6
00808 90                             nop        
00809 90                             nop        
0080a 90                             nop        
0080b e8d0dda9ff                     call       0x7f2ceb6507e0
00810 0f1f840008090012               nop        dword ptr [rax + rax + 0x12000908]
00818 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00822 4883e4f0                       and        rsp, 0xfffffffffffffff0
00826 e845138b17                     call       0x7f2d03463d70
0082b f4                             hlt        
0082c 488bee                         mov        rbp, rsi
0082f bee6ffffff                     mov        esi, 0xffffffe6
00834 90                             nop        
00835 90                             nop        
00836 90                             nop        
00837 e8a4dda9ff                     call       0x7f2ceb6507e0
0083c 0f1f840034090013               nop        dword ptr [rax + rax + 0x13000934]
00844 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0084e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00852 e819138b17                     call       0x7f2d03463d70
00857 f4                             hlt        
00858 488bee                         mov        rbp, rsi
0085b bee6ffffff                     mov        esi, 0xffffffe6
00860 90                             nop        
00861 90                             nop        
00862 90                             nop        
00863 e878dda9ff                     call       0x7f2ceb6507e0
00868 0f1f840060090014               nop        dword ptr [rax + rax + 0x14000960]
00870 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0087a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0087e e8ed128b17                     call       0x7f2d03463d70
00883 f4                             hlt        
00884 488bee                         mov        rbp, rsi
00887 bee6ffffff                     mov        esi, 0xffffffe6
0088c 90                             nop        
0088d 90                             nop        
0088e 90                             nop        
0088f e84cdda9ff                     call       0x7f2ceb6507e0
00894 0f1f84008c090015               nop        dword ptr [rax + rax + 0x1500098c]
0089c 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
008a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008aa e8c1128b17                     call       0x7f2d03463d70
008af f4                             hlt        
008b0 488bee                         mov        rbp, rsi
008b3 bee6ffffff                     mov        esi, 0xffffffe6
008b8 90                             nop        
008b9 90                             nop        
008ba 90                             nop        
008bb e820dda9ff                     call       0x7f2ceb6507e0
008c0 0f1f8400b8090016               nop        dword ptr [rax + rax + 0x160009b8]
008c8 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
008d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008d6 e895128b17                     call       0x7f2d03463d70
008db f4                             hlt        
008dc 488bee                         mov        rbp, rsi
008df bee6ffffff                     mov        esi, 0xffffffe6
008e4 90                             nop        
008e5 90                             nop        
008e6 90                             nop        
008e7 e8f4dca9ff                     call       0x7f2ceb6507e0
008ec 0f1f8400e4090017               nop        dword ptr [rax + rax + 0x170009e4]
008f4 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
008fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00902 e869128b17                     call       0x7f2d03463d70
00907 f4                             hlt        
00908 488bee                         mov        rbp, rsi
0090b bee6ffffff                     mov        esi, 0xffffffe6
00910 90                             nop        
00911 90                             nop        
00912 90                             nop        
00913 e8c8dca9ff                     call       0x7f2ceb6507e0
00918 0f1f8400100a0018               nop        dword ptr [rax + rax + 0x18000a10]
00920 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
0092a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0092e e83d128b17                     call       0x7f2d03463d70
00933 f4                             hlt        
00934 488bee                         mov        rbp, rsi
00937 bee6ffffff                     mov        esi, 0xffffffe6
0093c 90                             nop        
0093d 90                             nop        
0093e 90                             nop        
0093f e89cdca9ff                     call       0x7f2ceb6507e0
00944 0f1f84003c0a0019               nop        dword ptr [rax + rax + 0x19000a3c]
0094c 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00956 4883e4f0                       and        rsp, 0xfffffffffffffff0
0095a e811128b17                     call       0x7f2d03463d70
0095f f4                             hlt        
00960 488bee                         mov        rbp, rsi
00963 bee6ffffff                     mov        esi, 0xffffffe6
00968 90                             nop        
00969 90                             nop        
0096a 90                             nop        
0096b e870dca9ff                     call       0x7f2ceb6507e0
00970 0f1f8400680a001a               nop        dword ptr [rax + rax + 0x1a000a68]
00978 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00982 4883e4f0                       and        rsp, 0xfffffffffffffff0
00986 e8e5118b17                     call       0x7f2d03463d70
0098b f4                             hlt        
0098c 488bee                         mov        rbp, rsi
0098f bee6ffffff                     mov        esi, 0xffffffe6
00994 90                             nop        
00995 90                             nop        
00996 90                             nop        
00997 e844dca9ff                     call       0x7f2ceb6507e0
0099c 0f1f8400940a001b               nop        dword ptr [rax + rax + 0x1b000a94]
009a4 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
009ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
009b2 e8b9118b17                     call       0x7f2d03463d70
009b7 f4                             hlt        
009b8 488bee                         mov        rbp, rsi
009bb bee6ffffff                     mov        esi, 0xffffffe6
009c0 90                             nop        
009c1 90                             nop        
009c2 90                             nop        
009c3 e818dca9ff                     call       0x7f2ceb6507e0
009c8 0f1f8400c00a001c               nop        dword ptr [rax + rax + 0x1c000ac0]
009d0 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
009da 4883e4f0                       and        rsp, 0xfffffffffffffff0
009de e88d118b17                     call       0x7f2d03463d70
009e3 f4                             hlt        
009e4 488bee                         mov        rbp, rsi
009e7 bee6ffffff                     mov        esi, 0xffffffe6
009ec 90                             nop        
009ed 90                             nop        
009ee 90                             nop        
009ef e8ecdba9ff                     call       0x7f2ceb6507e0
009f4 0f1f8400ec0a001d               nop        dword ptr [rax + rax + 0x1d000aec]
009fc 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0a e861118b17                     call       0x7f2d03463d70
00a0f f4                             hlt        
00a10 488bee                         mov        rbp, rsi
00a13 bee6ffffff                     mov        esi, 0xffffffe6
00a18 90                             nop        
00a19 90                             nop        
00a1a 90                             nop        
00a1b e8c0dba9ff                     call       0x7f2ceb6507e0
00a20 0f1f8400180b001e               nop        dword ptr [rax + rax + 0x1e000b18]
00a28 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00a32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a36 e835118b17                     call       0x7f2d03463d70
00a3b f4                             hlt        
00a3c 488bee                         mov        rbp, rsi
00a3f bee6ffffff                     mov        esi, 0xffffffe6
00a44 90                             nop        
00a45 90                             nop        
00a46 90                             nop        
00a47 e894dba9ff                     call       0x7f2ceb6507e0
00a4c 0f1f8400440b001f               nop        dword ptr [rax + rax + 0x1f000b44]
00a54 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a62 e809118b17                     call       0x7f2d03463d70
00a67 f4                             hlt        
00a68 488bee                         mov        rbp, rsi
00a6b bee6ffffff                     mov        esi, 0xffffffe6
00a70 90                             nop        
00a71 90                             nop        
00a72 90                             nop        
00a73 e868dba9ff                     call       0x7f2ceb6507e0
00a78 0f1f8400700b0020               nop        dword ptr [rax + rax + 0x20000b70]
00a80 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00a8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a8e e8dd108b17                     call       0x7f2d03463d70
00a93 f4                             hlt        
00a94 488bee                         mov        rbp, rsi
00a97 bee6ffffff                     mov        esi, 0xffffffe6
00a9c 90                             nop        
00a9d 90                             nop        
00a9e 90                             nop        
00a9f e83cdba9ff                     call       0x7f2ceb6507e0
00aa4 0f1f84009c0b0021               nop        dword ptr [rax + rax + 0x21000b9c]
00aac 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00ab6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aba e8b1108b17                     call       0x7f2d03463d70
00abf f4                             hlt        
00ac0 bee6ffffff                     mov        esi, 0xffffffe6
00ac5 90                             nop        
00ac6 90                             nop        
00ac7 e814dba9ff                     call       0x7f2ceb6507e0
00acc 0f1f8400c40b0022               nop        dword ptr [rax + rax + 0x22000bc4]
00ad4 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ae2 e889108b17                     call       0x7f2d03463d70
00ae7 f4                             hlt        
00ae8 bee6ffffff                     mov        esi, 0xffffffe6
00aed 90                             nop        
00aee 90                             nop        
00aef e8ecdaa9ff                     call       0x7f2ceb6507e0
00af4 0f1f8400ec0b0023               nop        dword ptr [rax + rax + 0x23000bec]
00afc 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b0a e861108b17                     call       0x7f2d03463d70
00b0f f4                             hlt        
00b10 bee6ffffff                     mov        esi, 0xffffffe6
00b15 90                             nop        
00b16 90                             nop        
00b17 e8c4daa9ff                     call       0x7f2ceb6507e0
00b1c 0f1f8400140c0024               nop        dword ptr [rax + rax + 0x24000c14]
00b24 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b32 e839108b17                     call       0x7f2d03463d70
00b37 f4                             hlt        
00b38 488bf0                         mov        rsi, rax
00b3b eb03                           jmp        0x7f2cebbb2d40
00b3d 488bf0                         mov        rsi, rax
00b40 4881c400010000                 add        rsp, 0x100
00b47 5d                             pop        rbp
00b48 e99361a9ff                     jmp        0x7f2ceb648ee0
00b4d bef6ffffff                     mov        esi, 0xfffffff6
00b52 90                             nop        
00b53 e888daa9ff                     call       0x7f2ceb6507e0
00b58 0f1f8400500c0025               nop        dword ptr [rax + rax + 0x25000c50]
00b60 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00b6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b6e e8fd0f8b17                     call       0x7f2d03463d70
00b73 f4                             hlt        
00b74 bef6ffffff                     mov        esi, 0xfffffff6
00b79 90                             nop        
00b7a 90                             nop        
00b7b e860daa9ff                     call       0x7f2ceb6507e0
00b80 0f1f8400780c0026               nop        dword ptr [rax + rax + 0x26000c78]
00b88 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00b92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b96 e8d50f8b17                     call       0x7f2d03463d70
00b9b f4                             hlt        
00b9c bef6ffffff                     mov        esi, 0xfffffff6
00ba1 90                             nop        
00ba2 90                             nop        
00ba3 e838daa9ff                     call       0x7f2ceb6507e0
00ba8 0f1f8400a00c0027               nop        dword ptr [rax + rax + 0x27000ca0]
00bb0 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bbe e8ad0f8b17                     call       0x7f2d03463d70
00bc3 f4                             hlt        
00bc4 bef6ffffff                     mov        esi, 0xfffffff6
00bc9 90                             nop        
00bca 90                             nop        
00bcb e810daa9ff                     call       0x7f2ceb6507e0
00bd0 0f1f8400c80c0028               nop        dword ptr [rax + rax + 0x28000cc8]
00bd8 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00be6 e8850f8b17                     call       0x7f2d03463d70
00beb f4                             hlt        
00bec bef6ffffff                     mov        esi, 0xfffffff6
00bf1 90                             nop        
00bf2 90                             nop        
00bf3 e8e8d9a9ff                     call       0x7f2ceb6507e0
00bf8 0f1f8400f00c0029               nop        dword ptr [rax + rax + 0x29000cf0]
00c00 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c0e e85d0f8b17                     call       0x7f2d03463d70
00c13 f4                             hlt        
00c14 bef6ffffff                     mov        esi, 0xfffffff6
00c19 90                             nop        
00c1a 90                             nop        
00c1b e8c0d9a9ff                     call       0x7f2ceb6507e0
00c20 0f1f8400180d002a               nop        dword ptr [rax + rax + 0x2a000d18]
00c28 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c36 e8350f8b17                     call       0x7f2d03463d70
00c3b f4                             hlt        
00c3c bef6ffffff                     mov        esi, 0xfffffff6
00c41 90                             nop        
00c42 90                             nop        
00c43 e898d9a9ff                     call       0x7f2ceb6507e0
00c48 0f1f8400400d002b               nop        dword ptr [rax + rax + 0x2b000d40]
00c50 48bfa0aa20c42c7f0000           movabs     rdi, 0x7f2cc420aaa0
00c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c5e e80d0f8b17                     call       0x7f2d03463d70
00c63 f4                             hlt        
00c64 49ba4a27bbeb2c7f0000           movabs     r10, 0x7f2cebbb274a
00c6e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00c75 e9e614b7ff                     jmp        0x7f2ceb724360
00c7a e8e1e4b5ff                     call       0x7f2ceb711360
00c7f e99af3ffff                     jmp        0x7f2cebbb221e
00c84 f4                             hlt        
00c85 f4                             hlt        
00c86 f4                             hlt        
00c87 f4                             hlt        
