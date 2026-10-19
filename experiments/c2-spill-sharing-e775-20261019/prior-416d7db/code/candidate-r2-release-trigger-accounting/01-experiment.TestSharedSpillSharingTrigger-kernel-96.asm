00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85a0090000                   jne        0x7f730fe5943e
0001e 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00023 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00028 48894c2408                     mov        qword ptr [rsp + 8], rcx
0002d 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00032 448b5e08                       mov        r11d, dword ptr [rsi + 8]
00036 4183fb17                       cmp        r11d, 0x17
0003a 0f86b8080000                   jbe        0x7f730fe59378
00040 4c8b5610                       mov        r10, qword ptr [rsi + 0x10]
00044 4c8b5e18                       mov        r11, qword ptr [rsi + 0x18]
00048 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0004c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00051 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00056 4d33d3                         xor        r10, r11
00059 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
0005d 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00062 4d33d0                         xor        r10, r8
00065 4c8b4e30                       mov        r9, qword ptr [rsi + 0x30]
00069 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0006e 4d33d3                         xor        r10, r11
00071 4c8b4638                       mov        r8, qword ptr [rsi + 0x38]
00075 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
0007a 4d33d1                         xor        r10, r9
0007d 4c8b5e40                       mov        r11, qword ptr [rsi + 0x40]
00081 4c89442450                     mov        qword ptr [rsp + 0x50], r8
00086 4d33d0                         xor        r10, r8
00089 4c8b4648                       mov        r8, qword ptr [rsi + 0x48]
0008d 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00092 4d33d3                         xor        r10, r11
00095 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0009a 4d33d0                         xor        r10, r8
0009d 4c8b5e50                       mov        r11, qword ptr [rsi + 0x50]
000a1 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
000a6 4d33d3                         xor        r10, r11
000a9 4c8b5e58                       mov        r11, qword ptr [rsi + 0x58]
000ad 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
000b2 4d33d3                         xor        r10, r11
000b5 4c8b5e60                       mov        r11, qword ptr [rsi + 0x60]
000b9 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
000be 4d33d3                         xor        r10, r11
000c1 4c8b5e68                       mov        r11, qword ptr [rsi + 0x68]
000c5 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
000cd 4d33d3                         xor        r10, r11
000d0 4c8b5e70                       mov        r11, qword ptr [rsi + 0x70]
000d4 4c899c2488000000               mov        qword ptr [rsp + 0x88], r11
000dc 4d33d3                         xor        r10, r11
000df 4c8b5e78                       mov        r11, qword ptr [rsi + 0x78]
000e3 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
000eb 4d33d3                         xor        r10, r11
000ee 4c8b9e80000000                 mov        r11, qword ptr [rsi + 0x80]
000f5 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
000fd 4d33d3                         xor        r10, r11
00100 4c8b9e88000000                 mov        r11, qword ptr [rsi + 0x88]
00107 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
0010f 4d33d3                         xor        r10, r11
00112 4c8b9e90000000                 mov        r11, qword ptr [rsi + 0x90]
00119 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
00121 4d33d3                         xor        r10, r11
00124 4c8b9e98000000                 mov        r11, qword ptr [rsi + 0x98]
0012b 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00133 4d33d3                         xor        r10, r11
00136 4c8b9ea0000000                 mov        r11, qword ptr [rsi + 0xa0]
0013d 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00145 4d33d3                         xor        r10, r11
00148 4c8b9ea8000000                 mov        r11, qword ptr [rsi + 0xa8]
0014f 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00157 4d33d3                         xor        r10, r11
0015a 4c8b9eb0000000                 mov        r11, qword ptr [rsi + 0xb0]
00161 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
00169 4d33d3                         xor        r10, r11
0016c 4c8b9eb8000000                 mov        r11, qword ptr [rsi + 0xb8]
00173 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0017b 4d33d3                         xor        r10, r11
0017e 4c8b9ec0000000                 mov        r11, qword ptr [rsi + 0xc0]
00185 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0018d 4d33d3                         xor        r10, r11
00190 4c8b9ec8000000                 mov        r11, qword ptr [rsi + 0xc8]
00197 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0019f 4d33d3                         xor        r10, r11
001a2 458bda                         mov        r11d, r10d
001a5 4181e3ff030000                 and        r11d, 0x3ff
001ac 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
001b4 666690                         nop        
001b7 e8247cabff                     call       0x7f730f910860
001bc 0f1f8400b4020000               nop        dword ptr [rax + rax + 0x2b4]
001c4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001c9 458b5208                       mov        r10d, dword ptr [r10 + 8]
001cd 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
001d5 453bc2                         cmp        r8d, r10d
001d8 0f83fb010000                   jae        0x7f730fe58e59
001de 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001e3 458b5a08                       mov        r11d, dword ptr [r10 + 8]
001e7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001ec 4f634c820c                     movsxd     r9, dword ptr [r10 + r8*4 + 0xc]
001f1 453bc3                         cmp        r8d, r11d
001f4 0f833e030000                   jae        0x7f730fe58fb8
001fa 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
001ff 458b5208                       mov        r10d, dword ptr [r10 + 8]
00203 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00208 4f635c830c                     movsxd     r11, dword ptr [r11 + r8*4 + 0xc]
0020d 4d03d9                         add        r11, r9
00210 453bc2                         cmp        r8d, r10d
00213 0f8377040000                   jae        0x7f730fe59110
00219 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0021e 458b5208                       mov        r10d, dword ptr [r10 + 8]
00222 4c8b4c2418                     mov        r9, qword ptr [rsp + 0x18]
00227 4b636c810c                     movsxd     rbp, dword ptr [r9 + r8*4 + 0xc]
0022c 4903eb                         add        rbp, r11
0022f 453bc2                         cmp        r8d, r10d
00232 0f83a0050000                   jae        0x7f730fe59258
00238 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0023d 4b6344820c                     movsxd     rax, dword ptr [r10 + r8*4 + 0xc]
00242 4803c5                         add        rax, rbp
00245 c463fbf05c24303e               rorx       r11, qword ptr [rsp + 0x30], 0x3e
0024d c463fbf04424383d               rorx       r8, qword ptr [rsp + 0x38], 0x3d
00255 c463fbf04c24403c               rorx       r9, qword ptr [rsp + 0x40], 0x3c
0025d c4e3fbf04c24483b               rorx       rcx, qword ptr [rsp + 0x48], 0x3b
00265 c4e3fbf05c24503a               rorx       rbx, qword ptr [rsp + 0x50], 0x3a
0026d c4e3fbf07c245839               rorx       rdi, qword ptr [rsp + 0x58], 0x39
00275 c4e3fbf054246038               rorx       rdx, qword ptr [rsp + 0x60], 0x38
0027d c4e3fbf074246837               rorx       rsi, qword ptr [rsp + 0x68], 0x37
00285 c4e3fbf06c247036               rorx       rbp, qword ptr [rsp + 0x70], 0x36
0028d c463fbf06c247835               rorx       r13, qword ptr [rsp + 0x78], 0x35
00295 c463fbf0b4248000000034         rorx       r14, qword ptr [rsp + 0x80], 0x34
002a0 c463fbf094248800000033         rorx       r10, qword ptr [rsp + 0x88], 0x33
002ab 4c891424                       mov        qword ptr [rsp], r10
002af c463fbf094249000000032         rorx       r10, qword ptr [rsp + 0x90], 0x32
002ba 4c89542408                     mov        qword ptr [rsp + 8], r10
002bf c463fbf094249800000031         rorx       r10, qword ptr [rsp + 0x98], 0x31
002ca 4c89542410                     mov        qword ptr [rsp + 0x10], r10
002cf c463fbf09424a000000030         rorx       r10, qword ptr [rsp + 0xa0], 0x30
002da 4c89542418                     mov        qword ptr [rsp + 0x18], r10
002df c463fbf09424a80000002f         rorx       r10, qword ptr [rsp + 0xa8], 0x2f
002ea 4c89542420                     mov        qword ptr [rsp + 0x20], r10
002ef c463fbf09424b00000002e         rorx       r10, qword ptr [rsp + 0xb0], 0x2e
002fa 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002ff c463fbf09424b80000002d         rorx       r10, qword ptr [rsp + 0xb8], 0x2d
0030a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0030f c463fbf09424c00000002c         rorx       r10, qword ptr [rsp + 0xc0], 0x2c
0031a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0031f c463fbf09424c80000002b         rorx       r10, qword ptr [rsp + 0xc8], 0x2b
0032a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0032f c463fbf09424d00000002a         rorx       r10, qword ptr [rsp + 0xd0], 0x2a
0033a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0033f c463fbf09424d800000029         rorx       r10, qword ptr [rsp + 0xd8], 0x29
0034a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0034f c463fbf09424e000000028         rorx       r10, qword ptr [rsp + 0xe0], 0x28
0035a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0035f c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00367 4903c2                         add        rax, r10
0036a 4903c3                         add        rax, r11
0036d 4903c0                         add        rax, r8
00370 4903c1                         add        rax, r9
00373 4803c1                         add        rax, rcx
00376 4803c3                         add        rax, rbx
00379 4803c7                         add        rax, rdi
0037c 4803c2                         add        rax, rdx
0037f 4803c6                         add        rax, rsi
00382 4803c5                         add        rax, rbp
00385 4903c5                         add        rax, r13
00388 4903c6                         add        rax, r14
0038b 48030424                       add        rax, qword ptr [rsp]
0038f 4803442408                     add        rax, qword ptr [rsp + 8]
00394 4803442410                     add        rax, qword ptr [rsp + 0x10]
00399 4803442418                     add        rax, qword ptr [rsp + 0x18]
0039e 4803442420                     add        rax, qword ptr [rsp + 0x20]
003a3 4803442430                     add        rax, qword ptr [rsp + 0x30]
003a8 4803442438                     add        rax, qword ptr [rsp + 0x38]
003ad 4803442440                     add        rax, qword ptr [rsp + 0x40]
003b2 4803442448                     add        rax, qword ptr [rsp + 0x48]
003b7 4803442450                     add        rax, qword ptr [rsp + 0x50]
003bc 4803442458                     add        rax, qword ptr [rsp + 0x58]
003c1 4803442460                     add        rax, qword ptr [rsp + 0x60]
003c6 4881c400010000                 add        rsp, 0x100
003cd 5d                             pop        rbp
003ce 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
003d2 0f87d0050000                   ja         0x7f730fe59428
003d8 c3                             ret        
003d9 bee4ffffff                     mov        esi, 0xffffffe4
003de 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
003e3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003e8 4c891424                       mov        qword ptr [rsp], r10
003ec 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
003f1 4c89542408                     mov        qword ptr [rsp + 8], r10
003f6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
003fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00400 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0040a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0040f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00414 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00419 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0041e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00423 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00428 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0042d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00432 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00437 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0043c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00441 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00446 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0044b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00450 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00455 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0045a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0045f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00464 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0046c 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00471 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00479 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0047e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00486 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0048e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00496 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0049e 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
004a6 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
004ae 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
004b6 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
004be 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
004c6 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
004ce 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004d6 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
004de 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004e6 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
004ee 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
004f6 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
004fe 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00506 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0050e 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00516 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0051e 458bd8                         mov        r11d, r8d
00521 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00529 6690                           nop        
0052b e830c7b9ff                     call       0x7f730f9f56e0
00530 0f1f840028060001               nop        dword ptr [rax + rax + 0x1000628]
00538 bee4ffffff                     mov        esi, 0xffffffe4
0053d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
00542 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00547 4c891424                       mov        qword ptr [rsp], r10
0054b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00550 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00555 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0055a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0055f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00564 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00569 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0056e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00573 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00578 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0057d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00582 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00587 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0058c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00591 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00596 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0059b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
005a0 4c89542450                     mov        qword ptr [rsp + 0x50], r10
005a5 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005aa 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005af 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005b4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
005b9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005c1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005c6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005ce 4c89542470                     mov        qword ptr [rsp + 0x70], r10
005d3 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
005db 4c89542478                     mov        qword ptr [rsp + 0x78], r10
005e0 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
005e8 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
005f0 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
005f8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00600 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00608 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00610 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00618 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00620 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00628 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00630 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00638 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00640 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00648 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00650 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00658 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00660 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00668 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00670 458bd8                         mov        r11d, r8d
00673 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
0067b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00683 e8d8c5b9ff                     call       0x7f730f9f56e0
00688 0f1f840080070002               nop        dword ptr [rax + rax + 0x2000780]
00690 bee4ffffff                     mov        esi, 0xffffffe4
00695 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0069a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0069f 4c891424                       mov        qword ptr [rsp], r10
006a3 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
006a8 4c89542408                     mov        qword ptr [rsp + 8], r10
006ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006b2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
006b7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
006bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006c1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006c6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
006cb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006d0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
006d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006da 4c89542430                     mov        qword ptr [rsp + 0x30], r10
006df 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006e4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
006e9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
006ee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
006f3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
006f8 4c89542448                     mov        qword ptr [rsp + 0x48], r10
006fd 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00702 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00707 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0070c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00711 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00719 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0071e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00726 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0072b 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00733 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00738 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00740 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00745 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0074d 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00755 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0075d 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00765 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0076d 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00775 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0077d 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00785 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0078d 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00795 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0079d 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
007a5 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
007ad 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
007b5 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
007bd 458bd8                         mov        r11d, r8d
007c0 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
007c8 666690                         nop        
007cb e890c4b9ff                     call       0x7f730f9f56e0
007d0 0f1f8400c8080003               nop        dword ptr [rax + rax + 0x30008c8]
007d8 bee4ffffff                     mov        esi, 0xffffffe4
007dd 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007e2 4c891424                       mov        qword ptr [rsp], r10
007e6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
007eb 4c89542408                     mov        qword ptr [rsp + 8], r10
007f0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007f5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
007fa 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
007ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00804 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00809 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0080e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00813 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00818 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0081d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00822 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00827 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0082c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00831 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00836 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0083b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00840 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00845 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0084a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0084f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00854 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0085c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00861 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00869 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0086e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00876 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0087b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00883 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00888 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00890 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00898 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
008a0 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008a8 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008b0 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008b8 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008c0 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008c8 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008d0 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
008d8 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008e0 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
008e8 666690                         nop        
008eb e870c3b9ff                     call       0x7f730f9f56e0
008f0 0f1f8400e8090004               nop        dword ptr [rax + rax + 0x40009e8]
008f8 48891424                       mov        qword ptr [rsp], rdx
008fc 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00901 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00906 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0090b bee4ffffff                     mov        esi, 0xffffffe4
00910 666690                         nop        
00913 e848c3b9ff                     call       0x7f730f9f56e0
00918 0f1f8400100a0005               nop        dword ptr [rax + rax + 0x5000a10]
00920 488bf0                         mov        rsi, rax
00923 4881c400010000                 add        rsp, 0x100
0092a 5d                             pop        rbp
0092b e9300abaff                     jmp        0x7f730f9f9de0
00930 bef6ffffff                     mov        esi, 0xfffffff6
00935 6690                           nop        
00937 e824c3b9ff                     call       0x7f730f9f56e0
0093c 0f1f8400340a0006               nop        dword ptr [rax + rax + 0x6000a34]
00944 bef6ffffff                     mov        esi, 0xfffffff6
00949 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00950 666690                         nop        
00953 e808c3b9ff                     call       0x7f730f9f56e0
00958 0f1f8400500a0007               nop        dword ptr [rax + rax + 0x7000a50]
00960 bef6ffffff                     mov        esi, 0xfffffff6
00965 418be8                         mov        ebp, r8d
00968 666690                         nop        
0096b e8f0c2b9ff                     call       0x7f730f9f56e0
00970 0f1f8400680a0008               nop        dword ptr [rax + rax + 0x8000a68]
00978 bef6ffffff                     mov        esi, 0xfffffff6
0097d 418be8                         mov        ebp, r8d
00980 666690                         nop        
00983 e8d8c2b9ff                     call       0x7f730f9f56e0
00988 0f1f8400800a0009               nop        dword ptr [rax + rax + 0x9000a80]
00990 bef6ffffff                     mov        esi, 0xfffffff6
00995 418be8                         mov        ebp, r8d
00998 666690                         nop        
0099b e8c0c2b9ff                     call       0x7f730f9f56e0
009a0 0f1f8400980a000a               nop        dword ptr [rax + rax + 0xa000a98]
009a8 49ba4e8ee50f737f0000           movabs     r10, 0x7f730fe58e4e
009b2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
009b9 e9a29aabff                     jmp        0x7f730f912ee0
009be e8ddf7a9ff                     call       0x7f730f8f8c20
009c3 e956f6ffff                     jmp        0x7f730fe58a9e
