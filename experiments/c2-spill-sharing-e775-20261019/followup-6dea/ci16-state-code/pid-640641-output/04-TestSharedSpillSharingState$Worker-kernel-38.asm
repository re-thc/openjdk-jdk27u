00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f854c0c0000                   jne        0x7f2cebbb046a
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00038 4585db                         test       r11d, r11d
0003b 0f86d7050000                   jbe        0x7f2cebbafe18
00041 4183fb01                       cmp        r11d, 1
00045 0f86f9050000                   jbe        0x7f2cebbafe44
0004b 4183fb02                       cmp        r11d, 2
0004f 0f861b060000                   jbe        0x7f2cebbafe70
00055 4183fb03                       cmp        r11d, 3
00059 0f863d060000                   jbe        0x7f2cebbafe9c
0005f 4183fb04                       cmp        r11d, 4
00063 0f865f060000                   jbe        0x7f2cebbafec8
00069 4183fb05                       cmp        r11d, 5
0006d 0f8681060000                   jbe        0x7f2cebbafef4
00073 4183fb06                       cmp        r11d, 6
00077 0f86a3060000                   jbe        0x7f2cebbaff20
0007d 4183fb07                       cmp        r11d, 7
00081 0f86c5060000                   jbe        0x7f2cebbaff4c
00087 4183fb08                       cmp        r11d, 8
0008b 0f86e7060000                   jbe        0x7f2cebbaff78
00091 4183fb09                       cmp        r11d, 9
00095 0f8609070000                   jbe        0x7f2cebbaffa4
0009b 4183fb0a                       cmp        r11d, 0xa
0009f 0f862b070000                   jbe        0x7f2cebbaffd0
000a5 4183fb0b                       cmp        r11d, 0xb
000a9 0f864d070000                   jbe        0x7f2cebbafffc
000af 4183fb0c                       cmp        r11d, 0xc
000b3 0f866f070000                   jbe        0x7f2cebbb0028
000b9 4183fb0d                       cmp        r11d, 0xd
000bd 0f8691070000                   jbe        0x7f2cebbb0054
000c3 4183fb0e                       cmp        r11d, 0xe
000c7 0f86b3070000                   jbe        0x7f2cebbb0080
000cd 4183fb0f                       cmp        r11d, 0xf
000d1 0f86d5070000                   jbe        0x7f2cebbb00ac
000d7 4183fb10                       cmp        r11d, 0x10
000db 0f86f7070000                   jbe        0x7f2cebbb00d8
000e1 4183fb11                       cmp        r11d, 0x11
000e5 0f8619080000                   jbe        0x7f2cebbb0104
000eb 4183fb12                       cmp        r11d, 0x12
000ef 0f863b080000                   jbe        0x7f2cebbb0130
000f5 4183fb13                       cmp        r11d, 0x13
000f9 0f865d080000                   jbe        0x7f2cebbb015c
000ff 4183fb14                       cmp        r11d, 0x14
00103 0f867f080000                   jbe        0x7f2cebbb0188
00109 4183fb15                       cmp        r11d, 0x15
0010d 0f86a1080000                   jbe        0x7f2cebbb01b4
00113 4183fb16                       cmp        r11d, 0x16
00117 0f86c3080000                   jbe        0x7f2cebbb01e0
0011d 4183fb17                       cmp        r11d, 0x17
00121 0f86e5080000                   jbe        0x7f2cebbb020c
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
002db e88021b7ff                     call       0x7f2ceb721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 448b5504                       mov        r10d, dword ptr [rbp + 4]
002ec 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
002f4 453bda                         cmp        r11d, r10d
002f7 0f8348020000                   jae        0x7f2cebbafd45
002fd 428b4c9d08                     mov        ecx, dword ptr [rbp + r11*4 + 8]
00302 8be9                           mov        ebp, ecx
00304 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
0030a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0030f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00313 453bda                         cmp        r11d, r10d
00316 0f8350020000                   jae        0x7f2cebbafd6c
0031c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00321 43896c9a08                     mov        dword ptr [r10 + r11*4 + 8], ebp
00326 4c8b1424                       mov        r10, qword ptr [rsp]
0032a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0032e 453bd8                         cmp        r11d, r8d
00331 0f835d020000                   jae        0x7f2cebbafd94
00337 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0033c 458b4204                       mov        r8d, dword ptr [r10 + 4]
00340 453bd8                         cmp        r11d, r8d
00343 0f8377020000                   jae        0x7f2cebbafdc0
00349 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0034e 458b4204                       mov        r8d, dword ptr [r10 + 4]
00352 453bd8                         cmp        r11d, r8d
00355 0f8391020000                   jae        0x7f2cebbafdec
0035b 4863e9                         movsxd     rbp, ecx
0035e be01000000                     mov        esi, 1
00363 4c8b1424                       mov        r10, qword ptr [rsp]
00367 478b449a08                     mov        r8d, dword ptr [r10 + r11*4 + 8]
0036c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00371 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
00376 4d63d8                         movsxd     r11, r8d
00379 4d63d2                         movsxd     r10, r10d
0037c 4d03da                         add        r11, r10
0037f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00384 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
0038c 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
00391 4d63d2                         movsxd     r10, r10d
00394 4d03da                         add        r11, r10
00397 4903eb                         add        rbp, r11
0039a 90                             nop        
0039b e8c020b7ff                     call       0x7f2ceb721c60
003a0 0f1f840098040001               nop        dword ptr [rax + rax + 0x1000498]
003a8 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003b0 458b5a04                       mov        r11d, dword ptr [r10 + 4]
003b4 4585db                         test       r11d, r11d
003b7 0f867b060000                   jbe        0x7f2cebbb0238
003bd 458b4208                       mov        r8d, dword ptr [r10 + 8]
003c1 4d8b4808                       mov        r9, qword ptr [r8 + 8]
003c5 4183fb01                       cmp        r11d, 1
003c9 0f8691060000                   jbe        0x7f2cebbb0260
003cf 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
003d3 4d8b4008                       mov        r8, qword ptr [r8 + 8]
003d7 4183fb02                       cmp        r11d, 2
003db 0f86a7060000                   jbe        0x7f2cebbb0288
003e1 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
003e5 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
003e9 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003ee 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
003f5 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
003fa 4833c5                         xor        rax, rbp
003fd c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00405 4903c2                         add        rax, r10
00408 c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
00410 4903c2                         add        rax, r10
00413 c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
0041b 4903c2                         add        rax, r10
0041e c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
00426 4903c2                         add        rax, r10
00429 c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
00431 4903c2                         add        rax, r10
00434 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
0043c 4903c2                         add        rax, r10
0043f c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
0044a 4903c2                         add        rax, r10
0044d c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00455 4903c2                         add        rax, r10
00458 c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
00460 4903c2                         add        rax, r10
00463 c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
0046b 4903c2                         add        rax, r10
0046e c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
00476 4903c2                         add        rax, r10
00479 c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
00481 4903c2                         add        rax, r10
00484 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
0048f 4903c2                         add        rax, r10
00492 c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
0049d 4903c2                         add        rax, r10
004a0 c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004ab 4903c2                         add        rax, r10
004ae c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004b9 4903c2                         add        rax, r10
004bc c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004c7 4903c2                         add        rax, r10
004ca c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
004d5 4903c2                         add        rax, r10
004d8 c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
004e3 4903c2                         add        rax, r10
004e6 c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
004f1 4903c2                         add        rax, r10
004f4 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
004ff 4903c2                         add        rax, r10
00502 c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
0050d 4903c2                         add        rax, r10
00510 c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
0051b 4903c2                         add        rax, r10
0051e c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
00526 4903c2                         add        rax, r10
00529 4933c1                         xor        rax, r9
0052c 4933c0                         xor        rax, r8
0052f 4933c3                         xor        rax, r11
00532 4881c400010000                 add        rsp, 0x100
00539 5d                             pop        rbp
0053a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0053e 0f8710070000                   ja         0x7f2cebbb0454
00544 c3                             ret        
00545 bee7ffffff                     mov        esi, 0xffffffe7
0054a 90                             nop        
0054b e8900aaaff                     call       0x7f2ceb6507e0
00550 0f1f840048060002               nop        dword ptr [rax + rax + 0x2000648]
00558 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00562 4883e4f0                       and        rsp, 0xfffffffffffffff0
00566 e805408b17                     call       0x7f2d03463d70
0056b f4                             hlt        
0056c bee6ffffff                     mov        esi, 0xffffffe6
00571 90                             nop        
00572 90                             nop        
00573 e8680aaaff                     call       0x7f2ceb6507e0
00578 0f1f840070060003               nop        dword ptr [rax + rax + 0x3000670]
00580 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0058a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0058e e8dd3f8b17                     call       0x7f2d03463d70
00593 f4                             hlt        
00594 bee6ffffff                     mov        esi, 0xffffffe6
00599 498bea                         mov        rbp, r10
0059c 90                             nop        
0059d 90                             nop        
0059e 90                             nop        
0059f e83c0aaaff                     call       0x7f2ceb6507e0
005a4 0f1f84009c060004               nop        dword ptr [rax + rax + 0x400069c]
005ac 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
005b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ba e8b13f8b17                     call       0x7f2d03463d70
005bf f4                             hlt        
005c0 bee6ffffff                     mov        esi, 0xffffffe6
005c5 498bea                         mov        rbp, r10
005c8 90                             nop        
005c9 90                             nop        
005ca 90                             nop        
005cb e8100aaaff                     call       0x7f2ceb6507e0
005d0 0f1f8400c8060005               nop        dword ptr [rax + rax + 0x50006c8]
005d8 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
005e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
005e6 e8853f8b17                     call       0x7f2d03463d70
005eb f4                             hlt        
005ec bee6ffffff                     mov        esi, 0xffffffe6
005f1 498bea                         mov        rbp, r10
005f4 90                             nop        
005f5 90                             nop        
005f6 90                             nop        
005f7 e8e409aaff                     call       0x7f2ceb6507e0
005fc 0f1f8400f4060006               nop        dword ptr [rax + rax + 0x60006f4]
00604 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0060e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00612 e8593f8b17                     call       0x7f2d03463d70
00617 f4                             hlt        
00618 488bee                         mov        rbp, rsi
0061b bee6ffffff                     mov        esi, 0xffffffe6
00620 90                             nop        
00621 90                             nop        
00622 90                             nop        
00623 e8b809aaff                     call       0x7f2ceb6507e0
00628 0f1f840020070007               nop        dword ptr [rax + rax + 0x7000720]
00630 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0063a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0063e e82d3f8b17                     call       0x7f2d03463d70
00643 f4                             hlt        
00644 488bee                         mov        rbp, rsi
00647 bee6ffffff                     mov        esi, 0xffffffe6
0064c 90                             nop        
0064d 90                             nop        
0064e 90                             nop        
0064f e88c09aaff                     call       0x7f2ceb6507e0
00654 0f1f84004c070008               nop        dword ptr [rax + rax + 0x800074c]
0065c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00666 4883e4f0                       and        rsp, 0xfffffffffffffff0
0066a e8013f8b17                     call       0x7f2d03463d70
0066f f4                             hlt        
00670 488bee                         mov        rbp, rsi
00673 bee6ffffff                     mov        esi, 0xffffffe6
00678 90                             nop        
00679 90                             nop        
0067a 90                             nop        
0067b e86009aaff                     call       0x7f2ceb6507e0
00680 0f1f840078070009               nop        dword ptr [rax + rax + 0x9000778]
00688 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00692 4883e4f0                       and        rsp, 0xfffffffffffffff0
00696 e8d53e8b17                     call       0x7f2d03463d70
0069b f4                             hlt        
0069c 488bee                         mov        rbp, rsi
0069f bee6ffffff                     mov        esi, 0xffffffe6
006a4 90                             nop        
006a5 90                             nop        
006a6 90                             nop        
006a7 e83409aaff                     call       0x7f2ceb6507e0
006ac 0f1f8400a407000a               nop        dword ptr [rax + rax + 0xa0007a4]
006b4 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
006be 4883e4f0                       and        rsp, 0xfffffffffffffff0
006c2 e8a93e8b17                     call       0x7f2d03463d70
006c7 f4                             hlt        
006c8 488bee                         mov        rbp, rsi
006cb bee6ffffff                     mov        esi, 0xffffffe6
006d0 90                             nop        
006d1 90                             nop        
006d2 90                             nop        
006d3 e80809aaff                     call       0x7f2ceb6507e0
006d8 0f1f8400d007000b               nop        dword ptr [rax + rax + 0xb0007d0]
006e0 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
006ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
006ee e87d3e8b17                     call       0x7f2d03463d70
006f3 f4                             hlt        
006f4 488bee                         mov        rbp, rsi
006f7 bee6ffffff                     mov        esi, 0xffffffe6
006fc 90                             nop        
006fd 90                             nop        
006fe 90                             nop        
006ff e8dc08aaff                     call       0x7f2ceb6507e0
00704 0f1f8400fc07000c               nop        dword ptr [rax + rax + 0xc0007fc]
0070c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00716 4883e4f0                       and        rsp, 0xfffffffffffffff0
0071a e8513e8b17                     call       0x7f2d03463d70
0071f f4                             hlt        
00720 488bee                         mov        rbp, rsi
00723 bee6ffffff                     mov        esi, 0xffffffe6
00728 90                             nop        
00729 90                             nop        
0072a 90                             nop        
0072b e8b008aaff                     call       0x7f2ceb6507e0
00730 0f1f84002808000d               nop        dword ptr [rax + rax + 0xd000828]
00738 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00742 4883e4f0                       and        rsp, 0xfffffffffffffff0
00746 e8253e8b17                     call       0x7f2d03463d70
0074b f4                             hlt        
0074c 488bee                         mov        rbp, rsi
0074f bee6ffffff                     mov        esi, 0xffffffe6
00754 90                             nop        
00755 90                             nop        
00756 90                             nop        
00757 e88408aaff                     call       0x7f2ceb6507e0
0075c 0f1f84005408000e               nop        dword ptr [rax + rax + 0xe000854]
00764 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0076e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00772 e8f93d8b17                     call       0x7f2d03463d70
00777 f4                             hlt        
00778 488bee                         mov        rbp, rsi
0077b bee6ffffff                     mov        esi, 0xffffffe6
00780 90                             nop        
00781 90                             nop        
00782 90                             nop        
00783 e85808aaff                     call       0x7f2ceb6507e0
00788 0f1f84008008000f               nop        dword ptr [rax + rax + 0xf000880]
00790 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0079a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0079e e8cd3d8b17                     call       0x7f2d03463d70
007a3 f4                             hlt        
007a4 488bee                         mov        rbp, rsi
007a7 bee6ffffff                     mov        esi, 0xffffffe6
007ac 90                             nop        
007ad 90                             nop        
007ae 90                             nop        
007af e82c08aaff                     call       0x7f2ceb6507e0
007b4 0f1f8400ac080010               nop        dword ptr [rax + rax + 0x100008ac]
007bc 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
007c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ca e8a13d8b17                     call       0x7f2d03463d70
007cf f4                             hlt        
007d0 488bee                         mov        rbp, rsi
007d3 bee6ffffff                     mov        esi, 0xffffffe6
007d8 90                             nop        
007d9 90                             nop        
007da 90                             nop        
007db e80008aaff                     call       0x7f2ceb6507e0
007e0 0f1f8400d8080011               nop        dword ptr [rax + rax + 0x110008d8]
007e8 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
007f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007f6 e8753d8b17                     call       0x7f2d03463d70
007fb f4                             hlt        
007fc 488bee                         mov        rbp, rsi
007ff bee6ffffff                     mov        esi, 0xffffffe6
00804 90                             nop        
00805 90                             nop        
00806 90                             nop        
00807 e8d407aaff                     call       0x7f2ceb6507e0
0080c 0f1f840004090012               nop        dword ptr [rax + rax + 0x12000904]
00814 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0081e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00822 e8493d8b17                     call       0x7f2d03463d70
00827 f4                             hlt        
00828 488bee                         mov        rbp, rsi
0082b bee6ffffff                     mov        esi, 0xffffffe6
00830 90                             nop        
00831 90                             nop        
00832 90                             nop        
00833 e8a807aaff                     call       0x7f2ceb6507e0
00838 0f1f840030090013               nop        dword ptr [rax + rax + 0x13000930]
00840 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0084a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0084e e81d3d8b17                     call       0x7f2d03463d70
00853 f4                             hlt        
00854 488bee                         mov        rbp, rsi
00857 bee6ffffff                     mov        esi, 0xffffffe6
0085c 90                             nop        
0085d 90                             nop        
0085e 90                             nop        
0085f e87c07aaff                     call       0x7f2ceb6507e0
00864 0f1f84005c090014               nop        dword ptr [rax + rax + 0x1400095c]
0086c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00876 4883e4f0                       and        rsp, 0xfffffffffffffff0
0087a e8f13c8b17                     call       0x7f2d03463d70
0087f f4                             hlt        
00880 488bee                         mov        rbp, rsi
00883 bee6ffffff                     mov        esi, 0xffffffe6
00888 90                             nop        
00889 90                             nop        
0088a 90                             nop        
0088b e85007aaff                     call       0x7f2ceb6507e0
00890 0f1f840088090015               nop        dword ptr [rax + rax + 0x15000988]
00898 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
008a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008a6 e8c53c8b17                     call       0x7f2d03463d70
008ab f4                             hlt        
008ac 488bee                         mov        rbp, rsi
008af bee6ffffff                     mov        esi, 0xffffffe6
008b4 90                             nop        
008b5 90                             nop        
008b6 90                             nop        
008b7 e82407aaff                     call       0x7f2ceb6507e0
008bc 0f1f8400b4090016               nop        dword ptr [rax + rax + 0x160009b4]
008c4 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
008ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
008d2 e8993c8b17                     call       0x7f2d03463d70
008d7 f4                             hlt        
008d8 488bee                         mov        rbp, rsi
008db bee6ffffff                     mov        esi, 0xffffffe6
008e0 90                             nop        
008e1 90                             nop        
008e2 90                             nop        
008e3 e8f806aaff                     call       0x7f2ceb6507e0
008e8 0f1f8400e0090017               nop        dword ptr [rax + rax + 0x170009e0]
008f0 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
008fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
008fe e86d3c8b17                     call       0x7f2d03463d70
00903 f4                             hlt        
00904 488bee                         mov        rbp, rsi
00907 bee6ffffff                     mov        esi, 0xffffffe6
0090c 90                             nop        
0090d 90                             nop        
0090e 90                             nop        
0090f e8cc06aaff                     call       0x7f2ceb6507e0
00914 0f1f84000c0a0018               nop        dword ptr [rax + rax + 0x18000a0c]
0091c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0092a e8413c8b17                     call       0x7f2d03463d70
0092f f4                             hlt        
00930 488bee                         mov        rbp, rsi
00933 bee6ffffff                     mov        esi, 0xffffffe6
00938 90                             nop        
00939 90                             nop        
0093a 90                             nop        
0093b e8a006aaff                     call       0x7f2ceb6507e0
00940 0f1f8400380a0019               nop        dword ptr [rax + rax + 0x19000a38]
00948 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00952 4883e4f0                       and        rsp, 0xfffffffffffffff0
00956 e8153c8b17                     call       0x7f2d03463d70
0095b f4                             hlt        
0095c 488bee                         mov        rbp, rsi
0095f bee6ffffff                     mov        esi, 0xffffffe6
00964 90                             nop        
00965 90                             nop        
00966 90                             nop        
00967 e87406aaff                     call       0x7f2ceb6507e0
0096c 0f1f8400640a001a               nop        dword ptr [rax + rax + 0x1a000a64]
00974 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
0097e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00982 e8e93b8b17                     call       0x7f2d03463d70
00987 f4                             hlt        
00988 488bee                         mov        rbp, rsi
0098b bee6ffffff                     mov        esi, 0xffffffe6
00990 90                             nop        
00991 90                             nop        
00992 90                             nop        
00993 e84806aaff                     call       0x7f2ceb6507e0
00998 0f1f8400900a001b               nop        dword ptr [rax + rax + 0x1b000a90]
009a0 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
009aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
009ae e8bd3b8b17                     call       0x7f2d03463d70
009b3 f4                             hlt        
009b4 488bee                         mov        rbp, rsi
009b7 bee6ffffff                     mov        esi, 0xffffffe6
009bc 90                             nop        
009bd 90                             nop        
009be 90                             nop        
009bf e81c06aaff                     call       0x7f2ceb6507e0
009c4 0f1f8400bc0a001c               nop        dword ptr [rax + rax + 0x1c000abc]
009cc 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
009d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
009da e8913b8b17                     call       0x7f2d03463d70
009df f4                             hlt        
009e0 488bee                         mov        rbp, rsi
009e3 bee6ffffff                     mov        esi, 0xffffffe6
009e8 90                             nop        
009e9 90                             nop        
009ea 90                             nop        
009eb e8f005aaff                     call       0x7f2ceb6507e0
009f0 0f1f8400e80a001d               nop        dword ptr [rax + rax + 0x1d000ae8]
009f8 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a06 e8653b8b17                     call       0x7f2d03463d70
00a0b f4                             hlt        
00a0c 488bee                         mov        rbp, rsi
00a0f bee6ffffff                     mov        esi, 0xffffffe6
00a14 90                             nop        
00a15 90                             nop        
00a16 90                             nop        
00a17 e8c405aaff                     call       0x7f2ceb6507e0
00a1c 0f1f8400140b001e               nop        dword ptr [rax + rax + 0x1e000b14]
00a24 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00a2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a32 e8393b8b17                     call       0x7f2d03463d70
00a37 f4                             hlt        
00a38 bee6ffffff                     mov        esi, 0xffffffe6
00a3d 90                             nop        
00a3e 90                             nop        
00a3f e89c05aaff                     call       0x7f2ceb6507e0
00a44 0f1f84003c0b001f               nop        dword ptr [rax + rax + 0x1f000b3c]
00a4c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00a56 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a5a e8113b8b17                     call       0x7f2d03463d70
00a5f f4                             hlt        
00a60 bee6ffffff                     mov        esi, 0xffffffe6
00a65 90                             nop        
00a66 90                             nop        
00a67 e87405aaff                     call       0x7f2ceb6507e0
00a6c 0f1f8400640b0020               nop        dword ptr [rax + rax + 0x20000b64]
00a74 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00a7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a82 e8e93a8b17                     call       0x7f2d03463d70
00a87 f4                             hlt        
00a88 bee6ffffff                     mov        esi, 0xffffffe6
00a8d 90                             nop        
00a8e 90                             nop        
00a8f e84c05aaff                     call       0x7f2ceb6507e0
00a94 0f1f84008c0b0021               nop        dword ptr [rax + rax + 0x21000b8c]
00a9c 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00aa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aaa e8c13a8b17                     call       0x7f2d03463d70
00aaf f4                             hlt        
00ab0 488bf0                         mov        rsi, rax
00ab3 eb03                           jmp        0x7f2cebbb02b8
00ab5 488bf0                         mov        rsi, rax
00ab8 4881c400010000                 add        rsp, 0x100
00abf 5d                             pop        rbp
00ac0 e91b8ca9ff                     jmp        0x7f2ceb648ee0
00ac5 bef6ffffff                     mov        esi, 0xfffffff6
00aca 90                             nop        
00acb e81005aaff                     call       0x7f2ceb6507e0
00ad0 0f1f8400c80b0022               nop        dword ptr [rax + rax + 0x22000bc8]
00ad8 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00ae2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ae6 e8853a8b17                     call       0x7f2d03463d70
00aeb f4                             hlt        
00aec bef6ffffff                     mov        esi, 0xfffffff6
00af1 90                             nop        
00af2 90                             nop        
00af3 e8e804aaff                     call       0x7f2ceb6507e0
00af8 0f1f8400f00b0023               nop        dword ptr [rax + rax + 0x23000bf0]
00b00 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b0e e85d3a8b17                     call       0x7f2d03463d70
00b13 f4                             hlt        
00b14 bef6ffffff                     mov        esi, 0xfffffff6
00b19 90                             nop        
00b1a 90                             nop        
00b1b e8c004aaff                     call       0x7f2ceb6507e0
00b20 0f1f8400180c0024               nop        dword ptr [rax + rax + 0x24000c18]
00b28 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00b32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b36 e8353a8b17                     call       0x7f2d03463d70
00b3b f4                             hlt        
00b3c bef6ffffff                     mov        esi, 0xfffffff6
00b41 90                             nop        
00b42 90                             nop        
00b43 e89804aaff                     call       0x7f2ceb6507e0
00b48 0f1f8400400c0025               nop        dword ptr [rax + rax + 0x25000c40]
00b50 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b5e e80d3a8b17                     call       0x7f2d03463d70
00b63 f4                             hlt        
00b64 bef6ffffff                     mov        esi, 0xfffffff6
00b69 90                             nop        
00b6a 90                             nop        
00b6b e87004aaff                     call       0x7f2ceb6507e0
00b70 0f1f8400680c0026               nop        dword ptr [rax + rax + 0x26000c68]
00b78 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b86 e8e5398b17                     call       0x7f2d03463d70
00b8b f4                             hlt        
00b8c bef6ffffff                     mov        esi, 0xfffffff6
00b91 90                             nop        
00b92 90                             nop        
00b93 e84804aaff                     call       0x7f2ceb6507e0
00b98 0f1f8400900c0027               nop        dword ptr [rax + rax + 0x27000c90]
00ba0 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bae e8bd398b17                     call       0x7f2d03463d70
00bb3 f4                             hlt        
00bb4 bef6ffffff                     mov        esi, 0xfffffff6
00bb9 90                             nop        
00bba 90                             nop        
00bbb e82004aaff                     call       0x7f2ceb6507e0
00bc0 0f1f8400b80c0028               nop        dword ptr [rax + rax + 0x28000cb8]
00bc8 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd6 e895398b17                     call       0x7f2d03463d70
00bdb f4                             hlt        
00bdc bef6ffffff                     mov        esi, 0xfffffff6
00be1 90                             nop        
00be2 90                             nop        
00be3 e8f803aaff                     call       0x7f2ceb6507e0
00be8 0f1f8400e00c0029               nop        dword ptr [rax + rax + 0x29000ce0]
00bf0 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00bfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfe e86d398b17                     call       0x7f2d03463d70
00c03 f4                             hlt        
00c04 bef6ffffff                     mov        esi, 0xfffffff6
00c09 90                             nop        
00c0a 90                             nop        
00c0b e8d003aaff                     call       0x7f2ceb6507e0
00c10 0f1f8400080d002a               nop        dword ptr [rax + rax + 0x2a000d08]
00c18 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00c22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c26 e845398b17                     call       0x7f2d03463d70
00c2b f4                             hlt        
00c2c bef6ffffff                     mov        esi, 0xfffffff6
00c31 90                             nop        
00c32 90                             nop        
00c33 e8a803aaff                     call       0x7f2ceb6507e0
00c38 0f1f8400300d002b               nop        dword ptr [rax + rax + 0x2b000d30]
00c40 48bf30480ec42c7f0000           movabs     rdi, 0x7f2cc40e4830
00c4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c4e e81d398b17                     call       0x7f2d03463d70
00c53 f4                             hlt        
00c54 49ba3afdbaeb2c7f0000           movabs     r10, 0x7f2cebbafd3a
00c5e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00c65 e9f63eb7ff                     jmp        0x7f2ceb724360
00c6a e8f10eb6ff                     call       0x7f2ceb711360
00c6f e9aaf3ffff                     jmp        0x7f2cebbaf81e
00c74 f4                             hlt        
00c75 f4                             hlt        
00c76 f4                             hlt        
00c77 f4                             hlt        
