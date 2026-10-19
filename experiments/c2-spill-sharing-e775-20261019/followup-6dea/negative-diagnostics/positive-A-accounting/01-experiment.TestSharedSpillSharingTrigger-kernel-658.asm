00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85d0090000                   jne        0x7fa913e6efee
0001e 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00023 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00028 48894c2408                     mov        qword ptr [rsp + 8], rcx
0002d 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00032 448b5604                       mov        r10d, dword ptr [rsi + 4]
00036 4183fa17                       cmp        r10d, 0x17
0003a 0f86dc080000                   jbe        0x7fa913e6ef1c
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
0019f 458bd2                         mov        r10d, r10d
001a2 4181e2ff030000                 and        r10d, 0x3ff
001a9 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
001b1 6690                           nop        
001b3 e8c8d95af8                     call       0x7fa90c41c180
001b8 0f1f8400b0020000               nop        dword ptr [rax + rax + 0x2b0]
001c0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001c5 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c9 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
001d1 453bc2                         cmp        r8d, r10d
001d4 0f8316020000                   jae        0x7fa913e6e9f0
001da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001df 458b4204                       mov        r8d, dword ptr [r10 + 4]
001e3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
001e8 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
001f0 4f634c9308                     movsxd     r9, dword ptr [r11 + r10*4 + 8]
001f5 453bd0                         cmp        r10d, r8d
001f8 0f8352030000                   jae        0x7fa913e6eb50
001fe 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00203 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00207 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0020c 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00214 4b635c9308                     movsxd     rbx, dword ptr [r11 + r10*4 + 8]
00219 4903d9                         add        rbx, r9
0021c 443bd1                         cmp        r10d, ecx
0021f 0f838b040000                   jae        0x7fa913e6ecb0
00225 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0022a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0022e 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00233 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
0023b 4b636c9a08                     movsxd     rbp, dword ptr [r10 + r11*4 + 8]
00240 4803eb                         add        rbp, rbx
00243 458bd3                         mov        r10d, r11d
00246 453bd0                         cmp        r10d, r8d
00249 0f83ad050000                   jae        0x7fa913e6edfc
0024f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00254 4b63449a08                     movsxd     rax, dword ptr [r10 + r11*4 + 8]
00259 4803c5                         add        rax, rbp
0025c c463fbf05c24303e               rorx       r11, qword ptr [rsp + 0x30], 0x3e
00264 c463fbf04424383d               rorx       r8, qword ptr [rsp + 0x38], 0x3d
0026c c463fbf04c24403c               rorx       r9, qword ptr [rsp + 0x40], 0x3c
00274 c4e3fbf04c24483b               rorx       rcx, qword ptr [rsp + 0x48], 0x3b
0027c c4e3fbf05c24503a               rorx       rbx, qword ptr [rsp + 0x50], 0x3a
00284 c4e3fbf07c245839               rorx       rdi, qword ptr [rsp + 0x58], 0x39
0028c c4e3fbf054246038               rorx       rdx, qword ptr [rsp + 0x60], 0x38
00294 c4e3fbf074246837               rorx       rsi, qword ptr [rsp + 0x68], 0x37
0029c c4e3fbf06c247036               rorx       rbp, qword ptr [rsp + 0x70], 0x36
002a4 c463fbf06c247835               rorx       r13, qword ptr [rsp + 0x78], 0x35
002ac c463fbf0b4248000000034         rorx       r14, qword ptr [rsp + 0x80], 0x34
002b7 c463fbf094248800000033         rorx       r10, qword ptr [rsp + 0x88], 0x33
002c2 4c891424                       mov        qword ptr [rsp], r10
002c6 c463fbf094249000000032         rorx       r10, qword ptr [rsp + 0x90], 0x32
002d1 4c89542408                     mov        qword ptr [rsp + 8], r10
002d6 c463fbf094249800000031         rorx       r10, qword ptr [rsp + 0x98], 0x31
002e1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
002e6 c463fbf09424a000000030         rorx       r10, qword ptr [rsp + 0xa0], 0x30
002f1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
002f6 c463fbf09424a80000002f         rorx       r10, qword ptr [rsp + 0xa8], 0x2f
00301 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00306 c463fbf09424b00000002e         rorx       r10, qword ptr [rsp + 0xb0], 0x2e
00311 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00316 c463fbf09424b80000002d         rorx       r10, qword ptr [rsp + 0xb8], 0x2d
00321 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00326 c463fbf09424c00000002c         rorx       r10, qword ptr [rsp + 0xc0], 0x2c
00331 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00336 c463fbf09424c80000002b         rorx       r10, qword ptr [rsp + 0xc8], 0x2b
00341 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00346 c463fbf09424d00000002a         rorx       r10, qword ptr [rsp + 0xd0], 0x2a
00351 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00356 c463fbf09424d800000029         rorx       r10, qword ptr [rsp + 0xd8], 0x29
00361 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00366 c463fbf09424e000000028         rorx       r10, qword ptr [rsp + 0xe0], 0x28
00371 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00376 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
0037e 4903c2                         add        rax, r10
00381 4903c3                         add        rax, r11
00384 4903c0                         add        rax, r8
00387 4903c1                         add        rax, r9
0038a 4803c1                         add        rax, rcx
0038d 4803c3                         add        rax, rbx
00390 4803c7                         add        rax, rdi
00393 4803c2                         add        rax, rdx
00396 4803c6                         add        rax, rsi
00399 4803c5                         add        rax, rbp
0039c 4903c5                         add        rax, r13
0039f 4903c6                         add        rax, r14
003a2 48030424                       add        rax, qword ptr [rsp]
003a6 4803442408                     add        rax, qword ptr [rsp + 8]
003ab 4803442410                     add        rax, qword ptr [rsp + 0x10]
003b0 4803442418                     add        rax, qword ptr [rsp + 0x18]
003b5 4803442420                     add        rax, qword ptr [rsp + 0x20]
003ba 4803442430                     add        rax, qword ptr [rsp + 0x30]
003bf 4803442438                     add        rax, qword ptr [rsp + 0x38]
003c4 4803442440                     add        rax, qword ptr [rsp + 0x40]
003c9 4803442448                     add        rax, qword ptr [rsp + 0x48]
003ce 4803442450                     add        rax, qword ptr [rsp + 0x50]
003d3 4803442458                     add        rax, qword ptr [rsp + 0x58]
003d8 4803442460                     add        rax, qword ptr [rsp + 0x60]
003dd 4881c400010000                 add        rsp, 0x100
003e4 5d                             pop        rbp
003e5 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
003e9 0f87e9050000                   ja         0x7fa913e6efd8
003ef c3                             ret        
003f0 bee4ffffff                     mov        esi, 0xffffffe4
003f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
003fa 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003ff 4c891424                       mov        qword ptr [rsp], r10
00403 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00408 4c89542408                     mov        qword ptr [rsp + 8], r10
0040d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00412 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00417 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0041c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00421 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00426 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0042b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00430 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00435 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0043a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0043f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00444 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00449 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0044e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00453 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00458 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0045d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00462 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00467 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0046c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00471 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00476 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0047b 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00483 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00488 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00490 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00495 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0049d 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
004a5 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
004ad 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
004b5 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
004bd 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
004c5 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
004cd 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
004d5 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
004dd 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
004e5 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004ed 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
004f5 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004fd 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00505 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0050d 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00515 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0051d 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00525 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0052d 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00535 458bd0                         mov        r10d, r8d
00538 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00540 666690                         nop        
00543 e89859b5ff                     call       0x7fa9139c44e0
00548 0f1f840040060001               nop        dword ptr [rax + rax + 0x1000640]
00550 bee4ffffff                     mov        esi, 0xffffffe4
00555 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0055a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0055f 4c891424                       mov        qword ptr [rsp], r10
00563 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00568 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0056d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00572 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00577 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0057c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00581 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00586 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0058b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00590 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00595 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0059a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0059f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
005a4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
005a9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
005ae 4c89542448                     mov        qword ptr [rsp + 0x48], r10
005b3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
005b8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
005bd 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005c2 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005c7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005cc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
005d1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005d9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005de 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005e6 4c89542470                     mov        qword ptr [rsp + 0x70], r10
005eb 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
005f3 4c89542478                     mov        qword ptr [rsp + 0x78], r10
005f8 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00600 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00608 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00610 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00618 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00620 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00628 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00630 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00638 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00640 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00648 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00650 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00658 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00660 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00668 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00670 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00678 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00680 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00688 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00690 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
00698 458bd3                         mov        r10d, r11d
0069b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
006a3 e83858b5ff                     call       0x7fa9139c44e0
006a8 0f1f8400a0070002               nop        dword ptr [rax + rax + 0x20007a0]
006b0 bee4ffffff                     mov        esi, 0xffffffe4
006b5 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
006ba 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
006bf 4c891424                       mov        qword ptr [rsp], r10
006c3 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
006c8 4c89542408                     mov        qword ptr [rsp + 8], r10
006cd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006d2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
006d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
006dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006e6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
006eb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006f0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
006f5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006fa 4c89542430                     mov        qword ptr [rsp + 0x30], r10
006ff 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00704 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00709 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0070e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00713 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00718 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0071d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00722 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00727 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0072c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00731 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00739 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0073e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00746 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0074b 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00753 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00758 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00760 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00765 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0076d 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00775 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0077d 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00785 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0078d 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00795 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0079d 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
007a5 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007ad 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
007b5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
007bd 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
007c5 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
007cd 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
007d5 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
007dd 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
007e5 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
007ed 6690                           nop        
007ef e8ec56b5ff                     call       0x7fa9139c44e0
007f4 0f1f8400ec080003               nop        dword ptr [rax + rax + 0x30008ec]
007fc bee4ffffff                     mov        esi, 0xffffffe4
00801 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00806 4c891424                       mov        qword ptr [rsp], r10
0080a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0080f 4c89542408                     mov        qword ptr [rsp + 8], r10
00814 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00819 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0081e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00823 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00828 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0082d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00832 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00837 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0083c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00841 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00846 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0084b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00850 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00855 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0085a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0085f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00864 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00869 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0086e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00873 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00878 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00880 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00885 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0088d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00892 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0089a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0089f 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
008a7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
008ac 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
008b4 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
008bc 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
008c4 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008cc 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008d4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008dc 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008e4 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008ec 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008f4 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
008fc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00904 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0090c 666690                         nop        
0090f e8cc55b5ff                     call       0x7fa9139c44e0
00914 0f1f84000c0a0004               nop        dword ptr [rax + rax + 0x4000a0c]
0091c 48891424                       mov        qword ptr [rsp], rdx
00920 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00925 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0092a 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0092f bee4ffffff                     mov        esi, 0xffffffe4
00934 666690                         nop        
00937 e8a455b5ff                     call       0x7fa9139c44e0
0093c 0f1f8400340a0005               nop        dword ptr [rax + rax + 0x5000a34]
00944 488bf0                         mov        rsi, rax
00947 4881c400010000                 add        rsp, 0x100
0094e 5d                             pop        rbp
0094f e90c74b5ff                     jmp        0x7fa9139c6360
00954 bef6ffffff                     mov        esi, 0xfffffff6
00959 6690                           nop        
0095b e88055b5ff                     call       0x7fa9139c44e0
00960 0f1f8400580a0006               nop        dword ptr [rax + rax + 0x6000a58]
00968 bef6ffffff                     mov        esi, 0xfffffff6
0096d 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00974 666690                         nop        
00977 e86455b5ff                     call       0x7fa9139c44e0
0097c 0f1f8400740a0007               nop        dword ptr [rax + rax + 0x7000a74]
00984 bef6ffffff                     mov        esi, 0xfffffff6
00989 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00990 666690                         nop        
00993 e84855b5ff                     call       0x7fa9139c44e0
00998 0f1f8400900a0008               nop        dword ptr [rax + rax + 0x8000a90]
009a0 bef6ffffff                     mov        esi, 0xfffffff6
009a5 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
009ac 666690                         nop        
009af e82c55b5ff                     call       0x7fa9139c44e0
009b4 0f1f8400ac0a0009               nop        dword ptr [rax + rax + 0x9000aac]
009bc bef6ffffff                     mov        esi, 0xfffffff6
009c1 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
009c8 666690                         nop        
009cb e81055b5ff                     call       0x7fa9139c44e0
009d0 0f1f8400c80a000a               nop        dword ptr [rax + rax + 0xa000ac8]
009d8 49bae5e9e613a97f0000           movabs     r10, 0x7fa913e6e9e5
009e2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
009e9 e9f2dea8ff                     jmp        0x7fa9138fcee0
009ee e8adaaa7ff                     call       0x7fa9138e9aa0
009f3 e926f6ffff                     jmp        0x7fa913e6e61e
