00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2004000000               cmp        dword ptr [r15 + 0x20], 4
00018 0f85840c0000                   jne        0x7f60b3bb3422
0001e 48897c2418                     mov        qword ptr [rsp + 0x18], rdi
00023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00028 4c89442408                     mov        qword ptr [rsp + 8], r8
0002d 48890c24                       mov        qword ptr [rsp], rcx
00031 488bea                         mov        rbp, rdx
00034 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00038 4585db                         test       r11d, r11d
0003b 0f862b060000                   jbe        0x7f60b3bb2dec
00041 4183fb01                       cmp        r11d, 1
00045 0f864d060000                   jbe        0x7f60b3bb2e18
0004b 4183fb02                       cmp        r11d, 2
0004f 0f866f060000                   jbe        0x7f60b3bb2e44
00055 4183fb03                       cmp        r11d, 3
00059 0f8691060000                   jbe        0x7f60b3bb2e70
0005f 4183fb04                       cmp        r11d, 4
00063 0f86b3060000                   jbe        0x7f60b3bb2e9c
00069 4183fb05                       cmp        r11d, 5
0006d 0f86d5060000                   jbe        0x7f60b3bb2ec8
00073 4183fb06                       cmp        r11d, 6
00077 0f86f7060000                   jbe        0x7f60b3bb2ef4
0007d 4183fb07                       cmp        r11d, 7
00081 0f8619070000                   jbe        0x7f60b3bb2f20
00087 4183fb08                       cmp        r11d, 8
0008b 0f863b070000                   jbe        0x7f60b3bb2f4c
00091 4183fb09                       cmp        r11d, 9
00095 0f865d070000                   jbe        0x7f60b3bb2f78
0009b 4183fb0a                       cmp        r11d, 0xa
0009f 0f867f070000                   jbe        0x7f60b3bb2fa4
000a5 4183fb0b                       cmp        r11d, 0xb
000a9 0f86a1070000                   jbe        0x7f60b3bb2fd0
000af 4183fb0c                       cmp        r11d, 0xc
000b3 0f86c3070000                   jbe        0x7f60b3bb2ffc
000b9 4183fb0d                       cmp        r11d, 0xd
000bd 0f86e5070000                   jbe        0x7f60b3bb3028
000c3 4183fb0e                       cmp        r11d, 0xe
000c7 0f8607080000                   jbe        0x7f60b3bb3054
000cd 4183fb0f                       cmp        r11d, 0xf
000d1 0f8629080000                   jbe        0x7f60b3bb3080
000d7 4183fb10                       cmp        r11d, 0x10
000db 0f864b080000                   jbe        0x7f60b3bb30ac
000e1 4183fb11                       cmp        r11d, 0x11
000e5 0f866d080000                   jbe        0x7f60b3bb30d8
000eb 4183fb12                       cmp        r11d, 0x12
000ef 0f868f080000                   jbe        0x7f60b3bb3104
000f5 4183fb13                       cmp        r11d, 0x13
000f9 0f86b1080000                   jbe        0x7f60b3bb3130
000ff 4183fb14                       cmp        r11d, 0x14
00103 0f86d3080000                   jbe        0x7f60b3bb315c
00109 4183fb15                       cmp        r11d, 0x15
0010d 0f86f5080000                   jbe        0x7f60b3bb3188
00113 4183fb16                       cmp        r11d, 0x16
00117 0f8617090000                   jbe        0x7f60b3bb31b4
0011d 4183fb17                       cmp        r11d, 0x17
00121 0f8639090000                   jbe        0x7f60b3bb31e0
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
002db e800f2b6ff                     call       0x7f60b3721c60
002e0 0f1f8400d8030000               nop        dword ptr [rax + rax + 0x3d8]
002e8 4885ed                         test       rbp, rbp
002eb 0f8478020000                   je         0x7f60b3bb2ce9
002f1 448b5504                       mov        r10d, dword ptr [rbp + 4]
002f5 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
002fd 453bda                         cmp        r11d, r10d
00300 0f8392020000                   jae        0x7f60b3bb2d18
00306 468b4c9d08                     mov        r9d, dword ptr [rbp + r11*4 + 8]
0030b 418be9                         mov        ebp, r9d
0030e 81f55a5a5a5a                   xor        ebp, 0x5a5a5a5a
00314 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00319 458b5204                       mov        r10d, dword ptr [r10 + 4]
0031d 453bda                         cmp        r11d, r10d
00320 0f839a020000                   jae        0x7f60b3bb2d40
00326 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0032b 43896c9a08                     mov        dword ptr [r10 + r11*4 + 8], ebp
00330 4c8b1424                       mov        r10, qword ptr [rsp]
00334 458b5204                       mov        r10d, dword ptr [r10 + 4]
00338 453bda                         cmp        r11d, r10d
0033b 0f83a7020000                   jae        0x7f60b3bb2d68
00341 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00346 458b5204                       mov        r10d, dword ptr [r10 + 4]
0034a 453bda                         cmp        r11d, r10d
0034d 0f83c1020000                   jae        0x7f60b3bb2d94
00353 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00358 458b5204                       mov        r10d, dword ptr [r10 + 4]
0035c 453bda                         cmp        r11d, r10d
0035f 0f83db020000                   jae        0x7f60b3bb2dc0
00365 4963e9                         movsxd     rbp, r9d
00368 be01000000                     mov        esi, 1
0036d 4c8b1424                       mov        r10, qword ptr [rsp]
00371 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
00376 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0037b 478b449808                     mov        r8d, dword ptr [r8 + r11*4 + 8]
00380 4d63d2                         movsxd     r10, r10d
00383 4d63d8                         movsxd     r11, r8d
00386 4d03d3                         add        r10, r11
00389 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0038e 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00396 478b448308                     mov        r8d, dword ptr [r11 + r8*4 + 8]
0039b 4d63d8                         movsxd     r11, r8d
0039e 4d03d3                         add        r10, r11
003a1 4903ea                         add        rbp, r10
003a4 90                             nop        
003a5 90                             nop        
003a6 90                             nop        
003a7 e834f1b6ff                     call       0x7f60b3721c60
003ac 0f1f8400a4040001               nop        dword ptr [rax + rax + 0x10004a4]
003b4 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
003bc 458b5204                       mov        r10d, dword ptr [r10 + 4]
003c0 4585d2                         test       r10d, r10d
003c3 0f86c3060000                   jbe        0x7f60b3bb320c
003c9 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003d1 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003d5 4d8b4308                       mov        r8, qword ptr [r11 + 8]
003d9 4183fa01                       cmp        r10d, 1
003dd 0f86d1060000                   jbe        0x7f60b3bb3234
003e3 4c8b9c2410010000               mov        r11, qword ptr [rsp + 0x110]
003eb 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
003ef 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
003f3 4183fa02                       cmp        r10d, 2
003f7 0f86df060000                   jbe        0x7f60b3bb325c
003fd 4c8b942410010000               mov        r10, qword ptr [rsp + 0x110]
00405 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
00409 4d8b4a08                       mov        r9, qword ptr [r10 + 8]
0040d 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00412 8b9c24e0000000                 mov        ebx, dword ptr [rsp + 0xe0]
00419 4963449a08                     movsxd     rax, dword ptr [r10 + rbx*4 + 8]
0041e 4833c5                         xor        rax, rbp
00421 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00429 4903c2                         add        rax, r10
0042c c463fbf05424303e               rorx       r10, qword ptr [rsp + 0x30], 0x3e
00434 4903c2                         add        rax, r10
00437 c463fbf05424383d               rorx       r10, qword ptr [rsp + 0x38], 0x3d
0043f 4903c2                         add        rax, r10
00442 c463fbf05424403c               rorx       r10, qword ptr [rsp + 0x40], 0x3c
0044a 4903c2                         add        rax, r10
0044d c463fbf05424483b               rorx       r10, qword ptr [rsp + 0x48], 0x3b
00455 4903c2                         add        rax, r10
00458 c463fbf05424503a               rorx       r10, qword ptr [rsp + 0x50], 0x3a
00460 4903c2                         add        rax, r10
00463 c463fbf09424d800000039         rorx       r10, qword ptr [rsp + 0xd8], 0x39
0046e 4903c2                         add        rax, r10
00471 c463fbf054245838               rorx       r10, qword ptr [rsp + 0x58], 0x38
00479 4903c2                         add        rax, r10
0047c c463fbf054246037               rorx       r10, qword ptr [rsp + 0x60], 0x37
00484 4903c2                         add        rax, r10
00487 c463fbf054246836               rorx       r10, qword ptr [rsp + 0x68], 0x36
0048f 4903c2                         add        rax, r10
00492 c463fbf054247035               rorx       r10, qword ptr [rsp + 0x70], 0x35
0049a 4903c2                         add        rax, r10
0049d c463fbf054247834               rorx       r10, qword ptr [rsp + 0x78], 0x34
004a5 4903c2                         add        rax, r10
004a8 c463fbf094248000000033         rorx       r10, qword ptr [rsp + 0x80], 0x33
004b3 4903c2                         add        rax, r10
004b6 c463fbf094248800000032         rorx       r10, qword ptr [rsp + 0x88], 0x32
004c1 4903c2                         add        rax, r10
004c4 c463fbf094249000000031         rorx       r10, qword ptr [rsp + 0x90], 0x31
004cf 4903c2                         add        rax, r10
004d2 c463fbf094249800000030         rorx       r10, qword ptr [rsp + 0x98], 0x30
004dd 4903c2                         add        rax, r10
004e0 c463fbf09424a00000002f         rorx       r10, qword ptr [rsp + 0xa0], 0x2f
004eb 4903c2                         add        rax, r10
004ee c463fbf09424a80000002e         rorx       r10, qword ptr [rsp + 0xa8], 0x2e
004f9 4903c2                         add        rax, r10
004fc c463fbf09424b00000002d         rorx       r10, qword ptr [rsp + 0xb0], 0x2d
00507 4903c2                         add        rax, r10
0050a c463fbf09424b80000002c         rorx       r10, qword ptr [rsp + 0xb8], 0x2c
00515 4903c2                         add        rax, r10
00518 c463fbf09424c00000002b         rorx       r10, qword ptr [rsp + 0xc0], 0x2b
00523 4903c2                         add        rax, r10
00526 c463fbf09424c80000002a         rorx       r10, qword ptr [rsp + 0xc8], 0x2a
00531 4903c2                         add        rax, r10
00534 c463fbf09424d000000029         rorx       r10, qword ptr [rsp + 0xd0], 0x29
0053f 4903c2                         add        rax, r10
00542 c463fbf054242028               rorx       r10, qword ptr [rsp + 0x20], 0x28
0054a 4903c2                         add        rax, r10
0054d 4933c0                         xor        rax, r8
00550 4933c3                         xor        rax, r11
00553 4933c1                         xor        rax, r9
00556 4881c400010000                 add        rsp, 0x100
0055d 5d                             pop        rbp
0055e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00562 0f8724070000                   ja         0x7f60b3bb340c
00568 c3                             ret        
00569 bef7ffffff                     mov        esi, 0xfffffff7
0056e 8bac24e0000000                 mov        ebp, dword ptr [rsp + 0xe0]
00575 90                             nop        
00576 90                             nop        
00577 e8e4daa9ff                     call       0x7f60b36507e0
0057c 0f1f840074060002               nop        dword ptr [rax + rax + 0x2000674]
00584 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0058e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00592 e859509d18                     call       0x7f60cc587d70
00597 f4                             hlt        
00598 bee7ffffff                     mov        esi, 0xffffffe7
0059d 90                             nop        
0059e 90                             nop        
0059f e8bcdaa9ff                     call       0x7f60b36507e0
005a4 0f1f84009c060003               nop        dword ptr [rax + rax + 0x300069c]
005ac 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
005b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ba e831509d18                     call       0x7f60cc587d70
005bf f4                             hlt        
005c0 bee6ffffff                     mov        esi, 0xffffffe6
005c5 90                             nop        
005c6 90                             nop        
005c7 e894daa9ff                     call       0x7f60b36507e0
005cc 0f1f8400c4060004               nop        dword ptr [rax + rax + 0x40006c4]
005d4 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
005de 4883e4f0                       and        rsp, 0xfffffffffffffff0
005e2 e809509d18                     call       0x7f60cc587d70
005e7 f4                             hlt        
005e8 bee7ffffff                     mov        esi, 0xffffffe7
005ed 488b2c24                       mov        rbp, qword ptr [rsp]
005f1 90                             nop        
005f2 90                             nop        
005f3 e868daa9ff                     call       0x7f60b36507e0
005f8 0f1f8400f0060005               nop        dword ptr [rax + rax + 0x50006f0]
00600 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0060a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0060e e8dd4f9d18                     call       0x7f60cc587d70
00613 f4                             hlt        
00614 bee7ffffff                     mov        esi, 0xffffffe7
00619 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0061e 90                             nop        
0061f e83cdaa9ff                     call       0x7f60b36507e0
00624 0f1f84001c070006               nop        dword ptr [rax + rax + 0x600071c]
0062c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00636 4883e4f0                       and        rsp, 0xfffffffffffffff0
0063a e8b14f9d18                     call       0x7f60cc587d70
0063f f4                             hlt        
00640 bee6ffffff                     mov        esi, 0xffffffe6
00645 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
0064a 90                             nop        
0064b e810daa9ff                     call       0x7f60b36507e0
00650 0f1f840048070007               nop        dword ptr [rax + rax + 0x7000748]
00658 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00662 4883e4f0                       and        rsp, 0xfffffffffffffff0
00666 e8854f9d18                     call       0x7f60cc587d70
0066b f4                             hlt        
0066c 488bee                         mov        rbp, rsi
0066f bee6ffffff                     mov        esi, 0xffffffe6
00674 90                             nop        
00675 90                             nop        
00676 90                             nop        
00677 e8e4d9a9ff                     call       0x7f60b36507e0
0067c 0f1f840074070008               nop        dword ptr [rax + rax + 0x8000774]
00684 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0068e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00692 e8594f9d18                     call       0x7f60cc587d70
00697 f4                             hlt        
00698 488bee                         mov        rbp, rsi
0069b bee6ffffff                     mov        esi, 0xffffffe6
006a0 90                             nop        
006a1 90                             nop        
006a2 90                             nop        
006a3 e8b8d9a9ff                     call       0x7f60b36507e0
006a8 0f1f8400a0070009               nop        dword ptr [rax + rax + 0x90007a0]
006b0 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
006ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
006be e82d4f9d18                     call       0x7f60cc587d70
006c3 f4                             hlt        
006c4 488bee                         mov        rbp, rsi
006c7 bee6ffffff                     mov        esi, 0xffffffe6
006cc 90                             nop        
006cd 90                             nop        
006ce 90                             nop        
006cf e88cd9a9ff                     call       0x7f60b36507e0
006d4 0f1f8400cc07000a               nop        dword ptr [rax + rax + 0xa0007cc]
006dc 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
006e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
006ea e8014f9d18                     call       0x7f60cc587d70
006ef f4                             hlt        
006f0 488bee                         mov        rbp, rsi
006f3 bee6ffffff                     mov        esi, 0xffffffe6
006f8 90                             nop        
006f9 90                             nop        
006fa 90                             nop        
006fb e860d9a9ff                     call       0x7f60b36507e0
00700 0f1f8400f807000b               nop        dword ptr [rax + rax + 0xb0007f8]
00708 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00712 4883e4f0                       and        rsp, 0xfffffffffffffff0
00716 e8d54e9d18                     call       0x7f60cc587d70
0071b f4                             hlt        
0071c 488bee                         mov        rbp, rsi
0071f bee6ffffff                     mov        esi, 0xffffffe6
00724 90                             nop        
00725 90                             nop        
00726 90                             nop        
00727 e834d9a9ff                     call       0x7f60b36507e0
0072c 0f1f84002408000c               nop        dword ptr [rax + rax + 0xc000824]
00734 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0073e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00742 e8a94e9d18                     call       0x7f60cc587d70
00747 f4                             hlt        
00748 488bee                         mov        rbp, rsi
0074b bee6ffffff                     mov        esi, 0xffffffe6
00750 90                             nop        
00751 90                             nop        
00752 90                             nop        
00753 e808d9a9ff                     call       0x7f60b36507e0
00758 0f1f84005008000d               nop        dword ptr [rax + rax + 0xd000850]
00760 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0076a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0076e e87d4e9d18                     call       0x7f60cc587d70
00773 f4                             hlt        
00774 488bee                         mov        rbp, rsi
00777 bee6ffffff                     mov        esi, 0xffffffe6
0077c 90                             nop        
0077d 90                             nop        
0077e 90                             nop        
0077f e8dcd8a9ff                     call       0x7f60b36507e0
00784 0f1f84007c08000e               nop        dword ptr [rax + rax + 0xe00087c]
0078c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0079a e8514e9d18                     call       0x7f60cc587d70
0079f f4                             hlt        
007a0 488bee                         mov        rbp, rsi
007a3 bee6ffffff                     mov        esi, 0xffffffe6
007a8 90                             nop        
007a9 90                             nop        
007aa 90                             nop        
007ab e8b0d8a9ff                     call       0x7f60b36507e0
007b0 0f1f8400a808000f               nop        dword ptr [rax + rax + 0xf0008a8]
007b8 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
007c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007c6 e8254e9d18                     call       0x7f60cc587d70
007cb f4                             hlt        
007cc 488bee                         mov        rbp, rsi
007cf bee6ffffff                     mov        esi, 0xffffffe6
007d4 90                             nop        
007d5 90                             nop        
007d6 90                             nop        
007d7 e884d8a9ff                     call       0x7f60b36507e0
007dc 0f1f8400d4080010               nop        dword ptr [rax + rax + 0x100008d4]
007e4 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
007ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
007f2 e8f94d9d18                     call       0x7f60cc587d70
007f7 f4                             hlt        
007f8 488bee                         mov        rbp, rsi
007fb bee6ffffff                     mov        esi, 0xffffffe6
00800 90                             nop        
00801 90                             nop        
00802 90                             nop        
00803 e858d8a9ff                     call       0x7f60b36507e0
00808 0f1f840000090011               nop        dword ptr [rax + rax + 0x11000900]
00810 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0081a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0081e e8cd4d9d18                     call       0x7f60cc587d70
00823 f4                             hlt        
00824 488bee                         mov        rbp, rsi
00827 bee6ffffff                     mov        esi, 0xffffffe6
0082c 90                             nop        
0082d 90                             nop        
0082e 90                             nop        
0082f e82cd8a9ff                     call       0x7f60b36507e0
00834 0f1f84002c090012               nop        dword ptr [rax + rax + 0x1200092c]
0083c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00846 4883e4f0                       and        rsp, 0xfffffffffffffff0
0084a e8a14d9d18                     call       0x7f60cc587d70
0084f f4                             hlt        
00850 488bee                         mov        rbp, rsi
00853 bee6ffffff                     mov        esi, 0xffffffe6
00858 90                             nop        
00859 90                             nop        
0085a 90                             nop        
0085b e800d8a9ff                     call       0x7f60b36507e0
00860 0f1f840058090013               nop        dword ptr [rax + rax + 0x13000958]
00868 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00872 4883e4f0                       and        rsp, 0xfffffffffffffff0
00876 e8754d9d18                     call       0x7f60cc587d70
0087b f4                             hlt        
0087c 488bee                         mov        rbp, rsi
0087f bee6ffffff                     mov        esi, 0xffffffe6
00884 90                             nop        
00885 90                             nop        
00886 90                             nop        
00887 e8d4d7a9ff                     call       0x7f60b36507e0
0088c 0f1f840084090014               nop        dword ptr [rax + rax + 0x14000984]
00894 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0089e 4883e4f0                       and        rsp, 0xfffffffffffffff0
008a2 e8494d9d18                     call       0x7f60cc587d70
008a7 f4                             hlt        
008a8 488bee                         mov        rbp, rsi
008ab bee6ffffff                     mov        esi, 0xffffffe6
008b0 90                             nop        
008b1 90                             nop        
008b2 90                             nop        
008b3 e8a8d7a9ff                     call       0x7f60b36507e0
008b8 0f1f8400b0090015               nop        dword ptr [rax + rax + 0x150009b0]
008c0 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
008ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ce e81d4d9d18                     call       0x7f60cc587d70
008d3 f4                             hlt        
008d4 488bee                         mov        rbp, rsi
008d7 bee6ffffff                     mov        esi, 0xffffffe6
008dc 90                             nop        
008dd 90                             nop        
008de 90                             nop        
008df e87cd7a9ff                     call       0x7f60b36507e0
008e4 0f1f8400dc090016               nop        dword ptr [rax + rax + 0x160009dc]
008ec 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
008f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008fa e8f14c9d18                     call       0x7f60cc587d70
008ff f4                             hlt        
00900 488bee                         mov        rbp, rsi
00903 bee6ffffff                     mov        esi, 0xffffffe6
00908 90                             nop        
00909 90                             nop        
0090a 90                             nop        
0090b e850d7a9ff                     call       0x7f60b36507e0
00910 0f1f8400080a0017               nop        dword ptr [rax + rax + 0x17000a08]
00918 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00922 4883e4f0                       and        rsp, 0xfffffffffffffff0
00926 e8c54c9d18                     call       0x7f60cc587d70
0092b f4                             hlt        
0092c 488bee                         mov        rbp, rsi
0092f bee6ffffff                     mov        esi, 0xffffffe6
00934 90                             nop        
00935 90                             nop        
00936 90                             nop        
00937 e824d7a9ff                     call       0x7f60b36507e0
0093c 0f1f8400340a0018               nop        dword ptr [rax + rax + 0x18000a34]
00944 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0094e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00952 e8994c9d18                     call       0x7f60cc587d70
00957 f4                             hlt        
00958 488bee                         mov        rbp, rsi
0095b bee6ffffff                     mov        esi, 0xffffffe6
00960 90                             nop        
00961 90                             nop        
00962 90                             nop        
00963 e8f8d6a9ff                     call       0x7f60b36507e0
00968 0f1f8400600a0019               nop        dword ptr [rax + rax + 0x19000a60]
00970 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
0097a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097e e86d4c9d18                     call       0x7f60cc587d70
00983 f4                             hlt        
00984 488bee                         mov        rbp, rsi
00987 bee6ffffff                     mov        esi, 0xffffffe6
0098c 90                             nop        
0098d 90                             nop        
0098e 90                             nop        
0098f e8ccd6a9ff                     call       0x7f60b36507e0
00994 0f1f84008c0a001a               nop        dword ptr [rax + rax + 0x1a000a8c]
0099c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
009a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
009aa e8414c9d18                     call       0x7f60cc587d70
009af f4                             hlt        
009b0 488bee                         mov        rbp, rsi
009b3 bee6ffffff                     mov        esi, 0xffffffe6
009b8 90                             nop        
009b9 90                             nop        
009ba 90                             nop        
009bb e8a0d6a9ff                     call       0x7f60b36507e0
009c0 0f1f8400b80a001b               nop        dword ptr [rax + rax + 0x1b000ab8]
009c8 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
009d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
009d6 e8154c9d18                     call       0x7f60cc587d70
009db f4                             hlt        
009dc 488bee                         mov        rbp, rsi
009df bee6ffffff                     mov        esi, 0xffffffe6
009e4 90                             nop        
009e5 90                             nop        
009e6 90                             nop        
009e7 e874d6a9ff                     call       0x7f60b36507e0
009ec 0f1f8400e40a001c               nop        dword ptr [rax + rax + 0x1c000ae4]
009f4 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
009fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a02 e8e94b9d18                     call       0x7f60cc587d70
00a07 f4                             hlt        
00a08 488bee                         mov        rbp, rsi
00a0b bee6ffffff                     mov        esi, 0xffffffe6
00a10 90                             nop        
00a11 90                             nop        
00a12 90                             nop        
00a13 e848d6a9ff                     call       0x7f60b36507e0
00a18 0f1f8400100b001d               nop        dword ptr [rax + rax + 0x1d000b10]
00a20 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a2e e8bd4b9d18                     call       0x7f60cc587d70
00a33 f4                             hlt        
00a34 488bee                         mov        rbp, rsi
00a37 bee6ffffff                     mov        esi, 0xffffffe6
00a3c 90                             nop        
00a3d 90                             nop        
00a3e 90                             nop        
00a3f e81cd6a9ff                     call       0x7f60b36507e0
00a44 0f1f84003c0b001e               nop        dword ptr [rax + rax + 0x1e000b3c]
00a4c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00a56 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a5a e8914b9d18                     call       0x7f60cc587d70
00a5f f4                             hlt        
00a60 488bee                         mov        rbp, rsi
00a63 bee6ffffff                     mov        esi, 0xffffffe6
00a68 90                             nop        
00a69 90                             nop        
00a6a 90                             nop        
00a6b e8f0d5a9ff                     call       0x7f60b36507e0
00a70 0f1f8400680b001f               nop        dword ptr [rax + rax + 0x1f000b68]
00a78 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00a82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a86 e8654b9d18                     call       0x7f60cc587d70
00a8b f4                             hlt        
00a8c bee6ffffff                     mov        esi, 0xffffffe6
00a91 90                             nop        
00a92 90                             nop        
00a93 e8c8d5a9ff                     call       0x7f60b36507e0
00a98 0f1f8400900b0020               nop        dword ptr [rax + rax + 0x20000b90]
00aa0 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00aaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aae e83d4b9d18                     call       0x7f60cc587d70
00ab3 f4                             hlt        
00ab4 bee6ffffff                     mov        esi, 0xffffffe6
00ab9 90                             nop        
00aba 90                             nop        
00abb e8a0d5a9ff                     call       0x7f60b36507e0
00ac0 0f1f8400b80b0021               nop        dword ptr [rax + rax + 0x21000bb8]
00ac8 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00ad2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ad6 e8154b9d18                     call       0x7f60cc587d70
00adb f4                             hlt        
00adc bee6ffffff                     mov        esi, 0xffffffe6
00ae1 90                             nop        
00ae2 90                             nop        
00ae3 e878d5a9ff                     call       0x7f60b36507e0
00ae8 0f1f8400e00b0022               nop        dword ptr [rax + rax + 0x22000be0]
00af0 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00afa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00afe e8ed4a9d18                     call       0x7f60cc587d70
00b03 f4                             hlt        
00b04 488bf0                         mov        rsi, rax
00b07 eb03                           jmp        0x7f60b3bb328c
00b09 488bf0                         mov        rsi, rax
00b0c 4881c400010000                 add        rsp, 0x100
00b13 5d                             pop        rbp
00b14 e94781a9ff                     jmp        0x7f60b364b3e0
00b19 bef6ffffff                     mov        esi, 0xfffffff6
00b1e 90                             nop        
00b1f e83cd5a9ff                     call       0x7f60b36507e0
00b24 0f1f84001c0c0023               nop        dword ptr [rax + rax + 0x23000c1c]
00b2c 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b3a e8b14a9d18                     call       0x7f60cc587d70
00b3f f4                             hlt        
00b40 bef6ffffff                     mov        esi, 0xfffffff6
00b45 90                             nop        
00b46 90                             nop        
00b47 e814d5a9ff                     call       0x7f60b36507e0
00b4c 0f1f8400440c0024               nop        dword ptr [rax + rax + 0x24000c44]
00b54 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b62 e8894a9d18                     call       0x7f60cc587d70
00b67 f4                             hlt        
00b68 bef6ffffff                     mov        esi, 0xfffffff6
00b6d 418beb                         mov        ebp, r11d
00b70 90                             nop        
00b71 90                             nop        
00b72 90                             nop        
00b73 e8e8d4a9ff                     call       0x7f60b36507e0
00b78 0f1f8400700c0025               nop        dword ptr [rax + rax + 0x25000c70]
00b80 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b8e e85d4a9d18                     call       0x7f60cc587d70
00b93 f4                             hlt        
00b94 bef6ffffff                     mov        esi, 0xfffffff6
00b99 418beb                         mov        ebp, r11d
00b9c 90                             nop        
00b9d 90                             nop        
00b9e 90                             nop        
00b9f e8bcd4a9ff                     call       0x7f60b36507e0
00ba4 0f1f84009c0c0026               nop        dword ptr [rax + rax + 0x26000c9c]
00bac 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00bb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bba e8314a9d18                     call       0x7f60cc587d70
00bbf f4                             hlt        
00bc0 bef6ffffff                     mov        esi, 0xfffffff6
00bc5 418beb                         mov        ebp, r11d
00bc8 90                             nop        
00bc9 90                             nop        
00bca 90                             nop        
00bcb e890d4a9ff                     call       0x7f60b36507e0
00bd0 0f1f8400c80c0027               nop        dword ptr [rax + rax + 0x27000cc8]
00bd8 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00be6 e8054a9d18                     call       0x7f60cc587d70
00beb f4                             hlt        
00bec bef6ffffff                     mov        esi, 0xfffffff6
00bf1 90                             nop        
00bf2 90                             nop        
00bf3 e868d4a9ff                     call       0x7f60b36507e0
00bf8 0f1f8400f00c0028               nop        dword ptr [rax + rax + 0x28000cf0]
00c00 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c0e e8dd499d18                     call       0x7f60cc587d70
00c13 f4                             hlt        
00c14 bef6ffffff                     mov        esi, 0xfffffff6
00c19 90                             nop        
00c1a 90                             nop        
00c1b e840d4a9ff                     call       0x7f60b36507e0
00c20 0f1f8400180d0029               nop        dword ptr [rax + rax + 0x29000d18]
00c28 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c36 e8b5499d18                     call       0x7f60cc587d70
00c3b f4                             hlt        
00c3c bef6ffffff                     mov        esi, 0xfffffff6
00c41 90                             nop        
00c42 90                             nop        
00c43 e818d4a9ff                     call       0x7f60b36507e0
00c48 0f1f8400400d002a               nop        dword ptr [rax + rax + 0x2a000d40]
00c50 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c5e e88d499d18                     call       0x7f60cc587d70
00c63 f4                             hlt        
00c64 bef6ffffff                     mov        esi, 0xfffffff6
00c69 90                             nop        
00c6a 90                             nop        
00c6b e8f0d3a9ff                     call       0x7f60b36507e0
00c70 0f1f8400680d002b               nop        dword ptr [rax + rax + 0x2b000d68]
00c78 48bf400c208c607f0000           movabs     rdi, 0x7f608c200c40
00c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c86 e865499d18                     call       0x7f60cc587d70
00c8b f4                             hlt        
00c8c 49bade2cbbb3607f0000           movabs     r10, 0x7f60b3bb2cde
00c96 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00c9d e93e0fb7ff                     jmp        0x7f60b3724360
00ca2 e839dfb5ff                     call       0x7f60b3711360
00ca7 e972f3ffff                     jmp        0x7f60b3bb279e
00cac f4                             hlt        
00cad f4                             hlt        
00cae f4                             hlt        
00caf f4                             hlt        
