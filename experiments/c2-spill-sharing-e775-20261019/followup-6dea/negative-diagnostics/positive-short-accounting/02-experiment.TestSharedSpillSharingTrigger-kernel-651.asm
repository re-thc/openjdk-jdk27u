00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85a0090000                   jne        0x7fb77fe6e8be
0001e 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00023 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00028 48894c2408                     mov        qword ptr [rsp + 8], rcx
0002d 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00032 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00036 4183fb17                       cmp        r11d, 0x17
0003a 0f86bc080000                   jbe        0x7fb77fe6e7fc
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
001b3 e8a8c7a8ff                     call       0x7fb77f8fa860
001b8 0f1f8400b0020000               nop        dword ptr [rax + rax + 0x2b0]
001c0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001c5 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001c9 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
001d1 453bc3                         cmp        r8d, r11d
001d4 0f8305020000                   jae        0x7fb77fe6e2df
001da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001df 458b5204                       mov        r10d, dword ptr [r10 + 4]
001e3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
001e8 4f63448308                     movsxd     r8, dword ptr [r11 + r8*4 + 8]
001ed 8b8c24e8000000                 mov        ecx, dword ptr [rsp + 0xe8]
001f4 413bca                         cmp        ecx, r10d
001f7 0f833f030000                   jae        0x7fb77fe6e43c
001fd 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00202 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00206 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0020b 4d634c8a08                     movsxd     r9, dword ptr [r10 + rcx*4 + 8]
00210 4d03c8                         add        r9, r8
00213 448bd1                         mov        r10d, ecx
00216 453bd3                         cmp        r10d, r11d
00219 0f8375040000                   jae        0x7fb77fe6e594
0021f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00224 458b4304                       mov        r8d, dword ptr [r11 + 4]
00228 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0022d 4b636c9308                     movsxd     rbp, dword ptr [r11 + r10*4 + 8]
00232 4903e9                         add        rbp, r9
00235 453bd0                         cmp        r10d, r8d
00238 0f839e050000                   jae        0x7fb77fe6e6dc
0023e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00243 4b63449308                     movsxd     rax, dword ptr [r11 + r10*4 + 8]
00248 4803c5                         add        rax, rbp
0024b c463fbf05c24303e               rorx       r11, qword ptr [rsp + 0x30], 0x3e
00253 c463fbf04424383d               rorx       r8, qword ptr [rsp + 0x38], 0x3d
0025b c463fbf04c24403c               rorx       r9, qword ptr [rsp + 0x40], 0x3c
00263 c4e3fbf04c24483b               rorx       rcx, qword ptr [rsp + 0x48], 0x3b
0026b c4e3fbf05c24503a               rorx       rbx, qword ptr [rsp + 0x50], 0x3a
00273 c4e3fbf07c245839               rorx       rdi, qword ptr [rsp + 0x58], 0x39
0027b c4e3fbf054246038               rorx       rdx, qword ptr [rsp + 0x60], 0x38
00283 c4e3fbf074246837               rorx       rsi, qword ptr [rsp + 0x68], 0x37
0028b c4e3fbf06c247036               rorx       rbp, qword ptr [rsp + 0x70], 0x36
00293 c463fbf06c247835               rorx       r13, qword ptr [rsp + 0x78], 0x35
0029b c463fbf0b4248000000034         rorx       r14, qword ptr [rsp + 0x80], 0x34
002a6 c463fbf094248800000033         rorx       r10, qword ptr [rsp + 0x88], 0x33
002b1 4c891424                       mov        qword ptr [rsp], r10
002b5 c463fbf094249000000032         rorx       r10, qword ptr [rsp + 0x90], 0x32
002c0 4c89542408                     mov        qword ptr [rsp + 8], r10
002c5 c463fbf094249800000031         rorx       r10, qword ptr [rsp + 0x98], 0x31
002d0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
002d5 c463fbf09424a000000030         rorx       r10, qword ptr [rsp + 0xa0], 0x30
002e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
002e5 c463fbf09424a80000002f         rorx       r10, qword ptr [rsp + 0xa8], 0x2f
002f0 4c89542420                     mov        qword ptr [rsp + 0x20], r10
002f5 c463fbf09424b00000002e         rorx       r10, qword ptr [rsp + 0xb0], 0x2e
00300 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00305 c463fbf09424b80000002d         rorx       r10, qword ptr [rsp + 0xb8], 0x2d
00310 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00315 c463fbf09424c00000002c         rorx       r10, qword ptr [rsp + 0xc0], 0x2c
00320 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00325 c463fbf09424c80000002b         rorx       r10, qword ptr [rsp + 0xc8], 0x2b
00330 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00335 c463fbf09424d00000002a         rorx       r10, qword ptr [rsp + 0xd0], 0x2a
00340 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00345 c463fbf09424d800000029         rorx       r10, qword ptr [rsp + 0xd8], 0x29
00350 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00355 c463fbf09424e000000028         rorx       r10, qword ptr [rsp + 0xe0], 0x28
00360 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00365 c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
0036d 4903c2                         add        rax, r10
00370 4903c3                         add        rax, r11
00373 4903c0                         add        rax, r8
00376 4903c1                         add        rax, r9
00379 4803c1                         add        rax, rcx
0037c 4803c3                         add        rax, rbx
0037f 4803c7                         add        rax, rdi
00382 4803c2                         add        rax, rdx
00385 4803c6                         add        rax, rsi
00388 4803c5                         add        rax, rbp
0038b 4903c5                         add        rax, r13
0038e 4903c6                         add        rax, r14
00391 48030424                       add        rax, qword ptr [rsp]
00395 4803442408                     add        rax, qword ptr [rsp + 8]
0039a 4803442410                     add        rax, qword ptr [rsp + 0x10]
0039f 4803442418                     add        rax, qword ptr [rsp + 0x18]
003a4 4803442420                     add        rax, qword ptr [rsp + 0x20]
003a9 4803442430                     add        rax, qword ptr [rsp + 0x30]
003ae 4803442438                     add        rax, qword ptr [rsp + 0x38]
003b3 4803442440                     add        rax, qword ptr [rsp + 0x40]
003b8 4803442448                     add        rax, qword ptr [rsp + 0x48]
003bd 4803442450                     add        rax, qword ptr [rsp + 0x50]
003c2 4803442458                     add        rax, qword ptr [rsp + 0x58]
003c7 4803442460                     add        rax, qword ptr [rsp + 0x60]
003cc 4881c400010000                 add        rsp, 0x100
003d3 5d                             pop        rbp
003d4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
003d8 0f87ca050000                   ja         0x7fb77fe6e8a8
003de c3                             ret        
003df bee4ffffff                     mov        esi, 0xffffffe4
003e4 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
003e9 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
003ee 4c891424                       mov        qword ptr [rsp], r10
003f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
003f7 4c89542408                     mov        qword ptr [rsp + 8], r10
003fc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00401 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00406 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0040b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00410 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00415 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0041a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0041f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00424 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00429 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0042e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00433 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00438 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0043d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00442 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00447 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0044c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00451 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00456 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0045b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00460 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00465 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0046a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00472 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00477 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0047f 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00484 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0048c 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00494 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0049c 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
004a4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
004ac 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
004b4 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
004bc 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
004c4 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
004cc 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
004d4 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004dc 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
004e4 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004ec 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
004f4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
004fc 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00504 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0050c 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00514 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0051c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00524 458bd0                         mov        r10d, r8d
00527 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0052f e82c5ab5ff                     call       0x7fb77f9c3e60
00534 0f1f84002c060001               nop        dword ptr [rax + rax + 0x100062c]
0053c bee4ffffff                     mov        esi, 0xffffffe4
00541 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
00546 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0054b 4c891424                       mov        qword ptr [rsp], r10
0054f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00554 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00559 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0055e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00563 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00568 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0056d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00572 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00577 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0057c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00581 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00586 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0058b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00590 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00595 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0059a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0059f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
005a4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
005a9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005ae 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005b3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005b8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
005bd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005c5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005ca 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005d2 4c89542470                     mov        qword ptr [rsp + 0x70], r10
005d7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
005df 4c89542478                     mov        qword ptr [rsp + 0x78], r10
005e4 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
005ec 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
005f4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
005fc 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00604 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0060c 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00614 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0061c 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00624 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0062c 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00634 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0063c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00644 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0064c 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00654 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
0065c 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00664 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0066c 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00674 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0067c 448bd1                         mov        r10d, ecx
0067f 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00687 e8d458b5ff                     call       0x7fb77f9c3e60
0068c 0f1f840084070002               nop        dword ptr [rax + rax + 0x2000784]
00694 bee4ffffff                     mov        esi, 0xffffffe4
00699 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0069e 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
006a3 4c891424                       mov        qword ptr [rsp], r10
006a7 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
006ac 4c89542408                     mov        qword ptr [rsp + 8], r10
006b1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
006bb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
006c0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006c5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006ca 4c89542420                     mov        qword ptr [rsp + 0x20], r10
006cf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006d4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
006d9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006de 4c89542430                     mov        qword ptr [rsp + 0x30], r10
006e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006e8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
006ed 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
006f2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
006f7 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
006fc 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00701 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00706 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0070b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00710 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00715 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0071d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00722 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0072a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0072f 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00737 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0073c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00744 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00749 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00751 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00759 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00761 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00769 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00771 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00779 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00781 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00789 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00791 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00799 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
007a1 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
007a9 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
007b1 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
007b9 448bd1                         mov        r10d, ecx
007bc 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
007c4 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
007cc 666690                         nop        
007cf e88c57b5ff                     call       0x7fb77f9c3e60
007d4 0f1f8400cc080003               nop        dword ptr [rax + rax + 0x30008cc]
007dc bee4ffffff                     mov        esi, 0xffffffe4
007e1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007e6 4c891424                       mov        qword ptr [rsp], r10
007ea 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
007ef 4c89542408                     mov        qword ptr [rsp + 8], r10
007f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
007fe 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00803 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00808 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0080d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00812 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00817 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0081c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00821 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00826 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0082b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00830 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00835 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0083a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0083f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00844 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00849 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0084e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00853 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00858 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00860 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00865 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0086d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00872 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0087a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0087f 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00887 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0088c 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00894 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0089c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
008a4 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008ac 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008b4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008bc 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008c4 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008cc 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008d4 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
008dc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008e4 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
008ec 666690                         nop        
008ef e86c56b5ff                     call       0x7fb77f9c3e60
008f4 0f1f8400ec090004               nop        dword ptr [rax + rax + 0x40009ec]
008fc 48891424                       mov        qword ptr [rsp], rdx
00900 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00905 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0090a 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0090f bee4ffffff                     mov        esi, 0xffffffe4
00914 666690                         nop        
00917 e84456b5ff                     call       0x7fb77f9c3e60
0091c 0f1f8400140a0005               nop        dword ptr [rax + rax + 0x5000a14]
00924 488bf0                         mov        rsi, rax
00927 4881c400010000                 add        rsp, 0x100
0092e 5d                             pop        rbp
0092f e9ac7db5ff                     jmp        0x7fb77f9c65e0
00934 bef6ffffff                     mov        esi, 0xfffffff6
00939 6690                           nop        
0093b e82056b5ff                     call       0x7fb77f9c3e60
00940 0f1f8400380a0006               nop        dword ptr [rax + rax + 0x6000a38]
00948 bef6ffffff                     mov        esi, 0xfffffff6
0094d 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00954 666690                         nop        
00957 e80456b5ff                     call       0x7fb77f9c3e60
0095c 0f1f8400540a0007               nop        dword ptr [rax + rax + 0x7000a54]
00964 bef6ffffff                     mov        esi, 0xfffffff6
00969 418be8                         mov        ebp, r8d
0096c 666690                         nop        
0096f e8ec55b5ff                     call       0x7fb77f9c3e60
00974 0f1f84006c0a0008               nop        dword ptr [rax + rax + 0x8000a6c]
0097c bef6ffffff                     mov        esi, 0xfffffff6
00981 8be9                           mov        ebp, ecx
00983 e8d855b5ff                     call       0x7fb77f9c3e60
00988 0f1f8400800a0009               nop        dword ptr [rax + rax + 0x9000a80]
00990 bef6ffffff                     mov        esi, 0xfffffff6
00995 418bea                         mov        ebp, r10d
00998 666690                         nop        
0099b e8c055b5ff                     call       0x7fb77f9c3e60
009a0 0f1f8400980a000a               nop        dword ptr [rax + rax + 0xa000a98]
009a8 49bad4e2e67fb77f0000           movabs     r10, 0x7fb77fe6e2d4
009b2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
009b9 e922e6a8ff                     jmp        0x7fb77f8fcee0
009be e8ddb1a7ff                     call       0x7fb77f8e9aa0
009c3 e956f6ffff                     jmp        0x7fb77fe6df1e
