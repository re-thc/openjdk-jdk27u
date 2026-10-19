00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f85480c0000                   jne        0x7f2cebbb2066
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5604                       mov        r10d, dword ptr [rsi + 4]
00038 4585d2                         test       r10d, r10d
0003b 0f86fb050000                   jbe        0x7f2cebbb1a3c
00041 4183fa01                       cmp        r10d, 1
00045 0f861d060000                   jbe        0x7f2cebbb1a68
0004b 4183fa02                       cmp        r10d, 2
0004f 0f863f060000                   jbe        0x7f2cebbb1a94
00055 4183fa03                       cmp        r10d, 3
00059 0f8661060000                   jbe        0x7f2cebbb1ac0
0005f 4183fa04                       cmp        r10d, 4
00063 0f8683060000                   jbe        0x7f2cebbb1aec
00069 4183fa05                       cmp        r10d, 5
0006d 0f86a5060000                   jbe        0x7f2cebbb1b18
00073 4183fa06                       cmp        r10d, 6
00077 0f86c7060000                   jbe        0x7f2cebbb1b44
0007d 4183fa07                       cmp        r10d, 7
00081 0f86e9060000                   jbe        0x7f2cebbb1b70
00087 4183fa08                       cmp        r10d, 8
0008b 0f860b070000                   jbe        0x7f2cebbb1b9c
00091 4183fa09                       cmp        r10d, 9
00095 0f862d070000                   jbe        0x7f2cebbb1bc8
0009b 4183fa0a                       cmp        r10d, 0xa
0009f 0f864f070000                   jbe        0x7f2cebbb1bf4
000a5 4183fa0b                       cmp        r10d, 0xb
000a9 0f8671070000                   jbe        0x7f2cebbb1c20
000af 4183fa0c                       cmp        r10d, 0xc
000b3 0f8693070000                   jbe        0x7f2cebbb1c4c
000b9 4183fa0d                       cmp        r10d, 0xd
000bd 0f86b5070000                   jbe        0x7f2cebbb1c78
000c3 4183fa0e                       cmp        r10d, 0xe
000c7 0f86d7070000                   jbe        0x7f2cebbb1ca4
000cd 4183fa0f                       cmp        r10d, 0xf
000d1 0f86f9070000                   jbe        0x7f2cebbb1cd0
000d7 4183fa10                       cmp        r10d, 0x10
000db 0f861b080000                   jbe        0x7f2cebbb1cfc
000e1 4183fa11                       cmp        r10d, 0x11
000e5 0f863d080000                   jbe        0x7f2cebbb1d28
000eb 4183fa12                       cmp        r10d, 0x12
000ef 0f865f080000                   jbe        0x7f2cebbb1d54
000f5 4183fa13                       cmp        r10d, 0x13
000f9 0f8681080000                   jbe        0x7f2cebbb1d80
000ff 4183fa14                       cmp        r10d, 0x14
00103 0f86a3080000                   jbe        0x7f2cebbb1dac
00109 4183fa15                       cmp        r10d, 0x15
0010d 0f86c5080000                   jbe        0x7f2cebbb1dd8
00113 4183fa16                       cmp        r10d, 0x16
00117 0f86e7080000                   jbe        0x7f2cebbb1e04
0011d 4183fa17                       cmp        r10d, 0x17
00121 0f8609090000                   jbe        0x7f2cebbb1e30
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
002db e88005b7ff                     call       0x7f2ceb721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 4885ed                         test       rbp, rbp
002eb 0f8450020000                   je         0x7f2cebbb1941
002f1 448b5504                       mov        r10d, dword ptr [rbp + 4]
002f5 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
002fd 453bc2                         cmp        r8d, r10d
00300 0f8362020000                   jae        0x7f2cebbb1968
00306 428b4c8508                     mov        ecx, dword ptr [rbp + r8*4 + 8]
0030b 8be9                           mov        ebp, ecx
0030d 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
00313 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00318 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0031c 453bc3                         cmp        r8d, r11d
0031f 0f836b020000                   jae        0x7f2cebbb1990
00325 43896c8208                     mov        dword ptr [r10 + r8*4 + 8], ebp
0032a 4c8b1424                       mov        r10, qword ptr [rsp]
0032e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00332 453bc3                         cmp        r8d, r11d
00335 0f837d020000                   jae        0x7f2cebbb19b8
0033b 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00340 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00344 453bc3                         cmp        r8d, r11d
00347 0f8397020000                   jae        0x7f2cebbb19e4
0034d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00352 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00356 453bc3                         cmp        r8d, r11d
00359 0f83b1020000                   jae        0x7f2cebbb1a10
0035f 4863e9                         movsxd     rbp, ecx
00362 be01000000                     mov        esi, 1
00367 4c8b1424                       mov        r10, qword ptr [rsp]
0036b 478b5c8208                     mov        r11d, dword ptr [r10 + r8*4 + 8]
00370 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00375 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
0037a 4d63db                         movsxd     r11, r11d
0037d 4d63d2                         movsxd     r10, r10d
00380 4d03da                         add        r11, r10
00383 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00388 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
0038d 4d63d2                         movsxd     r10, r10d
00390 4d03da                         add        r11, r10
00393 4903eb                         add        rbp, r11
00396 90                             nop        
00397 e8c404b7ff                     call       0x7f2ceb721c60
0039c 0f1f840094040001               nop        dword ptr [rax + rax + 0x1000494]
003a4 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003ac 458b5a04                       mov        r11d, dword ptr [r10 + 4]
003b0 4585db                         test       r11d, r11d
003b3 0f86a3060000                   jbe        0x7f2cebbb1e5c
003b9 458b4208                       mov        r8d, dword ptr [r10 + 8]
003bd 4d8b4808                       mov        r9, qword ptr [r8 + 8]
003c1 4183fb01                       cmp        r11d, 1
003c5 0f86b9060000                   jbe        0x7f2cebbb1e84
003cb 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
003cf 4d8b4008                       mov        r8, qword ptr [r8 + 8]
003d3 4183fb02                       cmp        r11d, 2
003d7 0f86cf060000                   jbe        0x7f2cebbb1eac
003dd 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
003e1 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
003e5 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003ea 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
003f1 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
003f6 4833c5                         xor        rax, rbp
003f9 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00401 4903c2                         add        rax, r10
00404 c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
0040c 4903c2                         add        rax, r10
0040f c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
00417 4903c2                         add        rax, r10
0041a c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
00422 4903c2                         add        rax, r10
00425 c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
0042d 4903c2                         add        rax, r10
00430 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
00438 4903c2                         add        rax, r10
0043b c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
00446 4903c2                         add        rax, r10
00449 c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00451 4903c2                         add        rax, r10
00454 c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
0045c 4903c2                         add        rax, r10
0045f c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
00467 4903c2                         add        rax, r10
0046a c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
00472 4903c2                         add        rax, r10
00475 c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
0047d 4903c2                         add        rax, r10
00480 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
0048b 4903c2                         add        rax, r10
0048e c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
00499 4903c2                         add        rax, r10
0049c c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004a7 4903c2                         add        rax, r10
004aa c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004b5 4903c2                         add        rax, r10
004b8 c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004c3 4903c2                         add        rax, r10
004c6 c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
004d1 4903c2                         add        rax, r10
004d4 c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
004df 4903c2                         add        rax, r10
004e2 c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
004ed 4903c2                         add        rax, r10
004f0 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
004fb 4903c2                         add        rax, r10
004fe c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
00509 4903c2                         add        rax, r10
0050c c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
00517 4903c2                         add        rax, r10
0051a c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
00522 4903c2                         add        rax, r10
00525 4933c1                         xor        rax, r9
00528 4933c0                         xor        rax, r8
0052b 4933c3                         xor        rax, r11
0052e 4881c400010000                 add        rsp, 0x100
00535 5d                             pop        rbp
00536 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0053a 0f8710070000                   ja         0x7f2cebbb2050
00540 c3                             ret        
00541 bef7ffffff                     mov        esi, 0xfffffff7
00546 90                             nop        
00547 e894eea9ff                     call       0x7f2ceb6507e0
0054c 0f1f840044060002               nop        dword ptr [rax + rax + 0x2000644]
00554 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0055e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00562 e809248b17                     call       0x7f2d03463d70
00567 f4                             hlt        
00568 bee7ffffff                     mov        esi, 0xffffffe7
0056d 90                             nop        
0056e 90                             nop        
0056f e86ceea9ff                     call       0x7f2ceb6507e0
00574 0f1f84006c060003               nop        dword ptr [rax + rax + 0x300066c]
0057c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00586 4883e4f0                       and        rsp, 0xfffffffffffffff0
0058a e8e1238b17                     call       0x7f2d03463d70
0058f f4                             hlt        
00590 bee6ffffff                     mov        esi, 0xffffffe6
00595 90                             nop        
00596 90                             nop        
00597 e844eea9ff                     call       0x7f2ceb6507e0
0059c 0f1f840094060004               nop        dword ptr [rax + rax + 0x4000694]
005a4 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
005ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
005b2 e8b9238b17                     call       0x7f2d03463d70
005b7 f4                             hlt        
005b8 bee7ffffff                     mov        esi, 0xffffffe7
005bd 498bea                         mov        rbp, r10
005c0 90                             nop        
005c1 90                             nop        
005c2 90                             nop        
005c3 e818eea9ff                     call       0x7f2ceb6507e0
005c8 0f1f8400c0060005               nop        dword ptr [rax + rax + 0x50006c0]
005d0 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
005da 4883e4f0                       and        rsp, 0xfffffffffffffff0
005de e88d238b17                     call       0x7f2d03463d70
005e3 f4                             hlt        
005e4 bee7ffffff                     mov        esi, 0xffffffe7
005e9 498bea                         mov        rbp, r10
005ec 90                             nop        
005ed 90                             nop        
005ee 90                             nop        
005ef e8eceda9ff                     call       0x7f2ceb6507e0
005f4 0f1f8400ec060006               nop        dword ptr [rax + rax + 0x60006ec]
005fc 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00606 4883e4f0                       and        rsp, 0xfffffffffffffff0
0060a e861238b17                     call       0x7f2d03463d70
0060f f4                             hlt        
00610 bee6ffffff                     mov        esi, 0xffffffe6
00615 498bea                         mov        rbp, r10
00618 90                             nop        
00619 90                             nop        
0061a 90                             nop        
0061b e8c0eda9ff                     call       0x7f2ceb6507e0
00620 0f1f840018070007               nop        dword ptr [rax + rax + 0x7000718]
00628 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00632 4883e4f0                       and        rsp, 0xfffffffffffffff0
00636 e835238b17                     call       0x7f2d03463d70
0063b f4                             hlt        
0063c 488bee                         mov        rbp, rsi
0063f bee6ffffff                     mov        esi, 0xffffffe6
00644 90                             nop        
00645 90                             nop        
00646 90                             nop        
00647 e894eda9ff                     call       0x7f2ceb6507e0
0064c 0f1f840044070008               nop        dword ptr [rax + rax + 0x8000744]
00654 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0065e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00662 e809238b17                     call       0x7f2d03463d70
00667 f4                             hlt        
00668 488bee                         mov        rbp, rsi
0066b bee6ffffff                     mov        esi, 0xffffffe6
00670 90                             nop        
00671 90                             nop        
00672 90                             nop        
00673 e868eda9ff                     call       0x7f2ceb6507e0
00678 0f1f840070070009               nop        dword ptr [rax + rax + 0x9000770]
00680 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0068a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0068e e8dd228b17                     call       0x7f2d03463d70
00693 f4                             hlt        
00694 488bee                         mov        rbp, rsi
00697 bee6ffffff                     mov        esi, 0xffffffe6
0069c 90                             nop        
0069d 90                             nop        
0069e 90                             nop        
0069f e83ceda9ff                     call       0x7f2ceb6507e0
006a4 0f1f84009c07000a               nop        dword ptr [rax + rax + 0xa00079c]
006ac 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
006b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
006ba e8b1228b17                     call       0x7f2d03463d70
006bf f4                             hlt        
006c0 488bee                         mov        rbp, rsi
006c3 bee6ffffff                     mov        esi, 0xffffffe6
006c8 90                             nop        
006c9 90                             nop        
006ca 90                             nop        
006cb e810eda9ff                     call       0x7f2ceb6507e0
006d0 0f1f8400c807000b               nop        dword ptr [rax + rax + 0xb0007c8]
006d8 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
006e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
006e6 e885228b17                     call       0x7f2d03463d70
006eb f4                             hlt        
006ec 488bee                         mov        rbp, rsi
006ef bee6ffffff                     mov        esi, 0xffffffe6
006f4 90                             nop        
006f5 90                             nop        
006f6 90                             nop        
006f7 e8e4eca9ff                     call       0x7f2ceb6507e0
006fc 0f1f8400f407000c               nop        dword ptr [rax + rax + 0xc0007f4]
00704 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0070e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00712 e859228b17                     call       0x7f2d03463d70
00717 f4                             hlt        
00718 488bee                         mov        rbp, rsi
0071b bee6ffffff                     mov        esi, 0xffffffe6
00720 90                             nop        
00721 90                             nop        
00722 90                             nop        
00723 e8b8eca9ff                     call       0x7f2ceb6507e0
00728 0f1f84002008000d               nop        dword ptr [rax + rax + 0xd000820]
00730 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0073a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0073e e82d228b17                     call       0x7f2d03463d70
00743 f4                             hlt        
00744 488bee                         mov        rbp, rsi
00747 bee6ffffff                     mov        esi, 0xffffffe6
0074c 90                             nop        
0074d 90                             nop        
0074e 90                             nop        
0074f e88ceca9ff                     call       0x7f2ceb6507e0
00754 0f1f84004c08000e               nop        dword ptr [rax + rax + 0xe00084c]
0075c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00766 4883e4f0                       and        rsp, 0xfffffffffffffff0
0076a e801228b17                     call       0x7f2d03463d70
0076f f4                             hlt        
00770 488bee                         mov        rbp, rsi
00773 bee6ffffff                     mov        esi, 0xffffffe6
00778 90                             nop        
00779 90                             nop        
0077a 90                             nop        
0077b e860eca9ff                     call       0x7f2ceb6507e0
00780 0f1f84007808000f               nop        dword ptr [rax + rax + 0xf000878]
00788 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00792 4883e4f0                       and        rsp, 0xfffffffffffffff0
00796 e8d5218b17                     call       0x7f2d03463d70
0079b f4                             hlt        
0079c 488bee                         mov        rbp, rsi
0079f bee6ffffff                     mov        esi, 0xffffffe6
007a4 90                             nop        
007a5 90                             nop        
007a6 90                             nop        
007a7 e834eca9ff                     call       0x7f2ceb6507e0
007ac 0f1f8400a4080010               nop        dword ptr [rax + rax + 0x100008a4]
007b4 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
007be 4883e4f0                       and        rsp, 0xfffffffffffffff0
007c2 e8a9218b17                     call       0x7f2d03463d70
007c7 f4                             hlt        
007c8 488bee                         mov        rbp, rsi
007cb bee6ffffff                     mov        esi, 0xffffffe6
007d0 90                             nop        
007d1 90                             nop        
007d2 90                             nop        
007d3 e808eca9ff                     call       0x7f2ceb6507e0
007d8 0f1f8400d0080011               nop        dword ptr [rax + rax + 0x110008d0]
007e0 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
007ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ee e87d218b17                     call       0x7f2d03463d70
007f3 f4                             hlt        
007f4 488bee                         mov        rbp, rsi
007f7 bee6ffffff                     mov        esi, 0xffffffe6
007fc 90                             nop        
007fd 90                             nop        
007fe 90                             nop        
007ff e8dceba9ff                     call       0x7f2ceb6507e0
00804 0f1f8400fc080012               nop        dword ptr [rax + rax + 0x120008fc]
0080c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00816 4883e4f0                       and        rsp, 0xfffffffffffffff0
0081a e851218b17                     call       0x7f2d03463d70
0081f f4                             hlt        
00820 488bee                         mov        rbp, rsi
00823 bee6ffffff                     mov        esi, 0xffffffe6
00828 90                             nop        
00829 90                             nop        
0082a 90                             nop        
0082b e8b0eba9ff                     call       0x7f2ceb6507e0
00830 0f1f840028090013               nop        dword ptr [rax + rax + 0x13000928]
00838 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00842 4883e4f0                       and        rsp, 0xfffffffffffffff0
00846 e825218b17                     call       0x7f2d03463d70
0084b f4                             hlt        
0084c 488bee                         mov        rbp, rsi
0084f bee6ffffff                     mov        esi, 0xffffffe6
00854 90                             nop        
00855 90                             nop        
00856 90                             nop        
00857 e884eba9ff                     call       0x7f2ceb6507e0
0085c 0f1f840054090014               nop        dword ptr [rax + rax + 0x14000954]
00864 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0086e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00872 e8f9208b17                     call       0x7f2d03463d70
00877 f4                             hlt        
00878 488bee                         mov        rbp, rsi
0087b bee6ffffff                     mov        esi, 0xffffffe6
00880 90                             nop        
00881 90                             nop        
00882 90                             nop        
00883 e858eba9ff                     call       0x7f2ceb6507e0
00888 0f1f840080090015               nop        dword ptr [rax + rax + 0x15000980]
00890 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0089a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0089e e8cd208b17                     call       0x7f2d03463d70
008a3 f4                             hlt        
008a4 488bee                         mov        rbp, rsi
008a7 bee6ffffff                     mov        esi, 0xffffffe6
008ac 90                             nop        
008ad 90                             nop        
008ae 90                             nop        
008af e82ceba9ff                     call       0x7f2ceb6507e0
008b4 0f1f8400ac090016               nop        dword ptr [rax + rax + 0x160009ac]
008bc 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
008c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ca e8a1208b17                     call       0x7f2d03463d70
008cf f4                             hlt        
008d0 488bee                         mov        rbp, rsi
008d3 bee6ffffff                     mov        esi, 0xffffffe6
008d8 90                             nop        
008d9 90                             nop        
008da 90                             nop        
008db e800eba9ff                     call       0x7f2ceb6507e0
008e0 0f1f8400d8090017               nop        dword ptr [rax + rax + 0x170009d8]
008e8 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
008f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008f6 e875208b17                     call       0x7f2d03463d70
008fb f4                             hlt        
008fc 488bee                         mov        rbp, rsi
008ff bee6ffffff                     mov        esi, 0xffffffe6
00904 90                             nop        
00905 90                             nop        
00906 90                             nop        
00907 e8d4eaa9ff                     call       0x7f2ceb6507e0
0090c 0f1f8400040a0018               nop        dword ptr [rax + rax + 0x18000a04]
00914 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0091e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00922 e849208b17                     call       0x7f2d03463d70
00927 f4                             hlt        
00928 488bee                         mov        rbp, rsi
0092b bee6ffffff                     mov        esi, 0xffffffe6
00930 90                             nop        
00931 90                             nop        
00932 90                             nop        
00933 e8a8eaa9ff                     call       0x7f2ceb6507e0
00938 0f1f8400300a0019               nop        dword ptr [rax + rax + 0x19000a30]
00940 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
0094a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0094e e81d208b17                     call       0x7f2d03463d70
00953 f4                             hlt        
00954 488bee                         mov        rbp, rsi
00957 bee6ffffff                     mov        esi, 0xffffffe6
0095c 90                             nop        
0095d 90                             nop        
0095e 90                             nop        
0095f e87ceaa9ff                     call       0x7f2ceb6507e0
00964 0f1f84005c0a001a               nop        dword ptr [rax + rax + 0x1a000a5c]
0096c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097a e8f11f8b17                     call       0x7f2d03463d70
0097f f4                             hlt        
00980 488bee                         mov        rbp, rsi
00983 bee6ffffff                     mov        esi, 0xffffffe6
00988 90                             nop        
00989 90                             nop        
0098a 90                             nop        
0098b e850eaa9ff                     call       0x7f2ceb6507e0
00990 0f1f8400880a001b               nop        dword ptr [rax + rax + 0x1b000a88]
00998 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
009a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
009a6 e8c51f8b17                     call       0x7f2d03463d70
009ab f4                             hlt        
009ac 488bee                         mov        rbp, rsi
009af bee6ffffff                     mov        esi, 0xffffffe6
009b4 90                             nop        
009b5 90                             nop        
009b6 90                             nop        
009b7 e824eaa9ff                     call       0x7f2ceb6507e0
009bc 0f1f8400b40a001c               nop        dword ptr [rax + rax + 0x1c000ab4]
009c4 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
009ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
009d2 e8991f8b17                     call       0x7f2d03463d70
009d7 f4                             hlt        
009d8 488bee                         mov        rbp, rsi
009db bee6ffffff                     mov        esi, 0xffffffe6
009e0 90                             nop        
009e1 90                             nop        
009e2 90                             nop        
009e3 e8f8e9a9ff                     call       0x7f2ceb6507e0
009e8 0f1f8400e00a001d               nop        dword ptr [rax + rax + 0x1d000ae0]
009f0 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
009fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
009fe e86d1f8b17                     call       0x7f2d03463d70
00a03 f4                             hlt        
00a04 488bee                         mov        rbp, rsi
00a07 bee6ffffff                     mov        esi, 0xffffffe6
00a0c 90                             nop        
00a0d 90                             nop        
00a0e 90                             nop        
00a0f e8cce9a9ff                     call       0x7f2ceb6507e0
00a14 0f1f84000c0b001e               nop        dword ptr [rax + rax + 0x1e000b0c]
00a1c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00a26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a2a e8411f8b17                     call       0x7f2d03463d70
00a2f f4                             hlt        
00a30 488bee                         mov        rbp, rsi
00a33 bee6ffffff                     mov        esi, 0xffffffe6
00a38 90                             nop        
00a39 90                             nop        
00a3a 90                             nop        
00a3b e8a0e9a9ff                     call       0x7f2ceb6507e0
00a40 0f1f8400380b001f               nop        dword ptr [rax + rax + 0x1f000b38]
00a48 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00a52 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a56 e8151f8b17                     call       0x7f2d03463d70
00a5b f4                             hlt        
00a5c bee6ffffff                     mov        esi, 0xffffffe6
00a61 90                             nop        
00a62 90                             nop        
00a63 e878e9a9ff                     call       0x7f2ceb6507e0
00a68 0f1f8400600b0020               nop        dword ptr [rax + rax + 0x20000b60]
00a70 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00a7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a7e e8ed1e8b17                     call       0x7f2d03463d70
00a83 f4                             hlt        
00a84 bee6ffffff                     mov        esi, 0xffffffe6
00a89 90                             nop        
00a8a 90                             nop        
00a8b e850e9a9ff                     call       0x7f2ceb6507e0
00a90 0f1f8400880b0021               nop        dword ptr [rax + rax + 0x21000b88]
00a98 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00aa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aa6 e8c51e8b17                     call       0x7f2d03463d70
00aab f4                             hlt        
00aac bee6ffffff                     mov        esi, 0xffffffe6
00ab1 90                             nop        
00ab2 90                             nop        
00ab3 e828e9a9ff                     call       0x7f2ceb6507e0
00ab8 0f1f8400b00b0022               nop        dword ptr [rax + rax + 0x22000bb0]
00ac0 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00aca 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ace e89d1e8b17                     call       0x7f2d03463d70
00ad3 f4                             hlt        
00ad4 488bf0                         mov        rsi, rax
00ad7 eb03                           jmp        0x7f2cebbb1edc
00ad9 488bf0                         mov        rsi, rax
00adc 4881c400010000                 add        rsp, 0x100
00ae3 5d                             pop        rbp
00ae4 e9f76fa9ff                     jmp        0x7f2ceb648ee0
00ae9 bef6ffffff                     mov        esi, 0xfffffff6
00aee 90                             nop        
00aef e8ece8a9ff                     call       0x7f2ceb6507e0
00af4 0f1f8400ec0b0023               nop        dword ptr [rax + rax + 0x23000bec]
00afc 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b0a e8611e8b17                     call       0x7f2d03463d70
00b0f f4                             hlt        
00b10 bef6ffffff                     mov        esi, 0xfffffff6
00b15 90                             nop        
00b16 90                             nop        
00b17 e8c4e8a9ff                     call       0x7f2ceb6507e0
00b1c 0f1f8400140c0024               nop        dword ptr [rax + rax + 0x24000c14]
00b24 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b32 e8391e8b17                     call       0x7f2d03463d70
00b37 f4                             hlt        
00b38 bef6ffffff                     mov        esi, 0xfffffff6
00b3d 90                             nop        
00b3e 90                             nop        
00b3f e89ce8a9ff                     call       0x7f2ceb6507e0
00b44 0f1f84003c0c0025               nop        dword ptr [rax + rax + 0x25000c3c]
00b4c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b5a e8111e8b17                     call       0x7f2d03463d70
00b5f f4                             hlt        
00b60 bef6ffffff                     mov        esi, 0xfffffff6
00b65 90                             nop        
00b66 90                             nop        
00b67 e874e8a9ff                     call       0x7f2ceb6507e0
00b6c 0f1f8400640c0026               nop        dword ptr [rax + rax + 0x26000c64]
00b74 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00b7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b82 e8e91d8b17                     call       0x7f2d03463d70
00b87 f4                             hlt        
00b88 bef6ffffff                     mov        esi, 0xfffffff6
00b8d 90                             nop        
00b8e 90                             nop        
00b8f e84ce8a9ff                     call       0x7f2ceb6507e0
00b94 0f1f84008c0c0027               nop        dword ptr [rax + rax + 0x27000c8c]
00b9c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00baa e8c11d8b17                     call       0x7f2d03463d70
00baf f4                             hlt        
00bb0 bef6ffffff                     mov        esi, 0xfffffff6
00bb5 90                             nop        
00bb6 90                             nop        
00bb7 e824e8a9ff                     call       0x7f2ceb6507e0
00bbc 0f1f8400b40c0028               nop        dword ptr [rax + rax + 0x28000cb4]
00bc4 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd2 e8991d8b17                     call       0x7f2d03463d70
00bd7 f4                             hlt        
00bd8 bef6ffffff                     mov        esi, 0xfffffff6
00bdd 90                             nop        
00bde 90                             nop        
00bdf e8fce7a9ff                     call       0x7f2ceb6507e0
00be4 0f1f8400dc0c0029               nop        dword ptr [rax + rax + 0x29000cdc]
00bec 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfa e8711d8b17                     call       0x7f2d03463d70
00bff f4                             hlt        
00c00 bef6ffffff                     mov        esi, 0xfffffff6
00c05 90                             nop        
00c06 90                             nop        
00c07 e8d4e7a9ff                     call       0x7f2ceb6507e0
00c0c 0f1f8400040d002a               nop        dword ptr [rax + rax + 0x2a000d04]
00c14 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00c1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c22 e8491d8b17                     call       0x7f2d03463d70
00c27 f4                             hlt        
00c28 bef6ffffff                     mov        esi, 0xfffffff6
00c2d 90                             nop        
00c2e 90                             nop        
00c2f e8ace7a9ff                     call       0x7f2ceb6507e0
00c34 0f1f84002c0d002b               nop        dword ptr [rax + rax + 0x2b000d2c]
00c3c 48bf50cf15c42c7f0000           movabs     rdi, 0x7f2cc415cf50
00c46 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c4a e8211d8b17                     call       0x7f2d03463d70
00c4f f4                             hlt        
00c50 49ba3619bbeb2c7f0000           movabs     r10, 0x7f2cebbb1936
00c5a 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00c61 e9fa22b7ff                     jmp        0x7f2ceb724360
00c66 e8f5f2b5ff                     call       0x7f2ceb711360
00c6b e9aef3ffff                     jmp        0x7f2cebbb141e
