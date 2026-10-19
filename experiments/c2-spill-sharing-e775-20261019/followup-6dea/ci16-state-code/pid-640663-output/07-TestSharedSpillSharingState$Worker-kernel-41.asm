00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f85940c0000                   jne        0x7f60b3bb4232
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00038 4585db                         test       r11d, r11d
0003b 0f8693060000                   jbe        0x7f60b3bb3c54
00041 4183fb01                       cmp        r11d, 1
00045 0f86b5060000                   jbe        0x7f60b3bb3c80
0004b 4183fb02                       cmp        r11d, 2
0004f 0f86d7060000                   jbe        0x7f60b3bb3cac
00055 4183fb03                       cmp        r11d, 3
00059 0f86f9060000                   jbe        0x7f60b3bb3cd8
0005f 4183fb04                       cmp        r11d, 4
00063 0f861b070000                   jbe        0x7f60b3bb3d04
00069 4183fb05                       cmp        r11d, 5
0006d 0f863d070000                   jbe        0x7f60b3bb3d30
00073 4183fb06                       cmp        r11d, 6
00077 0f865f070000                   jbe        0x7f60b3bb3d5c
0007d 4183fb07                       cmp        r11d, 7
00081 0f8681070000                   jbe        0x7f60b3bb3d88
00087 4183fb08                       cmp        r11d, 8
0008b 0f86a3070000                   jbe        0x7f60b3bb3db4
00091 4183fb09                       cmp        r11d, 9
00095 0f86c5070000                   jbe        0x7f60b3bb3de0
0009b 4183fb0a                       cmp        r11d, 0xa
0009f 0f86e7070000                   jbe        0x7f60b3bb3e0c
000a5 4183fb0b                       cmp        r11d, 0xb
000a9 0f8609080000                   jbe        0x7f60b3bb3e38
000af 4183fb0c                       cmp        r11d, 0xc
000b3 0f862b080000                   jbe        0x7f60b3bb3e64
000b9 4183fb0d                       cmp        r11d, 0xd
000bd 0f864d080000                   jbe        0x7f60b3bb3e90
000c3 4183fb0e                       cmp        r11d, 0xe
000c7 0f866f080000                   jbe        0x7f60b3bb3ebc
000cd 4183fb0f                       cmp        r11d, 0xf
000d1 0f8691080000                   jbe        0x7f60b3bb3ee8
000d7 4183fb10                       cmp        r11d, 0x10
000db 0f86b3080000                   jbe        0x7f60b3bb3f14
000e1 4183fb11                       cmp        r11d, 0x11
000e5 0f86d5080000                   jbe        0x7f60b3bb3f40
000eb 4183fb12                       cmp        r11d, 0x12
000ef 0f86f7080000                   jbe        0x7f60b3bb3f6c
000f5 4183fb13                       cmp        r11d, 0x13
000f9 0f8619090000                   jbe        0x7f60b3bb3f98
000ff 4183fb14                       cmp        r11d, 0x14
00103 0f863b090000                   jbe        0x7f60b3bb3fc4
00109 4183fb15                       cmp        r11d, 0x15
0010d 0f865d090000                   jbe        0x7f60b3bb3ff0
00113 4183fb16                       cmp        r11d, 0x16
00117 0f867f090000                   jbe        0x7f60b3bb401c
0011d 4183fb17                       cmp        r11d, 0x17
00121 0f86a1090000                   jbe        0x7f60b3bb4048
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
002c6 458bda                         mov        r11d, r10d
002c9 4181e3ff030000                 and        r11d, 0x3ff
002d0 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
002d8 33f6                           xor        esi, esi
002da 90                             nop        
002db e800e4b6ff                     call       0x7f60b3721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 4885ed                         test       rbp, rbp
002eb 0f8488020000                   je         0x7f60b3bb3af9
002f1 448b5504                       mov        r10d, dword ptr [rbp + 4]
002f5 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
002fd 453bda                         cmp        r11d, r10d
00300 0f83a2020000                   jae        0x7f60b3bb3b28
00306 428b4c9d08                     mov        ecx, dword ptr [rbp + r11*4 + 8]
0030b 8be9                           mov        ebp, ecx
0030d 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
00313 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00318 458b5204                       mov        r10d, dword ptr [r10 + 4]
0031c 453bda                         cmp        r11d, r10d
0031f 0f83ab020000                   jae        0x7f60b3bb3b50
00325 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0032a 43896c9a08                     mov        dword ptr [r10 + r11*4 + 8], ebp
0032f 4c8b1424                       mov        r10, qword ptr [rsp]
00333 4d85d2                         test       r10, r10
00336 0f84bc020000                   je         0x7f60b3bb3b78
0033c 458b4204                       mov        r8d, dword ptr [r10 + 4]
00340 453bd8                         cmp        r11d, r8d
00343 0f83db020000                   jae        0x7f60b3bb3ba4
00349 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0034e 4d85d2                         test       r10, r10
00351 0f84f9020000                   je         0x7f60b3bb3bd0
00357 458b5204                       mov        r10d, dword ptr [r10 + 4]
0035b 453bda                         cmp        r11d, r10d
0035e 0f8318030000                   jae        0x7f60b3bb3bfc
00364 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00369 458b5204                       mov        r10d, dword ptr [r10 + 4]
0036d 453bda                         cmp        r11d, r10d
00370 0f8332030000                   jae        0x7f60b3bb3c28
00376 4863e9                         movsxd     rbp, ecx
00379 be01000000                     mov        esi, 1
0037e 4c8b1424                       mov        r10, qword ptr [rsp]
00382 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
00387 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0038c 478b449808                     mov        r8d, dword ptr [r8 + r11*4 + 8]
00391 4d63d2                         movsxd     r10, r10d
00394 4d63d8                         movsxd     r11, r8d
00397 4d03d3                         add        r10, r11
0039a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0039f 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
003a7 478b448308                     mov        r8d, dword ptr [r11 + r8*4 + 8]
003ac 4d63d8                         movsxd     r11, r8d
003af 4d03d3                         add        r10, r11
003b2 4903ea                         add        rbp, r10
003b5 90                             nop        
003b6 90                             nop        
003b7 e824e3b6ff                     call       0x7f60b3721c60
003bc 0f1f8400b4040001               nop        dword ptr [rax + rax + 0x10004b4]
003c4 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003cc 458b5204                       mov        r10d, dword ptr [r10 + 4]
003d0 4585d2                         test       r10d, r10d
003d3 0f861b070000                   jbe        0x7f60b3bb4074
003d9 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003e1 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003e5 4d8b4308                       mov        r8, qword ptr [r11 + 8]
003e9 4183fa01                       cmp        r10d, 1
003ed 0f8629070000                   jbe        0x7f60b3bb409c
003f3 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003fb 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
003ff 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
00403 4183fa02                       cmp        r10d, 2
00407 0f8637070000                   jbe        0x7f60b3bb40c4
0040d 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00415 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
00419 4d8b4a08                       mov        r9, qword ptr [r10 + 8]
0041d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00422 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
00429 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
0042e 4833c5                         xor        rax, rbp
00431 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00439 4903c2                         add        rax, r10
0043c c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
00444 4903c2                         add        rax, r10
00447 c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
0044f 4903c2                         add        rax, r10
00452 c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
0045a 4903c2                         add        rax, r10
0045d c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
00465 4903c2                         add        rax, r10
00468 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
00470 4903c2                         add        rax, r10
00473 c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
0047e 4903c2                         add        rax, r10
00481 c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00489 4903c2                         add        rax, r10
0048c c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
00494 4903c2                         add        rax, r10
00497 c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
0049f 4903c2                         add        rax, r10
004a2 c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
004aa 4903c2                         add        rax, r10
004ad c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
004b5 4903c2                         add        rax, r10
004b8 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
004c3 4903c2                         add        rax, r10
004c6 c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
004d1 4903c2                         add        rax, r10
004d4 c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004df 4903c2                         add        rax, r10
004e2 c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004ed 4903c2                         add        rax, r10
004f0 c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004fb 4903c2                         add        rax, r10
004fe c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
00509 4903c2                         add        rax, r10
0050c c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
00517 4903c2                         add        rax, r10
0051a c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
00525 4903c2                         add        rax, r10
00528 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
00533 4903c2                         add        rax, r10
00536 c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
00541 4903c2                         add        rax, r10
00544 c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
0054f 4903c2                         add        rax, r10
00552 c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
0055a 4903c2                         add        rax, r10
0055d 4933c0                         xor        rax, r8
00560 4933c3                         xor        rax, r11
00563 4933c1                         xor        rax, r9
00566 4881c400010000                 add        rsp, 0x100
0056d 5d                             pop        rbp
0056e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00572 0f8724070000                   ja         0x7f60b3bb421c
00578 c3                             ret        
00579 bef7ffffff                     mov        esi, 0xfffffff7
0057e 8bac24e0000000                 mov        ebp, dword ptr [rsp + 0xe0]
00585 90                             nop        
00586 90                             nop        
00587 e8d4cca9ff                     call       0x7f60b36507e0
0058c 0f1f840084060002               nop        dword ptr [rax + rax + 0x2000684]
00594 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0059e 4883e4f0                       and        rsp, 0xfffffffffffffff0
005a2 e849429d18                     call       0x7f60cc587d70
005a7 f4                             hlt        
005a8 bee7ffffff                     mov        esi, 0xffffffe7
005ad 90                             nop        
005ae 90                             nop        
005af e8accca9ff                     call       0x7f60b36507e0
005b4 0f1f8400ac060003               nop        dword ptr [rax + rax + 0x30006ac]
005bc 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
005c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ca e821429d18                     call       0x7f60cc587d70
005cf f4                             hlt        
005d0 bee6ffffff                     mov        esi, 0xffffffe6
005d5 90                             nop        
005d6 90                             nop        
005d7 e884cca9ff                     call       0x7f60b36507e0
005dc 0f1f8400d4060004               nop        dword ptr [rax + rax + 0x40006d4]
005e4 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
005ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
005f2 e8f9419d18                     call       0x7f60cc587d70
005f7 f4                             hlt        
005f8 bef7ffffff                     mov        esi, 0xfffffff7
005fd 418beb                         mov        ebp, r11d
00600 90                             nop        
00601 90                             nop        
00602 90                             nop        
00603 e858cca9ff                     call       0x7f60b36507e0
00608 0f1f840000070005               nop        dword ptr [rax + rax + 0x5000700]
00610 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0061a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0061e e8cd419d18                     call       0x7f60cc587d70
00623 f4                             hlt        
00624 bee7ffffff                     mov        esi, 0xffffffe7
00629 498bea                         mov        rbp, r10
0062c 90                             nop        
0062d 90                             nop        
0062e 90                             nop        
0062f e82ccca9ff                     call       0x7f60b36507e0
00634 0f1f84002c070006               nop        dword ptr [rax + rax + 0x600072c]
0063c 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00646 4883e4f0                       and        rsp, 0xfffffffffffffff0
0064a e8a1419d18                     call       0x7f60cc587d70
0064f f4                             hlt        
00650 bef7ffffff                     mov        esi, 0xfffffff7
00655 418beb                         mov        ebp, r11d
00658 90                             nop        
00659 90                             nop        
0065a 90                             nop        
0065b e800cca9ff                     call       0x7f60b36507e0
00660 0f1f840058070007               nop        dword ptr [rax + rax + 0x7000758]
00668 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00672 4883e4f0                       and        rsp, 0xfffffffffffffff0
00676 e875419d18                     call       0x7f60cc587d70
0067b f4                             hlt        
0067c bee7ffffff                     mov        esi, 0xffffffe7
00681 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00686 90                             nop        
00687 e8d4cba9ff                     call       0x7f60b36507e0
0068c 0f1f840084070008               nop        dword ptr [rax + rax + 0x8000784]
00694 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0069e 4883e4f0                       and        rsp, 0xfffffffffffffff0
006a2 e849419d18                     call       0x7f60cc587d70
006a7 f4                             hlt        
006a8 bee6ffffff                     mov        esi, 0xffffffe6
006ad 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
006b2 90                             nop        
006b3 e8a8cba9ff                     call       0x7f60b36507e0
006b8 0f1f8400b0070009               nop        dword ptr [rax + rax + 0x90007b0]
006c0 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
006ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
006ce e81d419d18                     call       0x7f60cc587d70
006d3 f4                             hlt        
006d4 488bee                         mov        rbp, rsi
006d7 bee6ffffff                     mov        esi, 0xffffffe6
006dc 90                             nop        
006dd 90                             nop        
006de 90                             nop        
006df e87ccba9ff                     call       0x7f60b36507e0
006e4 0f1f8400dc07000a               nop        dword ptr [rax + rax + 0xa0007dc]
006ec 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
006f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
006fa e8f1409d18                     call       0x7f60cc587d70
006ff f4                             hlt        
00700 488bee                         mov        rbp, rsi
00703 bee6ffffff                     mov        esi, 0xffffffe6
00708 90                             nop        
00709 90                             nop        
0070a 90                             nop        
0070b e850cba9ff                     call       0x7f60b36507e0
00710 0f1f84000808000b               nop        dword ptr [rax + rax + 0xb000808]
00718 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00722 4883e4f0                       and        rsp, 0xfffffffffffffff0
00726 e8c5409d18                     call       0x7f60cc587d70
0072b f4                             hlt        
0072c 488bee                         mov        rbp, rsi
0072f bee6ffffff                     mov        esi, 0xffffffe6
00734 90                             nop        
00735 90                             nop        
00736 90                             nop        
00737 e824cba9ff                     call       0x7f60b36507e0
0073c 0f1f84003408000c               nop        dword ptr [rax + rax + 0xc000834]
00744 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0074e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00752 e899409d18                     call       0x7f60cc587d70
00757 f4                             hlt        
00758 488bee                         mov        rbp, rsi
0075b bee6ffffff                     mov        esi, 0xffffffe6
00760 90                             nop        
00761 90                             nop        
00762 90                             nop        
00763 e8f8caa9ff                     call       0x7f60b36507e0
00768 0f1f84006008000d               nop        dword ptr [rax + rax + 0xd000860]
00770 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0077a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0077e e86d409d18                     call       0x7f60cc587d70
00783 f4                             hlt        
00784 488bee                         mov        rbp, rsi
00787 bee6ffffff                     mov        esi, 0xffffffe6
0078c 90                             nop        
0078d 90                             nop        
0078e 90                             nop        
0078f e8cccaa9ff                     call       0x7f60b36507e0
00794 0f1f84008c08000e               nop        dword ptr [rax + rax + 0xe00088c]
0079c 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
007a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
007aa e841409d18                     call       0x7f60cc587d70
007af f4                             hlt        
007b0 488bee                         mov        rbp, rsi
007b3 bee6ffffff                     mov        esi, 0xffffffe6
007b8 90                             nop        
007b9 90                             nop        
007ba 90                             nop        
007bb e8a0caa9ff                     call       0x7f60b36507e0
007c0 0f1f8400b808000f               nop        dword ptr [rax + rax + 0xf0008b8]
007c8 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
007d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007d6 e815409d18                     call       0x7f60cc587d70
007db f4                             hlt        
007dc 488bee                         mov        rbp, rsi
007df bee6ffffff                     mov        esi, 0xffffffe6
007e4 90                             nop        
007e5 90                             nop        
007e6 90                             nop        
007e7 e874caa9ff                     call       0x7f60b36507e0
007ec 0f1f8400e4080010               nop        dword ptr [rax + rax + 0x100008e4]
007f4 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
007fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00802 e8e93f9d18                     call       0x7f60cc587d70
00807 f4                             hlt        
00808 488bee                         mov        rbp, rsi
0080b bee6ffffff                     mov        esi, 0xffffffe6
00810 90                             nop        
00811 90                             nop        
00812 90                             nop        
00813 e848caa9ff                     call       0x7f60b36507e0
00818 0f1f840010090011               nop        dword ptr [rax + rax + 0x11000910]
00820 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0082a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0082e e8bd3f9d18                     call       0x7f60cc587d70
00833 f4                             hlt        
00834 488bee                         mov        rbp, rsi
00837 bee6ffffff                     mov        esi, 0xffffffe6
0083c 90                             nop        
0083d 90                             nop        
0083e 90                             nop        
0083f e81ccaa9ff                     call       0x7f60b36507e0
00844 0f1f84003c090012               nop        dword ptr [rax + rax + 0x1200093c]
0084c 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00856 4883e4f0                       and        rsp, 0xfffffffffffffff0
0085a e8913f9d18                     call       0x7f60cc587d70
0085f f4                             hlt        
00860 488bee                         mov        rbp, rsi
00863 bee6ffffff                     mov        esi, 0xffffffe6
00868 90                             nop        
00869 90                             nop        
0086a 90                             nop        
0086b e8f0c9a9ff                     call       0x7f60b36507e0
00870 0f1f840068090013               nop        dword ptr [rax + rax + 0x13000968]
00878 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00882 4883e4f0                       and        rsp, 0xfffffffffffffff0
00886 e8653f9d18                     call       0x7f60cc587d70
0088b f4                             hlt        
0088c 488bee                         mov        rbp, rsi
0088f bee6ffffff                     mov        esi, 0xffffffe6
00894 90                             nop        
00895 90                             nop        
00896 90                             nop        
00897 e8c4c9a9ff                     call       0x7f60b36507e0
0089c 0f1f840094090014               nop        dword ptr [rax + rax + 0x14000994]
008a4 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
008ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
008b2 e8393f9d18                     call       0x7f60cc587d70
008b7 f4                             hlt        
008b8 488bee                         mov        rbp, rsi
008bb bee6ffffff                     mov        esi, 0xffffffe6
008c0 90                             nop        
008c1 90                             nop        
008c2 90                             nop        
008c3 e898c9a9ff                     call       0x7f60b36507e0
008c8 0f1f8400c0090015               nop        dword ptr [rax + rax + 0x150009c0]
008d0 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
008da 4883e4f0                       and        rsp, 0xfffffffffffffff0
008de e80d3f9d18                     call       0x7f60cc587d70
008e3 f4                             hlt        
008e4 488bee                         mov        rbp, rsi
008e7 bee6ffffff                     mov        esi, 0xffffffe6
008ec 90                             nop        
008ed 90                             nop        
008ee 90                             nop        
008ef e86cc9a9ff                     call       0x7f60b36507e0
008f4 0f1f8400ec090016               nop        dword ptr [rax + rax + 0x160009ec]
008fc 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0090a e8e13e9d18                     call       0x7f60cc587d70
0090f f4                             hlt        
00910 488bee                         mov        rbp, rsi
00913 bee6ffffff                     mov        esi, 0xffffffe6
00918 90                             nop        
00919 90                             nop        
0091a 90                             nop        
0091b e840c9a9ff                     call       0x7f60b36507e0
00920 0f1f8400180a0017               nop        dword ptr [rax + rax + 0x17000a18]
00928 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00932 4883e4f0                       and        rsp, 0xfffffffffffffff0
00936 e8b53e9d18                     call       0x7f60cc587d70
0093b f4                             hlt        
0093c 488bee                         mov        rbp, rsi
0093f bee6ffffff                     mov        esi, 0xffffffe6
00944 90                             nop        
00945 90                             nop        
00946 90                             nop        
00947 e814c9a9ff                     call       0x7f60b36507e0
0094c 0f1f8400440a0018               nop        dword ptr [rax + rax + 0x18000a44]
00954 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0095e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00962 e8893e9d18                     call       0x7f60cc587d70
00967 f4                             hlt        
00968 488bee                         mov        rbp, rsi
0096b bee6ffffff                     mov        esi, 0xffffffe6
00970 90                             nop        
00971 90                             nop        
00972 90                             nop        
00973 e8e8c8a9ff                     call       0x7f60b36507e0
00978 0f1f8400700a0019               nop        dword ptr [rax + rax + 0x19000a70]
00980 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
0098a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0098e e85d3e9d18                     call       0x7f60cc587d70
00993 f4                             hlt        
00994 488bee                         mov        rbp, rsi
00997 bee6ffffff                     mov        esi, 0xffffffe6
0099c 90                             nop        
0099d 90                             nop        
0099e 90                             nop        
0099f e8bcc8a9ff                     call       0x7f60b36507e0
009a4 0f1f84009c0a001a               nop        dword ptr [rax + rax + 0x1a000a9c]
009ac 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
009b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
009ba e8313e9d18                     call       0x7f60cc587d70
009bf f4                             hlt        
009c0 488bee                         mov        rbp, rsi
009c3 bee6ffffff                     mov        esi, 0xffffffe6
009c8 90                             nop        
009c9 90                             nop        
009ca 90                             nop        
009cb e890c8a9ff                     call       0x7f60b36507e0
009d0 0f1f8400c80a001b               nop        dword ptr [rax + rax + 0x1b000ac8]
009d8 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
009e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
009e6 e8053e9d18                     call       0x7f60cc587d70
009eb f4                             hlt        
009ec 488bee                         mov        rbp, rsi
009ef bee6ffffff                     mov        esi, 0xffffffe6
009f4 90                             nop        
009f5 90                             nop        
009f6 90                             nop        
009f7 e864c8a9ff                     call       0x7f60b36507e0
009fc 0f1f8400f40a001c               nop        dword ptr [rax + rax + 0x1c000af4]
00a04 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00a0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a12 e8d93d9d18                     call       0x7f60cc587d70
00a17 f4                             hlt        
00a18 488bee                         mov        rbp, rsi
00a1b bee6ffffff                     mov        esi, 0xffffffe6
00a20 90                             nop        
00a21 90                             nop        
00a22 90                             nop        
00a23 e838c8a9ff                     call       0x7f60b36507e0
00a28 0f1f8400200b001d               nop        dword ptr [rax + rax + 0x1d000b20]
00a30 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00a3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a3e e8ad3d9d18                     call       0x7f60cc587d70
00a43 f4                             hlt        
00a44 488bee                         mov        rbp, rsi
00a47 bee6ffffff                     mov        esi, 0xffffffe6
00a4c 90                             nop        
00a4d 90                             nop        
00a4e 90                             nop        
00a4f e80cc8a9ff                     call       0x7f60b36507e0
00a54 0f1f84004c0b001e               nop        dword ptr [rax + rax + 0x1e000b4c]
00a5c 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00a66 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a6a e8813d9d18                     call       0x7f60cc587d70
00a6f f4                             hlt        
00a70 488bee                         mov        rbp, rsi
00a73 bee6ffffff                     mov        esi, 0xffffffe6
00a78 90                             nop        
00a79 90                             nop        
00a7a 90                             nop        
00a7b e8e0c7a9ff                     call       0x7f60b36507e0
00a80 0f1f8400780b001f               nop        dword ptr [rax + rax + 0x1f000b78]
00a88 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a96 e8553d9d18                     call       0x7f60cc587d70
00a9b f4                             hlt        
00a9c 488bee                         mov        rbp, rsi
00a9f bee6ffffff                     mov        esi, 0xffffffe6
00aa4 90                             nop        
00aa5 90                             nop        
00aa6 90                             nop        
00aa7 e8b4c7a9ff                     call       0x7f60b36507e0
00aac 0f1f8400a40b0020               nop        dword ptr [rax + rax + 0x20000ba4]
00ab4 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00abe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ac2 e8293d9d18                     call       0x7f60cc587d70
00ac7 f4                             hlt        
00ac8 488bee                         mov        rbp, rsi
00acb bee6ffffff                     mov        esi, 0xffffffe6
00ad0 90                             nop        
00ad1 90                             nop        
00ad2 90                             nop        
00ad3 e888c7a9ff                     call       0x7f60b36507e0
00ad8 0f1f8400d00b0021               nop        dword ptr [rax + rax + 0x21000bd0]
00ae0 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aee e8fd3c9d18                     call       0x7f60cc587d70
00af3 f4                             hlt        
00af4 bee6ffffff                     mov        esi, 0xffffffe6
00af9 90                             nop        
00afa 90                             nop        
00afb e860c7a9ff                     call       0x7f60b36507e0
00b00 0f1f8400f80b0022               nop        dword ptr [rax + rax + 0x22000bf8]
00b08 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b16 e8d53c9d18                     call       0x7f60cc587d70
00b1b f4                             hlt        
00b1c bee6ffffff                     mov        esi, 0xffffffe6
00b21 90                             nop        
00b22 90                             nop        
00b23 e838c7a9ff                     call       0x7f60b36507e0
00b28 0f1f8400200c0023               nop        dword ptr [rax + rax + 0x23000c20]
00b30 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00b3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b3e e8ad3c9d18                     call       0x7f60cc587d70
00b43 f4                             hlt        
00b44 bee6ffffff                     mov        esi, 0xffffffe6
00b49 90                             nop        
00b4a 90                             nop        
00b4b e810c7a9ff                     call       0x7f60b36507e0
00b50 0f1f8400480c0024               nop        dword ptr [rax + rax + 0x24000c48]
00b58 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b66 e8853c9d18                     call       0x7f60cc587d70
00b6b f4                             hlt        
00b6c 488bf0                         mov        rsi, rax
00b6f eb03                           jmp        0x7f60b3bb40f4
00b71 488bf0                         mov        rsi, rax
00b74 4881c400010000                 add        rsp, 0x100
00b7b 5d                             pop        rbp
00b7c e9df72a9ff                     jmp        0x7f60b364b3e0
00b81 bef6ffffff                     mov        esi, 0xfffffff6
00b86 90                             nop        
00b87 e8d4c6a9ff                     call       0x7f60b36507e0
00b8c 0f1f8400840c0025               nop        dword ptr [rax + rax + 0x25000c84]
00b94 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ba2 e8493c9d18                     call       0x7f60cc587d70
00ba7 f4                             hlt        
00ba8 bef6ffffff                     mov        esi, 0xfffffff6
00bad 90                             nop        
00bae 90                             nop        
00baf e8acc6a9ff                     call       0x7f60b36507e0
00bb4 0f1f8400ac0c0026               nop        dword ptr [rax + rax + 0x26000cac]
00bbc 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00bc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bca e8213c9d18                     call       0x7f60cc587d70
00bcf f4                             hlt        
00bd0 bef6ffffff                     mov        esi, 0xfffffff6
00bd5 418beb                         mov        ebp, r11d
00bd8 90                             nop        
00bd9 90                             nop        
00bda 90                             nop        
00bdb e880c6a9ff                     call       0x7f60b36507e0
00be0 0f1f8400d80c0027               nop        dword ptr [rax + rax + 0x27000cd8]
00be8 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00bf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bf6 e8f53b9d18                     call       0x7f60cc587d70
00bfb f4                             hlt        
00bfc bef6ffffff                     mov        esi, 0xfffffff6
00c01 90                             nop        
00c02 90                             nop        
00c03 e858c6a9ff                     call       0x7f60b36507e0
00c08 0f1f8400000d0028               nop        dword ptr [rax + rax + 0x28000d00]
00c10 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00c1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c1e e8cd3b9d18                     call       0x7f60cc587d70
00c23 f4                             hlt        
00c24 bef6ffffff                     mov        esi, 0xfffffff6
00c29 90                             nop        
00c2a 90                             nop        
00c2b e830c6a9ff                     call       0x7f60b36507e0
00c30 0f1f8400280d0029               nop        dword ptr [rax + rax + 0x29000d28]
00c38 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00c42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c46 e8a53b9d18                     call       0x7f60cc587d70
00c4b f4                             hlt        
00c4c bef6ffffff                     mov        esi, 0xfffffff6
00c51 90                             nop        
00c52 90                             nop        
00c53 e808c6a9ff                     call       0x7f60b36507e0
00c58 0f1f8400500d002a               nop        dword ptr [rax + rax + 0x2a000d50]
00c60 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00c6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c6e e87d3b9d18                     call       0x7f60cc587d70
00c73 f4                             hlt        
00c74 bef6ffffff                     mov        esi, 0xfffffff6
00c79 90                             nop        
00c7a 90                             nop        
00c7b e8e0c5a9ff                     call       0x7f60b36507e0
00c80 0f1f8400780d002b               nop        dword ptr [rax + rax + 0x2b000d78]
00c88 48bf90a3208c607f0000           movabs     rdi, 0x7f608c20a390
00c92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c96 e8553b9d18                     call       0x7f60cc587d70
00c9b f4                             hlt        
00c9c 49baee3abbb3607f0000           movabs     r10, 0x7f60b3bb3aee
00ca6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00cad e92e01b7ff                     jmp        0x7f60b3724360
00cb2 e829d1b5ff                     call       0x7f60b3711360
00cb7 e962f3ffff                     jmp        0x7f60b3bb359e
00cbc f4                             hlt        
00cbd f4                             hlt        
00cbe f4                             hlt        
00cbf f4                             hlt        
