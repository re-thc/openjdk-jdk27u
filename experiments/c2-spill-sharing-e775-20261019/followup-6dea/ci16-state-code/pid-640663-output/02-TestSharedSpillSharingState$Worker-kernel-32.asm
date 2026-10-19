00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2003000000               cmp        dword ptr [r15 + 0x20], 3
00018 0f854c0e0000                   jne        0x7f60b3baeaea
0001e 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
00023 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00028 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002d 48894c2410                     mov        qword ptr [rsp + 0x10], rcx
00032 4889542418                     mov        qword ptr [rsp + 0x18], rdx
00037 448b5e04                       mov        r11d, dword ptr [rsi + 4]
0003b 4183fb17                       cmp        r11d, 0x17
0003f 0f86fb0b0000                   jbe        0x7f60b3bae8c0
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
00207 e8d43db7ff                     call       0x7f60b3721c60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00219 458b5204                       mov        r10d, dword ptr [r10 + 4]
0021d 413bea                         cmp        ebp, r10d
00220 0f839b020000                   jae        0x7f60b3bae141
00226 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0022b 458b54aa08                     mov        r10d, dword ptr [r10 + rbp*4 + 8]
00230 458bc2                         mov        r8d, r10d
00233 4181f05a5a5a5a                 xor        r8d, 0x5a5a5a5a
0023a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0023f 458b5b04                       mov        r11d, dword ptr [r11 + 4]
00243 4d63d2                         movsxd     r10, r10d
00246 4d8bca                         mov        r9, r10
00249 413beb                         cmp        ebp, r11d
0024c 0f83ee030000                   jae        0x7f60b3bae2c0
00252 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00257 458944aa08                     mov        dword ptr [r10 + rbp*4 + 8], r8d
0025c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00261 458b5204                       mov        r10d, dword ptr [r10 + 4]
00265 413bea                         cmp        ebp, r10d
00268 0f837e050000                   jae        0x7f60b3bae46c
0026e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00273 458b5204                       mov        r10d, dword ptr [r10 + 4]
00277 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0027c 4d635cab08                     movsxd     r11, dword ptr [r11 + rbp*4 + 8]
00281 413bea                         cmp        ebp, r10d
00284 0f83da060000                   jae        0x7f60b3bae5e4
0028a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0028f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00293 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00298 4d6344a808                     movsxd     r8, dword ptr [r8 + rbp*4 + 8]
0029d 4d03c3                         add        r8, r11
002a0 413bea                         cmp        ebp, r10d
002a3 0f8337080000                   jae        0x7f60b3bae760
002a9 be01000000                     mov        esi, 1
002ae 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
002b3 4d6354aa08                     movsxd     r10, dword ptr [r10 + rbp*4 + 8]
002b8 4d03d0                         add        r10, r8
002bb 4d03d1                         add        r10, r9
002be 4c891424                       mov        qword ptr [rsp], r10
002c2 90                             nop        
002c3 e8183db7ff                     call       0x7f60b3721c60
002c8 0f1f8400c0030001               nop        dword ptr [rax + rax + 0x10003c0]
002d0 4c8b942420010000               mov        r10, qword ptr [rsp + 0x120]
002d8 458b5204                       mov        r10d, dword ptr [r10 + 4]
002dc c4c1796ec2                     vmovd      xmm0, r10d
002e1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
002e6 49636caa08                     movsxd     rbp, dword ptr [r10 + rbp*4 + 8]
002eb 48332c24                       xor        rbp, qword ptr [rsp]
002ef c463fbf05c24403e               rorx       r11, qword ptr [rsp + 0x40], 0x3e
002f7 c463fbf04424483d               rorx       r8, qword ptr [rsp + 0x48], 0x3d
002ff c463fbf04c24503c               rorx       r9, qword ptr [rsp + 0x50], 0x3c
00307 c4e3fbf04c24583b               rorx       rcx, qword ptr [rsp + 0x58], 0x3b
0030f c4e3fbf05c24603a               rorx       rbx, qword ptr [rsp + 0x60], 0x3a
00317 c4e3fbf07c246839               rorx       rdi, qword ptr [rsp + 0x68], 0x39
0031f c4e3fbf09424f000000038         rorx       rdx, qword ptr [rsp + 0xf0], 0x38
0032a c4e3fbf074247037               rorx       rsi, qword ptr [rsp + 0x70], 0x37
00332 c4e3fbf044247836               rorx       rax, qword ptr [rsp + 0x78], 0x36
0033a c463fbf0ac248000000035         rorx       r13, qword ptr [rsp + 0x80], 0x35
00345 c463fbf0b4248800000034         rorx       r14, qword ptr [rsp + 0x88], 0x34
00350 c463fbf094249000000033         rorx       r10, qword ptr [rsp + 0x90], 0x33
0035b 4c891424                       mov        qword ptr [rsp], r10
0035f c463fbf094249800000032         rorx       r10, qword ptr [rsp + 0x98], 0x32
0036a 4c89542408                     mov        qword ptr [rsp + 8], r10
0036f c463fbf09424a000000031         rorx       r10, qword ptr [rsp + 0xa0], 0x31
0037a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0037f c463fbf09424a800000030         rorx       r10, qword ptr [rsp + 0xa8], 0x30
0038a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0038f c463fbf09424b00000002f         rorx       r10, qword ptr [rsp + 0xb0], 0x2f
0039a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0039f c463fbf09424b80000002e         rorx       r10, qword ptr [rsp + 0xb8], 0x2e
003aa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
003af c463fbf09424c00000002d         rorx       r10, qword ptr [rsp + 0xc0], 0x2d
003ba 4c89542430                     mov        qword ptr [rsp + 0x30], r10
003bf c463fbf09424c80000002c         rorx       r10, qword ptr [rsp + 0xc8], 0x2c
003ca 4c89542440                     mov        qword ptr [rsp + 0x40], r10
003cf c463fbf09424d00000002b         rorx       r10, qword ptr [rsp + 0xd0], 0x2b
003da 4c89542448                     mov        qword ptr [rsp + 0x48], r10
003df c463fbf09424d80000002a         rorx       r10, qword ptr [rsp + 0xd8], 0x2a
003ea 4c89542450                     mov        qword ptr [rsp + 0x50], r10
003ef c463fbf09424e000000029         rorx       r10, qword ptr [rsp + 0xe0], 0x29
003fa 4c89542458                     mov        qword ptr [rsp + 0x58], r10
003ff c463fbf09424e800000028         rorx       r10, qword ptr [rsp + 0xe8], 0x28
0040a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0040f c463fbf05424383f               rorx       r10, qword ptr [rsp + 0x38], 0x3f
00417 4903ea                         add        rbp, r10
0041a 4903eb                         add        rbp, r11
0041d 4903e8                         add        rbp, r8
00420 4903e9                         add        rbp, r9
00423 4803e9                         add        rbp, rcx
00426 4803eb                         add        rbp, rbx
00429 4803ef                         add        rbp, rdi
0042c 4803ea                         add        rbp, rdx
0042f 4803ee                         add        rbp, rsi
00432 4803e8                         add        rbp, rax
00435 4903ed                         add        rbp, r13
00438 4903ee                         add        rbp, r14
0043b 48032c24                       add        rbp, qword ptr [rsp]
0043f 48036c2408                     add        rbp, qword ptr [rsp + 8]
00444 48036c2410                     add        rbp, qword ptr [rsp + 0x10]
00449 48036c2418                     add        rbp, qword ptr [rsp + 0x18]
0044e 48036c2420                     add        rbp, qword ptr [rsp + 0x20]
00453 48036c2428                     add        rbp, qword ptr [rsp + 0x28]
00458 48036c2430                     add        rbp, qword ptr [rsp + 0x30]
0045d 48036c2440                     add        rbp, qword ptr [rsp + 0x40]
00462 48036c2448                     add        rbp, qword ptr [rsp + 0x48]
00467 48036c2450                     add        rbp, qword ptr [rsp + 0x50]
0046c 48036c2458                     add        rbp, qword ptr [rsp + 0x58]
00471 48036c2460                     add        rbp, qword ptr [rsp + 0x60]
00476 c4c1797ec2                     vmovd      r10d, xmm0
0047b 4183fa02                       cmp        r10d, 2
0047f 0f86fb070000                   jbe        0x7f60b3bae900
00485 4c8b842420010000               mov        r8, qword ptr [rsp + 0x120]
0048d 458b5008                       mov        r10d, dword ptr [r8 + 8]
00491 498b4208                       mov        rax, qword ptr [r10 + 8]
00495 458b580c                       mov        r11d, dword ptr [r8 + 0xc]
00499 4d8b5308                       mov        r10, qword ptr [r11 + 8]
0049d 458b5810                       mov        r11d, dword ptr [r8 + 0x10]
004a1 4d8b5b08                       mov        r11, qword ptr [r11 + 8]
004a5 4833c5                         xor        rax, rbp
004a8 4933c2                         xor        rax, r10
004ab 4933c3                         xor        rax, r11
004ae 4881c410010000                 add        rsp, 0x110
004b5 5d                             pop        rbp
004b6 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
004ba 0f8794090000                   ja         0x7f60b3baead4
004c0 c3                             ret        
004c1 bee4ffffff                     mov        esi, 0xffffffe4
004c6 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
004cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
004d0 4c891424                       mov        qword ptr [rsp], r10
004d4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
004d9 4c89542408                     mov        qword ptr [rsp + 8], r10
004de 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
004e8 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
004ed 4c89542420                     mov        qword ptr [rsp + 0x20], r10
004f2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
004f7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
004fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00501 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00506 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0050b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00510 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00515 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0051a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0051f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00524 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00529 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0052e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00533 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00538 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0053d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00542 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0054a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0054f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00557 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0055c 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00564 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0056c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00574 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0057c 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00584 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0058c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00594 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0059c 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
005a4 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
005ac 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
005b4 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
005bc 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
005c4 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
005cc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005d4 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
005dc 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
005e4 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
005ec 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
005f4 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
005fc 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00604 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0060c 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
00614 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0061c 90                             nop        
0061d 90                             nop        
0061e 90                             nop        
0061f e83c25aaff                     call       0x7f60b36507e0
00624 0f1f84001c070002               nop        dword ptr [rax + rax + 0x200071c]
0062c 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00636 4883e4f0                       and        rsp, 0xfffffffffffffff0
0063a e8b19a9d18                     call       0x7f60cc587d70
0063f f4                             hlt        
00640 bee4ffffff                     mov        esi, 0xffffffe4
00645 488b6c2410                     mov        rbp, qword ptr [rsp + 0x10]
0064a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0064f 4c891424                       mov        qword ptr [rsp], r10
00653 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00658 4c89542408                     mov        qword ptr [rsp + 8], r10
0065d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00662 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00667 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0066c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00671 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00676 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0067b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00680 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00685 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0068a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0068f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00694 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00699 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0069e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
006a3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
006a8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
006ad 4c8b9424f0000000               mov        r10, qword ptr [rsp + 0xf0]
006b5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
006ba 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
006bf 4c89542460                     mov        qword ptr [rsp + 0x60], r10
006c4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006c9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
006ce 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006d6 4c89542470                     mov        qword ptr [rsp + 0x70], r10
006db 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
006e3 4c89542478                     mov        qword ptr [rsp + 0x78], r10
006e8 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
006f0 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006f8 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00700 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00708 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00710 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00718 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00720 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00728 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00730 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00738 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00740 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00748 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00750 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00758 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00760 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00768 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00770 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00778 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00780 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00788 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00790 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
00798 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
007a0 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
007a8 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
007b0 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
007b8 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
007c0 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
007c8 90                             nop        
007c9 90                             nop        
007ca 90                             nop        
007cb e89023aaff                     call       0x7f60b36507e0
007d0 0f1f8400c8080003               nop        dword ptr [rax + rax + 0x30008c8]
007d8 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
007e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007e6 e805999d18                     call       0x7f60cc587d70
007eb f4                             hlt        
007ec bee4ffffff                     mov        esi, 0xffffffe4
007f1 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
007f6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
007fb 4c891424                       mov        qword ptr [rsp], r10
007ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00804 4c89542408                     mov        qword ptr [rsp + 8], r10
00809 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0080e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00813 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00818 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0081d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00822 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00827 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0082c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00831 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00836 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0083b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00840 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00845 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0084a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0084f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00854 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00859 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0085e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00863 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0086b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00870 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00878 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0087d 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00885 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0088a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00892 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0089a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
008a2 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
008aa 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
008b2 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
008ba 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
008c2 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
008ca 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
008d2 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
008da 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
008e2 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
008ea 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008f2 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
008fa 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00902 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0090a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00912 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0091a 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00922 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
0092a 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
00932 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
0093a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00942 90                             nop        
00943 e81822aaff                     call       0x7f60b36507e0
00948 0f1f8400400a0004               nop        dword ptr [rax + rax + 0x4000a40]
00950 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
0095a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0095e e88d979d18                     call       0x7f60cc587d70
00963 f4                             hlt        
00964 bee4ffffff                     mov        esi, 0xffffffe4
00969 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0096e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00973 4c891424                       mov        qword ptr [rsp], r10
00977 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0097c 4c89542408                     mov        qword ptr [rsp + 8], r10
00981 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00986 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0098b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00990 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00995 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0099a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0099f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
009a4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
009a9 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009ae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
009b3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
009b8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009bd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
009c2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009c7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
009cc 4c89542450                     mov        qword ptr [rsp + 0x50], r10
009d1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
009d6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
009db 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
009e3 4c89542460                     mov        qword ptr [rsp + 0x60], r10
009e8 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
009f0 4c89542468                     mov        qword ptr [rsp + 0x68], r10
009f5 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
009fd 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00a02 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00a0a 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00a0f 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a17 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00a1f 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a27 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00a2f 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00a37 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00a3f 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00a47 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00a4f 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00a57 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00a5f 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00a67 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00a6f 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00a77 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00a7f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00a87 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00a8f 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00a97 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00a9f 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
00aa7 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
00aaf 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
00ab7 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
00abf e89c20aaff                     call       0x7f60b36507e0
00ac4 0f1f8400bc0b0005               nop        dword ptr [rax + rax + 0x5000bbc]
00acc 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ada e811969d18                     call       0x7f60cc587d70
00adf f4                             hlt        
00ae0 bee4ffffff                     mov        esi, 0xffffffe4
00ae5 488b6c2430                     mov        rbp, qword ptr [rsp + 0x30]
00aea 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00aef 4c891424                       mov        qword ptr [rsp], r10
00af3 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00af8 4c89542408                     mov        qword ptr [rsp + 8], r10
00afd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00b02 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00b07 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00b0c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b11 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00b16 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00b1b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00b20 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00b25 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00b2a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00b2f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b34 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00b39 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00b3e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00b43 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00b48 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00b4d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00b55 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00b5a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00b62 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00b67 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00b6f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00b74 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00b7c 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00b81 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00b89 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00b8e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b96 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00b9e 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00ba6 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00bae 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00bb6 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00bbe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00bc6 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00bce 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bd6 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00bde 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00be6 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00bee 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bf6 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00bfe 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
00c06 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
00c0e 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
00c16 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00c1e 90                             nop        
00c1f e83c1faaff                     call       0x7f60b36507e0
00c24 0f1f84001c0d0006               nop        dword ptr [rax + rax + 0x6000d1c]
00c2c 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00c36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c3a e8b1949d18                     call       0x7f60cc587d70
00c3f f4                             hlt        
00c40 48891424                       mov        qword ptr [rsp], rdx
00c44 48894c2408                     mov        qword ptr [rsp + 8], rcx
00c49 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00c4e 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c53 4889742428                     mov        qword ptr [rsp + 0x28], rsi
00c58 bee4ffffff                     mov        esi, 0xffffffe4
00c5d 90                             nop        
00c5e 90                             nop        
00c5f e8fc1eaaff                     call       0x7f60b36507e0
00c64 0f1f84005c0d0007               nop        dword ptr [rax + rax + 0x7000d5c]
00c6c 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c7a e871949d18                     call       0x7f60cc587d70
00c7f f4                             hlt        
00c80 bee4ffffff                     mov        esi, 0xffffffe4
00c85 90                             nop        
00c86 90                             nop        
00c87 e8d41eaaff                     call       0x7f60b36507e0
00c8c 0f1f8400840d0008               nop        dword ptr [rax + rax + 0x8000d84]
00c94 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00c9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ca2 e849949d18                     call       0x7f60cc587d70
00ca7 f4                             hlt        
00ca8 488bf0                         mov        rsi, rax
00cab eb03                           jmp        0x7f60b3bae930
00cad 488bf0                         mov        rsi, rax
00cb0 4881c410010000                 add        rsp, 0x110
00cb7 5d                             pop        rbp
00cb8 e9a3caa9ff                     jmp        0x7f60b364b3e0
00cbd bef6ffffff                     mov        esi, 0xfffffff6
00cc2 90                             nop        
00cc3 e8981eaaff                     call       0x7f60b36507e0
00cc8 0f1f8400c00d0009               nop        dword ptr [rax + rax + 0x9000dc0]
00cd0 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00cda 4883e4f0                       and        rsp, 0xfffffffffffffff0
00cde e80d949d18                     call       0x7f60cc587d70
00ce3 f4                             hlt        
00ce4 bef6ffffff                     mov        esi, 0xfffffff6
00ce9 90                             nop        
00cea 90                             nop        
00ceb e8701eaaff                     call       0x7f60b36507e0
00cf0 0f1f8400e80d000a               nop        dword ptr [rax + rax + 0xa000de8]
00cf8 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00d02 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d06 e8e5939d18                     call       0x7f60cc587d70
00d0b f4                             hlt        
00d0c bef6ffffff                     mov        esi, 0xfffffff6
00d11 4489842420010000               mov        dword ptr [rsp + 0x120], r8d
00d19 90                             nop        
00d1a 90                             nop        
00d1b e8401eaaff                     call       0x7f60b36507e0
00d20 0f1f8400180e000b               nop        dword ptr [rax + rax + 0xb000e18]
00d28 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d36 e8b5939d18                     call       0x7f60cc587d70
00d3b f4                             hlt        
00d3c bef6ffffff                     mov        esi, 0xfffffff6
00d41 90                             nop        
00d42 90                             nop        
00d43 e8181eaaff                     call       0x7f60b36507e0
00d48 0f1f8400400e000c               nop        dword ptr [rax + rax + 0xc000e40]
00d50 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00d5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d5e e88d939d18                     call       0x7f60cc587d70
00d63 f4                             hlt        
00d64 bef6ffffff                     mov        esi, 0xfffffff6
00d69 90                             nop        
00d6a 90                             nop        
00d6b e8f01daaff                     call       0x7f60b36507e0
00d70 0f1f8400680e000d               nop        dword ptr [rax + rax + 0xd000e68]
00d78 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00d82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d86 e865939d18                     call       0x7f60cc587d70
00d8b f4                             hlt        
00d8c bef6ffffff                     mov        esi, 0xfffffff6
00d91 90                             nop        
00d92 90                             nop        
00d93 e8c81daaff                     call       0x7f60b36507e0
00d98 0f1f8400900e000e               nop        dword ptr [rax + rax + 0xe000e90]
00da0 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00daa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dae e83d939d18                     call       0x7f60cc587d70
00db3 f4                             hlt        
00db4 bef6ffffff                     mov        esi, 0xfffffff6
00db9 90                             nop        
00dba 90                             nop        
00dbb e8a01daaff                     call       0x7f60b36507e0
00dc0 0f1f8400b80e000f               nop        dword ptr [rax + rax + 0xf000eb8]
00dc8 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dd6 e815939d18                     call       0x7f60cc587d70
00ddb f4                             hlt        
00ddc bef6ffffff                     mov        esi, 0xfffffff6
00de1 90                             nop        
00de2 90                             nop        
00de3 e8781daaff                     call       0x7f60b36507e0
00de8 0f1f8400e00e0010               nop        dword ptr [rax + rax + 0x10000ee0]
00df0 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00dfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00dfe e8ed929d18                     call       0x7f60cc587d70
00e03 f4                             hlt        
00e04 bef6ffffff                     mov        esi, 0xfffffff6
00e09 90                             nop        
00e0a 90                             nop        
00e0b e8501daaff                     call       0x7f60b36507e0
00e10 0f1f8400080f0011               nop        dword ptr [rax + rax + 0x11000f08]
00e18 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00e22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e26 e8c5929d18                     call       0x7f60cc587d70
00e2b f4                             hlt        
00e2c bef6ffffff                     mov        esi, 0xfffffff6
00e31 90                             nop        
00e32 90                             nop        
00e33 e8281daaff                     call       0x7f60b36507e0
00e38 0f1f8400300f0012               nop        dword ptr [rax + rax + 0x12000f30]
00e40 48bfc0b3068c607f0000           movabs     rdi, 0x7f608c06b3c0
00e4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e4e e89d929d18                     call       0x7f60cc587d70
00e53 f4                             hlt        
00e54 49ba36e1bab3607f0000           movabs     r10, 0x7f60b3bae136
00e5e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
00e65 e97658b7ff                     jmp        0x7f60b3724360
00e6a e87128b6ff                     call       0x7f60b3711360
00e6f e9aaf1ffff                     jmp        0x7f60b3badc9e
00e74 f4                             hlt        
00e75 f4                             hlt        
00e76 f4                             hlt        
00e77 f4                             hlt        
