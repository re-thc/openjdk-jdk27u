00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec00010000                 sub        rsp, 0x100
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85d4090000                   jne        0x7fb193e59772
0001e 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00023 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00028 48894c2408                     mov        qword ptr [rsp + 8], rcx
0002d 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00032 448b5608                       mov        r10d, dword ptr [rsi + 8]
00036 4183fa17                       cmp        r10d, 0x17
0003a 0f86e0080000                   jbe        0x7fb193e596a0
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
001a2 458bd2                         mov        r10d, r10d
001a5 4181e2ff030000                 and        r10d, 0x3ff
001ac 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
001b4 666690                         nop        
001b7 e82479abff                     call       0x7fb193910860
001bc 0f1f8400b4020000               nop        dword ptr [rax + rax + 0x2b4]
001c4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001c9 458b5208                       mov        r10d, dword ptr [r10 + 8]
001cd 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
001d5 453bc2                         cmp        r8d, r10d
001d8 0f8316020000                   jae        0x7fb193e59174
001de 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001e3 458b4208                       mov        r8d, dword ptr [r10 + 8]
001e7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
001ec 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
001f4 4f634c930c                     movsxd     r9, dword ptr [r11 + r10*4 + 0xc]
001f9 453bd0                         cmp        r10d, r8d
001fc 0f8352030000                   jae        0x7fb193e592d4
00202 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00207 418b4a08                       mov        ecx, dword ptr [r10 + 8]
0020b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00210 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00218 4b635c930c                     movsxd     rbx, dword ptr [r11 + r10*4 + 0xc]
0021d 4903d9                         add        rbx, r9
00220 443bd1                         cmp        r10d, ecx
00223 0f838b040000                   jae        0x7fb193e59434
00229 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0022e 458b4208                       mov        r8d, dword ptr [r10 + 8]
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
0023f 4b636c9a0c                     movsxd     rbp, dword ptr [r10 + r11*4 + 0xc]
00244 4803eb                         add        rbp, rbx
00247 458bd3                         mov        r10d, r11d
0024a 453bd0                         cmp        r10d, r8d
0024d 0f83ad050000                   jae        0x7fb193e59580
00253 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00258 4b63449a0c                     movsxd     rax, dword ptr [r10 + r11*4 + 0xc]
0025d 4803c5                         add        rax, rbp
00260 c463fbf05c24303e               rorx       r11, qword ptr [rsp + 0x30], 0x3e
00268 c463fbf04424383d               rorx       r8, qword ptr [rsp + 0x38], 0x3d
00270 c463fbf04c24403c               rorx       r9, qword ptr [rsp + 0x40], 0x3c
00278 c4e3fbf04c24483b               rorx       rcx, qword ptr [rsp + 0x48], 0x3b
00280 c4e3fbf05c24503a               rorx       rbx, qword ptr [rsp + 0x50], 0x3a
00288 c4e3fbf07c245839               rorx       rdi, qword ptr [rsp + 0x58], 0x39
00290 c4e3fbf054246038               rorx       rdx, qword ptr [rsp + 0x60], 0x38
00298 c4e3fbf074246837               rorx       rsi, qword ptr [rsp + 0x68], 0x37
002a0 c4e3fbf06c247036               rorx       rbp, qword ptr [rsp + 0x70], 0x36
002a8 c463fbf06c247835               rorx       r13, qword ptr [rsp + 0x78], 0x35
002b0 c463fbf0b4248000000034         rorx       r14, qword ptr [rsp + 0x80], 0x34
002bb c463fbf094248800000033         rorx       r10, qword ptr [rsp + 0x88], 0x33
002c6 4c891424                       mov        qword ptr [rsp], r10
002ca c463fbf094249000000032         rorx       r10, qword ptr [rsp + 0x90], 0x32
002d5 4c89542408                     mov        qword ptr [rsp + 8], r10
002da c463fbf094249800000031         rorx       r10, qword ptr [rsp + 0x98], 0x31
002e5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
002ea c463fbf09424a000000030         rorx       r10, qword ptr [rsp + 0xa0], 0x30
002f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
002fa c463fbf09424a80000002f         rorx       r10, qword ptr [rsp + 0xa8], 0x2f
00305 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0030a c463fbf09424b00000002e         rorx       r10, qword ptr [rsp + 0xb0], 0x2e
00315 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0031a c463fbf09424b80000002d         rorx       r10, qword ptr [rsp + 0xb8], 0x2d
00325 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0032a c463fbf09424c00000002c         rorx       r10, qword ptr [rsp + 0xc0], 0x2c
00335 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0033a c463fbf09424c80000002b         rorx       r10, qword ptr [rsp + 0xc8], 0x2b
00345 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0034a c463fbf09424d00000002a         rorx       r10, qword ptr [rsp + 0xd0], 0x2a
00355 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0035a c463fbf09424d800000029         rorx       r10, qword ptr [rsp + 0xd8], 0x29
00365 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0036a c463fbf09424e000000028         rorx       r10, qword ptr [rsp + 0xe0], 0x28
00375 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0037a c463fbf05424283f               rorx       r10, qword ptr [rsp + 0x28], 0x3f
00382 4903c2                         add        rax, r10
00385 4903c3                         add        rax, r11
00388 4903c0                         add        rax, r8
0038b 4903c1                         add        rax, r9
0038e 4803c1                         add        rax, rcx
00391 4803c3                         add        rax, rbx
00394 4803c7                         add        rax, rdi
00397 4803c2                         add        rax, rdx
0039a 4803c6                         add        rax, rsi
0039d 4803c5                         add        rax, rbp
003a0 4903c5                         add        rax, r13
003a3 4903c6                         add        rax, r14
003a6 48030424                       add        rax, qword ptr [rsp]
003aa 4803442408                     add        rax, qword ptr [rsp + 8]
003af 4803442410                     add        rax, qword ptr [rsp + 0x10]
003b4 4803442418                     add        rax, qword ptr [rsp + 0x18]
003b9 4803442420                     add        rax, qword ptr [rsp + 0x20]
003be 4803442430                     add        rax, qword ptr [rsp + 0x30]
003c3 4803442438                     add        rax, qword ptr [rsp + 0x38]
003c8 4803442440                     add        rax, qword ptr [rsp + 0x40]
003cd 4803442448                     add        rax, qword ptr [rsp + 0x48]
003d2 4803442450                     add        rax, qword ptr [rsp + 0x50]
003d7 4803442458                     add        rax, qword ptr [rsp + 0x58]
003dc 4803442460                     add        rax, qword ptr [rsp + 0x60]
003e1 4881c400010000                 add        rsp, 0x100
003e8 5d                             pop        rbp
003e9 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
003ed 0f87e9050000                   ja         0x7fb193e5975c
003f3 c3                             ret        
003f4 bee4ffffff                     mov        esi, 0xffffffe4
003f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
003fe 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00403 4c891424                       mov        qword ptr [rsp], r10
00407 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0040c 4c89542408                     mov        qword ptr [rsp + 8], r10
00411 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00416 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0041b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00420 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00425 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0042a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0042f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00434 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00439 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0043e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00443 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00448 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0044d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00452 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00457 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0045c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00461 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00466 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0046b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00470 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00475 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0047a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0047f 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00487 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0048c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00494 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00499 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
004a1 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
004a9 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
004b1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
004b9 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
004c1 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
004c9 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
004d1 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
004d9 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
004e1 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
004e9 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004f1 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
004f9 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00501 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00509 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00511 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00519 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00521 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00529 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00531 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00539 458bd0                         mov        r10d, r8d
0053c 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
00544 666690                         nop        
00547 e814c4b9ff                     call       0x7fb1939f56e0
0054c 0f1f840044060001               nop        dword ptr [rax + rax + 0x1000644]
00554 bee4ffffff                     mov        esi, 0xffffffe4
00559 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0055e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00563 4c891424                       mov        qword ptr [rsp], r10
00567 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0056c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00571 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00576 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0057b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00580 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00585 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0058a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0058f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00594 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00599 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0059e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
005a3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
005a8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
005ad 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
005b2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
005b7 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
005bc 4c89542450                     mov        qword ptr [rsp + 0x50], r10
005c1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005c6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005cb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005d0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
005d5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dd 4c89542468                     mov        qword ptr [rsp + 0x68], r10
005e2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005ea 4c89542470                     mov        qword ptr [rsp + 0x70], r10
005ef 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
005f7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
005fc 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00604 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0060c 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00614 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0061c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00624 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0062c 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00634 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0063c 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00644 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0064c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00654 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0065c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00664 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0066c 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00674 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0067c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00684 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0068c 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00694 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
0069c 458bd3                         mov        r10d, r11d
0069f 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
006a7 e8b4c2b9ff                     call       0x7fb1939f56e0
006ac 0f1f8400a4070002               nop        dword ptr [rax + rax + 0x20007a4]
006b4 bee4ffffff                     mov        esi, 0xffffffe4
006b9 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
006be 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
006c3 4c891424                       mov        qword ptr [rsp], r10
006c7 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
006cc 4c89542408                     mov        qword ptr [rsp + 8], r10
006d1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006d6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
006db 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
006e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006e5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
006ea 4c89542420                     mov        qword ptr [rsp + 0x20], r10
006ef 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
006f4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
006f9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006fe 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00703 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00708 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0070d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00712 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00717 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0071c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00721 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00726 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0072b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00730 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00735 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0073d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00742 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0074a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0074f 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00757 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0075c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00764 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00769 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00771 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00779 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00781 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00789 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00791 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00799 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
007a1 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
007a9 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007b1 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
007b9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
007c1 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
007c9 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
007d1 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
007d9 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
007e1 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
007e9 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
007f1 6690                           nop        
007f3 e868c1b9ff                     call       0x7fb1939f56e0
007f8 0f1f8400f0080003               nop        dword ptr [rax + rax + 0x30008f0]
00800 bee4ffffff                     mov        esi, 0xffffffe4
00805 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0080a 4c891424                       mov        qword ptr [rsp], r10
0080e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00813 4c89542408                     mov        qword ptr [rsp + 8], r10
00818 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0081d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00822 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00827 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0082c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00831 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00836 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0083b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00840 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00845 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0084a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0084f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00854 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00859 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0085e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00863 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00868 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0086d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00872 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00877 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0087c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00884 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00889 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00891 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00896 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0089e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
008a3 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
008ab 4c89542478                     mov        qword ptr [rsp + 0x78], r10
008b0 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
008b8 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
008c0 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
008c8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008d0 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008d8 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008e0 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008e8 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008f0 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008f8 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00900 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00908 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00910 666690                         nop        
00913 e848c0b9ff                     call       0x7fb1939f56e0
00918 0f1f8400100a0004               nop        dword ptr [rax + rax + 0x4000a10]
00920 48891424                       mov        qword ptr [rsp], rdx
00924 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00929 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0092e 4889742420                     mov        qword ptr [rsp + 0x20], rsi
00933 bee4ffffff                     mov        esi, 0xffffffe4
00938 666690                         nop        
0093b e820c0b9ff                     call       0x7fb1939f56e0
00940 0f1f8400380a0005               nop        dword ptr [rax + rax + 0x5000a38]
00948 488bf0                         mov        rsi, rax
0094b 4881c400010000                 add        rsp, 0x100
00952 5d                             pop        rbp
00953 e90813baff                     jmp        0x7fb1939fa9e0
00958 bef6ffffff                     mov        esi, 0xfffffff6
0095d 6690                           nop        
0095f e8fcbfb9ff                     call       0x7fb1939f56e0
00964 0f1f84005c0a0006               nop        dword ptr [rax + rax + 0x6000a5c]
0096c bef6ffffff                     mov        esi, 0xfffffff6
00971 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00978 666690                         nop        
0097b e8e0bfb9ff                     call       0x7fb1939f56e0
00980 0f1f8400780a0007               nop        dword ptr [rax + rax + 0x7000a78]
00988 bef6ffffff                     mov        esi, 0xfffffff6
0098d 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
00994 666690                         nop        
00997 e8c4bfb9ff                     call       0x7fb1939f56e0
0099c 0f1f8400940a0008               nop        dword ptr [rax + rax + 0x8000a94]
009a4 bef6ffffff                     mov        esi, 0xfffffff6
009a9 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
009b0 666690                         nop        
009b3 e8a8bfb9ff                     call       0x7fb1939f56e0
009b8 0f1f8400b00a0009               nop        dword ptr [rax + rax + 0x9000ab0]
009c0 bef6ffffff                     mov        esi, 0xfffffff6
009c5 8bac24e8000000                 mov        ebp, dword ptr [rsp + 0xe8]
009cc 666690                         nop        
009cf e88cbfb9ff                     call       0x7fb1939f56e0
009d4 0f1f8400cc0a000a               nop        dword ptr [rax + rax + 0xa000acc]
009dc 49ba6991e593b17f0000           movabs     r10, 0x7fb193e59169
009e6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
009ed e96e97abff                     jmp        0x7fb193912ee0
009f2 e8a9f4a9ff                     call       0x7fb1938f8c20
009f7 e922f6ffff                     jmp        0x7fb193e58d9e
009fc f4                             hlt        
009fd f4                             hlt        
009fe f4                             hlt        
009ff f4                             hlt        
