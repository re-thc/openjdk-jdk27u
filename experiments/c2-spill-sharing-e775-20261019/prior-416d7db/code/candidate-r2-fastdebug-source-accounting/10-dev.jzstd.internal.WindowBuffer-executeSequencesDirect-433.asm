00000 e84b5ed618                     call       0x7f63f495ad50
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 90                             nop        
00010 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85342b0000                   jne        0x7f63dbbf7a62
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b36                         mov        r14d, dword ptr [rsi]
00049 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00050 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00055 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00061 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00068 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0006d 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00074 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00079 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00080 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00085 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0008c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00091 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00097 8baef0000000                   mov        ebp, dword ptr [rsi + 0xf0]
0009d 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000a9 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000b5 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000bc 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000c4 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000d3 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
000df 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000e3 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
000eb 448b6e68                       mov        r13d, dword ptr [rsi + 0x68]
000ef 448b5e48                       mov        r11d, dword ptr [rsi + 0x48]
000f3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
000fb 448b5610                       mov        r10d, dword ptr [rsi + 0x10]
000ff 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00107 448b5e08                       mov        r11d, dword ptr [rsi + 8]
0010b 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00113 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
0011a 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00122 488bfe                         mov        rdi, rsi
00125 c5f877                         vzeroupper 
00128 49ba3083b1f4637f0000           movabs     r10, 0x7f63f4b18330
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f8431190000                   je         0x7f63dbbf697c
0014b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0014f 41c1eb0a                       shr        r11d, 0xa
00153 4181fb2c080000                 cmp        r11d, 0x82c
0015a 0f8568220000                   jne        0x7f63dbbf72c8
00160 4c891424                       mov        qword ptr [rsp], r10
00164 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00169 4d85d2                         test       r10, r10
0016c 0f8416190000                   je         0x7f63dbbf6988
00172 458b5204                       mov        r10d, dword ptr [r10 + 4]
00176 41c1ea0a                       shr        r10d, 0xa
0017a 4181fa0a020000                 cmp        r10d, 0x20a
00181 0f8541220000                   jne        0x7f63dbbf72c8
00187 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0018c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00194 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00199 4d85d2                         test       r10, r10
0019c 0f84f6180000                   je         0x7f63dbbf6998
001a2 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a6 41c1eb0a                       shr        r11d, 0xa
001aa 4181fb10020000                 cmp        r11d, 0x210
001b1 0f8511220000                   jne        0x7f63dbbf72c8
001b7 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001bf 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c4 4d85d2                         test       r10, r10
001c7 0f84db180000                   je         0x7f63dbbf69a8
001cd 458b5204                       mov        r10d, dword ptr [r10 + 4]
001d1 41c1ea0a                       shr        r10d, 0xa
001d5 4181fa0e020000                 cmp        r10d, 0x20e
001dc 0f85e6210000                   jne        0x7f63dbbf72c8
001e2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ec 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f1 4d85d2                         test       r10, r10
001f4 0f84bb180000                   je         0x7f63dbbf69b5
001fa 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001fe 41c1eb0a                       shr        r11d, 0xa
00202 4181fb0e020000                 cmp        r11d, 0x20e
00209 0f85b9210000                   jne        0x7f63dbbf72c8
0020f 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00217 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0021c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00220 41c1ea0a                       shr        r10d, 0xa
00224 4181fa0a020000                 cmp        r10d, 0x20a
0022b 0f8597210000                   jne        0x7f63dbbf72c8
00231 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00236 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0023e 458b5208                       mov        r10d, dword ptr [r10 + 8]
00242 4489542408                     mov        dword ptr [rsp + 8], r10d
00247 4183c2f9                       add        r10d, -7
0024b 4585d2                         test       r10d, r10d
0024e 0f8cd0210000                   jl         0x7f63dbbf7324
00254 448b542408                     mov        r10d, dword ptr [rsp + 8]
00259 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0025e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00263 4183c3f1                       add        r11d, -0xf
00267 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026c 4183c2f9                       add        r10d, -7
00270 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00278 e903020000                     jmp        0x7f63dbbf5380
0027d 448bdd                         mov        r11d, ebp
00280 4d63d3                         movsxd     r10, r11d
00283 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0028a c442a8f5db                     bzhi       r11, r11, r10
0028f c4c1fb92fb                     kmovq      k7, r11
00294 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0029a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
002a0 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002a8 4403dd                         add        r11d, ebp
002ab 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
002b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002b7 418502                         test       dword ptr [r10], eax
002ba 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002c2 0f8d80090000                   jge        0x7f63dbbf5b48
002c8 418bde                         mov        ebx, r14d
002cb 448bc3                         mov        r8d, ebx
002ce 442b8424cc000000               sub        r8d, dword ptr [rsp + 0xcc]
002d6 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
002dd 2bac24cc000000                 sub        ebp, dword ptr [rsp + 0xcc]
002e4 3bac24cc000000                 cmp        ebp, dword ptr [rsp + 0xcc]
002eb 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
002f3 410f4fea                       cmovg      ebp, r10d
002f7 4585c0                         test       r8d, r8d
002fa 0f8cc5170000                   jl         0x7f63dbbf69c5
00300 85db                           test       ebx, ebx
00302 0f8cbd170000                   jl         0x7f63dbbf69c5
00308 458d1c28                       lea        r11d, [r8 + rbp]
0030c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00311 453bd3                         cmp        r10d, r11d
00314 0f82ab170000                   jb         0x7f63dbbf69c5
0031a 448d342b                       lea        r14d, [rbx + rbp]
0031e 453bd6                         cmp        r10d, r14d
00321 0f829e170000                   jb         0x7f63dbbf69c5
00327 85ed                           test       ebp, ebp
00329 0f8c96170000                   jl         0x7f63dbbf69c5
0032f 85ed                           test       ebp, ebp
00331 0f8469ffffff                   je         0x7f63dbbf51a0
00337 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0033f 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00344 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00349 4863d5                         movsxd     rdx, ebp
0034c 4883fa20                       cmp        rdx, 0x20
00350 0f8627ffffff                   jbe        0x7f63dbbf517d
00356 c5f877                         vzeroupper 
00359 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00363 41ffd2                         call       r10
00366 0f1f840000000000               nop        dword ptr [rax + rax]
0036e e92dffffff                     jmp        0x7f63dbbf51a0
00373 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0037b 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00383 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0038a 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00391 4103da                         add        ebx, r10d
00394 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00399 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0039e 418bca                         mov        ecx, r10d
003a1 e96a020000                     jmp        0x7f63dbbf5510
003a6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003ae 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
003b3 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003bb 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
003c0 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003c8 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
003d0 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003d8 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003e0 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
003e8 0f8ce1050000                   jl         0x7f63dbbf58cf
003ee 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003f6 4183fa30                       cmp        r10d, 0x30
003fa 7e74                           jle        0x7f63dbbf5370
003fc 4585f6                         test       r14d, r14d
003ff 0f8c5f170000                   jl         0x7f63dbbf6a64
00405 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0040d 4585db                         test       r11d, r11d
00410 0f8c4e170000                   jl         0x7f63dbbf6a64
00416 4503d6                         add        r10d, r14d
00419 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0041e 453bda                         cmp        r11d, r10d
00421 0f823d170000                   jb         0x7f63dbbf6a64
00427 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0042f 0f822f170000                   jb         0x7f63dbbf6a64
00435 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0043d 4585d2                         test       r10d, r10d
00440 0f8425010000                   je         0x7f63dbbf546b
00446 4963d2                         movsxd     rdx, r10d
00449 4883fa20                       cmp        rdx, 0x20
0044d 0f86f5000000                   jbe        0x7f63dbbf5448
00453 c5f877                         vzeroupper 
00456 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00460 41ffd2                         call       r10
00463 0f1f840000000000               nop        dword ptr [rax + rax]
0046b e9fb000000                     jmp        0x7f63dbbf546b
00470 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00475 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0047c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00480 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
00488 0f8396140000                   jae        0x7f63dbbf6824
0048e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00496 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
0049b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004a3 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004ab 0f83ff140000                   jae        0x7f63dbbf68b0
004b1 4183c608                       add        r14d, 8
004b5 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
004b9 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004c1 4f8944110c                     mov        qword ptr [r9 + r10 + 0xc], r8
004c6 4183c208                       add        r10d, 8
004ca 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
004d2 418503                         test       dword ptr [r11], eax
004d5 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
004dd 7d60                           jge        0x7f63dbbf543f
004df 90                             nop        
004e0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004e8 0f8336140000                   jae        0x7f63dbbf6824
004ee 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004f6 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
004fb 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00503 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0050b 0f839f140000                   jae        0x7f63dbbf68b0
00511 4183c608                       add        r14d, 8
00515 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00519 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00521 4f8944190c                     mov        qword ptr [r9 + r11 + 0xc], r8
00526 4183c308                       add        r11d, 8
0052a 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00532 418502                         test       dword ptr [r10], eax
00535 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0053d 7ca1                           jl         0x7f63dbbf53e0
0053f 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
00546 eb33                           jmp        0x7f63dbbf547b
00548 458bda                         mov        r11d, r10d
0054b 4d63d3                         movsxd     r10, r11d
0054e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00555 c442a8f5db                     bzhi       r11, r11, r10
0055a c4c1fb92fb                     kmovq      k7, r11
0055f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00565 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0056b 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00570 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00577 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
0057b 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00583 458b5208                       mov        r10d, dword ptr [r10 + 8]
00587 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0058c 4585c0                         test       r8d, r8d
0058f 0f8c9f140000                   jl         0x7f63dbbf6934
00595 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0059d 458b4b08                       mov        r9d, dword ptr [r11 + 8]
005a1 4183f901                       cmp        r9d, 1
005a5 0f8689140000                   jbe        0x7f63dbbf6934
005ab 4183f902                       cmp        r9d, 2
005af 0f867f140000                   jbe        0x7f63dbbf6934
005b5 4585c9                         test       r9d, r9d
005b8 0f8676140000                   jbe        0x7f63dbbf6934
005be 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
005c6 458b4308                       mov        r8d, dword ptr [r11 + 8]
005ca 458d58f1                       lea        r11d, [r8 - 0xf]
005ce 4585db                         test       r11d, r11d
005d1 0f8c5d140000                   jl         0x7f63dbbf6934
005d7 8b7c2408                       mov        edi, dword ptr [rsp + 8]
005db 458bd8                         mov        r11d, r8d
005de 448d77f1                       lea        r14d, [rdi - 0xf]
005e2 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
005ea 458d73f1                       lea        r14d, [r11 - 0xf]
005ee 8bcd                           mov        ecx, ebp
005f0 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
005f5 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
005fa 4489442434                     mov        dword ptr [rsp + 0x34], r8d
005ff 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00603 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00608 4489b42498000000               mov        dword ptr [rsp + 0x98], r14d
00610 4d8b4730                       mov        r8, qword ptr [r15 + 0x30]
00614 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00619 442bd1                         sub        r10d, ecx
0061c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00624 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
00629 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00631 498d7c090c                     lea        rdi, [r9 + rcx + 0xc]
00636 458d5d01                       lea        r11d, [r13 + 1]
0063a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0063f 418500                         test       dword ptr [r8], eax
00642 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00647 0f8d9b070000                   jge        0x7f63dbbf5ce8
0064d 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00652 0f83ee0e0000                   jae        0x7f63dbbf6446
00658 4d63dd                         movsxd     r11, r13d
0065b 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
00663 4f8b44d818                     mov        r8, qword ptr [r8 + r11*8 + 0x18]
00668 458bd8                         mov        r11d, r8d
0066b 4181e3ffff0100                 and        r11d, 0x1ffff
00672 418bc3                         mov        eax, r11d
00675 4d8bd8                         mov        r11, r8
00678 49c1eb12                       shr        r11, 0x12
0067c 49c1f824                       sar        r8, 0x24
00680 458bdb                         mov        r11d, r11d
00683 458bc0                         mov        r8d, r8d
00686 418bd0                         mov        edx, r8d
00689 4181e3ffff0300                 and        r11d, 0x3ffff
00690 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00698 4585c0                         test       r8d, r8d
0069b 0f8cc7100000                   jl         0x7f63dbbf6668
006a1 448bd8                         mov        r11d, eax
006a4 4585db                         test       r11d, r11d
006a7 0f8517020000                   jne        0x7f63dbbf57c4
006ad 4533d2                         xor        r10d, r10d
006b0 418bc2                         mov        eax, r10d
006b3 4183f803                       cmp        r8d, 3
006b7 0f8e72020000                   jle        0x7f63dbbf582f
006bd 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006c5 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
006c9 45895a14                       mov        dword ptr [r10 + 0x14], r11d
006cd 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006d1 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006d9 45895310                       mov        dword ptr [r11 + 0x10], r10d
006dd 458d50fd                       lea        r10d, [r8 - 3]
006e1 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
006e9 4589530c                       mov        dword ptr [r11 + 0xc], r10d
006ed 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
006f5 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
006fa 4c63d3                         movsxd     r10, ebx
006fd 4c03542478                     add        r10, qword ptr [rsp + 0x78]
00702 4863d0                         movsxd     rdx, eax
00705 4c03d2                         add        r10, rdx
00708 493bea                         cmp        rbp, r10
0070b 0f8fbf100000                   jg         0x7f63dbbf66d0
00711 448d2c03                       lea        r13d, [rbx + rax]
00715 458bf5                         mov        r14d, r13d
00718 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00720 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00728 4585c0                         test       r8d, r8d
0072b 0f84cf010000                   je         0x7f63dbbf5800
00731 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
00739 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00741 4585db                         test       r11d, r11d
00744 0f8eea0f0000                   jle        0x7f63dbbf6634
0074a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00752 4503d5                         add        r10d, r13d
00755 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0075d 0f8fd9100000                   jg         0x7f63dbbf673c
00763 448d1401                       lea        r10d, [rcx + rax]
00767 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0076c 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00774 0f8f32110000                   jg         0x7f63dbbf67ac
0077a 83f810                         cmp        eax, 0x10
0077d 0f8fda040000                   jg         0x7f63dbbf5b5d
00783 448bd1                         mov        r10d, ecx
00786 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0078d 0f831d0e0000                   jae        0x7f63dbbf64b0
00793 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0079b c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
007a2 3b9c24d0000000                 cmp        ebx, dword ptr [rsp + 0xd0]
007a9 0f83790e0000                   jae        0x7f63dbbf6528
007af 468d1c10                       lea        r11d, [rax + r10]
007b3 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
007b8 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007c0 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
007c7 448d1418                       lea        r10d, [rax + rbx]
007cb 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
007d3 458bf2                         mov        r14d, r10d
007d6 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
007de 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007e6 4183fb10                       cmp        r11d, 0x10
007ea 0f8fb6fbffff                   jg         0x7f63dbbf52a6
007f0 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
007f8 4183fb10                       cmp        r11d, 0x10
007fc 0f8ca4fbffff                   jl         0x7f63dbbf52a6
00802 443bb424d0000000               cmp        r14d, dword ptr [rsp + 0xd0]
0080a 0f83b40e0000                   jae        0x7f63dbbf65c4
00810 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00818 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
0081f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00827 443b9c24d0000000               cmp        r11d, dword ptr [rsp + 0xd0]
0082f 0f823efbffff                   jb         0x7f63dbbf5273
00835 bee4ffffff                     mov        esi, 0xffffffe4
0083a 488b2c24                       mov        rbp, qword ptr [rsp]
0083e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00843 44895c2408                     mov        dword ptr [rsp + 8], r11d
00848 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0084d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00852 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00857 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0085c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00861 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00866 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0086b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00870 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00878 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0087d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00885 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0088a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0088f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00894 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0089d 90                             nop        
0089e 90                             nop        
0089f 90                             nop        
008a0 c5f877                         vzeroupper 
008a3 e8b84fafff                     call       0x7f63db6ea760
008a8 0f1f8400a0090004               nop        dword ptr [rax + rax + 0x40009a0]
008b0 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
008ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
008be e83db1b318                     call       0x7f63f4730900
008c3 f4                             hlt        
008c4 453bda                         cmp        r11d, r10d
008c7 0f8ee6fdffff                   jle        0x7f63dbbf55b3
008cd be45ffffff                     mov        esi, 0xffffff45
008d2 418beb                         mov        ebp, r11d
008d5 44891424                       mov        dword ptr [rsp], r10d
008d9 90                             nop        
008da 90                             nop        
008db 90                             nop        
008dc c5f877                         vzeroupper 
008df e87c4fafff                     call       0x7f63db6ea760
008e4 0f1f8400dc090005               nop        dword ptr [rax + rax + 0x50009dc]
008ec 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
008f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008fa e801b1b318                     call       0x7f63f4730900
008ff f4                             hlt        
00900 4d63de                         movsxd     r11, r14d
00903 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0090b 0f8cdb120000                   jl         0x7f63dbbf6aec
00911 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
00919 0f8f41130000                   jg         0x7f63dbbf6b60
0091f 4533c0                         xor        r8d, r8d
00922 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
0092a e90afeffff                     jmp        0x7f63dbbf5639
0092f 85c0                           test       eax, eax
00931 7407                           je         0x7f63dbbf583a
00933 458d50ff                       lea        r10d, [r8 - 1]
00937 418bd2                         mov        edx, r10d
0093a 85d2                           test       edx, edx
0093c 750e                           jne        0x7f63dbbf584c
0093e 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00946 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0094a eb76                           jmp        0x7f63dbbf58c2
0094c 83fa03                         cmp        edx, 3
0094f 0f84e7150000                   je         0x7f63dbbf6e3c
00955 83fa02                         cmp        edx, 2
00958 0f875a160000                   ja         0x7f63dbbf6eb8
0095e 3b542430                       cmp        edx, dword ptr [rsp + 0x30]
00962 0f83ca140000                   jae        0x7f63dbbf6d32
00968 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00970 458b54930c                     mov        r10d, dword ptr [r11 + rdx*4 + 0xc]
00975 85d2                           test       edx, edx
00977 7e3d                           jle        0x7f63dbbf58b6
00979 448d42ff                       lea        r8d, [rdx - 1]
0097d 443b442430                     cmp        r8d, dword ptr [rsp + 0x30]
00982 0f8334150000                   jae        0x7f63dbbf6dbc
00988 90                             nop        
00989 90                             nop        
0098a 90                             nop        
0098b 90                             nop        
0098c 90                             nop        
0098d 90                             nop        
0098e 90                             nop        
0098f 90                             nop        
00990 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00998 458b449008                     mov        r8d, dword ptr [r8 + rdx*4 + 8]
0099d 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009a5 458944910c                     mov        dword ptr [r9 + rdx*4 + 0xc], r8d
009aa 448d5aff                       lea        r11d, [rdx - 1]
009ae 418bd3                         mov        edx, r11d
009b1 4585db                         test       r11d, r11d
009b4 7fda                           jg         0x7f63dbbf5890
009b6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009be 4589530c                       mov        dword ptr [r11 + 0xc], r10d
009c2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009ca e91efdffff                     jmp        0x7f63dbbf55ed
009cf 4183fb10                       cmp        r11d, 0x10
009d3 0f8d93190000                   jge        0x7f63dbbf726c
009d9 4183fb08                       cmp        r11d, 8
009dd 0f8d45070000                   jge        0x7f63dbbf6028
009e3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009eb 4183fb10                       cmp        r11d, 0x10
009ef 0f8eb6000000                   jle        0x7f63dbbf59ab
009f5 4585f6                         test       r14d, r14d
009f8 0f8cda180000                   jl         0x7f63dbbf71d8
009fe 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a06 4585d2                         test       r10d, r10d
00a09 0f8cc9180000                   jl         0x7f63dbbf71d8
00a0f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a14 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00a1c 0f82b6180000                   jb         0x7f63dbbf71d8
00a22 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a29 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a30 443bdb                         cmp        r11d, ebx
00a33 0f829f180000                   jb         0x7f63dbbf71d8
00a39 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a41 4585d2                         test       r10d, r10d
00a44 0f8c8e180000                   jl         0x7f63dbbf71d8
00a4a 4585d2                         test       r10d, r10d
00a4d 0f8478f8ffff                   je         0x7f63dbbf51cb
00a53 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
00a58 4883fd20                       cmp        rbp, 0x20
00a5c 772d                           ja         0x7f63dbbf598b
00a5e 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00a66 4d63d3                         movsxd     r10, r11d
00a69 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a70 c442a8f5db                     bzhi       r11, r11, r10
00a75 c4c1fb92fb                     kmovq      k7, r11
00a7a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a80 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a86 e940f8ffff                     jmp        0x7f63dbbf51cb
00a8b 488bd5                         mov        rdx, rbp
00a8e c5f877                         vzeroupper 
00a91 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00a9b 41ffd2                         call       r10
00a9e 0f1f840000000000               nop        dword ptr [rax + rax]
00aa6 e920f8ffff                     jmp        0x7f63dbbf51cb
00aab 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ab0 0f837e150000                   jae        0x7f63dbbf6f34
00ab6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00abe 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
00ac4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00acc 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00ad1 0f83f5150000                   jae        0x7f63dbbf6fcc
00ad7 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00adf 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ae7 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00aec 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00af4 41ffc1                         inc        r9d
00af7 458d5e03                       lea        r11d, [r14 + 3]
00afb 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b00 0f8342160000                   jae        0x7f63dbbf7048
00b06 4d63de                         movsxd     r11, r14d
00b09 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b0f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b17 4183c203                       add        r10d, 3
00b1b 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b20 0f83b6160000                   jae        0x7f63dbbf70dc
00b26 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
00b2e 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00b36 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00b3b 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00b41 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00b49 478844110e                     mov        byte ptr [r9 + r10 + 0xe], r8b
00b4e 470fbe5c190f                   movsx      r11d, byte ptr [r9 + r11 + 0xf]
00b54 47885c110f                     mov        byte ptr [r9 + r10 + 0xf], r11b
00b59 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00b61 4183fa08                       cmp        r10d, 8
00b65 0f83f5160000                   jae        0x7f63dbbf7160
00b6b 49baf0ef2fe300000000           movabs     r10, 0xe32feff0
00b75 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b7d 4703749a0c                     add        r14d, dword ptr [r10 + r11*4 + 0xc]
00b82 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00b87 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b8f 4183fb04                       cmp        r11d, 4
00b93 7e43                           jle        0x7f63dbbf5ad8
00b95 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b9c 83c504                         add        ebp, 4
00b9f 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00ba7 418bd6                         mov        edx, r14d
00baa 90                             nop        
00bab 90                             nop        
00bac c5f877                         vzeroupper 
00baf e8ace1b4ff                     call       0x7f63db743c60
00bb4 0f1f8400ac0c0006               nop        dword ptr [rax + rax + 0x6000cac]
00bbc 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bc4 8bd5                           mov        edx, ebp
00bc6 8bc8                           mov        ecx, eax
00bc8 c5f877                         vzeroupper 
00bcb e890e1b4ff                     call       0x7f63db743c60
00bd0 0f1f8400c80c0007               nop        dword ptr [rax + rax + 0x7000cc8]
00bd8 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00be0 4183fa08                       cmp        r10d, 8
00be4 7e62                           jle        0x7f63dbbf5b48
00be6 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00bea 49ba20f02fe300000000           movabs     r10, 0xe32ff020
00bf4 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00bfc 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00c01 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c08 83c508                         add        ebp, 8
00c0b 83c208                         add        edx, 8
00c0e 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c16 90                             nop        
00c17 90                             nop        
00c18 c5f877                         vzeroupper 
00c1b e840e1b4ff                     call       0x7f63db743c60
00c20 0f1f8400180d0008               nop        dword ptr [rax + rax + 0x8000d18]
00c28 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c30 8bd5                           mov        edx, ebp
00c32 488bc8                         mov        rcx, rax
00c35 90                             nop        
00c36 90                             nop        
00c37 90                             nop        
00c38 c5f877                         vzeroupper 
00c3b e820e1b4ff                     call       0x7f63db743c60
00c40 0f1f8400380d0009               nop        dword ptr [rax + rax + 0x9000d38]
00c48 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00c4d 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c54 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00c58 e91ef9ffff                     jmp        0x7f63dbbf547b
00c5d 83f830                         cmp        eax, 0x30
00c60 0f8e80000000                   jle        0x7f63dbbf5be6
00c66 85c9                           test       ecx, ecx
00c68 0f8c8a190000                   jl         0x7f63dbbf74f8
00c6e 85db                           test       ebx, ebx
00c70 0f8c82190000                   jl         0x7f63dbbf74f8
00c76 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00c7a 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00c7e 0f8274190000                   jb         0x7f63dbbf74f8
00c84 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00c89 453bdd                         cmp        r11d, r13d
00c8c 0f8266190000                   jb         0x7f63dbbf74f8
00c92 85c0                           test       eax, eax
00c94 7429                           je         0x7f63dbbf5bbf
00c96 4883fa20                       cmp        rdx, 0x20
00c9a 7730                           ja         0x7f63dbbf5bcc
00c9c 448bd0                         mov        r10d, eax
00c9f 4d63d2                         movsxd     r10, r10d
00ca2 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ca9 c442a8f5db                     bzhi       r11, r11, r10
00cae c4c1fb92fb                     kmovq      k7, r11
00cb3 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cb9 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cbf 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00cc7 e912fbffff                     jmp        0x7f63dbbf56de
00ccc c5f877                         vzeroupper 
00ccf 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00cd9 41ffd2                         call       r10
00cdc 0f1f840000000000               nop        dword ptr [rax + rax]
00ce4 ebd9                           jmp        0x7f63dbbf5bbf
00ce6 448bc1                         mov        r8d, ecx
00ce9 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
00cf0 0f83c2170000                   jae        0x7f63dbbf73b8
00cf6 4d63c8                         movsxd     r9, r8d
00cf9 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d01 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00d08 3b9c24d0000000                 cmp        ebx, dword ptr [rsp + 0xd0]
00d0f 0f8333180000                   jae        0x7f63dbbf7448
00d15 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00d1a 448d5310                       lea        r10d, [rbx + 0x10]
00d1e 418bd2                         mov        edx, r10d
00d21 4c63db                         movsxd     r11, ebx
00d24 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00d2c c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00d33 448bd2                         mov        r10d, edx
00d36 453bd5                         cmp        r10d, r13d
00d39 0f8dcf030000                   jge        0x7f63dbbf600e
00d3f 4d2bcb                         sub        r9, r11
00d42 4d63da                         movsxd     r11, r10d
00d45 48634c2444                     movsxd     rcx, dword ptr [rsp + 0x44]
00d4a 4883c1f1                       add        rcx, -0xf
00d4e 4f8d040b                       lea        r8, [r11 + r9]
00d52 4c3bc1                         cmp        r8, rcx
00d55 0f8331190000                   jae        0x7f63dbbf758c
00d5b 4963fd                         movsxd     rdi, r13d
00d5e 4c8bc7                         mov        r8, rdi
00d61 4d2bc3                         sub        r8, r11
00d64 4983c00f                       add        r8, 0xf
00d68 4983e0f0                       and        r8, 0xfffffffffffffff0
00d6c 458bd8                         mov        r11d, r8d
00d6f 458d441b10                     lea        r8d, [r11 + rbx + 0x10]
00d74 4d63d8                         movsxd     r11, r8d
00d77 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
00d7c 4c3bc1                         cmp        r8, rcx
00d7f 0f8307190000                   jae        0x7f63dbbf758c
00d85 443b9424d0000000               cmp        r10d, dword ptr [rsp + 0xd0]
00d8d 0f83f9180000                   jae        0x7f63dbbf758c
00d93 4983c3f0                       add        r11, -0x10
00d97 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
00d9c 4983c2f1                       add        r10, -0xf
00da0 4d3bda                         cmp        r11, r10
00da3 0f83e3180000                   jae        0x7f63dbbf758c
00da9 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00db0 0f8f42190000                   jg         0x7f63dbbf75f8
00db6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00dbb 442bd3                         sub        r10d, ebx
00dbe 83c320                         add        ebx, 0x20
00dc1 e9a9000000                     jmp        0x7f63dbbf5d6f
00dc6 4d63d2                         movsxd     r10, r10d
00dc9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dd0 c442a8f5db                     bzhi       r11, r11, r10
00dd5 c4c1fb92fb                     kmovq      k7, r11
00dda 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00de0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de6 eb66                           jmp        0x7f63dbbf5d4e
00de8 85c9                           test       ecx, ecx
00dea 0f8c8c160000                   jl         0x7f63dbbf737c
00df0 85db                           test       ebx, ebx
00df2 0f8c84160000                   jl         0x7f63dbbf737c
00df8 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00dfd 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00e02 0f8274160000                   jb         0x7f63dbbf737c
00e08 428d2c13                       lea        ebp, [rbx + r10]
00e0c 448b442408                     mov        r8d, dword ptr [rsp + 8]
00e11 443bc5                         cmp        r8d, ebp
00e14 0f8262160000                   jb         0x7f63dbbf737c
00e1a 4585d2                         test       r10d, r10d
00e1d 0f8c59160000                   jl         0x7f63dbbf737c
00e23 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e28 443bc1                         cmp        r8d, ecx
00e2b 7421                           je         0x7f63dbbf5d4e
00e2d 4963d2                         movsxd     rdx, r10d
00e30 4883fa20                       cmp        rdx, 0x20
00e34 7690                           jbe        0x7f63dbbf5cc6
00e36 c5f877                         vzeroupper 
00e39 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00e43 41ffd2                         call       r10
00e46 0f1f840000000000               nop        dword ptr [rax + rax]
00e4e 4c8b1424                       mov        r10, qword ptr [rsp]
00e52 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00e56 c5f877                         vzeroupper 
00e59 4881c4f0000000                 add        rsp, 0xf0
00e60 5d                             pop        rbp
00e61 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e65 0f87e11c0000                   ja         0x7f63dbbf7a4c
00e6b c3                             ret        
00e6c 418bd0                         mov        edx, r8d
00e6f 458d1c12                       lea        r11d, [r10 + rdx]
00e73 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00e7b c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00e82 448bc2                         mov        r8d, edx
00e85 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00e8d c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00e94 448d4210                       lea        r8d, [rdx + 0x10]
00e98 443bc3                         cmp        r8d, ebx
00e9b 7ccf                           jl         0x7f63dbbf5d6c
00e9d 4881c710ffffff                 add        rdi, -0xf0
00ea4 4881ff00000080                 cmp        rdi, -0x80000000
00eab 49c7c300000080                 mov        r11, 0xffffffff80000000
00eb2 490f4cfb                       cmovl      rdi, r11
00eb6 8bff                           mov        edi, edi
00eb8 443bc7                         cmp        r8d, edi
00ebb 0f8dfa010000                   jge        0x7f63dbbf5fbb
00ec1 4d63d8                         movsxd     r11, r8d
00ec4 4d03d9                         add        r11, r9
00ec7 4c3bd9                         cmp        r11, rcx
00eca 0f8394180000                   jae        0x7f63dbbf7664
00ed0 448d9a00010000                 lea        r11d, [rdx + 0x100]
00ed7 4963db                         movsxd     rbx, r11d
00eda 4903d9                         add        rbx, r9
00edd 483bd9                         cmp        rbx, rcx
00ee0 0f8392180000                   jae        0x7f63dbbf7678
00ee6 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00eee 0f8398180000                   jae        0x7f63dbbf768c
00ef4 443b9c24d0000000               cmp        r11d, dword ptr [rsp + 0xd0]
00efc 0f839e180000                   jae        0x7f63dbbf76a0
00f02 90                             nop        
00f03 90                             nop        
00f04 90                             nop        
00f05 90                             nop        
00f06 90                             nop        
00f07 90                             nop        
00f08 90                             nop        
00f09 90                             nop        
00f0a 90                             nop        
00f0b 90                             nop        
00f0c 90                             nop        
00f0d 90                             nop        
00f0e 90                             nop        
00f0f 90                             nop        
00f10 438d1c02                       lea        ebx, [r10 + r8]
00f14 458bd8                         mov        r11d, r8d
00f17 4963f3                         movsxd     rsi, r11d
00f1a 8bd3                           mov        edx, ebx
00f1c 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f24 c4c17a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xc]
00f2b 4863db                         movsxd     rbx, ebx
00f2e 458bd8                         mov        r11d, r8d
00f31 488b9424c0000000               mov        rdx, qword ptr [rsp + 0xc0]
00f39 c4a17a7f441a0c                 vmovdqu    xmmword ptr [rdx + r11 + 0xc], xmm0
00f40 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f48 c4c17a6f441b1c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x1c]
00f4f c5fa7f44321c                   vmovdqu    xmmword ptr [rdx + rsi + 0x1c], xmm0
00f55 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f5d c4c17a6f441b2c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x2c]
00f64 c5fa7f44322c                   vmovdqu    xmmword ptr [rdx + rsi + 0x2c], xmm0
00f6a 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f72 c4c17a6f441b3c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x3c]
00f79 c5fa7f44323c                   vmovdqu    xmmword ptr [rdx + rsi + 0x3c], xmm0
00f7f 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f87 c4c17a6f441b4c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x4c]
00f8e c5fa7f44324c                   vmovdqu    xmmword ptr [rdx + rsi + 0x4c], xmm0
00f94 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00f9c c4c17a6f441b5c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x5c]
00fa3 c5fa7f44325c                   vmovdqu    xmmword ptr [rdx + rsi + 0x5c], xmm0
00fa9 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00fb1 c4c17a6f441b6c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x6c]
00fb8 c5fa7f44326c                   vmovdqu    xmmword ptr [rdx + rsi + 0x6c], xmm0
00fbe 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00fc6 c4c17a6f441b7c                 vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x7c]
00fcd c5fa7f44327c                   vmovdqu    xmmword ptr [rdx + rsi + 0x7c], xmm0
00fd3 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00fdb c4c17a6f841b8c000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x8c]
00fe5 c5fa7f84328c000000             vmovdqu    xmmword ptr [rdx + rsi + 0x8c], xmm0
00fee 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00ff6 c4c17a6f841b9c000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0x9c]
01000 c5fa7f84329c000000             vmovdqu    xmmword ptr [rdx + rsi + 0x9c], xmm0
01009 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
01011 c4c17a6f841bac000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xac]
0101b c5fa7f8432ac000000             vmovdqu    xmmword ptr [rdx + rsi + 0xac], xmm0
01024 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0102c c4c17a6f841bbc000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xbc]
01036 c5fa7f8432bc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xbc], xmm0
0103f 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
01047 c4c17a6f841bcc000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xcc]
01051 c5fa7f8432cc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xcc], xmm0
0105a 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
01062 c4c17a6f841bdc000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xdc]
0106c c5fa7f8432dc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xdc], xmm0
01075 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0107d c4c17a6f841bec000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xec]
01087 c5fa7f8432ec000000             vmovdqu    xmmword ptr [rdx + rsi + 0xec], xmm0
01090 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
01098 c4c17a6f841bfc000000           vmovdqu    xmm0, xmmword ptr [r11 + rbx + 0xfc]
010a2 c5fa7f8432fc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xfc], xmm0
010ab 4181c000010000                 add        r8d, 0x100
010b2 443bc7                         cmp        r8d, edi
010b5 0f8c55feffff                   jl         0x7f63dbbf5e10
010bb 453bc5                         cmp        r8d, r13d
010be 7d4e                           jge        0x7f63dbbf600e
010c0 4d63d8                         movsxd     r11, r8d
010c3 4d03d9                         add        r11, r9
010c6 4c3bd9                         cmp        r11, rcx
010c9 0f8340190000                   jae        0x7f63dbbf790f
010cf 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
010d7 0f8346190000                   jae        0x7f63dbbf7923
010dd 90                             nop        
010de 90                             nop        
010df 90                             nop        
010e0 478d0c02                       lea        r9d, [r10 + r8]
010e4 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
010ec c4817a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xc]
010f3 458bd8                         mov        r11d, r8d
010f6 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
010fe c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
01105 4183c010                       add        r8d, 0x10
01109 453bc5                         cmp        r8d, r13d
0110c 7cd2                           jl         0x7f63dbbf5fe0
0110e 448bd0                         mov        r10d, eax
01111 4403542438                     add        r10d, dword ptr [rsp + 0x38]
01116 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0111b 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
01123 e9b6f6ffff                     jmp        0x7f63dbbf56de
01128 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
01130 0f837e160000                   jae        0x7f63dbbf76b4
01136 418bce                         mov        ecx, r14d
01139 4c63c1                         movsxd     r8, ecx
0113c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01144 4f8b4c020c                     mov        r9, qword ptr [r10 + r8 + 0xc]
01149 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01151 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
01159 0f83dd160000                   jae        0x7f63dbbf773c
0115f 8d5908                         lea        ebx, [rcx + 8]
01162 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01166 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
0116d 4c63da                         movsxd     r11, edx
01170 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
01178 4e894c1f0c                     mov        qword ptr [rdi + r11 + 0xc], r9
0117d 448d6a08                       lea        r13d, [rdx + 8]
01181 418502                         test       dword ptr [r10], eax
01184 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
0118c 0f8db6faffff                   jge        0x7f63dbbf5b48
01192 4d2bc3                         sub        r8, r11
01195 4c634c240c                     movsxd     r9, dword ptr [rsp + 0xc]
0119a 4983c1f9                       add        r9, -7
0119e 4963c5                         movsxd     rax, r13d
011a1 4e8d1400                       lea        r10, [rax + r8]
011a5 4d3bd1                         cmp        r10, r9
011a8 0f831a170000                   jae        0x7f63dbbf77c8
011ae 4863bc2498000000               movsxd     rdi, dword ptr [rsp + 0x98]
011b6 4c8bd7                         mov        r10, rdi
011b9 4c2bd0                         sub        r10, rax
011bc 4983c207                       add        r10, 7
011c0 4983e2f8                       and        r10, 0xfffffffffffffff8
011c4 458bd2                         mov        r10d, r10d
011c7 458d5c1208                     lea        r11d, [r10 + rdx + 8]
011cc 4d63d3                         movsxd     r10, r11d
011cf 4f8d5c02f8                     lea        r11, [r10 + r8 - 8]
011d4 4d3bd9                         cmp        r11, r9
011d7 0f83eb160000                   jae        0x7f63dbbf77c8
011dd 443bac24c8000000               cmp        r13d, dword ptr [rsp + 0xc8]
011e5 0f83dd160000                   jae        0x7f63dbbf77c8
011eb 4983c2f8                       add        r10, -8
011ef 4d3bd1                         cmp        r10, r9
011f2 0f83d0160000                   jae        0x7f63dbbf77c8
011f8 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01200 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01207 0f8f33170000                   jg         0x7f63dbbf7840
0120d 2bca                           sub        ecx, edx
0120f 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01213 41baf4ffffff                   mov        r10d, 0xfffffff4
01219 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01221 418bcb                         mov        ecx, r11d
01224 442bd1                         sub        r10d, ecx
01227 442bd2                         sub        r10d, edx
0122a 83c210                         add        edx, 0x10
0122d 4183c2f0                       add        r10d, -0x10
01231 4c8d5fc8                       lea        r11, [rdi - 0x38]
01235 4981fb00000080                 cmp        r11, -0x80000000
0123c 48c7c100000080                 mov        rcx, 0xffffffff80000000
01243 4c0f4cd9                       cmovl      r11, rcx
01247 418bdb                         mov        ebx, r11d
0124a 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01252 4c63da                         movsxd     r11, edx
01255 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
0125d 488bf1                         mov        rsi, rcx
01260 b906000000                     mov        ecx, 6
01265 c442f0f5d2                     bzhi       r10, r10, rcx
0126a 4d03da                         add        r11, r10
0126d 4c3bdf                         cmp        r11, rdi
01270 488bef                         mov        rbp, rdi
01273 490f4ceb                       cmovl      rbp, r11
01277 4c8bd5                         mov        r10, rbp
0127a 4c2bd0                         sub        r10, rax
0127d 4d8d5aff                       lea        r11, [r10 - 1]
01281 49c1fb3f                       sar        r11, 0x3f
01285 49c1eb3d                       shr        r11, 0x3d
01289 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
0128e 4983e2f8                       and        r10, 0xfffffffffffffff8
01292 4c03d0                         add        r10, rax
01295 493bc2                         cmp        rax, r10
01298 490f4cc2                       cmovl      rax, r10
0129c 448bd0                         mov        r10d, eax
0129f 438d4c1608                     lea        ecx, [r14 + r10 + 8]
012a4 4183c208                       add        r10d, 8
012a8 4863c9                         movsxd     rcx, ecx
012ab 4803ce                         add        rcx, rsi
012ae 4963c2                         movsxd     rax, r10d
012b1 4803c6                         add        rax, rsi
012b4 4c8d590c                       lea        r11, [rcx + 0xc]
012b8 4883c14c                       add        rcx, 0x4c
012bc 488d704c                       lea        rsi, [rax + 0x4c]
012c0 4533d2                         xor        r10d, r10d
012c3 493bf3                         cmp        rsi, r11
012c6 410f96c2                       setbe      r10b
012ca 4883c00c                       add        rax, 0xc
012ce 488bf1                         mov        rsi, rcx
012d1 33c9                           xor        ecx, ecx
012d3 483bf0                         cmp        rsi, rax
012d6 0f96c1                         setbe      cl
012d9 440bd1                         or         r10d, ecx
012dc 0f84f5090000                   je         0x7f63dbbf6bd7
012e2 8bd5                           mov        edx, ebp
012e4 eb05                           jmp        0x7f63dbbf61eb
012e6 90                             nop        
012e7 90                             nop        
012e8 448bee                         mov        r13d, esi
012eb 458bd5                         mov        r10d, r13d
012ee 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
012f3 4503dd                         add        r11d, r13d
012f6 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
012fe 4e8b5c190c                     mov        r11, qword ptr [rcx + r11 + 0xc]
01303 4e895c110c                     mov        qword ptr [rcx + r10 + 0xc], r11
01308 418d7508                       lea        esi, [r13 + 8]
0130c 3bf2                           cmp        esi, edx
0130e 7cd8                           jl         0x7f63dbbf61e8
01310 4881c708feffff                 add        rdi, -0x1f8
01317 4881ff00000080                 cmp        rdi, -0x80000000
0131e 49c7c200000080                 mov        r10, 0xffffffff80000000
01325 490f4cfa                       cmovl      rdi, r10
01329 8bc7                           mov        eax, edi
0132b 3bf0                           cmp        esi, eax
0132d 0f8d85160000                   jge        0x7f63dbbf78b8
01333 4c63d6                         movsxd     r10, esi
01336 4d03d0                         add        r10, r8
01339 4d3bd1                         cmp        r10, r9
0133c 0f837d160000                   jae        0x7f63dbbf78bf
01342 4181c500020000                 add        r13d, 0x200
01349 4d63d5                         movsxd     r10, r13d
0134c 4d03d0                         add        r10, r8
0134f 4d3bd1                         cmp        r10, r9
01352 0f837b160000                   jae        0x7f63dbbf78d3
01358 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
0135f 0f8382160000                   jae        0x7f63dbbf78e7
01365 443bac24c8000000               cmp        r13d, dword ptr [rsp + 0xc8]
0136d 0f8388160000                   jae        0x7f63dbbf78fb
01373 eb0d                           jmp        0x7f63dbbf6282
01375 90                             nop        
01376 90                             nop        
01377 90                             nop        
01378 90                             nop        
01379 90                             nop        
0137a 90                             nop        
0137b 90                             nop        
0137c 90                             nop        
0137d 90                             nop        
0137e 90                             nop        
0137f 90                             nop        
01380 8bf7                           mov        esi, edi
01382 448d9600010000                 lea        r10d, [rsi + 0x100]
01389 4403542418                     add        r10d, dword ptr [rsp + 0x18]
0138e 8dbe80000000                   lea        edi, [rsi + 0x80]
01394 037c2418                       add        edi, dword ptr [rsp + 0x18]
01398 418bd2                         mov        edx, r10d
0139b 4963ea                         movsxd     rbp, r10d
0139e 8bce                           mov        ecx, esi
013a0 448b6c2418                     mov        r13d, dword ptr [rsp + 0x18]
013a5 4403ee                         add        r13d, esi
013a8 448bde                         mov        r11d, esi
013ab 4d63f3                         movsxd     r14, r11d
013ae 458bd5                         mov        r10d, r13d
013b1 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
013b9 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
013c4 62d17e487f840b0c000000         vmovdqu32  zmmword ptr [r11 + rcx + 0xc], zmm0
013cf 4963cd                         movsxd     rcx, r13d
013d2 448d5e40                       lea        r11d, [rsi + 0x40]
013d6 44035c2418                     add        r11d, dword ptr [rsp + 0x18]
013db 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
013e3 62917e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0xc]
013ee 62917e487f84324c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x4c], zmm0
013f9 62d17e486f843a0c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdi + 0xc]
01404 62917e487f84328c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x8c], zmm0
0140f 62d17e486f840acc000000         vmovdqu32  zmm0, zmmword ptr [r10 + rcx + 0xcc]
0141a 62917e487f8432cc000000         vmovdqu32  zmmword ptr [r10 + r14 + 0xcc], zmm0
01425 62d17e486f84120c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdx + 0xc]
01430 62917e487f84320c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x10c], zmm0
0143b 62d17e486f840a4c010000         vmovdqu32  zmm0, zmmword ptr [r10 + rcx + 0x14c]
01446 62917e487f84324c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x14c], zmm0
01451 62d17e486f840a8c010000         vmovdqu32  zmm0, zmmword ptr [r10 + rcx + 0x18c]
0145c 62917e487f84328c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x18c], zmm0
01467 62d17e486f842acc000000         vmovdqu32  zmm0, zmmword ptr [r10 + rbp + 0xcc]
01472 62917e487f8432cc010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x1cc], zmm0
0147d 8dbe00020000                   lea        edi, [rsi + 0x200]
01483 3bf8                           cmp        edi, eax
01485 0f8cf5feffff                   jl         0x7f63dbbf6280
0148b 3bfb                           cmp        edi, ebx
0148d 7d55                           jge        0x7f63dbbf63e4
0148f 81c638020000                   add        esi, 0x238
01495 4c63d6                         movsxd     r10, esi
01498 4d03d0                         add        r10, r8
0149b 4d3bd1                         cmp        r10, r9
0149e 0f8393150000                   jae        0x7f63dbbf7937
014a4 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
014ab 0f83ae150000                   jae        0x7f63dbbf795f
014b1 90                             nop        
014b2 90                             nop        
014b3 90                             nop        
014b4 448bdf                         mov        r11d, edi
014b7 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
014bc 4403d7                         add        r10d, edi
014bf 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
014c7 62b17e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc]
014d2 62b17e487f84190c000000         vmovdqu32  zmmword ptr [rcx + r11 + 0xc], zmm0
014dd 83c740                         add        edi, 0x40
014e0 3bfb                           cmp        edi, ebx
014e2 7cd0                           jl         0x7f63dbbf63b4
014e4 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
014eb 0f8d57f7ffff                   jge        0x7f63dbbf5b48
014f1 4c63d7                         movsxd     r10, edi
014f4 4d03d0                         add        r10, r8
014f7 4d3bd1                         cmp        r10, r9
014fa 0f834b150000                   jae        0x7f63dbbf794b
01500 3bbc24c8000000                 cmp        edi, dword ptr [rsp + 0xc8]
01507 0f8366150000                   jae        0x7f63dbbf7973
0150d 90                             nop        
0150e 90                             nop        
0150f 90                             nop        
01510 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01515 4403df                         add        r11d, edi
01518 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01520 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
01525 448bc7                         mov        r8d, edi
01528 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01530 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
01535 83c708                         add        edi, 8
01538 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
0153f 7ccf                           jl         0x7f63dbbf6410
01541 e902f7ffff                     jmp        0x7f63dbbf5b48
01546 bee4ffffff                     mov        esi, 0xffffffe4
0154b 488b2c24                       mov        rbp, qword ptr [rsp]
0154f 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01554 44895c2408                     mov        dword ptr [rsp + 8], r11d
01559 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0155e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01563 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01568 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0156d 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01571 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01575 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0157a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0157f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01584 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01589 90                             nop        
0158a 90                             nop        
0158b 90                             nop        
0158c c5f877                         vzeroupper 
0158f e8cc42afff                     call       0x7f63db6ea760
01594 0f1f84008c16000b               nop        dword ptr [rax + rax + 0xb00168c]
0159c 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
015a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015aa e851a4b318                     call       0x7f63f4730900
015af f4                             hlt        
015b0 bee4ffffff                     mov        esi, 0xffffffe4
015b5 488b2c24                       mov        rbp, qword ptr [rsp]
015b9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015be 44895c2408                     mov        dword ptr [rsp + 8], r11d
015c3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015c8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015cd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015d2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015d7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015db 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
015e0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
015e5 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
015ea 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
015ef 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
015f4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
015f9 89442464                       mov        dword ptr [rsp + 0x64], eax
015fd 894c2478                       mov        dword ptr [rsp + 0x78], ecx
01601 90                             nop        
01602 90                             nop        
01603 90                             nop        
01604 c5f877                         vzeroupper 
01607 e85442afff                     call       0x7f63db6ea760
0160c 0f1f84000417000c               nop        dword ptr [rax + rax + 0xc001704]
01614 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0161e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01622 e8d9a3b318                     call       0x7f63f4730900
01627 f4                             hlt        
01628 bee4ffffff                     mov        esi, 0xffffffe4
0162d 488b2c24                       mov        rbp, qword ptr [rsp]
01631 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01636 44895c2408                     mov        dword ptr [rsp + 8], r11d
0163b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01640 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01645 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0164a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0164f 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01654 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01659 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0165e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01663 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01668 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01670 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01675 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0167d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01682 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01687 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0168c 89442464                       mov        dword ptr [rsp + 0x64], eax
01690 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01694 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0169d 90                             nop        
0169e 90                             nop        
0169f 90                             nop        
016a0 c5f877                         vzeroupper 
016a3 e8b841afff                     call       0x7f63db6ea760
016a8 0f1f8400a017000d               nop        dword ptr [rax + rax + 0xd0017a0]
016b0 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
016ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
016be e83da3b318                     call       0x7f63f4730900
016c3 f4                             hlt        
016c4 bee4ffffff                     mov        esi, 0xffffffe4
016c9 488b2c24                       mov        rbp, qword ptr [rsp]
016cd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016d2 4489542408                     mov        dword ptr [rsp + 8], r10d
016d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016e6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016eb 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
016f0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
016f5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
016fa 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
016ff 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01704 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01709 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0170e 90                             nop        
0170f 90                             nop        
01710 c5f877                         vzeroupper 
01713 e84841afff                     call       0x7f63db6ea760
01718 0f1f84001018000e               nop        dword ptr [rax + rax + 0xe001810]
01720 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0172a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0172e e8cda2b318                     call       0x7f63f4730900
01733 f4                             hlt        
01734 be45ffffff                     mov        esi, 0xffffff45
01739 488b2c24                       mov        rbp, qword ptr [rsp]
0173d 4c89542408                     mov        qword ptr [rsp + 8], r10
01742 90                             nop        
01743 90                             nop        
01744 c5f877                         vzeroupper 
01747 e81441afff                     call       0x7f63db6ea760
0174c 0f1f84004418000f               nop        dword ptr [rax + rax + 0xf001844]
01754 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0175e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01762 e899a2b318                     call       0x7f63f4730900
01767 f4                             hlt        
01768 be45ffffff                     mov        esi, 0xffffff45
0176d 488b2c24                       mov        rbp, qword ptr [rsp]
01771 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01776 4489542408                     mov        dword ptr [rsp + 8], r10d
0177b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01780 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01785 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0178a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0178f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01793 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01797 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0179c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017a1 89442464                       mov        dword ptr [rsp + 0x64], eax
017a5 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
017aa 90                             nop        
017ab 90                             nop        
017ac c5f877                         vzeroupper 
017af e8ac40afff                     call       0x7f63db6ea760
017b4 0f1f8400ac180010               nop        dword ptr [rax + rax + 0x100018ac]
017bc 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
017c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ca e831a2b318                     call       0x7f63f4730900
017cf f4                             hlt        
017d0 493bea                         cmp        rbp, r10
017d3 bdffffffff                     mov        ebp, 0xffffffff
017d8 7c08                           jl         0x7f63dbbf66e2
017da 400f95c5                       setne      bpl
017de 400fb6ed                       movzx      ebp, bpl
017e2 be45ffffff                     mov        esi, 0xffffff45
017e7 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
017ec 4489442414                     mov        dword ptr [rsp + 0x14], r8d
017f1 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017f5 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
017f9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
017fe 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01803 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01808 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0180d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01811 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01816 90                             nop        
01817 90                             nop        
01818 c5f877                         vzeroupper 
0181b e84040afff                     call       0x7f63db6ea760
01820 0f1f840018190011               nop        dword ptr [rax + rax + 0x11001918]
01828 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01832 4883e4f0                       and        rsp, 0xfffffffffffffff0
01836 e8c5a1b318                     call       0x7f63f4730900
0183b f4                             hlt        
0183c be45ffffff                     mov        esi, 0xffffff45
01841 488b2c24                       mov        rbp, qword ptr [rsp]
01845 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0184a 4489442408                     mov        dword ptr [rsp + 8], r8d
0184f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01854 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01859 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0185e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01863 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01867 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0186b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01870 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01875 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0187a 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0187f 89442464                       mov        dword ptr [rsp + 0x64], eax
01883 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01888 c5f877                         vzeroupper 
0188b e8d03fafff                     call       0x7f63db6ea760
01890 0f1f840088190012               nop        dword ptr [rax + rax + 0x12001988]
01898 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
018a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018a6 e855a1b318                     call       0x7f63f4730900
018ab f4                             hlt        
018ac be45ffffff                     mov        esi, 0xffffff45
018b1 488b2c24                       mov        rbp, qword ptr [rsp]
018b5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018ba 4489542408                     mov        dword ptr [rsp + 8], r10d
018bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018c9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018ce 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018d3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018d7 894c2434                       mov        dword ptr [rsp + 0x34], ecx
018db 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018e0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018e5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018ea 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
018ef 89442464                       mov        dword ptr [rsp + 0x64], eax
018f3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018f8 4489542470                     mov        dword ptr [rsp + 0x70], r10d
018fd 90                             nop        
018fe 90                             nop        
018ff 90                             nop        
01900 c5f877                         vzeroupper 
01903 e8583fafff                     call       0x7f63db6ea760
01908 0f1f8400001a0013               nop        dword ptr [rax + rax + 0x13001a00]
01910 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0191a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0191e e8dda0b318                     call       0x7f63f4730900
01923 f4                             hlt        
01924 bee4ffffff                     mov        esi, 0xffffffe4
01929 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0192e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01933 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01937 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0193c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01941 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01946 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0194b 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01953 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01958 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01960 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01965 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0196d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01972 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0197a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0197f 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01984 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
0198c c5f877                         vzeroupper 
0198f e8cc3eafff                     call       0x7f63db6ea760
01994 0f1f84008c1a0014               nop        dword ptr [rax + rax + 0x14001a8c]
0199c 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
019a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019aa e851a0b318                     call       0x7f63f4730900
019af f4                             hlt        
019b0 bee4ffffff                     mov        esi, 0xffffffe4
019b5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019ba 4489542414                     mov        dword ptr [rsp + 0x14], r10d
019bf 895c2438                       mov        dword ptr [rsp + 0x38], ebx
019c3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019c8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019cd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019d2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019d7 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
019df 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019e4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019ec 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019f1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
019f9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019fe 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01a03 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01a08 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01a0d 90                             nop        
01a0e 90                             nop        
01a0f 90                             nop        
01a10 c5f877                         vzeroupper 
01a13 e8483eafff                     call       0x7f63db6ea760
01a18 0f1f8400101b0015               nop        dword ptr [rax + rax + 0x15001b10]
01a20 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a2e e8cd9fb318                     call       0x7f63f4730900
01a33 f4                             hlt        
01a34 bebeffffff                     mov        esi, 0xffffffbe
01a39 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a3e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a43 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a47 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a4c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a51 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01a56 90                             nop        
01a57 90                             nop        
01a58 c5f877                         vzeroupper 
01a5b e8003eafff                     call       0x7f63db6ea760
01a60 0f1f8400581b0016               nop        dword ptr [rax + rax + 0x16001b58]
01a68 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01a72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a76 e8859fb318                     call       0x7f63f4730900
01a7b f4                             hlt        
01a7c 4533d2                         xor        r10d, r10d
01a7f 4c891424                       mov        qword ptr [rsp], r10
01a83 e9dce6ffff                     jmp        0x7f63dbbf5064
01a88 4533d2                         xor        r10d, r10d
01a8b 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01a93 e9fce6ffff                     jmp        0x7f63dbbf5094
01a98 4533d2                         xor        r10d, r10d
01a9b 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01aa3 e917e7ffff                     jmp        0x7f63dbbf50bf
01aa8 4533d2                         xor        r10d, r10d
01aab 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ab0 e937e7ffff                     jmp        0x7f63dbbf50ec
01ab5 4533d2                         xor        r10d, r10d
01ab8 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
01ac0 e952e7ffff                     jmp        0x7f63dbbf5117
01ac5 beccffffff                     mov        esi, 0xffffffcc
01aca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01acf 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ad4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01ad9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ade 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ae3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ae8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01aed 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01af2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01afa 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01aff 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01b07 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01b0c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01b14 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b19 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b1e 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01b23 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01b2b 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01b30 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01b38 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
01b3f 90                             nop        
01b40 c5f877                         vzeroupper 
01b43 e8183dafff                     call       0x7f63db6ea760
01b48 0f1f8400401c0017               nop        dword ptr [rax + rax + 0x17001c40]
01b50 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5e e89d9eb318                     call       0x7f63f4730900
01b63 f4                             hlt        
01b64 beccffffff                     mov        esi, 0xffffffcc
01b69 488b2c24                       mov        rbp, qword ptr [rsp]
01b6d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b72 4489542408                     mov        dword ptr [rsp + 8], r10d
01b77 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b7c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b81 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b86 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b8b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01b90 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01b95 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01b9a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b9f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ba4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ba9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bae 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bb3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01bbb 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01bc0 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01bc5 90                             nop        
01bc6 90                             nop        
01bc7 90                             nop        
01bc8 c5f877                         vzeroupper 
01bcb e8903cafff                     call       0x7f63db6ea760
01bd0 0f1f8400c81c0018               nop        dword ptr [rax + rax + 0x18001cc8]
01bd8 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be6 e8159eb318                     call       0x7f63f4730900
01beb f4                             hlt        
01bec 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01bf4 4d3bd8                         cmp        r11, r8
01bf7 bdffffffff                     mov        ebp, 0xffffffff
01bfc 7c08                           jl         0x7f63dbbf6b06
01bfe 400f95c5                       setne      bpl
01c02 400fb6ed                       movzx      ebp, bpl
01c06 be45ffffff                     mov        esi, 0xffffff45
01c0b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c10 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c15 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01c19 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01c1d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01c22 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01c27 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01c2c 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01c31 89442468                       mov        dword ptr [rsp + 0x68], eax
01c35 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01c3a 90                             nop        
01c3b 90                             nop        
01c3c c5f877                         vzeroupper 
01c3f e81c3cafff                     call       0x7f63db6ea760
01c44 0f1f84003c1d0019               nop        dword ptr [rax + rax + 0x19001d3c]
01c4c 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01c56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c5a e8a19db318                     call       0x7f63f4730900
01c5f f4                             hlt        
01c60 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01c68 493beb                         cmp        rbp, r11
01c6b bdffffffff                     mov        ebp, 0xffffffff
01c70 7c08                           jl         0x7f63dbbf6b7a
01c72 400f95c5                       setne      bpl
01c76 400fb6ed                       movzx      ebp, bpl
01c7a be45ffffff                     mov        esi, 0xffffff45
01c7f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c84 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c89 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01c8d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01c91 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01c96 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01c9b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01ca0 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01ca5 89442468                       mov        dword ptr [rsp + 0x68], eax
01ca9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01cae 90                             nop        
01caf 90                             nop        
01cb0 c5f877                         vzeroupper 
01cb3 e8a83bafff                     call       0x7f63db6ea760
01cb8 0f1f8400b01d001a               nop        dword ptr [rax + rax + 0x1a001db0]
01cc0 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01cca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cce e82d9db318                     call       0x7f63f4730900
01cd3 f4                             hlt        
01cd4 448bee                         mov        r13d, esi
01cd7 458bd5                         mov        r10d, r13d
01cda 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01cdf 4503dd                         add        r11d, r13d
01ce2 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01cea 4e8b5c190c                     mov        r11, qword ptr [rcx + r11 + 0xc]
01cef 4e895c110c                     mov        qword ptr [rcx + r10 + 0xc], r11
01cf4 418d7508                       lea        esi, [r13 + 8]
01cf8 3bf2                           cmp        esi, edx
01cfa 7cd8                           jl         0x7f63dbbf6bd4
01cfc 3bf3                           cmp        esi, ebx
01cfe 0f8dce000000                   jge        0x7f63dbbf6cd2
01d04 4c63d6                         movsxd     r10, esi
01d07 4d03d0                         add        r10, r8
01d0a 4d3bd1                         cmp        r10, r9
01d0d 0f83740d0000                   jae        0x7f63dbbf7987
01d13 458d5d40                       lea        r11d, [r13 + 0x40]
01d17 4d63d3                         movsxd     r10, r11d
01d1a 4d03d0                         add        r10, r8
01d1d 4d3bd1                         cmp        r10, r9
01d20 0f83750d0000                   jae        0x7f63dbbf799b
01d26 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
01d2d 0f837c0d0000                   jae        0x7f63dbbf79af
01d33 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01d3b 0f83820d0000                   jae        0x7f63dbbf79c3
01d41 90                             nop        
01d42 90                             nop        
01d43 90                             nop        
01d44 90                             nop        
01d45 90                             nop        
01d46 90                             nop        
01d47 90                             nop        
01d48 90                             nop        
01d49 90                             nop        
01d4a 90                             nop        
01d4b 90                             nop        
01d4c 90                             nop        
01d4d 90                             nop        
01d4e 90                             nop        
01d4f 90                             nop        
01d50 448bde                         mov        r11d, esi
01d53 4963d3                         movsxd     rdx, r11d
01d56 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01d5b 4403d6                         add        r10d, esi
01d5e 448bde                         mov        r11d, esi
01d61 418bfa                         mov        edi, r10d
01d64 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01d6c 488b4c390c                     mov        rcx, qword ptr [rcx + rdi + 0xc]
01d71 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
01d79 4a894c1f0c                     mov        qword ptr [rdi + r11 + 0xc], rcx
01d7e 4d63da                         movsxd     r11, r10d
01d81 4e8b541f14                     mov        r10, qword ptr [rdi + r11 + 0x14]
01d86 4c89541714                     mov        qword ptr [rdi + rdx + 0x14], r10
01d8b 4e8b541f1c                     mov        r10, qword ptr [rdi + r11 + 0x1c]
01d90 4c8954171c                     mov        qword ptr [rdi + rdx + 0x1c], r10
01d95 4e8b541f24                     mov        r10, qword ptr [rdi + r11 + 0x24]
01d9a 4c89541724                     mov        qword ptr [rdi + rdx + 0x24], r10
01d9f 4e8b541f2c                     mov        r10, qword ptr [rdi + r11 + 0x2c]
01da4 4c8954172c                     mov        qword ptr [rdi + rdx + 0x2c], r10
01da9 4e8b541f34                     mov        r10, qword ptr [rdi + r11 + 0x34]
01dae 4c89541734                     mov        qword ptr [rdi + rdx + 0x34], r10
01db3 4e8b541f3c                     mov        r10, qword ptr [rdi + r11 + 0x3c]
01db8 4c8954173c                     mov        qword ptr [rdi + rdx + 0x3c], r10
01dbd 4e8b541f44                     mov        r10, qword ptr [rdi + r11 + 0x44]
01dc2 4c89541744                     mov        qword ptr [rdi + rdx + 0x44], r10
01dc7 83c640                         add        esi, 0x40
01dca 3bf3                           cmp        esi, ebx
01dcc 0f8c7effffff                   jl         0x7f63dbbf6c50
01dd2 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
01dd9 0f8d69eeffff                   jge        0x7f63dbbf5b48
01ddf 4c63d6                         movsxd     r10, esi
01de2 4d03d0                         add        r10, r8
01de5 4d3bd1                         cmp        r10, r9
01de8 0f83e90c0000                   jae        0x7f63dbbf79d7
01dee 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
01df5 0f83f00c0000                   jae        0x7f63dbbf79eb
01dfb 90                             nop        
01dfc 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01e01 4403de                         add        r11d, esi
01e04 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01e0c 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
01e11 448bc6                         mov        r8d, esi
01e14 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01e1c 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
01e21 83c608                         add        esi, 8
01e24 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
01e2b 7ccf                           jl         0x7f63dbbf6cfc
01e2d e916eeffff                     jmp        0x7f63dbbf5b48
01e32 bee4ffffff                     mov        esi, 0xffffffe4
01e37 488b2c24                       mov        rbp, qword ptr [rsp]
01e3b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e40 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e45 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e4a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e4f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e54 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e59 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e5d 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01e61 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e66 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e6b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e70 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e75 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01e7d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e82 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e87 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e8c 89442464                       mov        dword ptr [rsp + 0x64], eax
01e90 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01e97 90                             nop        
01e98 c5f877                         vzeroupper 
01e9b e8c039afff                     call       0x7f63db6ea760
01ea0 0f1f8400981f001b               nop        dword ptr [rax + rax + 0x1b001f98]
01ea8 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01eb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eb6 e8459bb318                     call       0x7f63f4730900
01ebb f4                             hlt        
01ebc be6effffff                     mov        esi, 0xffffff6e
01ec1 488b2c24                       mov        rbp, qword ptr [rsp]
01ec5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01eca 4489442408                     mov        dword ptr [rsp + 8], r8d
01ecf 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ed4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ed9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ede 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ee3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ee7 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01eeb 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01ef0 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01ef5 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01efa 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01eff 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01f04 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01f09 89442464                       mov        dword ptr [rsp + 0x64], eax
01f0d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01f12 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01f16 90                             nop        
01f17 90                             nop        
01f18 c5f877                         vzeroupper 
01f1b e84039afff                     call       0x7f63db6ea760
01f20 0f1f84001820001c               nop        dword ptr [rax + rax + 0x1c002018]
01f28 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01f32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f36 e8c59ab318                     call       0x7f63f4730900
01f3b f4                             hlt        
01f3c be45ffffff                     mov        esi, 0xffffff45
01f41 488b2c24                       mov        rbp, qword ptr [rsp]
01f45 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f4a 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f4f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f54 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f59 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f5e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f63 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f67 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01f6b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f70 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f75 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f7a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f7f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f84 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f89 89442464                       mov        dword ptr [rsp + 0x64], eax
01f8d 89542478                       mov        dword ptr [rsp + 0x78], edx
01f91 90                             nop        
01f92 90                             nop        
01f93 90                             nop        
01f94 c5f877                         vzeroupper 
01f97 e8c438afff                     call       0x7f63db6ea760
01f9c 0f1f84009420001d               nop        dword ptr [rax + rax + 0x1d002094]
01fa4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
01fae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb2 e8499ab318                     call       0x7f63f4730900
01fb7 f4                             hlt        
01fb8 be3dffffff                     mov        esi, 0xffffff3d
01fbd 488b2c24                       mov        rbp, qword ptr [rsp]
01fc1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01fc6 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fcb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fd0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fd5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fda 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fdf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01fe3 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01fe7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01fec 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ff1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ff6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ffb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02000 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02005 89442464                       mov        dword ptr [rsp + 0x64], eax
02009 89542478                       mov        dword ptr [rsp + 0x78], edx
0200d 90                             nop        
0200e 90                             nop        
0200f 90                             nop        
02010 c5f877                         vzeroupper 
02013 e84838afff                     call       0x7f63db6ea760
02018 0f1f84001021001e               nop        dword ptr [rax + rax + 0x1e002110]
02020 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0202a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0202e e8cd99b318                     call       0x7f63f4730900
02033 f4                             hlt        
02034 bee4ffffff                     mov        esi, 0xffffffe4
02039 488b2c24                       mov        rbp, qword ptr [rsp]
0203d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02042 4489542408                     mov        dword ptr [rsp + 8], r10d
02047 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0204c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02051 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02056 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0205b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02060 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02065 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0206a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0206f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02074 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02079 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02081 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02086 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0208e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02093 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02098 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0209d 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
020a5 90                             nop        
020a6 90                             nop        
020a7 90                             nop        
020a8 c5f877                         vzeroupper 
020ab e8b037afff                     call       0x7f63db6ea760
020b0 0f1f8400a821001f               nop        dword ptr [rax + rax + 0x1f0021a8]
020b8 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
020c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c6 e83599b318                     call       0x7f63f4730900
020cb f4                             hlt        
020cc bee4ffffff                     mov        esi, 0xffffffe4
020d1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020d6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
020db 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
020e0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020e5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
020ea 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020ef 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020f4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020f9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02101 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02106 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0210e 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02113 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02118 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0211d 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02122 90                             nop        
02123 90                             nop        
02124 c5f877                         vzeroupper 
02127 e83437afff                     call       0x7f63db6ea760
0212c 0f1f840024220020               nop        dword ptr [rax + rax + 0x20002224]
02134 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0213e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02142 e8b998b318                     call       0x7f63f4730900
02147 f4                             hlt        
02148 418d6e01                       lea        ebp, [r14 + 1]
0214c bee4ffffff                     mov        esi, 0xffffffe4
02151 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02156 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0215b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02160 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02165 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0216a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0216f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02174 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02179 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02181 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02186 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0218e 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02193 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0219b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
021a0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021a5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
021aa 4489742474                     mov        dword ptr [rsp + 0x74], r14d
021af 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
021b7 90                             nop        
021b8 c5f877                         vzeroupper 
021bb e8a036afff                     call       0x7f63db6ea760
021c0 0f1f8400b8220021               nop        dword ptr [rax + rax + 0x210022b8]
021c8 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
021d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021d6 e82598b318                     call       0x7f63f4730900
021db f4                             hlt        
021dc bee4ffffff                     mov        esi, 0xffffffe4
021e1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021e6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
021eb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
021f0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021f5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
021fa 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
021ff 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02204 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02209 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02211 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02216 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0221e 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02223 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02228 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0222d 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02232 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
0223a 90                             nop        
0223b 90                             nop        
0223c c5f877                         vzeroupper 
0223f e81c36afff                     call       0x7f63db6ea760
02244 0f1f84003c230022               nop        dword ptr [rax + rax + 0x2200233c]
0224c 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02256 4883e4f0                       and        rsp, 0xfffffffffffffff0
0225a e8a197b318                     call       0x7f63f4730900
0225f f4                             hlt        
02260 bee4ffffff                     mov        esi, 0xffffffe4
02265 488b2c24                       mov        rbp, qword ptr [rsp]
02269 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0226e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02273 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02278 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0227d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02282 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02287 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0228c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02291 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02296 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0229b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022a0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022a5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022aa 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
022af 4489742474                     mov        dword ptr [rsp + 0x74], r14d
022b4 c5f877                         vzeroupper 
022b7 e8a435afff                     call       0x7f63db6ea760
022bc 0f1f8400b4230023               nop        dword ptr [rax + rax + 0x230023b4]
022c4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
022ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
022d2 e82997b318                     call       0x7f63f4730900
022d7 f4                             hlt        
022d8 beccffffff                     mov        esi, 0xffffffcc
022dd 488b2c24                       mov        rbp, qword ptr [rsp]
022e1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
022e6 44895c2408                     mov        dword ptr [rsp + 8], r11d
022eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022f5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022fa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022ff 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02304 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02309 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0230e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02313 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02318 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0231d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02325 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0232a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02332 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02337 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0233c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02341 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02346 90                             nop        
02347 90                             nop        
02348 c5f877                         vzeroupper 
0234b e81035afff                     call       0x7f63db6ea760
02350 0f1f840048240024               nop        dword ptr [rax + rax + 0x24002448]
02358 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02362 4883e4f0                       and        rsp, 0xfffffffffffffff0
02366 e89596b318                     call       0x7f63f4730900
0236b f4                             hlt        
0236c be45ffffff                     mov        esi, 0xffffff45
02371 488b2c24                       mov        rbp, qword ptr [rsp]
02375 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0237a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0237f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02384 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02389 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0238e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02393 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02398 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0239d 4489742468                     mov        dword ptr [rsp + 0x68], r14d
023a2 90                             nop        
023a3 90                             nop        
023a4 c5f877                         vzeroupper 
023a7 e8b434afff                     call       0x7f63db6ea760
023ac 0f1f8400a4240025               nop        dword ptr [rax + rax + 0x250024a4]
023b4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
023be 4883e4f0                       and        rsp, 0xfffffffffffffff0
023c2 e83996b318                     call       0x7f63f4730900
023c7 f4                             hlt        
023c8 be85ffffff                     mov        esi, 0xffffff85
023cd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023d2 44891424                       mov        dword ptr [rsp], r10d
023d6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023db 4489542404                     mov        dword ptr [rsp + 4], r10d
023e0 895c2408                       mov        dword ptr [rsp + 8], ebx
023e4 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023e9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023ee 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
023f3 4489742444                     mov        dword ptr [rsp + 0x44], r14d
023f8 c5f877                         vzeroupper 
023fb e86034afff                     call       0x7f63db6ea760
02400 0f1f8400f8240026               nop        dword ptr [rax + rax + 0x260024f8]
02408 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02412 4883e4f0                       and        rsp, 0xfffffffffffffff0
02416 e8e595b318                     call       0x7f63f4730900
0241b f4                             hlt        
0241c 4533d2                         xor        r10d, r10d
0241f 4d8bc2                         mov        r8, r10
02422 eb08                           jmp        0x7f63dbbf732c
02424 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0242c be6effffff                     mov        esi, 0xffffff6e
02431 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02436 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0243b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0243f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02444 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02449 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0244e 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02453 4c89442470                     mov        qword ptr [rsp + 0x70], r8
02458 c5f877                         vzeroupper 
0245b e80034afff                     call       0x7f63db6ea760
02460 0f1f840058250027               nop        dword ptr [rax + rax + 0x27002558]
02468 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02472 4883e4f0                       and        rsp, 0xfffffffffffffff0
02476 e88595b318                     call       0x7f63f4730900
0247b f4                             hlt        
0247c beccffffff                     mov        esi, 0xffffffcc
02481 488b2c24                       mov        rbp, qword ptr [rsp]
02485 894c2410                       mov        dword ptr [rsp + 0x10], ecx
02489 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0248d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02492 90                             nop        
02493 90                             nop        
02494 c5f877                         vzeroupper 
02497 e8c433afff                     call       0x7f63db6ea760
0249c 0f1f840094250028               nop        dword ptr [rax + rax + 0x28002594]
024a4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
024ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
024b2 e84995b318                     call       0x7f63f4730900
024b7 f4                             hlt        
024b8 bee4ffffff                     mov        esi, 0xffffffe4
024bd 488b2c24                       mov        rbp, qword ptr [rsp]
024c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
024c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
024cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024da 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024df 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
024e4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024e9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
024ee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024f3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
024fb 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02500 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02505 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0250a 89442460                       mov        dword ptr [rsp + 0x60], eax
0250e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02513 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02517 894c2474                       mov        dword ptr [rsp + 0x74], ecx
0251b 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
02522 90                             nop        
02523 90                             nop        
02524 c5f877                         vzeroupper 
02527 e83433afff                     call       0x7f63db6ea760
0252c 0f1f840024260029               nop        dword ptr [rax + rax + 0x29002624]
02534 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0253e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02542 e8b994b318                     call       0x7f63f4730900
02547 f4                             hlt        
02548 bee4ffffff                     mov        esi, 0xffffffe4
0254d 488b2c24                       mov        rbp, qword ptr [rsp]
02551 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02556 44895c2408                     mov        dword ptr [rsp + 8], r11d
0255b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02560 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02565 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0256a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0256f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02574 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02579 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0257e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02583 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0258b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02590 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
02598 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0259d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025a2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025a7 89442460                       mov        dword ptr [rsp + 0x60], eax
025ab 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
025b3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
025b8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
025bd 4489442474                     mov        dword ptr [rsp + 0x74], r8d
025c2 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
025c9 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
025d2 90                             nop        
025d3 90                             nop        
025d4 c5f877                         vzeroupper 
025d7 e88432afff                     call       0x7f63db6ea760
025dc 0f1f8400d426002a               nop        dword ptr [rax + rax + 0x2a0026d4]
025e4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
025ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
025f2 e80994b318                     call       0x7f63f4730900
025f7 f4                             hlt        
025f8 beccffffff                     mov        esi, 0xffffffcc
025fd 488b2c24                       mov        rbp, qword ptr [rsp]
02601 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02606 44895c2408                     mov        dword ptr [rsp + 8], r11d
0260b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02610 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02615 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0261a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0261f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02624 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02629 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0262e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02633 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0263b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02640 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02648 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0264d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02652 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02657 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0265b 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
0265f 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02666 90                             nop        
02667 90                             nop        
02668 c5f877                         vzeroupper 
0266b e8f031afff                     call       0x7f63db6ea760
02670 0f1f84006827002b               nop        dword ptr [rax + rax + 0x2b002768]
02678 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02682 4883e4f0                       and        rsp, 0xfffffffffffffff0
02686 e87593b318                     call       0x7f63f4730900
0268b f4                             hlt        
0268c 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
02690 83c510                         add        ebp, 0x10
02693 be6effffff                     mov        esi, 0xffffff6e
02698 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0269d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
026a2 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
026a7 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
026ac 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
026b1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
026b6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026bb 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
026c0 89442468                       mov        dword ptr [rsp + 0x68], eax
026c4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
026c9 448bd2                         mov        r10d, edx
026cc 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
026d4 c5f877                         vzeroupper 
026d7 e88431afff                     call       0x7f63db6ea760
026dc 0f1f8400d427002c               nop        dword ptr [rax + rax + 0x2c0027d4]
026e4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
026ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
026f2 e80993b318                     call       0x7f63f4730900
026f7 f4                             hlt        
026f8 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
026fc 83c510                         add        ebp, 0x10
026ff be66ffffff                     mov        esi, 0xffffff66
02704 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02709 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0270e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02713 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02718 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0271d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02722 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02727 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0272c 89442468                       mov        dword ptr [rsp + 0x68], eax
02730 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02735 448bd2                         mov        r10d, edx
02738 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
02740 c5f877                         vzeroupper 
02743 e81831afff                     call       0x7f63db6ea760
02748 0f1f84004028002d               nop        dword ptr [rax + rax + 0x2d002840]
02750 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
0275a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0275e e89d92b318                     call       0x7f63f4730900
02763 f4                             hlt        
02764 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
0276e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02772 e88992b318                     call       0x7f63f4730900
02777 f4                             hlt        
02778 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02782 4883e4f0                       and        rsp, 0xfffffffffffffff0
02786 e87592b318                     call       0x7f63f4730900
0278b f4                             hlt        
0278c 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0279a e86192b318                     call       0x7f63f4730900
0279f f4                             hlt        
027a0 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
027aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ae e84d92b318                     call       0x7f63f4730900
027b3 f4                             hlt        
027b4 bee4ffffff                     mov        esi, 0xffffffe4
027b9 488b2c24                       mov        rbp, qword ptr [rsp]
027bd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
027c2 44895c2408                     mov        dword ptr [rsp + 8], r11d
027c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027d1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
027d6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
027db 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
027e0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
027e5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
027ea 4489542434                     mov        dword ptr [rsp + 0x34], r10d
027ef 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
027f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027f9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02801 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02806 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0280b 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02810 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02818 c5f877                         vzeroupper 
0281b e84030afff                     call       0x7f63db6ea760
02820 0f1f84001829002e               nop        dword ptr [rax + rax + 0x2e002918]
02828 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02832 4883e4f0                       and        rsp, 0xfffffffffffffff0
02836 e8c591b318                     call       0x7f63f4730900
0283b f4                             hlt        
0283c bee4ffffff                     mov        esi, 0xffffffe4
02841 488b2c24                       mov        rbp, qword ptr [rsp]
02845 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0284a 4489542408                     mov        dword ptr [rsp + 8], r10d
0284f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02854 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02859 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0285e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02863 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02868 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0286d 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02872 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02877 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0287c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02881 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02889 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0288e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02893 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02898 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0289c 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
028a4 c5f877                         vzeroupper 
028a7 e8b42fafff                     call       0x7f63db6ea760
028ac 0f1f8400a429002f               nop        dword ptr [rax + rax + 0x2f0029a4]
028b4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
028be 4883e4f0                       and        rsp, 0xfffffffffffffff0
028c2 e83991b318                     call       0x7f63f4730900
028c7 f4                             hlt        
028c8 be6effffff                     mov        esi, 0xffffff6e
028cd 488b2c24                       mov        rbp, qword ptr [rsp]
028d1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
028d6 4489542408                     mov        dword ptr [rsp + 8], r10d
028db 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028e5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
028ea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
028ef 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
028f4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
028f9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
028fe 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02903 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0290b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02910 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02914 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02919 90                             nop        
0291a 90                             nop        
0291b 90                             nop        
0291c c5f877                         vzeroupper 
0291f e83c2fafff                     call       0x7f63db6ea760
02924 0f1f84001c2a0030               nop        dword ptr [rax + rax + 0x30002a1c]
0292c 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02936 4883e4f0                       and        rsp, 0xfffffffffffffff0
0293a e8c190b318                     call       0x7f63f4730900
0293f f4                             hlt        
02940 be66ffffff                     mov        esi, 0xffffff66
02945 488b2c24                       mov        rbp, qword ptr [rsp]
02949 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0294e 4489542408                     mov        dword ptr [rsp + 8], r10d
02953 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02958 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0295d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02962 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02967 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0296c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02971 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02976 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0297b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02983 458bd3                         mov        r10d, r11d
02986 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0298b 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0298f 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02994 c5f877                         vzeroupper 
02997 e8c42eafff                     call       0x7f63db6ea760
0299c 0f1f8400942a0031               nop        dword ptr [rax + rax + 0x31002a94]
029a4 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
029ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
029b2 e84990b318                     call       0x7f63f4730900
029b7 f4                             hlt        
029b8 8bfe                           mov        edi, esi
029ba e925ebffff                     jmp        0x7f63dbbf63e4
029bf 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
029c9 4883e4f0                       and        rsp, 0xfffffffffffffff0
029cd e82e90b318                     call       0x7f63f4730900
029d2 f4                             hlt        
029d3 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
029dd 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e1 e81a90b318                     call       0x7f63f4730900
029e6 f4                             hlt        
029e7 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
029f1 4883e4f0                       and        rsp, 0xfffffffffffffff0
029f5 e80690b318                     call       0x7f63f4730900
029fa f4                             hlt        
029fb 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a05 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a09 e8f28fb318                     call       0x7f63f4730900
02a0e f4                             hlt        
02a0f 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a19 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1d e8de8fb318                     call       0x7f63f4730900
02a22 f4                             hlt        
02a23 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a2d 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a31 e8ca8fb318                     call       0x7f63f4730900
02a36 f4                             hlt        
02a37 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a41 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a45 e8b68fb318                     call       0x7f63f4730900
02a4a f4                             hlt        
02a4b 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a55 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a59 e8a28fb318                     call       0x7f63f4730900
02a5e f4                             hlt        
02a5f 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a69 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a6d e88e8fb318                     call       0x7f63f4730900
02a72 f4                             hlt        
02a73 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a7d 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a81 e87a8fb318                     call       0x7f63f4730900
02a86 f4                             hlt        
02a87 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02a91 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a95 e8668fb318                     call       0x7f63f4730900
02a9a f4                             hlt        
02a9b 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02aa5 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aa9 e8528fb318                     call       0x7f63f4730900
02aae f4                             hlt        
02aaf 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02ab9 4883e4f0                       and        rsp, 0xfffffffffffffff0
02abd e83e8fb318                     call       0x7f63f4730900
02ac2 f4                             hlt        
02ac3 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02acd 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ad1 e82a8fb318                     call       0x7f63f4730900
02ad6 f4                             hlt        
02ad7 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02ae1 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae5 e8168fb318                     call       0x7f63f4730900
02aea f4                             hlt        
02aeb 48bfb0377fb4637f0000           movabs     rdi, 0x7f63b47f37b0
02af5 4883e4f0                       and        rsp, 0xfffffffffffffff0
02af9 e8028fb318                     call       0x7f63f4730900
02afe f4                             hlt        
02aff 488bf0                         mov        rsi, rax
02b02 eb0d                           jmp        0x7f63dbbf7a11
02b04 488bf0                         mov        rsi, rax
02b07 eb08                           jmp        0x7f63dbbf7a11
02b09 488bf0                         mov        rsi, rax
02b0c eb03                           jmp        0x7f63dbbf7a11
02b0e 488bf0                         mov        rsi, rax
02b11 c5f877                         vzeroupper 
02b14 4881c4f0000000                 add        rsp, 0xf0
02b1b 5d                             pop        rbp
02b1c e93fb5aeff                     jmp        0x7f63db6e2f60
02b21 bef6ffffff                     mov        esi, 0xfffffff6
02b26 90                             nop        
02b27 90                             nop        
02b28 c5f877                         vzeroupper 
02b2b e8302dafff                     call       0x7f63db6ea760
02b30 0f1f8400282c0032               nop        dword ptr [rax + rax + 0x32002c28]
02b38 48bf005738b4637f0000           movabs     rdi, 0x7f63b4385700
02b42 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b46 e8b58eb318                     call       0x7f63f4730900
02b4b f4                             hlt        
02b4c 49ba615dbfdb637f0000           movabs     r10, 0x7f63dbbf5d61
02b56 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02b5d e9fee8b4ff                     jmp        0x7f63db746360
02b62 e879b7b3ff                     call       0x7f63db7331e0
02b67 e9c2d4ffff                     jmp        0x7f63dbbf4f2e
02b6c f4                             hlt        
02b6d f4                             hlt        
02b6e f4                             hlt        
02b6f f4                             hlt        
