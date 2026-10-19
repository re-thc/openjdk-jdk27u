00000 e8fbc8ef17                     call       0x7efc93ad2c00
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
00028 0f85942d0000                   jne        0x7efc7bbd90c2
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
00097 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
0009d 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
000a4 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000ab 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
000b0 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000bc 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000c3 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
000c8 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cf 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000d7 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000db 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000e0 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e4 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
000ec 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000f3 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
000fb 488bfe                         mov        rdi, rsi
000fe c5f877                         vzeroupper 
00101 49ba7053c993fc7e0000           movabs     r10, 0x7efc93c95370
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f84a41a0000                   je         0x7efc7bbd7ec8
00124 458b1a                         mov        r11d, dword ptr [r10]
00127 41c1eb0d                       shr        r11d, 0xd
0012b 4181fb15040000                 cmp        r11d, 0x415
00132 0f8558250000                   jne        0x7efc7bbd8990
00138 4c891424                       mov        qword ptr [rsp], r10
0013c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00141 4d85d2                         test       r10, r10
00144 0f848a1a0000                   je         0x7efc7bbd7ed4
0014a 458b12                         mov        r10d, dword ptr [r10]
0014d 41c1ea0d                       shr        r10d, 0xd
00151 4181fa05010000                 cmp        r10d, 0x105
00158 0f8532250000                   jne        0x7efc7bbd8990
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f846b1a0000                   je         0x7efc7bbd7ee4
00179 458b1a                         mov        r11d, dword ptr [r10]
0017c 41c1eb0d                       shr        r11d, 0xd
00180 4181fb08010000                 cmp        r11d, 0x108
00187 0f8503250000                   jne        0x7efc7bbd8990
0018d 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00195 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019a 4d85d2                         test       r10, r10
0019d 0f84511a0000                   je         0x7efc7bbd7ef4
001a3 458b12                         mov        r10d, dword ptr [r10]
001a6 41c1ea0d                       shr        r10d, 0xd
001aa 4181fa07010000                 cmp        r10d, 0x107
001b1 0f85d9240000                   jne        0x7efc7bbd8990
001b7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f84321a0000                   je         0x7efc7bbd7f01
001cf 458b1a                         mov        r11d, dword ptr [r10]
001d2 41c1eb0d                       shr        r11d, 0xd
001d6 4181fb07010000                 cmp        r11d, 0x107
001dd 0f85ad240000                   jne        0x7efc7bbd8990
001e3 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001eb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f0 4d85d2                         test       r10, r10
001f3 0f84181a0000                   je         0x7efc7bbd7f11
001f9 458b12                         mov        r10d, dword ptr [r10]
001fc 41c1ea0d                       shr        r10d, 0xd
00200 4181fa05010000                 cmp        r10d, 0x105
00207 0f8583240000                   jne        0x7efc7bbd8990
0020d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00212 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00226 44895c2408                     mov        dword ptr [rsp + 8], r11d
0022b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00230 4585d2                         test       r10d, r10d
00233 0f8403240000                   je         0x7efc7bbd893c
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5204                       mov        r10d, dword ptr [r10 + 4]
00245 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0024a 4585d2                         test       r10d, r10d
0024d 0f86e9230000                   jbe        0x7efc7bbd893c
00253 4183fa01                       cmp        r10d, 1
00257 0f86df230000                   jbe        0x7efc7bbd893c
0025d 4183fa02                       cmp        r10d, 2
00261 0f86d5230000                   jbe        0x7efc7bbd893c
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00273 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00278 4183c3f1                       add        r11d, -0xf
0027c 4585db                         test       r11d, r11d
0027f 0f8cb7230000                   jl         0x7efc7bbd893c
00285 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0028d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00291 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00296 4183c2f1                       add        r10d, -0xf
0029a 4585d2                         test       r10d, r10d
0029d 0f8c99230000                   jl         0x7efc7bbd893c
002a3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002a8 4183c3f9                       add        r11d, -7
002ac 4585db                         test       r11d, r11d
002af 0f8c87230000                   jl         0x7efc7bbd893c
002b5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002ba 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002bf 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002c4 4183c3f1                       add        r11d, -0xf
002c8 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002d0 458d42f9                       lea        r8d, [r10 - 7]
002d4 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
002dc 4d63da                         movsxd     r11, r10d
002df 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
002e4 4183c2f1                       add        r10d, -0xf
002e8 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
002f0 4d8d53f9                       lea        r10, [r11 - 7]
002f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002f9 e967040000                     jmp        0x7efc7bbd6a65
002fe 448bd5                         mov        r10d, ebp
00301 4d63d2                         movsxd     r10, r10d
00304 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0030b c442a8f5db                     bzhi       r11, r11, r10
00310 c4c1fb92fb                     kmovq      k7, r11
00315 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0031b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00321 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00329 4403dd                         add        r11d, ebp
0032c 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00334 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00338 418502                         test       dword ptr [r10], eax
0033b 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00343 0f8d6f0a0000                   jge        0x7efc7bbd70b8
00349 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00350 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00358 442b9424c0000000               sub        r10d, dword ptr [rsp + 0xc0]
00360 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00368 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
0036f 2bac24c0000000                 sub        ebp, dword ptr [rsp + 0xc0]
00376 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
0037d 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00385 410f4fea                       cmovg      ebp, r10d
00389 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
00391 4585d2                         test       r10d, r10d
00394 0f8cd61a0000                   jl         0x7efc7bbd8170
0039a 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
003a2 4585c0                         test       r8d, r8d
003a5 0f8cc51a0000                   jl         0x7efc7bbd8170
003ab 458d1c2a                       lea        r11d, [r10 + rbp]
003af 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
003b4 453bcb                         cmp        r9d, r11d
003b7 0f82b31a0000                   jb         0x7efc7bbd8170
003bd 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c4 03dd                           add        ebx, ebp
003c6 443bcb                         cmp        r9d, ebx
003c9 0f82a11a0000                   jb         0x7efc7bbd8170
003cf 85ed                           test       ebp, ebp
003d1 0f8c991a0000                   jl         0x7efc7bbd8170
003d7 85ed                           test       ebp, ebp
003d9 0f8442ffffff                   je         0x7efc7bbd6621
003df 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
003e7 4b8d740308                     lea        rsi, [r11 + r8 + 8]
003ec 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
003f1 4863d5                         movsxd     rdx, ebp
003f4 4883fa20                       cmp        rdx, 0x20
003f8 0f8600ffffff                   jbe        0x7efc7bbd65fe
003fe c5f877                         vzeroupper 
00401 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
0040b 41ffd2                         call       r10
0040e 0f1f840000000000               nop        dword ptr [rax + rax]
00416 e906ffffff                     jmp        0x7efc7bbd6621
0041b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00423 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0042a 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
00431 4103da                         add        ebx, r10d
00434 e910030000                     jmp        0x7efc7bbd6a49
00439 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00441 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00449 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
0044e 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00453 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0045b 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00463 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0046b 4d63c2                         movsxd     r8, r10d
0046e 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00476 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
0047e 0f8ca9060000                   jl         0x7efc7bbd6e2d
00484 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0048c 4183fb30                       cmp        r11d, 0x30
00490 0f8ea0000000                   jle        0x7efc7bbd6836
00496 4585c9                         test       r9d, r9d
00499 0f8c35190000                   jl         0x7efc7bbd80d4
0049f 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004a7 4585db                         test       r11d, r11d
004aa 0f8c24190000                   jl         0x7efc7bbd80d4
004b0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
004b8 4503d1                         add        r10d, r9d
004bb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004c0 453bc2                         cmp        r8d, r10d
004c3 0f820b190000                   jb         0x7efc7bbd80d4
004c9 458bd0                         mov        r10d, r8d
004cc 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004d4 0f82fa180000                   jb         0x7efc7bbd80d4
004da 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004e2 4585db                         test       r11d, r11d
004e5 0f8450020000                   je         0x7efc7bbd6a3b
004eb 4963d3                         movsxd     rdx, r11d
004ee 4883fa20                       cmp        rdx, 0x20
004f2 7725                           ja         0x7efc7bbd6819
004f4 4d63d3                         movsxd     r10, r11d
004f7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004fe c442a8f5db                     bzhi       r11, r11, r10
00503 c4c1fb92fb                     kmovq      k7, r11
00508 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0050e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00514 e922020000                     jmp        0x7efc7bbd6a3b
00519 c5f877                         vzeroupper 
0051c 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00526 41ffd2                         call       r10
00529 0f1f840000000000               nop        dword ptr [rax + rax]
00531 e905020000                     jmp        0x7efc7bbd6a3b
00536 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
0053e 0f8340150000                   jae        0x7efc7bbd7d84
00544 4963d1                         movsxd     rdx, r9d
00547 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0054f 498b4c1208                     mov        rcx, qword ptr [r10 + rdx + 8]
00554 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0055c 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00564 0f83ba150000                   jae        0x7efc7bbd7e24
0056a 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00571 8d7b08                         lea        edi, [rbx + 8]
00574 4c63d3                         movsxd     r10, ebx
00577 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0057f 4b894c1308                     mov        qword ptr [r11 + r10 + 8], rcx
00584 3bbc24c8000000                 cmp        edi, dword ptr [rsp + 0xc8]
0058b 0f8daa010000                   jge        0x7efc7bbd6a3b
00591 492bd2                         sub        rdx, r10
00594 4c63df                         movsxd     r11, edi
00597 4d8d1413                       lea        r10, [r11 + rdx]
0059b 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005a0 0f837b160000                   jae        0x7efc7bbd7f21
005a6 4d8bd0                         mov        r10, r8
005a9 4d2bd3                         sub        r10, r11
005ac 4983c207                       add        r10, 7
005b0 4983e2f8                       and        r10, 0xfffffffffffffff8
005b4 458bd2                         mov        r10d, r10d
005b7 458d5c1a08                     lea        r11d, [r10 + rbx + 8]
005bc 4d63d3                         movsxd     r10, r11d
005bf 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
005c4 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005c9 0f8352160000                   jae        0x7efc7bbd7f21
005cf 3bbc24b0000000                 cmp        edi, dword ptr [rsp + 0xb0]
005d6 0f8345160000                   jae        0x7efc7bbd7f21
005dc 4983c2f8                       add        r10, -8
005e0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005e5 0f8336160000                   jae        0x7efc7bbd7f21
005eb 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005f3 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
005fa 0f8fbc160000                   jg         0x7efc7bbd7fbc
00600 442bcb                         sub        r9d, ebx
00603 83c310                         add        ebx, 0x10
00606 458d1439                       lea        r10d, [r9 + rdi]
0060a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00612 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00617 448bdf                         mov        r11d, edi
0061a 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00622 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
00627 448d5f08                       lea        r11d, [rdi + 8]
0062b 443bdb                         cmp        r11d, ebx
0062e 7d05                           jge        0x7efc7bbd6935
00630 418bfb                         mov        edi, r11d
00633 ebd1                           jmp        0x7efc7bbd6906
00635 4983c0f8                       add        r8, -8
00639 4981f800000080                 cmp        r8, -0x80000000
00640 49c7c200000080                 mov        r10, 0xffffffff80000000
00647 4d0f4cc2                       cmovl      r8, r10
0064b 458bd0                         mov        r10d, r8d
0064e 453bda                         cmp        r11d, r10d
00651 0f8d89000000                   jge        0x7efc7bbd69e0
00657 4d63c3                         movsxd     r8, r11d
0065a 4c03c2                         add        r8, rdx
0065d 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00662 0f83f4160000                   jae        0x7efc7bbd805c
00668 83c710                         add        edi, 0x10
0066b 4c63c7                         movsxd     r8, edi
0066e 4c03c2                         add        r8, rdx
00671 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00676 0f83f4160000                   jae        0x7efc7bbd8070
0067c 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00684 0f83fa160000                   jae        0x7efc7bbd8084
0068a 3bbc24b0000000                 cmp        edi, dword ptr [rsp + 0xb0]
00691 0f8301170000                   jae        0x7efc7bbd8098
00697 90                             nop        
00698 90                             nop        
00699 90                             nop        
0069a 90                             nop        
0069b 90                             nop        
0069c 90                             nop        
0069d 90                             nop        
0069e 90                             nop        
0069f 90                             nop        
006a0 478d0419                       lea        r8d, [r9 + r11]
006a4 418bdb                         mov        ebx, r11d
006a7 4863db                         movsxd     rbx, ebx
006aa 418bc8                         mov        ecx, r8d
006ad 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
006b5 488b7c0f08                     mov        rdi, qword ptr [rdi + rcx + 8]
006ba 4963c8                         movsxd     rcx, r8d
006bd 458bc3                         mov        r8d, r11d
006c0 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
006c8 4a897c0608                     mov        qword ptr [rsi + r8 + 8], rdi
006cd 4c8b440e10                     mov        r8, qword ptr [rsi + rcx + 0x10]
006d2 4c89441e10                     mov        qword ptr [rsi + rbx + 0x10], r8
006d7 4183c310                       add        r11d, 0x10
006db 453bda                         cmp        r11d, r10d
006de 7cc0                           jl         0x7efc7bbd69a0
006e0 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006e8 7d51                           jge        0x7efc7bbd6a3b
006ea 4d63d3                         movsxd     r10, r11d
006ed 4c03d2                         add        r10, rdx
006f0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
006f5 0f83b1160000                   jae        0x7efc7bbd80ac
006fb 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00703 0f83b7160000                   jae        0x7efc7bbd80c0
00709 90                             nop        
0070a 90                             nop        
0070b 90                             nop        
0070c 478d1419                       lea        r10d, [r9 + r11]
00710 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00718 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
0071d 458bd3                         mov        r10d, r11d
00720 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00728 4e89441108                     mov        qword ptr [rcx + r10 + 8], r8
0072d 4183c308                       add        r11d, 8
00731 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
00739 7cd1                           jl         0x7efc7bbd6a0c
0073b 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00742 039c24bc000000                 add        ebx, dword ptr [rsp + 0xbc]
00749 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0074e 41ffc3                         inc        r11d
00751 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00756 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0075a 418502                         test       dword ptr [r10], eax
0075d 448bb424c4000000               mov        r14d, dword ptr [rsp + 0xc4]
00765 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0076d 498d741a08                     lea        rsi, [r10 + rbx + 8]
00772 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00777 452bde                         sub        r11d, r14d
0077a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00782 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00787 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0078c 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00791 0f8d4f060000                   jge        0x7efc7bbd70e6
00797 443b542408                     cmp        r10d, dword ptr [rsp + 8]
0079c 0f839f0e0000                   jae        0x7efc7bbd7941
007a2 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
007aa 4f8b4cd008                     mov        r9, qword ptr [r8 + r10*8 + 8]
007af 458bd1                         mov        r10d, r9d
007b2 4181e2ffff0100                 and        r10d, 0x1ffff
007b9 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
007c1 4d8bd1                         mov        r10, r9
007c4 49c1ea12                       shr        r10, 0x12
007c8 49c1f924                       sar        r9, 0x24
007cc 458bc2                         mov        r8d, r10d
007cf 458bd1                         mov        r10d, r9d
007d2 418bd2                         mov        edx, r10d
007d5 4181e0ffff0300                 and        r8d, 0x3ffff
007dc 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
007e4 4585d2                         test       r10d, r10d
007e7 0f8c9f100000                   jl         0x7efc7bbd7b8c
007ed 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
007f5 4585d2                         test       r10d, r10d
007f8 0f8546020000                   jne        0x7efc7bbd6d44
007fe 4533d2                         xor        r10d, r10d
00801 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00809 448bd2                         mov        r10d, edx
0080c 4183fa03                       cmp        r10d, 3
00810 0f8e6a020000                   jle        0x7efc7bbd6d80
00816 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0081e 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00822 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0082a 45895310                       mov        dword ptr [r11 + 0x10], r10d
0082e 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00832 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0083a 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0083e 448d52fd                       lea        r10d, [rdx - 3]
00842 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0084a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00852 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0085a 45895a08                       mov        dword ptr [r10 + 8], r11d
0085e 4863ac24c0000000               movsxd     rbp, dword ptr [rsp + 0xc0]
00866 4c63c3                         movsxd     r8, ebx
00869 4c03442478                     add        r8, qword ptr [rsp + 0x78]
0086e 48639424b8000000               movsxd     rdx, dword ptr [rsp + 0xb8]
00876 4c03c2                         add        r8, rdx
00879 493be8                         cmp        rbp, r8
0087c 0f8f76100000                   jg         0x7efc7bbd7bf8
00882 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0088a 4585d2                         test       r10d, r10d
0088d 0f8ec50f0000                   jle        0x7efc7bbd7b58
00893 448beb                         mov        r13d, ebx
00896 4403ac24b8000000               add        r13d, dword ptr [rsp + 0xb8]
0089e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008a6 4503d5                         add        r10d, r13d
008a9 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
008ae 0f8fcc100000                   jg         0x7efc7bbd7c80
008b4 458bde                         mov        r11d, r14d
008b7 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
008bf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
008c7 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
008cf 0f8f23110000                   jg         0x7efc7bbd7cf8
008d5 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
008dd 4183fa10                       cmp        r10d, 0x10
008e1 0f8f84050000                   jg         0x7efc7bbd716b
008e7 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
008ef 0f83b70d0000                   jae        0x7efc7bbd79ac
008f5 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
008fd c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00904 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
0090b 0f83230e0000                   jae        0x7efc7bbd7a34
00911 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00919 4503d6                         add        r10d, r14d
0091c 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00924 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0092c c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00933 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0093b 4403d3                         add        r10d, ebx
0093e 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00946 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
0094e 442b8c24c0000000               sub        r9d, dword ptr [rsp + 0xc0]
00956 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0095e 4183fa10                       cmp        r10d, 0x10
00962 0f8fd1faffff                   jg         0x7efc7bbd6739
00968 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00970 4183fb10                       cmp        r11d, 0x10
00974 0f8cbffaffff                   jl         0x7efc7bbd6739
0097a 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
00982 0f83580e0000                   jae        0x7efc7bbd7ae0
00988 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00990 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00997 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0099f 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
009a7 0f826efaffff                   jb         0x7efc7bbd671b
009ad bee4ffffff                     mov        esi, 0xffffffe4
009b2 488b2c24                       mov        rbp, qword ptr [rsp]
009b6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009bb 44895c2408                     mov        dword ptr [rsp + 8], r11d
009c0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009c5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009ca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009cf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
009d4 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
009d9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
009de 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
009e3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
009e8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
009f0 4c89542450                     mov        qword ptr [rsp + 0x50], r10
009f5 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
009fa 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
009ff 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00a07 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00a0c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00a11 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00a16 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00a1f 90                             nop        
00a20 c5f877                         vzeroupper 
00a23 e8386dafff                     call       0x7efc7b6cda60
00a28 0f1f8400200b0002               nop        dword ptr [rax + rax + 0x2000b20]
00a30 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
00a3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a3e e89de7cc17                     call       0x7efc938a54e0
00a43 f4                             hlt        
00a44 453bd3                         cmp        r10d, r11d
00a47 0f8ebcfdffff                   jle        0x7efc7bbd6b09
00a4d be45ffffff                     mov        esi, 0xffffff45
00a52 418bea                         mov        ebp, r10d
00a55 44891c24                       mov        dword ptr [rsp], r11d
00a59 90                             nop        
00a5a 90                             nop        
00a5b 90                             nop        
00a5c c5f877                         vzeroupper 
00a5f e8fc6cafff                     call       0x7efc7b6cda60
00a64 0f1f84005c0b0003               nop        dword ptr [rax + rax + 0x3000b5c]
00a6c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
00a76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a7a e861e7cc17                     call       0x7efc938a54e0
00a7f f4                             hlt        
00a80 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00a88 4585d2                         test       r10d, r10d
00a8b 7407                           je         0x7efc7bbd6d94
00a8d 448d52ff                       lea        r10d, [rdx - 1]
00a91 418bd2                         mov        edx, r10d
00a94 85d2                           test       edx, edx
00a96 747c                           je         0x7efc7bbd6e14
00a98 83fa03                         cmp        edx, 3
00a9b 0f84db160000                   je         0x7efc7bbd847c
00aa1 83fa02                         cmp        edx, 2
00aa4 0f875e170000                   ja         0x7efc7bbd8508
00aaa 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00aae 0f839c150000                   jae        0x7efc7bbd8350
00ab4 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00abc 458b4c9308                     mov        r9d, dword ptr [r11 + rdx*4 + 8]
00ac1 85d2                           test       edx, edx
00ac3 7e41                           jle        0x7efc7bbd6e06
00ac5 448d5aff                       lea        r11d, [rdx - 1]
00ac9 443b5c240c                     cmp        r11d, dword ptr [rsp + 0xc]
00ace 0f8318160000                   jae        0x7efc7bbd83ec
00ad4 90                             nop        
00ad5 90                             nop        
00ad6 90                             nop        
00ad7 90                             nop        
00ad8 90                             nop        
00ad9 90                             nop        
00ada 90                             nop        
00adb 90                             nop        
00adc 90                             nop        
00add 90                             nop        
00ade 90                             nop        
00adf 90                             nop        
00ae0 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00ae8 458b549304                     mov        r10d, dword ptr [r11 + rdx*4 + 4]
00aed 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00af5 4589549008                     mov        dword ptr [r8 + rdx*4 + 8], r10d
00afa 448d52ff                       lea        r10d, [rdx - 1]
00afe 418bd2                         mov        edx, r10d
00b01 4585d2                         test       r10d, r10d
00b04 7fda                           jg         0x7efc7bbd6de0
00b06 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b0e 45894a08                       mov        dword ptr [r10 + 8], r9d
00b12 eb0c                           jmp        0x7efc7bbd6e20
00b14 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b1c 458b4a08                       mov        r9d, dword ptr [r10 + 8]
00b20 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
00b28 e931fdffff                     jmp        0x7efc7bbd6b5e
00b2d 4183fa10                       cmp        r10d, 0x10
00b31 0f8da11a0000                   jge        0x7efc7bbd88d8
00b37 4183fa08                       cmp        r10d, 8
00b3b 0f8da1040000                   jge        0x7efc7bbd72e2
00b41 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b49 4183fa10                       cmp        r10d, 0x10
00b4d 0f8ec0000000                   jle        0x7efc7bbd6f13
00b53 4585c9                         test       r9d, r9d
00b56 0f8ce0190000                   jl         0x7efc7bbd883c
00b5c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b64 4585db                         test       r11d, r11d
00b67 0f8ccf190000                   jl         0x7efc7bbd883c
00b6d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00b72 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00b7a 0f82bc190000                   jb         0x7efc7bbd883c
00b80 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00b88 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00b90 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00b98 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b9d 453bda                         cmp        r11d, r10d
00ba0 0f8296190000                   jb         0x7efc7bbd883c
00ba6 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00bae 4585db                         test       r11d, r11d
00bb1 0f8c85190000                   jl         0x7efc7bbd883c
00bb7 4585db                         test       r11d, r11d
00bba 0f8490f7ffff                   je         0x7efc7bbd6650
00bc0 4883fd20                       cmp        rbp, 0x20
00bc4 772d                           ja         0x7efc7bbd6ef3
00bc6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00bce 4d63d2                         movsxd     r10, r10d
00bd1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bd8 c442a8f5db                     bzhi       r11, r11, r10
00bdd c4c1fb92fb                     kmovq      k7, r11
00be2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00be8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bee e95df7ffff                     jmp        0x7efc7bbd6650
00bf3 488bd5                         mov        rdx, rbp
00bf6 c5f877                         vzeroupper 
00bf9 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00c03 41ffd2                         call       r10
00c06 0f1f840000000000               nop        dword ptr [rax + rax]
00c0e e93df7ffff                     jmp        0x7efc7bbd6650
00c13 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00c18 0f8376160000                   jae        0x7efc7bbd8594
00c1e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c26 430fbe6c0a08                   movsx      ebp, byte ptr [r10 + r9 + 8]
00c2c 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c34 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c39 0f83f5160000                   jae        0x7efc7bbd8634
00c3f 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c47 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c4f 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00c54 458d5903                       lea        r11d, [r9 + 3]
00c58 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c60 41ffc2                         inc        r10d
00c63 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00c6b 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c70 0f8342170000                   jae        0x7efc7bbd86b8
00c76 4d63d9                         movsxd     r11, r9d
00c79 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c81 430fbe6c1a09                   movsx      ebp, byte ptr [r10 + r11 + 9]
00c87 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c8f 4183c203                       add        r10d, 3
00c93 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c98 0f83a2170000                   jae        0x7efc7bbd8740
00c9e 4c638424b8000000               movsxd     r8, dword ptr [rsp + 0xb8]
00ca6 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00cae 43886c0209                     mov        byte ptr [r10 + r8 + 9], bpl
00cb3 470fbe541a0a                   movsx      r10d, byte ptr [r10 + r11 + 0xa]
00cb9 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
00cc1 468854010a                     mov        byte ptr [rcx + r8 + 0xa], r10b
00cc6 460fbe5c190b                   movsx      r11d, byte ptr [rcx + r11 + 0xb]
00ccc 46885c010b                     mov        byte ptr [rcx + r8 + 0xb], r11b
00cd1 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00cd9 4183fa08                       cmp        r10d, 8
00cdd 0f83d5170000                   jae        0x7efc7bbd87b8
00ce3 49bb20ae28e300000000           movabs     r11, 0xe328ae20
00ced 47034c9308                     add        r9d, dword ptr [r11 + r10*4 + 8]
00cf2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cf7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00cff 4183fb04                       cmp        r11d, 4
00d03 7e43                           jle        0x7efc7bbd7048
00d05 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d0c 83c504                         add        ebp, 4
00d0f 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d17 418bd1                         mov        edx, r9d
00d1a 90                             nop        
00d1b 90                             nop        
00d1c c5f877                         vzeroupper 
00d1f e83c8cb5ff                     call       0x7efc7b72fc60
00d24 0f1f84001c0e0004               nop        dword ptr [rax + rax + 0x4000e1c]
00d2c 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d34 8bd5                           mov        edx, ebp
00d36 8bc8                           mov        ecx, eax
00d38 c5f877                         vzeroupper 
00d3b e8208cb5ff                     call       0x7efc7b72fc60
00d40 0f1f8400380e0005               nop        dword ptr [rax + rax + 0x5000e38]
00d48 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00d50 4183fa08                       cmp        r10d, 8
00d54 7e62                           jle        0x7efc7bbd70b8
00d56 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d5a 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00d64 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d6c 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00d71 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d78 83c508                         add        ebp, 8
00d7b 83c208                         add        edx, 8
00d7e 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d86 90                             nop        
00d87 90                             nop        
00d88 c5f877                         vzeroupper 
00d8b e8d08bb5ff                     call       0x7efc7b72fc60
00d90 0f1f8400880e0006               nop        dword ptr [rax + rax + 0x6000e88]
00d98 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00da0 8bd5                           mov        edx, ebp
00da2 488bc8                         mov        rcx, rax
00da5 90                             nop        
00da6 90                             nop        
00da7 90                             nop        
00da8 c5f877                         vzeroupper 
00dab e8b08bb5ff                     call       0x7efc7b72fc60
00db0 0f1f8400a80e0007               nop        dword ptr [rax + rax + 0x7000ea8]
00db8 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00dbf e985f9ffff                     jmp        0x7efc7bbd6a49
00dc4 4d63d3                         movsxd     r10, r11d
00dc7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dce c442a8f5db                     bzhi       r11, r11, r10
00dd3 c4c1fb92fb                     kmovq      k7, r11
00dd8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dde 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de4 eb67                           jmp        0x7efc7bbd714d
00de6 4585f6                         test       r14d, r14d
00de9 0f8ce1180000                   jl         0x7efc7bbd89d0
00def 85db                           test       ebx, ebx
00df1 0f8cd9180000                   jl         0x7efc7bbd89d0
00df7 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dfc 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00e01 0f82c9180000                   jb         0x7efc7bbd89d0
00e07 428d2c1b                       lea        ebp, [rbx + r11]
00e0b 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00e10 443bc5                         cmp        r8d, ebp
00e13 0f82b7180000                   jb         0x7efc7bbd89d0
00e19 4585db                         test       r11d, r11d
00e1c 0f8cae180000                   jl         0x7efc7bbd89d0
00e22 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e27 453bd6                         cmp        r10d, r14d
00e2a 7421                           je         0x7efc7bbd714d
00e2c 4963d3                         movsxd     rdx, r11d
00e2f 4883fa20                       cmp        rdx, 0x20
00e33 768f                           jbe        0x7efc7bbd70c4
00e35 c5f877                         vzeroupper 
00e38 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00e42 41ffd2                         call       r10
00e45 0f1f840000000000               nop        dword ptr [rax + rax]
00e4d 4c8b1424                       mov        r10, qword ptr [rsp]
00e51 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e55 c5f877                         vzeroupper 
00e58 4881c400010000                 add        rsp, 0x100
00e5f 5d                             pop        rbp
00e60 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e64 0f87421f0000                   ja         0x7efc7bbd90ac
00e6a c3                             ret        
00e6b 4183fa30                       cmp        r10d, 0x30
00e6f 0f8e8c000000                   jle        0x7efc7bbd7201
00e75 4585f6                         test       r14d, r14d
00e78 0f8c121c0000                   jl         0x7efc7bbd8d90
00e7e 85db                           test       ebx, ebx
00e80 0f8c0a1c0000                   jl         0x7efc7bbd8d90
00e86 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e8b 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00e93 0f82f71b0000                   jb         0x7efc7bbd8d90
00e99 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e9e 453bdd                         cmp        r11d, r13d
00ea1 0f82e91b0000                   jb         0x7efc7bbd8d90
00ea7 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00eaf 4585d2                         test       r10d, r10d
00eb2 7426                           je         0x7efc7bbd71da
00eb4 4883fa20                       cmp        rdx, 0x20
00eb8 772d                           ja         0x7efc7bbd71e7
00eba 4d63d2                         movsxd     r10, r10d
00ebd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ec4 c442a8f5db                     bzhi       r11, r11, r10
00ec9 c4c1fb92fb                     kmovq      k7, r11
00ece 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ed4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00eda 4489ac24b8000000               mov        dword ptr [rsp + 0xb8], r13d
00ee2 e95ffaffff                     jmp        0x7efc7bbd6c46
00ee7 c5f877                         vzeroupper 
00eea 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00ef4 41ffd2                         call       r10
00ef7 0f1f840000000000               nop        dword ptr [rax + rax]
00eff ebd9                           jmp        0x7efc7bbd71da
00f01 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00f09 0f833d1a0000                   jae        0x7efc7bbd8c4c
00f0f 4d63ce                         movsxd     r9, r14d
00f12 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f1a c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00f21 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
00f28 0f83be1a0000                   jae        0x7efc7bbd8cec
00f2e 448d5310                       lea        r10d, [rbx + 0x10]
00f32 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00f3a 4c63db                         movsxd     r11, ebx
00f3d 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00f45 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00f4c 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00f54 453bd5                         cmp        r10d, r13d
00f57 0f8dc4060000                   jge        0x7efc7bbd7921
00f5d 4d2bcb                         sub        r9, r11
00f60 4d63da                         movsxd     r11, r10d
00f63 486354241c                     movsxd     rdx, dword ptr [rsp + 0x1c]
00f68 4883c2f1                       add        rdx, -0xf
00f6c 4f8d040b                       lea        r8, [r11 + r9]
00f70 4c3bc2                         cmp        r8, rdx
00f73 0f83b71b0000                   jae        0x7efc7bbd8e30
00f79 4963cd                         movsxd     rcx, r13d
00f7c 4c8bc1                         mov        r8, rcx
00f7f 4d2bc3                         sub        r8, r11
00f82 4983c00f                       add        r8, 0xf
00f86 4983e0f0                       and        r8, 0xfffffffffffffff0
00f8a 458bd8                         mov        r11d, r8d
00f8d 458d441b10                     lea        r8d, [r11 + rbx + 0x10]
00f92 4d63d8                         movsxd     r11, r8d
00f95 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
00f9a 4c3bc2                         cmp        r8, rdx
00f9d 0f838d1b0000                   jae        0x7efc7bbd8e30
00fa3 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
00fab 0f837f1b0000                   jae        0x7efc7bbd8e30
00fb1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fb6 4983c2f1                       add        r10, -0xf
00fba 4983c3f0                       add        r11, -0x10
00fbe 4d3bda                         cmp        r11, r10
00fc1 0f83691b0000                   jae        0x7efc7bbd8e30
00fc7 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00fce 0f8fd41b0000                   jg         0x7efc7bbd8ea8
00fd4 458bd6                         mov        r10d, r14d
00fd7 442bd3                         sub        r10d, ebx
00fda 83c320                         add        ebx, 0x20
00fdd e919040000                     jmp        0x7efc7bbd76fb
00fe2 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
00fea 0f831c170000                   jae        0x7efc7bbd8a0c
00ff0 4963f9                         movsxd     rdi, r9d
00ff3 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00ffb 4d8b543a08                     mov        r10, qword ptr [r10 + rdi + 8]
01000 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01008 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01010 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01018 0f8382170000                   jae        0x7efc7bbd8aa0
0101e 418d6b08                       lea        ebp, [r11 + 8]
01022 4d63d3                         movsxd     r10, r11d
01025 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
0102d 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
01035 4a895c1108                     mov        qword ptr [rcx + r10 + 8], rbx
0103a 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01041 0f8da0030000                   jge        0x7efc7bbd76e7
01047 492bfa                         sub        rdi, r10
0104a 4863d5                         movsxd     rdx, ebp
0104d 4c8d143a                       lea        r10, [rdx + rdi]
01051 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01056 0f83c8170000                   jae        0x7efc7bbd8b24
0105c 4d8bd0                         mov        r10, r8
0105f 4c2bd2                         sub        r10, rdx
01062 4983c207                       add        r10, 7
01066 4983e2f8                       and        r10, 0xfffffffffffffff8
0106a 418bca                         mov        ecx, r10d
0106d 468d541908                     lea        r10d, [rcx + r11 + 8]
01072 4d63d2                         movsxd     r10, r10d
01075 498d4c3af8                     lea        rcx, [r10 + rdi - 8]
0107a 483b4c2438                     cmp        rcx, qword ptr [rsp + 0x38]
0107f 0f839f170000                   jae        0x7efc7bbd8b24
01085 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
0108c 0f8392170000                   jae        0x7efc7bbd8b24
01092 4983c2f8                       add        r10, -8
01096 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0109b 0f8383170000                   jae        0x7efc7bbd8b24
010a1 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
010a9 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
010b0 0f8fd6170000                   jg         0x7efc7bbd8b8c
010b6 452bcb                         sub        r9d, r11d
010b9 b8f8ffffff                     mov        eax, 0xfffffff8
010be 418d4b10                       lea        ecx, [r11 + 0x10]
010c2 4d8d50c8                       lea        r10, [r8 - 0x38]
010c6 4981fa00000080                 cmp        r10, -0x80000000
010cd 48c7c300000080                 mov        rbx, 0xffffffff80000000
010d4 4c0f4cd3                       cmovl      r10, rbx
010d8 418bda                         mov        ebx, r10d
010db 4c63e9                         movsxd     r13, ecx
010de 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
010e6 458bd2                         mov        r10d, r10d
010e9 412bc2                         sub        eax, r10d
010ec 412bc3                         sub        eax, r11d
010ef 83c0f0                         add        eax, -0x10
010f2 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
010fa 498bf2                         mov        rsi, r10
010fd 41bb06000000                   mov        r11d, 6
01103 c462a0f5d0                     bzhi       r10, rax, r11
01108 4d03ea                         add        r13, r10
0110b 4d3be8                         cmp        r13, r8
0110e 498bc0                         mov        rax, r8
01111 490f4cc5                       cmovl      rax, r13
01115 4c8bd0                         mov        r10, rax
01118 4c2bd2                         sub        r10, rdx
0111b 4d8d5aff                       lea        r11, [r10 - 1]
0111f 49c1fb3f                       sar        r11, 0x3f
01123 49c1eb3d                       shr        r11, 0x3d
01127 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
0112c 4983e2f8                       and        r10, 0xfffffffffffffff8
01130 4c03d2                         add        r10, rdx
01133 493bd2                         cmp        rdx, r10
01136 490f4cd2                       cmovl      rdx, r10
0113a 448bd2                         mov        r10d, edx
0113d 458d5a08                       lea        r11d, [r10 + 8]
01141 442b9424c0000000               sub        r10d, dword ptr [rsp + 0xc0]
01149 4d63eb                         movsxd     r13, r11d
0114c 4c03ee                         add        r13, rsi
0114f 4183c208                       add        r10d, 8
01153 4d63da                         movsxd     r11, r10d
01156 4c03de                         add        r11, rsi
01159 498d5548                       lea        rdx, [r13 + 0x48]
0115d 4983c508                       add        r13, 8
01161 498d7308                       lea        rsi, [r11 + 8]
01165 4533d2                         xor        r10d, r10d
01168 483bd6                         cmp        rdx, rsi
0116b 410f96c2                       setbe      r10b
0116f 4983c348                       add        r11, 0x48
01173 498bf3                         mov        rsi, r11
01176 4533db                         xor        r11d, r11d
01179 493bf5                         cmp        rsi, r13
0117c 410f96c3                       setbe      r11b
01180 450bd3                         or         r10d, r11d
01183 0f846a0d0000                   je         0x7efc7bbd81f3
01189 448bd0                         mov        r10d, eax
0118c eb05                           jmp        0x7efc7bbd7493
0118e 90                             nop        
0118f 90                             nop        
01190 418beb                         mov        ebp, r11d
01193 8bcd                           mov        ecx, ebp
01195 458d1c29                       lea        r11d, [r9 + rbp]
01199 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
011a1 4e8b5c1a08                     mov        r11, qword ptr [rdx + r11 + 8]
011a6 4c895c0a08                     mov        qword ptr [rdx + rcx + 8], r11
011ab 448d5d08                       lea        r11d, [rbp + 8]
011af 453bda                         cmp        r11d, r10d
011b2 7cdc                           jl         0x7efc7bbd7490
011b4 4981c008feffff                 add        r8, -0x1f8
011bb 4981f800000080                 cmp        r8, -0x80000000
011c2 49c7c200000080                 mov        r10, 0xffffffff80000000
011c9 4d0f4cc2                       cmovl      r8, r10
011cd 418bc8                         mov        ecx, r8d
011d0 443bd9                         cmp        r11d, ecx
011d3 0f8d1b170000                   jge        0x7efc7bbd8bf4
011d9 4d63d3                         movsxd     r10, r11d
011dc 4c03d7                         add        r10, rdi
011df 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
011e4 0f8312170000                   jae        0x7efc7bbd8bfc
011ea 81c500020000                   add        ebp, 0x200
011f0 4c63d5                         movsxd     r10, ebp
011f3 4c03d7                         add        r10, rdi
011f6 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
011fb 0f830f170000                   jae        0x7efc7bbd8c10
01201 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01209 0f8315170000                   jae        0x7efc7bbd8c24
0120f 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
01216 0f831c170000                   jae        0x7efc7bbd8c38
0121c 48897c2440                     mov        qword ptr [rsp + 0x40], rdi
01221 eb10                           jmp        0x7efc7bbd7533
01223 90                             nop        
01224 90                             nop        
01225 90                             nop        
01226 90                             nop        
01227 90                             nop        
01228 90                             nop        
01229 90                             nop        
0122a 90                             nop        
0122b 90                             nop        
0122c 90                             nop        
0122d 90                             nop        
0122e 90                             nop        
0122f 90                             nop        
01230 458bd8                         mov        r11d, r8d
01233 458d9300010000                 lea        r10d, [r11 + 0x100]
0123a 4503d1                         add        r10d, r9d
0123d 418d8380000000                 lea        eax, [r11 + 0x80]
01244 4103c1                         add        eax, r9d
01247 418bfa                         mov        edi, r10d
0124a 4d63c2                         movsxd     r8, r10d
0124d 8bf0                           mov        esi, eax
0124f 4c63e8                         movsxd     r13, eax
01252 418bd3                         mov        edx, r11d
01255 438d2c19                       lea        ebp, [r9 + r11]
01259 458bd3                         mov        r10d, r11d
0125c 4d63d2                         movsxd     r10, r10d
0125f 8bc5                           mov        eax, ebp
01261 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
01269 62d17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 8]
01274 62d17e487f841608000000         vmovdqu32  zmmword ptr [r14 + rdx + 8], zmm0
0127f 4863c5                         movsxd     rax, ebp
01282 62d17e486f840648000000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x48]
0128d 62917e487f841648000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x48], zmm0
01298 62d17e486f843608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 8]
012a3 62917e487f841688000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x88], zmm0
012ae 62917e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + r13 + 0x48]
012b9 62917e487f8416c8000000         vmovdqu32  zmmword ptr [r14 + r10 + 0xc8], zmm0
012c4 62d17e486f843e08000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdi + 8]
012cf 62917e487f841608010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x108], zmm0
012da 62917e486f840648000000         vmovdqu32  zmm0, zmmword ptr [r14 + r8 + 0x48]
012e5 62917e487f841648010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x148], zmm0
012f0 62d17e486f840688010000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x188]
012fb 62917e487f841688010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x188], zmm0
01306 62d17e486f8406c8010000         vmovdqu32  zmm0, zmmword ptr [r14 + rax + 0x1c8]
01311 62917e487f8416c8010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x1c8], zmm0
0131c 458d8300020000                 lea        r8d, [r11 + 0x200]
01323 443bc1                         cmp        r8d, ecx
01326 0f8c04ffffff                   jl         0x7efc7bbd7530
0132c 443bc3                         cmp        r8d, ebx
0132f 7d59                           jge        0x7efc7bbd768a
01331 4181c338020000                 add        r11d, 0x238
01338 4d63d3                         movsxd     r10, r11d
0133b 4c03542440                     add        r10, qword ptr [rsp + 0x40]
01340 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01345 0f8325190000                   jae        0x7efc7bbd8f70
0134b 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01353 0f833f190000                   jae        0x7efc7bbd8f98
01359 90                             nop        
0135a 90                             nop        
0135b 90                             nop        
0135c 458bd8                         mov        r11d, r8d
0135f 478d1401                       lea        r10d, [r9 + r8]
01363 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
0136b 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
01376 62b17e487f841908000000         vmovdqu32  zmmword ptr [rcx + r11 + 8], zmm0
01381 4183c040                       add        r8d, 0x40
01385 443bc3                         cmp        r8d, ebx
01388 7cd2                           jl         0x7efc7bbd765c
0138a 488b7c2440                     mov        rdi, qword ptr [rsp + 0x40]
0138f 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
01397 7d4e                           jge        0x7efc7bbd76e7
01399 4d63d0                         movsxd     r10, r8d
0139c 4c03d7                         add        r10, rdi
0139f 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
013a4 0f83da180000                   jae        0x7efc7bbd8f84
013aa 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
013b2 0f83f4180000                   jae        0x7efc7bbd8fac
013b8 478d1401                       lea        r10d, [r9 + r8]
013bc 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
013c4 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
013c9 458bd8                         mov        r11d, r8d
013cc 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
013d4 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
013d9 4183c008                       add        r8d, 8
013dd 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
013e5 7cd1                           jl         0x7efc7bbd76b8
013e7 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
013ee e956f3ffff                     jmp        0x7efc7bbd6a49
013f3 90                             nop        
013f4 89bc24c4000000                 mov        dword ptr [rsp + 0xc4], edi
013fb 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
01403 458bda                         mov        r11d, r10d
01406 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
0140e 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
01416 c4a17a6f441f08                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 8]
0141d 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01425 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0142c 8bbc24c4000000                 mov        edi, dword ptr [rsp + 0xc4]
01433 83c710                         add        edi, 0x10
01436 3bfb                           cmp        edi, ebx
01438 7cba                           jl         0x7efc7bbd76f4
0143a 4881c110ffffff                 add        rcx, -0xf0
01441 4881f900000080                 cmp        rcx, -0x80000000
01448 49c7c300000080                 mov        r11, 0xffffffff80000000
0144f 490f4ccb                       cmovl      rcx, r11
01453 448bc1                         mov        r8d, ecx
01456 413bf8                         cmp        edi, r8d
01459 0f8d72010000                   jge        0x7efc7bbd78d1
0145f 4c63df                         movsxd     r11, edi
01462 4d03d9                         add        r11, r9
01465 4c3bda                         cmp        r11, rdx
01468 0f83b2170000                   jae        0x7efc7bbd8f20
0146e 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
01476 4181c300010000                 add        r11d, 0x100
0147d 4963cb                         movsxd     rcx, r11d
01480 4903c9                         add        rcx, r9
01483 483bca                         cmp        rcx, rdx
01486 0f83a8170000                   jae        0x7efc7bbd8f34
0148c 3bbc24b4000000                 cmp        edi, dword ptr [rsp + 0xb4]
01493 0f83af170000                   jae        0x7efc7bbd8f48
01499 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
014a1 0f83b5170000                   jae        0x7efc7bbd8f5c
014a7 90                             nop        
014a8 90                             nop        
014a9 90                             nop        
014aa 90                             nop        
014ab 90                             nop        
014ac 90                             nop        
014ad 90                             nop        
014ae 90                             nop        
014af 90                             nop        
014b0 448bdf                         mov        r11d, edi
014b3 4963db                         movsxd     rbx, r11d
014b6 458d1c3a                       lea        r11d, [r10 + rdi]
014ba 8bcf                           mov        ecx, edi
014bc 418bf3                         mov        esi, r11d
014bf 488b842498000000               mov        rax, qword ptr [rsp + 0x98]
014c7 c5fa6f443008                   vmovdqu    xmm0, xmmword ptr [rax + rsi + 8]
014cd 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
014d5 c5fa7f440e08                   vmovdqu    xmmword ptr [rsi + rcx + 8], xmm0
014db 4963cb                         movsxd     rcx, r11d
014de c5fa6f440818                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x18]
014e4 c5fa7f441e18                   vmovdqu    xmmword ptr [rsi + rbx + 0x18], xmm0
014ea c5fa6f440828                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x28]
014f0 c5fa7f441e28                   vmovdqu    xmmword ptr [rsi + rbx + 0x28], xmm0
014f6 c5fa6f440838                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x38]
014fc c5fa7f441e38                   vmovdqu    xmmword ptr [rsi + rbx + 0x38], xmm0
01502 c5fa6f440848                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x48]
01508 c5fa7f441e48                   vmovdqu    xmmword ptr [rsi + rbx + 0x48], xmm0
0150e c5fa6f440858                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x58]
01514 c5fa7f441e58                   vmovdqu    xmmword ptr [rsi + rbx + 0x58], xmm0
0151a c5fa6f440868                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x68]
01520 c5fa7f441e68                   vmovdqu    xmmword ptr [rsi + rbx + 0x68], xmm0
01526 c5fa6f440878                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x78]
0152c c5fa7f441e78                   vmovdqu    xmmword ptr [rsi + rbx + 0x78], xmm0
01532 c5fa6f840888000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x88]
0153b c5fa7f841e88000000             vmovdqu    xmmword ptr [rsi + rbx + 0x88], xmm0
01544 c5fa6f840898000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x98]
0154d c5fa7f841e98000000             vmovdqu    xmmword ptr [rsi + rbx + 0x98], xmm0
01556 c5fa6f8408a8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xa8]
0155f c5fa7f841ea8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xa8], xmm0
01568 c5fa6f8408b8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xb8]
01571 c5fa7f841eb8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xb8], xmm0
0157a c5fa6f8408c8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xc8]
01583 c5fa7f841ec8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xc8], xmm0
0158c c5fa6f8408d8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xd8]
01595 c5fa7f841ed8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xd8], xmm0
0159e c5fa6f8408e8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xe8]
015a7 c5fa7f841ee8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xe8], xmm0
015b0 c5fa6f8408f8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xf8]
015b9 c5fa7f841ef8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xf8], xmm0
015c2 81c700010000                   add        edi, 0x100
015c8 413bf8                         cmp        edi, r8d
015cb 0f8cdffeffff                   jl         0x7efc7bbd77b0
015d1 413bfd                         cmp        edi, r13d
015d4 7d4b                           jge        0x7efc7bbd7921
015d6 4c63df                         movsxd     r11, edi
015d9 4d03d9                         add        r11, r9
015dc 4c3bda                         cmp        r11, rdx
015df 0f83db160000                   jae        0x7efc7bbd8fc0
015e5 3bbc24b4000000                 cmp        edi, dword ptr [rsp + 0xb4]
015ec 0f83e2160000                   jae        0x7efc7bbd8fd4
015f2 90                             nop        
015f3 90                             nop        
015f4 458d043a                       lea        r8d, [r10 + rdi]
015f8 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01600 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
01607 448bdf                         mov        r11d, edi
0160a 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01612 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
01619 83c710                         add        edi, 0x10
0161c 413bfd                         cmp        edi, r13d
0161f 7cd3                           jl         0x7efc7bbd78f4
01621 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01629 4503d6                         add        r10d, r14d
0162c 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01634 4489ac24b8000000               mov        dword ptr [rsp + 0xb8], r13d
0163c e905f3ffff                     jmp        0x7efc7bbd6c46
01641 bee4ffffff                     mov        esi, 0xffffffe4
01646 488b2c24                       mov        rbp, qword ptr [rsp]
0164a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0164f 4489542408                     mov        dword ptr [rsp + 8], r10d
01654 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01659 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0165e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01663 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01668 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0166c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01671 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01676 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0167b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01680 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01685 90                             nop        
01686 90                             nop        
01687 90                             nop        
01688 c5f877                         vzeroupper 
0168b e8d060afff                     call       0x7efc7b6cda60
01690 0f1f840088170008               nop        dword ptr [rax + rax + 0x8001788]
01698 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
016a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016a6 e835dbcc17                     call       0x7efc938a54e0
016ab f4                             hlt        
016ac bee4ffffff                     mov        esi, 0xffffffe4
016b1 488b2c24                       mov        rbp, qword ptr [rsp]
016b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016ba 44895c2408                     mov        dword ptr [rsp + 8], r11d
016bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016ce 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016d3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016d7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016dc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016e1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
016e6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016eb 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
016f0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016f5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
016fa 4489542458                     mov        dword ptr [rsp + 0x58], r10d
016ff 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01704 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01709 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0170e 90                             nop        
0170f 90                             nop        
01710 c5f877                         vzeroupper 
01713 e84860afff                     call       0x7efc7b6cda60
01718 0f1f840010180009               nop        dword ptr [rax + rax + 0x9001810]
01720 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
0172a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0172e e8addacc17                     call       0x7efc938a54e0
01733 f4                             hlt        
01734 bee4ffffff                     mov        esi, 0xffffffe4
01739 488b2c24                       mov        rbp, qword ptr [rsp]
0173d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01742 4489542408                     mov        dword ptr [rsp + 8], r10d
01747 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0174c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01751 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01756 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0175b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01760 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01765 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0176a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0176f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01774 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01779 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0177e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01786 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0178b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01790 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01795 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0179d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017a2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017a7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017ac 895c2478                       mov        dword ptr [rsp + 0x78], ebx
017b0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017b9 90                             nop        
017ba 90                             nop        
017bb 90                             nop        
017bc c5f877                         vzeroupper 
017bf e89c5fafff                     call       0x7efc7b6cda60
017c4 0f1f8400bc18000a               nop        dword ptr [rax + rax + 0xa0018bc]
017cc 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
017d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017da e801dacc17                     call       0x7efc938a54e0
017df f4                             hlt        
017e0 bee4ffffff                     mov        esi, 0xffffffe4
017e5 488b2c24                       mov        rbp, qword ptr [rsp]
017e9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017ee 4489542408                     mov        dword ptr [rsp + 8], r10d
017f3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01802 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01807 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0180c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01811 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01816 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0181b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01820 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01825 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0182a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0182f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01834 c5f877                         vzeroupper 
01837 e8245fafff                     call       0x7efc7b6cda60
0183c 0f1f84003419000b               nop        dword ptr [rax + rax + 0xb001934]
01844 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
0184e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01852 e889d9cc17                     call       0x7efc938a54e0
01857 f4                             hlt        
01858 be45ffffff                     mov        esi, 0xffffff45
0185d 488b2c24                       mov        rbp, qword ptr [rsp]
01861 4c89442408                     mov        qword ptr [rsp + 8], r8
01866 90                             nop        
01867 90                             nop        
01868 c5f877                         vzeroupper 
0186b e8f05eafff                     call       0x7efc7b6cda60
01870 0f1f84006819000c               nop        dword ptr [rax + rax + 0xc001968]
01878 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01882 4883e4f0                       and        rsp, 0xfffffffffffffff0
01886 e855d9cc17                     call       0x7efc938a54e0
0188b f4                             hlt        
0188c be45ffffff                     mov        esi, 0xffffff45
01891 488b2c24                       mov        rbp, qword ptr [rsp]
01895 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0189a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0189f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018a4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018a9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018ae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018b3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018b7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018bc 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018c1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018c6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018cb 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018d0 8954246c                       mov        dword ptr [rsp + 0x6c], edx
018d4 c5f877                         vzeroupper 
018d7 e8845eafff                     call       0x7efc7b6cda60
018dc 0f1f8400d419000d               nop        dword ptr [rax + rax + 0xd0019d4]
018e4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
018ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
018f2 e8e9d8cc17                     call       0x7efc938a54e0
018f7 f4                             hlt        
018f8 493be8                         cmp        rbp, r8
018fb bdffffffff                     mov        ebp, 0xffffffff
01900 7c08                           jl         0x7efc7bbd7c0a
01902 400f95c5                       setne      bpl
01906 400fb6ed                       movzx      ebp, bpl
0190a be45ffffff                     mov        esi, 0xffffff45
0190f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01914 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01919 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0191d 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01922 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01927 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0192c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01931 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01936 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0193b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01940 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01945 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0194a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0194f 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01954 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01959 90                             nop        
0195a 90                             nop        
0195b 90                             nop        
0195c c5f877                         vzeroupper 
0195f e8fc5dafff                     call       0x7efc7b6cda60
01964 0f1f84005c1a000e               nop        dword ptr [rax + rax + 0xe001a5c]
0196c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0197a e861d8cc17                     call       0x7efc938a54e0
0197f f4                             hlt        
01980 be45ffffff                     mov        esi, 0xffffff45
01985 488b2c24                       mov        rbp, qword ptr [rsp]
01989 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0198e 4489442408                     mov        dword ptr [rsp + 8], r8d
01993 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01998 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0199d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019a2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019a7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019ab 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019b0 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
019b5 4489442438                     mov        dword ptr [rsp + 0x38], r8d
019ba 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
019bf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019c4 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
019c9 4489442460                     mov        dword ptr [rsp + 0x60], r8d
019ce 4489542470                     mov        dword ptr [rsp + 0x70], r10d
019d3 90                             nop        
019d4 c5f877                         vzeroupper 
019d7 e8845dafff                     call       0x7efc7b6cda60
019dc 0f1f8400d41a000f               nop        dword ptr [rax + rax + 0xf001ad4]
019e4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
019ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f2 e8e9d7cc17                     call       0x7efc938a54e0
019f7 f4                             hlt        
019f8 be45ffffff                     mov        esi, 0xffffff45
019fd 488b2c24                       mov        rbp, qword ptr [rsp]
01a01 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a06 4489542408                     mov        dword ptr [rsp + 8], r10d
01a0b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a10 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a15 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a1a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a1f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01a23 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a28 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a2d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a32 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a37 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a3c 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a41 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a46 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01a4e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a53 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a58 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a5d 90                             nop        
01a5e 90                             nop        
01a5f 90                             nop        
01a60 c5f877                         vzeroupper 
01a63 e8f85cafff                     call       0x7efc7b6cda60
01a68 0f1f8400601b0010               nop        dword ptr [rax + rax + 0x10001b60]
01a70 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01a7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a7e e85dd7cc17                     call       0x7efc938a54e0
01a83 f4                             hlt        
01a84 bee4ffffff                     mov        esi, 0xffffffe4
01a89 488b2c24                       mov        rbp, qword ptr [rsp]
01a8d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a92 4489542408                     mov        dword ptr [rsp + 8], r10d
01a97 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a9c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01aa1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01aa6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aab 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ab0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ab5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01aba 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01abf 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ac4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ac9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ad1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ad6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01adb 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01ae0 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ae8 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01aed 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01af2 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01af7 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01aff 90                             nop        
01b00 c5f877                         vzeroupper 
01b03 e8585cafff                     call       0x7efc7b6cda60
01b08 0f1f8400001c0011               nop        dword ptr [rax + rax + 0x11001c00]
01b10 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01b1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1e e8bdd6cc17                     call       0x7efc938a54e0
01b23 f4                             hlt        
01b24 bee4ffffff                     mov        esi, 0xffffffe4
01b29 488b2c24                       mov        rbp, qword ptr [rsp]
01b2d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b32 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b37 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b41 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b46 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b4b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01b50 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b55 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b5a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b5f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01b64 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b69 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b71 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b76 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01b7b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01b80 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b88 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01b8d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b92 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b97 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01b9c 48894c2478                     mov        qword ptr [rsp + 0x78], rcx
01ba1 90                             nop        
01ba2 90                             nop        
01ba3 90                             nop        
01ba4 c5f877                         vzeroupper 
01ba7 e8b45bafff                     call       0x7efc7b6cda60
01bac 0f1f8400a41c0012               nop        dword ptr [rax + rax + 0x12001ca4]
01bb4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bc2 e819d6cc17                     call       0x7efc938a54e0
01bc7 f4                             hlt        
01bc8 4533d2                         xor        r10d, r10d
01bcb 4c891424                       mov        qword ptr [rsp], r10
01bcf e968e5ffff                     jmp        0x7efc7bbd643c
01bd4 4533d2                         xor        r10d, r10d
01bd7 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01bdf e987e5ffff                     jmp        0x7efc7bbd646b
01be4 4533d2                         xor        r10d, r10d
01be7 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01bef e9a1e5ffff                     jmp        0x7efc7bbd6495
01bf4 4533d2                         xor        r10d, r10d
01bf7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bfc e9c0e5ffff                     jmp        0x7efc7bbd64c1
01c01 4533d2                         xor        r10d, r10d
01c04 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01c0c e9dae5ffff                     jmp        0x7efc7bbd64eb
01c11 4533d2                         xor        r10d, r10d
01c14 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c1c e9f9e5ffff                     jmp        0x7efc7bbd651a
01c21 4183c108                       add        r9d, 8
01c25 be6effffff                     mov        esi, 0xffffff6e
01c2a 488b2c24                       mov        rbp, qword ptr [rsp]
01c2e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c33 4489542408                     mov        dword ptr [rsp + 8], r10d
01c38 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c3d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c42 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c47 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c4c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c50 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01c55 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c5a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c5f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c64 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c69 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c6e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01c73 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01c78 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c7d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c82 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
01c8a 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c8f 897c2474                       mov        dword ptr [rsp + 0x74], edi
01c93 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01c98 c5f877                         vzeroupper 
01c9b e8c05aafff                     call       0x7efc7b6cda60
01ca0 0f1f8400981d0013               nop        dword ptr [rax + rax + 0x13001d98]
01ca8 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01cb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cb6 e825d5cc17                     call       0x7efc938a54e0
01cbb f4                             hlt        
01cbc 4183c108                       add        r9d, 8
01cc0 be66ffffff                     mov        esi, 0xffffff66
01cc5 488b2c24                       mov        rbp, qword ptr [rsp]
01cc9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cce 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cd3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cd8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cdd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ce2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ce7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ceb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01cf0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cf5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cfa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cff 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01d04 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01d09 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d0e 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d13 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d18 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d1d 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
01d25 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d2a 897c2474                       mov        dword ptr [rsp + 0x74], edi
01d2e 458bd3                         mov        r10d, r11d
01d31 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d36 90                             nop        
01d37 90                             nop        
01d38 c5f877                         vzeroupper 
01d3b e8205aafff                     call       0x7efc7b6cda60
01d40 0f1f8400381e0014               nop        dword ptr [rax + rax + 0x14001e38]
01d48 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01d52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d56 e885d4cc17                     call       0x7efc938a54e0
01d5b f4                             hlt        
01d5c 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01d66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6a e871d4cc17                     call       0x7efc938a54e0
01d6f f4                             hlt        
01d70 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01d7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d7e e85dd4cc17                     call       0x7efc938a54e0
01d83 f4                             hlt        
01d84 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01d8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d92 e849d4cc17                     call       0x7efc938a54e0
01d97 f4                             hlt        
01d98 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01da2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01da6 e835d4cc17                     call       0x7efc938a54e0
01dab f4                             hlt        
01dac 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dba e821d4cc17                     call       0x7efc938a54e0
01dbf f4                             hlt        
01dc0 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
01dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dce e80dd4cc17                     call       0x7efc938a54e0
01dd3 f4                             hlt        
01dd4 beccffffff                     mov        esi, 0xffffffcc
01dd9 488b2c24                       mov        rbp, qword ptr [rsp]
01ddd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01de2 44895c2408                     mov        dword ptr [rsp + 8], r11d
01de7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01df1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01df6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01dfb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e00 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e05 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e0a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e0f 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e14 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e19 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e21 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e26 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e2b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e30 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e35 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e3a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
01e42 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e47 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01e4c c5f877                         vzeroupper 
01e4f e80c59afff                     call       0x7efc7b6cda60
01e54 0f1f84004c1f0015               nop        dword ptr [rax + rax + 0x15001f4c]
01e5c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6a e871d3cc17                     call       0x7efc938a54e0
01e6f f4                             hlt        
01e70 beccffffff                     mov        esi, 0xffffffcc
01e75 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e7a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e7f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01e84 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e89 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e8e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e93 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01e98 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e9d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ea5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01eaa 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01eaf 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01eb4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ebc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ec1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ec6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01ecb 90                             nop        
01ecc c5f877                         vzeroupper 
01ecf e88c58afff                     call       0x7efc7b6cda60
01ed4 0f1f8400cc1f0016               nop        dword ptr [rax + rax + 0x16001fcc]
01edc 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e8f1d2cc17                     call       0x7efc938a54e0
01eef f4                             hlt        
01ef0 418bea                         mov        ebp, r10d
01ef3 448bdd                         mov        r11d, ebp
01ef6 458d0429                       lea        r8d, [r9 + rbp]
01efa 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
01f02 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01f07 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01f0f 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01f14 448d5508                       lea        r10d, [rbp + 8]
01f18 443bd1                         cmp        r10d, ecx
01f1b 7cd3                           jl         0x7efc7bbd81f0
01f1d 443bd3                         cmp        r10d, ebx
01f20 0f8dc6000000                   jge        0x7efc7bbd82ec
01f26 4d63c2                         movsxd     r8, r10d
01f29 4c03c7                         add        r8, rdi
01f2c 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
01f31 0f83b10d0000                   jae        0x7efc7bbd8fe8
01f37 83c540                         add        ebp, 0x40
01f3a 4c63c5                         movsxd     r8, ebp
01f3d 4c03c7                         add        r8, rdi
01f40 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
01f45 0f83b10d0000                   jae        0x7efc7bbd8ffc
01f4b 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
01f53 0f83b70d0000                   jae        0x7efc7bbd9010
01f59 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
01f60 0f83be0d0000                   jae        0x7efc7bbd9024
01f66 90                             nop        
01f67 90                             nop        
01f68 90                             nop        
01f69 90                             nop        
01f6a 90                             nop        
01f6b 90                             nop        
01f6c 90                             nop        
01f6d 90                             nop        
01f6e 90                             nop        
01f6f 90                             nop        
01f70 458bc2                         mov        r8d, r10d
01f73 4963f0                         movsxd     rsi, r8d
01f76 478d1c11                       lea        r11d, [r9 + r10]
01f7a 418bca                         mov        ecx, r10d
01f7d 418bd3                         mov        edx, r11d
01f80 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01f88 4d8b441008                     mov        r8, qword ptr [r8 + rdx + 8]
01f8d 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
01f95 4c89440a08                     mov        qword ptr [rdx + rcx + 8], r8
01f9a 4d63c3                         movsxd     r8, r11d
01f9d 4e8b5c0210                     mov        r11, qword ptr [rdx + r8 + 0x10]
01fa2 4c895c3210                     mov        qword ptr [rdx + rsi + 0x10], r11
01fa7 4e8b5c0218                     mov        r11, qword ptr [rdx + r8 + 0x18]
01fac 4c895c3218                     mov        qword ptr [rdx + rsi + 0x18], r11
01fb1 4e8b5c0220                     mov        r11, qword ptr [rdx + r8 + 0x20]
01fb6 4c895c3220                     mov        qword ptr [rdx + rsi + 0x20], r11
01fbb 4e8b5c0228                     mov        r11, qword ptr [rdx + r8 + 0x28]
01fc0 4c895c3228                     mov        qword ptr [rdx + rsi + 0x28], r11
01fc5 4e8b5c0230                     mov        r11, qword ptr [rdx + r8 + 0x30]
01fca 4c895c3230                     mov        qword ptr [rdx + rsi + 0x30], r11
01fcf 4e8b5c0238                     mov        r11, qword ptr [rdx + r8 + 0x38]
01fd4 4c895c3238                     mov        qword ptr [rdx + rsi + 0x38], r11
01fd9 4e8b5c0240                     mov        r11, qword ptr [rdx + r8 + 0x40]
01fde 4c895c3240                     mov        qword ptr [rdx + rsi + 0x40], r11
01fe3 4183c240                       add        r10d, 0x40
01fe7 443bd3                         cmp        r10d, ebx
01fea 7c84                           jl         0x7efc7bbd8270
01fec 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
01ff4 0f8dedf3ffff                   jge        0x7efc7bbd76e7
01ffa 4d63c2                         movsxd     r8, r10d
01ffd 4c03c7                         add        r8, rdi
02000 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
02005 0f832d0d0000                   jae        0x7efc7bbd9038
0200b 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
02013 0f83330d0000                   jae        0x7efc7bbd904c
02019 90                             nop        
0201a 90                             nop        
0201b 90                             nop        
0201c 478d1c11                       lea        r11d, [r9 + r10]
02020 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
02028 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0202d 458bc2                         mov        r8d, r10d
02030 488b8c24e0000000               mov        rcx, qword ptr [rsp + 0xe0]
02038 4e895c0108                     mov        qword ptr [rcx + r8 + 8], r11
0203d 4183c208                       add        r10d, 8
02041 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
02049 7cd1                           jl         0x7efc7bbd831c
0204b e997f3ffff                     jmp        0x7efc7bbd76e7
02050 bee4ffffff                     mov        esi, 0xffffffe4
02055 488b2c24                       mov        rbp, qword ptr [rsp]
02059 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0205e 4489542408                     mov        dword ptr [rsp + 8], r10d
02063 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02068 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0206d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02072 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02077 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0207b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02080 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02085 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0208a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0208f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02094 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02099 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0209e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
020a6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020ab 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020b0 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020b5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
020ba 4489542460                     mov        dword ptr [rsp + 0x60], r10d
020bf 89942480000000                 mov        dword ptr [rsp + 0x80], edx
020c6 90                             nop        
020c7 90                             nop        
020c8 c5f877                         vzeroupper 
020cb e89056afff                     call       0x7efc7b6cda60
020d0 0f1f8400c8210017               nop        dword ptr [rax + rax + 0x170021c8]
020d8 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
020e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020e6 e8f5d0cc17                     call       0x7efc938a54e0
020eb f4                             hlt        
020ec be6effffff                     mov        esi, 0xffffff6e
020f1 488b2c24                       mov        rbp, qword ptr [rsp]
020f5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020fa 4489542408                     mov        dword ptr [rsp + 8], r10d
020ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02104 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02109 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0210e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02113 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02117 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0211c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02121 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02126 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0212b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02130 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02135 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0213a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0213f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02144 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02149 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0214e 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02153 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02157 90                             nop        
02158 c5f877                         vzeroupper 
0215b e80056afff                     call       0x7efc7b6cda60
02160 0f1f840058220018               nop        dword ptr [rax + rax + 0x18002258]
02168 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02172 4883e4f0                       and        rsp, 0xfffffffffffffff0
02176 e865d0cc17                     call       0x7efc938a54e0
0217b f4                             hlt        
0217c be45ffffff                     mov        esi, 0xffffff45
02181 488b2c24                       mov        rbp, qword ptr [rsp]
02185 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0218a 4489542408                     mov        dword ptr [rsp + 8], r10d
0218f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02194 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02199 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0219e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021a3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
021a7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
021ac 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
021b1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021b6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021bb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021c0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
021c5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
021ca 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
021cf 4489542458                     mov        dword ptr [rsp + 0x58], r10d
021d4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021d9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
021de 89542478                       mov        dword ptr [rsp + 0x78], edx
021e2 90                             nop        
021e3 90                             nop        
021e4 c5f877                         vzeroupper 
021e7 e87455afff                     call       0x7efc7b6cda60
021ec 0f1f8400e4220019               nop        dword ptr [rax + rax + 0x190022e4]
021f4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
021fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02202 e8d9cfcc17                     call       0x7efc938a54e0
02207 f4                             hlt        
02208 be3dffffff                     mov        esi, 0xffffff3d
0220d 488b2c24                       mov        rbp, qword ptr [rsp]
02211 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02216 44895c2408                     mov        dword ptr [rsp + 8], r11d
0221b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02220 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02225 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0222a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0222f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02233 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02238 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0223d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02242 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02247 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0224c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02251 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02256 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0225b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02260 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02265 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0226a 89542478                       mov        dword ptr [rsp + 0x78], edx
0226e 90                             nop        
0226f 90                             nop        
02270 c5f877                         vzeroupper 
02273 e8e854afff                     call       0x7efc7b6cda60
02278 0f1f84007023001a               nop        dword ptr [rax + rax + 0x1a002370]
02280 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
0228a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0228e e84dcfcc17                     call       0x7efc938a54e0
02293 f4                             hlt        
02294 bee4ffffff                     mov        esi, 0xffffffe4
02299 488b2c24                       mov        rbp, qword ptr [rsp]
0229d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
022a2 4489542408                     mov        dword ptr [rsp + 8], r10d
022a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022b6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022bb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
022c0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022c5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022ca 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022cf 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
022d4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022d9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
022e1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
022e6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
022eb 4489542444                     mov        dword ptr [rsp + 0x44], r10d
022f0 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
022f8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
022fd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02302 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02307 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
0230f 90                             nop        
02310 c5f877                         vzeroupper 
02313 e84854afff                     call       0x7efc7b6cda60
02318 0f1f84001024001b               nop        dword ptr [rax + rax + 0x1b002410]
02320 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
0232a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0232e e8adcecc17                     call       0x7efc938a54e0
02333 f4                             hlt        
02334 bee4ffffff                     mov        esi, 0xffffffe4
02339 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0233e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02343 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02348 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0234d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02352 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02357 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0235c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02361 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02369 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0236e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02373 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02378 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02380 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02385 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0238a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0238f 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02394 c5f877                         vzeroupper 
02397 e8c453afff                     call       0x7efc7b6cda60
0239c 0f1f84009424001c               nop        dword ptr [rax + rax + 0x1c002494]
023a4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
023ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
023b2 e829cecc17                     call       0x7efc938a54e0
023b7 f4                             hlt        
023b8 418d6901                       lea        ebp, [r9 + 1]
023bc bee4ffffff                     mov        esi, 0xffffffe4
023c1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023c6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023cb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
023d0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
023d5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023da 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023df 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
023e4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
023e9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
023f1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
023f6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
023fb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02400 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02408 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0240d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02412 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02417 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0241c c5f877                         vzeroupper 
0241f e83c53afff                     call       0x7efc7b6cda60
02424 0f1f84001c25001d               nop        dword ptr [rax + rax + 0x1d00251c]
0242c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02436 4883e4f0                       and        rsp, 0xfffffffffffffff0
0243a e8a1cdcc17                     call       0x7efc938a54e0
0243f f4                             hlt        
02440 bee4ffffff                     mov        esi, 0xffffffe4
02445 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0244a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0244f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02454 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02459 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0245e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02463 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02468 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0246d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02475 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0247a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0247f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02484 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02489 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0248e 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02493 90                             nop        
02494 c5f877                         vzeroupper 
02497 e8c452afff                     call       0x7efc7b6cda60
0249c 0f1f84009425001e               nop        dword ptr [rax + rax + 0x1e002594]
024a4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
024ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
024b2 e829cdcc17                     call       0x7efc938a54e0
024b7 f4                             hlt        
024b8 bee4ffffff                     mov        esi, 0xffffffe4
024bd 488b2c24                       mov        rbp, qword ptr [rsp]
024c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
024c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
024cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024da 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024df 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
024e4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024e9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
024ee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024f3 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
024f8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
024fd 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02502 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02507 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0250c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02511 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02516 90                             nop        
02517 90                             nop        
02518 c5f877                         vzeroupper 
0251b e84052afff                     call       0x7efc7b6cda60
02520 0f1f84001826001f               nop        dword ptr [rax + rax + 0x1f002618]
02528 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02532 4883e4f0                       and        rsp, 0xfffffffffffffff0
02536 e8a5cccc17                     call       0x7efc938a54e0
0253b f4                             hlt        
0253c beccffffff                     mov        esi, 0xffffffcc
02541 488b2c24                       mov        rbp, qword ptr [rsp]
02545 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0254a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0254f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02554 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02559 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0255e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02563 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02568 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0256d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02572 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02577 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0257c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02581 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02589 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0258e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02593 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02598 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
025a0 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
025a5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025aa 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025af 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
025b4 c5f877                         vzeroupper 
025b7 e8a451afff                     call       0x7efc7b6cda60
025bc 0f1f8400b4260020               nop        dword ptr [rax + rax + 0x200026b4]
025c4 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
025ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
025d2 e809cccc17                     call       0x7efc938a54e0
025d7 f4                             hlt        
025d8 be45ffffff                     mov        esi, 0xffffff45
025dd 488b2c24                       mov        rbp, qword ptr [rsp]
025e1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025e6 4489542408                     mov        dword ptr [rsp + 8], r10d
025eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025f5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025fa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025ff 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02604 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02609 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0260e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02613 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02618 c5f877                         vzeroupper 
0261b e84051afff                     call       0x7efc7b6cda60
02620 0f1f840018270021               nop        dword ptr [rax + rax + 0x21002718]
02628 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02632 4883e4f0                       and        rsp, 0xfffffffffffffff0
02636 e8a5cbcc17                     call       0x7efc938a54e0
0263b f4                             hlt        
0263c bebeffffff                     mov        esi, 0xffffffbe
02641 488b2c24                       mov        rbp, qword ptr [rsp]
02645 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0264a 4489542408                     mov        dword ptr [rsp + 8], r10d
0264f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02654 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02659 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0265e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02663 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02667 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0266c c5f877                         vzeroupper 
0266f e8ec50afff                     call       0x7efc7b6cda60
02674 0f1f84006c270022               nop        dword ptr [rax + rax + 0x2200276c]
0267c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02686 4883e4f0                       and        rsp, 0xfffffffffffffff0
0268a e851cbcc17                     call       0x7efc938a54e0
0268f f4                             hlt        
02690 be85ffffff                     mov        esi, 0xffffff85
02695 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
02699 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0269e 44891424                       mov        dword ptr [rsp], r10d
026a2 895c2404                       mov        dword ptr [rsp + 4], ebx
026a6 4489742408                     mov        dword ptr [rsp + 8], r14d
026ab 90                             nop        
026ac c5f877                         vzeroupper 
026af e8ac50afff                     call       0x7efc7b6cda60
026b4 0f1f8400ac270023               nop        dword ptr [rax + rax + 0x230027ac]
026bc 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
026c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ca e811cbcc17                     call       0x7efc938a54e0
026cf f4                             hlt        
026d0 beccffffff                     mov        esi, 0xffffffcc
026d5 488b2c24                       mov        rbp, qword ptr [rsp]
026d9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
026de 895c2414                       mov        dword ptr [rsp + 0x14], ebx
026e2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
026e7 90                             nop        
026e8 c5f877                         vzeroupper 
026eb e87050afff                     call       0x7efc7b6cda60
026f0 0f1f8400e8270024               nop        dword ptr [rax + rax + 0x240027e8]
026f8 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02702 4883e4f0                       and        rsp, 0xfffffffffffffff0
02706 e8d5cacc17                     call       0x7efc938a54e0
0270b f4                             hlt        
0270c bee4ffffff                     mov        esi, 0xffffffe4
02711 488b2c24                       mov        rbp, qword ptr [rsp]
02715 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0271a 4489542408                     mov        dword ptr [rsp + 8], r10d
0271f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02724 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02729 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0272e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02733 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02738 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0273d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02742 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02747 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0274c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02751 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02759 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0275e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02763 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02768 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0276d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02772 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
0277a 90                             nop        
0277b 90                             nop        
0277c c5f877                         vzeroupper 
0277f e8dc4fafff                     call       0x7efc7b6cda60
02784 0f1f84007c280025               nop        dword ptr [rax + rax + 0x2500287c]
0278c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0279a e841cacc17                     call       0x7efc938a54e0
0279f f4                             hlt        
027a0 bee4ffffff                     mov        esi, 0xffffffe4
027a5 488b2c24                       mov        rbp, qword ptr [rsp]
027a9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
027ae 4489542408                     mov        dword ptr [rsp + 8], r10d
027b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027bd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027c2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027c7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
027cc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
027d1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
027d6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027db 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
027e0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
027e5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
027ea 4489542444                     mov        dword ptr [rsp + 0x44], r10d
027ef 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027f4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
027f9 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
027fe 90                             nop        
027ff 90                             nop        
02800 c5f877                         vzeroupper 
02803 e8584fafff                     call       0x7efc7b6cda60
02808 0f1f840000290026               nop        dword ptr [rax + rax + 0x26002900]
02810 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
0281a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0281e e8bdc9cc17                     call       0x7efc938a54e0
02823 f4                             hlt        
02824 4183c108                       add        r9d, 8
02828 be6effffff                     mov        esi, 0xffffff6e
0282d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02832 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02837 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0283c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02841 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02846 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0284b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02850 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02855 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
0285d 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02862 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02867 90                             nop        
02868 c5f877                         vzeroupper 
0286b e8f04eafff                     call       0x7efc7b6cda60
02870 0f1f840068290027               nop        dword ptr [rax + rax + 0x27002968]
02878 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02882 4883e4f0                       and        rsp, 0xfffffffffffffff0
02886 e855c9cc17                     call       0x7efc938a54e0
0288b f4                             hlt        
0288c 4183c108                       add        r9d, 8
02890 be66ffffff                     mov        esi, 0xffffff66
02895 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0289a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0289f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
028a4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
028a9 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
028ae 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
028b3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028b8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
028bd 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
028c5 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
028ca 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
028cf 90                             nop        
028d0 c5f877                         vzeroupper 
028d3 e8884eafff                     call       0x7efc7b6cda60
028d8 0f1f8400d0290028               nop        dword ptr [rax + rax + 0x280029d0]
028e0 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
028ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ee e8edc8cc17                     call       0x7efc938a54e0
028f3 f4                             hlt        
028f4 458bc3                         mov        r8d, r11d
028f7 e993eaffff                     jmp        0x7efc7bbd768f
028fc 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0290a e8d1c8cc17                     call       0x7efc938a54e0
0290f f4                             hlt        
02910 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
0291a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0291e e8bdc8cc17                     call       0x7efc938a54e0
02923 f4                             hlt        
02924 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
0292e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02932 e8a9c8cc17                     call       0x7efc938a54e0
02937 f4                             hlt        
02938 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02942 4883e4f0                       and        rsp, 0xfffffffffffffff0
02946 e895c8cc17                     call       0x7efc938a54e0
0294b f4                             hlt        
0294c bee4ffffff                     mov        esi, 0xffffffe4
02951 488b2c24                       mov        rbp, qword ptr [rsp]
02955 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0295a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0295f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02964 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02969 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0296e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02973 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02978 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0297d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02982 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02987 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0298c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02991 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02999 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0299e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
029a3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
029a8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029ad 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029b2 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
029b7 895c2470                       mov        dword ptr [rsp + 0x70], ebx
029bb 4489742474                     mov        dword ptr [rsp + 0x74], r14d
029c0 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
029c8 c5f877                         vzeroupper 
029cb e8904dafff                     call       0x7efc7b6cda60
029d0 0f1f8400c82a0029               nop        dword ptr [rax + rax + 0x29002ac8]
029d8 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
029e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e6 e8f5c7cc17                     call       0x7efc938a54e0
029eb f4                             hlt        
029ec c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
029f5 bee4ffffff                     mov        esi, 0xffffffe4
029fa 488b2c24                       mov        rbp, qword ptr [rsp]
029fe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a03 4489542408                     mov        dword ptr [rsp + 8], r10d
02a08 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a0d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a12 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a17 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a1c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02a21 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02a26 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a2b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a30 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02a35 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a3a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02a42 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02a47 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02a4c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02a51 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a56 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02a5b 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02a60 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02a65 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02a6c c5f877                         vzeroupper 
02a6f e8ec4cafff                     call       0x7efc7b6cda60
02a74 0f1f84006c2b002a               nop        dword ptr [rax + rax + 0x2a002b6c]
02a7c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02a86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a8a e851c7cc17                     call       0x7efc938a54e0
02a8f f4                             hlt        
02a90 beccffffff                     mov        esi, 0xffffffcc
02a95 488b2c24                       mov        rbp, qword ptr [rsp]
02a99 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a9e 4489542408                     mov        dword ptr [rsp + 8], r10d
02aa3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02aa8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02aad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ab2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02ab7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02abc 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02ac1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02ac6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02acb 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02ad0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02ad5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02add 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02ae2 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02ae7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02aec 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02af4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02af9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02afe 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02b03 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02b08 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02b0c c5f877                         vzeroupper 
02b0f e84c4cafff                     call       0x7efc7b6cda60
02b14 0f1f84000c2c002b               nop        dword ptr [rax + rax + 0x2b002c0c]
02b1c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b2a e8b1c6cc17                     call       0x7efc938a54e0
02b2f f4                             hlt        
02b30 418bee                         mov        ebp, r14d
02b33 83c510                         add        ebp, 0x10
02b36 be6effffff                     mov        esi, 0xffffff6e
02b3b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02b40 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02b45 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02b4a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02b4f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02b54 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b59 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b5e 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02b63 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02b68 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02b6d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02b72 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02b77 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02b7c 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02b81 90                             nop        
02b82 90                             nop        
02b83 90                             nop        
02b84 c5f877                         vzeroupper 
02b87 e8d44bafff                     call       0x7efc7b6cda60
02b8c 0f1f8400842c002c               nop        dword ptr [rax + rax + 0x2c002c84]
02b94 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ba2 e839c6cc17                     call       0x7efc938a54e0
02ba7 f4                             hlt        
02ba8 418bee                         mov        ebp, r14d
02bab 83c510                         add        ebp, 0x10
02bae be66ffffff                     mov        esi, 0xffffff66
02bb3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02bb8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02bbd 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02bc2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02bc7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02bcc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bd1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02bd6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02bdb 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02be0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02be5 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02bea 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02bef 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02bf4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02bf9 90                             nop        
02bfa 90                             nop        
02bfb 90                             nop        
02bfc c5f877                         vzeroupper 
02bff e85c4bafff                     call       0x7efc7b6cda60
02c04 0f1f8400fc2c002d               nop        dword ptr [rax + rax + 0x2d002cfc]
02c0c 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02c16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c1a e8c1c5cc17                     call       0x7efc938a54e0
02c1f f4                             hlt        
02c20 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c2e e8adc5cc17                     call       0x7efc938a54e0
02c33 f4                             hlt        
02c34 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c42 e899c5cc17                     call       0x7efc938a54e0
02c47 f4                             hlt        
02c48 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c56 e885c5cc17                     call       0x7efc938a54e0
02c5b f4                             hlt        
02c5c 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c66 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c6a e871c5cc17                     call       0x7efc938a54e0
02c6f f4                             hlt        
02c70 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c7e e85dc5cc17                     call       0x7efc938a54e0
02c83 f4                             hlt        
02c84 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02c8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c92 e849c5cc17                     call       0x7efc938a54e0
02c97 f4                             hlt        
02c98 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02ca2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ca6 e835c5cc17                     call       0x7efc938a54e0
02cab f4                             hlt        
02cac 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cba e821c5cc17                     call       0x7efc938a54e0
02cbf f4                             hlt        
02cc0 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02cca 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cce e80dc5cc17                     call       0x7efc938a54e0
02cd3 f4                             hlt        
02cd4 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02cde 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ce2 e8f9c4cc17                     call       0x7efc938a54e0
02ce7 f4                             hlt        
02ce8 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02cf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cf6 e8e5c4cc17                     call       0x7efc938a54e0
02cfb f4                             hlt        
02cfc 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02d06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d0a e8d1c4cc17                     call       0x7efc938a54e0
02d0f f4                             hlt        
02d10 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02d1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d1e e8bdc4cc17                     call       0x7efc938a54e0
02d23 f4                             hlt        
02d24 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02d2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d32 e8a9c4cc17                     call       0x7efc938a54e0
02d37 f4                             hlt        
02d38 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d46 e895c4cc17                     call       0x7efc938a54e0
02d4b f4                             hlt        
02d4c 48bf308b3154fc7e0000           movabs     rdi, 0x7efc54318b30
02d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d5a e881c4cc17                     call       0x7efc938a54e0
02d5f f4                             hlt        
02d60 488bf0                         mov        rsi, rax
02d63 eb0d                           jmp        0x7efc7bbd9072
02d65 488bf0                         mov        rsi, rax
02d68 eb08                           jmp        0x7efc7bbd9072
02d6a 488bf0                         mov        rsi, rax
02d6d eb03                           jmp        0x7efc7bbd9072
02d6f 488bf0                         mov        rsi, rax
02d72 c5f877                         vzeroupper 
02d75 4881c400010000                 add        rsp, 0x100
02d7c 5d                             pop        rbp
02d7d e9deffaeff                     jmp        0x7efc7b6c9060
02d82 bef6ffffff                     mov        esi, 0xfffffff6
02d87 90                             nop        
02d88 c5f877                         vzeroupper 
02d8b e8d049afff                     call       0x7efc7b6cda60
02d90 0f1f8400882e002e               nop        dword ptr [rax + rax + 0x2e002e88]
02d98 48bf80047254fc7e0000           movabs     rdi, 0x7efc54720480
02da2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02da6 e835c4cc17                     call       0x7efc938a54e0
02dab f4                             hlt        
02dac 49ba6071bd7bfc7e0000           movabs     r10, 0x7efc7bbd7160
02db6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02dbd e99e92b5ff                     jmp        0x7efc7b732360
02dc2 e81961b4ff                     call       0x7efc7b71f1e0
02dc7 e962d2ffff                     jmp        0x7efc7bbd632e
02dcc f4                             hlt        
02dcd f4                             hlt        
02dce f4                             hlt        
02dcf f4                             hlt        
