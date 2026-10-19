00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f859c090000                   jne        0x7f57f3e6faba
0001e 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00023 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00028 48894c2408                     mov        qword ptr [rsp + 8], rcx
0002d 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00032 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00036 4183fb17                       cmp        r11d, 0x17
0003a 0f86b4080000                   jbe        0x7f57f3e6f9f4
00040 4c8b5608                       mov        r10, qword ptr [rsi + 8]
00044 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
00048 4c8b4618                       mov        r8, qword ptr [rsi + 0x18]
0004c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00051 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00056 4d33d3                         xor        r10, r11
00059 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0005d 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00062 4d33d0                         xor        r10, r8
00065 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00069 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0006e 4d33d3                         xor        r10, r11
00071 4c8b4630                       mov        r8, qword ptr [rsi + 0x30]
00075 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
0007a 4d33d1                         xor        r10, r9
0007d 4c8b5e38                       mov        r11, qword ptr [rsi + 0x38]
00081 4c89442450                     mov        qword ptr [rsp + 0x50], r8
00086 4d33d0                         xor        r10, r8
00089 4c8b4640                       mov        r8, qword ptr [rsi + 0x40]
0008d 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00092 4d33d3                         xor        r10, r11
00095 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0009a 4d33d0                         xor        r10, r8
0009d 4c8b5e48                       mov        r11, qword ptr [rsi + 0x48]
000a1 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
000a6 4d33d3                         xor        r10, r11
000a9 4c8b5e50                       mov        r11, qword ptr [rsi + 0x50]
000ad 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
000b2 4d33d3                         xor        r10, r11
000b5 4c8b5e58                       mov        r11, qword ptr [rsi + 0x58]
000b9 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
000be 4d33d3                         xor        r10, r11
000c1 4c8b5e60                       mov        r11, qword ptr [rsi + 0x60]
000c5 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
000cd 4d33d3                         xor        r10, r11
000d0 4c8b5e68                       mov        r11, qword ptr [rsi + 0x68]
000d4 4c899c2488000000               mov        qword ptr [rsp + 0x88], r11
000dc 4d33d3                         xor        r10, r11
000df 4c8b5e70                       mov        r11, qword ptr [rsi + 0x70]
000e3 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
000eb 4d33d3                         xor        r10, r11
000ee 4c8b5e78                       mov        r11, qword ptr [rsi + 0x78]
000f2 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
000fa 4d33d3                         xor        r10, r11
000fd 4c8b9e80000000                 mov        r11, qword ptr [rsi + 0x80]
00104 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
0010c 4d33d3                         xor        r10, r11
0010f 4c8b9e88000000                 mov        r11, qword ptr [rsi + 0x88]
00116 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
0011e 4d33d3                         xor        r10, r11
00121 4c8b9e90000000                 mov        r11, qword ptr [rsi + 0x90]
00128 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00130 4d33d3                         xor        r10, r11
00133 4c8b9e98000000                 mov        r11, qword ptr [rsi + 0x98]
0013a 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00142 4d33d3                         xor        r10, r11
00145 4c8b9ea0000000                 mov        r11, qword ptr [rsi + 0xa0]
0014c 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00154 4d33d3                         xor        r10, r11
00157 4c8b9ea8000000                 mov        r11, qword ptr [rsi + 0xa8]
0015e 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00166 4d33d3                         xor        r10, r11
00169 4c8b9eb0000000                 mov        r11, qword ptr [rsi + 0xb0]
00170 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
00178 4d33d3                         xor        r10, r11
0017b 4c8b9eb8000000                 mov        r11, qword ptr [rsi + 0xb8]
00182 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0018a 4d33d3                         xor        r10, r11
0018d 4c8b9ec0000000                 mov        r11, qword ptr [rsi + 0xc0]
00194 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0019c 4d33d3                         xor        r10, r11
0019f 458bda                         mov        r11d, r10d
001a2 4181e3ff030000                 and        r11d, 0x3ff
001a9 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
001b1 6690                           nop        
001b3 e848f5ffff                     call       0x7f57f3e6e800
001b8 0f1f8400b0020000               nop        dword ptr [rax + rax + 0x2b0]
001c0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001c5 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c9 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
001d1 453bc2                         cmp        r8d, r10d
001d4 0f83fb010000                   jae        0x7f57f3e6f4d5
001da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001df 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001e3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001e8 4f634c8208                     movsxd     r9, dword ptr [r10 + r8*4 + 8]
001ed 453bc3                         cmp        r8d, r11d
001f0 0f833e030000                   jae        0x7f57f3e6f634
001f6 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
001fb 458b5204                       mov        r10d, dword ptr [r10 + 4]
001ff 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00204 4f635c8308                     movsxd     r11, dword ptr [r11 + r8*4 + 8]
00209 4d03d9                         add        r11, r9
0020c 453bc2                         cmp        r8d, r10d
0020f 0f8377040000                   jae        0x7f57f3e6f78c
00215 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0021a 458b5204                       mov        r10d, dword ptr [r10 + 4]
0021e 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
00223 4b636c8108                     movsxd     rbp, dword ptr [r9 + r8*4 + 8]
00228 4903eb                         add        rbp, r11
0022b 453bc2                         cmp        r8d, r10d
0022e 0f83a0050000                   jae        0x7f57f3e6f8d4
00234 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00239 4b63448208                     movsxd     rax, dword ptr [r10 + r8*4 + 8]
0023e 4803c5                         add        rax, rbp
00241 c463fbf05c24303e               rorx       r11, qword ptr [rsp + 0x30], 0x3e
00249 c463fbf04424383d               rorx       r8, qword ptr [rsp + 0x38], 0x3d
00251 c463fbf04c24403c               rorx       r9, qword ptr [rsp + 0x40], 0x3c
00259 c4e3fbf04c24483b               rorx       rcx, qword ptr [rsp + 0x48], 0x3b
00261 c4e3fbf05c24503a               rorx       rbx, qword ptr [rsp + 0x50], 0x3a
00269 c4e3fbf07c245839               rorx       rdi, qword ptr [rsp + 0x58], 0x39
00271 c4e3fbf054246038               rorx       rdx, qword ptr [rsp + 0x60], 0x38
00279 c4e3fbf074246837               rorx       rsi, qword ptr [rsp + 0x68], 0x37
00281 c4e3fbf06c247036               rorx       rbp, qword ptr [rsp + 0x70], 0x36
00289 c463fbf06c247835               rorx       r13, qword ptr [rsp + 0x78], 0x35
00291 c463fbf0b4248000000034         rorx       r14, qword ptr [rsp + 0x80], 0x34
0029c c463fbf094248800000033         rorx       r10, qword ptr [rsp + 0x88], 0x33
002a7 4c891424                       mov        qword ptr [rsp], r10
002ab c463fbf094249000000032         rorx       r10, qword ptr [rsp + 0x90], 0x32
002b6 4c89542408                     mov        qword ptr [rsp + 8], r10
002bb c463fbf094249800000031         rorx       r10, qword ptr [rsp + 0x98], 0x31
002c6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
002cb c463fbf09424a000000030         rorx       r10, qword ptr [rsp + 0xa0], 0x30
002d6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
002db c463fbf09424a80000002f         rorx       r10, qword ptr [rsp + 0xa8], 0x2f
002e6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
002eb c463fbf09424b00000002e         rorx       r10, qword ptr [rsp + 0xb0], 0x2e
002f6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002fb c463fbf09424b80000002d         rorx       r10, qword ptr [rsp + 0xb8], 0x2d
00306 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0030b c463fbf09424c00000002c         rorx       r10, qword ptr [rsp + 0xc0], 0x2c
00316 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0031b c463fbf09424c80000002b         rorx       r10, qword ptr [rsp + 0xc8], 0x2b
00326 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0032b c463fbf09424d00000002a         rorx       r10, qword ptr [rsp + 0xd0], 0x2a
00336 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0033b c463fbf09424d800000029         rorx       r10, qword ptr [rsp + 0xd8], 0x29
00346 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0034b c463fbf09424e000000028         rorx       r10, qword ptr [rsp + 0xe0], 0x28
00356 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0035b c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00363 4903c2                         add        rax, r10
00366 4903c3                         add        rax, r11
00369 4903c0                         add        rax, r8
0036c 4903c1                         add        rax, r9
0036f 4803c1                         add        rax, rcx
00372 4803c3                         add        rax, rbx
00375 4803c7                         add        rax, rdi
00378 4803c2                         add        rax, rdx
0037b 4803c6                         add        rax, rsi
0037e 4803c5                         add        rax, rbp
00381 4903c5                         add        rax, r13
00384 4903c6                         add        rax, r14
00387 48030424                       add        rax, qword ptr [rsp]
0038b 4803442408                     add        rax, qword ptr [rsp + 8]
00390 4803442410                     add        rax, qword ptr [rsp + 0x10]
00395 4803442418                     add        rax, qword ptr [rsp + 0x18]
0039a 4803442420                     add        rax, qword ptr [rsp + 0x20]
0039f 4803442430                     add        rax, qword ptr [rsp + 0x30]
003a4 4803442438                     add        rax, qword ptr [rsp + 0x38]
003a9 4803442440                     add        rax, qword ptr [rsp + 0x40]
003ae 4803442448                     add        rax, qword ptr [rsp + 0x48]
003b3 4803442450                     add        rax, qword ptr [rsp + 0x50]
003b8 4803442458                     add        rax, qword ptr [rsp + 0x58]
003bd 4803442460                     add        rax, qword ptr [rsp + 0x60]
003c2 4881c400010000                 add        rsp, 0x100
003c9 5d                             pop        rbp
003ca 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
003ce 0f87d0050000                   ja         0x7f57f3e6faa4
003d4 c3                             ret        
003d5 bee4ffffff                     mov        esi, 0xffffffe4
003da 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
003df 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003e4 4c891424                       mov        qword ptr [rsp], r10
003e8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
003ed 4c89542408                     mov        qword ptr [rsp + 8], r10
003f2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
003f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
003fc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0040b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00410 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00415 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0041a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0041f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00424 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00429 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0042e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00433 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00438 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0043d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00442 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00447 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0044c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00451 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00456 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0045b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00460 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00468 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0046d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00475 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0047a 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00482 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0048a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00492 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0049a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
004a2 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
004aa 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
004b2 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
004ba 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
004c2 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
004ca 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004d2 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
004da 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004e2 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
004ea 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
004f2 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
004fa 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00502 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0050a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00512 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0051a 458bd8                         mov        r11d, r8d
0051d 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00525 6690                           nop        
00527 e83448b5ff                     call       0x7f57f39c3e60
0052c 0f1f840024060001               nop        dword ptr [rax + rax + 0x1000624]
00534 bee4ffffff                     mov        esi, 0xffffffe4
00539 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0053e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00543 4c891424                       mov        qword ptr [rsp], r10
00547 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0054c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00551 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00556 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0055b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00560 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00565 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0056a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0056f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00574 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00579 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0057e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00583 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00588 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0058d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00592 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00597 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0059c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
005a1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005a6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005ab 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005b0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
005b5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005bd 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005c2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005ca 4c89542470                     mov        qword ptr [rsp + 0x70], r10
005cf 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
005d7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
005dc 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
005e4 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
005ec 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
005f4 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
005fc 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00604 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0060c 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00614 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0061c 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00624 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0062c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00634 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0063c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00644 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0064c 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00654 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0065c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00664 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0066c 458bd8                         mov        r11d, r8d
0066f 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
00677 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0067f e8dc46b5ff                     call       0x7f57f39c3e60
00684 0f1f84007c070002               nop        dword ptr [rax + rax + 0x200077c]
0068c bee4ffffff                     mov        esi, 0xffffffe4
00691 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00696 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0069b 4c891424                       mov        qword ptr [rsp], r10
0069f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
006a4 4c89542408                     mov        qword ptr [rsp + 8], r10
006a9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006ae 4c89542410                     mov        qword ptr [rsp + 0x10], r10
006b3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
006b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006bd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006c2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
006c7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006cc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
006d1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006d6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
006db 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006e0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
006e5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
006ea 4c89542440                     mov        qword ptr [rsp + 0x40], r10
006ef 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
006f4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
006f9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
006fe 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00703 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00708 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0070d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00715 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0071a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00722 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00727 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0072f 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00734 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0073c 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00741 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00749 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00751 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00759 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00761 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00769 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00771 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00779 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00781 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00789 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00791 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00799 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
007a1 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
007a9 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
007b1 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
007b9 458bd8                         mov        r11d, r8d
007bc 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
007c4 666690                         nop        
007c7 e89445b5ff                     call       0x7f57f39c3e60
007cc 0f1f8400c4080003               nop        dword ptr [rax + rax + 0x30008c4]
007d4 bee4ffffff                     mov        esi, 0xffffffe4
007d9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007de 4c891424                       mov        qword ptr [rsp], r10
007e2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
007e7 4c89542408                     mov        qword ptr [rsp + 8], r10
007ec 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007f1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
007f6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
007fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00800 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00805 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0080a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0080f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00814 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00819 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0081e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00823 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00828 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0082d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00832 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00837 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0083c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00841 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00846 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0084b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00850 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00858 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0085d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00865 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0086a 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00872 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00877 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0087f 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00884 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0088c 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00894 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0089c 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008a4 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008ac 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008b4 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008bc 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008c4 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008cc 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
008d4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008dc 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
008e4 666690                         nop        
008e7 e87444b5ff                     call       0x7f57f39c3e60
008ec 0f1f8400e4090004               nop        dword ptr [rax + rax + 0x40009e4]
008f4 48891424                       mov        qword ptr [rsp], rdx
008f8 4c89442410                     mov        qword ptr [rsp + 0x10], r8
008fd 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00902 4889742420                     mov        qword ptr [rsp + 0x20], rsi
00907 bee4ffffff                     mov        esi, 0xffffffe4
0090c 666690                         nop        
0090f e84c44b5ff                     call       0x7f57f39c3e60
00914 0f1f84000c0a0005               nop        dword ptr [rax + rax + 0x5000a0c]
0091c 488bf0                         mov        rsi, rax
0091f 4881c400010000                 add        rsp, 0x100
00926 5d                             pop        rbp
00927 e9b45bb5ff                     jmp        0x7f57f39c55e0
0092c bef6ffffff                     mov        esi, 0xfffffff6
00931 6690                           nop        
00933 e82844b5ff                     call       0x7f57f39c3e60
00938 0f1f8400300a0006               nop        dword ptr [rax + rax + 0x6000a30]
00940 bef6ffffff                     mov        esi, 0xfffffff6
00945 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
0094c 666690                         nop        
0094f e80c44b5ff                     call       0x7f57f39c3e60
00954 0f1f84004c0a0007               nop        dword ptr [rax + rax + 0x7000a4c]
0095c bef6ffffff                     mov        esi, 0xfffffff6
00961 418be8                         mov        ebp, r8d
00964 666690                         nop        
00967 e8f443b5ff                     call       0x7f57f39c3e60
0096c 0f1f8400640a0008               nop        dword ptr [rax + rax + 0x8000a64]
00974 bef6ffffff                     mov        esi, 0xfffffff6
00979 418be8                         mov        ebp, r8d
0097c 666690                         nop        
0097f e8dc43b5ff                     call       0x7f57f39c3e60
00984 0f1f84007c0a0009               nop        dword ptr [rax + rax + 0x9000a7c]
0098c bef6ffffff                     mov        esi, 0xfffffff6
00991 418be8                         mov        ebp, r8d
00994 666690                         nop        
00997 e8c443b5ff                     call       0x7f57f39c3e60
0099c 0f1f8400940a000a               nop        dword ptr [rax + rax + 0xa000a94]
009a4 49bacaf4e6f3577f0000           movabs     r10, 0x7f57f3e6f4ca
009ae 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
009b5 e926d4a8ff                     jmp        0x7f57f38fcee0
009ba e8e19fa7ff                     call       0x7f57f38e9aa0
009bf e95af6ffff                     jmp        0x7f57f3e6f11e
009c4 f4                             hlt        
009c5 f4                             hlt        
009c6 f4                             hlt        
009c7 f4                             hlt        
