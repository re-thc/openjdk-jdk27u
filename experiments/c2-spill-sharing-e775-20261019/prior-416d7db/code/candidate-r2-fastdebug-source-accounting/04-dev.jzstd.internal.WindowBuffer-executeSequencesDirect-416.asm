00000 e84b55d718                     call       0x7f63f495ad50
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
00028 0f85b82d0000                   jne        0x7f63dbbe85e6
0002e 4c8bae40010000                 mov        r13, qword ptr [rsi + 0x140]
00035 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
0003c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00041 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
00045 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004a 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00051 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00056 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00062 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00069 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0006e 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00075 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0007a 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00081 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00086 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0008d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00092 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00098 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
0009f 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000ab 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000b7 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000be 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000c3 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000ca 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000cf 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d3 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000d8 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000dc 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000e4 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000eb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000f3 488bfe                         mov        rdi, rsi
000f6 c5f877                         vzeroupper 
000f9 49ba3083b1f4637f0000           movabs     r10, 0x7f63f4b18330
00103 41ffd2                         call       r10
00106 0f1f840000000000               nop        dword ptr [rax + rax]
0010e 4d85ed                         test       r13, r13
00111 0f84811a0000                   je         0x7f63dbbe7398
00117 458b5d04                       mov        r11d, dword ptr [r13 + 4]
0011b 41c1eb0a                       shr        r11d, 0xa
0011f 4181fb2c080000                 cmp        r11d, 0x82c
00126 0f85c8240000                   jne        0x7f63dbbe7df4
0012c 4d8bd5                         mov        r10, r13
0012f 4c891424                       mov        qword ptr [rsp], r10
00133 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00138 4d85d2                         test       r10, r10
0013b 0f84631a0000                   je         0x7f63dbbe73a4
00141 458b5204                       mov        r10d, dword ptr [r10 + 4]
00145 41c1ea0a                       shr        r10d, 0xa
00149 4181fa0a020000                 cmp        r10d, 0x20a
00150 0f859e240000                   jne        0x7f63dbbe7df4
00156 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0015b 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00163 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00168 4d85d2                         test       r10, r10
0016b 0f84431a0000                   je         0x7f63dbbe73b4
00171 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00175 41c1eb0a                       shr        r11d, 0xa
00179 4181fb10020000                 cmp        r11d, 0x210
00180 0f856e240000                   jne        0x7f63dbbe7df4
00186 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4d85d2                         test       r10, r10
00196 0f84281a0000                   je         0x7f63dbbe73c4
0019c 458b5204                       mov        r10d, dword ptr [r10 + 4]
001a0 41c1ea0a                       shr        r10d, 0xa
001a4 4181fa0e020000                 cmp        r10d, 0x20e
001ab 0f8543240000                   jne        0x7f63dbbe7df4
001b1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001b6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001bb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001c0 4d85d2                         test       r10, r10
001c3 0f84081a0000                   je         0x7f63dbbe73d1
001c9 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001cd 41c1eb0a                       shr        r11d, 0xa
001d1 4181fb0e020000                 cmp        r11d, 0x20e
001d8 0f8516240000                   jne        0x7f63dbbe7df4
001de 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001eb 4d85d2                         test       r10, r10
001ee 0f84ed190000                   je         0x7f63dbbe73e1
001f4 458b5204                       mov        r10d, dword ptr [r10 + 4]
001f8 41c1ea0a                       shr        r10d, 0xa
001fc 4181fa0a020000                 cmp        r10d, 0x20a
00203 0f85eb230000                   jne        0x7f63dbbe7df4
00209 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0020e 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00216 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0021e 458b5208                       mov        r10d, dword ptr [r10 + 8]
00222 4489542408                     mov        dword ptr [rsp + 8], r10d
00227 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0022c 4585db                         test       r11d, r11d
0022f 0f845f230000                   je         0x7f63dbbe7d94
00235 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0023d 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00241 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00246 4585db                         test       r11d, r11d
00249 0f8645230000                   jbe        0x7f63dbbe7d94
0024f 4183fb01                       cmp        r11d, 1
00253 0f863b230000                   jbe        0x7f63dbbe7d94
00259 4183fb02                       cmp        r11d, 2
0025d 0f8631230000                   jbe        0x7f63dbbe7d94
00263 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0026b 458b5208                       mov        r10d, dword ptr [r10 + 8]
0026f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00274 458d5af1                       lea        r11d, [r10 - 0xf]
00278 4585db                         test       r11d, r11d
0027b 0f8c13230000                   jl         0x7f63dbbe7d94
00281 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00289 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0028d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00292 458d53f1                       lea        r10d, [r11 - 0xf]
00296 4585d2                         test       r10d, r10d
00299 0f8cf5220000                   jl         0x7f63dbbe7d94
0029f 4183c3f9                       add        r11d, -7
002a3 4585db                         test       r11d, r11d
002a6 0f8ce8220000                   jl         0x7f63dbbe7d94
002ac 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002b1 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002b6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002bb 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
002c0 4183c3f1                       add        r11d, -0xf
002c4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002cc 458d42f9                       lea        r8d, [r10 - 7]
002d0 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
002d8 4d63da                         movsxd     r11, r10d
002db 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
002e0 4183c2f1                       add        r10d, -0xf
002e4 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
002ec 4d8d53f9                       lea        r10, [r11 - 7]
002f0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002f5 e93b040000                     jmp        0x7f63dbbe5f35
002fa 448bd5                         mov        r10d, ebp
002fd 4d63d2                         movsxd     r10, r10d
00300 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00307 c442a8f5db                     bzhi       r11, r11, r10
0030c c4c1fb92fb                     kmovq      k7, r11
00311 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00317 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0031d 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00325 4403dd                         add        r11d, ebp
00328 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00330 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00334 418502                         test       dword ptr [r10], eax
00337 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
0033f 0f8d2f0a0000                   jge        0x7f63dbbe6574
00345 458bf5                         mov        r14d, r13d
00348 458bce                         mov        r9d, r14d
0034b 442b8c24b8000000               sub        r9d, dword ptr [rsp + 0xb8]
00353 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
0035a 2bac24b8000000                 sub        ebp, dword ptr [rsp + 0xb8]
00361 3bac24b8000000                 cmp        ebp, dword ptr [rsp + 0xb8]
00368 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00370 410f4fea                       cmovg      ebp, r10d
00374 4585c9                         test       r9d, r9d
00377 0f8ce71a0000                   jl         0x7f63dbbe7664
0037d 4585f6                         test       r14d, r14d
00380 0f8cde1a0000                   jl         0x7f63dbbe7664
00386 458d1429                       lea        r10d, [r9 + rbp]
0038a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0038f 453bc2                         cmp        r8d, r10d
00392 0f82cc1a0000                   jb         0x7f63dbbe7664
00398 458d2c2e                       lea        r13d, [r14 + rbp]
0039c 453bc5                         cmp        r8d, r13d
0039f 0f82bf1a0000                   jb         0x7f63dbbe7664
003a5 85ed                           test       ebp, ebp
003a7 0f8cb71a0000                   jl         0x7f63dbbe7664
003ad 85ed                           test       ebp, ebp
003af 0f8468ffffff                   je         0x7f63dbbe5b1d
003b5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
003bd 4b8d74320c                     lea        rsi, [r10 + r14 + 0xc]
003c2 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
003c7 4863d5                         movsxd     rdx, ebp
003ca 4883fa20                       cmp        rdx, 0x20
003ce 0f8626ffffff                   jbe        0x7f63dbbe5afa
003d4 c5f877                         vzeroupper 
003d7 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
003e1 41ffd2                         call       r10
003e4 0f1f840000000000               nop        dword ptr [rax + rax]
003ec e92cffffff                     jmp        0x7f63dbbe5b1d
003f1 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003f9 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00400 8b9c24b4000000                 mov        ebx, dword ptr [rsp + 0xb4]
00407 4103da                         add        ebx, r10d
0040a e90a030000                     jmp        0x7f63dbbe5f19
0040f 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00417 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0041f 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
00424 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
00429 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00431 44039424b0000000               add        r10d, dword ptr [rsp + 0xb0]
00439 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00441 4d63c2                         movsxd     r8, r10d
00444 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0044c 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
00454 0f8ca3060000                   jl         0x7f63dbbe62fd
0045a 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00462 4183fa30                       cmp        r10d, 0x30
00466 0f8e99000000                   jle        0x7f63dbbe5d05
0046c 4585c9                         test       r9d, r9d
0046f 0f8c43190000                   jl         0x7f63dbbe75b8
00475 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0047d 4585db                         test       r11d, r11d
00480 0f8c32190000                   jl         0x7f63dbbe75b8
00486 478d1c0a                       lea        r11d, [r10 + r9]
0048a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0048f 453bc3                         cmp        r8d, r11d
00492 0f8220190000                   jb         0x7f63dbbe75b8
00498 443b8424c0000000               cmp        r8d, dword ptr [rsp + 0xc0]
004a0 0f8212190000                   jb         0x7f63dbbe75b8
004a6 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
004ae 4585db                         test       r11d, r11d
004b1 0f8454020000                   je         0x7f63dbbe5f0b
004b7 4963d3                         movsxd     rdx, r11d
004ba 4883fa20                       cmp        rdx, 0x20
004be 7728                           ja         0x7f63dbbe5ce8
004c0 458bd3                         mov        r10d, r11d
004c3 4d63d2                         movsxd     r10, r10d
004c6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004cd c442a8f5db                     bzhi       r11, r11, r10
004d2 c4c1fb92fb                     kmovq      k7, r11
004d7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004dd 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004e3 e923020000                     jmp        0x7f63dbbe5f0b
004e8 c5f877                         vzeroupper 
004eb 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
004f5 41ffd2                         call       r10
004f8 0f1f840000000000               nop        dword ptr [rax + rax]
00500 e906020000                     jmp        0x7f63dbbe5f0b
00505 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
0050d 0f832d150000                   jae        0x7f63dbbe7240
00513 4963f9                         movsxd     rdi, r9d
00516 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0051e 498b543a0c                     mov        rdx, qword ptr [r10 + rdi + 0xc]
00523 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0052b 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00533 0f83b3150000                   jae        0x7f63dbbe72ec
00539 8b8c24b0000000                 mov        ecx, dword ptr [rsp + 0xb0]
00540 8d5908                         lea        ebx, [rcx + 8]
00543 4c63d1                         movsxd     r10, ecx
00546 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0054e 4b8954130c                     mov        qword ptr [r11 + r10 + 0xc], rdx
00553 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
0055a 0f8dab010000                   jge        0x7f63dbbe5f0b
00560 492bfa                         sub        rdi, r10
00563 4c63db                         movsxd     r11, ebx
00566 4d8d143b                       lea        r10, [r11 + rdi]
0056a 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0056f 0f837c160000                   jae        0x7f63dbbe73f1
00575 4d8bd0                         mov        r10, r8
00578 4d2bd3                         sub        r10, r11
0057b 4983c207                       add        r10, 7
0057f 4983e2f8                       and        r10, 0xfffffffffffffff8
00583 458bda                         mov        r11d, r10d
00586 458d540b08                     lea        r10d, [r11 + rcx + 8]
0058b 4d63d2                         movsxd     r10, r10d
0058e 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
00593 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00598 0f8353160000                   jae        0x7f63dbbe73f1
0059e 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005a5 0f8346160000                   jae        0x7f63dbbe73f1
005ab 4983c2f8                       add        r10, -8
005af 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005b4 0f8337160000                   jae        0x7f63dbbe73f1
005ba 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005c2 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005c9 0f8fc9160000                   jg         0x7f63dbbe7498
005cf 442bc9                         sub        r9d, ecx
005d2 83c110                         add        ecx, 0x10
005d5 458d1c19                       lea        r11d, [r9 + rbx]
005d9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005e1 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005e6 448bd3                         mov        r10d, ebx
005e9 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
005f1 4e895c120c                     mov        qword ptr [rdx + r10 + 0xc], r11
005f6 448d5b08                       lea        r11d, [rbx + 8]
005fa 443bd9                         cmp        r11d, ecx
005fd 7d05                           jge        0x7f63dbbe5e04
005ff 418bdb                         mov        ebx, r11d
00602 ebd1                           jmp        0x7f63dbbe5dd5
00604 4983c0f8                       add        r8, -8
00608 4981f800000080                 cmp        r8, -0x80000000
0060f 49c7c200000080                 mov        r10, 0xffffffff80000000
00616 4d0f4cc2                       cmovl      r8, r10
0061a 458bd0                         mov        r10d, r8d
0061d 453bda                         cmp        r11d, r10d
00620 0f8d8a000000                   jge        0x7f63dbbe5eb0
00626 4d63c3                         movsxd     r8, r11d
00629 4c03c7                         add        r8, rdi
0062c 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00631 0f8309170000                   jae        0x7f63dbbe7540
00637 83c310                         add        ebx, 0x10
0063a 4c63c3                         movsxd     r8, ebx
0063d 4c03c7                         add        r8, rdi
00640 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00645 0f8309170000                   jae        0x7f63dbbe7554
0064b 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00653 0f830f170000                   jae        0x7f63dbbe7568
00659 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
00660 0f8316170000                   jae        0x7f63dbbe757c
00666 90                             nop        
00667 90                             nop        
00668 90                             nop        
00669 90                             nop        
0066a 90                             nop        
0066b 90                             nop        
0066c 90                             nop        
0066d 90                             nop        
0066e 90                             nop        
0066f 90                             nop        
00670 438d0c19                       lea        ecx, [r9 + r11]
00674 458bc3                         mov        r8d, r11d
00677 4963d8                         movsxd     rbx, r8d
0067a 448bc1                         mov        r8d, ecx
0067d 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00685 4a8b54020c                     mov        rdx, qword ptr [rdx + r8 + 0xc]
0068a 4863c9                         movsxd     rcx, ecx
0068d 458bc3                         mov        r8d, r11d
00690 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00698 4a8954060c                     mov        qword ptr [rsi + r8 + 0xc], rdx
0069d 4c8b440e14                     mov        r8, qword ptr [rsi + rcx + 0x14]
006a2 4c89441e14                     mov        qword ptr [rsi + rbx + 0x14], r8
006a7 4183c310                       add        r11d, 0x10
006ab 453bda                         cmp        r11d, r10d
006ae 7cc0                           jl         0x7f63dbbe5e70
006b0 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
006b8 7d51                           jge        0x7f63dbbe5f0b
006ba 4d63d3                         movsxd     r10, r11d
006bd 4c03d7                         add        r10, rdi
006c0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
006c5 0f83c5160000                   jae        0x7f63dbbe7590
006cb 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
006d3 0f83cb160000                   jae        0x7f63dbbe75a4
006d9 90                             nop        
006da 90                             nop        
006db 90                             nop        
006dc 478d1419                       lea        r10d, [r9 + r11]
006e0 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
006e8 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
006ed 458bc3                         mov        r8d, r11d
006f0 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
006f8 4e8954010c                     mov        qword ptr [rcx + r8 + 0xc], r10
006fd 4183c308                       add        r11d, 8
00701 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
00709 7cd1                           jl         0x7f63dbbe5edc
0070b 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00712 039c24b4000000                 add        ebx, dword ptr [rsp + 0xb4]
00719 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0071d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00722 41ffc0                         inc        r8d
00725 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0072a 418502                         test       dword ptr [r10], eax
0072d 448bb424bc000000               mov        r14d, dword ptr [rsp + 0xbc]
00735 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0073d 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00742 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00747 452bde                         sub        r11d, r14d
0074a 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00752 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
00757 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0075c 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00761 0f8d3b060000                   jge        0x7f63dbbe65a2
00767 443b442408                     cmp        r8d, dword ptr [rsp + 8]
0076c 0f833f0e0000                   jae        0x7f63dbbe6db1
00772 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0077a 4f8b4cc210                     mov        r9, qword ptr [r10 + r8*8 + 0x10]
0077f 458bd1                         mov        r10d, r9d
00782 4181e2ffff0100                 and        r10d, 0x1ffff
00789 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00791 4d8bd1                         mov        r10, r9
00794 49c1ea12                       shr        r10, 0x12
00798 49c1f924                       sar        r9, 0x24
0079c 458bc2                         mov        r8d, r10d
0079f 458bd1                         mov        r10d, r9d
007a2 418bd2                         mov        edx, r10d
007a5 4181e0ffff0300                 and        r8d, 0x3ffff
007ac 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
007b4 4585d2                         test       r10d, r10d
007b7 0f8c63100000                   jl         0x7f63dbbe7020
007bd 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
007c5 4585d2                         test       r10d, r10d
007c8 0f854a020000                   jne        0x7f63dbbe6218
007ce 4533d2                         xor        r10d, r10d
007d1 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
007d9 448bd2                         mov        r10d, edx
007dc 4183fa03                       cmp        r10d, 3
007e0 0f8e6e020000                   jle        0x7f63dbbe6254
007e6 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
007ee 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
007f2 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
007fa 45895314                       mov        dword ptr [r11 + 0x14], r10d
007fe 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00802 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0080a 45895a10                       mov        dword ptr [r10 + 0x10], r11d
0080e 448d52fd                       lea        r10d, [rdx - 3]
00812 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0081a 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00822 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00826 4863ac24b8000000               movsxd     rbp, dword ptr [rsp + 0xb8]
0082e 4c63c3                         movsxd     r8, ebx
00831 4c03442468                     add        r8, qword ptr [rsp + 0x68]
00836 48639424b0000000               movsxd     rdx, dword ptr [rsp + 0xb0]
0083e 4c03c2                         add        r8, rdx
00841 493be8                         cmp        rbp, r8
00844 0f8f4e100000                   jg         0x7f63dbbe7098
0084a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00852 4585db                         test       r11d, r11d
00855 0f8e910f0000                   jle        0x7f63dbbe6fec
0085b 448beb                         mov        r13d, ebx
0085e 4403ac24b0000000               add        r13d, dword ptr [rsp + 0xb0]
00866 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0086e 4503d5                         add        r10d, r13d
00871 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00876 0f8fac100000                   jg         0x7f63dbbe7128
0087c 458bde                         mov        r11d, r14d
0087f 44039c24b0000000               add        r11d, dword ptr [rsp + 0xb0]
00887 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0088f 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00897 0f8f0f110000                   jg         0x7f63dbbe71ac
0089d 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
008a5 4183fa10                       cmp        r10d, 0x10
008a9 0f8f78050000                   jg         0x7f63dbbe6627
008af 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
008b7 0f83670d0000                   jae        0x7f63dbbe6e24
008bd 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
008c5 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
008cc 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
008d3 0f83db0d0000                   jae        0x7f63dbbe6eb4
008d9 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
008e1 4503de                         add        r11d, r14d
008e4 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
008ec 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008f4 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
008fb 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00903 4403d3                         add        r10d, ebx
00906 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0090e 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
00916 442b8c24b8000000               sub        r9d, dword ptr [rsp + 0xb8]
0091e 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00926 4183fa10                       cmp        r10d, 0x10
0092a 0f8fdffaffff                   jg         0x7f63dbbe5c0f
00930 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00938 4183fb10                       cmp        r11d, 0x10
0093c 0f8ccdfaffff                   jl         0x7f63dbbe5c0f
00942 443b8c24ac000000               cmp        r9d, dword ptr [rsp + 0xac]
0094a 0f83180e0000                   jae        0x7f63dbbe6f68
00950 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00958 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
0095f 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00967 443b9424ac000000               cmp        r10d, dword ptr [rsp + 0xac]
0096f 0f827cfaffff                   jb         0x7f63dbbe5bf1
00975 bee4ffffff                     mov        esi, 0xffffffe4
0097a 488b2c24                       mov        rbp, qword ptr [rsp]
0097e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00983 4489542408                     mov        dword ptr [rsp + 8], r10d
00988 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0098d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00992 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00997 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0099c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
009a1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
009a6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
009ab 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009b0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009b5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
009ba 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
009c2 4c89542448                     mov        qword ptr [rsp + 0x48], r10
009c7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
009cc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
009d1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
009d9 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
009de 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
009e3 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
009e8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009f1 90                             nop        
009f2 90                             nop        
009f3 90                             nop        
009f4 c5f877                         vzeroupper 
009f7 e86445b0ff                     call       0x7f63db6ea760
009fc 0f1f8400f40a0002               nop        dword ptr [rax + rax + 0x2000af4]
00a04 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
00a0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a12 e8e9a6b418                     call       0x7f63f4730900
00a17 f4                             hlt        
00a18 453bd3                         cmp        r10d, r11d
00a1b 0f8eb8fdffff                   jle        0x7f63dbbe5fd9
00a21 be45ffffff                     mov        esi, 0xffffff45
00a26 418bea                         mov        ebp, r10d
00a29 44891c24                       mov        dword ptr [rsp], r11d
00a2d 90                             nop        
00a2e 90                             nop        
00a2f 90                             nop        
00a30 c5f877                         vzeroupper 
00a33 e82845b0ff                     call       0x7f63db6ea760
00a38 0f1f8400300b0003               nop        dword ptr [rax + rax + 0x3000b30]
00a40 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
00a4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a4e e8ada6b418                     call       0x7f63f4730900
00a53 f4                             hlt        
00a54 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a5c 4585d2                         test       r10d, r10d
00a5f 7407                           je         0x7f63dbbe6268
00a61 448d52ff                       lea        r10d, [rdx - 1]
00a65 418bd2                         mov        edx, r10d
00a68 85d2                           test       edx, edx
00a6a 7478                           je         0x7f63dbbe62e4
00a6c 83fa03                         cmp        edx, 3
00a6f 0f84d7150000                   je         0x7f63dbbe784c
00a75 83fa02                         cmp        edx, 2
00a78 0f8762160000                   ja         0x7f63dbbe78e0
00a7e 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00a82 0f8384140000                   jae        0x7f63dbbe770c
00a88 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00a90 458b44930c                     mov        r8d, dword ptr [r11 + rdx*4 + 0xc]
00a95 85d2                           test       edx, edx
00a97 7e3d                           jle        0x7f63dbbe62d6
00a99 448d5aff                       lea        r11d, [rdx - 1]
00a9d 443b5c240c                     cmp        r11d, dword ptr [rsp + 0xc]
00aa2 0f8308150000                   jae        0x7f63dbbe77b0
00aa8 90                             nop        
00aa9 90                             nop        
00aaa 90                             nop        
00aab 90                             nop        
00aac 90                             nop        
00aad 90                             nop        
00aae 90                             nop        
00aaf 90                             nop        
00ab0 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00ab8 458b5c9308                     mov        r11d, dword ptr [r11 + rdx*4 + 8]
00abd 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00ac5 45895c910c                     mov        dword ptr [r9 + rdx*4 + 0xc], r11d
00aca 448d52ff                       lea        r10d, [rdx - 1]
00ace 418bd2                         mov        edx, r10d
00ad1 4585d2                         test       r10d, r10d
00ad4 7fda                           jg         0x7f63dbbe62b0
00ad6 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00ade 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00ae2 eb0c                           jmp        0x7f63dbbe62f0
00ae4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00aec 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
00af0 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00af8 e929fdffff                     jmp        0x7f63dbbe6026
00afd 4183fb10                       cmp        r11d, 0x10
00b01 0f8d1d1a0000                   jge        0x7f63dbbe7d24
00b07 4183fb08                       cmp        r11d, 8
00b0b 0f8d83040000                   jge        0x7f63dbbe6794
00b11 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00b19 4183fb10                       cmp        r11d, 0x10
00b1d 0f8eac000000                   jle        0x7f63dbbe63cf
00b23 4585c9                         test       r9d, r9d
00b26 0f8c50190000                   jl         0x7f63dbbe7c7c
00b2c 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b34 4585d2                         test       r10d, r10d
00b37 0f8c3f190000                   jl         0x7f63dbbe7c7c
00b3d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b42 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00b4a 0f822c190000                   jb         0x7f63dbbe7c7c
00b50 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00b57 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
00b5e 448bf3                         mov        r14d, ebx
00b61 443bdb                         cmp        r11d, ebx
00b64 0f8212190000                   jb         0x7f63dbbe7c7c
00b6a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b72 4585db                         test       r11d, r11d
00b75 0f8c01190000                   jl         0x7f63dbbe7c7c
00b7b 4585db                         test       r11d, r11d
00b7e 0f84c4f7ffff                   je         0x7f63dbbe5b48
00b84 4883fd20                       cmp        rbp, 0x20
00b88 7725                           ja         0x7f63dbbe63af
00b8a 4d63d3                         movsxd     r10, r11d
00b8d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b94 c442a8f5db                     bzhi       r11, r11, r10
00b99 c4c1fb92fb                     kmovq      k7, r11
00b9e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ba4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00baa e999f7ffff                     jmp        0x7f63dbbe5b48
00baf 488bd5                         mov        rdx, rbp
00bb2 c5f877                         vzeroupper 
00bb5 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00bbf 41ffd2                         call       r10
00bc2 0f1f840000000000               nop        dword ptr [rax + rax]
00bca e979f7ffff                     jmp        0x7f63dbbe5b48
00bcf 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00bd4 0f839a150000                   jae        0x7f63dbbe7974
00bda 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00be2 430fbe6c0a0c                   movsx      ebp, byte ptr [r10 + r9 + 0xc]
00be8 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00bf0 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00bf5 0f8325160000                   jae        0x7f63dbbe7a20
00bfb 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c03 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c0b 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00c10 458d5103                       lea        r10d, [r9 + 3]
00c14 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00c1c 41ffc0                         inc        r8d
00c1f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c24 0f8386160000                   jae        0x7f63dbbe7ab0
00c2a 4d63d9                         movsxd     r11, r9d
00c2d 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c35 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00c3b 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00c43 4183c203                       add        r10d, 3
00c47 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c4c 0f8306170000                   jae        0x7f63dbbe7b58
00c52 4c639424b0000000               movsxd     r10, dword ptr [rsp + 0xb0]
00c5a 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00c62 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00c67 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00c6d 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00c75 468844110e                     mov        byte ptr [rcx + r10 + 0xe], r8b
00c7a 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00c80 46885c110f                     mov        byte ptr [rcx + r10 + 0xf], r11b
00c85 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c8d 4183fb08                       cmp        r11d, 8
00c91 0f8359170000                   jae        0x7f63dbbe7bf0
00c97 49bbf0ef2fe300000000           movabs     r11, 0xe32feff0
00ca1 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ca9 47034c930c                     add        r9d, dword ptr [r11 + r10*4 + 0xc]
00cae 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cb3 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00cbb 4183fb04                       cmp        r11d, 4
00cbf 7e43                           jle        0x7f63dbbe6504
00cc1 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00cc8 83c504                         add        ebp, 4
00ccb 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cd3 418bd1                         mov        edx, r9d
00cd6 90                             nop        
00cd7 90                             nop        
00cd8 c5f877                         vzeroupper 
00cdb e880d7b5ff                     call       0x7f63db743c60
00ce0 0f1f8400d80d0004               nop        dword ptr [rax + rax + 0x4000dd8]
00ce8 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cf0 8bd5                           mov        edx, ebp
00cf2 8bc8                           mov        ecx, eax
00cf4 c5f877                         vzeroupper 
00cf7 e864d7b5ff                     call       0x7f63db743c60
00cfc 0f1f8400f40d0005               nop        dword ptr [rax + rax + 0x5000df4]
00d04 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00d0c 4183fa08                       cmp        r10d, 8
00d10 7e62                           jle        0x7f63dbbe6574
00d12 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d16 49ba20f02fe300000000           movabs     r10, 0xe32ff020
00d20 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00d28 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00d2d 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00d34 83c508                         add        ebp, 8
00d37 83c208                         add        edx, 8
00d3a 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00d42 90                             nop        
00d43 90                             nop        
00d44 c5f877                         vzeroupper 
00d47 e814d7b5ff                     call       0x7f63db743c60
00d4c 0f1f8400440e0006               nop        dword ptr [rax + rax + 0x6000e44]
00d54 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00d5c 8bd5                           mov        edx, ebp
00d5e 488bc8                         mov        rcx, rax
00d61 90                             nop        
00d62 90                             nop        
00d63 90                             nop        
00d64 c5f877                         vzeroupper 
00d67 e8f4d6b5ff                     call       0x7f63db743c60
00d6c 0f1f8400640e0007               nop        dword ptr [rax + rax + 0x7000e64]
00d74 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00d7b e999f9ffff                     jmp        0x7f63dbbe5f19
00d80 4d63d3                         movsxd     r10, r11d
00d83 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d8a c442a8f5db                     bzhi       r11, r11, r10
00d8f c4c1fb92fb                     kmovq      k7, r11
00d94 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d9a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00da0 eb67                           jmp        0x7f63dbbe6609
00da2 4585f6                         test       r14d, r14d
00da5 0f8ca1180000                   jl         0x7f63dbbe7e4c
00dab 85db                           test       ebx, ebx
00dad 0f8c99180000                   jl         0x7f63dbbe7e4c
00db3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00db8 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00dbd 0f8289180000                   jb         0x7f63dbbe7e4c
00dc3 428d2c1b                       lea        ebp, [rbx + r11]
00dc7 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00dcc 443bc5                         cmp        r8d, ebp
00dcf 0f8277180000                   jb         0x7f63dbbe7e4c
00dd5 4585db                         test       r11d, r11d
00dd8 0f8c6e180000                   jl         0x7f63dbbe7e4c
00dde 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00de3 453bd6                         cmp        r10d, r14d
00de6 7421                           je         0x7f63dbbe6609
00de8 4963d3                         movsxd     rdx, r11d
00deb 4883fa20                       cmp        rdx, 0x20
00def 768f                           jbe        0x7f63dbbe6580
00df1 c5f877                         vzeroupper 
00df4 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00dfe 41ffd2                         call       r10
00e01 0f1f840000000000               nop        dword ptr [rax + rax]
00e09 4c8b1424                       mov        r10, qword ptr [rsp]
00e0d 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00e11 c5f877                         vzeroupper 
00e14 4881c4f0000000                 add        rsp, 0xf0
00e1b 5d                             pop        rbp
00e1c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e20 0f87aa1f0000                   ja         0x7f63dbbe85d0
00e26 c3                             ret        
00e27 4183fa30                       cmp        r10d, 0x30
00e2b 0f8e8c000000                   jle        0x7f63dbbe66bd
00e31 4585f6                         test       r14d, r14d
00e34 0f8cae1c0000                   jl         0x7f63dbbe82e8
00e3a 85db                           test       ebx, ebx
00e3c 0f8ca61c0000                   jl         0x7f63dbbe82e8
00e42 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e47 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00e4f 0f82931c0000                   jb         0x7f63dbbe82e8
00e55 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e5a 453bdd                         cmp        r11d, r13d
00e5d 0f82851c0000                   jb         0x7f63dbbe82e8
00e63 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00e6b 4585d2                         test       r10d, r10d
00e6e 7426                           je         0x7f63dbbe6696
00e70 4883fa20                       cmp        rdx, 0x20
00e74 772d                           ja         0x7f63dbbe66a3
00e76 4d63d2                         movsxd     r10, r10d
00e79 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e80 c442a8f5db                     bzhi       r11, r11, r10
00e85 c4c1fb92fb                     kmovq      k7, r11
00e8a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e90 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e96 4489ac24b0000000               mov        dword ptr [rsp + 0xb0], r13d
00e9e e96bfaffff                     jmp        0x7f63dbbe610e
00ea3 c5f877                         vzeroupper 
00ea6 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00eb0 41ffd2                         call       r10
00eb3 0f1f840000000000               nop        dword ptr [rax + rax]
00ebb ebd9                           jmp        0x7f63dbbe6696
00ebd 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00ec5 0f83b01a0000                   jae        0x7f63dbbe817b
00ecb 4d63ce                         movsxd     r9, r14d
00ece 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00ed6 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00edd 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
00ee4 0f833e1b0000                   jae        0x7f63dbbe8228
00eea 448d5310                       lea        r10d, [rbx + 0x10]
00eee 418bc2                         mov        eax, r10d
00ef1 4c63db                         movsxd     r11, ebx
00ef4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00efc c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00f03 448bd0                         mov        r10d, eax
00f06 453bd5                         cmp        r10d, r13d
00f09 0f8d82060000                   jge        0x7f63dbbe6d91
00f0f 4d2bcb                         sub        r9, r11
00f12 4d63da                         movsxd     r11, r10d
00f15 486354241c                     movsxd     rdx, dword ptr [rsp + 0x1c]
00f1a 4883c2f1                       add        rdx, -0xf
00f1e 4f8d040b                       lea        r8, [r11 + r9]
00f22 4c3bc2                         cmp        r8, rdx
00f25 0f83691c0000                   jae        0x7f63dbbe8394
00f2b 4963cd                         movsxd     rcx, r13d
00f2e 4c8bc1                         mov        r8, rcx
00f31 4d2bc3                         sub        r8, r11
00f34 4983c00f                       add        r8, 0xf
00f38 4983e0f0                       and        r8, 0xfffffffffffffff0
00f3c 458bd8                         mov        r11d, r8d
00f3f 458d5c1b10                     lea        r11d, [r11 + rbx + 0x10]
00f44 4d63db                         movsxd     r11, r11d
00f47 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
00f4c 4c3bc2                         cmp        r8, rdx
00f4f 0f833f1c0000                   jae        0x7f63dbbe8394
00f55 443b9424ac000000               cmp        r10d, dword ptr [rsp + 0xac]
00f5d 0f83311c0000                   jae        0x7f63dbbe8394
00f63 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f68 4983c2f1                       add        r10, -0xf
00f6c 4983c3f0                       add        r11, -0x10
00f70 4d3bda                         cmp        r11, r10
00f73 0f831b1c0000                   jae        0x7f63dbbe8394
00f79 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00f80 0f8fa21c0000                   jg         0x7f63dbbe8428
00f86 458bd6                         mov        r10d, r14d
00f89 442bd3                         sub        r10d, ebx
00f8c 83c320                         add        ebx, 0x20
00f8f e9f2030000                     jmp        0x7f63dbbe6b86
00f94 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
00f9c 0f83e6160000                   jae        0x7f63dbbe7e88
00fa2 4963f9                         movsxd     rdi, r9d
00fa5 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00fad 498b4c3a0c                     mov        rcx, qword ptr [r10 + rdi + 0xc]
00fb2 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00fba 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00fc2 0f835c170000                   jae        0x7f63dbbe7f24
00fc8 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00fcf 8d6b08                         lea        ebp, [rbx + 8]
00fd2 4c63d3                         movsxd     r10, ebx
00fd5 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00fdd 4b894c130c                     mov        qword ptr [r11 + r10 + 0xc], rcx
00fe2 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
00fe9 0f8d86030000                   jge        0x7f63dbbe6b75
00fef 492bfa                         sub        rdi, r10
00ff2 4863cd                         movsxd     rcx, ebp
00ff5 4c8d1439                       lea        r10, [rcx + rdi]
00ff9 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
00ffe 0f83c4170000                   jae        0x7f63dbbe7fc8
01004 4d8bd0                         mov        r10, r8
01007 4c2bd1                         sub        r10, rcx
0100a 4983c207                       add        r10, 7
0100e 4983e2f8                       and        r10, 0xfffffffffffffff8
01012 458bda                         mov        r11d, r10d
01015 458d541b08                     lea        r10d, [r11 + rbx + 8]
0101a 4d63d2                         movsxd     r10, r10d
0101d 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
01022 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
01027 0f839b170000                   jae        0x7f63dbbe7fc8
0102d 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01034 0f838e170000                   jae        0x7f63dbbe7fc8
0103a 4983c2f8                       add        r10, -8
0103e 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01043 0f837f170000                   jae        0x7f63dbbe7fc8
01049 41baf4ffffff                   mov        r10d, 0xfffffff4
0104f 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01057 498bc3                         mov        rax, r11
0105a 418bd3                         mov        edx, r11d
0105d 442bd2                         sub        r10d, edx
01060 442bd3                         sub        r10d, ebx
01063 4183c2f0                       add        r10d, -0x10
01067 8d5310                         lea        edx, [rbx + 0x10]
0106a 4c63da                         movsxd     r11, edx
0106d be06000000                     mov        esi, 6
01072 c442c8f5d2                     bzhi       r10, r10, rsi
01077 4d03da                         add        r11, r10
0107a 4d3bd8                         cmp        r11, r8
0107d 498bd0                         mov        rdx, r8
01080 490f4cd3                       cmovl      rdx, r11
01084 4c8bd2                         mov        r10, rdx
01087 4c2bd1                         sub        r10, rcx
0108a 4d8d5aff                       lea        r11, [r10 - 1]
0108e 49c1fb3f                       sar        r11, 0x3f
01092 49c1eb3d                       shr        r11, 0x3d
01096 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
0109b 4983e2f8                       and        r10, 0xfffffffffffffff8
0109f 4c03d1                         add        r10, rcx
010a2 493bca                         cmp        rcx, r10
010a5 490f4cca                       cmovl      rcx, r10
010a9 448bd9                         mov        r11d, ecx
010ac 458d5308                       lea        r10d, [r11 + 8]
010b0 442b9c24b8000000               sub        r11d, dword ptr [rsp + 0xb8]
010b8 4d63ea                         movsxd     r13, r10d
010bb 4c03e8                         add        r13, rax
010be 4183c308                       add        r11d, 8
010c2 4d63d3                         movsxd     r10, r11d
010c5 4c03d0                         add        r10, rax
010c8 498d4d4c                       lea        rcx, [r13 + 0x4c]
010cc 4983c50c                       add        r13, 0xc
010d0 498d720c                       lea        rsi, [r10 + 0xc]
010d4 4533db                         xor        r11d, r11d
010d7 483bce                         cmp        rcx, rsi
010da 410f96c3                       setbe      r11b
010de 4983c24c                       add        r10, 0x4c
010e2 33f6                           xor        esi, esi
010e4 4d3bd5                         cmp        r10, r13
010e7 400f96c6                       setbe      sil
010eb 440bde                         or         r11d, esi
010ee 0f8448170000                   je         0x7f63dbbe803c
010f4 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
010fc 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
01103 0f8fa7170000                   jg         0x7f63dbbe80b0
01109 442bcb                         sub        r9d, ebx
0110c 8bca                           mov        ecx, edx
0110e eb02                           jmp        0x7f63dbbe6912
01110 8beb                           mov        ebp, ebx
01112 458d1429                       lea        r10d, [r9 + rbp]
01116 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0111e 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
01123 448bdd                         mov        r11d, ebp
01126 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
0112e 4e89541b0c                     mov        qword ptr [rbx + r11 + 0xc], r10
01133 8d5d08                         lea        ebx, [rbp + 8]
01136 3bd9                           cmp        ebx, ecx
01138 7cd6                           jl         0x7f63dbbe6910
0113a 4d8d9008feffff                 lea        r10, [r8 - 0x1f8]
01141 4981fa00000080                 cmp        r10, -0x80000000
01148 49c7c300000080                 mov        r11, 0xffffffff80000000
0114f 4d0f4cd3                       cmovl      r10, r11
01153 418bca                         mov        ecx, r10d
01156 3bd9                           cmp        ebx, ecx
01158 0f8dc6170000                   jge        0x7f63dbbe8124
0115e 4c63d3                         movsxd     r10, ebx
01161 4c03d7                         add        r10, rdi
01164 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01169 0f83bc170000                   jae        0x7f63dbbe812b
0116f 81c500020000                   add        ebp, 0x200
01175 4c63d5                         movsxd     r10, ebp
01178 4c03d7                         add        r10, rdi
0117b 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01180 0f83b9170000                   jae        0x7f63dbbe813f
01186 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
0118d 0f83c0170000                   jae        0x7f63dbbe8153
01193 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
0119a 0f83c7170000                   jae        0x7f63dbbe8167
011a0 c4c1f96ec0                     vmovq      xmm0, r8
011a5 eb0b                           jmp        0x7f63dbbe69b2
011a7 90                             nop        
011a8 90                             nop        
011a9 90                             nop        
011aa 90                             nop        
011ab 90                             nop        
011ac 90                             nop        
011ad 90                             nop        
011ae 90                             nop        
011af 90                             nop        
011b0 8bde                           mov        ebx, esi
011b2 448d9b00010000                 lea        r11d, [rbx + 0x100]
011b9 4503d9                         add        r11d, r9d
011bc 448d9380000000                 lea        r10d, [rbx + 0x80]
011c3 4503d1                         add        r10d, r9d
011c6 418bd3                         mov        edx, r11d
011c9 4963eb                         movsxd     rbp, r11d
011cc 458bc2                         mov        r8d, r10d
011cf 4d63ea                         movsxd     r13, r10d
011d2 8bc3                           mov        eax, ebx
011d4 418d3419                       lea        esi, [r9 + rbx]
011d8 448bdb                         mov        r11d, ebx
011db 4d63db                         movsxd     r11, r11d
011de 448bd6                         mov        r10d, esi
011e1 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
011e9 62917e486f8c160c000000         vmovdqu32  zmm1, zmmword ptr [r14 + r10 + 0xc]
011f4 62d17e487f8c060c000000         vmovdqu32  zmmword ptr [r14 + rax + 0xc], zmm1
011ff 4863f6                         movsxd     rsi, esi
01202 62d17e486f8c364c000000         vmovdqu32  zmm1, zmmword ptr [r14 + rsi + 0x4c]
0120d 62917e487f8c1e4c000000         vmovdqu32  zmmword ptr [r14 + r11 + 0x4c], zmm1
01218 62917e486f8c060c000000         vmovdqu32  zmm1, zmmword ptr [r14 + r8 + 0xc]
01223 62917e487f8c1e8c000000         vmovdqu32  zmmword ptr [r14 + r11 + 0x8c], zmm1
0122e 62917e486f8c2e4c000000         vmovdqu32  zmm1, zmmword ptr [r14 + r13 + 0x4c]
01239 62917e487f8c1ecc000000         vmovdqu32  zmmword ptr [r14 + r11 + 0xcc], zmm1
01244 62d17e486f8c160c000000         vmovdqu32  zmm1, zmmword ptr [r14 + rdx + 0xc]
0124f 62917e487f8c1e0c010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x10c], zmm1
0125a 62d17e486f8c2e4c000000         vmovdqu32  zmm1, zmmword ptr [r14 + rbp + 0x4c]
01265 62917e487f8c1e4c010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x14c], zmm1
01270 62d17e486f8c368c010000         vmovdqu32  zmm1, zmmword ptr [r14 + rsi + 0x18c]
0127b 62917e487f8c1e8c010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x18c], zmm1
01286 62d17e486f8c36cc010000         vmovdqu32  zmm1, zmmword ptr [r14 + rsi + 0x1cc]
01291 62917e487f8c1ecc010000         vmovdqu32  zmmword ptr [r14 + r11 + 0x1cc], zmm1
0129c 8db300020000                   lea        esi, [rbx + 0x200]
012a2 3bf1                           cmp        esi, ecx
012a4 0f8c06ffffff                   jl         0x7f63dbbe69b0
012aa c4c1f97ec3                     vmovq      r11, xmm0
012af 4983c3c8                       add        r11, -0x38
012b3 4981fb00000080                 cmp        r11, -0x80000000
012ba 49c7c200000080                 mov        r10, 0xffffffff80000000
012c1 4d0f4cda                       cmovl      r11, r10
012c5 458bdb                         mov        r11d, r11d
012c8 413bf3                         cmp        esi, r11d
012cb 7d54                           jge        0x7f63dbbe6b21
012cd 81c338020000                   add        ebx, 0x238
012d3 4c63d3                         movsxd     r10, ebx
012d6 4c03d7                         add        r10, rdi
012d9 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
012de 0f83281a0000                   jae        0x7f63dbbe850c
012e4 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
012eb 0f83431a0000                   jae        0x7f63dbbe8534
012f1 90                             nop        
012f2 90                             nop        
012f3 90                             nop        
012f4 448bc6                         mov        r8d, esi
012f7 458d1431                       lea        r10d, [r9 + rsi]
012fb 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01303 62b17e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc]
0130e 62b17e487f84010c000000         vmovdqu32  zmmword ptr [rcx + r8 + 0xc], zmm0
01319 83c640                         add        esi, 0x40
0131c 413bf3                         cmp        esi, r11d
0131f 7cd3                           jl         0x7f63dbbe6af4
01321 3bb424c0000000                 cmp        esi, dword ptr [rsp + 0xc0]
01328 7d4b                           jge        0x7f63dbbe6b75
0132a 4c63d6                         movsxd     r10, esi
0132d 4c03d7                         add        r10, rdi
01330 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01335 0f83e5190000                   jae        0x7f63dbbe8520
0133b 3bb424a8000000                 cmp        esi, dword ptr [rsp + 0xa8]
01342 0f83001a0000                   jae        0x7f63dbbe8548
01348 458d1c31                       lea        r11d, [r9 + rsi]
0134c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01354 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
01359 448bc6                         mov        r8d, esi
0135c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01364 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
01369 83c608                         add        esi, 8
0136c 3bb424c0000000                 cmp        esi, dword ptr [rsp + 0xc0]
01373 7cd3                           jl         0x7f63dbbe6b48
01375 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0137c e998f3ffff                     jmp        0x7f63dbbe5f19
01381 90                             nop        
01382 90                             nop        
01383 90                             nop        
01384 8bc7                           mov        eax, edi
01386 448bc0                         mov        r8d, eax
01389 458d1c02                       lea        r11d, [r10 + rax]
0138d 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
01395 c4a17a6f441f0c                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 0xc]
0139c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013a4 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
013ab 8d7810                         lea        edi, [rax + 0x10]
013ae 3bfb                           cmp        edi, ebx
013b0 7cd2                           jl         0x7f63dbbe6b84
013b2 4881c110ffffff                 add        rcx, -0xf0
013b9 4881f900000080                 cmp        rcx, -0x80000000
013c0 49c7c300000080                 mov        r11, 0xffffffff80000000
013c7 490f4ccb                       cmovl      rcx, r11
013cb 448bc1                         mov        r8d, ecx
013ce 413bf8                         cmp        edi, r8d
013d1 0f8d69010000                   jge        0x7f63dbbe6d40
013d7 4c63df                         movsxd     r11, edi
013da 4d03d9                         add        r11, r9
013dd 4c3bda                         cmp        r11, rdx
013e0 0f83d6180000                   jae        0x7f63dbbe84bc
013e6 448d9800010000                 lea        r11d, [rax + 0x100]
013ed 4963cb                         movsxd     rcx, r11d
013f0 4903c9                         add        rcx, r9
013f3 483bca                         cmp        rcx, rdx
013f6 0f83d4180000                   jae        0x7f63dbbe84d0
013fc 3bbc24ac000000                 cmp        edi, dword ptr [rsp + 0xac]
01403 0f83db180000                   jae        0x7f63dbbe84e4
01409 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
01411 0f83e1180000                   jae        0x7f63dbbe84f8
01417 90                             nop        
01418 90                             nop        
01419 90                             nop        
0141a 90                             nop        
0141b 90                             nop        
0141c 90                             nop        
0141d 90                             nop        
0141e 90                             nop        
0141f 90                             nop        
01420 8bcf                           mov        ecx, edi
01422 4863d9                         movsxd     rbx, ecx
01425 458d1c3a                       lea        r11d, [r10 + rdi]
01429 8bcf                           mov        ecx, edi
0142b 418bf3                         mov        esi, r11d
0142e 488b842490000000               mov        rax, qword ptr [rsp + 0x90]
01436 c5fa6f44300c                   vmovdqu    xmm0, xmmword ptr [rax + rsi + 0xc]
0143c 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
01444 c5fa7f440e0c                   vmovdqu    xmmword ptr [rsi + rcx + 0xc], xmm0
0144a 4963cb                         movsxd     rcx, r11d
0144d c5fa6f44081c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x1c]
01453 c5fa7f441e1c                   vmovdqu    xmmword ptr [rsi + rbx + 0x1c], xmm0
01459 c5fa6f44082c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x2c]
0145f c5fa7f441e2c                   vmovdqu    xmmword ptr [rsi + rbx + 0x2c], xmm0
01465 c5fa6f44083c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x3c]
0146b c5fa7f441e3c                   vmovdqu    xmmword ptr [rsi + rbx + 0x3c], xmm0
01471 c5fa6f44084c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x4c]
01477 c5fa7f441e4c                   vmovdqu    xmmword ptr [rsi + rbx + 0x4c], xmm0
0147d c5fa6f44085c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x5c]
01483 c5fa7f441e5c                   vmovdqu    xmmword ptr [rsi + rbx + 0x5c], xmm0
01489 c5fa6f44086c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x6c]
0148f c5fa7f441e6c                   vmovdqu    xmmword ptr [rsi + rbx + 0x6c], xmm0
01495 c5fa6f44087c                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x7c]
0149b c5fa7f441e7c                   vmovdqu    xmmword ptr [rsi + rbx + 0x7c], xmm0
014a1 c5fa6f84088c000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x8c]
014aa c5fa7f841e8c000000             vmovdqu    xmmword ptr [rsi + rbx + 0x8c], xmm0
014b3 c5fa6f84089c000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x9c]
014bc c5fa7f841e9c000000             vmovdqu    xmmword ptr [rsi + rbx + 0x9c], xmm0
014c5 c5fa6f8408ac000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xac]
014ce c5fa7f841eac000000             vmovdqu    xmmword ptr [rsi + rbx + 0xac], xmm0
014d7 c5fa6f8408bc000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xbc]
014e0 c5fa7f841ebc000000             vmovdqu    xmmword ptr [rsi + rbx + 0xbc], xmm0
014e9 c5fa6f8408cc000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xcc]
014f2 c5fa7f841ecc000000             vmovdqu    xmmword ptr [rsi + rbx + 0xcc], xmm0
014fb c5fa6f8408dc000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xdc]
01504 c5fa7f841edc000000             vmovdqu    xmmword ptr [rsi + rbx + 0xdc], xmm0
0150d c5fa6f8408ec000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xec]
01516 c5fa7f841eec000000             vmovdqu    xmmword ptr [rsi + rbx + 0xec], xmm0
0151f c5fa6f8408fc000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xfc]
01528 c5fa7f841efc000000             vmovdqu    xmmword ptr [rsi + rbx + 0xfc], xmm0
01531 81c700010000                   add        edi, 0x100
01537 413bf8                         cmp        edi, r8d
0153a 0f8ce0feffff                   jl         0x7f63dbbe6c20
01540 413bfd                         cmp        edi, r13d
01543 7d4c                           jge        0x7f63dbbe6d91
01545 4c63df                         movsxd     r11, edi
01548 4d03d9                         add        r11, r9
0154b 4c3bda                         cmp        r11, rdx
0154e 0f8308180000                   jae        0x7f63dbbe855c
01554 3bbc24ac000000                 cmp        edi, dword ptr [rsp + 0xac]
0155b 0f830f180000                   jae        0x7f63dbbe8570
01561 90                             nop        
01562 90                             nop        
01563 90                             nop        
01564 458d043a                       lea        r8d, [r10 + rdi]
01568 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01570 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
01577 448bdf                         mov        r11d, edi
0157a 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01582 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
01589 83c710                         add        edi, 0x10
0158c 413bfd                         cmp        edi, r13d
0158f 7cd3                           jl         0x7f63dbbe6d64
01591 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
01599 4503d6                         add        r10d, r14d
0159c 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
015a4 4489ac24b0000000               mov        dword ptr [rsp + 0xb0], r13d
015ac e95df3ffff                     jmp        0x7f63dbbe610e
015b1 bee4ffffff                     mov        esi, 0xffffffe4
015b6 488b2c24                       mov        rbp, qword ptr [rsp]
015ba 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015bf 44895c2408                     mov        dword ptr [rsp + 8], r11d
015c4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015c9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015ce 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015d3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015d8 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015dc 4489742434                     mov        dword ptr [rsp + 0x34], r14d
015e1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015e6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
015eb 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
015f0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015f5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015fa 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
015ff 90                             nop        
01600 c5f877                         vzeroupper 
01603 e85839b0ff                     call       0x7f63db6ea760
01608 0f1f840000170008               nop        dword ptr [rax + rax + 0x8001700]
01610 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0161a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0161e e8dd9ab418                     call       0x7f63f4730900
01623 f4                             hlt        
01624 bee4ffffff                     mov        esi, 0xffffffe4
01629 488b2c24                       mov        rbp, qword ptr [rsp]
0162d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01632 44895c2408                     mov        dword ptr [rsp + 8], r11d
01637 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0163c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01641 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01646 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0164b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0164f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01654 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01659 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0165e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01663 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01668 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0166d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01672 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01677 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0167c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01681 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01686 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0168b 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01690 c5f877                         vzeroupper 
01693 e8c838b0ff                     call       0x7f63db6ea760
01698 0f1f840090170009               nop        dword ptr [rax + rax + 0x9001790]
016a0 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
016aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ae e84d9ab418                     call       0x7f63f4730900
016b3 f4                             hlt        
016b4 bee4ffffff                     mov        esi, 0xffffffe4
016b9 488b2c24                       mov        rbp, qword ptr [rsp]
016bd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016c2 4489542408                     mov        dword ptr [rsp + 8], r10d
016c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016d1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016d6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016db 4489742434                     mov        dword ptr [rsp + 0x34], r14d
016e0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016e5 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
016ea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
016ef 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016f4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
016f9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
016fe 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01706 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0170b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01710 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01715 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0171a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0171f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01727 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0172c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01731 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01736 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0173a c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01743 90                             nop        
01744 c5f877                         vzeroupper 
01747 e81438b0ff                     call       0x7f63db6ea760
0174c 0f1f84004418000a               nop        dword ptr [rax + rax + 0xa001844]
01754 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0175e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01762 e89999b418                     call       0x7f63f4730900
01767 f4                             hlt        
01768 bee4ffffff                     mov        esi, 0xffffffe4
0176d 488b2c24                       mov        rbp, qword ptr [rsp]
01771 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01776 4489542408                     mov        dword ptr [rsp + 8], r10d
0177b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01780 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01785 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0178a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0178f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01794 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01799 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0179e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
017a3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017a8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017ad 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017b2 4489542458                     mov        dword ptr [rsp + 0x58], r10d
017b7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017bc 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017c1 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
017c6 90                             nop        
017c7 90                             nop        
017c8 c5f877                         vzeroupper 
017cb e89037b0ff                     call       0x7f63db6ea760
017d0 0f1f8400c818000b               nop        dword ptr [rax + rax + 0xb0018c8]
017d8 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
017e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017e6 e81599b418                     call       0x7f63f4730900
017eb f4                             hlt        
017ec be45ffffff                     mov        esi, 0xffffff45
017f1 488b2c24                       mov        rbp, qword ptr [rsp]
017f5 4c89442408                     mov        qword ptr [rsp + 8], r8
017fa 90                             nop        
017fb 90                             nop        
017fc c5f877                         vzeroupper 
017ff e85c37b0ff                     call       0x7f63db6ea760
01804 0f1f8400fc18000c               nop        dword ptr [rax + rax + 0xc0018fc]
0180c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01816 4883e4f0                       and        rsp, 0xfffffffffffffff0
0181a e8e198b418                     call       0x7f63f4730900
0181f f4                             hlt        
01820 be45ffffff                     mov        esi, 0xffffff45
01825 488b2c24                       mov        rbp, qword ptr [rsp]
01829 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0182e 4489542408                     mov        dword ptr [rsp + 8], r10d
01833 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01838 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0183d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01842 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01847 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0184b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01850 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01855 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0185a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0185f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01864 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01869 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0186e 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01872 90                             nop        
01873 90                             nop        
01874 c5f877                         vzeroupper 
01877 e8e436b0ff                     call       0x7f63db6ea760
0187c 0f1f84007419000d               nop        dword ptr [rax + rax + 0xd001974]
01884 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0188e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01892 e86998b418                     call       0x7f63f4730900
01897 f4                             hlt        
01898 493be8                         cmp        rbp, r8
0189b bdffffffff                     mov        ebp, 0xffffffff
018a0 7c08                           jl         0x7f63dbbe70aa
018a2 400f95c5                       setne      bpl
018a6 400fb6ed                       movzx      ebp, bpl
018aa be45ffffff                     mov        esi, 0xffffff45
018af 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018b4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018b9 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018bd 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
018c2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018c7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
018cc 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018d1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
018d6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018db 4489542444                     mov        dword ptr [rsp + 0x44], r10d
018e0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018e5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018ea 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018ef 4489542460                     mov        dword ptr [rsp + 0x60], r10d
018f4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018f9 4489542468                     mov        dword ptr [rsp + 0x68], r10d
018fe 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01903 90                             nop        
01904 c5f877                         vzeroupper 
01907 e85436b0ff                     call       0x7f63db6ea760
0190c 0f1f8400041a000e               nop        dword ptr [rax + rax + 0xe001a04]
01914 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0191e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01922 e8d997b418                     call       0x7f63f4730900
01927 f4                             hlt        
01928 be45ffffff                     mov        esi, 0xffffff45
0192d 488b2c24                       mov        rbp, qword ptr [rsp]
01931 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01936 44895c2408                     mov        dword ptr [rsp + 8], r11d
0193b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01940 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01945 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0194a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0194f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01953 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01958 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0195d 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01962 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01967 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0196c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01971 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01976 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0197b 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01980 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01985 90                             nop        
01986 90                             nop        
01987 90                             nop        
01988 c5f877                         vzeroupper 
0198b e8d035b0ff                     call       0x7f63db6ea760
01990 0f1f8400881a000f               nop        dword ptr [rax + rax + 0xf001a88]
01998 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
019a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019a6 e85597b418                     call       0x7f63f4730900
019ab f4                             hlt        
019ac be45ffffff                     mov        esi, 0xffffff45
019b1 488b2c24                       mov        rbp, qword ptr [rsp]
019b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019ba 44895c2408                     mov        dword ptr [rsp + 8], r11d
019bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019ce 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019d3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019d7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019dc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019e1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019e6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
019eb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019f0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019f5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
019fa 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
019ff 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a04 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01a0c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a11 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a16 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a1b 90                             nop        
01a1c c5f877                         vzeroupper 
01a1f e83c35b0ff                     call       0x7f63db6ea760
01a24 0f1f84001c1b0010               nop        dword ptr [rax + rax + 0x10001b1c]
01a2c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01a36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a3a e8c196b418                     call       0x7f63f4730900
01a3f f4                             hlt        
01a40 bee4ffffff                     mov        esi, 0xffffffe4
01a45 488b2c24                       mov        rbp, qword ptr [rsp]
01a49 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a4e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a53 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a58 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a5d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a62 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a67 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a6c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a71 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a76 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a7b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a80 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a85 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a8d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a92 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a97 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a9c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01aa1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01aa6 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01aae 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01ab3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ab8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01abd 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01ac5 90                             nop        
01ac6 90                             nop        
01ac7 90                             nop        
01ac8 c5f877                         vzeroupper 
01acb e89034b0ff                     call       0x7f63db6ea760
01ad0 0f1f8400c81b0011               nop        dword ptr [rax + rax + 0x11001bc8]
01ad8 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01ae2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ae6 e81596b418                     call       0x7f63f4730900
01aeb f4                             hlt        
01aec bee4ffffff                     mov        esi, 0xffffffe4
01af1 488b2c24                       mov        rbp, qword ptr [rsp]
01af5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01afa 44895c2408                     mov        dword ptr [rsp + 8], r11d
01aff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b09 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b0e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b13 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b18 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01b1d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b22 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b27 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b2c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b31 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01b39 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b3e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b43 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b48 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01b4d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01b52 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01b5a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01b5f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b64 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01b69 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01b6e 4889542478                     mov        qword ptr [rsp + 0x78], rdx
01b73 90                             nop        
01b74 c5f877                         vzeroupper 
01b77 e8e433b0ff                     call       0x7f63db6ea760
01b7c 0f1f8400741c0012               nop        dword ptr [rax + rax + 0x12001c74]
01b84 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01b8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b92 e86995b418                     call       0x7f63f4730900
01b97 f4                             hlt        
01b98 4533d2                         xor        r10d, r10d
01b9b 4c891424                       mov        qword ptr [rsp], r10
01b9f e98fe5ffff                     jmp        0x7f63dbbe5933
01ba4 4533d2                         xor        r10d, r10d
01ba7 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01baf e9afe5ffff                     jmp        0x7f63dbbe5963
01bb4 4533d2                         xor        r10d, r10d
01bb7 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01bbf e9cae5ffff                     jmp        0x7f63dbbe598e
01bc4 4533d2                         xor        r10d, r10d
01bc7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bcc e9eae5ffff                     jmp        0x7f63dbbe59bb
01bd1 4533d2                         xor        r10d, r10d
01bd4 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01bdc e905e6ffff                     jmp        0x7f63dbbe59e6
01be1 4533d2                         xor        r10d, r10d
01be4 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01bec e925e6ffff                     jmp        0x7f63dbbe5a16
01bf1 4183c108                       add        r9d, 8
01bf5 be6effffff                     mov        esi, 0xffffff6e
01bfa 488b2c24                       mov        rbp, qword ptr [rsp]
01bfe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c03 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c08 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c0d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c12 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c17 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c1c 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c20 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c25 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01c2a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01c2f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c34 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01c39 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01c3e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c43 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01c48 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01c4d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01c52 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c57 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01c5c 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01c64 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c69 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c6d 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01c72 90                             nop        
01c73 90                             nop        
01c74 c5f877                         vzeroupper 
01c77 e8e432b0ff                     call       0x7f63db6ea760
01c7c 0f1f8400741d0013               nop        dword ptr [rax + rax + 0x13001d74]
01c84 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01c8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c92 e86994b418                     call       0x7f63f4730900
01c97 f4                             hlt        
01c98 4183c108                       add        r9d, 8
01c9c be66ffffff                     mov        esi, 0xffffff66
01ca1 488b2c24                       mov        rbp, qword ptr [rsp]
01ca5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01caa 44895c2408                     mov        dword ptr [rsp + 8], r11d
01caf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cb4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cb9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cbe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cc3 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01cc7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ccc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01cd1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01cd6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cdb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ce0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ce5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cea 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01cef 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01cf4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01cf9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cfe 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d03 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
01d0b 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d10 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d14 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d19 90                             nop        
01d1a 90                             nop        
01d1b 90                             nop        
01d1c c5f877                         vzeroupper 
01d1f e83c32b0ff                     call       0x7f63db6ea760
01d24 0f1f84001c1e0014               nop        dword ptr [rax + rax + 0x14001e1c]
01d2c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01d36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d3a e8c193b418                     call       0x7f63f4730900
01d3f f4                             hlt        
01d40 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01d4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4e e8ad93b418                     call       0x7f63f4730900
01d53 f4                             hlt        
01d54 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d62 e89993b418                     call       0x7f63f4730900
01d67 f4                             hlt        
01d68 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d76 e88593b418                     call       0x7f63f4730900
01d7b f4                             hlt        
01d7c 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e87193b418                     call       0x7f63f4730900
01d8f f4                             hlt        
01d90 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01d9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d9e e85d93b418                     call       0x7f63f4730900
01da3 f4                             hlt        
01da4 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
01dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db2 e84993b418                     call       0x7f63f4730900
01db7 f4                             hlt        
01db8 beccffffff                     mov        esi, 0xffffffcc
01dbd 488b2c24                       mov        rbp, qword ptr [rsp]
01dc1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dc6 4489542408                     mov        dword ptr [rsp + 8], r10d
01dcb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dd0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dd5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dda 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ddf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01de4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01de9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01dee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01df3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01df8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01dfd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e02 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e07 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e0c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e11 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01e19 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01e1e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e23 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e28 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01e30 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01e35 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01e3d 90                             nop        
01e3e 90                             nop        
01e3f 90                             nop        
01e40 c5f877                         vzeroupper 
01e43 e81831b0ff                     call       0x7f63db6ea760
01e48 0f1f8400401f0015               nop        dword ptr [rax + rax + 0x15001f40]
01e50 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01e5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e5e e89d92b418                     call       0x7f63f4730900
01e63 f4                             hlt        
01e64 beccffffff                     mov        esi, 0xffffffcc
01e69 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
01e71 4c89542408                     mov        qword ptr [rsp + 8], r10
01e76 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e7b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e80 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e85 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e8a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e8f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e94 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01e99 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e9e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ea6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01eab 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01eb0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01eb5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01eba 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ebf 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01ec7 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ecc 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ed1 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01ed6 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01ede 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
01ee6 90                             nop        
01ee7 90                             nop        
01ee8 c5f877                         vzeroupper 
01eeb e87030b0ff                     call       0x7f63db6ea760
01ef0 0f1f8400e81f0016               nop        dword ptr [rax + rax + 0x16001fe8]
01ef8 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01f02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f06 e8f591b418                     call       0x7f63f4730900
01f0b f4                             hlt        
01f0c bee4ffffff                     mov        esi, 0xffffffe4
01f11 488b2c24                       mov        rbp, qword ptr [rsp]
01f15 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f1a 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f1f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f24 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f29 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f2e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f33 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f37 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f3c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01f41 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f46 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f4b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f50 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01f55 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f5a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f5f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f64 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f69 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01f6e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01f76 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01f7b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f80 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f85 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01f8c c5f877                         vzeroupper 
01f8f e8cc2fb0ff                     call       0x7f63db6ea760
01f94 0f1f84008c200017               nop        dword ptr [rax + rax + 0x1700208c]
01f9c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
01fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01faa e85191b418                     call       0x7f63f4730900
01faf f4                             hlt        
01fb0 be6effffff                     mov        esi, 0xffffff6e
01fb5 488b2c24                       mov        rbp, qword ptr [rsp]
01fb9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01fbe 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fc3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fc8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fcd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fd2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01fd7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01fdb 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01fe0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01fe5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01fea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01fef 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ff4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ff9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ffe 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02003 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02008 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0200d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02012 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02017 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0201c 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02021 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02025 90                             nop        
02026 90                             nop        
02027 90                             nop        
02028 c5f877                         vzeroupper 
0202b e8302fb0ff                     call       0x7f63db6ea760
02030 0f1f840028210018               nop        dword ptr [rax + rax + 0x18002128]
02038 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02042 4883e4f0                       and        rsp, 0xfffffffffffffff0
02046 e8b590b418                     call       0x7f63f4730900
0204b f4                             hlt        
0204c be45ffffff                     mov        esi, 0xffffff45
02051 488b2c24                       mov        rbp, qword ptr [rsp]
02055 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0205a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0205f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02064 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02069 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0206e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02073 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02077 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0207c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02081 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02086 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0208b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02090 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02095 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0209a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0209f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020a4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
020a9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
020ae 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020b3 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
020b8 89542478                       mov        dword ptr [rsp + 0x78], edx
020bc c5f877                         vzeroupper 
020bf e89c2eb0ff                     call       0x7f63db6ea760
020c4 0f1f8400bc210019               nop        dword ptr [rax + rax + 0x190021bc]
020cc 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
020d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020da e82190b418                     call       0x7f63f4730900
020df f4                             hlt        
020e0 be3dffffff                     mov        esi, 0xffffff3d
020e5 488b2c24                       mov        rbp, qword ptr [rsp]
020e9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020ee 4489542408                     mov        dword ptr [rsp + 8], r10d
020f3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02102 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02107 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0210b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02110 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02115 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0211a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0211f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02124 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02129 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0212e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02133 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02138 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0213d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02142 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02147 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0214c 89542478                       mov        dword ptr [rsp + 0x78], edx
02150 c5f877                         vzeroupper 
02153 e8082eb0ff                     call       0x7f63db6ea760
02158 0f1f84005022001a               nop        dword ptr [rax + rax + 0x1a002250]
02160 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0216a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0216e e88d8fb418                     call       0x7f63f4730900
02173 f4                             hlt        
02174 bee4ffffff                     mov        esi, 0xffffffe4
02179 488b2c24                       mov        rbp, qword ptr [rsp]
0217d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02182 44895c2408                     mov        dword ptr [rsp + 8], r11d
02187 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0218c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02191 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02196 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0219b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
021a0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
021a5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021aa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021af 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
021b4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
021b9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
021c1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
021c6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021cb 4c89542450                     mov        qword ptr [rsp + 0x50], r10
021d0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
021d5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021da 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
021e2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
021e7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021ec 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021f1 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
021f9 90                             nop        
021fa 90                             nop        
021fb 90                             nop        
021fc c5f877                         vzeroupper 
021ff e85c2db0ff                     call       0x7f63db6ea760
02204 0f1f8400fc22001b               nop        dword ptr [rax + rax + 0x1b0022fc]
0220c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02216 4883e4f0                       and        rsp, 0xfffffffffffffff0
0221a e8e18eb418                     call       0x7f63f4730900
0221f f4                             hlt        
02220 bee4ffffff                     mov        esi, 0xffffffe4
02225 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0222a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0222f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02234 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02239 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0223e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02243 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02248 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0224d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02255 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0225a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0225f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02264 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02269 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0226e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02276 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0227b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02280 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02285 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0228a 90                             nop        
0228b 90                             nop        
0228c c5f877                         vzeroupper 
0228f e8cc2cb0ff                     call       0x7f63db6ea760
02294 0f1f84008c23001c               nop        dword ptr [rax + rax + 0x1c00238c]
0229c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
022a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022aa e8518eb418                     call       0x7f63f4730900
022af f4                             hlt        
022b0 418d6901                       lea        ebp, [r9 + 1]
022b4 bee4ffffff                     mov        esi, 0xffffffe4
022b9 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
022c1 4c89542408                     mov        qword ptr [rsp + 8], r10
022c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022cb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
022d0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022d5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
022da 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022df 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022e4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022e9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
022ee 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
022f6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
022fb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02300 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02305 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0230a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0230f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02317 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0231c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02321 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02326 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0232b 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
02333 90                             nop        
02334 c5f877                         vzeroupper 
02337 e8242cb0ff                     call       0x7f63db6ea760
0233c 0f1f84003424001d               nop        dword ptr [rax + rax + 0x1d002434]
02344 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0234e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02352 e8a98db418                     call       0x7f63f4730900
02357 f4                             hlt        
02358 bee4ffffff                     mov        esi, 0xffffffe4
0235d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02362 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02367 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0236c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02371 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02376 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0237b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02380 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02385 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0238d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02392 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02397 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0239c 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
023a1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
023a6 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
023ae 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
023b3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023b8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
023bd 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
023c2 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
023ca 90                             nop        
023cb 90                             nop        
023cc c5f877                         vzeroupper 
023cf e88c2bb0ff                     call       0x7f63db6ea760
023d4 0f1f8400cc24001e               nop        dword ptr [rax + rax + 0x1e0024cc]
023dc 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
023e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023ea e8118db418                     call       0x7f63f4730900
023ef f4                             hlt        
023f0 bee4ffffff                     mov        esi, 0xffffffe4
023f5 488b2c24                       mov        rbp, qword ptr [rsp]
023f9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023fe 4489542408                     mov        dword ptr [rsp + 8], r10d
02403 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02408 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0240d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02412 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02417 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0241c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02421 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02426 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0242b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02430 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02435 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0243a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0243f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02444 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02449 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0244e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02453 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02458 c5f877                         vzeroupper 
0245b e8002bb0ff                     call       0x7f63db6ea760
02460 0f1f84005825001f               nop        dword ptr [rax + rax + 0x1f002558]
02468 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02472 4883e4f0                       and        rsp, 0xfffffffffffffff0
02476 e8858cb418                     call       0x7f63f4730900
0247b f4                             hlt        
0247c beccffffff                     mov        esi, 0xffffffcc
02481 488b2c24                       mov        rbp, qword ptr [rsp]
02485 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0248a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0248f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02494 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02499 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0249e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024a3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
024a8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024ad 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
024b2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024b7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
024bc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
024c1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
024c9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
024ce 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
024d3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
024d8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
024dd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
024e2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
024ea 4489542458                     mov        dword ptr [rsp + 0x58], r10d
024ef 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024f4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
024f9 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024fe 90                             nop        
024ff 90                             nop        
02500 c5f877                         vzeroupper 
02503 e8582ab0ff                     call       0x7f63db6ea760
02508 0f1f840000260020               nop        dword ptr [rax + rax + 0x20002600]
02510 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0251a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0251e e8dd8bb418                     call       0x7f63f4730900
02523 f4                             hlt        
02524 be45ffffff                     mov        esi, 0xffffff45
02529 488b2c24                       mov        rbp, qword ptr [rsp]
0252d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02532 44895c2408                     mov        dword ptr [rsp + 8], r11d
02537 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0253c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02541 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02546 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0254b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02550 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02555 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0255a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0255f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02564 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02569 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0256e 90                             nop        
0256f 90                             nop        
02570 c5f877                         vzeroupper 
02573 e8e829b0ff                     call       0x7f63db6ea760
02578 0f1f840070260021               nop        dword ptr [rax + rax + 0x21002670]
02580 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0258a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0258e e86d8bb418                     call       0x7f63f4730900
02593 f4                             hlt        
02594 bebeffffff                     mov        esi, 0xffffffbe
02599 488b2c24                       mov        rbp, qword ptr [rsp]
0259d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025a2 44895c2408                     mov        dword ptr [rsp + 8], r11d
025a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025b1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025b6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025bb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
025bf 4489742434                     mov        dword ptr [rsp + 0x34], r14d
025c4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
025c9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
025ce 90                             nop        
025cf 90                             nop        
025d0 c5f877                         vzeroupper 
025d3 e88829b0ff                     call       0x7f63db6ea760
025d8 0f1f8400d0260022               nop        dword ptr [rax + rax + 0x220026d0]
025e0 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
025ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ee e80d8bb418                     call       0x7f63f4730900
025f3 f4                             hlt        
025f4 be85ffffff                     mov        esi, 0xffffff85
025f9 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
025fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02602 44891c24                       mov        dword ptr [rsp], r11d
02606 895c2404                       mov        dword ptr [rsp + 4], ebx
0260a 4489742408                     mov        dword ptr [rsp + 8], r14d
0260f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02614 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02619 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0261e 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02623 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
02628 c5f877                         vzeroupper 
0262b e83029b0ff                     call       0x7f63db6ea760
02630 0f1f840028270023               nop        dword ptr [rax + rax + 0x23002728]
02638 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02642 4883e4f0                       and        rsp, 0xfffffffffffffff0
02646 e8b58ab418                     call       0x7f63f4730900
0264b f4                             hlt        
0264c beccffffff                     mov        esi, 0xffffffcc
02651 488b2c24                       mov        rbp, qword ptr [rsp]
02655 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0265a 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0265e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02663 90                             nop        
02664 c5f877                         vzeroupper 
02667 e8f428b0ff                     call       0x7f63db6ea760
0266c 0f1f840064270024               nop        dword ptr [rax + rax + 0x24002764]
02674 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0267e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02682 e8798ab418                     call       0x7f63f4730900
02687 f4                             hlt        
02688 bee4ffffff                     mov        esi, 0xffffffe4
0268d 488b2c24                       mov        rbp, qword ptr [rsp]
02691 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02696 44895c2408                     mov        dword ptr [rsp + 8], r11d
0269b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026a0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026a5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
026aa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
026af 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
026b4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
026b9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026be 4c89542438                     mov        qword ptr [rsp + 0x38], r10
026c3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
026c8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
026cd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
026d2 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026d7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
026dc 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
026e1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
026e9 4489542458                     mov        dword ptr [rsp + 0x58], r10d
026ee 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026f3 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
026f8 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
02700 c5f877                         vzeroupper 
02703 e85828b0ff                     call       0x7f63db6ea760
02708 0f1f840000280025               nop        dword ptr [rax + rax + 0x25002800]
02710 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0271a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0271e e8dd89b418                     call       0x7f63f4730900
02723 f4                             hlt        
02724 bee4ffffff                     mov        esi, 0xffffffe4
02729 488b2c24                       mov        rbp, qword ptr [rsp]
0272d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02732 4489542408                     mov        dword ptr [rsp + 8], r10d
02737 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0273c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02741 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02746 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0274b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02750 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02755 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0275a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0275f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02764 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02769 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0276e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02773 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02778 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0277d 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02785 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0278a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0278f 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02794 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02799 48898c2480000000               mov        qword ptr [rsp + 0x80], rcx
027a1 90                             nop        
027a2 90                             nop        
027a3 90                             nop        
027a4 c5f877                         vzeroupper 
027a7 e8b427b0ff                     call       0x7f63db6ea760
027ac 0f1f8400a4280026               nop        dword ptr [rax + rax + 0x260028a4]
027b4 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
027be 4883e4f0                       and        rsp, 0xfffffffffffffff0
027c2 e83989b418                     call       0x7f63f4730900
027c7 f4                             hlt        
027c8 4183c108                       add        r9d, 8
027cc be6effffff                     mov        esi, 0xffffff6e
027d1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027d6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
027db 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
027e0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027e5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
027ea 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027ef 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
027f4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
027f9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027fe 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02803 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0280b 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02810 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02815 90                             nop        
02816 90                             nop        
02817 90                             nop        
02818 c5f877                         vzeroupper 
0281b e84027b0ff                     call       0x7f63db6ea760
02820 0f1f840018290027               nop        dword ptr [rax + rax + 0x27002918]
02828 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02832 4883e4f0                       and        rsp, 0xfffffffffffffff0
02836 e8c588b418                     call       0x7f63f4730900
0283b f4                             hlt        
0283c 4183c108                       add        r9d, 8
02840 beb6ffffff                     mov        esi, 0xffffffb6
02845 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0284a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0284f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02854 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02859 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0285e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02863 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02868 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0286d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02872 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02877 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0287f 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02884 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02889 90                             nop        
0288a 90                             nop        
0288b 90                             nop        
0288c c5f877                         vzeroupper 
0288f e8cc26b0ff                     call       0x7f63db6ea760
02894 0f1f84008c290028               nop        dword ptr [rax + rax + 0x2800298c]
0289c 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
028a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028aa e85188b418                     call       0x7f63f4730900
028af f4                             hlt        
028b0 4183c108                       add        r9d, 8
028b4 be66ffffff                     mov        esi, 0xffffff66
028b9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
028be 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
028c3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
028c8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
028cd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
028d2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
028d7 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
028dc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
028e1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028e6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
028eb 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
028f3 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
028f8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
028fd 90                             nop        
028fe 90                             nop        
028ff 90                             nop        
02900 c5f877                         vzeroupper 
02903 e85826b0ff                     call       0x7f63db6ea760
02908 0f1f8400002a0029               nop        dword ptr [rax + rax + 0x29002a00]
02910 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
0291a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0291e e8dd87b418                     call       0x7f63f4730900
02923 f4                             hlt        
02924 8bf3                           mov        esi, ebx
02926 e9f6e9ffff                     jmp        0x7f63dbbe6b21
0292b 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02935 4883e4f0                       and        rsp, 0xfffffffffffffff0
02939 e8c287b418                     call       0x7f63f4730900
0293e f4                             hlt        
0293f 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02949 4883e4f0                       and        rsp, 0xfffffffffffffff0
0294d e8ae87b418                     call       0x7f63f4730900
02952 f4                             hlt        
02953 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
0295d 4883e4f0                       and        rsp, 0xfffffffffffffff0
02961 e89a87b418                     call       0x7f63f4730900
02966 f4                             hlt        
02967 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02971 4883e4f0                       and        rsp, 0xfffffffffffffff0
02975 e88687b418                     call       0x7f63f4730900
0297a f4                             hlt        
0297b bee4ffffff                     mov        esi, 0xffffffe4
02980 488b2c24                       mov        rbp, qword ptr [rsp]
02984 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02989 4489542408                     mov        dword ptr [rsp + 8], r10d
0298e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02993 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02998 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0299d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
029a2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
029a7 4489542434                     mov        dword ptr [rsp + 0x34], r10d
029ac 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
029b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029b6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
029bb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029c0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029c5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
029ca 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
029cf 4489542444                     mov        dword ptr [rsp + 0x44], r10d
029d4 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
029dc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
029e1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029e6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029eb 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
029f0 895c2470                       mov        dword ptr [rsp + 0x70], ebx
029f4 4489742474                     mov        dword ptr [rsp + 0x74], r14d
029f9 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02a01 90                             nop        
02a02 90                             nop        
02a03 90                             nop        
02a04 c5f877                         vzeroupper 
02a07 e85425b0ff                     call       0x7f63db6ea760
02a0c 0f1f8400042b002a               nop        dword ptr [rax + rax + 0x2a002b04]
02a14 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02a1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a22 e8d986b418                     call       0x7f63f4730900
02a27 f4                             hlt        
02a28 bee4ffffff                     mov        esi, 0xffffffe4
02a2d 488b2c24                       mov        rbp, qword ptr [rsp]
02a31 4c891424                       mov        qword ptr [rsp], r10
02a35 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02a3a 44895c2408                     mov        dword ptr [rsp + 8], r11d
02a3f 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
02a47 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a56 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a5b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a60 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02a65 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02a6a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02a6f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a74 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02a79 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a7e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a83 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02a88 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02a8d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02a92 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02a9a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02a9f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02aa4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02aa9 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02aae 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02ab3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02aba c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02ac3 90                             nop        
02ac4 c5f877                         vzeroupper 
02ac7 e89424b0ff                     call       0x7f63db6ea760
02acc 0f1f8400c42b002b               nop        dword ptr [rax + rax + 0x2b002bc4]
02ad4 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e81986b418                     call       0x7f63f4730900
02ae7 f4                             hlt        
02ae8 beccffffff                     mov        esi, 0xffffffcc
02aed 488b2c24                       mov        rbp, qword ptr [rsp]
02af1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02af6 4489542408                     mov        dword ptr [rsp + 8], r10d
02afb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b00 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b05 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02b0a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02b0f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b14 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02b19 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b1e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b23 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02b28 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02b2d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02b35 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02b3a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b3f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02b44 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02b49 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02b4e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02b56 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02b5b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02b60 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02b65 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02b6a 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02b6e 90                             nop        
02b6f 90                             nop        
02b70 c5f877                         vzeroupper 
02b73 e8e823b0ff                     call       0x7f63db6ea760
02b78 0f1f8400702c002c               nop        dword ptr [rax + rax + 0x2c002c70]
02b80 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8e e86d85b418                     call       0x7f63f4730900
02b93 f4                             hlt        
02b94 418bee                         mov        ebp, r14d
02b97 83c510                         add        ebp, 0x10
02b9a be6effffff                     mov        esi, 0xffffff6e
02b9f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ba4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02ba9 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02bae 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02bb3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02bb8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02bbd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02bc2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02bc7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02bcc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bd1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02bd6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02bdb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02be0 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02be8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02bed 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02bf2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02bf7 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02bfc 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02c03 90                             nop        
02c04 c5f877                         vzeroupper 
02c07 e85423b0ff                     call       0x7f63db6ea760
02c0c 0f1f8400042d002d               nop        dword ptr [rax + rax + 0x2d002d04]
02c14 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02c1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c22 e8d984b418                     call       0x7f63f4730900
02c27 f4                             hlt        
02c28 418bee                         mov        ebp, r14d
02c2b 83c510                         add        ebp, 0x10
02c2e be66ffffff                     mov        esi, 0xffffff66
02c33 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02c38 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02c3d 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02c42 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02c47 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02c4c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02c51 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02c56 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02c5b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02c60 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02c65 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02c6a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02c6f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02c74 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02c7c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02c81 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02c86 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02c8b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02c90 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02c97 90                             nop        
02c98 c5f877                         vzeroupper 
02c9b e8c022b0ff                     call       0x7f63db6ea760
02ca0 0f1f8400982d002e               nop        dword ptr [rax + rax + 0x2e002d98]
02ca8 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02cb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cb6 e84584b418                     call       0x7f63f4730900
02cbb f4                             hlt        
02cbc 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02cc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cca e83184b418                     call       0x7f63f4730900
02ccf f4                             hlt        
02cd0 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02cda 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cde e81d84b418                     call       0x7f63f4730900
02ce3 f4                             hlt        
02ce4 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02cee 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cf2 e80984b418                     call       0x7f63f4730900
02cf7 f4                             hlt        
02cf8 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d06 e8f583b418                     call       0x7f63f4730900
02d0b f4                             hlt        
02d0c 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d1a e8e183b418                     call       0x7f63f4730900
02d1f f4                             hlt        
02d20 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d2e e8cd83b418                     call       0x7f63f4730900
02d33 f4                             hlt        
02d34 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d42 e8b983b418                     call       0x7f63f4730900
02d47 f4                             hlt        
02d48 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d56 e8a583b418                     call       0x7f63f4730900
02d5b f4                             hlt        
02d5c 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d66 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d6a e89183b418                     call       0x7f63f4730900
02d6f f4                             hlt        
02d70 48bfe01721b4637f0000           movabs     rdi, 0x7f63b42117e0
02d7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d7e e87d83b418                     call       0x7f63f4730900
02d83 f4                             hlt        
02d84 488bf0                         mov        rsi, rax
02d87 eb0d                           jmp        0x7f63dbbe8596
02d89 488bf0                         mov        rsi, rax
02d8c eb08                           jmp        0x7f63dbbe8596
02d8e 488bf0                         mov        rsi, rax
02d91 eb03                           jmp        0x7f63dbbe8596
02d93 488bf0                         mov        rsi, rax
02d96 c5f877                         vzeroupper 
02d99 4881c4f0000000                 add        rsp, 0xf0
02da0 5d                             pop        rbp
02da1 e9baa9afff                     jmp        0x7f63db6e2f60
02da6 bef6ffffff                     mov        esi, 0xfffffff6
02dab 90                             nop        
02dac c5f877                         vzeroupper 
02daf e8ac21b0ff                     call       0x7f63db6ea760
02db4 0f1f8400ac2e002f               nop        dword ptr [rax + rax + 0x2f002eac]
02dbc 48bfa0c520b4637f0000           movabs     rdi, 0x7f63b420c5a0
02dc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dca e83183b418                     call       0x7f63f4730900
02dcf f4                             hlt        
02dd0 49ba1c66bedb637f0000           movabs     r10, 0x7f63dbbe661c
02dda 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02de1 e97addb5ff                     jmp        0x7f63db746360
02de6 e8f5abb4ff                     call       0x7f63db7331e0
02deb e93ed2ffff                     jmp        0x7f63dbbe582e
