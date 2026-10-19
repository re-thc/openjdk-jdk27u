00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec20010000                 sub        rsp, 0x120
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85d4070000                   jne        0x7f2cebba8af2
0001e 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
00023 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00028 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002d 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
00032 4889542418                     mov        qword ptr [rsp + 0x18], rdx
00037 448b5604                       mov        r10d, dword ptr [rsi + 4]
0003b 4183fa17                       cmp        r10d, 0x17
0003f 0f868b050000                   jbe        0x7f2cebba88d0
00045 4c8b5608                       mov        r10, qword ptr [rsi + 8]
00049 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0004d 4c8b4618                       mov        r8, qword ptr [rsi + 0x18]
00051 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00056 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0005b 4d33d3                         xor        r10, r11
0005e 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
00062 4c89442448                     mov        qword ptr [rsp + 0x48], r8
00067 4d33d0                         xor        r10, r8
0006a 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
0006e 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00073 4d33d3                         xor        r10, r11
00076 4c8b5e30                       mov        r11, qword ptr [rsi + 0x30]
0007a 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0007f 4d33d0                         xor        r10, r8
00082 4c8b4638                       mov        r8, qword ptr [rsi + 0x38]
00086 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0008b 4d33d3                         xor        r10, r11
0008e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
00093 4d33d0                         xor        r10, r8
00096 4c8b5e48                       mov        r11, qword ptr [rsi + 0x48]
0009a 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
0009f 4c8b5e50                       mov        r11, qword ptr [rsi + 0x50]
000a3 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
000a8 4c8b5e58                       mov        r11, qword ptr [rsi + 0x58]
000ac 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
000b4 4c8b5e60                       mov        r11, qword ptr [rsi + 0x60]
000b8 4c899c2488000000               mov        qword ptr [rsp + 0x88], r11
000c0 4c8b5e68                       mov        r11, qword ptr [rsi + 0x68]
000c4 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
000cc 4c8b5e70                       mov        r11, qword ptr [rsi + 0x70]
000d0 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
000d8 4c8b5e78                       mov        r11, qword ptr [rsi + 0x78]
000dc 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
000e4 4c8b9e80000000                 mov        r11, qword ptr [rsi + 0x80]
000eb 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
000f3 4c8b9e88000000                 mov        r11, qword ptr [rsi + 0x88]
000fa 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00102 4c8b9e90000000                 mov        r11, qword ptr [rsi + 0x90]
00109 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00111 4c8b9e98000000                 mov        r11, qword ptr [rsi + 0x98]
00118 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00120 4c8b9ea0000000                 mov        r11, qword ptr [rsi + 0xa0]
00127 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0012f 4c8b9ea8000000                 mov        r11, qword ptr [rsi + 0xa8]
00136 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0013e 4c8b9eb0000000                 mov        r11, qword ptr [rsi + 0xb0]
00145 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0014d 4c8b9eb8000000                 mov        r11, qword ptr [rsi + 0xb8]
00154 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
0015c 4c8b9ec0000000                 mov        r11, qword ptr [rsi + 0xc0]
00163 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0016b 4c8b5e40                       mov        r11, qword ptr [rsi + 0x40]
0016f 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
00177 4d33d3                         xor        r10, r11
0017a 4c33542470                     xor        r10, qword ptr [rsp + 0x70]
0017f 4c33542478                     xor        r10, qword ptr [rsp + 0x78]
00184 4c33942480000000               xor        r10, qword ptr [rsp + 0x80]
0018c 4c33942488000000               xor        r10, qword ptr [rsp + 0x88]
00194 4c33942490000000               xor        r10, qword ptr [rsp + 0x90]
0019c 4c33942498000000               xor        r10, qword ptr [rsp + 0x98]
001a4 4c339424a0000000               xor        r10, qword ptr [rsp + 0xa0]
001ac 4c339424a8000000               xor        r10, qword ptr [rsp + 0xa8]
001b4 4c339424b0000000               xor        r10, qword ptr [rsp + 0xb0]
001bc 4c339424b8000000               xor        r10, qword ptr [rsp + 0xb8]
001c4 4c339424c0000000               xor        r10, qword ptr [rsp + 0xc0]
001cc 4c339424c8000000               xor        r10, qword ptr [rsp + 0xc8]
001d4 4c339424d0000000               xor        r10, qword ptr [rsp + 0xd0]
001dc 4c339424d8000000               xor        r10, qword ptr [rsp + 0xd8]
001e4 4c339424e0000000               xor        r10, qword ptr [rsp + 0xe0]
001ec 4c339424e8000000               xor        r10, qword ptr [rsp + 0xe8]
001f4 418bea                         mov        ebp, r10d
001f7 81e5ff030000                   and        ebp, 0x3ff
001fd 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
00204 33f6                           xor        esi, esi
00206 90                             nop        
00207 e85497b7ff                     call       0x7f2ceb721c60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00219 458b5204                       mov        r10d, dword ptr [r10 + 4]
0021d 413bea                         cmp        ebp, r10d
00220 0f83c3020000                   jae        0x7f2cebba87e9
00226 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0022b 458b44aa08                     mov        r8d, dword ptr [r10 + rbp*4 + 8]
00230 458bd0                         mov        r10d, r8d
00233 4181f25a5a5a5a                 xor        r10d, 0x5a5a5a5a
0023a 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
00242 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00247 458b5204                       mov        r10d, dword ptr [r10 + 4]
0024b 4d63d8                         movsxd     r11, r8d
0024e 4c899c2400010000               mov        qword ptr [rsp + 0x100], r11
00256 413bea                         cmp        ebp, r10d
00259 0f83b5020000                   jae        0x7f2cebba8814
0025f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00264 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
0026c 458954ab08                     mov        dword ptr [r11 + rbp*4 + 8], r10d
00271 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00276 458b5204                       mov        r10d, dword ptr [r10 + 4]
0027a 413bea                         cmp        ebp, r10d
0027d 0f83c9020000                   jae        0x7f2cebba884c
00283 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00288 458b5204                       mov        r10d, dword ptr [r10 + 4]
0028c 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00291 4d635cab08                     movsxd     r11, dword ptr [r11 + rbp*4 + 8]
00296 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0029b 413bea                         cmp        ebp, r10d
0029e 0f83d4020000                   jae        0x7f2cebba8878
002a4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
002a9 458b5204                       mov        r10d, dword ptr [r10 + 4]
002ad 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
002b2 4d635cab08                     movsxd     r11, dword ptr [r11 + rbp*4 + 8]
002b7 4c035c2410                     add        r11, qword ptr [rsp + 0x10]
002bc 4c895c2408                     mov        qword ptr [rsp + 8], r11
002c1 413bea                         cmp        ebp, r10d
002c4 0f83da020000                   jae        0x7f2cebba88a4
002ca be01000000                     mov        esi, 1
002cf 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
002d4 4d6354aa08                     movsxd     r10, dword ptr [r10 + rbp*4 + 8]
002d9 4d03d3                         add        r10, r11
002dc 4c03942400010000               add        r10, qword ptr [rsp + 0x100]
002e4 4c891424                       mov        qword ptr [rsp], r10
002e8 90                             nop        
002e9 90                             nop        
002ea 90                             nop        
002eb e87096b7ff                     call       0x7f2ceb721c60
002f0 0f1f8400e8030001               nop        dword ptr [rax + rax + 0x10003e8]
002f8 4c8b942430010000               mov        r10, qword ptr [rsp + 0x130]
00300 458b5204                       mov        r10d, dword ptr [r10 + 4]
00304 4489542408                     mov        dword ptr [rsp + 8], r10d
00309 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0030e 49636caa08                     movsxd     rbp, dword ptr [r10 + rbp*4 + 8]
00313 48332c24                       xor        rbp, qword ptr [rsp]
00317 c463fbf05c24403e               rorx       r11, qword ptr [rsp + 0x40], 0x3e
0031f c463fbf04424483d               rorx       r8, qword ptr [rsp + 0x48], 0x3d
00327 c463fbf04c24503c               rorx       r9, qword ptr [rsp + 0x50], 0x3c
0032f c4e3fbf04c24583b               rorx       rcx, qword ptr [rsp + 0x58], 0x3b
00337 c4e3fbf05c24603a               rorx       rbx, qword ptr [rsp + 0x60], 0x3a
0033f c4e3fbf07c246839               rorx       rdi, qword ptr [rsp + 0x68], 0x39
00347 c4e3fbf09424f000000038         rorx       rdx, qword ptr [rsp + 0xf0], 0x38
00352 c4e3fbf074247037               rorx       rsi, qword ptr [rsp + 0x70], 0x37
0035a c4e3fbf044247836               rorx       rax, qword ptr [rsp + 0x78], 0x36
00362 c463fbf0ac248000000035         rorx       r13, qword ptr [rsp + 0x80], 0x35
0036d c463fbf0b4248800000034         rorx       r14, qword ptr [rsp + 0x88], 0x34
00378 c463fbf094249000000033         rorx       r10, qword ptr [rsp + 0x90], 0x33
00383 4c891424                       mov        qword ptr [rsp], r10
00387 c463fbf094249800000032         rorx       r10, qword ptr [rsp + 0x98], 0x32
00392 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00397 c463fbf09424a000000031         rorx       r10, qword ptr [rsp + 0xa0], 0x31
003a2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
003a7 c463fbf09424a800000030         rorx       r10, qword ptr [rsp + 0xa8], 0x30
003b2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
003b7 c463fbf09424b00000002f         rorx       r10, qword ptr [rsp + 0xb0], 0x2f
003c2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
003c7 c463fbf09424b80000002e         rorx       r10, qword ptr [rsp + 0xb8], 0x2e
003d2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
003d7 c463fbf09424c00000002d         rorx       r10, qword ptr [rsp + 0xc0], 0x2d
003e2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
003e7 c463fbf09424c80000002c         rorx       r10, qword ptr [rsp + 0xc8], 0x2c
003f2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
003f7 c463fbf09424d00000002b         rorx       r10, qword ptr [rsp + 0xd0], 0x2b
00402 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00407 c463fbf09424d80000002a         rorx       r10, qword ptr [rsp + 0xd8], 0x2a
00412 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00417 c463fbf09424e000000029         rorx       r10, qword ptr [rsp + 0xe0], 0x29
00422 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00427 c463fbf09424e800000028         rorx       r10, qword ptr [rsp + 0xe8], 0x28
00432 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00437 c463fbf05424383f               rorx       r10, qword ptr [rsp + 0x38], 0x3f
0043f 4903ea                         add        rbp, r10
00442 4903eb                         add        rbp, r11
00445 4903e8                         add        rbp, r8
00448 4903e9                         add        rbp, r9
0044b 4803e9                         add        rbp, rcx
0044e 4803eb                         add        rbp, rbx
00451 4803ef                         add        rbp, rdi
00454 4803ea                         add        rbp, rdx
00457 4803ee                         add        rbp, rsi
0045a 4803e8                         add        rbp, rax
0045d 4903ed                         add        rbp, r13
00460 4903ee                         add        rbp, r14
00463 48032c24                       add        rbp, qword ptr [rsp]
00467 48036c2410                     add        rbp, qword ptr [rsp + 0x10]
0046c 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
00471 48036c2420                     add        rbp, qword ptr [rsp + 0x20]
00476 48036c2428                     add        rbp, qword ptr [rsp + 0x28]
0047b 48036c2430                     add        rbp, qword ptr [rsp + 0x30]
00480 48036c2440                     add        rbp, qword ptr [rsp + 0x40]
00485 48036c2448                     add        rbp, qword ptr [rsp + 0x48]
0048a 48036c2450                     add        rbp, qword ptr [rsp + 0x50]
0048f 48036c2458                     add        rbp, qword ptr [rsp + 0x58]
00494 48036c2460                     add        rbp, qword ptr [rsp + 0x60]
00499 48036c2468                     add        rbp, qword ptr [rsp + 0x68]
0049e 448b542408                     mov        r10d, dword ptr [rsp + 8]
004a3 4183fa02                       cmp        r10d, 2
004a7 0f8663010000                   jbe        0x7f2cebba8910
004ad 4c8b842430010000               mov        r8, qword ptr [rsp + 0x130]
004b5 458b5808                       mov        r11d, dword ptr [r8 + 8]
004b9 498b4308                       mov        rax, qword ptr [r11 + 8]
004bd 458b500c                       mov        r10d, dword ptr [r8 + 0xc]
004c1 4d8b5208                       mov        r10, qword ptr [r10 + 8]
004c5 458b4010                       mov        r8d, dword ptr [r8 + 0x10]
004c9 4d8b5808                       mov        r11, qword ptr [r8 + 8]
004cd 4833c5                         xor        rax, rbp
004d0 4933c2                         xor        rax, r10
004d3 4933c3                         xor        rax, r11
004d6 4881c420010000                 add        rsp, 0x120
004dd 5d                             pop        rbp
004de 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
004e2 0f87f4020000                   ja         0x7f2cebba8adc
004e8 c3                             ret        
004e9 bee4ffffff                     mov        esi, 0xffffffe4
004ee 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
004f3 e8e87faaff                     call       0x7f2ceb6507e0
004f8 0f1f8400f0050002               nop        dword ptr [rax + rax + 0x20005f0]
00500 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0050a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0050e e85db58b17                     call       0x7f2d03463d70
00513 f4                             hlt        
00514 bee4ffffff                     mov        esi, 0xffffffe4
00519 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
0051e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00523 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00528 90                             nop        
00529 90                             nop        
0052a 90                             nop        
0052b e8b07faaff                     call       0x7f2ceb6507e0
00530 0f1f840028060003               nop        dword ptr [rax + rax + 0x3000628]
00538 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
00542 4883e4f0                       and        rsp, 0xfffffffffffffff0
00546 e825b58b17                     call       0x7f2d03463d70
0054b f4                             hlt        
0054c bee4ffffff                     mov        esi, 0xffffffe4
00551 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00556 90                             nop        
00557 e8847faaff                     call       0x7f2ceb6507e0
0055c 0f1f840054060004               nop        dword ptr [rax + rax + 0x4000654]
00564 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0056e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00572 e8f9b48b17                     call       0x7f2d03463d70
00577 f4                             hlt        
00578 bee4ffffff                     mov        esi, 0xffffffe4
0057d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00582 90                             nop        
00583 e8587faaff                     call       0x7f2ceb6507e0
00588 0f1f840080060005               nop        dword ptr [rax + rax + 0x5000680]
00590 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0059a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0059e e8cdb48b17                     call       0x7f2d03463d70
005a3 f4                             hlt        
005a4 bee4ffffff                     mov        esi, 0xffffffe4
005a9 488b6c2430                     mov        rbp, qword ptr [rsp + 0x30]
005ae 90                             nop        
005af e82c7faaff                     call       0x7f2ceb6507e0
005b4 0f1f8400ac060006               nop        dword ptr [rax + rax + 0x60006ac]
005bc 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
005c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
005ca e8a1b48b17                     call       0x7f2d03463d70
005cf f4                             hlt        
005d0 48891424                       mov        qword ptr [rsp], rdx
005d4 48894c2408                     mov        qword ptr [rsp + 8], rcx
005d9 4c89442410                     mov        qword ptr [rsp + 0x10], r8
005de 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
005e3 4889742428                     mov        qword ptr [rsp + 0x28], rsi
005e8 bee4ffffff                     mov        esi, 0xffffffe4
005ed 90                             nop        
005ee 90                             nop        
005ef e8ec7eaaff                     call       0x7f2ceb6507e0
005f4 0f1f8400ec060007               nop        dword ptr [rax + rax + 0x70006ec]
005fc 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
00606 4883e4f0                       and        rsp, 0xfffffffffffffff0
0060a e861b48b17                     call       0x7f2d03463d70
0060f f4                             hlt        
00610 bee4ffffff                     mov        esi, 0xffffffe4
00615 90                             nop        
00616 90                             nop        
00617 e8c47eaaff                     call       0x7f2ceb6507e0
0061c 0f1f840014070008               nop        dword ptr [rax + rax + 0x8000714]
00624 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0062e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00632 e839b48b17                     call       0x7f2d03463d70
00637 f4                             hlt        
00638 488bf0                         mov        rsi, rax
0063b eb03                           jmp        0x7f2cebba8940
0063d 488bf0                         mov        rsi, rax
00640 4881c420010000                 add        rsp, 0x120
00647 5d                             pop        rbp
00648 e99305aaff                     jmp        0x7f2ceb648ee0
0064d bef6ffffff                     mov        esi, 0xfffffff6
00652 90                             nop        
00653 e8887eaaff                     call       0x7f2ceb6507e0
00658 0f1f840050070009               nop        dword ptr [rax + rax + 0x9000750]
00660 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0066a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0066e e8fdb38b17                     call       0x7f2d03463d70
00673 f4                             hlt        
00674 bef6ffffff                     mov        esi, 0xfffffff6
00679 90                             nop        
0067a 90                             nop        
0067b e8607eaaff                     call       0x7f2ceb6507e0
00680 0f1f84007807000a               nop        dword ptr [rax + rax + 0xa000778]
00688 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
00692 4883e4f0                       and        rsp, 0xfffffffffffffff0
00696 e8d5b38b17                     call       0x7f2d03463d70
0069b f4                             hlt        
0069c bef6ffffff                     mov        esi, 0xfffffff6
006a1 90                             nop        
006a2 90                             nop        
006a3 e8387eaaff                     call       0x7f2ceb6507e0
006a8 0f1f8400a007000b               nop        dword ptr [rax + rax + 0xb0007a0]
006b0 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
006ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
006be e8adb38b17                     call       0x7f2d03463d70
006c3 f4                             hlt        
006c4 bef6ffffff                     mov        esi, 0xfffffff6
006c9 90                             nop        
006ca 90                             nop        
006cb e8107eaaff                     call       0x7f2ceb6507e0
006d0 0f1f8400c807000c               nop        dword ptr [rax + rax + 0xc0007c8]
006d8 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
006e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
006e6 e885b38b17                     call       0x7f2d03463d70
006eb f4                             hlt        
006ec bef6ffffff                     mov        esi, 0xfffffff6
006f1 90                             nop        
006f2 90                             nop        
006f3 e8e87daaff                     call       0x7f2ceb6507e0
006f8 0f1f8400f007000d               nop        dword ptr [rax + rax + 0xd0007f0]
00700 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0070a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0070e e85db38b17                     call       0x7f2d03463d70
00713 f4                             hlt        
00714 bef6ffffff                     mov        esi, 0xfffffff6
00719 90                             nop        
0071a 90                             nop        
0071b e8c07daaff                     call       0x7f2ceb6507e0
00720 0f1f84001808000e               nop        dword ptr [rax + rax + 0xe000818]
00728 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
00732 4883e4f0                       and        rsp, 0xfffffffffffffff0
00736 e835b38b17                     call       0x7f2d03463d70
0073b f4                             hlt        
0073c bef6ffffff                     mov        esi, 0xfffffff6
00741 90                             nop        
00742 90                             nop        
00743 e8987daaff                     call       0x7f2ceb6507e0
00748 0f1f84004008000f               nop        dword ptr [rax + rax + 0xf000840]
00750 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
0075a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0075e e80db38b17                     call       0x7f2d03463d70
00763 f4                             hlt        
00764 bef6ffffff                     mov        esi, 0xfffffff6
00769 90                             nop        
0076a 90                             nop        
0076b e8707daaff                     call       0x7f2ceb6507e0
00770 0f1f840068080010               nop        dword ptr [rax + rax + 0x10000868]
00778 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
00782 4883e4f0                       and        rsp, 0xfffffffffffffff0
00786 e8e5b28b17                     call       0x7f2d03463d70
0078b f4                             hlt        
0078c bef6ffffff                     mov        esi, 0xfffffff6
00791 90                             nop        
00792 90                             nop        
00793 e8487daaff                     call       0x7f2ceb6507e0
00798 0f1f840090080011               nop        dword ptr [rax + rax + 0x11000890]
007a0 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
007aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ae e8bdb28b17                     call       0x7f2d03463d70
007b3 f4                             hlt        
007b4 bef6ffffff                     mov        esi, 0xfffffff6
007b9 90                             nop        
007ba 90                             nop        
007bb e8207daaff                     call       0x7f2ceb6507e0
007c0 0f1f8400b8080012               nop        dword ptr [rax + rax + 0x120008b8]
007c8 48bf90ef0cc42c7f0000           movabs     rdi, 0x7f2cc40cef90
007d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007d6 e895b28b17                     call       0x7f2d03463d70
007db f4                             hlt        
007dc 49bade87baeb2c7f0000           movabs     r10, 0x7f2cebba87de
007e6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
007ed e96eb8b7ff                     jmp        0x7f2ceb724360
007f2 e86988b6ff                     call       0x7f2ceb711360
007f7 e922f8ffff                     jmp        0x7f2cebba831e
007fc f4                             hlt        
007fd f4                             hlt        
007fe f4                             hlt        
007ff f4                             hlt        
