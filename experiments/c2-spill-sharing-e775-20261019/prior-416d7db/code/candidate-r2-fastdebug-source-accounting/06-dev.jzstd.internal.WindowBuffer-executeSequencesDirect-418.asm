00000 e8cbf4d618                     call       0x7f63f495ad50
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
00028 0f85802f0000                   jne        0x7f63dbbee82e
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
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
00092 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
00099 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
000a0 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000ac 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b3 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000b8 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000bf 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000c4 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cb 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000d0 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d4 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000d9 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000dd 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000e5 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000ec 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000f4 488bfe                         mov        rdi, rsi
000f7 c5f877                         vzeroupper 
000fa 49ba3083b1f4637f0000           movabs     r10, 0x7f63f4b18330
00104 41ffd2                         call       r10
00107 0f1f840000000000               nop        dword ptr [rax + rax]
0010f 4885db                         test       rbx, rbx
00112 0f84a81a0000                   je         0x7f63dbbed440
00118 448b5304                       mov        r10d, dword ptr [rbx + 4]
0011c 41c1ea0a                       shr        r10d, 0xa
00120 4181fa2c080000                 cmp        r10d, 0x82c
00127 0f8557260000                   jne        0x7f63dbbee004
0012d 4c8bd3                         mov        r10, rbx
00130 4c891424                       mov        qword ptr [rsp], r10
00134 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00139 4d85d2                         test       r10, r10
0013c 0f848a1a0000                   je         0x7f63dbbed44c
00142 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00146 41c1eb0a                       shr        r11d, 0xa
0014a 4181fb0a020000                 cmp        r11d, 0x20a
00151 0f852d260000                   jne        0x7f63dbbee004
00157 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0015f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00164 4d85d2                         test       r10, r10
00167 0f846f1a0000                   je         0x7f63dbbed45c
0016d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00171 41c1ea0a                       shr        r10d, 0xa
00175 4181fa10020000                 cmp        r10d, 0x210
0017c 0f8502260000                   jne        0x7f63dbbee004
00182 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00187 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00194 4d85d2                         test       r10, r10
00197 0f844f1a0000                   je         0x7f63dbbed46c
0019d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a1 41c1eb0a                       shr        r11d, 0xa
001a5 4181fb0e020000                 cmp        r11d, 0x20e
001ac 0f85d2250000                   jne        0x7f63dbbee004
001b2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bc 4d85d2                         test       r10, r10
001bf 0f84341a0000                   je         0x7f63dbbed479
001c5 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c9 41c1ea0a                       shr        r10d, 0xa
001cd 4181fa0e020000                 cmp        r10d, 0x20e
001d4 0f85aa250000                   jne        0x7f63dbbee004
001da 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001df 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001ec 4d85d2                         test       r10, r10
001ef 0f84141a0000                   je         0x7f63dbbed489
001f5 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f9 41c1eb0a                       shr        r11d, 0xa
001fd 4181fb0a020000                 cmp        r11d, 0x20a
00204 0f857a250000                   jne        0x7f63dbbee004
0020a 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00212 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0021a 458b5208                       mov        r10d, dword ptr [r10 + 8]
0021e 4489542408                     mov        dword ptr [rsp + 8], r10d
00223 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00228 4585db                         test       r11d, r11d
0022b 0f84f3240000                   je         0x7f63dbbedfa4
00231 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00239 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0023d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00242 4585db                         test       r11d, r11d
00245 0f86d9240000                   jbe        0x7f63dbbedfa4
0024b 4183fb01                       cmp        r11d, 1
0024f 0f86cf240000                   jbe        0x7f63dbbedfa4
00255 4183fb02                       cmp        r11d, 2
00259 0f86c5240000                   jbe        0x7f63dbbedfa4
0025f 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00267 458b5208                       mov        r10d, dword ptr [r10 + 8]
0026b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00270 4183c2f1                       add        r10d, -0xf
00274 4585d2                         test       r10d, r10d
00277 0f8ca7240000                   jl         0x7f63dbbedfa4
0027d 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00285 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00289 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0028e 4183c3f1                       add        r11d, -0xf
00292 4585db                         test       r11d, r11d
00295 0f8c89240000                   jl         0x7f63dbbedfa4
0029b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a0 4183c2f9                       add        r10d, -7
002a4 4585d2                         test       r10d, r10d
002a7 0f8c77240000                   jl         0x7f63dbbedfa4
002ad 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002b2 458d53f9                       lea        r10d, [r11 - 7]
002b6 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002be 4d63d3                         movsxd     r10, r11d
002c1 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002c6 4183c3f1                       add        r11d, -0xf
002ca 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002d2 4983c2f9                       add        r10, -7
002d6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002db 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002e0 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002e5 458d53f1                       lea        r10d, [r11 - 0xf]
002e9 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
002f1 e92b040000                     jmp        0x7f63dbbebfa1
002f6 448bd5                         mov        r10d, ebp
002f9 4d63d2                         movsxd     r10, r10d
002fc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00303 c442a8f5db                     bzhi       r11, r11, r10
00308 c4c1fb92fb                     kmovq      k7, r11
0030d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00313 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00319 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00321 4403dd                         add        r11d, ebp
00324 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0032c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00330 418502                         test       dword ptr [r10], eax
00333 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
0033b 0f8d370a0000                   jge        0x7f63dbbec5f8
00341 458bf5                         mov        r14d, r13d
00344 458bce                         mov        r9d, r14d
00347 442b8c24b8000000               sub        r9d, dword ptr [rsp + 0xb8]
0034f 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00356 2bac24b8000000                 sub        ebp, dword ptr [rsp + 0xb8]
0035d 3bac24b8000000                 cmp        ebp, dword ptr [rsp + 0xb8]
00364 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0036c 410f4fea                       cmovg      ebp, r10d
00370 4585c9                         test       r9d, r9d
00373 0f8c131b0000                   jl         0x7f63dbbed70c
00379 4585f6                         test       r14d, r14d
0037c 0f8c0a1b0000                   jl         0x7f63dbbed70c
00382 458d1429                       lea        r10d, [r9 + rbp]
00386 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0038b 453bc2                         cmp        r8d, r10d
0038e 0f82f81a0000                   jb         0x7f63dbbed70c
00394 458d2c2e                       lea        r13d, [r14 + rbp]
00398 453bc5                         cmp        r8d, r13d
0039b 0f82eb1a0000                   jb         0x7f63dbbed70c
003a1 85ed                           test       ebp, ebp
003a3 0f8ce31a0000                   jl         0x7f63dbbed70c
003a9 85ed                           test       ebp, ebp
003ab 0f8468ffffff                   je         0x7f63dbbebb99
003b1 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
003b9 4b8d74320c                     lea        rsi, [r10 + r14 + 0xc]
003be 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
003c3 4863d5                         movsxd     rdx, ebp
003c6 4883fa20                       cmp        rdx, 0x20
003ca 0f8626ffffff                   jbe        0x7f63dbbebb76
003d0 c5f877                         vzeroupper 
003d3 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
003dd 41ffd2                         call       r10
003e0 0f1f840000000000               nop        dword ptr [rax + rax]
003e8 e92cffffff                     jmp        0x7f63dbbebb99
003ed 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003f5 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
003fc 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
00404 4503ea                         add        r13d, r10d
00407 e9f9020000                     jmp        0x7f63dbbebf85
0040c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00414 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0041c 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
00421 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00426 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0042e 44039424b0000000               add        r10d, dword ptr [rsp + 0xb0]
00436 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0043e 4963ca                         movsxd     rcx, r10d
00441 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00449 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
00451 0f8ca6060000                   jl         0x7f63dbbec37d
00457 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0045f 4183fa30                       cmp        r10d, 0x30
00463 0f8e96000000                   jle        0x7f63dbbebd7f
00469 4585c0                         test       r8d, r8d
0046c 0f8c6e190000                   jl         0x7f63dbbed660
00472 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0047a 4585db                         test       r11d, r11d
0047d 0f8c5d190000                   jl         0x7f63dbbed660
00483 478d1c02                       lea        r11d, [r10 + r8]
00487 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0048c 453bcb                         cmp        r9d, r11d
0048f 0f824b190000                   jb         0x7f63dbbed660
00495 443b8c24c0000000               cmp        r9d, dword ptr [rsp + 0xc0]
0049d 0f823d190000                   jb         0x7f63dbbed660
004a3 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
004ab 4585db                         test       r11d, r11d
004ae 0f8441020000                   je         0x7f63dbbebf75
004b4 4963d3                         movsxd     rdx, r11d
004b7 4883fa20                       cmp        rdx, 0x20
004bb 7725                           ja         0x7f63dbbebd62
004bd 4d63d3                         movsxd     r10, r11d
004c0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004c7 c442a8f5db                     bzhi       r11, r11, r10
004cc c4c1fb92fb                     kmovq      k7, r11
004d1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004d7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004dd e913020000                     jmp        0x7f63dbbebf75
004e2 c5f877                         vzeroupper 
004e5 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
004ef 41ffd2                         call       r10
004f2 0f1f840000000000               nop        dword ptr [rax + rax]
004fa e9f6010000                     jmp        0x7f63dbbebf75
004ff 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
00507 0f835b150000                   jae        0x7f63dbbed2e8
0050d 4963f8                         movsxd     rdi, r8d
00510 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00518 498b543a0c                     mov        rdx, qword ptr [r10 + rdi + 0xc]
0051d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00525 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
0052d 0f83e1150000                   jae        0x7f63dbbed394
00533 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
0053b 418d5908                       lea        ebx, [r9 + 8]
0053f 4d63d1                         movsxd     r10, r9d
00542 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0054a 4b8954130c                     mov        qword ptr [r11 + r10 + 0xc], rdx
0054f 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00556 0f8d99010000                   jge        0x7f63dbbebf75
0055c 492bfa                         sub        rdi, r10
0055f 4c63db                         movsxd     r11, ebx
00562 4d8d143b                       lea        r10, [r11 + rdi]
00566 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0056b 0f83a8160000                   jae        0x7f63dbbed499
00571 4c8bd1                         mov        r10, rcx
00574 4d2bd3                         sub        r10, r11
00577 4983c207                       add        r10, 7
0057b 4983e2f8                       and        r10, 0xfffffffffffffff8
0057f 458bd2                         mov        r10d, r10d
00582 478d5c0a08                     lea        r11d, [r10 + r9 + 8]
00587 4d63d3                         movsxd     r10, r11d
0058a 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
0058f 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00594 0f837f160000                   jae        0x7f63dbbed499
0059a 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005a1 0f8372160000                   jae        0x7f63dbbed499
005a7 4983c2f8                       add        r10, -8
005ab 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005b0 0f8363160000                   jae        0x7f63dbbed499
005b6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005be 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005c5 0f8ff5160000                   jg         0x7f63dbbed540
005cb 452bc1                         sub        r8d, r9d
005ce 4183c110                       add        r9d, 0x10
005d2 458d1418                       lea        r10d, [r8 + rbx]
005d6 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
005de 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
005e3 448bdb                         mov        r11d, ebx
005e6 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
005ee 4e89541a0c                     mov        qword ptr [rdx + r11 + 0xc], r10
005f3 8d5308                         lea        edx, [rbx + 8]
005f6 413bd1                         cmp        edx, r9d
005f9 7d04                           jge        0x7f63dbbebe7f
005fb 8bda                           mov        ebx, edx
005fd ebd3                           jmp        0x7f63dbbebe52
005ff 4883c1f8                       add        rcx, -8
00603 4881f900000080                 cmp        rcx, -0x80000000
0060a 49c7c200000080                 mov        r10, 0xffffffff80000000
00611 490f4cca                       cmovl      rcx, r10
00615 448bd1                         mov        r10d, ecx
00618 413bd2                         cmp        edx, r10d
0061b 0f8d7e000000                   jge        0x7f63dbbebf1f
00621 4c63da                         movsxd     r11, edx
00624 4c03df                         add        r11, rdi
00627 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0062c 0f8336170000                   jae        0x7f63dbbed5e8
00632 83c310                         add        ebx, 0x10
00635 4c63db                         movsxd     r11, ebx
00638 4c03df                         add        r11, rdi
0063b 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00640 0f8336170000                   jae        0x7f63dbbed5fc
00646 3b9424a8000000                 cmp        edx, dword ptr [rsp + 0xa8]
0064d 0f833d170000                   jae        0x7f63dbbed610
00653 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
0065a 0f8344170000                   jae        0x7f63dbbed624
00660 458d0c10                       lea        r9d, [r8 + rdx]
00664 448bda                         mov        r11d, edx
00667 4963cb                         movsxd     rcx, r11d
0066a 458bd9                         mov        r11d, r9d
0066d 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00675 4a8b5c1b0c                     mov        rbx, qword ptr [rbx + r11 + 0xc]
0067a 4d63c9                         movsxd     r9, r9d
0067d 448bda                         mov        r11d, edx
00680 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00688 4a895c1e0c                     mov        qword ptr [rsi + r11 + 0xc], rbx
0068d 4e8b5c0e14                     mov        r11, qword ptr [rsi + r9 + 0x14]
00692 4c895c0e14                     mov        qword ptr [rsi + rcx + 0x14], r11
00697 83c210                         add        edx, 0x10
0069a 413bd2                         cmp        edx, r10d
0069d 7cc1                           jl         0x7f63dbbebee0
0069f 3b9424c0000000                 cmp        edx, dword ptr [rsp + 0xc0]
006a6 7d4d                           jge        0x7f63dbbebf75
006a8 4c63d2                         movsxd     r10, edx
006ab 4c03d7                         add        r10, rdi
006ae 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
006b3 0f83ff160000                   jae        0x7f63dbbed638
006b9 3b9424a8000000                 cmp        edx, dword ptr [rsp + 0xa8]
006c0 0f8306170000                   jae        0x7f63dbbed64c
006c6 90                             nop        
006c7 90                             nop        
006c8 458d1c10                       lea        r11d, [r8 + rdx]
006cc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006d4 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
006d9 448bd2                         mov        r10d, edx
006dc 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
006e4 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
006e9 83c208                         add        edx, 8
006ec 3b9424c0000000                 cmp        edx, dword ptr [rsp + 0xc0]
006f3 7cd3                           jl         0x7f63dbbebf48
006f5 448bac24b0000000               mov        r13d, dword ptr [rsp + 0xb0]
006fd 4403ac24b4000000               add        r13d, dword ptr [rsp + 0xb4]
00705 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0070a 41ffc3                         inc        r11d
0070d 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00712 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00716 418502                         test       dword ptr [r10], eax
00719 448bb424bc000000               mov        r14d, dword ptr [rsp + 0xbc]
00721 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00729 4b8d742a0c                     lea        rsi, [r10 + r13 + 0xc]
0072e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00733 452bde                         sub        r11d, r14d
00736 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0073e 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
00743 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00748 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0074d 0f8d54060000                   jge        0x7f63dbbec627
00753 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00758 0f83670e0000                   jae        0x7f63dbbece45
0075e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00766 4f8b4cc210                     mov        r9, qword ptr [r10 + r8*8 + 0x10]
0076b 458bd1                         mov        r10d, r9d
0076e 4181e2ffff0100                 and        r10d, 0x1ffff
00775 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0077d 4d8bd1                         mov        r10, r9
00780 49c1ea12                       shr        r10, 0x12
00784 49c1f924                       sar        r9, 0x24
00788 458bc2                         mov        r8d, r10d
0078b 458bd1                         mov        r10d, r9d
0078e 418bda                         mov        ebx, r10d
00791 4181e0ffff0300                 and        r8d, 0x3ffff
00798 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
007a0 4585d2                         test       r10d, r10d
007a3 0f8c9f100000                   jl         0x7f63dbbed0c8
007a9 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
007b1 4585d2                         test       r10d, r10d
007b4 0f855a020000                   jne        0x7f63dbbec294
007ba 4533d2                         xor        r10d, r10d
007bd 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
007c5 448bd3                         mov        r10d, ebx
007c8 4183fa03                       cmp        r10d, 3
007cc 0f8e7e020000                   jle        0x7f63dbbec2d0
007d2 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
007da 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
007de 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
007e6 45895314                       mov        dword ptr [r11 + 0x14], r10d
007ea 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
007ee 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
007f6 45895a10                       mov        dword ptr [r10 + 0x10], r11d
007fa 448d53fd                       lea        r10d, [rbx - 3]
007fe 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00806 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
0080e 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00812 48639c24b8000000               movsxd     rbx, dword ptr [rsp + 0xb8]
0081a 48895c2440                     mov        qword ptr [rsp + 0x40], rbx
0081f 4d63c5                         movsxd     r8, r13d
00822 4c03442468                     add        r8, qword ptr [rsp + 0x68]
00827 48639424b0000000               movsxd     rdx, dword ptr [rsp + 0xb0]
0082f 4c03c2                         add        r8, rdx
00832 493bd8                         cmp        rbx, r8
00835 0f8f85100000                   jg         0x7f63dbbed140
0083b 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00843 4585db                         test       r11d, r11d
00846 0f8ec80f0000                   jle        0x7f63dbbed094
0084c 418bdd                         mov        ebx, r13d
0084f 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
00856 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0085e 4403d3                         add        r10d, ebx
00861 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00866 0f8fe4100000                   jg         0x7f63dbbed1d0
0086c 458bde                         mov        r11d, r14d
0086f 44039c24b0000000               add        r11d, dword ptr [rsp + 0xb0]
00877 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0087f 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00887 0f8f47110000                   jg         0x7f63dbbed254
0088d 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00895 4183fa10                       cmp        r10d, 0x10
00899 0f8f8e050000                   jg         0x7f63dbbec6ad
0089f 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
008a7 0f838b0d0000                   jae        0x7f63dbbeceb8
008ad 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
008b5 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
008bc 443bac2484000000               cmp        r13d, dword ptr [rsp + 0x84]
008c4 0f83020e0000                   jae        0x7f63dbbecf4c
008ca 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
008d2 4503de                         add        r11d, r14d
008d5 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
008dd 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008e5 c4817a7f442a0c                 vmovdqu    xmmword ptr [r10 + r13 + 0xc], xmm0
008ec 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
008f4 4503d5                         add        r10d, r13d
008f7 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
008ff 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00907 442b8424b8000000               sub        r8d, dword ptr [rsp + 0xb8]
0090f 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00917 4183fa10                       cmp        r10d, 0x10
0091b 0f8febfaffff                   jg         0x7f63dbbebc8c
00921 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00929 4183fb10                       cmp        r11d, 0x10
0092d 0f8cd9faffff                   jl         0x7f63dbbebc8c
00933 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
0093b 0f834f0e0000                   jae        0x7f63dbbed010
00941 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00949 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00950 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00958 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00960 0f8287faffff                   jb         0x7f63dbbebc6d
00966 bee4ffffff                     mov        esi, 0xffffffe4
0096b 488b2c24                       mov        rbp, qword ptr [rsp]
0096f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00974 4489542408                     mov        dword ptr [rsp + 8], r10d
00979 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0097e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00983 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00988 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0098d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00992 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00997 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0099c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009a1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009a6 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
009ab 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
009b3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
009b8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
009bd 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
009c2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
009ca 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
009cf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
009d4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
009d9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009e1 4489542474                     mov        dword ptr [rsp + 0x74], r10d
009e6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009ef 90                             nop        
009f0 c5f877                         vzeroupper 
009f3 e8e8e4afff                     call       0x7f63db6ea760
009f8 0f1f8400f00a0002               nop        dword ptr [rax + rax + 0x2000af0]
00a00 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
00a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a0e e86d46b418                     call       0x7f63f4730900
00a13 f4                             hlt        
00a14 453bd3                         cmp        r10d, r11d
00a17 0f8ea8fdffff                   jle        0x7f63dbbec045
00a1d be45ffffff                     mov        esi, 0xffffff45
00a22 418bea                         mov        ebp, r10d
00a25 44891c24                       mov        dword ptr [rsp], r11d
00a29 90                             nop        
00a2a 90                             nop        
00a2b 90                             nop        
00a2c c5f877                         vzeroupper 
00a2f e8ace4afff                     call       0x7f63db6ea760
00a34 0f1f84002c0b0003               nop        dword ptr [rax + rax + 0x3000b2c]
00a3c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
00a46 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a4a e83146b418                     call       0x7f63f4730900
00a4f f4                             hlt        
00a50 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a58 4585d2                         test       r10d, r10d
00a5b 7407                           je         0x7f63dbbec2e4
00a5d 448d53ff                       lea        r10d, [rbx - 1]
00a61 418bda                         mov        ebx, r10d
00a64 85db                           test       ebx, ebx
00a66 747c                           je         0x7f63dbbec364
00a68 83fb03                         cmp        ebx, 3
00a6b 0f8463170000                   je         0x7f63dbbeda54
00a71 83fb02                         cmp        ebx, 2
00a74 0f87f2170000                   ja         0x7f63dbbedaec
00a7a 3b5c240c                       cmp        ebx, dword ptr [rsp + 0xc]
00a7e 0f830c160000                   jae        0x7f63dbbed910
00a84 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00a8c 458b5c9b0c                     mov        r11d, dword ptr [r11 + rbx*4 + 0xc]
00a91 85db                           test       ebx, ebx
00a93 7e41                           jle        0x7f63dbbec356
00a95 448d53ff                       lea        r10d, [rbx - 1]
00a99 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a9e 0f8394160000                   jae        0x7f63dbbed9b8
00aa4 90                             nop        
00aa5 90                             nop        
00aa6 90                             nop        
00aa7 90                             nop        
00aa8 90                             nop        
00aa9 90                             nop        
00aaa 90                             nop        
00aab 90                             nop        
00aac 90                             nop        
00aad 90                             nop        
00aae 90                             nop        
00aaf 90                             nop        
00ab0 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
00ab8 458b449808                     mov        r8d, dword ptr [r8 + rbx*4 + 8]
00abd 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00ac5 458944990c                     mov        dword ptr [r9 + rbx*4 + 0xc], r8d
00aca 448d53ff                       lea        r10d, [rbx - 1]
00ace 418bda                         mov        ebx, r10d
00ad1 4585d2                         test       r10d, r10d
00ad4 7fda                           jg         0x7f63dbbec330
00ad6 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00ade 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00ae2 eb0c                           jmp        0x7f63dbbec370
00ae4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00aec 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
00af0 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00af8 e915fdffff                     jmp        0x7f63dbbec092
00afd 4183fb10                       cmp        r11d, 0x10
00b01 0f8dad1b0000                   jge        0x7f63dbbedf34
00b07 4183fb08                       cmp        r11d, 8
00b0b 0f8d8a040000                   jge        0x7f63dbbec81b
00b11 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00b19 4183fb10                       cmp        r11d, 0x10
00b1d 0f8eb9000000                   jle        0x7f63dbbec45c
00b23 4585c0                         test       r8d, r8d
00b26 0f8ce01a0000                   jl         0x7f63dbbede8c
00b2c 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b34 4585d2                         test       r10d, r10d
00b37 0f8ccf1a0000                   jl         0x7f63dbbede8c
00b3d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b42 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00b4a 0f82bc1a0000                   jb         0x7f63dbbede8c
00b50 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00b57 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
00b5e 448bf3                         mov        r14d, ebx
00b61 443bdb                         cmp        r11d, ebx
00b64 0f82a21a0000                   jb         0x7f63dbbede8c
00b6a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b72 4585db                         test       r11d, r11d
00b75 0f8c911a0000                   jl         0x7f63dbbede8c
00b7b 4585db                         test       r11d, r11d
00b7e 0f84c0f7ffff                   je         0x7f63dbbebbc4
00b84 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
00b89 4883fb20                       cmp        rbx, 0x20
00b8d 772d                           ja         0x7f63dbbec43c
00b8f 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00b97 4d63d2                         movsxd     r10, r10d
00b9a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ba1 c442a8f5db                     bzhi       r11, r11, r10
00ba6 c4c1fb92fb                     kmovq      k7, r11
00bab 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bb1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bb7 e988f7ffff                     jmp        0x7f63dbbebbc4
00bbc 488bd3                         mov        rdx, rbx
00bbf c5f877                         vzeroupper 
00bc2 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00bcc 41ffd2                         call       r10
00bcf 0f1f840000000000               nop        dword ptr [rax + rax]
00bd7 e968f7ffff                     jmp        0x7f63dbbebbc4
00bdc 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00be1 0f831d170000                   jae        0x7f63dbbedb84
00be7 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bef 430fbe6c020c                   movsx      ebp, byte ptr [r10 + r8 + 0xc]
00bf5 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00bfd 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c02 0f83a8170000                   jae        0x7f63dbbedc30
00c08 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c10 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c18 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00c1d 458d5803                       lea        r11d, [r8 + 3]
00c21 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
00c29 41ffc1                         inc        r9d
00c2c 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c31 0f8309180000                   jae        0x7f63dbbedcc0
00c37 4d63d8                         movsxd     r11, r8d
00c3a 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00c40 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00c48 4183c203                       add        r10d, 3
00c4c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c51 0f8391180000                   jae        0x7f63dbbedd68
00c57 4c639424b0000000               movsxd     r10, dword ptr [rsp + 0xb0]
00c5f 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00c67 43886c110d                     mov        byte ptr [r9 + r10 + 0xd], bpl
00c6c 470fbe4c190e                   movsx      r9d, byte ptr [r9 + r11 + 0xe]
00c72 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00c7a 46884c110e                     mov        byte ptr [rcx + r10 + 0xe], r9b
00c7f 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00c85 46885c110f                     mov        byte ptr [rcx + r10 + 0xf], r11b
00c8a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c92 4183fb08                       cmp        r11d, 8
00c96 0f83e4180000                   jae        0x7f63dbbede00
00c9c 49bbf0ef2fe300000000           movabs     r11, 0xe32feff0
00ca6 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00cae 470344930c                     add        r8d, dword ptr [r11 + r10*4 + 0xc]
00cb3 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00cb8 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00cc0 4183fb04                       cmp        r11d, 4
00cc4 7e42                           jle        0x7f63dbbec588
00cc6 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00ccd 83c504                         add        ebp, 4
00cd0 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cd8 418bd0                         mov        edx, r8d
00cdb 90                             nop        
00cdc c5f877                         vzeroupper 
00cdf e8fc76b5ff                     call       0x7f63db743c60
00ce4 0f1f8400dc0d0004               nop        dword ptr [rax + rax + 0x4000ddc]
00cec 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cf4 8bd5                           mov        edx, ebp
00cf6 8bc8                           mov        ecx, eax
00cf8 c5f877                         vzeroupper 
00cfb e8e076b5ff                     call       0x7f63db743c60
00d00 0f1f8400f80d0005               nop        dword ptr [rax + rax + 0x5000df8]
00d08 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00d10 4183fa08                       cmp        r10d, 8
00d14 7e62                           jle        0x7f63dbbec5f8
00d16 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d1a 49ba20f02fe300000000           movabs     r10, 0xe32ff020
00d24 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00d2c 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00d31 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00d38 83c508                         add        ebp, 8
00d3b 83c208                         add        edx, 8
00d3e 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00d46 90                             nop        
00d47 90                             nop        
00d48 c5f877                         vzeroupper 
00d4b e89076b5ff                     call       0x7f63db743c60
00d50 0f1f8400480e0006               nop        dword ptr [rax + rax + 0x6000e48]
00d58 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00d60 8bd5                           mov        edx, ebp
00d62 488bc8                         mov        rcx, rax
00d65 90                             nop        
00d66 90                             nop        
00d67 90                             nop        
00d68 c5f877                         vzeroupper 
00d6b e87076b5ff                     call       0x7f63db743c60
00d70 0f1f8400680e0007               nop        dword ptr [rax + rax + 0x7000e68]
00d78 448bac24c0000000               mov        r13d, dword ptr [rsp + 0xc0]
00d80 e980f9ffff                     jmp        0x7f63dbbebf85
00d85 4d63d3                         movsxd     r10, r11d
00d88 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d8f c442a8f5db                     bzhi       r11, r11, r10
00d94 c4c1fb92fb                     kmovq      k7, r11
00d99 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d9f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00da5 eb68                           jmp        0x7f63dbbec68f
00da7 4585f6                         test       r14d, r14d
00daa 0f8c301a0000                   jl         0x7f63dbbee060
00db0 4585ed                         test       r13d, r13d
00db3 0f8c271a0000                   jl         0x7f63dbbee060
00db9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dbe 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00dc3 0f82171a0000                   jb         0x7f63dbbee060
00dc9 438d2c2b                       lea        ebp, [r11 + r13]
00dcd 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00dd2 443bc5                         cmp        r8d, ebp
00dd5 0f82051a0000                   jb         0x7f63dbbee060
00ddb 4585db                         test       r11d, r11d
00dde 0f8cfc190000                   jl         0x7f63dbbee060
00de4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00de9 453bd6                         cmp        r10d, r14d
00dec 7421                           je         0x7f63dbbec68f
00dee 4963d3                         movsxd     rdx, r11d
00df1 4883fa20                       cmp        rdx, 0x20
00df5 768e                           jbe        0x7f63dbbec605
00df7 c5f877                         vzeroupper 
00dfa 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00e04 41ffd2                         call       r10
00e07 0f1f840000000000               nop        dword ptr [rax + rax]
00e0f 4c8b1424                       mov        r10, qword ptr [rsp]
00e13 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00e17 c5f877                         vzeroupper 
00e1a 4881c4f0000000                 add        rsp, 0xf0
00e21 5d                             pop        rbp
00e22 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e26 0f876c210000                   ja         0x7f63dbbee818
00e2c c3                             ret        
00e2d 4183fa30                       cmp        r10d, 0x30
00e31 0f8e8c000000                   jle        0x7f63dbbec743
00e37 4585f6                         test       r14d, r14d
00e3a 0f8cf81d0000                   jl         0x7f63dbbee4b8
00e40 4585ed                         test       r13d, r13d
00e43 0f8cef1d0000                   jl         0x7f63dbbee4b8
00e49 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e4e 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00e56 0f82dc1d0000                   jb         0x7f63dbbee4b8
00e5c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e61 443bdb                         cmp        r11d, ebx
00e64 0f82ce1d0000                   jb         0x7f63dbbee4b8
00e6a 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00e72 4585d2                         test       r10d, r10d
00e75 7426                           je         0x7f63dbbec71d
00e77 4883fa20                       cmp        rdx, 0x20
00e7b 772c                           ja         0x7f63dbbec729
00e7d 4d63d2                         movsxd     r10, r10d
00e80 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e87 c442a8f5db                     bzhi       r11, r11, r10
00e8c c4c1fb92fb                     kmovq      k7, r11
00e91 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e97 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e9d 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
00ea4 e956faffff                     jmp        0x7f63dbbec17f
00ea9 c5f877                         vzeroupper 
00eac 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00eb6 41ffd2                         call       r10
00eb9 0f1f840000000000               nop        dword ptr [rax + rax]
00ec1 ebda                           jmp        0x7f63dbbec71d
00ec3 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
00ecb 0f83fb1b0000                   jae        0x7f63dbbee34c
00ed1 4963fe                         movsxd     rdi, r14d
00ed4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00edc c4c17a6f443a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rdi + 0xc]
00ee3 443bac2484000000               cmp        r13d, dword ptr [rsp + 0x84]
00eeb 0f83871c0000                   jae        0x7f63dbbee3f8
00ef1 458d5510                       lea        r10d, [r13 + 0x10]
00ef5 418bc2                         mov        eax, r10d
00ef8 4d63dd                         movsxd     r11, r13d
00efb 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00f03 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00f0a 448bd0                         mov        r10d, eax
00f0d 443bd3                         cmp        r10d, ebx
00f10 0f8d90060000                   jge        0x7f63dbbece26
00f16 492bfb                         sub        rdi, r11
00f19 4d63da                         movsxd     r11, r10d
00f1c 486354241c                     movsxd     rdx, dword ptr [rsp + 0x1c]
00f21 4883c2f1                       add        rdx, -0xf
00f25 4d8d043b                       lea        r8, [r11 + rdi]
00f29 4c3bc2                         cmp        r8, rdx
00f2c 0f83b21d0000                   jae        0x7f63dbbee564
00f32 4c63c3                         movsxd     r8, ebx
00f35 4d8bc8                         mov        r9, r8
00f38 4d2bcb                         sub        r9, r11
00f3b 4983c10f                       add        r9, 0xf
00f3f 4983e1f0                       and        r9, 0xfffffffffffffff0
00f43 458bd9                         mov        r11d, r9d
00f46 478d5c2b10                     lea        r11d, [r11 + r13 + 0x10]
00f4b 4d63db                         movsxd     r11, r11d
00f4e 4d8d4c3bf0                     lea        r9, [r11 + rdi - 0x10]
00f53 4c3bca                         cmp        r9, rdx
00f56 0f83881d0000                   jae        0x7f63dbbee564
00f5c 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00f64 0f837a1d0000                   jae        0x7f63dbbee564
00f6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f6f 4983c2f1                       add        r10, -0xf
00f73 4983c3f0                       add        r11, -0x10
00f77 4d3bda                         cmp        r11, r10
00f7a 0f83641d0000                   jae        0x7f63dbbee564
00f80 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00f86 0f8fec1d0000                   jg         0x7f63dbbee5f8
00f8c 458bd6                         mov        r10d, r14d
00f8f 452bd5                         sub        r10d, r13d
00f92 4183c520                       add        r13d, 0x20
00f96 e9fc030000                     jmp        0x7f63dbbecc17
00f9b 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
00fa3 0f8373180000                   jae        0x7f63dbbee09c
00fa9 4963d8                         movsxd     rbx, r8d
00fac 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00fb4 4d8b4c1a0c                     mov        r9, qword ptr [r10 + rbx + 0xc]
00fb9 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00fc1 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00fc9 0f83e9180000                   jae        0x7f63dbbee138
00fcf 418d5208                       lea        edx, [r10 + 8]
00fd3 4d63da                         movsxd     r11, r10d
00fd6 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00fde 4e894c1f0c                     mov        qword ptr [rdi + r11 + 0xc], r9
00fe3 3b9424c0000000                 cmp        edx, dword ptr [rsp + 0xc0]
00fea 0f8d97030000                   jge        0x7f63dbbecc07
00ff0 492bdb                         sub        rbx, r11
00ff3 4c63ca                         movsxd     r9, edx
00ff6 4d8d1c19                       lea        r11, [r9 + rbx]
00ffa 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00fff 0f8357190000                   jae        0x7f63dbbee1dc
01005 4c8bd9                         mov        r11, rcx
01008 4d2bd9                         sub        r11, r9
0100b 4983c307                       add        r11, 7
0100f 4983e3f8                       and        r11, 0xfffffffffffffff8
01013 418bfb                         mov        edi, r11d
01016 468d5c1708                     lea        r11d, [rdi + r10 + 8]
0101b 4d63db                         movsxd     r11, r11d
0101e 498d7c1bf8                     lea        rdi, [r11 + rbx - 8]
01023 483b7c2438                     cmp        rdi, qword ptr [rsp + 0x38]
01028 0f832e190000                   jae        0x7f63dbbee1dc
0102e 3b9424a8000000                 cmp        edx, dword ptr [rsp + 0xa8]
01035 0f8321190000                   jae        0x7f63dbbee1dc
0103b 4983c3f8                       add        r11, -8
0103f 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
01044 0f8312190000                   jae        0x7f63dbbee1dc
0104a 8bbc24c0000000                 mov        edi, dword ptr [rsp + 0xc0]
01051 81fff8ffff7f                   cmp        edi, 0x7ffffff8
01057 0f8f8f190000                   jg         0x7f63dbbee26c
0105d 452bc2                         sub        r8d, r10d
01060 b8f4ffffff                     mov        eax, 0xfffffff4
01065 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0106d 458bdb                         mov        r11d, r11d
01070 412bc3                         sub        eax, r11d
01073 412bc2                         sub        eax, r10d
01076 4183c210                       add        r10d, 0x10
0107a 418bf2                         mov        esi, r10d
0107d 83c0f0                         add        eax, -0x10
01080 4d63da                         movsxd     r11, r10d
01083 4c8d51c8                       lea        r10, [rcx - 0x38]
01087 4981fa00000080                 cmp        r10, -0x80000000
0108e 48c7c700000080                 mov        rdi, 0xffffffff80000000
01095 4c0f4cd7                       cmovl      r10, rdi
01099 418bfa                         mov        edi, r10d
0109c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010a4 498bea                         mov        rbp, r10
010a7 41ba06000000                   mov        r10d, 6
010ad c462a8f5d0                     bzhi       r10, rax, r10
010b2 4d03da                         add        r11, r10
010b5 4c3bd9                         cmp        r11, rcx
010b8 488bc1                         mov        rax, rcx
010bb 490f4cc3                       cmovl      rax, r11
010bf 4c8bd0                         mov        r10, rax
010c2 4d2bd1                         sub        r10, r9
010c5 4d8d5aff                       lea        r11, [r10 - 1]
010c9 49c1fb3f                       sar        r11, 0x3f
010cd 49c1eb3d                       shr        r11, 0x3d
010d1 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
010d6 4983e2f8                       and        r10, 0xfffffffffffffff8
010da 4d03d1                         add        r10, r9
010dd 4d3bca                         cmp        r9, r10
010e0 4d0f4cca                       cmovl      r9, r10
010e4 458bd1                         mov        r10d, r9d
010e7 458d5a08                       lea        r11d, [r10 + 8]
010eb 442b9424b8000000               sub        r10d, dword ptr [rsp + 0xb8]
010f3 4d63eb                         movsxd     r13, r11d
010f6 4c03ed                         add        r13, rbp
010f9 4183c208                       add        r10d, 8
010fd 4d63f2                         movsxd     r14, r10d
01100 4c03f5                         add        r14, rbp
01103 4d8d5d4c                       lea        r11, [r13 + 0x4c]
01107 4983c50c                       add        r13, 0xc
0110b 4d8d4e0c                       lea        r9, [r14 + 0xc]
0110f 4533d2                         xor        r10d, r10d
01112 4d3bd9                         cmp        r11, r9
01115 410f96c2                       setbe      r10b
01119 4983c64c                       add        r14, 0x4c
0111d 4533c9                         xor        r9d, r9d
01120 4d3bf5                         cmp        r14, r13
01123 410f96c1                       setbe      r9b
01127 450bd1                         or         r10d, r9d
0112a 0f84070e0000                   je         0x7f63dbbed7b7
01130 448bc8                         mov        r9d, eax
01133 eb06                           jmp        0x7f63dbbec9bb
01135 90                             nop        
01136 90                             nop        
01137 90                             nop        
01138 418bd2                         mov        edx, r10d
0113b 448bd2                         mov        r10d, edx
0113e 458d1c10                       lea        r11d, [r8 + rdx]
01142 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
0114a 4e8b5c1e0c                     mov        r11, qword ptr [rsi + r11 + 0xc]
0114f 4e895c160c                     mov        qword ptr [rsi + r10 + 0xc], r11
01154 448d5208                       lea        r10d, [rdx + 8]
01158 453bd1                         cmp        r10d, r9d
0115b 7cdb                           jl         0x7f63dbbec9b8
0115d 4881c108feffff                 add        rcx, -0x1f8
01164 4881f900000080                 cmp        rcx, -0x80000000
0116b 49c7c300000080                 mov        r11, 0xffffffff80000000
01172 490f4ccb                       cmovl      rcx, r11
01176 448bd9                         mov        r11d, ecx
01179 453bd3                         cmp        r10d, r11d
0117c 0f8df2180000                   jge        0x7f63dbbee2f4
01182 4d63ca                         movsxd     r9, r10d
01185 4c03cb                         add        r9, rbx
01188 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
0118d 0f83e9180000                   jae        0x7f63dbbee2fc
01193 81c200020000                   add        edx, 0x200
01199 4c63ca                         movsxd     r9, edx
0119c 4c03cb                         add        r9, rbx
0119f 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
011a4 0f83e6180000                   jae        0x7f63dbbee310
011aa 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
011b2 0f83ec180000                   jae        0x7f63dbbee324
011b8 3b9424a8000000                 cmp        edx, dword ptr [rsp + 0xa8]
011bf 0f83f3180000                   jae        0x7f63dbbee338
011c5 48895c2440                     mov        qword ptr [rsp + 0x40], rbx
011ca eb07                           jmp        0x7f63dbbeca53
011cc 90                             nop        
011cd 90                             nop        
011ce 90                             nop        
011cf 90                             nop        
011d0 458bd1                         mov        r10d, r9d
011d3 458d8a00010000                 lea        r9d, [r10 + 0x100]
011da 4503c8                         add        r9d, r8d
011dd 418db280000000                 lea        esi, [r10 + 0x80]
011e4 4103f0                         add        esi, r8d
011e7 418bd1                         mov        edx, r9d
011ea 4963d9                         movsxd     rbx, r9d
011ed 8bc6                           mov        eax, esi
011ef 4863ee                         movsxd     rbp, esi
011f2 418bf2                         mov        esi, r10d
011f5 478d2c10                       lea        r13d, [r8 + r10]
011f9 418bca                         mov        ecx, r10d
011fc 4c63c9                         movsxd     r9, ecx
011ff 418bcd                         mov        ecx, r13d
01202 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
0120a 62d17e486f840e0c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rcx + 0xc]
01215 62d17e487f84360c000000         vmovdqu32  zmmword ptr [r14 + rsi + 0xc], zmm0
01220 4963f5                         movsxd     rsi, r13d
01223 62d17e486f84364c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x4c]
0122e 62917e487f840e4c000000         vmovdqu32  zmmword ptr [r14 + r9 + 0x4c], zmm0
01239 62d17e486f84060c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0xc]
01244 62917e487f840e8c000000         vmovdqu32  zmmword ptr [r14 + r9 + 0x8c], zmm0
0124f 62d17e486f842e4c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rbp + 0x4c]
0125a 62917e487f840ecc000000         vmovdqu32  zmmword ptr [r14 + r9 + 0xcc], zmm0
01265 62d17e486f84160c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdx + 0xc]
01270 62917e487f840e0c010000         vmovdqu32  zmmword ptr [r14 + r9 + 0x10c], zmm0
0127b 62d17e486f841e4c000000         vmovdqu32  zmm0, zmmword ptr [r14 + rbx + 0x4c]
01286 62917e487f840e4c010000         vmovdqu32  zmmword ptr [r14 + r9 + 0x14c], zmm0
01291 62d17e486f84368c010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x18c]
0129c 62917e487f840e8c010000         vmovdqu32  zmmword ptr [r14 + r9 + 0x18c], zmm0
012a7 62d17e486f8436cc010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x1cc]
012b2 62917e487f840ecc010000         vmovdqu32  zmmword ptr [r14 + r9 + 0x1cc], zmm0
012bd 458d8a00020000                 lea        r9d, [r10 + 0x200]
012c4 453bcb                         cmp        r9d, r11d
012c7 0f8c03ffffff                   jl         0x7f63dbbeca50
012cd 443bcf                         cmp        r9d, edi
012d0 7d58                           jge        0x7f63dbbecbaa
012d2 4181c238020000                 add        r10d, 0x238
012d9 4d63da                         movsxd     r11, r10d
012dc 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
012e1 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
012e6 0f83701b0000                   jae        0x7f63dbbee6dc
012ec 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
012f4 0f838a1b0000                   jae        0x7f63dbbee704
012fa 90                             nop        
012fb 90                             nop        
012fc 458bd9                         mov        r11d, r9d
012ff 478d1408                       lea        r10d, [r8 + r9]
01303 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
0130b 62b17e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc]
01316 62b17e487f84190c000000         vmovdqu32  zmmword ptr [rcx + r11 + 0xc], zmm0
01321 4183c140                       add        r9d, 0x40
01325 443bcf                         cmp        r9d, edi
01328 7cd2                           jl         0x7f63dbbecb7c
0132a 488b5c2440                     mov        rbx, qword ptr [rsp + 0x40]
0132f 443b8c24c0000000               cmp        r9d, dword ptr [rsp + 0xc0]
01337 7d4e                           jge        0x7f63dbbecc07
01339 4d63d1                         movsxd     r10, r9d
0133c 4c03d3                         add        r10, rbx
0133f 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01344 0f83261b0000                   jae        0x7f63dbbee6f0
0134a 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01352 0f83401b0000                   jae        0x7f63dbbee718
01358 478d1408                       lea        r10d, [r8 + r9]
0135c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01364 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
01369 458bd9                         mov        r11d, r9d
0136c 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01374 4e8954190c                     mov        qword ptr [rcx + r11 + 0xc], r10
01379 4183c108                       add        r9d, 8
0137d 443b8c24c0000000               cmp        r9d, dword ptr [rsp + 0xc0]
01385 7cd1                           jl         0x7f63dbbecbd8
01387 448bac24c0000000               mov        r13d, dword ptr [rsp + 0xc0]
0138f e971f3ffff                     jmp        0x7f63dbbebf85
01394 418bc1                         mov        eax, r9d
01397 448bd8                         mov        r11d, eax
0139a 458d0c02                       lea        r9d, [r10 + rax]
0139e 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
013a6 c4a17a6f44090c                 vmovdqu    xmm0, xmmword ptr [rcx + r9 + 0xc]
013ad 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
013b5 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
013bc 448d4810                       lea        r9d, [rax + 0x10]
013c0 453bcd                         cmp        r9d, r13d
013c3 7ccf                           jl         0x7f63dbbecc14
013c5 4981c010ffffff                 add        r8, -0xf0
013cc 4981f800000080                 cmp        r8, -0x80000000
013d3 49c7c300000080                 mov        r11, 0xffffffff80000000
013da 4d0f4cc3                       cmovl      r8, r11
013de 458bc0                         mov        r8d, r8d
013e1 453bc8                         cmp        r9d, r8d
013e4 0f8d69010000                   jge        0x7f63dbbecdd3
013ea 4d63d9                         movsxd     r11, r9d
013ed 4c03df                         add        r11, rdi
013f0 4c3bda                         cmp        r11, rdx
013f3 0f83131a0000                   jae        0x7f63dbbee68c
013f9 448d9800010000                 lea        r11d, [rax + 0x100]
01400 4963cb                         movsxd     rcx, r11d
01403 4803cf                         add        rcx, rdi
01406 483bca                         cmp        rcx, rdx
01409 0f83111a0000                   jae        0x7f63dbbee6a0
0140f 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
01417 0f83171a0000                   jae        0x7f63dbbee6b4
0141d 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
01425 0f831d1a0000                   jae        0x7f63dbbee6c8
0142b 90                             nop        
0142c 90                             nop        
0142d 90                             nop        
0142e 90                             nop        
0142f 90                             nop        
01430 418bc9                         mov        ecx, r9d
01433 4863f1                         movsxd     rsi, ecx
01436 478d1c0a                       lea        r11d, [r10 + r9]
0143a 418bc9                         mov        ecx, r9d
0143d 418bc3                         mov        eax, r11d
01440 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01448 c5fa6f44050c                   vmovdqu    xmm0, xmmword ptr [rbp + rax + 0xc]
0144e 488b8424c8000000               mov        rax, qword ptr [rsp + 0xc8]
01456 c5fa7f44080c                   vmovdqu    xmmword ptr [rax + rcx + 0xc], xmm0
0145c 4963cb                         movsxd     rcx, r11d
0145f c5fa6f440d1c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x1c]
01465 c5fa7f44301c                   vmovdqu    xmmword ptr [rax + rsi + 0x1c], xmm0
0146b c5fa6f440d2c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x2c]
01471 c5fa7f44302c                   vmovdqu    xmmword ptr [rax + rsi + 0x2c], xmm0
01477 c5fa6f440d3c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x3c]
0147d c5fa7f44303c                   vmovdqu    xmmword ptr [rax + rsi + 0x3c], xmm0
01483 c5fa6f440d4c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x4c]
01489 c5fa7f44304c                   vmovdqu    xmmword ptr [rax + rsi + 0x4c], xmm0
0148f c5fa6f440d5c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x5c]
01495 c5fa7f44305c                   vmovdqu    xmmword ptr [rax + rsi + 0x5c], xmm0
0149b c5fa6f440d6c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x6c]
014a1 c5fa7f44306c                   vmovdqu    xmmword ptr [rax + rsi + 0x6c], xmm0
014a7 c5fa6f440d7c                   vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x7c]
014ad c5fa7f44307c                   vmovdqu    xmmword ptr [rax + rsi + 0x7c], xmm0
014b3 c5fa6f840d8c000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x8c]
014bc c5fa7f84308c000000             vmovdqu    xmmword ptr [rax + rsi + 0x8c], xmm0
014c5 c5fa6f840d9c000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0x9c]
014ce c5fa7f84309c000000             vmovdqu    xmmword ptr [rax + rsi + 0x9c], xmm0
014d7 c5fa6f840dac000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xac]
014e0 c5fa7f8430ac000000             vmovdqu    xmmword ptr [rax + rsi + 0xac], xmm0
014e9 c5fa6f840dbc000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xbc]
014f2 c5fa7f8430bc000000             vmovdqu    xmmword ptr [rax + rsi + 0xbc], xmm0
014fb c5fa6f840dcc000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xcc]
01504 c5fa7f8430cc000000             vmovdqu    xmmword ptr [rax + rsi + 0xcc], xmm0
0150d c5fa6f840ddc000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xdc]
01516 c5fa7f8430dc000000             vmovdqu    xmmword ptr [rax + rsi + 0xdc], xmm0
0151f c5fa6f840dec000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xec]
01528 c5fa7f8430ec000000             vmovdqu    xmmword ptr [rax + rsi + 0xec], xmm0
01531 c5fa6f840dfc000000             vmovdqu    xmm0, xmmword ptr [rbp + rcx + 0xfc]
0153a c5fa7f8430fc000000             vmovdqu    xmmword ptr [rax + rsi + 0xfc], xmm0
01543 4181c100010000                 add        r9d, 0x100
0154a 453bc8                         cmp        r9d, r8d
0154d 0f8cddfeffff                   jl         0x7f63dbbeccb0
01553 443bcb                         cmp        r9d, ebx
01556 7d4e                           jge        0x7f63dbbece26
01558 4d63d9                         movsxd     r11, r9d
0155b 4c03df                         add        r11, rdi
0155e 4c3bda                         cmp        r11, rdx
01561 0f8345190000                   jae        0x7f63dbbee72c
01567 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
0156f 0f834b190000                   jae        0x7f63dbbee740
01575 90                             nop        
01576 90                             nop        
01577 90                             nop        
01578 478d1c0a                       lea        r11d, [r10 + r9]
0157c 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
01584 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
0158b 458bc1                         mov        r8d, r9d
0158e 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01596 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
0159d 4183c110                       add        r9d, 0x10
015a1 443bcb                         cmp        r9d, ebx
015a4 7cd2                           jl         0x7f63dbbecdf8
015a6 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
015ae 4503d6                         add        r10d, r14d
015b1 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
015b9 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
015c0 e93af3ffff                     jmp        0x7f63dbbec17f
015c5 bee4ffffff                     mov        esi, 0xffffffe4
015ca 488b2c24                       mov        rbp, qword ptr [rsp]
015ce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015d3 4489542408                     mov        dword ptr [rsp + 8], r10d
015d8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015dd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015e2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015e7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015ec 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
015f1 4489742434                     mov        dword ptr [rsp + 0x34], r14d
015f6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015fb 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01600 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01605 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0160a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0160f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01614 c5f877                         vzeroupper 
01617 e8c4d8afff                     call       0x7f63db6ea760
0161c 0f1f840014170008               nop        dword ptr [rax + rax + 0x8001714]
01624 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0162e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01632 e8493ab418                     call       0x7f63f4730900
01637 f4                             hlt        
01638 bee4ffffff                     mov        esi, 0xffffffe4
0163d 488b2c24                       mov        rbp, qword ptr [rsp]
01641 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01646 44895c2408                     mov        dword ptr [rsp + 8], r11d
0164b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01650 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01655 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0165a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0165f 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01664 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01669 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0166e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01673 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01678 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0167d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01682 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01687 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0168c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01691 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01696 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0169b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
016a0 4489742478                     mov        dword ptr [rsp + 0x78], r14d
016a5 90                             nop        
016a6 90                             nop        
016a7 90                             nop        
016a8 c5f877                         vzeroupper 
016ab e830d8afff                     call       0x7f63db6ea760
016b0 0f1f8400a8170009               nop        dword ptr [rax + rax + 0x90017a8]
016b8 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
016c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c6 e8b539b418                     call       0x7f63f4730900
016cb f4                             hlt        
016cc bee4ffffff                     mov        esi, 0xffffffe4
016d1 488b2c24                       mov        rbp, qword ptr [rsp]
016d5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016da 4489542408                     mov        dword ptr [rsp + 8], r10d
016df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016ee 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016f3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
016f8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016fd 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01702 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01707 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0170c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01711 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01716 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0171e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01723 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01728 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0172d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01732 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01737 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0173f 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01744 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01749 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0174e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01753 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0175b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01760 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01769 90                             nop        
0176a 90                             nop        
0176b 90                             nop        
0176c c5f877                         vzeroupper 
0176f e86cd7afff                     call       0x7f63db6ea760
01774 0f1f84006c18000a               nop        dword ptr [rax + rax + 0xa00186c]
0177c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01786 4883e4f0                       and        rsp, 0xfffffffffffffff0
0178a e8f138b418                     call       0x7f63f4730900
0178f f4                             hlt        
01790 bee4ffffff                     mov        esi, 0xffffffe4
01795 488b2c24                       mov        rbp, qword ptr [rsp]
01799 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0179e 4489542408                     mov        dword ptr [rsp + 8], r10d
017a3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017a8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017ad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017b7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017bc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017c1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
017c6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
017cb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017d0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017d5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017da 4489542458                     mov        dword ptr [rsp + 0x58], r10d
017df 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017e4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017e9 4489442470                     mov        dword ptr [rsp + 0x70], r8d
017ee 90                             nop        
017ef 90                             nop        
017f0 c5f877                         vzeroupper 
017f3 e8e8d6afff                     call       0x7f63db6ea760
017f8 0f1f8400f018000b               nop        dword ptr [rax + rax + 0xb0018f0]
01800 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0180a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180e e86d38b418                     call       0x7f63f4730900
01813 f4                             hlt        
01814 be45ffffff                     mov        esi, 0xffffff45
01819 488b2c24                       mov        rbp, qword ptr [rsp]
0181d 4c89442408                     mov        qword ptr [rsp + 8], r8
01822 90                             nop        
01823 90                             nop        
01824 c5f877                         vzeroupper 
01827 e8b4d6afff                     call       0x7f63db6ea760
0182c 0f1f84002419000c               nop        dword ptr [rax + rax + 0xc001924]
01834 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0183e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01842 e83938b418                     call       0x7f63f4730900
01847 f4                             hlt        
01848 be45ffffff                     mov        esi, 0xffffff45
0184d 488b2c24                       mov        rbp, qword ptr [rsp]
01851 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01856 44895c2408                     mov        dword ptr [rsp + 8], r11d
0185b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01860 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01865 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0186a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0186f 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01874 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01879 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0187e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01883 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01888 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0188d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01892 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01897 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0189b 90                             nop        
0189c c5f877                         vzeroupper 
0189f e83cd6afff                     call       0x7f63db6ea760
018a4 0f1f84009c19000d               nop        dword ptr [rax + rax + 0xd00199c]
018ac 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
018b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ba e8c137b418                     call       0x7f63f4730900
018bf f4                             hlt        
018c0 493bd8                         cmp        rbx, r8
018c3 bdffffffff                     mov        ebp, 0xffffffff
018c8 7c08                           jl         0x7f63dbbed152
018ca 400f95c5                       setne      bpl
018ce 400fb6ed                       movzx      ebp, bpl
018d2 be45ffffff                     mov        esi, 0xffffff45
018d7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018dc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018e1 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
018e6 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
018eb 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018f0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
018f5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018fa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
018ff 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01904 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01909 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0190e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01913 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01918 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0191d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01922 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01927 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0192c c5f877                         vzeroupper 
0192f e8acd5afff                     call       0x7f63db6ea760
01934 0f1f84002c1a000e               nop        dword ptr [rax + rax + 0xe001a2c]
0193c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01946 4883e4f0                       and        rsp, 0xfffffffffffffff0
0194a e83137b418                     call       0x7f63f4730900
0194f f4                             hlt        
01950 be45ffffff                     mov        esi, 0xffffff45
01955 488b2c24                       mov        rbp, qword ptr [rsp]
01959 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0195e 4489442408                     mov        dword ptr [rsp + 8], r8d
01963 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01968 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0196d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01972 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01977 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0197c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01981 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01986 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0198b 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01990 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01995 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0199a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0199f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
019a4 4489442460                     mov        dword ptr [rsp + 0x60], r8d
019a9 4489542470                     mov        dword ptr [rsp + 0x70], r10d
019ae 90                             nop        
019af 90                             nop        
019b0 c5f877                         vzeroupper 
019b3 e828d5afff                     call       0x7f63db6ea760
019b8 0f1f8400b01a000f               nop        dword ptr [rax + rax + 0xf001ab0]
019c0 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
019ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ce e8ad36b418                     call       0x7f63f4730900
019d3 f4                             hlt        
019d4 be45ffffff                     mov        esi, 0xffffff45
019d9 488b2c24                       mov        rbp, qword ptr [rsp]
019dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019e2 4489542408                     mov        dword ptr [rsp + 8], r10d
019e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019f1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019f6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019fb 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01a00 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a05 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a0a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a0f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a14 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a19 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a1e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a23 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01a28 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a2d 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01a35 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a3a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a3f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a44 c5f877                         vzeroupper 
01a47 e894d4afff                     call       0x7f63db6ea760
01a4c 0f1f8400441b0010               nop        dword ptr [rax + rax + 0x10001b44]
01a54 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a62 e81936b418                     call       0x7f63f4730900
01a67 f4                             hlt        
01a68 bee4ffffff                     mov        esi, 0xffffffe4
01a6d 488b2c24                       mov        rbp, qword ptr [rsp]
01a71 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a76 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a7b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a80 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a85 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a8a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a8f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a94 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a99 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a9e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01aa3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01aa8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01aad 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ab5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01aba 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01abf 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ac4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01ac9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01ace 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01ad6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01adb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ae0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ae5 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01aed 90                             nop        
01aee 90                             nop        
01aef 90                             nop        
01af0 c5f877                         vzeroupper 
01af3 e8e8d3afff                     call       0x7f63db6ea760
01af8 0f1f8400f01b0011               nop        dword ptr [rax + rax + 0x11001bf0]
01b00 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0e e86d35b418                     call       0x7f63f4730900
01b13 f4                             hlt        
01b14 bee4ffffff                     mov        esi, 0xffffffe4
01b19 488b2c24                       mov        rbp, qword ptr [rsp]
01b1d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b22 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b27 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b2c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b31 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b36 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b3b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b40 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01b45 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b4a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b4f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b54 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b59 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01b61 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b66 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b6b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b70 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01b75 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01b7a 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01b82 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01b87 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b8c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01b91 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01b96 4889542478                     mov        qword ptr [rsp + 0x78], rdx
01b9b 90                             nop        
01b9c c5f877                         vzeroupper 
01b9f e83cd3afff                     call       0x7f63db6ea760
01ba4 0f1f84009c1c0012               nop        dword ptr [rax + rax + 0x12001c9c]
01bac 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01bb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bba e8c134b418                     call       0x7f63f4730900
01bbf f4                             hlt        
01bc0 4533d2                         xor        r10d, r10d
01bc3 4c891424                       mov        qword ptr [rsp], r10
01bc7 e968e5ffff                     jmp        0x7f63dbbeb9b4
01bcc 4533d2                         xor        r10d, r10d
01bcf 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01bd7 e983e5ffff                     jmp        0x7f63dbbeb9df
01bdc 4533d2                         xor        r10d, r10d
01bdf 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01be7 e9a3e5ffff                     jmp        0x7f63dbbeba0f
01bec 4533d2                         xor        r10d, r10d
01bef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bf4 e9bee5ffff                     jmp        0x7f63dbbeba37
01bf9 4533d2                         xor        r10d, r10d
01bfc 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01c04 e9dee5ffff                     jmp        0x7f63dbbeba67
01c09 4533d2                         xor        r10d, r10d
01c0c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01c14 e9f9e5ffff                     jmp        0x7f63dbbeba92
01c19 4183c008                       add        r8d, 8
01c1d be6effffff                     mov        esi, 0xffffff6e
01c22 488b2c24                       mov        rbp, qword ptr [rsp]
01c26 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c2b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c30 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c3a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c3f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c44 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01c49 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c4e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01c53 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01c58 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c5d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01c62 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01c67 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c6c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01c71 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01c76 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01c7b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c80 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01c85 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01c8d 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01c92 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c96 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01c9b 90                             nop        
01c9c c5f877                         vzeroupper 
01c9f e83cd2afff                     call       0x7f63db6ea760
01ca4 0f1f84009c1d0013               nop        dword ptr [rax + rax + 0x13001d9c]
01cac 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cba e8c133b418                     call       0x7f63f4730900
01cbf f4                             hlt        
01cc0 4183c008                       add        r8d, 8
01cc4 be66ffffff                     mov        esi, 0xffffff66
01cc9 488b2c24                       mov        rbp, qword ptr [rsp]
01ccd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cd2 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cd7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cdc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ce1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ce6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ceb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01cf0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01cf5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01cfa 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01cff 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d04 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d09 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d0e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d13 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01d18 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01d1d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01d22 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d27 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d2c 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
01d34 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01d39 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d3d 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d42 90                             nop        
01d43 90                             nop        
01d44 c5f877                         vzeroupper 
01d47 e894d1afff                     call       0x7f63db6ea760
01d4c 0f1f8400441e0014               nop        dword ptr [rax + rax + 0x14001e44]
01d54 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d62 e81933b418                     call       0x7f63f4730900
01d67 f4                             hlt        
01d68 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d76 e80533b418                     call       0x7f63f4730900
01d7b f4                             hlt        
01d7c 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e8f132b418                     call       0x7f63f4730900
01d8f f4                             hlt        
01d90 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01d9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d9e e8dd32b418                     call       0x7f63f4730900
01da3 f4                             hlt        
01da4 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db2 e8c932b418                     call       0x7f63f4730900
01db7 f4                             hlt        
01db8 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dc6 e8b532b418                     call       0x7f63f4730900
01dcb f4                             hlt        
01dcc 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e8a132b418                     call       0x7f63f4730900
01ddf f4                             hlt        
01de0 beccffffff                     mov        esi, 0xffffffcc
01de5 488b2c24                       mov        rbp, qword ptr [rsp]
01de9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dee 4489542408                     mov        dword ptr [rsp + 8], r10d
01df3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01df8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dfd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e02 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e07 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e0c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e11 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e16 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e1b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01e20 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e25 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e2a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e2f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e34 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e39 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01e41 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01e46 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e4b 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e50 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01e58 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01e5d 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01e65 90                             nop        
01e66 90                             nop        
01e67 90                             nop        
01e68 c5f877                         vzeroupper 
01e6b e870d0afff                     call       0x7f63db6ea760
01e70 0f1f8400681f0015               nop        dword ptr [rax + rax + 0x15001f68]
01e78 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e86 e8f531b418                     call       0x7f63f4730900
01e8b f4                             hlt        
01e8c beccffffff                     mov        esi, 0xffffffcc
01e91 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
01e99 4c89542408                     mov        qword ptr [rsp + 8], r10
01e9e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ea3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ea8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ead 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01eb2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01eb7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ebc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ec1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ec6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ece 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ed3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ed8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01edd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ee2 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ee7 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01eef 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ef4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ef9 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01efe 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01f06 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
01f0e 90                             nop        
01f0f 90                             nop        
01f10 c5f877                         vzeroupper 
01f13 e8c8cfafff                     call       0x7f63db6ea760
01f18 0f1f840010200016               nop        dword ptr [rax + rax + 0x16002010]
01f20 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
01f2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f2e e84d31b418                     call       0x7f63f4730900
01f33 f4                             hlt        
01f34 418bd2                         mov        edx, r10d
01f37 448bd2                         mov        r10d, edx
01f3a 458d0c10                       lea        r9d, [r8 + rdx]
01f3e 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01f46 4f8b5c0b0c                     mov        r11, qword ptr [r11 + r9 + 0xc]
01f4b 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
01f53 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
01f58 448d5208                       lea        r10d, [rdx + 8]
01f5c 443bd6                         cmp        r10d, esi
01f5f 7cd3                           jl         0x7f63dbbed7b4
01f61 443bd7                         cmp        r10d, edi
01f64 0f8dc2000000                   jge        0x7f63dbbed8ac
01f6a 4d63ca                         movsxd     r9, r10d
01f6d 4c03cb                         add        r9, rbx
01f70 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
01f75 0f83590f0000                   jae        0x7f63dbbee754
01f7b 448d4a40                       lea        r9d, [rdx + 0x40]
01f7f 4963c9                         movsxd     rcx, r9d
01f82 4803cb                         add        rcx, rbx
01f85 483b4c2438                     cmp        rcx, qword ptr [rsp + 0x38]
01f8a 0f83580f0000                   jae        0x7f63dbbee768
01f90 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01f98 0f835e0f0000                   jae        0x7f63dbbee77c
01f9e 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01fa6 0f83640f0000                   jae        0x7f63dbbee790
01fac 90                             nop        
01fad 90                             nop        
01fae 90                             nop        
01faf 90                             nop        
01fb0 458bca                         mov        r9d, r10d
01fb3 4963f1                         movsxd     rsi, r9d
01fb6 478d1c10                       lea        r11d, [r8 + r10]
01fba 418bca                         mov        ecx, r10d
01fbd 418bd3                         mov        edx, r11d
01fc0 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
01fc8 4d8b4c110c                     mov        r9, qword ptr [r9 + rdx + 0xc]
01fcd 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
01fd5 4c894c0a0c                     mov        qword ptr [rdx + rcx + 0xc], r9
01fda 4d63cb                         movsxd     r9, r11d
01fdd 4e8b5c0a14                     mov        r11, qword ptr [rdx + r9 + 0x14]
01fe2 4c895c3214                     mov        qword ptr [rdx + rsi + 0x14], r11
01fe7 4e8b5c0a1c                     mov        r11, qword ptr [rdx + r9 + 0x1c]
01fec 4c895c321c                     mov        qword ptr [rdx + rsi + 0x1c], r11
01ff1 4e8b5c0a24                     mov        r11, qword ptr [rdx + r9 + 0x24]
01ff6 4c895c3224                     mov        qword ptr [rdx + rsi + 0x24], r11
01ffb 4e8b5c0a2c                     mov        r11, qword ptr [rdx + r9 + 0x2c]
02000 4c895c322c                     mov        qword ptr [rdx + rsi + 0x2c], r11
02005 4e8b5c0a34                     mov        r11, qword ptr [rdx + r9 + 0x34]
0200a 4c895c3234                     mov        qword ptr [rdx + rsi + 0x34], r11
0200f 4e8b5c0a3c                     mov        r11, qword ptr [rdx + r9 + 0x3c]
02014 4c895c323c                     mov        qword ptr [rdx + rsi + 0x3c], r11
02019 4e8b5c0a44                     mov        r11, qword ptr [rdx + r9 + 0x44]
0201e 4c895c3244                     mov        qword ptr [rdx + rsi + 0x44], r11
02023 4183c240                       add        r10d, 0x40
02027 443bd7                         cmp        r10d, edi
0202a 7c84                           jl         0x7f63dbbed830
0202c 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
02034 0f8d4df3ffff                   jge        0x7f63dbbecc07
0203a 4d63ca                         movsxd     r9, r10d
0203d 4c03cb                         add        r9, rbx
02040 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
02045 0f83d90e0000                   jae        0x7f63dbbee7a4
0204b 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
02053 0f83df0e0000                   jae        0x7f63dbbee7b8
02059 90                             nop        
0205a 90                             nop        
0205b 90                             nop        
0205c 478d1c10                       lea        r11d, [r8 + r10]
02060 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
02068 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
0206d 458bca                         mov        r9d, r10d
02070 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
02078 4e895c090c                     mov        qword ptr [rcx + r9 + 0xc], r11
0207d 4183c208                       add        r10d, 8
02081 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
02089 7cd1                           jl         0x7f63dbbed8dc
0208b e9f7f2ffff                     jmp        0x7f63dbbecc07
02090 bee4ffffff                     mov        esi, 0xffffffe4
02095 488b2c24                       mov        rbp, qword ptr [rsp]
02099 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0209e 4489542408                     mov        dword ptr [rsp + 8], r10d
020a3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020a8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020ad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020b7 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
020bc 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020c1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020c6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020cb 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
020d0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020d5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020da 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020df 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020e4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020e9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
020ee 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
020f3 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
020fb 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02100 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02105 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0210a 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02111 90                             nop        
02112 90                             nop        
02113 90                             nop        
02114 c5f877                         vzeroupper 
02117 e8c4cdafff                     call       0x7f63db6ea760
0211c 0f1f840014220017               nop        dword ptr [rax + rax + 0x17002214]
02124 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0212e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02132 e8492fb418                     call       0x7f63f4730900
02137 f4                             hlt        
02138 be6effffff                     mov        esi, 0xffffff6e
0213d 488b2c24                       mov        rbp, qword ptr [rsp]
02141 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
02146 4489442408                     mov        dword ptr [rsp + 8], r8d
0214b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02150 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02155 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0215a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0215f 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02164 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02169 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0216e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02173 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02178 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0217d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
02182 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
02187 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0218c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02191 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02196 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0219b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021a0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
021a5 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
021aa 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
021ae 90                             nop        
021af 90                             nop        
021b0 c5f877                         vzeroupper 
021b3 e828cdafff                     call       0x7f63db6ea760
021b8 0f1f8400b0220018               nop        dword ptr [rax + rax + 0x180022b0]
021c0 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
021ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
021ce e8ad2eb418                     call       0x7f63f4730900
021d3 f4                             hlt        
021d4 be45ffffff                     mov        esi, 0xffffff45
021d9 488b2c24                       mov        rbp, qword ptr [rsp]
021dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021e2 4489542408                     mov        dword ptr [rsp + 8], r10d
021e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021f1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021f6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021fb 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02200 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02205 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0220a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0220f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02214 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02219 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0221e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02223 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02228 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0222d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02232 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02237 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0223c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02241 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02245 90                             nop        
02246 90                             nop        
02247 90                             nop        
02248 c5f877                         vzeroupper 
0224b e890ccafff                     call       0x7f63db6ea760
02250 0f1f840048230019               nop        dword ptr [rax + rax + 0x19002348]
02258 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02262 4883e4f0                       and        rsp, 0xfffffffffffffff0
02266 e8152eb418                     call       0x7f63f4730900
0226b f4                             hlt        
0226c be3dffffff                     mov        esi, 0xffffff3d
02271 488b2c24                       mov        rbp, qword ptr [rsp]
02275 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0227a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0227f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02284 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02289 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0228e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02293 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02298 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0229d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022a2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
022a7 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022ac 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022b1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022b6 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022bb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022c0 4c89542450                     mov        qword ptr [rsp + 0x50], r10
022c5 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
022ca 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
022cf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022d4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
022d9 895c2478                       mov        dword ptr [rsp + 0x78], ebx
022dd 90                             nop        
022de 90                             nop        
022df 90                             nop        
022e0 c5f877                         vzeroupper 
022e3 e8f8cbafff                     call       0x7f63db6ea760
022e8 0f1f8400e023001a               nop        dword ptr [rax + rax + 0x1a0023e0]
022f0 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
022fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
022fe e87d2db418                     call       0x7f63f4730900
02303 f4                             hlt        
02304 bee4ffffff                     mov        esi, 0xffffffe4
02309 488b2c24                       mov        rbp, qword ptr [rsp]
0230d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02312 44895c2408                     mov        dword ptr [rsp + 8], r11d
02317 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0231c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02321 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02326 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0232b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02330 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02335 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0233a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0233f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02344 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02349 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02351 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02356 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0235b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02360 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02365 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0236a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02372 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02377 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0237c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02381 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
02389 90                             nop        
0238a 90                             nop        
0238b 90                             nop        
0238c c5f877                         vzeroupper 
0238f e84ccbafff                     call       0x7f63db6ea760
02394 0f1f84008c24001b               nop        dword ptr [rax + rax + 0x1b00248c]
0239c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
023a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023aa e8d12cb418                     call       0x7f63f4730900
023af f4                             hlt        
023b0 bee4ffffff                     mov        esi, 0xffffffe4
023b5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023ba 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023bf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
023c4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
023c9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023ce 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023d3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
023d8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
023dd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
023e5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
023ea 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023ef 4c89542458                     mov        qword ptr [rsp + 0x58], r10
023f4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
023f9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
023fe 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02406 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0240b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02410 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02415 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0241a 90                             nop        
0241b 90                             nop        
0241c c5f877                         vzeroupper 
0241f e8bccaafff                     call       0x7f63db6ea760
02424 0f1f84001c25001c               nop        dword ptr [rax + rax + 0x1c00251c]
0242c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02436 4883e4f0                       and        rsp, 0xfffffffffffffff0
0243a e8412cb418                     call       0x7f63f4730900
0243f f4                             hlt        
02440 418d6801                       lea        ebp, [r8 + 1]
02444 bee4ffffff                     mov        esi, 0xffffffe4
02449 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
02451 4c89542408                     mov        qword ptr [rsp + 8], r10
02456 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0245b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02460 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02465 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0246a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0246f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02474 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02479 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0247e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02486 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0248b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02490 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02495 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0249a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0249f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
024a7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
024ac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024b1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
024b6 4489442474                     mov        dword ptr [rsp + 0x74], r8d
024bb 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
024c3 90                             nop        
024c4 c5f877                         vzeroupper 
024c7 e814caafff                     call       0x7f63db6ea760
024cc 0f1f8400c425001d               nop        dword ptr [rax + rax + 0x1d0025c4]
024d4 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
024de 4883e4f0                       and        rsp, 0xfffffffffffffff0
024e2 e8992bb418                     call       0x7f63f4730900
024e7 f4                             hlt        
024e8 bee4ffffff                     mov        esi, 0xffffffe4
024ed 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024f2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
024f7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
024fc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02501 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02506 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0250b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02510 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02515 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0251d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02522 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02527 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0252c 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02531 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02536 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0253e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02543 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02548 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0254d 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02552 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
0255a 90                             nop        
0255b 90                             nop        
0255c c5f877                         vzeroupper 
0255f e87cc9afff                     call       0x7f63db6ea760
02564 0f1f84005c26001e               nop        dword ptr [rax + rax + 0x1e00265c]
0256c 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02576 4883e4f0                       and        rsp, 0xfffffffffffffff0
0257a e8012bb418                     call       0x7f63f4730900
0257f f4                             hlt        
02580 bee4ffffff                     mov        esi, 0xffffffe4
02585 488b2c24                       mov        rbp, qword ptr [rsp]
02589 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0258e 4489542408                     mov        dword ptr [rsp + 8], r10d
02593 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02598 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0259d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025a2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025a7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
025ac 4489542434                     mov        dword ptr [rsp + 0x34], r10d
025b1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
025b6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025bb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
025c0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025c5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025ca 4c89542450                     mov        qword ptr [rsp + 0x50], r10
025cf 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
025d4 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025d9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025de 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025e3 4489442474                     mov        dword ptr [rsp + 0x74], r8d
025e8 c5f877                         vzeroupper 
025eb e8f0c8afff                     call       0x7f63db6ea760
025f0 0f1f8400e826001f               nop        dword ptr [rax + rax + 0x1f0026e8]
025f8 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02602 4883e4f0                       and        rsp, 0xfffffffffffffff0
02606 e8752ab418                     call       0x7f63f4730900
0260b f4                             hlt        
0260c beccffffff                     mov        esi, 0xffffffcc
02611 488b2c24                       mov        rbp, qword ptr [rsp]
02615 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0261a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0261f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02624 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02629 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0262e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02633 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02638 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0263d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02642 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02647 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0264c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02651 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02659 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0265e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02663 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02668 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0266d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02672 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0267a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0267f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02684 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02689 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0268e 90                             nop        
0268f 90                             nop        
02690 c5f877                         vzeroupper 
02693 e848c8afff                     call       0x7f63db6ea760
02698 0f1f840090270020               nop        dword ptr [rax + rax + 0x20002790]
026a0 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
026aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ae e8cd29b418                     call       0x7f63f4730900
026b3 f4                             hlt        
026b4 be45ffffff                     mov        esi, 0xffffff45
026b9 488b2c24                       mov        rbp, qword ptr [rsp]
026bd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
026c2 4489542408                     mov        dword ptr [rsp + 8], r10d
026c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026d1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026d6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
026db 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
026e0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
026e5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026ea 4c89542440                     mov        qword ptr [rsp + 0x40], r10
026ef 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
026f4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026f9 4489442468                     mov        dword ptr [rsp + 0x68], r8d
026fe 90                             nop        
026ff 90                             nop        
02700 c5f877                         vzeroupper 
02703 e8d8c7afff                     call       0x7f63db6ea760
02708 0f1f840000280021               nop        dword ptr [rax + rax + 0x21002800]
02710 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0271a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0271e e85d29b418                     call       0x7f63f4730900
02723 f4                             hlt        
02724 bebeffffff                     mov        esi, 0xffffffbe
02729 488b2c24                       mov        rbp, qword ptr [rsp]
0272d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02732 4489542408                     mov        dword ptr [rsp + 8], r10d
02737 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0273c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02741 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02746 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0274b 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02750 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02755 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0275a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0275f 90                             nop        
02760 c5f877                         vzeroupper 
02763 e878c7afff                     call       0x7f63db6ea760
02768 0f1f840060280022               nop        dword ptr [rax + rax + 0x22002860]
02770 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
0277a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0277e e8fd28b418                     call       0x7f63f4730900
02783 f4                             hlt        
02784 be85ffffff                     mov        esi, 0xffffff85
02789 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0278d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02792 44891c24                       mov        dword ptr [rsp], r11d
02796 44896c2404                     mov        dword ptr [rsp + 4], r13d
0279b 4489742408                     mov        dword ptr [rsp + 8], r14d
027a0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
027a5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
027aa 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
027af 4489542418                     mov        dword ptr [rsp + 0x18], r10d
027b4 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
027b9 90                             nop        
027ba 90                             nop        
027bb 90                             nop        
027bc c5f877                         vzeroupper 
027bf e81cc7afff                     call       0x7f63db6ea760
027c4 0f1f8400bc280023               nop        dword ptr [rax + rax + 0x230028bc]
027cc 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
027d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
027da e8a128b418                     call       0x7f63f4730900
027df f4                             hlt        
027e0 beccffffff                     mov        esi, 0xffffffcc
027e5 488b2c24                       mov        rbp, qword ptr [rsp]
027e9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
027ee 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
027f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
027f8 c5f877                         vzeroupper 
027fb e8e0c6afff                     call       0x7f63db6ea760
02800 0f1f8400f8280024               nop        dword ptr [rax + rax + 0x240028f8]
02808 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02812 4883e4f0                       and        rsp, 0xfffffffffffffff0
02816 e86528b418                     call       0x7f63f4730900
0281b f4                             hlt        
0281c bee4ffffff                     mov        esi, 0xffffffe4
02821 488b2c24                       mov        rbp, qword ptr [rsp]
02825 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0282a 4489542408                     mov        dword ptr [rsp + 8], r10d
0282f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02834 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02839 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0283e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02843 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02848 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0284d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02852 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02857 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0285c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02861 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02866 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0286b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02870 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02875 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0287d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02882 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02887 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0288c 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
02894 c5f877                         vzeroupper 
02897 e844c6afff                     call       0x7f63db6ea760
0289c 0f1f840094290025               nop        dword ptr [rax + rax + 0x25002994]
028a4 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
028ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
028b2 e8c927b418                     call       0x7f63f4730900
028b7 f4                             hlt        
028b8 bee4ffffff                     mov        esi, 0xffffffe4
028bd 488b2c24                       mov        rbp, qword ptr [rsp]
028c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
028c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
028cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028da 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028df 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
028e4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
028e9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
028ee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028f3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
028f8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
028fd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02902 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02907 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0290c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02911 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02919 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0291e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02923 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02928 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0292d 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
02935 90                             nop        
02936 90                             nop        
02937 90                             nop        
02938 c5f877                         vzeroupper 
0293b e8a0c5afff                     call       0x7f63db6ea760
02940 0f1f8400382a0026               nop        dword ptr [rax + rax + 0x26002a38]
02948 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02952 4883e4f0                       and        rsp, 0xfffffffffffffff0
02956 e82527b418                     call       0x7f63f4730900
0295b f4                             hlt        
0295c 4183c008                       add        r8d, 8
02960 be6effffff                     mov        esi, 0xffffff6e
02965 488b2c24                       mov        rbp, qword ptr [rsp]
02969 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0296e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02973 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02978 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0297d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02982 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02987 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0298c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02991 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02996 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0299b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
029a0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029a5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029aa 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029af 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
029b7 4489442464                     mov        dword ptr [rsp + 0x64], r8d
029bc 458bd3                         mov        r10d, r11d
029bf 4489542468                     mov        dword ptr [rsp + 0x68], r10d
029c4 89542470                       mov        dword ptr [rsp + 0x70], edx
029c8 c5f877                         vzeroupper 
029cb e810c5afff                     call       0x7f63db6ea760
029d0 0f1f8400c82a0027               nop        dword ptr [rax + rax + 0x27002ac8]
029d8 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
029e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e6 e89526b418                     call       0x7f63f4730900
029eb f4                             hlt        
029ec 4183c008                       add        r8d, 8
029f0 be66ffffff                     mov        esi, 0xffffff66
029f5 488b2c24                       mov        rbp, qword ptr [rsp]
029f9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
029fe 44895c2408                     mov        dword ptr [rsp + 8], r11d
02a03 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a0d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a12 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a17 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02a1c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02a21 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02a26 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a2b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02a30 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02a35 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02a3a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02a3f 4489442464                     mov        dword ptr [rsp + 0x64], r8d
02a44 448bd7                         mov        r10d, edi
02a47 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02a4c 89542470                       mov        dword ptr [rsp + 0x70], edx
02a50 c5f877                         vzeroupper 
02a53 e888c4afff                     call       0x7f63db6ea760
02a58 0f1f8400502b0028               nop        dword ptr [rax + rax + 0x28002b50]
02a60 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02a6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a6e e80d26b418                     call       0x7f63f4730900
02a73 f4                             hlt        
02a74 458bca                         mov        r9d, r10d
02a77 e9b3e8ffff                     jmp        0x7f63dbbecbaf
02a7c 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02a86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a8a e8f125b418                     call       0x7f63f4730900
02a8f f4                             hlt        
02a90 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a9e e8dd25b418                     call       0x7f63f4730900
02aa3 f4                             hlt        
02aa4 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ab2 e8c925b418                     call       0x7f63f4730900
02ab7 f4                             hlt        
02ab8 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ac6 e8b525b418                     call       0x7f63f4730900
02acb f4                             hlt        
02acc bee4ffffff                     mov        esi, 0xffffffe4
02ad1 488b2c24                       mov        rbp, qword ptr [rsp]
02ad5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02ada 44895c2408                     mov        dword ptr [rsp + 8], r11d
02adf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02ae4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ae9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02aee 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02af3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02af8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02afd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b02 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b07 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02b0c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02b11 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b16 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02b1b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02b20 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02b25 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02b2d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02b32 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02b37 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02b3c 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02b40 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02b45 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02b4a 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02b52 90                             nop        
02b53 90                             nop        
02b54 c5f877                         vzeroupper 
02b57 e884c3afff                     call       0x7f63db6ea760
02b5c 0f1f8400542c0029               nop        dword ptr [rax + rax + 0x29002c54]
02b64 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02b6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b72 e80925b418                     call       0x7f63f4730900
02b77 f4                             hlt        
02b78 bee4ffffff                     mov        esi, 0xffffffe4
02b7d 488b2c24                       mov        rbp, qword ptr [rsp]
02b81 4c891424                       mov        qword ptr [rsp], r10
02b85 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02b8a 4489542408                     mov        dword ptr [rsp + 8], r10d
02b8f 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
02b97 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b9c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02ba1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ba6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02bab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02bb0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02bb5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02bba 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02bbf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02bc4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02bc9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02bce 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bd3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02bd8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02bdd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02be2 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02bea 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02bef 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02bf4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02bf9 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02bfd 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02c02 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
02c0a c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02c13 90                             nop        
02c14 c5f877                         vzeroupper 
02c17 e8c4c2afff                     call       0x7f63db6ea760
02c1c 0f1f8400142d002a               nop        dword ptr [rax + rax + 0x2a002d14]
02c24 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02c2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c32 e84924b418                     call       0x7f63f4730900
02c37 f4                             hlt        
02c38 beccffffff                     mov        esi, 0xffffffcc
02c3d 488b2c24                       mov        rbp, qword ptr [rsp]
02c41 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02c46 4489542408                     mov        dword ptr [rsp + 8], r10d
02c4b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c55 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02c5a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02c5f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02c64 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02c69 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02c6e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02c73 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02c78 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02c7d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02c85 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02c8a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02c8f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02c94 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02c99 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02c9e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02ca6 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02cab 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02cb0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02cb5 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02cba 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
02cbf 90                             nop        
02cc0 c5f877                         vzeroupper 
02cc3 e818c2afff                     call       0x7f63db6ea760
02cc8 0f1f8400c02d002b               nop        dword ptr [rax + rax + 0x2b002dc0]
02cd0 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02cda 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cde e89d23b418                     call       0x7f63f4730900
02ce3 f4                             hlt        
02ce4 418bee                         mov        ebp, r14d
02ce7 83c510                         add        ebp, 0x10
02cea be6effffff                     mov        esi, 0xffffff6e
02cef 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02cf4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02cf9 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02cfe 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02d03 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d08 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02d0d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02d12 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02d17 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02d1c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02d21 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02d26 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02d2b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02d30 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02d38 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02d3d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02d42 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02d47 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02d4b 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02d52 90                             nop        
02d53 90                             nop        
02d54 c5f877                         vzeroupper 
02d57 e884c1afff                     call       0x7f63db6ea760
02d5c 0f1f8400542e002c               nop        dword ptr [rax + rax + 0x2c002e54]
02d64 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02d6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d72 e80923b418                     call       0x7f63f4730900
02d77 f4                             hlt        
02d78 418bee                         mov        ebp, r14d
02d7b 83c510                         add        ebp, 0x10
02d7e be66ffffff                     mov        esi, 0xffffff66
02d83 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02d88 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02d8d 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02d92 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02d97 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02d9c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02da1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02da6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02dab 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02db0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02db5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02dba 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02dbf 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02dc4 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02dcc 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02dd1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02dd6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02ddb 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02ddf 89842480000000                 mov        dword ptr [rsp + 0x80], eax
02de6 90                             nop        
02de7 90                             nop        
02de8 c5f877                         vzeroupper 
02deb e8f0c0afff                     call       0x7f63db6ea760
02df0 0f1f8400e82e002d               nop        dword ptr [rax + rax + 0x2d002ee8]
02df8 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02e02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e06 e87522b418                     call       0x7f63f4730900
02e0b f4                             hlt        
02e0c 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e1a e86122b418                     call       0x7f63f4730900
02e1f f4                             hlt        
02e20 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e2e e84d22b418                     call       0x7f63f4730900
02e33 f4                             hlt        
02e34 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e42 e83922b418                     call       0x7f63f4730900
02e47 f4                             hlt        
02e48 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e56 e82522b418                     call       0x7f63f4730900
02e5b f4                             hlt        
02e5c 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e6a e81122b418                     call       0x7f63f4730900
02e6f f4                             hlt        
02e70 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e7e e8fd21b418                     call       0x7f63f4730900
02e83 f4                             hlt        
02e84 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e92 e8e921b418                     call       0x7f63f4730900
02e97 f4                             hlt        
02e98 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02ea2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ea6 e8d521b418                     call       0x7f63f4730900
02eab f4                             hlt        
02eac 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eba e8c121b418                     call       0x7f63f4730900
02ebf f4                             hlt        
02ec0 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ece e8ad21b418                     call       0x7f63f4730900
02ed3 f4                             hlt        
02ed4 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ee2 e89921b418                     call       0x7f63f4730900
02ee7 f4                             hlt        
02ee8 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02ef2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ef6 e88521b418                     call       0x7f63f4730900
02efb f4                             hlt        
02efc 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02f06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f0a e87121b418                     call       0x7f63f4730900
02f0f f4                             hlt        
02f10 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02f1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f1e e85d21b418                     call       0x7f63f4730900
02f23 f4                             hlt        
02f24 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02f2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f32 e84921b418                     call       0x7f63f4730900
02f37 f4                             hlt        
02f38 48bf40251ab4637f0000           movabs     rdi, 0x7f63b41a2540
02f42 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f46 e83521b418                     call       0x7f63f4730900
02f4b f4                             hlt        
02f4c 488bf0                         mov        rsi, rax
02f4f eb0d                           jmp        0x7f63dbbee7de
02f51 488bf0                         mov        rsi, rax
02f54 eb08                           jmp        0x7f63dbbee7de
02f56 488bf0                         mov        rsi, rax
02f59 eb03                           jmp        0x7f63dbbee7de
02f5b 488bf0                         mov        rsi, rax
02f5e c5f877                         vzeroupper 
02f61 4881c4f0000000                 add        rsp, 0xf0
02f68 5d                             pop        rbp
02f69 e97247afff                     jmp        0x7f63db6e2f60
02f6e bef6ffffff                     mov        esi, 0xfffffff6
02f73 90                             nop        
02f74 c5f877                         vzeroupper 
02f77 e864bfafff                     call       0x7f63db6ea760
02f7c 0f1f84007430002e               nop        dword ptr [rax + rax + 0x2e003074]
02f84 48bf90b642b4637f0000           movabs     rdi, 0x7f63b442b690
02f8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f92 e8e920b418                     call       0x7f63f4730900
02f97 f4                             hlt        
02f98 49baa2c6bedb637f0000           movabs     r10, 0x7f63dbbec6a2
02fa2 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02fa9 e9327bb5ff                     jmp        0x7f63db746360
02fae e8ad49b4ff                     call       0x7f63db7331e0
02fb3 e976d0ffff                     jmp        0x7f63dbbeb8ae
