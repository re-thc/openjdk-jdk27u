00000 e83bec8818                     call       0x7fb3cc464340
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
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85c42d0000                   jne        0x7fb3b3bd84f2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00046 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00067 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
0006e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00073 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
0007a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0007f 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00086 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0008b 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
00092 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00097 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
0009e 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
000a5 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000ac 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
000b1 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b8 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000bd 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000c4 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
000c9 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000d0 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000d8 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000dc 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000e1 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e5 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
000ed 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000f4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
000fc 488bfe                         mov        rdi, rsi
000ff c5f877                         vzeroupper 
00102 49ba706a62ccb37f0000           movabs     r10, 0x7fb3cc626a70
0010c 41ffd2                         call       r10
0010f 0f1f840000000000               nop        dword ptr [rax + rax]
00117 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011c 4d85d2                         test       r10, r10
0011f 0f84d71a0000                   je         0x7fb3b3bd72fc
00125 458b12                         mov        r10d, dword ptr [r10]
00128 41c1ea0d                       shr        r10d, 0xd
0012c 4181fa15410000                 cmp        r10d, 0x4115
00133 0f858b250000                   jne        0x7fb3b3bd7dc4
00139 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013e 4c891424                       mov        qword ptr [rsp], r10
00142 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00147 4d85d2                         test       r10, r10
0014a 0f84b81a0000                   je         0x7fb3b3bd7308
00150 458b1a                         mov        r11d, dword ptr [r10]
00153 41c1eb0d                       shr        r11d, 0xd
00157 4181fbf9060000                 cmp        r11d, 0x6f9
0015e 0f8560250000                   jne        0x7fb3b3bd7dc4
00164 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00171 4d85d2                         test       r10, r10
00174 0f849e1a0000                   je         0x7fb3b3bd7318
0017a 458b12                         mov        r10d, dword ptr [r10]
0017d 41c1ea0d                       shr        r10d, 0xd
00181 4181fafc060000                 cmp        r10d, 0x6fc
00188 0f8536250000                   jne        0x7fb3b3bd7dc4
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001a0 4d85d2                         test       r10, r10
001a3 0f847f1a0000                   je         0x7fb3b3bd7328
001a9 458b1a                         mov        r11d, dword ptr [r10]
001ac 41c1eb0d                       shr        r11d, 0xd
001b0 4181fbfb060000                 cmp        r11d, 0x6fb
001b7 0f8507250000                   jne        0x7fb3b3bd7dc4
001bd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c7 4d85d2                         test       r10, r10
001ca 0f84651a0000                   je         0x7fb3b3bd7335
001d0 458b12                         mov        r10d, dword ptr [r10]
001d3 41c1ea0d                       shr        r10d, 0xd
001d7 4181fafb060000                 cmp        r10d, 0x6fb
001de 0f85e0240000                   jne        0x7fb3b3bd7dc4
001e4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e9 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f6 4d85d2                         test       r10, r10
001f9 0f84461a0000                   je         0x7fb3b3bd7345
001ff 458b1a                         mov        r11d, dword ptr [r10]
00202 41c1eb0d                       shr        r11d, 0xd
00206 4181fbf9060000                 cmp        r11d, 0x6f9
0020d 0f85b1240000                   jne        0x7fb3b3bd7dc4
00213 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0021b 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00223 458b5204                       mov        r10d, dword ptr [r10 + 4]
00227 4489542408                     mov        dword ptr [rsp + 8], r10d
0022c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00231 4585db                         test       r11d, r11d
00234 0f8432240000                   je         0x7fb3b3bd7d6c
0023a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00242 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00246 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0024b 4585db                         test       r11d, r11d
0024e 0f8618240000                   jbe        0x7fb3b3bd7d6c
00254 4183fb01                       cmp        r11d, 1
00258 0f860e240000                   jbe        0x7fb3b3bd7d6c
0025e 4183fb02                       cmp        r11d, 2
00262 0f8604240000                   jbe        0x7fb3b3bd7d6c
00268 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00270 458b5204                       mov        r10d, dword ptr [r10 + 4]
00274 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00279 4183c2f1                       add        r10d, -0xf
0027d 4585d2                         test       r10d, r10d
00280 0f8ce6230000                   jl         0x7fb3b3bd7d6c
00286 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0028e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00292 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00297 4183c3f1                       add        r11d, -0xf
0029b 4585db                         test       r11d, r11d
0029e 0f8cc8230000                   jl         0x7fb3b3bd7d6c
002a4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a9 4183c2f9                       add        r10d, -7
002ad 4585d2                         test       r10d, r10d
002b0 0f8cb6230000                   jl         0x7fb3b3bd7d6c
002b6 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002bb 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002c0 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
002c5 4183c2f1                       add        r10d, -0xf
002c9 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002d1 458d50f9                       lea        r10d, [r8 - 7]
002d5 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
002dd 4d63d0                         movsxd     r10, r8d
002e0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002e5 4183c0f1                       add        r8d, -0xf
002e9 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
002f1 4983c2f9                       add        r10, -7
002f5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002fa e988040000                     jmp        0x7fb3b3bd5e87
002ff 448bd5                         mov        r10d, ebp
00302 4d63d2                         movsxd     r10, r10d
00305 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0030c c442a8f5db                     bzhi       r11, r11, r10
00311 c4c1fb92fb                     kmovq      k7, r11
00316 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0031c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00322 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0032a 4403dd                         add        r11d, ebp
0032d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00335 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00339 418502                         test       dword ptr [r10], eax
0033c 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00344 0f8d820a0000                   jge        0x7fb3b3bd64cc
0034a 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00351 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00359 442b9424c0000000               sub        r10d, dword ptr [rsp + 0xc0]
00361 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00369 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00370 2bac24c0000000                 sub        ebp, dword ptr [rsp + 0xc0]
00377 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
0037e 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00386 410f4fea                       cmovg      ebp, r10d
0038a 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00392 4585db                         test       r11d, r11d
00395 0f8c091b0000                   jl         0x7fb3b3bd75a4
0039b 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003a3 4585d2                         test       r10d, r10d
003a6 0f8cf81a0000                   jl         0x7fb3b3bd75a4
003ac 458d042b                       lea        r8d, [r11 + rbp]
003b0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
003b5 453bd8                         cmp        r11d, r8d
003b8 0f82e61a0000                   jb         0x7fb3b3bd75a4
003be 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c5 03dd                           add        ebx, ebp
003c7 443bdb                         cmp        r11d, ebx
003ca 0f82d41a0000                   jb         0x7fb3b3bd75a4
003d0 85ed                           test       ebp, ebp
003d2 0f8ccc1a0000                   jl         0x7fb3b3bd75a4
003d8 85ed                           test       ebp, ebp
003da 0f8442ffffff                   je         0x7fb3b3bd5a22
003e0 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
003e8 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003f0 4b8d741308                     lea        rsi, [r11 + r10 + 8]
003f5 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
003fd 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00405 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0040a 4863d5                         movsxd     rdx, ebp
0040d 4883fa20                       cmp        rdx, 0x20
00411 0f86e8feffff                   jbe        0x7fb3b3bd59ff
00417 c5f877                         vzeroupper 
0041a 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00424 41ffd2                         call       r10
00427 0f1f840000000000               nop        dword ptr [rax + rax]
0042f e9eefeffff                     jmp        0x7fb3b3bd5a22
00434 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0043c c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00443 448bac24bc000000               mov        r13d, dword ptr [rsp + 0xbc]
0044b 4503ea                         add        r13d, r10d
0044e e918030000                     jmp        0x7fb3b3bd5e6b
00453 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0045b 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00463 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00468 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
0046d 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00475 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
0047d 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00485 4963ca                         movsxd     rcx, r10d
00488 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00490 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00498 0f8caf060000                   jl         0x7fb3b3bd624d
0049e 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004a6 4183fb30                       cmp        r11d, 0x30
004aa 0f8ea0000000                   jle        0x7fb3b3bd5c50
004b0 4585c9                         test       r9d, r9d
004b3 0f8c4f190000                   jl         0x7fb3b3bd7508
004b9 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004c1 4585db                         test       r11d, r11d
004c4 0f8c3e190000                   jl         0x7fb3b3bd7508
004ca 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
004d2 4503d1                         add        r10d, r9d
004d5 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004da 453bc2                         cmp        r8d, r10d
004dd 0f8225190000                   jb         0x7fb3b3bd7508
004e3 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
004eb 0f8217190000                   jb         0x7fb3b3bd7508
004f1 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004f9 4585db                         test       r11d, r11d
004fc 0f8459020000                   je         0x7fb3b3bd5e5b
00502 4963d3                         movsxd     rdx, r11d
00505 4883fa20                       cmp        rdx, 0x20
00509 7728                           ja         0x7fb3b3bd5c33
0050b 458bd3                         mov        r10d, r11d
0050e 4d63d2                         movsxd     r10, r10d
00511 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00518 c442a8f5db                     bzhi       r11, r11, r10
0051d c4c1fb92fb                     kmovq      k7, r11
00522 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00528 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0052e e928020000                     jmp        0x7fb3b3bd5e5b
00533 c5f877                         vzeroupper 
00536 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00540 41ffd2                         call       r10
00543 0f1f840000000000               nop        dword ptr [rax + rax]
0054b e90b020000                     jmp        0x7fb3b3bd5e5b
00550 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
00558 0f835a150000                   jae        0x7fb3b3bd71b8
0055e 4963d1                         movsxd     rdx, r9d
00561 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00569 4d8b441208                     mov        r8, qword ptr [r10 + rdx + 8]
0056e 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00576 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0057e 0f83d4150000                   jae        0x7fb3b3bd7258
00584 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
0058b 8d7b08                         lea        edi, [rbx + 8]
0058e 4c63d3                         movsxd     r10, ebx
00591 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00599 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
0059e 3bbc24c8000000                 cmp        edi, dword ptr [rsp + 0xc8]
005a5 0f8db0010000                   jge        0x7fb3b3bd5e5b
005ab 492bd2                         sub        rdx, r10
005ae 4c63df                         movsxd     r11, edi
005b1 4d8d1413                       lea        r10, [r11 + rdx]
005b5 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ba 0f8395160000                   jae        0x7fb3b3bd7355
005c0 4c8bd1                         mov        r10, rcx
005c3 4d2bd3                         sub        r10, r11
005c6 4983c207                       add        r10, 7
005ca 4983e2f8                       and        r10, 0xfffffffffffffff8
005ce 458bd2                         mov        r10d, r10d
005d1 458d5c1a08                     lea        r11d, [r10 + rbx + 8]
005d6 4d63d3                         movsxd     r10, r11d
005d9 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
005de 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005e3 0f836c160000                   jae        0x7fb3b3bd7355
005e9 3bbc24b0000000                 cmp        edi, dword ptr [rsp + 0xb0]
005f0 0f835f160000                   jae        0x7fb3b3bd7355
005f6 4983c2f8                       add        r10, -8
005fa 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ff 0f8350160000                   jae        0x7fb3b3bd7355
00605 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
0060d 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00614 0f8fd6160000                   jg         0x7fb3b3bd73f0
0061a 442bcb                         sub        r9d, ebx
0061d 83c310                         add        ebx, 0x10
00620 458d1439                       lea        r10d, [r9 + rdi]
00624 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0062c 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00631 448bdf                         mov        r11d, edi
00634 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
0063c 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
00641 448d4708                       lea        r8d, [rdi + 8]
00645 443bc3                         cmp        r8d, ebx
00648 7d05                           jge        0x7fb3b3bd5d4f
0064a 418bf8                         mov        edi, r8d
0064d ebd1                           jmp        0x7fb3b3bd5d20
0064f 4883c1f8                       add        rcx, -8
00653 4881f900000080                 cmp        rcx, -0x80000000
0065a 49c7c200000080                 mov        r10, 0xffffffff80000000
00661 490f4cca                       cmovl      rcx, r10
00665 448bd1                         mov        r10d, ecx
00668 453bc2                         cmp        r8d, r10d
0066b 0f8d8f000000                   jge        0x7fb3b3bd5e00
00671 4d63d8                         movsxd     r11, r8d
00674 4c03da                         add        r11, rdx
00677 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0067c 0f830e170000                   jae        0x7fb3b3bd7490
00682 83c710                         add        edi, 0x10
00685 4c63df                         movsxd     r11, edi
00688 4c03da                         add        r11, rdx
0068b 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00690 0f830e170000                   jae        0x7fb3b3bd74a4
00696 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
0069e 0f8314170000                   jae        0x7fb3b3bd74b8
006a4 3bbc24b0000000                 cmp        edi, dword ptr [rsp + 0xb0]
006ab 0f831b170000                   jae        0x7fb3b3bd74cc
006b1 90                             nop        
006b2 90                             nop        
006b3 90                             nop        
006b4 90                             nop        
006b5 90                             nop        
006b6 90                             nop        
006b7 90                             nop        
006b8 90                             nop        
006b9 90                             nop        
006ba 90                             nop        
006bb 90                             nop        
006bc 90                             nop        
006bd 90                             nop        
006be 90                             nop        
006bf 90                             nop        
006c0 478d1c01                       lea        r11d, [r9 + r8]
006c4 418bd8                         mov        ebx, r8d
006c7 4863db                         movsxd     rbx, ebx
006ca 418bcb                         mov        ecx, r11d
006cd 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
006d5 488b7c0f08                     mov        rdi, qword ptr [rdi + rcx + 8]
006da 4963cb                         movsxd     rcx, r11d
006dd 458bd8                         mov        r11d, r8d
006e0 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
006e8 4a897c1e08                     mov        qword ptr [rsi + r11 + 8], rdi
006ed 4c8b5c0e10                     mov        r11, qword ptr [rsi + rcx + 0x10]
006f2 4c895c1e10                     mov        qword ptr [rsi + rbx + 0x10], r11
006f7 4183c010                       add        r8d, 0x10
006fb 453bc2                         cmp        r8d, r10d
006fe 7cc0                           jl         0x7fb3b3bd5dc0
00700 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
00708 7d51                           jge        0x7fb3b3bd5e5b
0070a 4d63d0                         movsxd     r10, r8d
0070d 4c03d2                         add        r10, rdx
00710 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
00715 0f83c5160000                   jae        0x7fb3b3bd74e0
0071b 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
00723 0f83cb160000                   jae        0x7fb3b3bd74f4
00729 90                             nop        
0072a 90                             nop        
0072b 90                             nop        
0072c 478d1c01                       lea        r11d, [r9 + r8]
00730 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00738 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
0073d 458bd8                         mov        r11d, r8d
00740 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00748 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
0074d 4183c008                       add        r8d, 8
00751 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
00759 7cd1                           jl         0x7fb3b3bd5e2c
0075b 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
00763 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
0076b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00770 41ffc3                         inc        r11d
00773 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00778 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0077c 418502                         test       dword ptr [r10], eax
0077f 448bb424c4000000               mov        r14d, dword ptr [rsp + 0xc4]
00787 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0078f 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00794 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00799 452bc6                         sub        r8d, r14d
0079c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
007a4 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
007a9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
007ae 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
007b3 0f8d42060000                   jge        0x7fb3b3bd64fb
007b9 443b542408                     cmp        r10d, dword ptr [rsp + 8]
007be 0f83ad0e0000                   jae        0x7fb3b3bd6d71
007c4 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
007cc 4f8b4cd308                     mov        r9, qword ptr [r11 + r10*8 + 8]
007d1 458bd1                         mov        r10d, r9d
007d4 4181e2ffff0100                 and        r10d, 0x1ffff
007db 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
007e3 4d8bd1                         mov        r10, r9
007e6 49c1ea12                       shr        r10, 0x12
007ea 49c1f924                       sar        r9, 0x24
007ee 458bda                         mov        r11d, r10d
007f1 458bd1                         mov        r10d, r9d
007f4 418bda                         mov        ebx, r10d
007f7 4181e3ffff0300                 and        r11d, 0x3ffff
007fe 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00806 4585d2                         test       r10d, r10d
00809 0f8cad100000                   jl         0x7fb3b3bd6fbc
0080f 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00817 4585d2                         test       r10d, r10d
0081a 0f854c020000                   jne        0x7fb3b3bd616c
00820 4533d2                         xor        r10d, r10d
00823 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0082b 448bd3                         mov        r10d, ebx
0082e 4183fa03                       cmp        r10d, 3
00832 0f8e70020000                   jle        0x7fb3b3bd61a8
00838 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00840 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00844 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0084c 45895310                       mov        dword ptr [r11 + 0x10], r10d
00850 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00854 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0085c 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00860 448d53fd                       lea        r10d, [rbx - 3]
00864 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0086c 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00874 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0087c 45895a08                       mov        dword ptr [r10 + 8], r11d
00880 48639c24c0000000               movsxd     rbx, dword ptr [rsp + 0xc0]
00888 48895c2440                     mov        qword ptr [rsp + 0x40], rbx
0088d 4d63c5                         movsxd     r8, r13d
00890 4c03442478                     add        r8, qword ptr [rsp + 0x78]
00895 48639424b8000000               movsxd     rdx, dword ptr [rsp + 0xb8]
0089d 4c03c2                         add        r8, rdx
008a0 493bd8                         cmp        rbx, r8
008a3 0f8f83100000                   jg         0x7fb3b3bd702c
008a9 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
008b1 4585db                         test       r11d, r11d
008b4 0f8ece0f0000                   jle        0x7fb3b3bd6f88
008ba 418bdd                         mov        ebx, r13d
008bd 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
008c4 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008cc 4403d3                         add        r10d, ebx
008cf 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
008d4 0f8fda100000                   jg         0x7fb3b3bd70b4
008da 458bd6                         mov        r10d, r14d
008dd 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
008e5 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
008ed 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
008f5 0f8f31110000                   jg         0x7fb3b3bd712c
008fb 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00903 4183fa10                       cmp        r10d, 0x10
00907 0f8f74050000                   jg         0x7fb3b3bd6581
0090d 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00915 0f83c10d0000                   jae        0x7fb3b3bd6ddc
0091b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00923 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0092a 443bac24b4000000               cmp        r13d, dword ptr [rsp + 0xb4]
00932 0f832c0e0000                   jae        0x7fb3b3bd6e64
00938 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00940 4503de                         add        r11d, r14d
00943 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0094b 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00953 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
0095a 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00962 4503d5                         add        r10d, r13d
00965 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0096d 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
00975 442b8c24c0000000               sub        r9d, dword ptr [rsp + 0xc0]
0097d 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00985 4183fa10                       cmp        r10d, 0x10
00989 0f8fc4faffff                   jg         0x7fb3b3bd5b53
0098f 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00997 4183fb10                       cmp        r11d, 0x10
0099b 0f8cb2faffff                   jl         0x7fb3b3bd5b53
009a1 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
009a9 0f83610e0000                   jae        0x7fb3b3bd6f10
009af 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
009b7 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
009be 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
009c6 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
009ce 0f8260faffff                   jb         0x7fb3b3bd5b34
009d4 bee4ffffff                     mov        esi, 0xffffffe4
009d9 488b2c24                       mov        rbp, qword ptr [rsp]
009dd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009e2 44895c2408                     mov        dword ptr [rsp + 8], r11d
009e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009f1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009f6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
009fb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00a00 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00a05 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00a0a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00a0f 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00a17 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00a1c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00a21 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00a26 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00a2e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00a33 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00a38 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00a3d c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00a46 90                             nop        
00a47 90                             nop        
00a48 c5f877                         vzeroupper 
00a4b e81079afff                     call       0x7fb3b36cda60
00a50 0f1f8400480b0002               nop        dword ptr [rax + rax + 0x2000b48]
00a58 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
00a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a66 e8b50a6618                     call       0x7fb3cc236c20
00a6b f4                             hlt        
00a6c 453bd0                         cmp        r10d, r8d
00a6f 0f8eb6fdffff                   jle        0x7fb3b3bd5f2b
00a75 be45ffffff                     mov        esi, 0xffffff45
00a7a 418bea                         mov        ebp, r10d
00a7d 44890424                       mov        dword ptr [rsp], r8d
00a81 90                             nop        
00a82 90                             nop        
00a83 90                             nop        
00a84 c5f877                         vzeroupper 
00a87 e8d478afff                     call       0x7fb3b36cda60
00a8c 0f1f8400840b0003               nop        dword ptr [rax + rax + 0x3000b84]
00a94 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
00a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aa2 e8790a6618                     call       0x7fb3cc236c20
00aa7 f4                             hlt        
00aa8 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ab0 4585d2                         test       r10d, r10d
00ab3 7407                           je         0x7fb3b3bd61bc
00ab5 448d53ff                       lea        r10d, [rbx - 1]
00ab9 418bda                         mov        ebx, r10d
00abc 85db                           test       ebx, ebx
00abe 7474                           je         0x7fb3b3bd6234
00ac0 83fb03                         cmp        ebx, 3
00ac3 0f84e3160000                   je         0x7fb3b3bd78ac
00ac9 83fb02                         cmp        ebx, 2
00acc 0f8766170000                   ja         0x7fb3b3bd7938
00ad2 3b5c240c                       cmp        ebx, dword ptr [rsp + 0xc]
00ad6 0f83a4150000                   jae        0x7fb3b3bd7780
00adc 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00ae4 458b449b08                     mov        r8d, dword ptr [r11 + rbx*4 + 8]
00ae9 85db                           test       ebx, ebx
00aeb 7e39                           jle        0x7fb3b3bd6226
00aed 448d53ff                       lea        r10d, [rbx - 1]
00af1 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00af6 0f8320160000                   jae        0x7fb3b3bd781c
00afc 90                             nop        
00afd 90                             nop        
00afe 90                             nop        
00aff 90                             nop        
00b00 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00b08 458b549b04                     mov        r10d, dword ptr [r11 + rbx*4 + 4]
00b0d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00b15 4589549908                     mov        dword ptr [r9 + rbx*4 + 8], r10d
00b1a 448d53ff                       lea        r10d, [rbx - 1]
00b1e 418bda                         mov        ebx, r10d
00b21 4585d2                         test       r10d, r10d
00b24 7fda                           jg         0x7fb3b3bd6200
00b26 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b2e 45894208                       mov        dword ptr [r10 + 8], r8d
00b32 eb0c                           jmp        0x7fb3b3bd6240
00b34 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b3c 458b4208                       mov        r8d, dword ptr [r10 + 8]
00b40 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00b48 e933fdffff                     jmp        0x7fb3b3bd5f80
00b4d 4183fa10                       cmp        r10d, 0x10
00b51 0f8db11a0000                   jge        0x7fb3b3bd7d08
00b57 4183fa08                       cmp        r10d, 8
00b5b 0f8da0040000                   jge        0x7fb3b3bd6701
00b61 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b69 4183fa10                       cmp        r10d, 0x10
00b6d 0f8ebd000000                   jle        0x7fb3b3bd6330
00b73 4585c9                         test       r9d, r9d
00b76 0f8cf0190000                   jl         0x7fb3b3bd7c6c
00b7c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b84 4585db                         test       r11d, r11d
00b87 0f8cdf190000                   jl         0x7fb3b3bd7c6c
00b8d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00b92 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00b9a 0f82cc190000                   jb         0x7fb3b3bd7c6c
00ba0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00ba8 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00bb0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00bb8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00bbd 453bda                         cmp        r11d, r10d
00bc0 0f82a6190000                   jb         0x7fb3b3bd7c6c
00bc6 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00bce 4585db                         test       r11d, r11d
00bd1 0f8c95190000                   jl         0x7fb3b3bd7c6c
00bd7 4585db                         test       r11d, r11d
00bda 0f8471f7ffff                   je         0x7fb3b3bd5a51
00be0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00be5 4983fa20                       cmp        r10, 0x20
00be9 7725                           ja         0x7fb3b3bd6310
00beb 4d63d3                         movsxd     r10, r11d
00bee 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bf5 c442a8f5db                     bzhi       r11, r11, r10
00bfa c4c1fb92fb                     kmovq      k7, r11
00bff 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c05 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c0b e941f7ffff                     jmp        0x7fb3b3bd5a51
00c10 498bd2                         mov        rdx, r10
00c13 c5f877                         vzeroupper 
00c16 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00c20 41ffd2                         call       r10
00c23 0f1f840000000000               nop        dword ptr [rax + rax]
00c2b e921f7ffff                     jmp        0x7fb3b3bd5a51
00c30 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00c35 0f8389160000                   jae        0x7fb3b3bd79c4
00c3b 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c43 430fbe6c0a08                   movsx      ebp, byte ptr [r10 + r9 + 8]
00c49 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c51 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c56 0f8308170000                   jae        0x7fb3b3bd7a64
00c5c 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c64 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c6c 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00c71 458d5103                       lea        r10d, [r9 + 3]
00c75 41ffc3                         inc        r11d
00c78 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00c80 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c85 0f835d170000                   jae        0x7fb3b3bd7ae8
00c8b 4d63d1                         movsxd     r10, r9d
00c8e 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00c96 430fbe6c1309                   movsx      ebp, byte ptr [r11 + r10 + 9]
00c9c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00ca4 4183c303                       add        r11d, 3
00ca8 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00cad 0f83bd170000                   jae        0x7fb3b3bd7b70
00cb3 4c638424b8000000               movsxd     r8, dword ptr [rsp + 0xb8]
00cbb 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00cc3 43886c0309                     mov        byte ptr [r11 + r8 + 9], bpl
00cc8 470fbe5c130a                   movsx      r11d, byte ptr [r11 + r10 + 0xa]
00cce 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00cd6 46885c010a                     mov        byte ptr [rcx + r8 + 0xa], r11b
00cdb 460fbe5c110b                   movsx      r11d, byte ptr [rcx + r10 + 0xb]
00ce1 46885c010b                     mov        byte ptr [rcx + r8 + 0xb], r11b
00ce6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00cee 4183fa08                       cmp        r10d, 8
00cf2 0f83f0170000                   jae        0x7fb3b3bd7be8
00cf8 49bb283b27e300000000           movabs     r11, 0xe3273b28
00d02 47034c9308                     add        r9d, dword ptr [r11 + r10*4 + 8]
00d07 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d0c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00d14 4183fb04                       cmp        r11d, 4
00d18 7e42                           jle        0x7fb3b3bd645c
00d1a 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d21 83c504                         add        ebp, 4
00d24 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d2c 418bd1                         mov        edx, r9d
00d2f 90                             nop        
00d30 c5f877                         vzeroupper 
00d33 e82898b5ff                     call       0x7fb3b372fc60
00d38 0f1f8400300e0004               nop        dword ptr [rax + rax + 0x4000e30]
00d40 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d48 8bd5                           mov        edx, ebp
00d4a 8bc8                           mov        ecx, eax
00d4c c5f877                         vzeroupper 
00d4f e80c98b5ff                     call       0x7fb3b372fc60
00d54 0f1f84004c0e0005               nop        dword ptr [rax + rax + 0x5000e4c]
00d5c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00d64 4183fa08                       cmp        r10d, 8
00d68 7e62                           jle        0x7fb3b3bd64cc
00d6a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d6e 49ba503b27e300000000           movabs     r10, 0xe3273b50
00d78 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d80 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00d85 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d8c 83c508                         add        ebp, 8
00d8f 83c208                         add        edx, 8
00d92 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d9a 90                             nop        
00d9b 90                             nop        
00d9c c5f877                         vzeroupper 
00d9f e8bc97b5ff                     call       0x7fb3b372fc60
00da4 0f1f84009c0e0006               nop        dword ptr [rax + rax + 0x6000e9c]
00dac 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00db4 8bd5                           mov        edx, ebp
00db6 488bc8                         mov        rcx, rax
00db9 90                             nop        
00dba 90                             nop        
00dbb 90                             nop        
00dbc c5f877                         vzeroupper 
00dbf e89c97b5ff                     call       0x7fb3b372fc60
00dc4 0f1f8400bc0e0007               nop        dword ptr [rax + rax + 0x7000ebc]
00dcc 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
00dd4 e992f9ffff                     jmp        0x7fb3b3bd5e6b
00dd9 4d63d0                         movsxd     r10, r8d
00ddc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00de3 c442a8f5db                     bzhi       r11, r11, r10
00de8 c4c1fb92fb                     kmovq      k7, r11
00ded 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00df3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00df9 eb68                           jmp        0x7fb3b3bd6563
00dfb 4585f6                         test       r14d, r14d
00dfe 0f8c00190000                   jl         0x7fb3b3bd7e04
00e04 4585ed                         test       r13d, r13d
00e07 0f8cf7180000                   jl         0x7fb3b3bd7e04
00e0d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e12 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00e17 0f82e7180000                   jb         0x7fb3b3bd7e04
00e1d 438d2c28                       lea        ebp, [r8 + r13]
00e21 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e26 443bdd                         cmp        r11d, ebp
00e29 0f82d5180000                   jb         0x7fb3b3bd7e04
00e2f 4585c0                         test       r8d, r8d
00e32 0f8ccc180000                   jl         0x7fb3b3bd7e04
00e38 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e3d 453bd6                         cmp        r10d, r14d
00e40 7421                           je         0x7fb3b3bd6563
00e42 4963d0                         movsxd     rdx, r8d
00e45 4883fa20                       cmp        rdx, 0x20
00e49 768e                           jbe        0x7fb3b3bd64d9
00e4b c5f877                         vzeroupper 
00e4e 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00e58 41ffd2                         call       r10
00e5b 0f1f840000000000               nop        dword ptr [rax + rax]
00e63 4c8b1424                       mov        r10, qword ptr [rsp]
00e67 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e6b c5f877                         vzeroupper 
00e6e 4881c400010000                 add        rsp, 0x100
00e75 5d                             pop        rbp
00e76 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e7a 0f875c1f0000                   ja         0x7fb3b3bd84dc
00e80 c3                             ret        
00e81 4183fa30                       cmp        r10d, 0x30
00e85 0f8e8c000000                   jle        0x7fb3b3bd6617
00e8b 4585f6                         test       r14d, r14d
00e8e 0f8c301c0000                   jl         0x7fb3b3bd81c4
00e94 4585ed                         test       r13d, r13d
00e97 0f8c271c0000                   jl         0x7fb3b3bd81c4
00e9d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00ea2 443b9c24c4000000               cmp        r11d, dword ptr [rsp + 0xc4]
00eaa 0f82141c0000                   jb         0x7fb3b3bd81c4
00eb0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00eb5 443bd3                         cmp        r10d, ebx
00eb8 0f82061c0000                   jb         0x7fb3b3bd81c4
00ebe 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ec6 4585d2                         test       r10d, r10d
00ec9 7426                           je         0x7fb3b3bd65f1
00ecb 4883fa20                       cmp        rdx, 0x20
00ecf 772c                           ja         0x7fb3b3bd65fd
00ed1 4d63d2                         movsxd     r10, r10d
00ed4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00edb c442a8f5db                     bzhi       r11, r11, r10
00ee0 c4c1fb92fb                     kmovq      k7, r11
00ee5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00eeb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ef1 899c24b8000000                 mov        dword ptr [rsp + 0xb8], ebx
00ef8 e970faffff                     jmp        0x7fb3b3bd606d
00efd c5f877                         vzeroupper 
00f00 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00f0a 41ffd2                         call       r10
00f0d 0f1f840000000000               nop        dword ptr [rax + rax]
00f15 ebda                           jmp        0x7fb3b3bd65f1
00f17 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00f1f 0f835b1a0000                   jae        0x7fb3b3bd8080
00f25 4d63de                         movsxd     r11, r14d
00f28 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f30 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00f37 443bac24b4000000               cmp        r13d, dword ptr [rsp + 0xb4]
00f3f 0f83db1a0000                   jae        0x7fb3b3bd8120
00f45 458d5510                       lea        r10d, [r13 + 0x10]
00f49 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00f51 4d63d5                         movsxd     r10, r13d
00f54 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00f5c c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00f63 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00f6b 443bc3                         cmp        r8d, ebx
00f6e 0f8dde060000                   jge        0x7fb3b3bd6d52
00f74 4d2bda                         sub        r11, r10
00f77 4d63d0                         movsxd     r10, r8d
00f7a 486374241c                     movsxd     rsi, dword ptr [rsp + 0x1c]
00f7f 4883c6f1                       add        rsi, -0xf
00f83 4f8d041a                       lea        r8, [r10 + r11]
00f87 4c3bc6                         cmp        r8, rsi
00f8a 0f83d81b0000                   jae        0x7fb3b3bd8268
00f90 4863fb                         movsxd     rdi, ebx
00f93 4c8bc7                         mov        r8, rdi
00f96 4d2bc2                         sub        r8, r10
00f99 4983c00f                       add        r8, 0xf
00f9d 4983e0f0                       and        r8, 0xfffffffffffffff0
00fa1 458bc0                         mov        r8d, r8d
00fa4 478d542810                     lea        r10d, [r8 + r13 + 0x10]
00fa9 4d63d2                         movsxd     r10, r10d
00fac 4f8d441af0                     lea        r8, [r10 + r11 - 0x10]
00fb1 4c3bc6                         cmp        r8, rsi
00fb4 0f83ae1b0000                   jae        0x7fb3b3bd8268
00fba 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00fc2 443b8424b4000000               cmp        r8d, dword ptr [rsp + 0xb4]
00fca 0f83981b0000                   jae        0x7fb3b3bd8268
00fd0 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00fd5 4983c0f1                       add        r8, -0xf
00fd9 4983c2f0                       add        r10, -0x10
00fdd 4d3bd0                         cmp        r10, r8
00fe0 0f83821b0000                   jae        0x7fb3b3bd8268
00fe6 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00fec 0f8fea1b0000                   jg         0x7fb3b3bd82dc
00ff2 418bce                         mov        ecx, r14d
00ff5 412bcd                         sub        ecx, r13d
00ff8 4183c520                       add        r13d, 0x20
00ffc e91b040000                     jmp        0x7fb3b3bd6b1c
01001 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
01009 0f8331170000                   jae        0x7fb3b3bd7e40
0100f 4963f9                         movsxd     rdi, r9d
01012 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0101a 4d8b543a08                     mov        r10, qword ptr [r10 + rdi + 8]
0101f 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01027 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0102f 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01037 0f8397170000                   jae        0x7fb3b3bd7ed4
0103d 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01045 418d6a08                       lea        ebp, [r10 + 8]
01049 4d63da                         movsxd     r11, r10d
0104c 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01054 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0105c 4b895c1808                     mov        qword ptr [r8 + r11 + 8], rbx
01061 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01068 0f8d99030000                   jge        0x7fb3b3bd6b07
0106e 492bfb                         sub        rdi, r11
01071 4c63c5                         movsxd     r8, ebp
01074 4d8d1c38                       lea        r11, [r8 + rdi]
01078 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0107d 0f83d5170000                   jae        0x7fb3b3bd7f58
01083 4c8bd9                         mov        r11, rcx
01086 4d2bd8                         sub        r11, r8
01089 4983c307                       add        r11, 7
0108d 4983e3f8                       and        r11, 0xfffffffffffffff8
01091 418bdb                         mov        ebx, r11d
01094 468d5c1308                     lea        r11d, [rbx + r10 + 8]
01099 4d63db                         movsxd     r11, r11d
0109c 498d5c3bf8                     lea        rbx, [r11 + rdi - 8]
010a1 483b5c2438                     cmp        rbx, qword ptr [rsp + 0x38]
010a6 0f83ac170000                   jae        0x7fb3b3bd7f58
010ac 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
010b3 0f839f170000                   jae        0x7fb3b3bd7f58
010b9 4983c3f8                       add        r11, -8
010bd 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
010c2 0f8390170000                   jae        0x7fb3b3bd7f58
010c8 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
010d0 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
010d7 0f8fe3170000                   jg         0x7fb3b3bd7fc0
010dd 452bca                         sub        r9d, r10d
010e0 b8f8ffffff                     mov        eax, 0xfffffff8
010e5 418d5210                       lea        edx, [r10 + 0x10]
010e9 4c8d59c8                       lea        r11, [rcx - 0x38]
010ed 4981fb00000080                 cmp        r11, -0x80000000
010f4 48c7c300000080                 mov        rbx, 0xffffffff80000000
010fb 4c0f4cdb                       cmovl      r11, rbx
010ff 418bdb                         mov        ebx, r11d
01102 4c63ea                         movsxd     r13, edx
01105 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0110d 458bdb                         mov        r11d, r11d
01110 412bc3                         sub        eax, r11d
01113 412bc2                         sub        eax, r10d
01116 83c0f0                         add        eax, -0x10
01119 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01121 4d8bda                         mov        r11, r10
01124 41ba06000000                   mov        r10d, 6
0112a c462a8f5d0                     bzhi       r10, rax, r10
0112f 4d03ea                         add        r13, r10
01132 4c3be9                         cmp        r13, rcx
01135 488bf1                         mov        rsi, rcx
01138 490f4cf5                       cmovl      rsi, r13
0113c 4c8bd6                         mov        r10, rsi
0113f 4d2bd0                         sub        r10, r8
01142 498d42ff                       lea        rax, [r10 - 1]
01146 48c1f83f                       sar        rax, 0x3f
0114a 48c1e83d                       shr        rax, 0x3d
0114e 4e8d5410ff                     lea        r10, [rax + r10 - 1]
01153 4983e2f8                       and        r10, 0xfffffffffffffff8
01157 4d03d0                         add        r10, r8
0115a 4d3bc2                         cmp        r8, r10
0115d 4d0f4cc2                       cmovl      r8, r10
01161 458bd0                         mov        r10d, r8d
01164 458d4208                       lea        r8d, [r10 + 8]
01168 442b9424c0000000               sub        r10d, dword ptr [rsp + 0xc0]
01170 4963c0                         movsxd     rax, r8d
01173 4903c3                         add        rax, r11
01176 4183c208                       add        r10d, 8
0117a 4d63c2                         movsxd     r8, r10d
0117d 4d03c3                         add        r8, r11
01180 4c8d5848                       lea        r11, [rax + 0x48]
01184 4883c008                       add        rax, 8
01188 4d8d6808                       lea        r13, [r8 + 8]
0118c 4533d2                         xor        r10d, r10d
0118f 4d3bdd                         cmp        r11, r13
01192 410f96c2                       setbe      r10b
01196 4983c048                       add        r8, 0x48
0119a 4d8be8                         mov        r13, r8
0119d 4533c0                         xor        r8d, r8d
011a0 4c3be8                         cmp        r13, rax
011a3 410f96c0                       setbe      r8b
011a7 450bd0                         or         r10d, r8d
011aa 0f84770d0000                   je         0x7fb3b3bd7627
011b0 448bd6                         mov        r10d, esi
011b3 eb06                           jmp        0x7fb3b3bd68bb
011b5 90                             nop        
011b6 90                             nop        
011b7 90                             nop        
011b8 418be8                         mov        ebp, r8d
011bb 448bdd                         mov        r11d, ebp
011be 458d0429                       lea        r8d, [r9 + rbp]
011c2 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
011ca 4e8b440208                     mov        r8, qword ptr [rdx + r8 + 8]
011cf 4e89441a08                     mov        qword ptr [rdx + r11 + 8], r8
011d4 448d4508                       lea        r8d, [rbp + 8]
011d8 453bc2                         cmp        r8d, r10d
011db 7cdb                           jl         0x7fb3b3bd68b8
011dd 4881c108feffff                 add        rcx, -0x1f8
011e4 4881f900000080                 cmp        rcx, -0x80000000
011eb 49c7c200000080                 mov        r10, 0xffffffff80000000
011f2 490f4cca                       cmovl      rcx, r10
011f6 8bc9                           mov        ecx, ecx
011f8 443bc1                         cmp        r8d, ecx
011fb 0f8d27170000                   jge        0x7fb3b3bd8028
01201 4d63d0                         movsxd     r10, r8d
01204 4c03d7                         add        r10, rdi
01207 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0120c 0f831e170000                   jae        0x7fb3b3bd8030
01212 81c500020000                   add        ebp, 0x200
01218 4c63d5                         movsxd     r10, ebp
0121b 4c03d7                         add        r10, rdi
0121e 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01223 0f831b170000                   jae        0x7fb3b3bd8044
01229 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
01231 0f8321170000                   jae        0x7fb3b3bd8058
01237 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
0123e 0f8328170000                   jae        0x7fb3b3bd806c
01244 48897c2440                     mov        qword ptr [rsp + 0x40], rdi
01249 eb08                           jmp        0x7fb3b3bd6953
0124b 90                             nop        
0124c 90                             nop        
0124d 90                             nop        
0124e 90                             nop        
0124f 90                             nop        
01250 458bc3                         mov        r8d, r11d
01253 458d9000010000                 lea        r10d, [r8 + 0x100]
0125a 4503d1                         add        r10d, r9d
0125d 418d8080000000                 lea        eax, [r8 + 0x80]
01264 4103c1                         add        eax, r9d
01267 418bfa                         mov        edi, r10d
0126a 4d63da                         movsxd     r11, r10d
0126d 8bf0                           mov        esi, eax
0126f 4c63e8                         movsxd     r13, eax
01272 418bd0                         mov        edx, r8d
01275 438d2c01                       lea        ebp, [r9 + r8]
01279 458bd0                         mov        r10d, r8d
0127c 4d63d2                         movsxd     r10, r10d
0127f 8bc5                           mov        eax, ebp
01281 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
01289 62d17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 8]
01294 62d17e487f841608000000         vmovdqu32  zmmword ptr [r14 + rdx + 8], zmm0
0129f 4863c5                         movsxd     rax, ebp
012a2 62d17e486f840648000000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x48]
012ad 62917e487f841648000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x48], zmm0
012b8 62d17e486f843608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 8]
012c3 62917e487f841688000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x88], zmm0
012ce 62917e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + r13 + 0x48]
012d9 62917e487f8416c8000000         vmovdqu32  zmmword ptr [r14 + r10 + 0xc8], zmm0
012e4 62d17e486f843e08000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdi + 8]
012ef 62917e487f841608010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x108], zmm0
012fa 62917e486f841e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + r11 + 0x48]
01305 62917e487f841648010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x148], zmm0
01310 62d17e486f840688010000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x188]
0131b 62917e487f841688010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x188], zmm0
01326 62d17e486f8406c8010000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x1c8]
01331 62917e487f8416c8010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x1c8], zmm0
0133c 458d9800020000                 lea        r11d, [r8 + 0x200]
01343 443bd9                         cmp        r11d, ecx
01346 0f8c04ffffff                   jl         0x7fb3b3bd6950
0134c 443bdb                         cmp        r11d, ebx
0134f 7d59                           jge        0x7fb3b3bd6aaa
01351 4181c038020000                 add        r8d, 0x238
01358 4d63d0                         movsxd     r10, r8d
0135b 4c03542440                     add        r10, qword ptr [rsp + 0x40]
01360 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01365 0f8335190000                   jae        0x7fb3b3bd83a0
0136b 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
01373 0f834f190000                   jae        0x7fb3b3bd83c8
01379 90                             nop        
0137a 90                             nop        
0137b 90                             nop        
0137c 458bc3                         mov        r8d, r11d
0137f 478d1419                       lea        r10d, [r9 + r11]
01383 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
0138b 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
01396 62b17e487f840108000000         vmovdqu32  zmmword ptr [rcx + r8 + 8], zmm0
013a1 4183c340                       add        r11d, 0x40
013a5 443bdb                         cmp        r11d, ebx
013a8 7cd2                           jl         0x7fb3b3bd6a7c
013aa 488b7c2440                     mov        rdi, qword ptr [rsp + 0x40]
013af 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
013b7 7d4e                           jge        0x7fb3b3bd6b07
013b9 4d63d3                         movsxd     r10, r11d
013bc 4c03d7                         add        r10, rdi
013bf 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
013c4 0f83ea180000                   jae        0x7fb3b3bd83b4
013ca 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
013d2 0f8304190000                   jae        0x7fb3b3bd83dc
013d8 478d1419                       lea        r10d, [r9 + r11]
013dc 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
013e4 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
013e9 458bc3                         mov        r8d, r11d
013ec 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
013f4 4e89540108                     mov        qword ptr [rcx + r8 + 8], r10
013f9 4183c308                       add        r11d, 8
013fd 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01405 7cd1                           jl         0x7fb3b3bd6ad8
01407 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
0140f e957f3ffff                     jmp        0x7fb3b3bd5e6b
01414 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
0141c 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
01424 448bd1                         mov        r10d, ecx
01427 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
0142f 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01437 c4817a6f441108                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 8]
0143e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01446 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
0144d 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
01455 4183c110                       add        r9d, 0x10
01459 453bcd                         cmp        r9d, r13d
0145c 7cb6                           jl         0x7fb3b3bd6b14
0145e 4881c710ffffff                 add        rdi, -0xf0
01465 4881ff00000080                 cmp        rdi, -0x80000000
0146c 49c7c200000080                 mov        r10, 0xffffffff80000000
01473 490f4cfa                       cmovl      rdi, r10
01477 448bc7                         mov        r8d, edi
0147a 453bc8                         cmp        r9d, r8d
0147d 0f8d7e010000                   jge        0x7fb3b3bd6d01
01483 4d63d1                         movsxd     r10, r9d
01486 4d03d3                         add        r10, r11
01489 4c3bd6                         cmp        r10, rsi
0148c 0f83be170000                   jae        0x7fb3b3bd8350
01492 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0149a 4181c200010000                 add        r10d, 0x100
014a1 4963fa                         movsxd     rdi, r10d
014a4 4903fb                         add        rdi, r11
014a7 483bfe                         cmp        rdi, rsi
014aa 0f83b4170000                   jae        0x7fb3b3bd8364
014b0 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
014b8 0f83ba170000                   jae        0x7fb3b3bd8378
014be 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
014c6 0f83c0170000                   jae        0x7fb3b3bd838c
014cc 90                             nop        
014cd 90                             nop        
014ce 90                             nop        
014cf 90                             nop        
014d0 418bf9                         mov        edi, r9d
014d3 4c63d7                         movsxd     r10, edi
014d6 428d1409                       lea        edx, [rcx + r9]
014da 418bf9                         mov        edi, r9d
014dd 8bc2                           mov        eax, edx
014df 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
014e7 c5fa6f440508                   vmovdqu    xmm0, xmmword ptr [rbp + rax + 8]
014ed 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
014f5 c5fa7f443808                   vmovdqu    xmmword ptr [rax + rdi + 8], xmm0
014fb 4863d2                         movsxd     rdx, edx
014fe c5fa6f441518                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x18]
01504 c4a17a7f441018                 vmovdqu    xmmword ptr [rax + r10 + 0x18], xmm0
0150b c5fa6f441528                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x28]
01511 c4a17a7f441028                 vmovdqu    xmmword ptr [rax + r10 + 0x28], xmm0
01518 c5fa6f441538                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x38]
0151e c4a17a7f441038                 vmovdqu    xmmword ptr [rax + r10 + 0x38], xmm0
01525 c5fa6f441548                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x48]
0152b c4a17a7f441048                 vmovdqu    xmmword ptr [rax + r10 + 0x48], xmm0
01532 c5fa6f441558                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x58]
01538 c4a17a7f441058                 vmovdqu    xmmword ptr [rax + r10 + 0x58], xmm0
0153f c5fa6f441568                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x68]
01545 c4a17a7f441068                 vmovdqu    xmmword ptr [rax + r10 + 0x68], xmm0
0154c c5fa6f441578                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x78]
01552 c4a17a7f441078                 vmovdqu    xmmword ptr [rax + r10 + 0x78], xmm0
01559 c5fa6f841588000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x88]
01562 c4a17a7f841088000000           vmovdqu    xmmword ptr [rax + r10 + 0x88], xmm0
0156c c5fa6f841598000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x98]
01575 c4a17a7f841098000000           vmovdqu    xmmword ptr [rax + r10 + 0x98], xmm0
0157f c5fa6f8415a8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xa8]
01588 c4a17a7f8410a8000000           vmovdqu    xmmword ptr [rax + r10 + 0xa8], xmm0
01592 c5fa6f8415b8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xb8]
0159b c4a17a7f8410b8000000           vmovdqu    xmmword ptr [rax + r10 + 0xb8], xmm0
015a5 c5fa6f8415c8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xc8]
015ae c4a17a7f8410c8000000           vmovdqu    xmmword ptr [rax + r10 + 0xc8], xmm0
015b8 c5fa6f8415d8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xd8]
015c1 c4a17a7f8410d8000000           vmovdqu    xmmword ptr [rax + r10 + 0xd8], xmm0
015cb c5fa6f8415e8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xe8]
015d4 c4a17a7f8410e8000000           vmovdqu    xmmword ptr [rax + r10 + 0xe8], xmm0
015de c5fa6f8415f8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xf8]
015e7 c4a17a7f8410f8000000           vmovdqu    xmmword ptr [rax + r10 + 0xf8], xmm0
015f1 4181c100010000                 add        r9d, 0x100
015f8 453bc8                         cmp        r9d, r8d
015fb 0f8ccffeffff                   jl         0x7fb3b3bd6bd0
01601 443bcb                         cmp        r9d, ebx
01604 7d4c                           jge        0x7fb3b3bd6d52
01606 4d63d1                         movsxd     r10, r9d
01609 4d03d3                         add        r10, r11
0160c 4c3bd6                         cmp        r10, rsi
0160f 0f83db160000                   jae        0x7fb3b3bd83f0
01615 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
0161d 0f83e1160000                   jae        0x7fb3b3bd8404
01623 90                             nop        
01624 468d1409                       lea        r10d, [rcx + r9]
01628 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01630 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
01637 458bd9                         mov        r11d, r9d
0163a 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01642 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
01649 4183c110                       add        r9d, 0x10
0164d 443bcb                         cmp        r9d, ebx
01650 7cd2                           jl         0x7fb3b3bd6d24
01652 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0165a 4503d6                         add        r10d, r14d
0165d 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01665 899c24b8000000                 mov        dword ptr [rsp + 0xb8], ebx
0166c e9fcf2ffff                     jmp        0x7fb3b3bd606d
01671 bee4ffffff                     mov        esi, 0xffffffe4
01676 488b2c24                       mov        rbp, qword ptr [rsp]
0167a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0167f 4489542408                     mov        dword ptr [rsp + 8], r10d
01684 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01689 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0168e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01693 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01698 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0169d 4489742434                     mov        dword ptr [rsp + 0x34], r14d
016a2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016a7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016ac 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
016b1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016b6 90                             nop        
016b7 90                             nop        
016b8 c5f877                         vzeroupper 
016bb e8a06cafff                     call       0x7fb3b36cda60
016c0 0f1f8400b8170008               nop        dword ptr [rax + rax + 0x80017b8]
016c8 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
016d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016d6 e845fe6518                     call       0x7fb3cc236c20
016db f4                             hlt        
016dc bee4ffffff                     mov        esi, 0xffffffe4
016e1 488b2c24                       mov        rbp, qword ptr [rsp]
016e5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016ea 44895c2408                     mov        dword ptr [rsp + 8], r11d
016ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016f4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016fe 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01703 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01708 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0170d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01712 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01717 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0171c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01721 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01726 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0172b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01730 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01735 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0173a 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0173f 90                             nop        
01740 c5f877                         vzeroupper 
01743 e8186cafff                     call       0x7fb3b36cda60
01748 0f1f840040180009               nop        dword ptr [rax + rax + 0x9001840]
01750 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0175a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0175e e8bdfd6518                     call       0x7fb3cc236c20
01763 f4                             hlt        
01764 bee4ffffff                     mov        esi, 0xffffffe4
01769 488b2c24                       mov        rbp, qword ptr [rsp]
0176d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01772 4489542408                     mov        dword ptr [rsp + 8], r10d
01777 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0177c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01781 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01786 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0178b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01790 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01795 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0179a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0179f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
017a4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
017a9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017ae 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017b6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017bb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017c0 4489542458                     mov        dword ptr [rsp + 0x58], r10d
017c5 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
017cd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017d2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017d7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017dc 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
017e1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017ea 90                             nop        
017eb 90                             nop        
017ec c5f877                         vzeroupper 
017ef e86c6bafff                     call       0x7fb3b36cda60
017f4 0f1f8400ec18000a               nop        dword ptr [rax + rax + 0xa0018ec]
017fc 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01806 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180a e811fd6518                     call       0x7fb3cc236c20
0180f f4                             hlt        
01810 bee4ffffff                     mov        esi, 0xffffffe4
01815 488b2c24                       mov        rbp, qword ptr [rsp]
01819 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0181e 4489542408                     mov        dword ptr [rsp + 8], r10d
01823 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01828 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0182d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01832 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01837 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0183c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01841 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01846 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0184b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01850 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01855 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0185a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0185f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01864 c5f877                         vzeroupper 
01867 e8f46aafff                     call       0x7fb3b36cda60
0186c 0f1f84006419000b               nop        dword ptr [rax + rax + 0xb001964]
01874 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0187e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01882 e899fc6518                     call       0x7fb3cc236c20
01887 f4                             hlt        
01888 be45ffffff                     mov        esi, 0xffffff45
0188d 488b2c24                       mov        rbp, qword ptr [rsp]
01891 4c89442408                     mov        qword ptr [rsp + 8], r8
01896 90                             nop        
01897 90                             nop        
01898 c5f877                         vzeroupper 
0189b e8c06aafff                     call       0x7fb3b36cda60
018a0 0f1f84009819000c               nop        dword ptr [rax + rax + 0xc001998]
018a8 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
018b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b6 e865fc6518                     call       0x7fb3cc236c20
018bb f4                             hlt        
018bc be45ffffff                     mov        esi, 0xffffff45
018c1 488b2c24                       mov        rbp, qword ptr [rsp]
018c5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018ca 44895c2408                     mov        dword ptr [rsp + 8], r11d
018cf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018d9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018de 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018e3 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
018e8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018ed 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018f2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018f7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018fc 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01901 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01905 90                             nop        
01906 90                             nop        
01907 90                             nop        
01908 c5f877                         vzeroupper 
0190b e8506aafff                     call       0x7fb3b36cda60
01910 0f1f8400081a000d               nop        dword ptr [rax + rax + 0xd001a08]
01918 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01922 4883e4f0                       and        rsp, 0xfffffffffffffff0
01926 e8f5fb6518                     call       0x7fb3cc236c20
0192b f4                             hlt        
0192c 493bd8                         cmp        rbx, r8
0192f bdffffffff                     mov        ebp, 0xffffffff
01934 7c08                           jl         0x7fb3b3bd703e
01936 400f95c5                       setne      bpl
0193a 400fb6ed                       movzx      ebp, bpl
0193e be45ffffff                     mov        esi, 0xffffff45
01943 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01948 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0194d 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01952 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01957 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0195c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01961 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01966 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0196b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01970 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01975 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0197a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0197f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01984 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01989 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0198e 90                             nop        
0198f 90                             nop        
01990 c5f877                         vzeroupper 
01993 e8c869afff                     call       0x7fb3b36cda60
01998 0f1f8400901a000e               nop        dword ptr [rax + rax + 0xe001a90]
019a0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
019aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ae e86dfb6518                     call       0x7fb3cc236c20
019b3 f4                             hlt        
019b4 be45ffffff                     mov        esi, 0xffffff45
019b9 488b2c24                       mov        rbp, qword ptr [rsp]
019bd 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
019c2 4489442408                     mov        dword ptr [rsp + 8], r8d
019c7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
019cc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
019d1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019d6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019db 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
019e0 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019e5 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
019ea 4489442438                     mov        dword ptr [rsp + 0x38], r8d
019ef 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
019f4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019f9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
019fe 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01a03 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01a08 c5f877                         vzeroupper 
01a0b e85069afff                     call       0x7fb3b36cda60
01a10 0f1f8400081b000f               nop        dword ptr [rax + rax + 0xf001b08]
01a18 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01a22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a26 e8f5fa6518                     call       0x7fb3cc236c20
01a2b f4                             hlt        
01a2c be45ffffff                     mov        esi, 0xffffff45
01a31 488b2c24                       mov        rbp, qword ptr [rsp]
01a35 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a3a 4489542408                     mov        dword ptr [rsp + 8], r10d
01a3f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a44 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a49 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a4e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a53 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01a58 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a5d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a62 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a67 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a6c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a71 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a76 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a7b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01a83 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a88 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a8d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a92 90                             nop        
01a93 90                             nop        
01a94 c5f877                         vzeroupper 
01a97 e8c468afff                     call       0x7fb3b36cda60
01a9c 0f1f8400941b0010               nop        dword ptr [rax + rax + 0x10001b94]
01aa4 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ab2 e869fa6518                     call       0x7fb3cc236c20
01ab7 f4                             hlt        
01ab8 bee4ffffff                     mov        esi, 0xffffffe4
01abd 488b2c24                       mov        rbp, qword ptr [rsp]
01ac1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ac6 4489542408                     mov        dword ptr [rsp + 8], r10d
01acb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ad0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ad5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ada 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01adf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ae4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ae9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01aee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01af3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01af8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01afd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b05 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b0a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01b0f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01b14 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b1c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01b21 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b26 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b2b 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01b33 90                             nop        
01b34 c5f877                         vzeroupper 
01b37 e82468afff                     call       0x7fb3b36cda60
01b3c 0f1f8400341c0011               nop        dword ptr [rax + rax + 0x11001c34]
01b44 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01b4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b52 e8c9f96518                     call       0x7fb3cc236c20
01b57 f4                             hlt        
01b58 bee4ffffff                     mov        esi, 0xffffffe4
01b5d 488b2c24                       mov        rbp, qword ptr [rsp]
01b61 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b66 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b6b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b70 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b75 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b7a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b7f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01b84 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b89 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b8e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b93 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01b98 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b9d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ba5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01baa 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01baf 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01bb4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01bbc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01bc1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bc6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bcb 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01bd0 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01bd5 90                             nop        
01bd6 90                             nop        
01bd7 90                             nop        
01bd8 c5f877                         vzeroupper 
01bdb e88067afff                     call       0x7fb3b36cda60
01be0 0f1f8400d81c0012               nop        dword ptr [rax + rax + 0x12001cd8]
01be8 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01bf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf6 e825f96518                     call       0x7fb3cc236c20
01bfb f4                             hlt        
01bfc 4533d2                         xor        r10d, r10d
01bff 4c891424                       mov        qword ptr [rsp], r10
01c03 e93ae5ffff                     jmp        0x7fb3b3bd5842
01c08 4533d2                         xor        r10d, r10d
01c0b 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01c13 e954e5ffff                     jmp        0x7fb3b3bd586c
01c18 4533d2                         xor        r10d, r10d
01c1b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01c23 e973e5ffff                     jmp        0x7fb3b3bd589b
01c28 4533d2                         xor        r10d, r10d
01c2b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c30 e98de5ffff                     jmp        0x7fb3b3bd58c2
01c35 4533d2                         xor        r10d, r10d
01c38 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01c40 e9ace5ffff                     jmp        0x7fb3b3bd58f1
01c45 4533d2                         xor        r10d, r10d
01c48 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c50 e9c6e5ffff                     jmp        0x7fb3b3bd591b
01c55 4183c108                       add        r9d, 8
01c59 be6effffff                     mov        esi, 0xffffff6e
01c5e 488b2c24                       mov        rbp, qword ptr [rsp]
01c62 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c67 4489542408                     mov        dword ptr [rsp + 8], r10d
01c6c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c76 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c7b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c80 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c84 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01c89 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c8e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c93 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c98 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c9d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ca2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ca7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01cac 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cb1 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01cb6 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
01cbe 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01cc3 897c2474                       mov        dword ptr [rsp + 0x74], edi
01cc7 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01ccc c5f877                         vzeroupper 
01ccf e88c66afff                     call       0x7fb3b36cda60
01cd4 0f1f8400cc1d0013               nop        dword ptr [rax + rax + 0x13001dcc]
01cdc 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01ce6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cea e831f86518                     call       0x7fb3cc236c20
01cef f4                             hlt        
01cf0 4183c108                       add        r9d, 8
01cf4 be66ffffff                     mov        esi, 0xffffff66
01cf9 488b2c24                       mov        rbp, qword ptr [rsp]
01cfd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d02 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d07 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d0c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d11 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d16 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d1b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d1f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01d24 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d29 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d2e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d33 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01d38 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01d3d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d42 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d47 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d4c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d51 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
01d59 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d5e 897c2474                       mov        dword ptr [rsp + 0x74], edi
01d62 458bd3                         mov        r10d, r11d
01d65 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d6a 90                             nop        
01d6b 90                             nop        
01d6c c5f877                         vzeroupper 
01d6f e8ec65afff                     call       0x7fb3b36cda60
01d74 0f1f84006c1e0014               nop        dword ptr [rax + rax + 0x14001e6c]
01d7c 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e891f76518                     call       0x7fb3cc236c20
01d8f f4                             hlt        
01d90 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01d9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d9e e87df76518                     call       0x7fb3cc236c20
01da3 f4                             hlt        
01da4 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db2 e869f76518                     call       0x7fb3cc236c20
01db7 f4                             hlt        
01db8 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dc6 e855f76518                     call       0x7fb3cc236c20
01dcb f4                             hlt        
01dcc 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e841f76518                     call       0x7fb3cc236c20
01ddf f4                             hlt        
01de0 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01dea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dee e82df76518                     call       0x7fb3cc236c20
01df3 f4                             hlt        
01df4 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e819f76518                     call       0x7fb3cc236c20
01e07 f4                             hlt        
01e08 beccffffff                     mov        esi, 0xffffffcc
01e0d 488b2c24                       mov        rbp, qword ptr [rsp]
01e11 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e16 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e1b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e20 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e25 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e2a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e2f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e34 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e39 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e3e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e43 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e48 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e4d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e55 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e5a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e5f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e64 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e69 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e6e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
01e76 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e7b 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01e80 c5f877                         vzeroupper 
01e83 e8d864afff                     call       0x7fb3b36cda60
01e88 0f1f8400801f0015               nop        dword ptr [rax + rax + 0x15001f80]
01e90 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01e9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9e e87df66518                     call       0x7fb3cc236c20
01ea3 f4                             hlt        
01ea4 beccffffff                     mov        esi, 0xffffffcc
01ea9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01eae 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01eb3 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01eb8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ebd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ec2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ec7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ecc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ed1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ed9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ede 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ee3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ee8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ef0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ef5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01efa 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01eff 90                             nop        
01f00 c5f877                         vzeroupper 
01f03 e85864afff                     call       0x7fb3b36cda60
01f08 0f1f840000200016               nop        dword ptr [rax + rax + 0x16002000]
01f10 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
01f1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f1e e8fdf56518                     call       0x7fb3cc236c20
01f23 f4                             hlt        
01f24 418bea                         mov        ebp, r10d
01f27 448bd5                         mov        r10d, ebp
01f2a 458d0429                       lea        r8d, [r9 + rbp]
01f2e 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01f36 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
01f3b 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01f43 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
01f48 448d5508                       lea        r10d, [rbp + 8]
01f4c 443bd2                         cmp        r10d, edx
01f4f 7cd3                           jl         0x7fb3b3bd7624
01f51 443bd3                         cmp        r10d, ebx
01f54 0f8dc2000000                   jge        0x7fb3b3bd771c
01f5a 4d63c2                         movsxd     r8, r10d
01f5d 4c03c7                         add        r8, rdi
01f60 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
01f65 0f83ad0d0000                   jae        0x7fb3b3bd8418
01f6b 83c540                         add        ebp, 0x40
01f6e 4c63c5                         movsxd     r8, ebp
01f71 4c03c7                         add        r8, rdi
01f74 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
01f79 0f83ad0d0000                   jae        0x7fb3b3bd842c
01f7f 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
01f87 0f83b30d0000                   jae        0x7fb3b3bd8440
01f8d 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
01f94 0f83ba0d0000                   jae        0x7fb3b3bd8454
01f9a 90                             nop        
01f9b 90                             nop        
01f9c 90                             nop        
01f9d 90                             nop        
01f9e 90                             nop        
01f9f 90                             nop        
01fa0 458bc2                         mov        r8d, r10d
01fa3 4963f0                         movsxd     rsi, r8d
01fa6 478d0411                       lea        r8d, [r9 + r10]
01faa 458bda                         mov        r11d, r10d
01fad 418bd0                         mov        edx, r8d
01fb0 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
01fb8 488b4c1108                     mov        rcx, qword ptr [rcx + rdx + 8]
01fbd 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
01fc5 4a894c1a08                     mov        qword ptr [rdx + r11 + 8], rcx
01fca 4d63c0                         movsxd     r8, r8d
01fcd 4e8b5c0210                     mov        r11, qword ptr [rdx + r8 + 0x10]
01fd2 4c895c3210                     mov        qword ptr [rdx + rsi + 0x10], r11
01fd7 4e8b5c0218                     mov        r11, qword ptr [rdx + r8 + 0x18]
01fdc 4c895c3218                     mov        qword ptr [rdx + rsi + 0x18], r11
01fe1 4e8b5c0220                     mov        r11, qword ptr [rdx + r8 + 0x20]
01fe6 4c895c3220                     mov        qword ptr [rdx + rsi + 0x20], r11
01feb 4e8b5c0228                     mov        r11, qword ptr [rdx + r8 + 0x28]
01ff0 4c895c3228                     mov        qword ptr [rdx + rsi + 0x28], r11
01ff5 4e8b5c0230                     mov        r11, qword ptr [rdx + r8 + 0x30]
01ffa 4c895c3230                     mov        qword ptr [rdx + rsi + 0x30], r11
01fff 4e8b5c0238                     mov        r11, qword ptr [rdx + r8 + 0x38]
02004 4c895c3238                     mov        qword ptr [rdx + rsi + 0x38], r11
02009 4e8b5c0240                     mov        r11, qword ptr [rdx + r8 + 0x40]
0200e 4c895c3240                     mov        qword ptr [rdx + rsi + 0x40], r11
02013 4183c240                       add        r10d, 0x40
02017 443bd3                         cmp        r10d, ebx
0201a 7c84                           jl         0x7fb3b3bd76a0
0201c 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
02024 0f8dddf3ffff                   jge        0x7fb3b3bd6b07
0202a 4d63c2                         movsxd     r8, r10d
0202d 4c03c7                         add        r8, rdi
02030 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
02035 0f832d0d0000                   jae        0x7fb3b3bd8468
0203b 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
02043 0f83330d0000                   jae        0x7fb3b3bd847c
02049 90                             nop        
0204a 90                             nop        
0204b 90                             nop        
0204c 478d1c11                       lea        r11d, [r9 + r10]
02050 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
02058 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0205d 458bc2                         mov        r8d, r10d
02060 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
02068 4e895c0108                     mov        qword ptr [rcx + r8 + 8], r11
0206d 4183c208                       add        r10d, 8
02071 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
02079 7cd1                           jl         0x7fb3b3bd774c
0207b e987f3ffff                     jmp        0x7fb3b3bd6b07
02080 bee4ffffff                     mov        esi, 0xffffffe4
02085 488b2c24                       mov        rbp, qword ptr [rsp]
02089 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0208e 4489542408                     mov        dword ptr [rsp + 8], r10d
02093 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02098 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0209d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020a2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020a7 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
020ac 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020b1 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
020b6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
020bb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020c0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020c5 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
020ca 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
020cf 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
020d7 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020dc 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020e1 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020e6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
020eb 4489542460                     mov        dword ptr [rsp + 0x60], r10d
020f0 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
020f7 90                             nop        
020f8 c5f877                         vzeroupper 
020fb e86062afff                     call       0x7fb3b36cda60
02100 0f1f8400f8210017               nop        dword ptr [rax + rax + 0x170021f8]
02108 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02112 4883e4f0                       and        rsp, 0xfffffffffffffff0
02116 e805f46518                     call       0x7fb3cc236c20
0211b f4                             hlt        
0211c be6effffff                     mov        esi, 0xffffff6e
02121 488b2c24                       mov        rbp, qword ptr [rsp]
02125 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0212a 4489542408                     mov        dword ptr [rsp + 8], r10d
0212f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02134 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02139 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0213e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02143 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02148 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0214d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02152 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02157 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0215c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02161 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02166 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0216b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02170 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02175 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0217a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0217f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02184 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02188 c5f877                         vzeroupper 
0218b e8d061afff                     call       0x7fb3b36cda60
02190 0f1f840088220018               nop        dword ptr [rax + rax + 0x18002288]
02198 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
021a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021a6 e875f36518                     call       0x7fb3cc236c20
021ab f4                             hlt        
021ac be45ffffff                     mov        esi, 0xffffff45
021b1 488b2c24                       mov        rbp, qword ptr [rsp]
021b5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021ba 4489542408                     mov        dword ptr [rsp + 8], r10d
021bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021c9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021ce 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021d3 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
021d8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
021dd 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
021e2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021e7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021ec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021f1 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
021f6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
021fb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02200 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02205 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0220a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0220f 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02213 90                             nop        
02214 c5f877                         vzeroupper 
02217 e84461afff                     call       0x7fb3b36cda60
0221c 0f1f840014230019               nop        dword ptr [rax + rax + 0x19002314]
02224 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0222e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02232 e8e9f26518                     call       0x7fb3cc236c20
02237 f4                             hlt        
02238 be3dffffff                     mov        esi, 0xffffff3d
0223d 488b2c24                       mov        rbp, qword ptr [rsp]
02241 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02246 44895c2408                     mov        dword ptr [rsp + 8], r11d
0224b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02250 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02255 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0225a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0225f 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02264 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02269 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0226e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02273 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02278 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0227d 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02282 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02287 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0228c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02291 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02296 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0229b 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0229f 90                             nop        
022a0 c5f877                         vzeroupper 
022a3 e8b860afff                     call       0x7fb3b36cda60
022a8 0f1f8400a023001a               nop        dword ptr [rax + rax + 0x1a0023a0]
022b0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
022ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
022be e85df26518                     call       0x7fb3cc236c20
022c3 f4                             hlt        
022c4 bee4ffffff                     mov        esi, 0xffffffe4
022c9 488b2c24                       mov        rbp, qword ptr [rsp]
022cd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
022d2 4489542408                     mov        dword ptr [rsp + 8], r10d
022d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022e1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022e6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022eb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
022f0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022f5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022fa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022ff 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02304 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02309 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02311 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02316 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0231b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02320 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02328 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0232d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02332 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02337 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
0233f 90                             nop        
02340 c5f877                         vzeroupper 
02343 e81860afff                     call       0x7fb3b36cda60
02348 0f1f84004024001b               nop        dword ptr [rax + rax + 0x1b002440]
02350 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0235a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0235e e8bdf16518                     call       0x7fb3cc236c20
02363 f4                             hlt        
02364 bee4ffffff                     mov        esi, 0xffffffe4
02369 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0236e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02373 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02378 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0237d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02382 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02387 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0238c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02391 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02399 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0239e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
023a3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
023a8 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
023b0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
023b5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023ba 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
023bf 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
023c4 c5f877                         vzeroupper 
023c7 e8945fafff                     call       0x7fb3b36cda60
023cc 0f1f8400c424001c               nop        dword ptr [rax + rax + 0x1c0024c4]
023d4 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
023de 4883e4f0                       and        rsp, 0xfffffffffffffff0
023e2 e839f16518                     call       0x7fb3cc236c20
023e7 f4                             hlt        
023e8 418d6901                       lea        ebp, [r9 + 1]
023ec bee4ffffff                     mov        esi, 0xffffffe4
023f1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023f6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023fb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02400 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02405 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0240a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0240f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02414 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02419 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02421 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02426 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0242b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02430 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02438 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0243d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02442 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02447 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0244c c5f877                         vzeroupper 
0244f e80c5fafff                     call       0x7fb3b36cda60
02454 0f1f84004c25001d               nop        dword ptr [rax + rax + 0x1d00254c]
0245c 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0246a e8b1f06518                     call       0x7fb3cc236c20
0246f f4                             hlt        
02470 bee4ffffff                     mov        esi, 0xffffffe4
02475 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0247a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0247f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02484 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02489 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0248e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02493 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02498 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0249d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
024a5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
024aa 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
024af 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
024b4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024b9 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
024be 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024c3 90                             nop        
024c4 c5f877                         vzeroupper 
024c7 e8945eafff                     call       0x7fb3b36cda60
024cc 0f1f8400c425001e               nop        dword ptr [rax + rax + 0x1e0025c4]
024d4 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
024de 4883e4f0                       and        rsp, 0xfffffffffffffff0
024e2 e839f06518                     call       0x7fb3cc236c20
024e7 f4                             hlt        
024e8 bee4ffffff                     mov        esi, 0xffffffe4
024ed 488b2c24                       mov        rbp, qword ptr [rsp]
024f1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
024f6 44895c2408                     mov        dword ptr [rsp + 8], r11d
024fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02500 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02505 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0250a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0250f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02514 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02519 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0251e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02523 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02528 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0252d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02532 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02537 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0253c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02541 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02546 90                             nop        
02547 90                             nop        
02548 c5f877                         vzeroupper 
0254b e8105eafff                     call       0x7fb3b36cda60
02550 0f1f84004826001f               nop        dword ptr [rax + rax + 0x1f002648]
02558 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02562 4883e4f0                       and        rsp, 0xfffffffffffffff0
02566 e8b5ef6518                     call       0x7fb3cc236c20
0256b f4                             hlt        
0256c beccffffff                     mov        esi, 0xffffffcc
02571 488b2c24                       mov        rbp, qword ptr [rsp]
02575 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0257a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0257f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02584 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02589 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0258e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02593 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02598 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0259d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025a2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025a7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
025ac 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025b1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
025b9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
025be 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
025c3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025c8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
025d0 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
025d5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025da 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025df 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
025e4 c5f877                         vzeroupper 
025e7 e8745dafff                     call       0x7fb3b36cda60
025ec 0f1f8400e4260020               nop        dword ptr [rax + rax + 0x200026e4]
025f4 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
025fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02602 e819ef6518                     call       0x7fb3cc236c20
02607 f4                             hlt        
02608 be45ffffff                     mov        esi, 0xffffff45
0260d 488b2c24                       mov        rbp, qword ptr [rsp]
02611 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02616 4489542408                     mov        dword ptr [rsp + 8], r10d
0261b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02620 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02625 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0262a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0262f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02634 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02639 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0263e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02643 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02648 c5f877                         vzeroupper 
0264b e8105dafff                     call       0x7fb3b36cda60
02650 0f1f840048270021               nop        dword ptr [rax + rax + 0x21002748]
02658 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02662 4883e4f0                       and        rsp, 0xfffffffffffffff0
02666 e8b5ee6518                     call       0x7fb3cc236c20
0266b f4                             hlt        
0266c bebeffffff                     mov        esi, 0xffffffbe
02671 488b2c24                       mov        rbp, qword ptr [rsp]
02675 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0267a 4489542408                     mov        dword ptr [rsp + 8], r10d
0267f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02684 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02689 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0268e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02693 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02698 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0269d 90                             nop        
0269e 90                             nop        
0269f 90                             nop        
026a0 c5f877                         vzeroupper 
026a3 e8b85cafff                     call       0x7fb3b36cda60
026a8 0f1f8400a0270022               nop        dword ptr [rax + rax + 0x220027a0]
026b0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
026ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
026be e85dee6518                     call       0x7fb3cc236c20
026c3 f4                             hlt        
026c4 be85ffffff                     mov        esi, 0xffffff85
026c9 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
026cd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
026d2 44891424                       mov        dword ptr [rsp], r10d
026d6 44896c2404                     mov        dword ptr [rsp + 4], r13d
026db 4489742408                     mov        dword ptr [rsp + 8], r14d
026e0 c5f877                         vzeroupper 
026e3 e8785cafff                     call       0x7fb3b36cda60
026e8 0f1f8400e0270023               nop        dword ptr [rax + rax + 0x230027e0]
026f0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
026fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
026fe e81dee6518                     call       0x7fb3cc236c20
02703 f4                             hlt        
02704 beccffffff                     mov        esi, 0xffffffcc
02709 488b2c24                       mov        rbp, qword ptr [rsp]
0270d 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02712 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
02717 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0271c c5f877                         vzeroupper 
0271f e83c5cafff                     call       0x7fb3b36cda60
02724 0f1f84001c280024               nop        dword ptr [rax + rax + 0x2400281c]
0272c 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02736 4883e4f0                       and        rsp, 0xfffffffffffffff0
0273a e8e1ed6518                     call       0x7fb3cc236c20
0273f f4                             hlt        
02740 bee4ffffff                     mov        esi, 0xffffffe4
02745 488b2c24                       mov        rbp, qword ptr [rsp]
02749 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0274e 4489542408                     mov        dword ptr [rsp + 8], r10d
02753 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02758 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0275d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02762 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02767 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0276c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02771 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02776 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0277b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02780 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02785 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0278d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02792 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02797 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0279c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
027a1 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
027a6 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
027ae 90                             nop        
027af 90                             nop        
027b0 c5f877                         vzeroupper 
027b3 e8a85bafff                     call       0x7fb3b36cda60
027b8 0f1f8400b0280025               nop        dword ptr [rax + rax + 0x250028b0]
027c0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
027ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ce e84ded6518                     call       0x7fb3cc236c20
027d3 f4                             hlt        
027d4 bee4ffffff                     mov        esi, 0xffffffe4
027d9 488b2c24                       mov        rbp, qword ptr [rsp]
027dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
027e2 4489542408                     mov        dword ptr [rsp + 8], r10d
027e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027f1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027f6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027fb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02800 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02805 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0280a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0280f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02814 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02819 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0281e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02823 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02828 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0282d 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02832 90                             nop        
02833 90                             nop        
02834 c5f877                         vzeroupper 
02837 e8245bafff                     call       0x7fb3b36cda60
0283c 0f1f840034290026               nop        dword ptr [rax + rax + 0x26002934]
02844 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0284e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02852 e8c9ec6518                     call       0x7fb3cc236c20
02857 f4                             hlt        
02858 4183c108                       add        r9d, 8
0285c be6effffff                     mov        esi, 0xffffff6e
02861 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02866 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0286b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02870 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02875 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0287a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0287f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02884 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02889 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
02891 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02896 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0289b 90                             nop        
0289c c5f877                         vzeroupper 
0289f e8bc5aafff                     call       0x7fb3b36cda60
028a4 0f1f84009c290027               nop        dword ptr [rax + rax + 0x2700299c]
028ac 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
028b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ba e861ec6518                     call       0x7fb3cc236c20
028bf f4                             hlt        
028c0 4183c108                       add        r9d, 8
028c4 be66ffffff                     mov        esi, 0xffffff66
028c9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028ce 4489542414                     mov        dword ptr [rsp + 0x14], r10d
028d3 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
028d8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
028dd 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
028e2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
028e7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028ec 4489542464                     mov        dword ptr [rsp + 0x64], r10d
028f1 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
028f9 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
028fe 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02903 90                             nop        
02904 c5f877                         vzeroupper 
02907 e8545aafff                     call       0x7fb3b36cda60
0290c 0f1f8400042a0028               nop        dword ptr [rax + rax + 0x28002a04]
02914 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
0291e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02922 e8f9eb6518                     call       0x7fb3cc236c20
02927 f4                             hlt        
02928 458bd8                         mov        r11d, r8d
0292b e97feaffff                     jmp        0x7fb3b3bd6aaf
02930 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
0293a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0293e e8ddeb6518                     call       0x7fb3cc236c20
02943 f4                             hlt        
02944 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
0294e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02952 e8c9eb6518                     call       0x7fb3cc236c20
02957 f4                             hlt        
02958 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02962 4883e4f0                       and        rsp, 0xfffffffffffffff0
02966 e8b5eb6518                     call       0x7fb3cc236c20
0296b f4                             hlt        
0296c 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0297a e8a1eb6518                     call       0x7fb3cc236c20
0297f f4                             hlt        
02980 bee4ffffff                     mov        esi, 0xffffffe4
02985 488b2c24                       mov        rbp, qword ptr [rsp]
02989 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0298e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02993 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02998 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0299d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029a2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
029a7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
029ac 4489542434                     mov        dword ptr [rsp + 0x34], r10d
029b1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029b6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029bb 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
029c0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029c5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
029cd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
029d2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
029d7 4489542444                     mov        dword ptr [rsp + 0x44], r10d
029dc 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029e1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029e6 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
029ea 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
029ef 4489742474                     mov        dword ptr [rsp + 0x74], r14d
029f4 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
029fc c5f877                         vzeroupper 
029ff e85c59afff                     call       0x7fb3b36cda60
02a04 0f1f8400fc2a0029               nop        dword ptr [rax + rax + 0x29002afc]
02a0c 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1a e801eb6518                     call       0x7fb3cc236c20
02a1f f4                             hlt        
02a20 c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
02a29 bee4ffffff                     mov        esi, 0xffffffe4
02a2e 488b2c24                       mov        rbp, qword ptr [rsp]
02a32 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a37 4489542408                     mov        dword ptr [rsp + 8], r10d
02a3c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a41 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a46 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a4b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a50 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02a55 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02a5a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a5f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a64 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02a69 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a6e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02a76 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02a7b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02a80 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02a85 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a8a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02a8f 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02a93 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02a98 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
02aa0 c5f877                         vzeroupper 
02aa3 e8b858afff                     call       0x7fb3b36cda60
02aa8 0f1f8400a02b002a               nop        dword ptr [rax + rax + 0x2a002ba0]
02ab0 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02aba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02abe e85dea6518                     call       0x7fb3cc236c20
02ac3 f4                             hlt        
02ac4 beccffffff                     mov        esi, 0xffffffcc
02ac9 488b2c24                       mov        rbp, qword ptr [rsp]
02acd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02ad2 4489542408                     mov        dword ptr [rsp + 8], r10d
02ad7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02adc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ae1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02ae6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02aeb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02af0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02af5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02afa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02aff 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02b04 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02b09 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02b11 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02b16 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02b1b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02b20 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02b28 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02b2d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02b32 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02b37 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02b3c 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
02b41 90                             nop        
02b42 90                             nop        
02b43 90                             nop        
02b44 c5f877                         vzeroupper 
02b47 e81458afff                     call       0x7fb3b36cda60
02b4c 0f1f8400442c002b               nop        dword ptr [rax + rax + 0x2b002c44]
02b54 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b62 e8b9e96518                     call       0x7fb3cc236c20
02b67 f4                             hlt        
02b68 418bee                         mov        ebp, r14d
02b6b 83c510                         add        ebp, 0x10
02b6e be6effffff                     mov        esi, 0xffffff6e
02b73 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02b78 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02b7d 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02b82 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02b87 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02b8c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b91 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b96 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02b9b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02ba0 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02ba5 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02baa 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02baf 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02bb4 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02bb8 c5f877                         vzeroupper 
02bbb e8a057afff                     call       0x7fb3b36cda60
02bc0 0f1f8400b82c002c               nop        dword ptr [rax + rax + 0x2c002cb8]
02bc8 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bd6 e845e96518                     call       0x7fb3cc236c20
02bdb f4                             hlt        
02bdc 418bee                         mov        ebp, r14d
02bdf 83c510                         add        ebp, 0x10
02be2 be66ffffff                     mov        esi, 0xffffff66
02be7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02bec 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02bf1 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02bf6 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02bfb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02c00 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02c05 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02c0a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02c0f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02c14 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02c19 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02c1e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c23 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02c28 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02c2c c5f877                         vzeroupper 
02c2f e82c57afff                     call       0x7fb3b36cda60
02c34 0f1f84002c2d002d               nop        dword ptr [rax + rax + 0x2d002d2c]
02c3c 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02c46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c4a e8d1e86518                     call       0x7fb3cc236c20
02c4f f4                             hlt        
02c50 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c5e e8bde86518                     call       0x7fb3cc236c20
02c63 f4                             hlt        
02c64 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02c6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c72 e8a9e86518                     call       0x7fb3cc236c20
02c77 f4                             hlt        
02c78 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c86 e895e86518                     call       0x7fb3cc236c20
02c8b f4                             hlt        
02c8c 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c9a e881e86518                     call       0x7fb3cc236c20
02c9f f4                             hlt        
02ca0 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02caa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cae e86de86518                     call       0x7fb3cc236c20
02cb3 f4                             hlt        
02cb4 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02cbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cc2 e859e86518                     call       0x7fb3cc236c20
02cc7 f4                             hlt        
02cc8 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02cd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cd6 e845e86518                     call       0x7fb3cc236c20
02cdb f4                             hlt        
02cdc 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02ce6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cea e831e86518                     call       0x7fb3cc236c20
02cef f4                             hlt        
02cf0 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02cfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cfe e81de86518                     call       0x7fb3cc236c20
02d03 f4                             hlt        
02d04 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d12 e809e86518                     call       0x7fb3cc236c20
02d17 f4                             hlt        
02d18 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d26 e8f5e76518                     call       0x7fb3cc236c20
02d2b f4                             hlt        
02d2c 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d3a e8e1e76518                     call       0x7fb3cc236c20
02d3f f4                             hlt        
02d40 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d4e e8cde76518                     call       0x7fb3cc236c20
02d53 f4                             hlt        
02d54 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d62 e8b9e76518                     call       0x7fb3cc236c20
02d67 f4                             hlt        
02d68 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d76 e8a5e76518                     call       0x7fb3cc236c20
02d7b f4                             hlt        
02d7c 48bfc0076a8cb37f0000           movabs     rdi, 0x7fb38c6a07c0
02d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d8a e891e76518                     call       0x7fb3cc236c20
02d8f f4                             hlt        
02d90 488bf0                         mov        rsi, rax
02d93 eb0d                           jmp        0x7fb3b3bd84a2
02d95 488bf0                         mov        rsi, rax
02d98 eb08                           jmp        0x7fb3b3bd84a2
02d9a 488bf0                         mov        rsi, rax
02d9d eb03                           jmp        0x7fb3b3bd84a2
02d9f 488bf0                         mov        rsi, rax
02da2 c5f877                         vzeroupper 
02da5 4881c400010000                 add        rsp, 0x100
02dac 5d                             pop        rbp
02dad e9aed6aeff                     jmp        0x7fb3b36c5b60
02db2 bef6ffffff                     mov        esi, 0xfffffff6
02db7 90                             nop        
02db8 c5f877                         vzeroupper 
02dbb e8a055afff                     call       0x7fb3b36cda60
02dc0 0f1f8400b82e002e               nop        dword ptr [rax + rax + 0x2e002eb8]
02dc8 48bf4072598cb37f0000           movabs     rdi, 0x7fb38c597240
02dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dd6 e845e76518                     call       0x7fb3cc236c20
02ddb f4                             hlt        
02ddc 49ba7665bdb3b37f0000           movabs     r10, 0x7fb3b3bd6576
02de6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02ded e96e9eb5ff                     jmp        0x7fb3b3732360
02df2 e8e96cb4ff                     call       0x7fb3b371f1e0
02df7 e932d2ffff                     jmp        0x7fb3b3bd572e
02dfc f4                             hlt        
02dfd f4                             hlt        
02dfe f4                             hlt        
02dff f4                             hlt        
