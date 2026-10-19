00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f85740c0000                   jne        0x7f60b3bb1812
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5604                       mov        r10d, dword ptr [rsi + 4]
00038 4585d2                         test       r10d, r10d
0003b 0f86eb050000                   jbe        0x7f60b3bb11ac
00041 4183fa01                       cmp        r10d, 1
00045 0f860d060000                   jbe        0x7f60b3bb11d8
0004b 4183fa02                       cmp        r10d, 2
0004f 0f862f060000                   jbe        0x7f60b3bb1204
00055 4183fa03                       cmp        r10d, 3
00059 0f8651060000                   jbe        0x7f60b3bb1230
0005f 4183fa04                       cmp        r10d, 4
00063 0f8673060000                   jbe        0x7f60b3bb125c
00069 4183fa05                       cmp        r10d, 5
0006d 0f8695060000                   jbe        0x7f60b3bb1288
00073 4183fa06                       cmp        r10d, 6
00077 0f86b7060000                   jbe        0x7f60b3bb12b4
0007d 4183fa07                       cmp        r10d, 7
00081 0f86d9060000                   jbe        0x7f60b3bb12e0
00087 4183fa08                       cmp        r10d, 8
0008b 0f86fb060000                   jbe        0x7f60b3bb130c
00091 4183fa09                       cmp        r10d, 9
00095 0f861d070000                   jbe        0x7f60b3bb1338
0009b 4183fa0a                       cmp        r10d, 0xa
0009f 0f863f070000                   jbe        0x7f60b3bb1364
000a5 4183fa0b                       cmp        r10d, 0xb
000a9 0f8661070000                   jbe        0x7f60b3bb1390
000af 4183fa0c                       cmp        r10d, 0xc
000b3 0f8683070000                   jbe        0x7f60b3bb13bc
000b9 4183fa0d                       cmp        r10d, 0xd
000bd 0f86a5070000                   jbe        0x7f60b3bb13e8
000c3 4183fa0e                       cmp        r10d, 0xe
000c7 0f86c7070000                   jbe        0x7f60b3bb1414
000cd 4183fa0f                       cmp        r10d, 0xf
000d1 0f86e9070000                   jbe        0x7f60b3bb1440
000d7 4183fa10                       cmp        r10d, 0x10
000db 0f860b080000                   jbe        0x7f60b3bb146c
000e1 4183fa11                       cmp        r10d, 0x11
000e5 0f862d080000                   jbe        0x7f60b3bb1498
000eb 4183fa12                       cmp        r10d, 0x12
000ef 0f864f080000                   jbe        0x7f60b3bb14c4
000f5 4183fa13                       cmp        r10d, 0x13
000f9 0f8671080000                   jbe        0x7f60b3bb14f0
000ff 4183fa14                       cmp        r10d, 0x14
00103 0f8693080000                   jbe        0x7f60b3bb151c
00109 4183fa15                       cmp        r10d, 0x15
0010d 0f86b5080000                   jbe        0x7f60b3bb1548
00113 4183fa16                       cmp        r10d, 0x16
00117 0f86d7080000                   jbe        0x7f60b3bb1574
0011d 4183fa17                       cmp        r10d, 0x17
00121 0f86f9080000                   jbe        0x7f60b3bb15a0
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
002db e8000eb7ff                     call       0x7f60b3721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 448b5504                       mov        r10d, dword ptr [rbp + 4]
002ec 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
002f4 453bc2                         cmp        r8d, r10d
002f7 0f835c020000                   jae        0x7f60b3bb10d9
002fd 428b4c8508                     mov        ecx, dword ptr [rbp + r8*4 + 8]
00302 8be9                           mov        ebp, ecx
00304 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
0030a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0030f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00313 453bc3                         cmp        r8d, r11d
00316 0f8364020000                   jae        0x7f60b3bb1100
0031c 43896c8208                     mov        dword ptr [r10 + r8*4 + 8], ebp
00321 4c8b1424                       mov        r10, qword ptr [rsp]
00325 458b5204                       mov        r10d, dword ptr [r10 + 4]
00329 453bc2                         cmp        r8d, r10d
0032c 0f8376020000                   jae        0x7f60b3bb1128
00332 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00337 458b5204                       mov        r10d, dword ptr [r10 + 4]
0033b 453bc2                         cmp        r8d, r10d
0033e 0f8390020000                   jae        0x7f60b3bb1154
00344 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00349 458b5204                       mov        r10d, dword ptr [r10 + 4]
0034d 453bc2                         cmp        r8d, r10d
00350 0f83aa020000                   jae        0x7f60b3bb1180
00356 4863e9                         movsxd     rbp, ecx
00359 be01000000                     mov        esi, 1
0035e 4c8b1424                       mov        r10, qword ptr [rsp]
00362 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
00367 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0036c 478b448308                     mov        r8d, dword ptr [r11 + r8*4 + 8]
00371 4d63d2                         movsxd     r10, r10d
00374 4d63d8                         movsxd     r11, r8d
00377 4d03d3                         add        r10, r11
0037a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0037f 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00387 478b448308                     mov        r8d, dword ptr [r11 + r8*4 + 8]
0038c 4d63d8                         movsxd     r11, r8d
0038f 4d03d3                         add        r10, r11
00392 4903ea                         add        rbp, r10
00395 90                             nop        
00396 90                             nop        
00397 e8440db7ff                     call       0x7f60b3721c60
0039c 0f1f840094040001               nop        dword ptr [rax + rax + 0x1000494]
003a4 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003ac 458b5204                       mov        r10d, dword ptr [r10 + 4]
003b0 4585d2                         test       r10d, r10d
003b3 0f8693060000                   jbe        0x7f60b3bb15cc
003b9 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003c1 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003c5 4d8b4308                       mov        r8, qword ptr [r11 + 8]
003c9 4183fa01                       cmp        r10d, 1
003cd 0f86a1060000                   jbe        0x7f60b3bb15f4
003d3 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003db 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
003df 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
003e3 4183fa02                       cmp        r10d, 2
003e7 0f86af060000                   jbe        0x7f60b3bb161c
003ed 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003f5 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
003f9 4d8b4a08                       mov        r9, qword ptr [r10 + 8]
003fd 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00402 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
00409 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
0040e 4833c5                         xor        rax, rbp
00411 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00419 4903c2                         add        rax, r10
0041c c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
00424 4903c2                         add        rax, r10
00427 c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
0042f 4903c2                         add        rax, r10
00432 c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
0043a 4903c2                         add        rax, r10
0043d c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
00445 4903c2                         add        rax, r10
00448 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
00450 4903c2                         add        rax, r10
00453 c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
0045e 4903c2                         add        rax, r10
00461 c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00469 4903c2                         add        rax, r10
0046c c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
00474 4903c2                         add        rax, r10
00477 c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
0047f 4903c2                         add        rax, r10
00482 c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
0048a 4903c2                         add        rax, r10
0048d c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
00495 4903c2                         add        rax, r10
00498 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
004a3 4903c2                         add        rax, r10
004a6 c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
004b1 4903c2                         add        rax, r10
004b4 c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004bf 4903c2                         add        rax, r10
004c2 c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004cd 4903c2                         add        rax, r10
004d0 c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004db 4903c2                         add        rax, r10
004de c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
004e9 4903c2                         add        rax, r10
004ec c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
004f7 4903c2                         add        rax, r10
004fa c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
00505 4903c2                         add        rax, r10
00508 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
00513 4903c2                         add        rax, r10
00516 c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
00521 4903c2                         add        rax, r10
00524 c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
0052f 4903c2                         add        rax, r10
00532 c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
0053a 4903c2                         add        rax, r10
0053d 4933c0                         xor        rax, r8
00540 4933c3                         xor        rax, r11
00543 4933c1                         xor        rax, r9
00546 4881c400010000                 add        rsp, 0x100
0054d 5d                             pop        rbp
0054e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00552 0f8724070000                   ja         0x7f60b3bb17fc
00558 c3                             ret        
00559 bee7ffffff                     mov        esi, 0xffffffe7
0055e 90                             nop        
0055f e8fcf6a9ff                     call       0x7f60b36507e0
00564 0f1f84005c060002               nop        dword ptr [rax + rax + 0x200065c]
0056c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00576 4883e4f0                       and        rsp, 0xfffffffffffffff0
0057a e8716c9d18                     call       0x7f60cc587d70
0057f f4                             hlt        
00580 bee6ffffff                     mov        esi, 0xffffffe6
00585 90                             nop        
00586 90                             nop        
00587 e8d4f6a9ff                     call       0x7f60b36507e0
0058c 0f1f840084060003               nop        dword ptr [rax + rax + 0x3000684]
00594 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0059e 4883e4f0                       and        rsp, 0xfffffffffffffff0
005a2 e8496c9d18                     call       0x7f60cc587d70
005a7 f4                             hlt        
005a8 bee6ffffff                     mov        esi, 0xffffffe6
005ad 488b2c24                       mov        rbp, qword ptr [rsp]
005b1 90                             nop        
005b2 90                             nop        
005b3 e8a8f6a9ff                     call       0x7f60b36507e0
005b8 0f1f8400b0060004               nop        dword ptr [rax + rax + 0x40006b0]
005c0 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
005ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ce e81d6c9d18                     call       0x7f60cc587d70
005d3 f4                             hlt        
005d4 bee6ffffff                     mov        esi, 0xffffffe6
005d9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
005de 90                             nop        
005df e87cf6a9ff                     call       0x7f60b36507e0
005e4 0f1f8400dc060005               nop        dword ptr [rax + rax + 0x50006dc]
005ec 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
005f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005fa e8f16b9d18                     call       0x7f60cc587d70
005ff f4                             hlt        
00600 bee6ffffff                     mov        esi, 0xffffffe6
00605 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
0060a 90                             nop        
0060b e850f6a9ff                     call       0x7f60b36507e0
00610 0f1f840008070006               nop        dword ptr [rax + rax + 0x6000708]
00618 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00622 4883e4f0                       and        rsp, 0xfffffffffffffff0
00626 e8c56b9d18                     call       0x7f60cc587d70
0062b f4                             hlt        
0062c 488bee                         mov        rbp, rsi
0062f bee6ffffff                     mov        esi, 0xffffffe6
00634 90                             nop        
00635 90                             nop        
00636 90                             nop        
00637 e824f6a9ff                     call       0x7f60b36507e0
0063c 0f1f840034070007               nop        dword ptr [rax + rax + 0x7000734]
00644 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0064e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00652 e8996b9d18                     call       0x7f60cc587d70
00657 f4                             hlt        
00658 488bee                         mov        rbp, rsi
0065b bee6ffffff                     mov        esi, 0xffffffe6
00660 90                             nop        
00661 90                             nop        
00662 90                             nop        
00663 e8f8f5a9ff                     call       0x7f60b36507e0
00668 0f1f840060070008               nop        dword ptr [rax + rax + 0x8000760]
00670 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0067a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0067e e86d6b9d18                     call       0x7f60cc587d70
00683 f4                             hlt        
00684 488bee                         mov        rbp, rsi
00687 bee6ffffff                     mov        esi, 0xffffffe6
0068c 90                             nop        
0068d 90                             nop        
0068e 90                             nop        
0068f e8ccf5a9ff                     call       0x7f60b36507e0
00694 0f1f84008c070009               nop        dword ptr [rax + rax + 0x900078c]
0069c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
006a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
006aa e8416b9d18                     call       0x7f60cc587d70
006af f4                             hlt        
006b0 488bee                         mov        rbp, rsi
006b3 bee6ffffff                     mov        esi, 0xffffffe6
006b8 90                             nop        
006b9 90                             nop        
006ba 90                             nop        
006bb e8a0f5a9ff                     call       0x7f60b36507e0
006c0 0f1f8400b807000a               nop        dword ptr [rax + rax + 0xa0007b8]
006c8 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
006d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
006d6 e8156b9d18                     call       0x7f60cc587d70
006db f4                             hlt        
006dc 488bee                         mov        rbp, rsi
006df bee6ffffff                     mov        esi, 0xffffffe6
006e4 90                             nop        
006e5 90                             nop        
006e6 90                             nop        
006e7 e874f5a9ff                     call       0x7f60b36507e0
006ec 0f1f8400e407000b               nop        dword ptr [rax + rax + 0xb0007e4]
006f4 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
006fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00702 e8e96a9d18                     call       0x7f60cc587d70
00707 f4                             hlt        
00708 488bee                         mov        rbp, rsi
0070b bee6ffffff                     mov        esi, 0xffffffe6
00710 90                             nop        
00711 90                             nop        
00712 90                             nop        
00713 e848f5a9ff                     call       0x7f60b36507e0
00718 0f1f84001008000c               nop        dword ptr [rax + rax + 0xc000810]
00720 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0072a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0072e e8bd6a9d18                     call       0x7f60cc587d70
00733 f4                             hlt        
00734 488bee                         mov        rbp, rsi
00737 bee6ffffff                     mov        esi, 0xffffffe6
0073c 90                             nop        
0073d 90                             nop        
0073e 90                             nop        
0073f e81cf5a9ff                     call       0x7f60b36507e0
00744 0f1f84003c08000d               nop        dword ptr [rax + rax + 0xd00083c]
0074c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00756 4883e4f0                       and        rsp, 0xfffffffffffffff0
0075a e8916a9d18                     call       0x7f60cc587d70
0075f f4                             hlt        
00760 488bee                         mov        rbp, rsi
00763 bee6ffffff                     mov        esi, 0xffffffe6
00768 90                             nop        
00769 90                             nop        
0076a 90                             nop        
0076b e8f0f4a9ff                     call       0x7f60b36507e0
00770 0f1f84006808000e               nop        dword ptr [rax + rax + 0xe000868]
00778 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00782 4883e4f0                       and        rsp, 0xfffffffffffffff0
00786 e8656a9d18                     call       0x7f60cc587d70
0078b f4                             hlt        
0078c 488bee                         mov        rbp, rsi
0078f bee6ffffff                     mov        esi, 0xffffffe6
00794 90                             nop        
00795 90                             nop        
00796 90                             nop        
00797 e8c4f4a9ff                     call       0x7f60b36507e0
0079c 0f1f84009408000f               nop        dword ptr [rax + rax + 0xf000894]
007a4 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
007ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
007b2 e8396a9d18                     call       0x7f60cc587d70
007b7 f4                             hlt        
007b8 488bee                         mov        rbp, rsi
007bb bee6ffffff                     mov        esi, 0xffffffe6
007c0 90                             nop        
007c1 90                             nop        
007c2 90                             nop        
007c3 e898f4a9ff                     call       0x7f60b36507e0
007c8 0f1f8400c0080010               nop        dword ptr [rax + rax + 0x100008c0]
007d0 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
007da 4883e4f0                       and        rsp, 0xfffffffffffffff0
007de e80d6a9d18                     call       0x7f60cc587d70
007e3 f4                             hlt        
007e4 488bee                         mov        rbp, rsi
007e7 bee6ffffff                     mov        esi, 0xffffffe6
007ec 90                             nop        
007ed 90                             nop        
007ee 90                             nop        
007ef e86cf4a9ff                     call       0x7f60b36507e0
007f4 0f1f8400ec080011               nop        dword ptr [rax + rax + 0x110008ec]
007fc 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00806 4883e4f0                       and        rsp, 0xfffffffffffffff0
0080a e8e1699d18                     call       0x7f60cc587d70
0080f f4                             hlt        
00810 488bee                         mov        rbp, rsi
00813 bee6ffffff                     mov        esi, 0xffffffe6
00818 90                             nop        
00819 90                             nop        
0081a 90                             nop        
0081b e840f4a9ff                     call       0x7f60b36507e0
00820 0f1f840018090012               nop        dword ptr [rax + rax + 0x12000918]
00828 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00832 4883e4f0                       and        rsp, 0xfffffffffffffff0
00836 e8b5699d18                     call       0x7f60cc587d70
0083b f4                             hlt        
0083c 488bee                         mov        rbp, rsi
0083f bee6ffffff                     mov        esi, 0xffffffe6
00844 90                             nop        
00845 90                             nop        
00846 90                             nop        
00847 e814f4a9ff                     call       0x7f60b36507e0
0084c 0f1f840044090013               nop        dword ptr [rax + rax + 0x13000944]
00854 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0085e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00862 e889699d18                     call       0x7f60cc587d70
00867 f4                             hlt        
00868 488bee                         mov        rbp, rsi
0086b bee6ffffff                     mov        esi, 0xffffffe6
00870 90                             nop        
00871 90                             nop        
00872 90                             nop        
00873 e8e8f3a9ff                     call       0x7f60b36507e0
00878 0f1f840070090014               nop        dword ptr [rax + rax + 0x14000970]
00880 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0088a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0088e e85d699d18                     call       0x7f60cc587d70
00893 f4                             hlt        
00894 488bee                         mov        rbp, rsi
00897 bee6ffffff                     mov        esi, 0xffffffe6
0089c 90                             nop        
0089d 90                             nop        
0089e 90                             nop        
0089f e8bcf3a9ff                     call       0x7f60b36507e0
008a4 0f1f84009c090015               nop        dword ptr [rax + rax + 0x1500099c]
008ac 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
008b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ba e831699d18                     call       0x7f60cc587d70
008bf f4                             hlt        
008c0 488bee                         mov        rbp, rsi
008c3 bee6ffffff                     mov        esi, 0xffffffe6
008c8 90                             nop        
008c9 90                             nop        
008ca 90                             nop        
008cb e890f3a9ff                     call       0x7f60b36507e0
008d0 0f1f8400c8090016               nop        dword ptr [rax + rax + 0x160009c8]
008d8 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
008e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008e6 e805699d18                     call       0x7f60cc587d70
008eb f4                             hlt        
008ec 488bee                         mov        rbp, rsi
008ef bee6ffffff                     mov        esi, 0xffffffe6
008f4 90                             nop        
008f5 90                             nop        
008f6 90                             nop        
008f7 e864f3a9ff                     call       0x7f60b36507e0
008fc 0f1f8400f4090017               nop        dword ptr [rax + rax + 0x170009f4]
00904 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0090e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00912 e8d9689d18                     call       0x7f60cc587d70
00917 f4                             hlt        
00918 488bee                         mov        rbp, rsi
0091b bee6ffffff                     mov        esi, 0xffffffe6
00920 90                             nop        
00921 90                             nop        
00922 90                             nop        
00923 e838f3a9ff                     call       0x7f60b36507e0
00928 0f1f8400200a0018               nop        dword ptr [rax + rax + 0x18000a20]
00930 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
0093a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0093e e8ad689d18                     call       0x7f60cc587d70
00943 f4                             hlt        
00944 488bee                         mov        rbp, rsi
00947 bee6ffffff                     mov        esi, 0xffffffe6
0094c 90                             nop        
0094d 90                             nop        
0094e 90                             nop        
0094f e80cf3a9ff                     call       0x7f60b36507e0
00954 0f1f84004c0a0019               nop        dword ptr [rax + rax + 0x19000a4c]
0095c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00966 4883e4f0                       and        rsp, 0xfffffffffffffff0
0096a e881689d18                     call       0x7f60cc587d70
0096f f4                             hlt        
00970 488bee                         mov        rbp, rsi
00973 bee6ffffff                     mov        esi, 0xffffffe6
00978 90                             nop        
00979 90                             nop        
0097a 90                             nop        
0097b e8e0f2a9ff                     call       0x7f60b36507e0
00980 0f1f8400780a001a               nop        dword ptr [rax + rax + 0x1a000a78]
00988 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00992 4883e4f0                       and        rsp, 0xfffffffffffffff0
00996 e855689d18                     call       0x7f60cc587d70
0099b f4                             hlt        
0099c 488bee                         mov        rbp, rsi
0099f bee6ffffff                     mov        esi, 0xffffffe6
009a4 90                             nop        
009a5 90                             nop        
009a6 90                             nop        
009a7 e8b4f2a9ff                     call       0x7f60b36507e0
009ac 0f1f8400a40a001b               nop        dword ptr [rax + rax + 0x1b000aa4]
009b4 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
009be 4883e4f0                       and        rsp, 0xfffffffffffffff0
009c2 e829689d18                     call       0x7f60cc587d70
009c7 f4                             hlt        
009c8 488bee                         mov        rbp, rsi
009cb bee6ffffff                     mov        esi, 0xffffffe6
009d0 90                             nop        
009d1 90                             nop        
009d2 90                             nop        
009d3 e888f2a9ff                     call       0x7f60b36507e0
009d8 0f1f8400d00a001c               nop        dword ptr [rax + rax + 0x1c000ad0]
009e0 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
009ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
009ee e8fd679d18                     call       0x7f60cc587d70
009f3 f4                             hlt        
009f4 488bee                         mov        rbp, rsi
009f7 bee6ffffff                     mov        esi, 0xffffffe6
009fc 90                             nop        
009fd 90                             nop        
009fe 90                             nop        
009ff e85cf2a9ff                     call       0x7f60b36507e0
00a04 0f1f8400fc0a001d               nop        dword ptr [rax + rax + 0x1d000afc]
00a0c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a1a e8d1679d18                     call       0x7f60cc587d70
00a1f f4                             hlt        
00a20 488bee                         mov        rbp, rsi
00a23 bee6ffffff                     mov        esi, 0xffffffe6
00a28 90                             nop        
00a29 90                             nop        
00a2a 90                             nop        
00a2b e830f2a9ff                     call       0x7f60b36507e0
00a30 0f1f8400280b001e               nop        dword ptr [rax + rax + 0x1e000b28]
00a38 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00a42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a46 e8a5679d18                     call       0x7f60cc587d70
00a4b f4                             hlt        
00a4c bee6ffffff                     mov        esi, 0xffffffe6
00a51 90                             nop        
00a52 90                             nop        
00a53 e808f2a9ff                     call       0x7f60b36507e0
00a58 0f1f8400500b001f               nop        dword ptr [rax + rax + 0x1f000b50]
00a60 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00a6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a6e e87d679d18                     call       0x7f60cc587d70
00a73 f4                             hlt        
00a74 bee6ffffff                     mov        esi, 0xffffffe6
00a79 90                             nop        
00a7a 90                             nop        
00a7b e8e0f1a9ff                     call       0x7f60b36507e0
00a80 0f1f8400780b0020               nop        dword ptr [rax + rax + 0x20000b78]
00a88 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a96 e855679d18                     call       0x7f60cc587d70
00a9b f4                             hlt        
00a9c bee6ffffff                     mov        esi, 0xffffffe6
00aa1 90                             nop        
00aa2 90                             nop        
00aa3 e8b8f1a9ff                     call       0x7f60b36507e0
00aa8 0f1f8400a00b0021               nop        dword ptr [rax + rax + 0x21000ba0]
00ab0 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00aba 4883e4f0                       and        rsp, 0xfffffffffffffff0
00abe e82d679d18                     call       0x7f60cc587d70
00ac3 f4                             hlt        
00ac4 488bf0                         mov        rsi, rax
00ac7 eb03                           jmp        0x7f60b3bb164c
00ac9 488bf0                         mov        rsi, rax
00acc 4881c400010000                 add        rsp, 0x100
00ad3 5d                             pop        rbp
00ad4 e9879da9ff                     jmp        0x7f60b364b3e0
00ad9 bef6ffffff                     mov        esi, 0xfffffff6
00ade 90                             nop        
00adf e87cf1a9ff                     call       0x7f60b36507e0
00ae4 0f1f8400dc0b0022               nop        dword ptr [rax + rax + 0x22000bdc]
00aec 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00af6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00afa e8f1669d18                     call       0x7f60cc587d70
00aff f4                             hlt        
00b00 bef6ffffff                     mov        esi, 0xfffffff6
00b05 8bac24e0000000                 mov        ebp, dword ptr [rsp + 0xe0]
00b0c 90                             nop        
00b0d 90                             nop        
00b0e 90                             nop        
00b0f e84cf1a9ff                     call       0x7f60b36507e0
00b14 0f1f84000c0c0023               nop        dword ptr [rax + rax + 0x23000c0c]
00b1c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b2a e8c1669d18                     call       0x7f60cc587d70
00b2f f4                             hlt        
00b30 bef6ffffff                     mov        esi, 0xfffffff6
00b35 90                             nop        
00b36 90                             nop        
00b37 e824f1a9ff                     call       0x7f60b36507e0
00b3c 0f1f8400340c0024               nop        dword ptr [rax + rax + 0x24000c34]
00b44 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00b4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b52 e899669d18                     call       0x7f60cc587d70
00b57 f4                             hlt        
00b58 bef6ffffff                     mov        esi, 0xfffffff6
00b5d 418be8                         mov        ebp, r8d
00b60 90                             nop        
00b61 90                             nop        
00b62 90                             nop        
00b63 e8f8f0a9ff                     call       0x7f60b36507e0
00b68 0f1f8400600c0025               nop        dword ptr [rax + rax + 0x25000c60]
00b70 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00b7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b7e e86d669d18                     call       0x7f60cc587d70
00b83 f4                             hlt        
00b84 bef6ffffff                     mov        esi, 0xfffffff6
00b89 418be8                         mov        ebp, r8d
00b8c 90                             nop        
00b8d 90                             nop        
00b8e 90                             nop        
00b8f e8ccf0a9ff                     call       0x7f60b36507e0
00b94 0f1f84008c0c0026               nop        dword ptr [rax + rax + 0x26000c8c]
00b9c 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00baa e841669d18                     call       0x7f60cc587d70
00baf f4                             hlt        
00bb0 bef6ffffff                     mov        esi, 0xfffffff6
00bb5 418be8                         mov        ebp, r8d
00bb8 90                             nop        
00bb9 90                             nop        
00bba 90                             nop        
00bbb e8a0f0a9ff                     call       0x7f60b36507e0
00bc0 0f1f8400b80c0027               nop        dword ptr [rax + rax + 0x27000cb8]
00bc8 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd6 e815669d18                     call       0x7f60cc587d70
00bdb f4                             hlt        
00bdc bef6ffffff                     mov        esi, 0xfffffff6
00be1 90                             nop        
00be2 90                             nop        
00be3 e878f0a9ff                     call       0x7f60b36507e0
00be8 0f1f8400e00c0028               nop        dword ptr [rax + rax + 0x28000ce0]
00bf0 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00bfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bfe e8ed659d18                     call       0x7f60cc587d70
00c03 f4                             hlt        
00c04 bef6ffffff                     mov        esi, 0xfffffff6
00c09 90                             nop        
00c0a 90                             nop        
00c0b e850f0a9ff                     call       0x7f60b36507e0
00c10 0f1f8400080d0029               nop        dword ptr [rax + rax + 0x29000d08]
00c18 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00c22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c26 e8c5659d18                     call       0x7f60cc587d70
00c2b f4                             hlt        
00c2c bef6ffffff                     mov        esi, 0xfffffff6
00c31 90                             nop        
00c32 90                             nop        
00c33 e828f0a9ff                     call       0x7f60b36507e0
00c38 0f1f8400300d002a               nop        dword ptr [rax + rax + 0x2a000d30]
00c40 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00c4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c4e e89d659d18                     call       0x7f60cc587d70
00c53 f4                             hlt        
00c54 bef6ffffff                     mov        esi, 0xfffffff6
00c59 90                             nop        
00c5a 90                             nop        
00c5b e800f0a9ff                     call       0x7f60b36507e0
00c60 0f1f8400580d002b               nop        dword ptr [rax + rax + 0x2b000d58]
00c68 48bfb0c40e8c607f0000           movabs     rdi, 0x7f608c0ec4b0
00c72 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c76 e875659d18                     call       0x7f60cc587d70
00c7b f4                             hlt        
00c7c 49bace10bbb3607f0000           movabs     r10, 0x7f60b3bb10ce
00c86 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00c8d e94e2bb7ff                     jmp        0x7f60b3724360
00c92 e849fbb5ff                     call       0x7f60b3711360
00c97 e982f3ffff                     jmp        0x7f60b3bb0b9e
00c9c f4                             hlt        
00c9d f4                             hlt        
00c9e f4                             hlt        
00c9f f4                             hlt        
