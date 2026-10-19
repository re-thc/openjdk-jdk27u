00000 e8fbb33718                     call       0x7f6aaff4bc80
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
00028 0f85482c0000                   jne        0x7f6a97bd34f6
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00046 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004a 4489542470                     mov        dword ptr [rsp + 0x70], r10d
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
00102 49bab0e310b06a7f0000           movabs     r10, 0x7f6ab010e3b0
0010c 41ffd2                         call       r10
0010f 0f1f840000000000               nop        dword ptr [rax + rax]
00117 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011c 4d85d2                         test       r10, r10
0011f 0f84c71a0000                   je         0x7f6a97bd246c
00125 458b12                         mov        r10d, dword ptr [r10]
00128 41c1ea0d                       shr        r10d, 0xd
0012c 4181fa15040000                 cmp        r10d, 0x415
00133 0f851f240000                   jne        0x7f6a97bd2dd8
00139 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013e 4c891424                       mov        qword ptr [rsp], r10
00142 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00147 4d85d2                         test       r10, r10
0014a 0f84a81a0000                   je         0x7f6a97bd2478
00150 458b1a                         mov        r11d, dword ptr [r10]
00153 41c1eb0d                       shr        r11d, 0xd
00157 4181fb05010000                 cmp        r11d, 0x105
0015e 0f85f4230000                   jne        0x7f6a97bd2dd8
00164 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00171 4d85d2                         test       r10, r10
00174 0f848e1a0000                   je         0x7f6a97bd2488
0017a 458b12                         mov        r10d, dword ptr [r10]
0017d 41c1ea0d                       shr        r10d, 0xd
00181 4181fa08010000                 cmp        r10d, 0x108
00188 0f85ca230000                   jne        0x7f6a97bd2dd8
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001a0 4d85d2                         test       r10, r10
001a3 0f846f1a0000                   je         0x7f6a97bd2498
001a9 458b1a                         mov        r11d, dword ptr [r10]
001ac 41c1eb0d                       shr        r11d, 0xd
001b0 4181fb07010000                 cmp        r11d, 0x107
001b7 0f859b230000                   jne        0x7f6a97bd2dd8
001bd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c7 4d85d2                         test       r10, r10
001ca 0f84551a0000                   je         0x7f6a97bd24a5
001d0 458b12                         mov        r10d, dword ptr [r10]
001d3 41c1ea0d                       shr        r10d, 0xd
001d7 4181fa07010000                 cmp        r10d, 0x107
001de 0f8574230000                   jne        0x7f6a97bd2dd8
001e4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e9 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f6 4d85d2                         test       r10, r10
001f9 0f84361a0000                   je         0x7f6a97bd24b5
001ff 458b1a                         mov        r11d, dword ptr [r10]
00202 41c1eb0d                       shr        r11d, 0xd
00206 4181fb05010000                 cmp        r11d, 0x105
0020d 0f8545230000                   jne        0x7f6a97bd2dd8
00213 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0021b 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00223 458b5204                       mov        r10d, dword ptr [r10 + 4]
00227 4489542408                     mov        dword ptr [rsp + 8], r10d
0022c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00231 4585db                         test       r11d, r11d
00234 0f84c6220000                   je         0x7f6a97bd2d80
0023a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00242 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00246 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0024b 4585db                         test       r11d, r11d
0024e 0f86ac220000                   jbe        0x7f6a97bd2d80
00254 4183fb01                       cmp        r11d, 1
00258 0f86a2220000                   jbe        0x7f6a97bd2d80
0025e 4183fb02                       cmp        r11d, 2
00262 0f8698220000                   jbe        0x7f6a97bd2d80
00268 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00270 458b5204                       mov        r10d, dword ptr [r10 + 4]
00274 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00279 4183c2f1                       add        r10d, -0xf
0027d 4585d2                         test       r10d, r10d
00280 0f8c7a220000                   jl         0x7f6a97bd2d80
00286 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0028e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00292 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00297 4183c3f1                       add        r11d, -0xf
0029b 4585db                         test       r11d, r11d
0029e 0f8c5c220000                   jl         0x7f6a97bd2d80
002a4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a9 4183c2f9                       add        r10d, -7
002ad 4585d2                         test       r10d, r10d
002b0 0f8c4a220000                   jl         0x7f6a97bd2d80
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
002fa e988040000                     jmp        0x7f6a97bd1007
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
00344 0f8d820a0000                   jge        0x7f6a97bd164c
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
00395 0f8cf91a0000                   jl         0x7f6a97bd2714
0039b 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003a3 4585d2                         test       r10d, r10d
003a6 0f8ce81a0000                   jl         0x7f6a97bd2714
003ac 458d042b                       lea        r8d, [r11 + rbp]
003b0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
003b5 453bd8                         cmp        r11d, r8d
003b8 0f82d61a0000                   jb         0x7f6a97bd2714
003be 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c5 03dd                           add        ebx, ebp
003c7 443bdb                         cmp        r11d, ebx
003ca 0f82c41a0000                   jb         0x7f6a97bd2714
003d0 85ed                           test       ebp, ebp
003d2 0f8cbc1a0000                   jl         0x7f6a97bd2714
003d8 85ed                           test       ebp, ebp
003da 0f8442ffffff                   je         0x7f6a97bd0ba2
003e0 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
003e8 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003f0 4b8d741308                     lea        rsi, [r11 + r10 + 8]
003f5 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
003fd 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00405 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0040a 4863d5                         movsxd     rdx, ebp
0040d 4883fa20                       cmp        rdx, 0x20
00411 0f86e8feffff                   jbe        0x7f6a97bd0b7f
00417 c5f877                         vzeroupper 
0041a 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00424 41ffd2                         call       r10
00427 0f1f840000000000               nop        dword ptr [rax + rax]
0042f e9eefeffff                     jmp        0x7f6a97bd0ba2
00434 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0043c c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00443 448bac24bc000000               mov        r13d, dword ptr [rsp + 0xbc]
0044b 4503ea                         add        r13d, r10d
0044e e918030000                     jmp        0x7f6a97bd0feb
00453 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0045b 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00463 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00468 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0046d 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00475 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
0047d 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00485 4963d2                         movsxd     rdx, r10d
00488 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00490 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00498 0f8caf060000                   jl         0x7f6a97bd13cd
0049e 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004a6 4183fb30                       cmp        r11d, 0x30
004aa 0f8ea0000000                   jle        0x7f6a97bd0dd0
004b0 4585c0                         test       r8d, r8d
004b3 0f8c3f190000                   jl         0x7f6a97bd2678
004b9 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004c1 4585db                         test       r11d, r11d
004c4 0f8c2e190000                   jl         0x7f6a97bd2678
004ca 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
004d2 4503d0                         add        r10d, r8d
004d5 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
004da 453bca                         cmp        r9d, r10d
004dd 0f8215190000                   jb         0x7f6a97bd2678
004e3 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
004eb 0f8207190000                   jb         0x7f6a97bd2678
004f1 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004f9 4585db                         test       r11d, r11d
004fc 0f8459020000                   je         0x7f6a97bd0fdb
00502 4963d3                         movsxd     rdx, r11d
00505 4883fa20                       cmp        rdx, 0x20
00509 7728                           ja         0x7f6a97bd0db3
0050b 458bd3                         mov        r10d, r11d
0050e 4d63d2                         movsxd     r10, r10d
00511 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00518 c442a8f5db                     bzhi       r11, r11, r10
0051d c4c1fb92fb                     kmovq      k7, r11
00522 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00528 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0052e e928020000                     jmp        0x7f6a97bd0fdb
00533 c5f877                         vzeroupper 
00536 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00540 41ffd2                         call       r10
00543 0f1f840000000000               nop        dword ptr [rax + rax]
0054b e90b020000                     jmp        0x7f6a97bd0fdb
00550 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
00558 0f834a150000                   jae        0x7f6a97bd2328
0055e 4963f8                         movsxd     rdi, r8d
00561 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00569 4d8b4c3a08                     mov        r9, qword ptr [r10 + rdi + 8]
0056e 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00576 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0057e 0f83c4150000                   jae        0x7f6a97bd23c8
00584 8b8c24b8000000                 mov        ecx, dword ptr [rsp + 0xb8]
0058b 8d5908                         lea        ebx, [rcx + 8]
0058e 4c63d1                         movsxd     r10, ecx
00591 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00599 4f894c1308                     mov        qword ptr [r11 + r10 + 8], r9
0059e 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
005a5 0f8db0010000                   jge        0x7f6a97bd0fdb
005ab 492bfa                         sub        rdi, r10
005ae 4c63db                         movsxd     r11, ebx
005b1 4d8d143b                       lea        r10, [r11 + rdi]
005b5 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ba 0f8385160000                   jae        0x7f6a97bd24c5
005c0 4c8bd2                         mov        r10, rdx
005c3 4d2bd3                         sub        r10, r11
005c6 4983c207                       add        r10, 7
005ca 4983e2f8                       and        r10, 0xfffffffffffffff8
005ce 458bd2                         mov        r10d, r10d
005d1 458d5c0a08                     lea        r11d, [r10 + rcx + 8]
005d6 4d63d3                         movsxd     r10, r11d
005d9 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005de 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005e3 0f835c160000                   jae        0x7f6a97bd24c5
005e9 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
005f0 0f834f160000                   jae        0x7f6a97bd24c5
005f6 4983c2f8                       add        r10, -8
005fa 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ff 0f8340160000                   jae        0x7f6a97bd24c5
00605 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
0060d 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00614 0f8fc6160000                   jg         0x7f6a97bd2560
0061a 442bc1                         sub        r8d, ecx
0061d 83c110                         add        ecx, 0x10
00620 458d1418                       lea        r10d, [r8 + rbx]
00624 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0062c 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00631 448bdb                         mov        r11d, ebx
00634 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
0063c 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
00641 448d4b08                       lea        r9d, [rbx + 8]
00645 443bc9                         cmp        r9d, ecx
00648 7d05                           jge        0x7f6a97bd0ecf
0064a 418bd9                         mov        ebx, r9d
0064d ebd1                           jmp        0x7f6a97bd0ea0
0064f 4883c2f8                       add        rdx, -8
00653 4881fa00000080                 cmp        rdx, -0x80000000
0065a 49c7c200000080                 mov        r10, 0xffffffff80000000
00661 490f4cd2                       cmovl      rdx, r10
00665 448bd2                         mov        r10d, edx
00668 453bca                         cmp        r9d, r10d
0066b 0f8d8f000000                   jge        0x7f6a97bd0f80
00671 4d63d9                         movsxd     r11, r9d
00674 4c03df                         add        r11, rdi
00677 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0067c 0f83fe160000                   jae        0x7f6a97bd2600
00682 83c310                         add        ebx, 0x10
00685 4c63db                         movsxd     r11, ebx
00688 4c03df                         add        r11, rdi
0068b 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00690 0f83fe160000                   jae        0x7f6a97bd2614
00696 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
0069e 0f8304170000                   jae        0x7f6a97bd2628
006a4 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
006ab 0f830b170000                   jae        0x7f6a97bd263c
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
006c0 478d1c08                       lea        r11d, [r8 + r9]
006c4 418bd9                         mov        ebx, r9d
006c7 4863db                         movsxd     rbx, ebx
006ca 418bcb                         mov        ecx, r11d
006cd 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
006d5 488b540a08                     mov        rdx, qword ptr [rdx + rcx + 8]
006da 4963cb                         movsxd     rcx, r11d
006dd 458bd9                         mov        r11d, r9d
006e0 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
006e8 4a89541e08                     mov        qword ptr [rsi + r11 + 8], rdx
006ed 4c8b5c0e10                     mov        r11, qword ptr [rsi + rcx + 0x10]
006f2 4c895c1e10                     mov        qword ptr [rsi + rbx + 0x10], r11
006f7 4183c110                       add        r9d, 0x10
006fb 453bca                         cmp        r9d, r10d
006fe 7cc0                           jl         0x7f6a97bd0f40
00700 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
00708 7d51                           jge        0x7f6a97bd0fdb
0070a 4d63d1                         movsxd     r10, r9d
0070d 4c03d7                         add        r10, rdi
00710 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
00715 0f83b5160000                   jae        0x7f6a97bd2650
0071b 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
00723 0f83bb160000                   jae        0x7f6a97bd2664
00729 90                             nop        
0072a 90                             nop        
0072b 90                             nop        
0072c 478d1c08                       lea        r11d, [r8 + r9]
00730 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00738 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
0073d 458bd9                         mov        r11d, r9d
00740 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00748 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
0074d 4183c108                       add        r9d, 8
00751 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
00759 7cd1                           jl         0x7f6a97bd0fac
0075b 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
00763 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
0076b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0076f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00774 41ffc3                         inc        r11d
00777 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
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
007b3 0f8d42060000                   jge        0x7f6a97bd167b
007b9 443b542408                     cmp        r10d, dword ptr [rsp + 8]
007be 0f839d0e0000                   jae        0x7f6a97bd1ee1
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
00809 0f8c9d100000                   jl         0x7f6a97bd212c
0080f 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00817 4585d2                         test       r10d, r10d
0081a 0f854c020000                   jne        0x7f6a97bd12ec
00820 4533d2                         xor        r10d, r10d
00823 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0082b 448bd3                         mov        r10d, ebx
0082e 4183fa03                       cmp        r10d, 3
00832 0f8e70020000                   jle        0x7f6a97bd1328
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
008a3 0f8f73100000                   jg         0x7f6a97bd219c
008a9 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
008b1 4585db                         test       r11d, r11d
008b4 0f8ebe0f0000                   jle        0x7f6a97bd20f8
008ba 418bdd                         mov        ebx, r13d
008bd 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
008c4 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008cc 4403d3                         add        r10d, ebx
008cf 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
008d4 0f8fca100000                   jg         0x7f6a97bd2224
008da 458bd6                         mov        r10d, r14d
008dd 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
008e5 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
008ed 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
008f5 0f8f21110000                   jg         0x7f6a97bd229c
008fb 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00903 4183fa10                       cmp        r10d, 0x10
00907 0f8f74050000                   jg         0x7f6a97bd1701
0090d 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00915 0f83b10d0000                   jae        0x7f6a97bd1f4c
0091b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00923 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0092a 443bac24b4000000               cmp        r13d, dword ptr [rsp + 0xb4]
00932 0f831c0e0000                   jae        0x7f6a97bd1fd4
00938 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00940 4503de                         add        r11d, r14d
00943 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0094b 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00953 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
0095a 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00962 4503d5                         add        r10d, r13d
00965 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0096d 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00975 442b8424c0000000               sub        r8d, dword ptr [rsp + 0xc0]
0097d 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00985 4183fa10                       cmp        r10d, 0x10
00989 0f8fc4faffff                   jg         0x7f6a97bd0cd3
0098f 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00997 4183fb10                       cmp        r11d, 0x10
0099b 0f8cb2faffff                   jl         0x7f6a97bd0cd3
009a1 443b8424b4000000               cmp        r8d, dword ptr [rsp + 0xb4]
009a9 0f83510e0000                   jae        0x7f6a97bd2080
009af 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
009b7 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
009be 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
009c6 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
009ce 0f8260faffff                   jb         0x7f6a97bd0cb4
009d4 bee4ffffff                     mov        esi, 0xffffffe4
009d9 488b2c24                       mov        rbp, qword ptr [rsp]
009dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009e2 4489542408                     mov        dword ptr [rsp + 8], r10d
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
00a4b e890c7afff                     call       0x7f6a976cda60
00a50 0f1f8400480b0002               nop        dword ptr [rax + rax + 0x2000b48]
00a58 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
00a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a66 e875d21418                     call       0x7f6aafd1e560
00a6b f4                             hlt        
00a6c 453bd0                         cmp        r10d, r8d
00a6f 0f8eb6fdffff                   jle        0x7f6a97bd10ab
00a75 be45ffffff                     mov        esi, 0xffffff45
00a7a 418bea                         mov        ebp, r10d
00a7d 44890424                       mov        dword ptr [rsp], r8d
00a81 90                             nop        
00a82 90                             nop        
00a83 90                             nop        
00a84 c5f877                         vzeroupper 
00a87 e854c7afff                     call       0x7f6a976cda60
00a8c 0f1f8400840b0003               nop        dword ptr [rax + rax + 0x3000b84]
00a94 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
00a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00aa2 e839d21418                     call       0x7f6aafd1e560
00aa7 f4                             hlt        
00aa8 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ab0 4585d2                         test       r10d, r10d
00ab3 7407                           je         0x7f6a97bd133c
00ab5 448d53ff                       lea        r10d, [rbx - 1]
00ab9 418bda                         mov        ebx, r10d
00abc 85db                           test       ebx, ebx
00abe 7474                           je         0x7f6a97bd13b4
00ac0 83fb03                         cmp        ebx, 3
00ac3 0f8477150000                   je         0x7f6a97bd28c0
00ac9 83fb02                         cmp        ebx, 2
00acc 0f87fa150000                   ja         0x7f6a97bd294c
00ad2 3b5c240c                       cmp        ebx, dword ptr [rsp + 0xc]
00ad6 0f8338140000                   jae        0x7f6a97bd2794
00adc 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00ae4 458b449b08                     mov        r8d, dword ptr [r11 + rbx*4 + 8]
00ae9 85db                           test       ebx, ebx
00aeb 7e39                           jle        0x7f6a97bd13a6
00aed 448d53ff                       lea        r10d, [rbx - 1]
00af1 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00af6 0f83b4140000                   jae        0x7f6a97bd2830
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
00b24 7fda                           jg         0x7f6a97bd1380
00b26 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b2e 45894208                       mov        dword ptr [r10 + 8], r8d
00b32 eb0c                           jmp        0x7f6a97bd13c0
00b34 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b3c 458b4208                       mov        r8d, dword ptr [r10 + 8]
00b40 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00b48 e933fdffff                     jmp        0x7f6a97bd1100
00b4d 4183fa10                       cmp        r10d, 0x10
00b51 0f8d45190000                   jge        0x7f6a97bd2d1c
00b57 4183fa08                       cmp        r10d, 8
00b5b 0f8da0040000                   jge        0x7f6a97bd1881
00b61 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b69 4183fa10                       cmp        r10d, 0x10
00b6d 0f8ebd000000                   jle        0x7f6a97bd14b0
00b73 4585c0                         test       r8d, r8d
00b76 0f8c84180000                   jl         0x7f6a97bd2c80
00b7c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b84 4585db                         test       r11d, r11d
00b87 0f8c73180000                   jl         0x7f6a97bd2c80
00b8d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00b92 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00b9a 0f8260180000                   jb         0x7f6a97bd2c80
00ba0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00ba8 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00bb0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00bb8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00bbd 453bda                         cmp        r11d, r10d
00bc0 0f823a180000                   jb         0x7f6a97bd2c80
00bc6 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00bce 4585db                         test       r11d, r11d
00bd1 0f8c29180000                   jl         0x7f6a97bd2c80
00bd7 4585db                         test       r11d, r11d
00bda 0f8471f7ffff                   je         0x7f6a97bd0bd1
00be0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00be5 4983fa20                       cmp        r10, 0x20
00be9 7725                           ja         0x7f6a97bd1490
00beb 4d63d3                         movsxd     r10, r11d
00bee 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bf5 c442a8f5db                     bzhi       r11, r11, r10
00bfa c4c1fb92fb                     kmovq      k7, r11
00bff 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c05 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c0b e941f7ffff                     jmp        0x7f6a97bd0bd1
00c10 498bd2                         mov        rdx, r10
00c13 c5f877                         vzeroupper 
00c16 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00c20 41ffd2                         call       r10
00c23 0f1f840000000000               nop        dword ptr [rax + rax]
00c2b e921f7ffff                     jmp        0x7f6a97bd0bd1
00c30 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00c35 0f831d150000                   jae        0x7f6a97bd29d8
00c3b 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c43 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
00c49 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c51 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c56 0f839c150000                   jae        0x7f6a97bd2a78
00c5c 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c64 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c6c 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00c71 458d5003                       lea        r10d, [r8 + 3]
00c75 41ffc3                         inc        r11d
00c78 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00c80 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c85 0f83f1150000                   jae        0x7f6a97bd2afc
00c8b 4d63d0                         movsxd     r10, r8d
00c8e 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00c96 430fbe6c1309                   movsx      ebp, byte ptr [r11 + r10 + 9]
00c9c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00ca4 4183c303                       add        r11d, 3
00ca8 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00cad 0f8351160000                   jae        0x7f6a97bd2b84
00cb3 4c638c24b8000000               movsxd     r9, dword ptr [rsp + 0xb8]
00cbb 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00cc3 43886c0b09                     mov        byte ptr [r11 + r9 + 9], bpl
00cc8 470fbe5c130a                   movsx      r11d, byte ptr [r11 + r10 + 0xa]
00cce 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00cd6 46885c090a                     mov        byte ptr [rcx + r9 + 0xa], r11b
00cdb 460fbe5c110b                   movsx      r11d, byte ptr [rcx + r10 + 0xb]
00ce1 46885c090b                     mov        byte ptr [rcx + r9 + 0xb], r11b
00ce6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00cee 4183fa08                       cmp        r10d, 8
00cf2 0f8384160000                   jae        0x7f6a97bd2bfc
00cf8 49bb20ae28e300000000           movabs     r11, 0xe328ae20
00d02 4703449308                     add        r8d, dword ptr [r11 + r10*4 + 8]
00d07 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00d0c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00d14 4183fb04                       cmp        r11d, 4
00d18 7e42                           jle        0x7f6a97bd15dc
00d1a 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d21 83c504                         add        ebp, 4
00d24 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d2c 418bd0                         mov        edx, r8d
00d2f 90                             nop        
00d30 c5f877                         vzeroupper 
00d33 e8a8e6b5ff                     call       0x7f6a9772fc60
00d38 0f1f8400300e0004               nop        dword ptr [rax + rax + 0x4000e30]
00d40 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d48 8bd5                           mov        edx, ebp
00d4a 8bc8                           mov        ecx, eax
00d4c c5f877                         vzeroupper 
00d4f e88ce6b5ff                     call       0x7f6a9772fc60
00d54 0f1f84004c0e0005               nop        dword ptr [rax + rax + 0x5000e4c]
00d5c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00d64 4183fa08                       cmp        r10d, 8
00d68 7e62                           jle        0x7f6a97bd164c
00d6a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d6e 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00d78 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d80 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00d85 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d8c 83c508                         add        ebp, 8
00d8f 83c208                         add        edx, 8
00d92 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d9a 90                             nop        
00d9b 90                             nop        
00d9c c5f877                         vzeroupper 
00d9f e83ce6b5ff                     call       0x7f6a9772fc60
00da4 0f1f84009c0e0006               nop        dword ptr [rax + rax + 0x6000e9c]
00dac 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00db4 8bd5                           mov        edx, ebp
00db6 488bc8                         mov        rcx, rax
00db9 90                             nop        
00dba 90                             nop        
00dbb 90                             nop        
00dbc c5f877                         vzeroupper 
00dbf e81ce6b5ff                     call       0x7f6a9772fc60
00dc4 0f1f8400bc0e0007               nop        dword ptr [rax + rax + 0x7000ebc]
00dcc 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
00dd4 e992f9ffff                     jmp        0x7f6a97bd0feb
00dd9 4d63d0                         movsxd     r10, r8d
00ddc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00de3 c442a8f5db                     bzhi       r11, r11, r10
00de8 c4c1fb92fb                     kmovq      k7, r11
00ded 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00df3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00df9 eb68                           jmp        0x7f6a97bd16e3
00dfb 4585f6                         test       r14d, r14d
00dfe 0f8c94170000                   jl         0x7f6a97bd2e18
00e04 4585ed                         test       r13d, r13d
00e07 0f8c8b170000                   jl         0x7f6a97bd2e18
00e0d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00e12 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e17 0f827b170000                   jb         0x7f6a97bd2e18
00e1d 438d2c28                       lea        ebp, [r8 + r13]
00e21 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00e26 443bd5                         cmp        r10d, ebp
00e29 0f8269170000                   jb         0x7f6a97bd2e18
00e2f 4585c0                         test       r8d, r8d
00e32 0f8c60170000                   jl         0x7f6a97bd2e18
00e38 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e3d 453bde                         cmp        r11d, r14d
00e40 7421                           je         0x7f6a97bd16e3
00e42 4963d0                         movsxd     rdx, r8d
00e45 4883fa20                       cmp        rdx, 0x20
00e49 768e                           jbe        0x7f6a97bd1659
00e4b c5f877                         vzeroupper 
00e4e 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00e58 41ffd2                         call       r10
00e5b 0f1f840000000000               nop        dword ptr [rax + rax]
00e63 4c8b1424                       mov        r10, qword ptr [rsp]
00e67 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e6b c5f877                         vzeroupper 
00e6e 4881c400010000                 add        rsp, 0x100
00e75 5d                             pop        rbp
00e76 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e7a 0f87e01d0000                   ja         0x7f6a97bd34e0
00e80 c3                             ret        
00e81 4183fa30                       cmp        r10d, 0x30
00e85 0f8e8c000000                   jle        0x7f6a97bd1797
00e8b 4585f6                         test       r14d, r14d
00e8e 0f8c2c1b0000                   jl         0x7f6a97bd3240
00e94 4585ed                         test       r13d, r13d
00e97 0f8c231b0000                   jl         0x7f6a97bd3240
00e9d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00ea2 443b9c24c4000000               cmp        r11d, dword ptr [rsp + 0xc4]
00eaa 0f82101b0000                   jb         0x7f6a97bd3240
00eb0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00eb5 443bd3                         cmp        r10d, ebx
00eb8 0f82021b0000                   jb         0x7f6a97bd3240
00ebe 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ec6 4585d2                         test       r10d, r10d
00ec9 7426                           je         0x7f6a97bd1771
00ecb 4883fa20                       cmp        rdx, 0x20
00ecf 772c                           ja         0x7f6a97bd177d
00ed1 4d63d2                         movsxd     r10, r10d
00ed4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00edb c442a8f5db                     bzhi       r11, r11, r10
00ee0 c4c1fb92fb                     kmovq      k7, r11
00ee5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00eeb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ef1 899c24b8000000                 mov        dword ptr [rsp + 0xb8], ebx
00ef8 e970faffff                     jmp        0x7f6a97bd11ed
00efd c5f877                         vzeroupper 
00f00 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00f0a 41ffd2                         call       r10
00f0d 0f1f840000000000               nop        dword ptr [rax + rax]
00f15 ebda                           jmp        0x7f6a97bd1771
00f17 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00f1f 0f8356190000                   jae        0x7f6a97bd30fb
00f25 4d63de                         movsxd     r11, r14d
00f28 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f30 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00f37 443bac24b4000000               cmp        r13d, dword ptr [rsp + 0xb4]
00f3f 0f83d7190000                   jae        0x7f6a97bd319c
00f45 458d5510                       lea        r10d, [r13 + 0x10]
00f49 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00f51 4d63d5                         movsxd     r10, r13d
00f54 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00f5c c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00f63 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00f6b 443bc3                         cmp        r8d, ebx
00f6e 0f8dce060000                   jge        0x7f6a97bd1ec2
00f74 4d2bda                         sub        r11, r10
00f77 4d63d0                         movsxd     r10, r8d
00f7a 486374241c                     movsxd     rsi, dword ptr [rsp + 0x1c]
00f7f 4883c6f1                       add        rsi, -0xf
00f83 4f8d041a                       lea        r8, [r10 + r11]
00f87 4c3bc6                         cmp        r8, rsi
00f8a 0f83d41a0000                   jae        0x7f6a97bd32e4
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
00fb4 0f83aa1a0000                   jae        0x7f6a97bd32e4
00fba 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00fc2 443b8424b4000000               cmp        r8d, dword ptr [rsp + 0xb4]
00fca 0f83941a0000                   jae        0x7f6a97bd32e4
00fd0 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00fd5 4983c0f1                       add        r8, -0xf
00fd9 4983c2f0                       add        r10, -0x10
00fdd 4d3bd0                         cmp        r10, r8
00fe0 0f837e1a0000                   jae        0x7f6a97bd32e4
00fe6 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00fec 0f8fe61a0000                   jg         0x7f6a97bd3358
00ff2 418bce                         mov        ecx, r14d
00ff5 412bcd                         sub        ecx, r13d
00ff8 4183c520                       add        r13d, 0x20
00ffc e90b040000                     jmp        0x7f6a97bd1c8c
01001 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
01009 0f83c5150000                   jae        0x7f6a97bd2e54
0100f 4963c8                         movsxd     rcx, r8d
01012 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0101a 4d8b540a08                     mov        r10, qword ptr [r10 + rcx + 8]
0101f 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01027 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0102f 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01037 0f832b160000                   jae        0x7f6a97bd2ee8
0103d 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01045 418d6908                       lea        ebp, [r9 + 8]
01049 4d63d1                         movsxd     r10, r9d
0104c 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01054 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0105c 4b895c1308                     mov        qword ptr [r11 + r10 + 8], rbx
01061 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01068 0f8d87030000                   jge        0x7f6a97bd1c75
0106e 492bca                         sub        rcx, r10
01071 4863dd                         movsxd     rbx, ebp
01074 4c8d140b                       lea        r10, [rbx + rcx]
01078 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0107d 0f8369160000                   jae        0x7f6a97bd2f6c
01083 4c8bd2                         mov        r10, rdx
01086 4c2bd3                         sub        r10, rbx
01089 4983c207                       add        r10, 7
0108d 4983e2f8                       and        r10, 0xfffffffffffffff8
01091 458bda                         mov        r11d, r10d
01094 478d540b08                     lea        r10d, [r11 + r9 + 8]
01099 4d63d2                         movsxd     r10, r10d
0109c 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
010a1 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
010a6 0f8340160000                   jae        0x7f6a97bd2f6c
010ac 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
010b3 0f8333160000                   jae        0x7f6a97bd2f6c
010b9 4983c2f8                       add        r10, -8
010bd 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
010c2 0f8324160000                   jae        0x7f6a97bd2f6c
010c8 41bbf8ffffff                   mov        r11d, 0xfffffff8
010ce 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
010d6 498bc2                         mov        rax, r10
010d9 418bfa                         mov        edi, r10d
010dc 442bdf                         sub        r11d, edi
010df 452bd9                         sub        r11d, r9d
010e2 4183c3f0                       add        r11d, -0x10
010e6 418d7910                       lea        edi, [r9 + 0x10]
010ea 4c63d7                         movsxd     r10, edi
010ed be06000000                     mov        esi, 6
010f2 c442c8f5db                     bzhi       r11, r11, rsi
010f7 4d03d3                         add        r10, r11
010fa 4c3bd2                         cmp        r10, rdx
010fd 488bfa                         mov        rdi, rdx
01100 490f4cfa                       cmovl      rdi, r10
01104 4c8bd7                         mov        r10, rdi
01107 4c2bd3                         sub        r10, rbx
0110a 4d8d5aff                       lea        r11, [r10 - 1]
0110e 49c1fb3f                       sar        r11, 0x3f
01112 49c1eb3d                       shr        r11, 0x3d
01116 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
0111b 4983e2f8                       and        r10, 0xfffffffffffffff8
0111f 4c03d3                         add        r10, rbx
01122 493bda                         cmp        rbx, r10
01125 490f4cda                       cmovl      rbx, r10
01129 448bdb                         mov        r11d, ebx
0112c 458d5308                       lea        r10d, [r11 + 8]
01130 442b9c24c0000000               sub        r11d, dword ptr [rsp + 0xc0]
01138 4d63ea                         movsxd     r13, r10d
0113b 4c03e8                         add        r13, rax
0113e 4183c308                       add        r11d, 8
01142 4d63db                         movsxd     r11, r11d
01145 4c03d8                         add        r11, rax
01148 498d5d48                       lea        rbx, [r13 + 0x48]
0114c 4983c508                       add        r13, 8
01150 498d7308                       lea        rsi, [r11 + 8]
01154 4533d2                         xor        r10d, r10d
01157 483bde                         cmp        rbx, rsi
0115a 410f96c2                       setbe      r10b
0115e 4983c348                       add        r11, 0x48
01162 33f6                           xor        esi, esi
01164 4d3bdd                         cmp        r11, r13
01167 400f96c6                       setbe      sil
0116b 440bd6                         or         r10d, esi
0116e 0f84e0150000                   je         0x7f6a97bd2fd4
01174 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
0117c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01183 0f8f33160000                   jg         0x7f6a97bd303c
01189 452bc1                         sub        r8d, r9d
0118c 8bff                           mov        edi, edi
0118e eb02                           jmp        0x7f6a97bd1a12
01190 8beb                           mov        ebp, ebx
01192 458d1428                       lea        r10d, [r8 + rbp]
01196 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0119e 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
011a3 448bdd                         mov        r11d, ebp
011a6 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
011ae 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
011b3 8d5d08                         lea        ebx, [rbp + 8]
011b6 3bdf                           cmp        ebx, edi
011b8 7cd6                           jl         0x7f6a97bd1a10
011ba 4c8d9208feffff                 lea        r10, [rdx - 0x1f8]
011c1 4981fa00000080                 cmp        r10, -0x80000000
011c8 49c7c300000080                 mov        r11, 0xffffffff80000000
011cf 4d0f4cd3                       cmovl      r10, r11
011d3 458bca                         mov        r9d, r10d
011d6 413bd9                         cmp        ebx, r9d
011d9 0f8d45160000                   jge        0x7f6a97bd30a4
011df 4c63d3                         movsxd     r10, ebx
011e2 4c03d1                         add        r10, rcx
011e5 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
011ea 0f833b160000                   jae        0x7f6a97bd30ab
011f0 81c500020000                   add        ebp, 0x200
011f6 4c63d5                         movsxd     r10, ebp
011f9 4c03d1                         add        r10, rcx
011fc 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01201 0f8338160000                   jae        0x7f6a97bd30bf
01207 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
0120e 0f833f160000                   jae        0x7f6a97bd30d3
01214 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
0121b 0f8346160000                   jae        0x7f6a97bd30e7
01221 4889542440                     mov        qword ptr [rsp + 0x40], rdx
01226 eb0a                           jmp        0x7f6a97bd1ab2
01228 90                             nop        
01229 90                             nop        
0122a 90                             nop        
0122b 90                             nop        
0122c 90                             nop        
0122d 90                             nop        
0122e 90                             nop        
0122f 90                             nop        
01230 8bda                           mov        ebx, edx
01232 448d9b00010000                 lea        r11d, [rbx + 0x100]
01239 4503d8                         add        r11d, r8d
0123c 448d9380000000                 lea        r10d, [rbx + 0x80]
01243 4503d0                         add        r10d, r8d
01246 418bd3                         mov        edx, r11d
01249 4963eb                         movsxd     rbp, r11d
0124c 418bfa                         mov        edi, r10d
0124f 4d63ea                         movsxd     r13, r10d
01252 8bc3                           mov        eax, ebx
01254 418d3418                       lea        esi, [r8 + rbx]
01258 448bdb                         mov        r11d, ebx
0125b 4d63db                         movsxd     r11, r11d
0125e 448bd6                         mov        r10d, esi
01261 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
01269 62917e486f841608000000         vmovdqu32  zmm0, zmmword ptr [r14 + r10 + 8]
01274 62d17e487f840608000000         vmovdqu32  zmmword ptr [r14 + rax + 8], zmm0
0127f 4863f6                         movsxd     rsi, esi
01282 62d17e486f843648000000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x48]
0128d 62917e487f841e48000000         vmovdqu32  zmmword ptr [r14 + r11 + 0x48], zmm0
01298 62d17e486f843e08000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdi + 8]
012a3 62917e487f841e88000000         vmovdqu32  zmmword ptr [r14 + r11 + 0x88], zmm0
012ae 62917e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + r13 + 0x48]
012b9 62917e487f841ec8000000         vmovdqu32  zmmword ptr [r14 + r11 + 0xc8], zmm0
012c4 62d17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdx + 8]
012cf 62917e487f841e08010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x108], zmm0
012da 62d17e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + rbp + 0x48]
012e5 62917e487f841e48010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x148], zmm0
012f0 62d17e486f843688010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x188]
012fb 62917e487f841e88010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x188], zmm0
01306 62d17e486f8436c8010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x1c8]
01311 62917e487f841ec8010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x1c8], zmm0
0131c 8d9300020000                   lea        edx, [rbx + 0x200]
01322 413bd1                         cmp        edx, r9d
01325 0f8c05ffffff                   jl         0x7f6a97bd1ab0
0132b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01330 4983c3c8                       add        r11, -0x38
01334 4981fb00000080                 cmp        r11, -0x80000000
0133b 49c7c200000080                 mov        r10, 0xffffffff80000000
01342 4d0f4cda                       cmovl      r11, r10
01346 458bd3                         mov        r10d, r11d
01349 413bd2                         cmp        edx, r10d
0134c 7d53                           jge        0x7f6a97bd1c21
0134e 81c338020000                   add        ebx, 0x238
01354 4c63db                         movsxd     r11, ebx
01357 4c03d9                         add        r11, rcx
0135a 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0135f 0f8337180000                   jae        0x7f6a97bd341c
01365 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
0136c 0f8352180000                   jae        0x7f6a97bd3444
01372 90                             nop        
01373 90                             nop        
01374 448bca                         mov        r9d, edx
01377 458d1c10                       lea        r11d, [r8 + rdx]
0137b 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01383 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
0138e 62b17e487f840b08000000         vmovdqu32  zmmword ptr [rbx + r9 + 8], zmm0
01399 83c240                         add        edx, 0x40
0139c 413bd2                         cmp        edx, r10d
0139f 7cd3                           jl         0x7f6a97bd1bf4
013a1 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
013a8 7d4b                           jge        0x7f6a97bd1c75
013aa 4c63d2                         movsxd     r10, edx
013ad 4c03d1                         add        r10, rcx
013b0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
013b5 0f83f5170000                   jae        0x7f6a97bd3430
013bb 3b9424b0000000                 cmp        edx, dword ptr [rsp + 0xb0]
013c2 0f8310180000                   jae        0x7f6a97bd3458
013c8 458d1c10                       lea        r11d, [r8 + rdx]
013cc 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
013d4 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
013d9 448bca                         mov        r9d, edx
013dc 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
013e4 4f89540b08                     mov        qword ptr [r11 + r9 + 8], r10
013e9 83c208                         add        edx, 8
013ec 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
013f3 7cd3                           jl         0x7f6a97bd1c48
013f5 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
013fd e969f3ffff                     jmp        0x7f6a97bd0feb
01402 90                             nop        
01403 90                             nop        
01404 44898c24c4000000               mov        dword ptr [rsp + 0xc4], r9d
0140c 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
01414 448bd1                         mov        r10d, ecx
01417 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
0141f 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01427 c4817a6f441108                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 8]
0142e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01436 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
0143d 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
01445 4183c110                       add        r9d, 0x10
01449 453bcd                         cmp        r9d, r13d
0144c 7cb6                           jl         0x7f6a97bd1c84
0144e 4881c710ffffff                 add        rdi, -0xf0
01455 4881ff00000080                 cmp        rdi, -0x80000000
0145c 49c7c200000080                 mov        r10, 0xffffffff80000000
01463 490f4cfa                       cmovl      rdi, r10
01467 448bc7                         mov        r8d, edi
0146a 453bc8                         cmp        r9d, r8d
0146d 0f8d7e010000                   jge        0x7f6a97bd1e71
01473 4d63d1                         movsxd     r10, r9d
01476 4d03d3                         add        r10, r11
01479 4c3bd6                         cmp        r10, rsi
0147c 0f83ca160000                   jae        0x7f6a97bd33cc
01482 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0148a 4181c200010000                 add        r10d, 0x100
01491 4963fa                         movsxd     rdi, r10d
01494 4903fb                         add        rdi, r11
01497 483bfe                         cmp        rdi, rsi
0149a 0f83c0160000                   jae        0x7f6a97bd33e0
014a0 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
014a8 0f83c6160000                   jae        0x7f6a97bd33f4
014ae 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
014b6 0f83cc160000                   jae        0x7f6a97bd3408
014bc 90                             nop        
014bd 90                             nop        
014be 90                             nop        
014bf 90                             nop        
014c0 418bf9                         mov        edi, r9d
014c3 4c63d7                         movsxd     r10, edi
014c6 428d1409                       lea        edx, [rcx + r9]
014ca 418bf9                         mov        edi, r9d
014cd 8bc2                           mov        eax, edx
014cf 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
014d7 c5fa6f440508                   vmovdqu    xmm0, xmmword ptr [rbp + rax + 8]
014dd 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
014e5 c5fa7f443808                   vmovdqu    xmmword ptr [rax + rdi + 8], xmm0
014eb 4863d2                         movsxd     rdx, edx
014ee c5fa6f441518                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x18]
014f4 c4a17a7f441018                 vmovdqu    xmmword ptr [rax + r10 + 0x18], xmm0
014fb c5fa6f441528                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x28]
01501 c4a17a7f441028                 vmovdqu    xmmword ptr [rax + r10 + 0x28], xmm0
01508 c5fa6f441538                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x38]
0150e c4a17a7f441038                 vmovdqu    xmmword ptr [rax + r10 + 0x38], xmm0
01515 c5fa6f441548                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x48]
0151b c4a17a7f441048                 vmovdqu    xmmword ptr [rax + r10 + 0x48], xmm0
01522 c5fa6f441558                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x58]
01528 c4a17a7f441058                 vmovdqu    xmmword ptr [rax + r10 + 0x58], xmm0
0152f c5fa6f441568                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x68]
01535 c4a17a7f441068                 vmovdqu    xmmword ptr [rax + r10 + 0x68], xmm0
0153c c5fa6f441578                   vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x78]
01542 c4a17a7f441078                 vmovdqu    xmmword ptr [rax + r10 + 0x78], xmm0
01549 c5fa6f841588000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x88]
01552 c4a17a7f841088000000           vmovdqu    xmmword ptr [rax + r10 + 0x88], xmm0
0155c c5fa6f841598000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0x98]
01565 c4a17a7f841098000000           vmovdqu    xmmword ptr [rax + r10 + 0x98], xmm0
0156f c5fa6f8415a8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xa8]
01578 c4a17a7f8410a8000000           vmovdqu    xmmword ptr [rax + r10 + 0xa8], xmm0
01582 c5fa6f8415b8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xb8]
0158b c4a17a7f8410b8000000           vmovdqu    xmmword ptr [rax + r10 + 0xb8], xmm0
01595 c5fa6f8415c8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xc8]
0159e c4a17a7f8410c8000000           vmovdqu    xmmword ptr [rax + r10 + 0xc8], xmm0
015a8 c5fa6f8415d8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xd8]
015b1 c4a17a7f8410d8000000           vmovdqu    xmmword ptr [rax + r10 + 0xd8], xmm0
015bb c5fa6f8415e8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xe8]
015c4 c4a17a7f8410e8000000           vmovdqu    xmmword ptr [rax + r10 + 0xe8], xmm0
015ce c5fa6f8415f8000000             vmovdqu    xmm0, xmmword ptr [rbp + rdx + 0xf8]
015d7 c4a17a7f8410f8000000           vmovdqu    xmmword ptr [rax + r10 + 0xf8], xmm0
015e1 4181c100010000                 add        r9d, 0x100
015e8 453bc8                         cmp        r9d, r8d
015eb 0f8ccffeffff                   jl         0x7f6a97bd1d40
015f1 443bcb                         cmp        r9d, ebx
015f4 7d4c                           jge        0x7f6a97bd1ec2
015f6 4d63d1                         movsxd     r10, r9d
015f9 4d03d3                         add        r10, r11
015fc 4c3bd6                         cmp        r10, rsi
015ff 0f83e7150000                   jae        0x7f6a97bd346c
01605 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
0160d 0f83ed150000                   jae        0x7f6a97bd3480
01613 90                             nop        
01614 468d1409                       lea        r10d, [rcx + r9]
01618 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01620 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
01627 458bd9                         mov        r11d, r9d
0162a 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01632 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
01639 4183c110                       add        r9d, 0x10
0163d 443bcb                         cmp        r9d, ebx
01640 7cd2                           jl         0x7f6a97bd1e94
01642 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0164a 4503d6                         add        r10d, r14d
0164d 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01655 899c24b8000000                 mov        dword ptr [rsp + 0xb8], ebx
0165c e90cf3ffff                     jmp        0x7f6a97bd11ed
01661 bee4ffffff                     mov        esi, 0xffffffe4
01666 488b2c24                       mov        rbp, qword ptr [rsp]
0166a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0166f 4489542408                     mov        dword ptr [rsp + 8], r10d
01674 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01679 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0167e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01683 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01688 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0168d 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01692 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01697 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0169c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
016a1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016a6 90                             nop        
016a7 90                             nop        
016a8 c5f877                         vzeroupper 
016ab e830bbafff                     call       0x7f6a976cda60
016b0 0f1f8400a8170008               nop        dword ptr [rax + rax + 0x80017a8]
016b8 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
016c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c6 e815c61418                     call       0x7f6aafd1e560
016cb f4                             hlt        
016cc bee4ffffff                     mov        esi, 0xffffffe4
016d1 488b2c24                       mov        rbp, qword ptr [rsp]
016d5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016da 44895c2408                     mov        dword ptr [rsp + 8], r11d
016df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016ee 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016f3 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
016f8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016fd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01702 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01707 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0170c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01711 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01716 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0171b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01720 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01725 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0172a 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0172f 90                             nop        
01730 c5f877                         vzeroupper 
01733 e8a8baafff                     call       0x7f6a976cda60
01738 0f1f840030180009               nop        dword ptr [rax + rax + 0x9001830]
01740 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0174a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0174e e88dc51418                     call       0x7f6aafd1e560
01753 f4                             hlt        
01754 bee4ffffff                     mov        esi, 0xffffffe4
01759 488b2c24                       mov        rbp, qword ptr [rsp]
0175d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01762 4489542408                     mov        dword ptr [rsp + 8], r10d
01767 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0176c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01771 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01776 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0177b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01780 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01785 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0178a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0178f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01794 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01799 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0179e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017a6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017ab 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017b0 4489542458                     mov        dword ptr [rsp + 0x58], r10d
017b5 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
017bd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017c2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017c7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017cc 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
017d1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017da 90                             nop        
017db 90                             nop        
017dc c5f877                         vzeroupper 
017df e8fcb9afff                     call       0x7f6a976cda60
017e4 0f1f8400dc18000a               nop        dword ptr [rax + rax + 0xa0018dc]
017ec 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
017f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fa e8e1c41418                     call       0x7f6aafd1e560
017ff f4                             hlt        
01800 bee4ffffff                     mov        esi, 0xffffffe4
01805 488b2c24                       mov        rbp, qword ptr [rsp]
01809 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0180e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01813 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01818 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0181d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01822 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01827 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0182c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01831 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01836 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0183b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01840 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01845 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0184a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0184f 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01854 c5f877                         vzeroupper 
01857 e884b9afff                     call       0x7f6a976cda60
0185c 0f1f84005419000b               nop        dword ptr [rax + rax + 0xb001954]
01864 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0186e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01872 e869c41418                     call       0x7f6aafd1e560
01877 f4                             hlt        
01878 be45ffffff                     mov        esi, 0xffffff45
0187d 488b2c24                       mov        rbp, qword ptr [rsp]
01881 4c89442408                     mov        qword ptr [rsp + 8], r8
01886 90                             nop        
01887 90                             nop        
01888 c5f877                         vzeroupper 
0188b e850b9afff                     call       0x7f6a976cda60
01890 0f1f84008819000c               nop        dword ptr [rax + rax + 0xc001988]
01898 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
018a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018a6 e835c41418                     call       0x7f6aafd1e560
018ab f4                             hlt        
018ac be45ffffff                     mov        esi, 0xffffff45
018b1 488b2c24                       mov        rbp, qword ptr [rsp]
018b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018ba 44895c2408                     mov        dword ptr [rsp + 8], r11d
018bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018ce 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018d3 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
018d8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018dd 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018e2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018e7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018ec 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018f1 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
018f5 90                             nop        
018f6 90                             nop        
018f7 90                             nop        
018f8 c5f877                         vzeroupper 
018fb e8e0b8afff                     call       0x7f6a976cda60
01900 0f1f8400f819000d               nop        dword ptr [rax + rax + 0xd0019f8]
01908 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01912 4883e4f0                       and        rsp, 0xfffffffffffffff0
01916 e8c5c31418                     call       0x7f6aafd1e560
0191b f4                             hlt        
0191c 493bd8                         cmp        rbx, r8
0191f bdffffffff                     mov        ebp, 0xffffffff
01924 7c08                           jl         0x7f6a97bd21ae
01926 400f95c5                       setne      bpl
0192a 400fb6ed                       movzx      ebp, bpl
0192e be45ffffff                     mov        esi, 0xffffff45
01933 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01938 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0193d 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
01942 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01947 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0194c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01951 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01956 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0195b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01960 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01965 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0196a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0196f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01974 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01979 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0197e 90                             nop        
0197f 90                             nop        
01980 c5f877                         vzeroupper 
01983 e858b8afff                     call       0x7f6a976cda60
01988 0f1f8400801a000e               nop        dword ptr [rax + rax + 0xe001a80]
01990 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0199a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0199e e83dc31418                     call       0x7f6aafd1e560
019a3 f4                             hlt        
019a4 be45ffffff                     mov        esi, 0xffffff45
019a9 488b2c24                       mov        rbp, qword ptr [rsp]
019ad 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
019b2 4489442408                     mov        dword ptr [rsp + 8], r8d
019b7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
019bc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
019c1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019c6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019cb 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
019d0 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019d5 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
019da 4489442438                     mov        dword ptr [rsp + 0x38], r8d
019df 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
019e4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019e9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
019ee 4489442460                     mov        dword ptr [rsp + 0x60], r8d
019f3 4489542470                     mov        dword ptr [rsp + 0x70], r10d
019f8 c5f877                         vzeroupper 
019fb e8e0b7afff                     call       0x7f6a976cda60
01a00 0f1f8400f81a000f               nop        dword ptr [rax + rax + 0xf001af8]
01a08 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01a12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a16 e8c5c21418                     call       0x7f6aafd1e560
01a1b f4                             hlt        
01a1c be45ffffff                     mov        esi, 0xffffff45
01a21 488b2c24                       mov        rbp, qword ptr [rsp]
01a25 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a2a 4489542408                     mov        dword ptr [rsp + 8], r10d
01a2f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a34 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a39 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a3e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a43 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01a48 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a4d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a52 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a57 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a5c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a61 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a66 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a6b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01a73 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a78 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a7d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a82 90                             nop        
01a83 90                             nop        
01a84 c5f877                         vzeroupper 
01a87 e854b7afff                     call       0x7f6a976cda60
01a8c 0f1f8400841b0010               nop        dword ptr [rax + rax + 0x10001b84]
01a94 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aa2 e839c21418                     call       0x7f6aafd1e560
01aa7 f4                             hlt        
01aa8 bee4ffffff                     mov        esi, 0xffffffe4
01aad 488b2c24                       mov        rbp, qword ptr [rsp]
01ab1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ab6 44895c2408                     mov        dword ptr [rsp + 8], r11d
01abb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ac0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ac5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01aca 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01acf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ad4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ad9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ade 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ae3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ae8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01aed 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01af5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01afa 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01aff 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01b04 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b0c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01b11 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b16 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b1b 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01b23 90                             nop        
01b24 c5f877                         vzeroupper 
01b27 e8b4b6afff                     call       0x7f6a976cda60
01b2c 0f1f8400241c0011               nop        dword ptr [rax + rax + 0x11001c24]
01b34 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b42 e899c11418                     call       0x7f6aafd1e560
01b47 f4                             hlt        
01b48 bee4ffffff                     mov        esi, 0xffffffe4
01b4d 488b2c24                       mov        rbp, qword ptr [rsp]
01b51 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b56 4489542408                     mov        dword ptr [rsp + 8], r10d
01b5b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b60 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b65 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b6a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b6f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01b74 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b79 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b7e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b83 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01b88 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b8d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b95 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b9a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01b9f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01ba4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01bac 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01bb1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bb6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bbb 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01bc0 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
01bc5 90                             nop        
01bc6 90                             nop        
01bc7 90                             nop        
01bc8 c5f877                         vzeroupper 
01bcb e810b6afff                     call       0x7f6a976cda60
01bd0 0f1f8400c81c0012               nop        dword ptr [rax + rax + 0x12001cc8]
01bd8 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be6 e8f5c01418                     call       0x7f6aafd1e560
01beb f4                             hlt        
01bec 4533d2                         xor        r10d, r10d
01bef 4c891424                       mov        qword ptr [rsp], r10
01bf3 e94ae5ffff                     jmp        0x7f6a97bd09c2
01bf8 4533d2                         xor        r10d, r10d
01bfb 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01c03 e964e5ffff                     jmp        0x7f6a97bd09ec
01c08 4533d2                         xor        r10d, r10d
01c0b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01c13 e983e5ffff                     jmp        0x7f6a97bd0a1b
01c18 4533d2                         xor        r10d, r10d
01c1b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c20 e99de5ffff                     jmp        0x7f6a97bd0a42
01c25 4533d2                         xor        r10d, r10d
01c28 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01c30 e9bce5ffff                     jmp        0x7f6a97bd0a71
01c35 4533d2                         xor        r10d, r10d
01c38 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c40 e9d6e5ffff                     jmp        0x7f6a97bd0a9b
01c45 4183c008                       add        r8d, 8
01c49 be6effffff                     mov        esi, 0xffffff6e
01c4e 488b2c24                       mov        rbp, qword ptr [rsp]
01c52 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c57 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c66 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c6b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c70 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c74 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01c79 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c7e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c83 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c88 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c8d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c92 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01c97 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01c9c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ca1 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ca6 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
01cae 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01cb3 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01cb7 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01cbc c5f877                         vzeroupper 
01cbf e81cb5afff                     call       0x7f6a976cda60
01cc4 0f1f8400bc1d0013               nop        dword ptr [rax + rax + 0x13001dbc]
01ccc 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01cd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cda e801c01418                     call       0x7f6aafd1e560
01cdf f4                             hlt        
01ce0 4183c008                       add        r8d, 8
01ce4 be66ffffff                     mov        esi, 0xffffff66
01ce9 488b2c24                       mov        rbp, qword ptr [rsp]
01ced 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01cf2 4489542408                     mov        dword ptr [rsp + 8], r10d
01cf7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cfc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d01 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d06 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d0b 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01d0f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01d14 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d19 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d1e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d23 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01d28 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01d2d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d32 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d37 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d3c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d41 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
01d49 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01d4e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d52 458bd3                         mov        r10d, r11d
01d55 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d5a 90                             nop        
01d5b 90                             nop        
01d5c c5f877                         vzeroupper 
01d5f e87cb4afff                     call       0x7f6a976cda60
01d64 0f1f84005c1e0014               nop        dword ptr [rax + rax + 0x14001e5c]
01d6c 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01d76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d7a e861bf1418                     call       0x7f6aafd1e560
01d7f f4                             hlt        
01d80 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01d8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8e e84dbf1418                     call       0x7f6aafd1e560
01d93 f4                             hlt        
01d94 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01d9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01da2 e839bf1418                     call       0x7f6aafd1e560
01da7 f4                             hlt        
01da8 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db6 e825bf1418                     call       0x7f6aafd1e560
01dbb f4                             hlt        
01dbc 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01dc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dca e811bf1418                     call       0x7f6aafd1e560
01dcf f4                             hlt        
01dd0 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01dda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dde e8fdbe1418                     call       0x7f6aafd1e560
01de3 f4                             hlt        
01de4 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
01dee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01df2 e8e9be1418                     call       0x7f6aafd1e560
01df7 f4                             hlt        
01df8 beccffffff                     mov        esi, 0xffffffcc
01dfd 488b2c24                       mov        rbp, qword ptr [rsp]
01e01 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e06 4489542408                     mov        dword ptr [rsp + 8], r10d
01e0b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e10 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e15 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e1a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e1f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e24 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e29 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e2e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e33 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e38 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e3d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e45 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e4a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e4f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e54 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e59 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e5e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
01e66 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e6b 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01e70 c5f877                         vzeroupper 
01e73 e868b3afff                     call       0x7f6a976cda60
01e78 0f1f8400701f0015               nop        dword ptr [rax + rax + 0x15001f70]
01e80 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01e8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8e e84dbe1418                     call       0x7f6aafd1e560
01e93 f4                             hlt        
01e94 beccffffff                     mov        esi, 0xffffffcc
01e99 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e9e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ea3 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ea8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ead 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01eb2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01eb7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ebc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ec1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ec9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ece 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ed3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ed8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ee0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ee5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01eea 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01eef 90                             nop        
01ef0 c5f877                         vzeroupper 
01ef3 e8e8b2afff                     call       0x7f6a976cda60
01ef8 0f1f8400f01f0016               nop        dword ptr [rax + rax + 0x16001ff0]
01f00 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0e e8cdbd1418                     call       0x7f6aafd1e560
01f13 f4                             hlt        
01f14 bee4ffffff                     mov        esi, 0xffffffe4
01f19 488b2c24                       mov        rbp, qword ptr [rsp]
01f1d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f22 4489542408                     mov        dword ptr [rsp + 8], r10d
01f27 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f2c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f31 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f36 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f3b 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01f40 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f45 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01f4a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f4f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f54 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f59 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01f5e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f63 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01f6b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f70 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f75 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01f7a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f7f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f84 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01f8b 90                             nop        
01f8c c5f877                         vzeroupper 
01f8f e84cb2afff                     call       0x7f6a976cda60
01f94 0f1f84008c200017               nop        dword ptr [rax + rax + 0x1700208c]
01f9c 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
01fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01faa e831bd1418                     call       0x7f6aafd1e560
01faf f4                             hlt        
01fb0 be6effffff                     mov        esi, 0xffffff6e
01fb5 488b2c24                       mov        rbp, qword ptr [rsp]
01fb9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01fbe 4489542408                     mov        dword ptr [rsp + 8], r10d
01fc3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fc8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fcd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fd2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fd7 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01fdc 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01fe1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01fe6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01feb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ff0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ff5 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01ffa 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01fff 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02004 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02009 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0200e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02013 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02018 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
0201c c5f877                         vzeroupper 
0201f e8bcb1afff                     call       0x7f6a976cda60
02024 0f1f84001c210018               nop        dword ptr [rax + rax + 0x1800211c]
0202c 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02036 4883e4f0                       and        rsp, 0xfffffffffffffff0
0203a e8a1bc1418                     call       0x7f6aafd1e560
0203f f4                             hlt        
02040 be45ffffff                     mov        esi, 0xffffff45
02045 488b2c24                       mov        rbp, qword ptr [rsp]
02049 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0204e 4489542408                     mov        dword ptr [rsp + 8], r10d
02053 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02058 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0205d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02062 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02067 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0206c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02071 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02076 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0207b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02080 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02085 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0208a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0208f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02094 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02099 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0209e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
020a3 895c2478                       mov        dword ptr [rsp + 0x78], ebx
020a7 90                             nop        
020a8 c5f877                         vzeroupper 
020ab e830b1afff                     call       0x7f6a976cda60
020b0 0f1f8400a8210019               nop        dword ptr [rax + rax + 0x190021a8]
020b8 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
020c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c6 e815bc1418                     call       0x7f6aafd1e560
020cb f4                             hlt        
020cc be3dffffff                     mov        esi, 0xffffff3d
020d1 488b2c24                       mov        rbp, qword ptr [rsp]
020d5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020da 44895c2408                     mov        dword ptr [rsp + 8], r11d
020df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020ee 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020f3 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
020f8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020fd 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02102 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02107 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0210c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02111 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02116 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0211b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02120 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02125 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0212a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0212f 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02133 90                             nop        
02134 c5f877                         vzeroupper 
02137 e8a4b0afff                     call       0x7f6a976cda60
0213c 0f1f84003422001a               nop        dword ptr [rax + rax + 0x1a002234]
02144 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0214e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02152 e889bb1418                     call       0x7f6aafd1e560
02157 f4                             hlt        
02158 bee4ffffff                     mov        esi, 0xffffffe4
0215d 488b2c24                       mov        rbp, qword ptr [rsp]
02161 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02166 44895c2408                     mov        dword ptr [rsp + 8], r11d
0216b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02170 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02175 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0217a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0217f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02184 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02189 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0218e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02193 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02198 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0219d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
021a5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
021aa 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
021af 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021b4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
021bc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
021c1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021c6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021cb 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
021d3 90                             nop        
021d4 c5f877                         vzeroupper 
021d7 e804b0afff                     call       0x7f6a976cda60
021dc 0f1f8400d422001b               nop        dword ptr [rax + rax + 0x1b0022d4]
021e4 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
021ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
021f2 e8e9ba1418                     call       0x7f6aafd1e560
021f7 f4                             hlt        
021f8 bee4ffffff                     mov        esi, 0xffffffe4
021fd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02202 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02207 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0220c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02211 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02216 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0221b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02220 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02225 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0222d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02232 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02237 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0223c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02244 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02249 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0224e 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02253 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02258 c5f877                         vzeroupper 
0225b e880afafff                     call       0x7f6a976cda60
02260 0f1f84005823001c               nop        dword ptr [rax + rax + 0x1c002358]
02268 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02272 4883e4f0                       and        rsp, 0xfffffffffffffff0
02276 e865ba1418                     call       0x7f6aafd1e560
0227b f4                             hlt        
0227c 418d6801                       lea        ebp, [r8 + 1]
02280 bee4ffffff                     mov        esi, 0xffffffe4
02285 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0228a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0228f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02294 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02299 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0229e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022a3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
022a8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
022ad 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
022b5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
022ba 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
022bf 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022c4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
022cc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
022d1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022d6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
022db 4489442474                     mov        dword ptr [rsp + 0x74], r8d
022e0 c5f877                         vzeroupper 
022e3 e8f8aeafff                     call       0x7f6a976cda60
022e8 0f1f8400e023001d               nop        dword ptr [rax + rax + 0x1d0023e0]
022f0 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
022fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
022fe e8ddb91418                     call       0x7f6aafd1e560
02303 f4                             hlt        
02304 bee4ffffff                     mov        esi, 0xffffffe4
02309 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0230e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02313 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02318 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0231d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02322 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02327 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0232c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02331 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02339 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0233e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02343 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02348 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0234d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02352 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02357 90                             nop        
02358 c5f877                         vzeroupper 
0235b e880aeafff                     call       0x7f6a976cda60
02360 0f1f84005824001e               nop        dword ptr [rax + rax + 0x1e002458]
02368 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02372 4883e4f0                       and        rsp, 0xfffffffffffffff0
02376 e865b91418                     call       0x7f6aafd1e560
0237b f4                             hlt        
0237c bee4ffffff                     mov        esi, 0xffffffe4
02381 488b2c24                       mov        rbp, qword ptr [rsp]
02385 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0238a 4489542408                     mov        dword ptr [rsp + 8], r10d
0238f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02394 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02399 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0239e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023a3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
023a8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
023ad 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023b2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023b7 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
023bc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
023c1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
023c6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
023cb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023d0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
023d5 4489442474                     mov        dword ptr [rsp + 0x74], r8d
023da 90                             nop        
023db 90                             nop        
023dc c5f877                         vzeroupper 
023df e8fcadafff                     call       0x7f6a976cda60
023e4 0f1f8400dc24001f               nop        dword ptr [rax + rax + 0x1f0024dc]
023ec 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
023f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023fa e8e1b81418                     call       0x7f6aafd1e560
023ff f4                             hlt        
02400 beccffffff                     mov        esi, 0xffffffcc
02405 488b2c24                       mov        rbp, qword ptr [rsp]
02409 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0240e 4489542408                     mov        dword ptr [rsp + 8], r10d
02413 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02418 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0241d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02422 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02427 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0242c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02431 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02436 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0243b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02440 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02445 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0244d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02452 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02457 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0245c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02464 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02469 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0246e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02473 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02478 c5f877                         vzeroupper 
0247b e860adafff                     call       0x7f6a976cda60
02480 0f1f840078250020               nop        dword ptr [rax + rax + 0x20002578]
02488 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02492 4883e4f0                       and        rsp, 0xfffffffffffffff0
02496 e845b81418                     call       0x7f6aafd1e560
0249b f4                             hlt        
0249c be45ffffff                     mov        esi, 0xffffff45
024a1 488b2c24                       mov        rbp, qword ptr [rsp]
024a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024aa 4489542408                     mov        dword ptr [rsp + 8], r10d
024af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024b9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024be 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024c3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
024c8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
024cd 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
024d2 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
024d7 4489442468                     mov        dword ptr [rsp + 0x68], r8d
024dc c5f877                         vzeroupper 
024df e8fcacafff                     call       0x7f6a976cda60
024e4 0f1f8400dc250021               nop        dword ptr [rax + rax + 0x210025dc]
024ec 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
024f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
024fa e8e1b71418                     call       0x7f6aafd1e560
024ff f4                             hlt        
02500 bebeffffff                     mov        esi, 0xffffffbe
02505 488b2c24                       mov        rbp, qword ptr [rsp]
02509 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0250e 4489542408                     mov        dword ptr [rsp + 8], r10d
02513 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02518 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0251d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02522 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02527 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0252c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02531 90                             nop        
02532 90                             nop        
02533 90                             nop        
02534 c5f877                         vzeroupper 
02537 e8a4acafff                     call       0x7f6a976cda60
0253c 0f1f840034260022               nop        dword ptr [rax + rax + 0x22002634]
02544 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0254e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02552 e889b71418                     call       0x7f6aafd1e560
02557 f4                             hlt        
02558 be85ffffff                     mov        esi, 0xffffff85
0255d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
02561 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02566 44891424                       mov        dword ptr [rsp], r10d
0256a 44896c2404                     mov        dword ptr [rsp + 4], r13d
0256f 4489742408                     mov        dword ptr [rsp + 8], r14d
02574 c5f877                         vzeroupper 
02577 e864acafff                     call       0x7f6a976cda60
0257c 0f1f840074260023               nop        dword ptr [rax + rax + 0x23002674]
02584 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0258e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02592 e849b71418                     call       0x7f6aafd1e560
02597 f4                             hlt        
02598 beccffffff                     mov        esi, 0xffffffcc
0259d 488b2c24                       mov        rbp, qword ptr [rsp]
025a1 4489742410                     mov        dword ptr [rsp + 0x10], r14d
025a6 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
025ab 4489442420                     mov        dword ptr [rsp + 0x20], r8d
025b0 c5f877                         vzeroupper 
025b3 e828acafff                     call       0x7f6a976cda60
025b8 0f1f8400b0260024               nop        dword ptr [rax + rax + 0x240026b0]
025c0 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
025ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ce e80db71418                     call       0x7f6aafd1e560
025d3 f4                             hlt        
025d4 bee4ffffff                     mov        esi, 0xffffffe4
025d9 488b2c24                       mov        rbp, qword ptr [rsp]
025dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025e2 4489542408                     mov        dword ptr [rsp + 8], r10d
025e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025f1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025f6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025fb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02600 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02605 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0260a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0260f 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02614 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02619 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02621 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02626 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0262b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02630 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02635 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0263a 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
02642 90                             nop        
02643 90                             nop        
02644 c5f877                         vzeroupper 
02647 e894abafff                     call       0x7f6a976cda60
0264c 0f1f840044270025               nop        dword ptr [rax + rax + 0x25002744]
02654 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0265e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02662 e879b61418                     call       0x7f6aafd1e560
02667 f4                             hlt        
02668 bee4ffffff                     mov        esi, 0xffffffe4
0266d 488b2c24                       mov        rbp, qword ptr [rsp]
02671 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02676 4489542408                     mov        dword ptr [rsp + 8], r10d
0267b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02680 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02685 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0268a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0268f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02694 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02699 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0269e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
026a3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
026a8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
026ad 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
026b2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
026b7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026bc 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
026c1 4489442468                     mov        dword ptr [rsp + 0x68], r8d
026c6 90                             nop        
026c7 90                             nop        
026c8 c5f877                         vzeroupper 
026cb e810abafff                     call       0x7f6a976cda60
026d0 0f1f8400c8270026               nop        dword ptr [rax + rax + 0x260027c8]
026d8 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
026e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
026e6 e8f5b51418                     call       0x7f6aafd1e560
026eb f4                             hlt        
026ec 4183c008                       add        r8d, 8
026f0 be6effffff                     mov        esi, 0xffffff6e
026f5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026fa 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
026ff 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02704 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02709 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0270e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02713 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02718 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0271d 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
02725 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0272a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0272f 90                             nop        
02730 c5f877                         vzeroupper 
02733 e8a8aaafff                     call       0x7f6a976cda60
02738 0f1f840030280027               nop        dword ptr [rax + rax + 0x27002830]
02740 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0274a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0274e e88db51418                     call       0x7f6aafd1e560
02753 f4                             hlt        
02754 4183c008                       add        r8d, 8
02758 beb6ffffff                     mov        esi, 0xffffffb6
0275d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02762 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02767 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0276c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02771 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02776 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0277b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02780 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02785 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
0278d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02792 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02797 90                             nop        
02798 c5f877                         vzeroupper 
0279b e840aaafff                     call       0x7f6a976cda60
027a0 0f1f840098280028               nop        dword ptr [rax + rax + 0x28002898]
027a8 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
027b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027b6 e825b51418                     call       0x7f6aafd1e560
027bb f4                             hlt        
027bc 4183c008                       add        r8d, 8
027c0 be66ffffff                     mov        esi, 0xffffff66
027c5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027ca 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
027cf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
027d4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027d9 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
027de 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
027e3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027e8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
027ed 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
027f5 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
027fa 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
027ff 90                             nop        
02800 c5f877                         vzeroupper 
02803 e8d8a9afff                     call       0x7f6a976cda60
02808 0f1f840000290029               nop        dword ptr [rax + rax + 0x29002900]
02810 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
0281a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0281e e8bdb41418                     call       0x7f6aafd1e560
02823 f4                             hlt        
02824 8bd3                           mov        edx, ebx
02826 e976ebffff                     jmp        0x7f6a97bd1c21
0282b 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02835 4883e4f0                       and        rsp, 0xfffffffffffffff0
02839 e8a2b41418                     call       0x7f6aafd1e560
0283e f4                             hlt        
0283f 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02849 4883e4f0                       and        rsp, 0xfffffffffffffff0
0284d e88eb41418                     call       0x7f6aafd1e560
02852 f4                             hlt        
02853 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
0285d 4883e4f0                       and        rsp, 0xfffffffffffffff0
02861 e87ab41418                     call       0x7f6aafd1e560
02866 f4                             hlt        
02867 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02871 4883e4f0                       and        rsp, 0xfffffffffffffff0
02875 e866b41418                     call       0x7f6aafd1e560
0287a f4                             hlt        
0287b bee4ffffff                     mov        esi, 0xffffffe4
02880 488b2c24                       mov        rbp, qword ptr [rsp]
02884 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02889 44895c2408                     mov        dword ptr [rsp + 8], r11d
0288e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02893 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02898 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0289d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
028a2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
028a7 4489542434                     mov        dword ptr [rsp + 0x34], r10d
028ac 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
028b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028b6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
028bb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
028c0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
028c8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
028cd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
028d2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
028d7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028dc 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
028e1 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
028e5 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
028ea 4489742474                     mov        dword ptr [rsp + 0x74], r14d
028ef 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
028f7 90                             nop        
028f8 c5f877                         vzeroupper 
028fb e8e0a8afff                     call       0x7f6a976cda60
02900 0f1f8400f829002a               nop        dword ptr [rax + rax + 0x2a0029f8]
02908 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02912 4883e4f0                       and        rsp, 0xfffffffffffffff0
02916 e8c5b31418                     call       0x7f6aafd1e560
0291b f4                             hlt        
0291c c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
02925 bee4ffffff                     mov        esi, 0xffffffe4
0292a 488b2c24                       mov        rbp, qword ptr [rsp]
0292e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02933 4489542408                     mov        dword ptr [rsp + 8], r10d
02938 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0293d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02942 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02947 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0294c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02951 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02956 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0295b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02960 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02965 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0296a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02972 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02977 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0297c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02981 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02986 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0298b 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0298f 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02994 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
0299c c5f877                         vzeroupper 
0299f e83ca8afff                     call       0x7f6a976cda60
029a4 0f1f84009c2a002b               nop        dword ptr [rax + rax + 0x2b002a9c]
029ac 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
029b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029ba e821b31418                     call       0x7f6aafd1e560
029bf f4                             hlt        
029c0 beccffffff                     mov        esi, 0xffffffcc
029c5 488b2c24                       mov        rbp, qword ptr [rsp]
029c9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
029ce 4489542408                     mov        dword ptr [rsp + 8], r10d
029d3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
029d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029dd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029e2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
029e7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
029ec 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
029f1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029f6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
029fb 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02a00 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02a05 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02a0d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02a12 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02a17 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02a1c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02a24 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02a29 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a2e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02a33 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02a38 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
02a3d 90                             nop        
02a3e 90                             nop        
02a3f 90                             nop        
02a40 c5f877                         vzeroupper 
02a43 e898a7afff                     call       0x7f6a976cda60
02a48 0f1f8400402b002c               nop        dword ptr [rax + rax + 0x2c002b40]
02a50 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02a5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a5e e87db21418                     call       0x7f6aafd1e560
02a63 f4                             hlt        
02a64 418bee                         mov        ebp, r14d
02a67 83c510                         add        ebp, 0x10
02a6a be6effffff                     mov        esi, 0xffffff6e
02a6f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02a74 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02a79 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02a7e 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02a83 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02a88 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a8d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a92 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02a97 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a9c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02aa1 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02aa6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02aab 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02ab0 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02ab4 c5f877                         vzeroupper 
02ab7 e824a7afff                     call       0x7f6a976cda60
02abc 0f1f8400b42b002d               nop        dword ptr [rax + rax + 0x2d002bb4]
02ac4 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02ace 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ad2 e809b21418                     call       0x7f6aafd1e560
02ad7 f4                             hlt        
02ad8 418bee                         mov        ebp, r14d
02adb 83c510                         add        ebp, 0x10
02ade be66ffffff                     mov        esi, 0xffffff66
02ae3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ae8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02aed 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02af2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02af7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02afc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b01 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b06 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02b0b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02b10 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02b15 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02b1a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02b1f 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02b24 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02b28 c5f877                         vzeroupper 
02b2b e8b0a6afff                     call       0x7f6a976cda60
02b30 0f1f8400282c002e               nop        dword ptr [rax + rax + 0x2e002c28]
02b38 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02b42 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b46 e895b11418                     call       0x7f6aafd1e560
02b4b f4                             hlt        
02b4c 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5a e881b11418                     call       0x7f6aafd1e560
02b5f f4                             hlt        
02b60 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02b6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b6e e86db11418                     call       0x7f6aafd1e560
02b73 f4                             hlt        
02b74 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02b7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b82 e859b11418                     call       0x7f6aafd1e560
02b87 f4                             hlt        
02b88 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02b92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b96 e845b11418                     call       0x7f6aafd1e560
02b9b f4                             hlt        
02b9c 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02baa e831b11418                     call       0x7f6aafd1e560
02baf f4                             hlt        
02bb0 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bbe e81db11418                     call       0x7f6aafd1e560
02bc3 f4                             hlt        
02bc4 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bd2 e809b11418                     call       0x7f6aafd1e560
02bd7 f4                             hlt        
02bd8 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02be6 e8f5b01418                     call       0x7f6aafd1e560
02beb f4                             hlt        
02bec 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bfa e8e1b01418                     call       0x7f6aafd1e560
02bff f4                             hlt        
02c00 48bfd0934e706a7f0000           movabs     rdi, 0x7f6a704e93d0
02c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c0e e8cdb01418                     call       0x7f6aafd1e560
02c13 f4                             hlt        
02c14 488bf0                         mov        rsi, rax
02c17 eb0d                           jmp        0x7f6a97bd34a6
02c19 488bf0                         mov        rsi, rax
02c1c eb08                           jmp        0x7f6a97bd34a6
02c1e 488bf0                         mov        rsi, rax
02c21 eb03                           jmp        0x7f6a97bd34a6
02c23 488bf0                         mov        rsi, rax
02c26 c5f877                         vzeroupper 
02c29 4881c400010000                 add        rsp, 0x100
02c30 5d                             pop        rbp
02c31 e92a2fafff                     jmp        0x7f6a976c63e0
02c36 bef6ffffff                     mov        esi, 0xfffffff6
02c3b 90                             nop        
02c3c c5f877                         vzeroupper 
02c3f e89ca5afff                     call       0x7f6a976cda60
02c44 0f1f84003c2d002f               nop        dword ptr [rax + rax + 0x2f002d3c]
02c4c 48bf900b0b706a7f0000           movabs     rdi, 0x7f6a700b0b90
02c56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c5a e881b01418                     call       0x7f6aafd1e560
02c5f f4                             hlt        
02c60 49baf616bd976a7f0000           movabs     r10, 0x7f6a97bd16f6
02c6a 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02c71 e96aeeb5ff                     jmp        0x7f6a97732360
02c76 e8e5bcb4ff                     call       0x7f6a9771f1e0
02c7b e9aed3ffff                     jmp        0x7f6a97bd08ae
