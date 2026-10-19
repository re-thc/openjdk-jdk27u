00000 e87bd63b18                     call       0x7ff793f8d300
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
00028 0f85142c0000                   jne        0x7ff77bbd28c2
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
00101 49ba70fa1494f77f0000           movabs     r10, 0x7ff79414fa70
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f84941a0000                   je         0x7ff77bbd1838
00124 458b1a                         mov        r11d, dword ptr [r10]
00127 41c1eb0d                       shr        r11d, 0xd
0012b 4181fb15410000                 cmp        r11d, 0x4115
00132 0f85e8230000                   jne        0x7ff77bbd21a0
00138 4c891424                       mov        qword ptr [rsp], r10
0013c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00141 4d85d2                         test       r10, r10
00144 0f847a1a0000                   je         0x7ff77bbd1844
0014a 458b12                         mov        r10d, dword ptr [r10]
0014d 41c1ea0d                       shr        r10d, 0xd
00151 4181faf9060000                 cmp        r10d, 0x6f9
00158 0f85c2230000                   jne        0x7ff77bbd21a0
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f845b1a0000                   je         0x7ff77bbd1854
00179 458b1a                         mov        r11d, dword ptr [r10]
0017c 41c1eb0d                       shr        r11d, 0xd
00180 4181fbfc060000                 cmp        r11d, 0x6fc
00187 0f8593230000                   jne        0x7ff77bbd21a0
0018d 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00195 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019a 4d85d2                         test       r10, r10
0019d 0f84411a0000                   je         0x7ff77bbd1864
001a3 458b12                         mov        r10d, dword ptr [r10]
001a6 41c1ea0d                       shr        r10d, 0xd
001aa 4181fafb060000                 cmp        r10d, 0x6fb
001b1 0f8569230000                   jne        0x7ff77bbd21a0
001b7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f84221a0000                   je         0x7ff77bbd1871
001cf 458b1a                         mov        r11d, dword ptr [r10]
001d2 41c1eb0d                       shr        r11d, 0xd
001d6 4181fbfb060000                 cmp        r11d, 0x6fb
001dd 0f853d230000                   jne        0x7ff77bbd21a0
001e3 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001eb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f0 4d85d2                         test       r10, r10
001f3 0f84081a0000                   je         0x7ff77bbd1881
001f9 458b12                         mov        r10d, dword ptr [r10]
001fc 41c1ea0d                       shr        r10d, 0xd
00200 4181faf9060000                 cmp        r10d, 0x6f9
00207 0f8513230000                   jne        0x7ff77bbd21a0
0020d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00212 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00226 44895c2408                     mov        dword ptr [rsp + 8], r11d
0022b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00230 4585d2                         test       r10d, r10d
00233 0f8493220000                   je         0x7ff77bbd214c
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5204                       mov        r10d, dword ptr [r10 + 4]
00245 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0024a 4585d2                         test       r10d, r10d
0024d 0f8679220000                   jbe        0x7ff77bbd214c
00253 4183fa01                       cmp        r10d, 1
00257 0f866f220000                   jbe        0x7ff77bbd214c
0025d 4183fa02                       cmp        r10d, 2
00261 0f8665220000                   jbe        0x7ff77bbd214c
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00273 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00278 4183c3f1                       add        r11d, -0xf
0027c 4585db                         test       r11d, r11d
0027f 0f8c47220000                   jl         0x7ff77bbd214c
00285 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0028d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00291 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00296 4183c2f1                       add        r10d, -0xf
0029a 4585d2                         test       r10d, r10d
0029d 0f8c29220000                   jl         0x7ff77bbd214c
002a3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002a8 4183c3f9                       add        r11d, -7
002ac 4585db                         test       r11d, r11d
002af 0f8c17220000                   jl         0x7ff77bbd214c
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
002f9 e967040000                     jmp        0x7ff77bbd03e5
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
00343 0f8d6f0a0000                   jge        0x7ff77bbd0a38
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
00394 0f8cc61a0000                   jl         0x7ff77bbd1ae0
0039a 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
003a2 4585c0                         test       r8d, r8d
003a5 0f8cb51a0000                   jl         0x7ff77bbd1ae0
003ab 458d1c2a                       lea        r11d, [r10 + rbp]
003af 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
003b4 453bcb                         cmp        r9d, r11d
003b7 0f82a31a0000                   jb         0x7ff77bbd1ae0
003bd 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c4 03dd                           add        ebx, ebp
003c6 443bcb                         cmp        r9d, ebx
003c9 0f82911a0000                   jb         0x7ff77bbd1ae0
003cf 85ed                           test       ebp, ebp
003d1 0f8c891a0000                   jl         0x7ff77bbd1ae0
003d7 85ed                           test       ebp, ebp
003d9 0f8442ffffff                   je         0x7ff77bbcffa1
003df 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
003e7 4b8d740308                     lea        rsi, [r11 + r8 + 8]
003ec 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
003f1 4863d5                         movsxd     rdx, ebp
003f4 4883fa20                       cmp        rdx, 0x20
003f8 0f8600ffffff                   jbe        0x7ff77bbcff7e
003fe c5f877                         vzeroupper 
00401 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
0040b 41ffd2                         call       r10
0040e 0f1f840000000000               nop        dword ptr [rax + rax]
00416 e906ffffff                     jmp        0x7ff77bbcffa1
0041b 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00423 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0042a 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
00431 4103da                         add        ebx, r10d
00434 e910030000                     jmp        0x7ff77bbd03c9
00439 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00441 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00449 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
0044e 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00453 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0045b 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00463 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0046b 4963d2                         movsxd     rdx, r10d
0046e 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00476 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
0047e 0f8ca9060000                   jl         0x7ff77bbd07ad
00484 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0048c 4183fb30                       cmp        r11d, 0x30
00490 0f8ea0000000                   jle        0x7ff77bbd01b6
00496 4585c9                         test       r9d, r9d
00499 0f8c25190000                   jl         0x7ff77bbd1a44
0049f 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004a7 4585db                         test       r11d, r11d
004aa 0f8c14190000                   jl         0x7ff77bbd1a44
004b0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
004b8 4503d1                         add        r10d, r9d
004bb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004c0 453bc2                         cmp        r8d, r10d
004c3 0f82fb180000                   jb         0x7ff77bbd1a44
004c9 458bd0                         mov        r10d, r8d
004cc 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004d4 0f82ea180000                   jb         0x7ff77bbd1a44
004da 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
004e2 4585db                         test       r11d, r11d
004e5 0f8450020000                   je         0x7ff77bbd03bb
004eb 4963d3                         movsxd     rdx, r11d
004ee 4883fa20                       cmp        rdx, 0x20
004f2 7725                           ja         0x7ff77bbd0199
004f4 4d63d3                         movsxd     r10, r11d
004f7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004fe c442a8f5db                     bzhi       r11, r11, r10
00503 c4c1fb92fb                     kmovq      k7, r11
00508 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0050e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00514 e922020000                     jmp        0x7ff77bbd03bb
00519 c5f877                         vzeroupper 
0051c 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00526 41ffd2                         call       r10
00529 0f1f840000000000               nop        dword ptr [rax + rax]
00531 e905020000                     jmp        0x7ff77bbd03bb
00536 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
0053e 0f8330150000                   jae        0x7ff77bbd16f4
00544 4963f9                         movsxd     rdi, r9d
00547 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0054f 4d8b443a08                     mov        r8, qword ptr [r10 + rdi + 8]
00554 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0055c 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00564 0f83aa150000                   jae        0x7ff77bbd1794
0056a 8b8c24b8000000                 mov        ecx, dword ptr [rsp + 0xb8]
00571 8d5908                         lea        ebx, [rcx + 8]
00574 4c63d1                         movsxd     r10, ecx
00577 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
0057f 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
00584 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
0058b 0f8daa010000                   jge        0x7ff77bbd03bb
00591 492bfa                         sub        rdi, r10
00594 4c63db                         movsxd     r11, ebx
00597 4d8d143b                       lea        r10, [r11 + rdi]
0059b 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005a0 0f836b160000                   jae        0x7ff77bbd1891
005a6 4c8bd2                         mov        r10, rdx
005a9 4d2bd3                         sub        r10, r11
005ac 4983c207                       add        r10, 7
005b0 4983e2f8                       and        r10, 0xfffffffffffffff8
005b4 458bd2                         mov        r10d, r10d
005b7 458d5c0a08                     lea        r11d, [r10 + rcx + 8]
005bc 4d63d3                         movsxd     r10, r11d
005bf 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005c4 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005c9 0f8342160000                   jae        0x7ff77bbd1891
005cf 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
005d6 0f8335160000                   jae        0x7ff77bbd1891
005dc 4983c2f8                       add        r10, -8
005e0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005e5 0f8326160000                   jae        0x7ff77bbd1891
005eb 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005f3 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
005fa 0f8fac160000                   jg         0x7ff77bbd192c
00600 442bc9                         sub        r9d, ecx
00603 83c110                         add        ecx, 0x10
00606 458d1419                       lea        r10d, [r9 + rbx]
0060a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00612 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00617 448bdb                         mov        r11d, ebx
0061a 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00622 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
00627 448d5b08                       lea        r11d, [rbx + 8]
0062b 443bd9                         cmp        r11d, ecx
0062e 7d05                           jge        0x7ff77bbd02b5
00630 418bdb                         mov        ebx, r11d
00633 ebd1                           jmp        0x7ff77bbd0286
00635 4883c2f8                       add        rdx, -8
00639 4881fa00000080                 cmp        rdx, -0x80000000
00640 49c7c200000080                 mov        r10, 0xffffffff80000000
00647 490f4cd2                       cmovl      rdx, r10
0064b 448bd2                         mov        r10d, edx
0064e 453bda                         cmp        r11d, r10d
00651 0f8d89000000                   jge        0x7ff77bbd0360
00657 4d63c3                         movsxd     r8, r11d
0065a 4c03c7                         add        r8, rdi
0065d 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00662 0f83e4160000                   jae        0x7ff77bbd19cc
00668 83c310                         add        ebx, 0x10
0066b 4c63c3                         movsxd     r8, ebx
0066e 4c03c7                         add        r8, rdi
00671 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00676 0f83e4160000                   jae        0x7ff77bbd19e0
0067c 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00684 0f83ea160000                   jae        0x7ff77bbd19f4
0068a 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00691 0f83f1160000                   jae        0x7ff77bbd1a08
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
006ad 488b9424e0000000               mov        rdx, qword ptr [rsp + 0xe0]
006b5 488b540a08                     mov        rdx, qword ptr [rdx + rcx + 8]
006ba 4963c8                         movsxd     rcx, r8d
006bd 458bc3                         mov        r8d, r11d
006c0 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
006c8 4a89540608                     mov        qword ptr [rsi + r8 + 8], rdx
006cd 4c8b440e10                     mov        r8, qword ptr [rsi + rcx + 0x10]
006d2 4c89441e10                     mov        qword ptr [rsi + rbx + 0x10], r8
006d7 4183c310                       add        r11d, 0x10
006db 453bda                         cmp        r11d, r10d
006de 7cc0                           jl         0x7ff77bbd0320
006e0 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006e8 7d51                           jge        0x7ff77bbd03bb
006ea 4d63d3                         movsxd     r10, r11d
006ed 4c03d7                         add        r10, rdi
006f0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
006f5 0f83a1160000                   jae        0x7ff77bbd1a1c
006fb 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00703 0f83a7160000                   jae        0x7ff77bbd1a30
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
00739 7cd1                           jl         0x7ff77bbd038c
0073b 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00742 039c24bc000000                 add        ebx, dword ptr [rsp + 0xbc]
00749 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0074d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00752 41ffc3                         inc        r11d
00755 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
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
00791 0f8d4f060000                   jge        0x7ff77bbd0a66
00797 443b542408                     cmp        r10d, dword ptr [rsp + 8]
0079c 0f838f0e0000                   jae        0x7ff77bbd12b1
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
007e7 0f8c8f100000                   jl         0x7ff77bbd14fc
007ed 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
007f5 4585d2                         test       r10d, r10d
007f8 0f8546020000                   jne        0x7ff77bbd06c4
007fe 4533d2                         xor        r10d, r10d
00801 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00809 448bd2                         mov        r10d, edx
0080c 4183fa03                       cmp        r10d, 3
00810 0f8e6a020000                   jle        0x7ff77bbd0700
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
0087c 0f8f66100000                   jg         0x7ff77bbd1568
00882 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0088a 4585d2                         test       r10d, r10d
0088d 0f8eb50f0000                   jle        0x7ff77bbd14c8
00893 448beb                         mov        r13d, ebx
00896 4403ac24b8000000               add        r13d, dword ptr [rsp + 0xb8]
0089e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008a6 4503d5                         add        r10d, r13d
008a9 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
008ae 0f8fbc100000                   jg         0x7ff77bbd15f0
008b4 458bde                         mov        r11d, r14d
008b7 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
008bf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
008c7 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
008cf 0f8f13110000                   jg         0x7ff77bbd1668
008d5 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
008dd 4183fa10                       cmp        r10d, 0x10
008e1 0f8f84050000                   jg         0x7ff77bbd0aeb
008e7 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
008ef 0f83a70d0000                   jae        0x7ff77bbd131c
008f5 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
008fd c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00904 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
0090b 0f83130e0000                   jae        0x7ff77bbd13a4
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
00962 0f8fd1faffff                   jg         0x7ff77bbd00b9
00968 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00970 4183fb10                       cmp        r11d, 0x10
00974 0f8cbffaffff                   jl         0x7ff77bbd00b9
0097a 443b8c24b4000000               cmp        r9d, dword ptr [rsp + 0xb4]
00982 0f83480e0000                   jae        0x7ff77bbd1450
00988 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00990 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00997 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0099f 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
009a7 0f826efaffff                   jb         0x7ff77bbd009b
009ad bee4ffffff                     mov        esi, 0xffffffe4
009b2 488b2c24                       mov        rbp, qword ptr [rsp]
009b6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009bb 4489542408                     mov        dword ptr [rsp + 8], r10d
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
00a23 e8b8d3afff                     call       0x7ff77b6cda60
00a28 0f1f8400200b0002               nop        dword ptr [rax + rax + 0x2000b20]
00a30 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
00a3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a3e e81df51818                     call       0x7ff793d5fbe0
00a43 f4                             hlt        
00a44 453bd3                         cmp        r10d, r11d
00a47 0f8ebcfdffff                   jle        0x7ff77bbd0489
00a4d be45ffffff                     mov        esi, 0xffffff45
00a52 418bea                         mov        ebp, r10d
00a55 44891c24                       mov        dword ptr [rsp], r11d
00a59 90                             nop        
00a5a 90                             nop        
00a5b 90                             nop        
00a5c c5f877                         vzeroupper 
00a5f e87cd3afff                     call       0x7ff77b6cda60
00a64 0f1f84005c0b0003               nop        dword ptr [rax + rax + 0x3000b5c]
00a6c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
00a76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00a7a e8e1f41818                     call       0x7ff793d5fbe0
00a7f f4                             hlt        
00a80 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00a88 4585d2                         test       r10d, r10d
00a8b 7407                           je         0x7ff77bbd0714
00a8d 448d52ff                       lea        r10d, [rdx - 1]
00a91 418bd2                         mov        edx, r10d
00a94 85d2                           test       edx, edx
00a96 747c                           je         0x7ff77bbd0794
00a98 83fa03                         cmp        edx, 3
00a9b 0f846b150000                   je         0x7ff77bbd1c8c
00aa1 83fa02                         cmp        edx, 2
00aa4 0f87ee150000                   ja         0x7ff77bbd1d18
00aaa 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00aae 0f832c140000                   jae        0x7ff77bbd1b60
00ab4 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00abc 458b4c9308                     mov        r9d, dword ptr [r11 + rdx*4 + 8]
00ac1 85d2                           test       edx, edx
00ac3 7e41                           jle        0x7ff77bbd0786
00ac5 448d5aff                       lea        r11d, [rdx - 1]
00ac9 443b5c240c                     cmp        r11d, dword ptr [rsp + 0xc]
00ace 0f83a8140000                   jae        0x7ff77bbd1bfc
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
00b04 7fda                           jg         0x7ff77bbd0760
00b06 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b0e 45894a08                       mov        dword ptr [r10 + 8], r9d
00b12 eb0c                           jmp        0x7ff77bbd07a0
00b14 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00b1c 458b4a08                       mov        r9d, dword ptr [r10 + 8]
00b20 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
00b28 e931fdffff                     jmp        0x7ff77bbd04de
00b2d 4183fa10                       cmp        r10d, 0x10
00b31 0f8d31190000                   jge        0x7ff77bbd20e8
00b37 4183fa08                       cmp        r10d, 8
00b3b 0f8da1040000                   jge        0x7ff77bbd0c62
00b41 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b49 4183fa10                       cmp        r10d, 0x10
00b4d 0f8ec0000000                   jle        0x7ff77bbd0893
00b53 4585c9                         test       r9d, r9d
00b56 0f8c70180000                   jl         0x7ff77bbd204c
00b5c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00b64 4585db                         test       r11d, r11d
00b67 0f8c5f180000                   jl         0x7ff77bbd204c
00b6d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00b72 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00b7a 0f824c180000                   jb         0x7ff77bbd204c
00b80 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00b88 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
00b90 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00b98 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b9d 453bda                         cmp        r11d, r10d
00ba0 0f8226180000                   jb         0x7ff77bbd204c
00ba6 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00bae 4585db                         test       r11d, r11d
00bb1 0f8c15180000                   jl         0x7ff77bbd204c
00bb7 4585db                         test       r11d, r11d
00bba 0f8490f7ffff                   je         0x7ff77bbcffd0
00bc0 4883fd20                       cmp        rbp, 0x20
00bc4 772d                           ja         0x7ff77bbd0873
00bc6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00bce 4d63d2                         movsxd     r10, r10d
00bd1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bd8 c442a8f5db                     bzhi       r11, r11, r10
00bdd c4c1fb92fb                     kmovq      k7, r11
00be2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00be8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bee e95df7ffff                     jmp        0x7ff77bbcffd0
00bf3 488bd5                         mov        rdx, rbp
00bf6 c5f877                         vzeroupper 
00bf9 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00c03 41ffd2                         call       r10
00c06 0f1f840000000000               nop        dword ptr [rax + rax]
00c0e e93df7ffff                     jmp        0x7ff77bbcffd0
00c13 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00c18 0f8306150000                   jae        0x7ff77bbd1da4
00c1e 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c26 430fbe6c0a08                   movsx      ebp, byte ptr [r10 + r9 + 8]
00c2c 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c34 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c39 0f8385150000                   jae        0x7ff77bbd1e44
00c3f 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c47 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c4f 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00c54 458d5903                       lea        r11d, [r9 + 3]
00c58 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c60 41ffc2                         inc        r10d
00c63 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00c6b 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c70 0f83d2150000                   jae        0x7ff77bbd1ec8
00c76 4d63d9                         movsxd     r11, r9d
00c79 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c81 430fbe6c1a09                   movsx      ebp, byte ptr [r10 + r11 + 9]
00c87 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c8f 4183c203                       add        r10d, 3
00c93 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00c98 0f8332160000                   jae        0x7ff77bbd1f50
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
00cdd 0f8365160000                   jae        0x7ff77bbd1fc8
00ce3 49bbf03b27e300000000           movabs     r11, 0xe3273bf0
00ced 47034c9308                     add        r9d, dword ptr [r11 + r10*4 + 8]
00cf2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cf7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00cff 4183fb04                       cmp        r11d, 4
00d03 7e43                           jle        0x7ff77bbd09c8
00d05 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d0c 83c504                         add        ebp, 4
00d0f 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d17 418bd1                         mov        edx, r9d
00d1a 90                             nop        
00d1b 90                             nop        
00d1c c5f877                         vzeroupper 
00d1f e8bcf2b5ff                     call       0x7ff77b72fc60
00d24 0f1f84001c0e0004               nop        dword ptr [rax + rax + 0x4000e1c]
00d2c 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d34 8bd5                           mov        edx, ebp
00d36 8bc8                           mov        ecx, eax
00d38 c5f877                         vzeroupper 
00d3b e8a0f2b5ff                     call       0x7ff77b72fc60
00d40 0f1f8400380e0005               nop        dword ptr [rax + rax + 0x5000e38]
00d48 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00d50 4183fa08                       cmp        r10d, 8
00d54 7e62                           jle        0x7ff77bbd0a38
00d56 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00d5a 49ba183c27e300000000           movabs     r10, 0xe3273c18
00d64 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d6c 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00d71 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00d78 83c508                         add        ebp, 8
00d7b 83c208                         add        edx, 8
00d7e 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00d86 90                             nop        
00d87 90                             nop        
00d88 c5f877                         vzeroupper 
00d8b e850f2b5ff                     call       0x7ff77b72fc60
00d90 0f1f8400880e0006               nop        dword ptr [rax + rax + 0x6000e88]
00d98 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
00da0 8bd5                           mov        edx, ebp
00da2 488bc8                         mov        rcx, rax
00da5 90                             nop        
00da6 90                             nop        
00da7 90                             nop        
00da8 c5f877                         vzeroupper 
00dab e830f2b5ff                     call       0x7ff77b72fc60
00db0 0f1f8400a80e0007               nop        dword ptr [rax + rax + 0x7000ea8]
00db8 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00dbf e985f9ffff                     jmp        0x7ff77bbd03c9
00dc4 4d63d3                         movsxd     r10, r11d
00dc7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dce c442a8f5db                     bzhi       r11, r11, r10
00dd3 c4c1fb92fb                     kmovq      k7, r11
00dd8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dde 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de4 eb67                           jmp        0x7ff77bbd0acd
00de6 4585f6                         test       r14d, r14d
00de9 0f8c71170000                   jl         0x7ff77bbd21e0
00def 85db                           test       ebx, ebx
00df1 0f8c69170000                   jl         0x7ff77bbd21e0
00df7 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00dfc 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00e01 0f8259170000                   jb         0x7ff77bbd21e0
00e07 428d2c1b                       lea        ebp, [rbx + r11]
00e0b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00e10 443bd5                         cmp        r10d, ebp
00e13 0f8247170000                   jb         0x7ff77bbd21e0
00e19 4585db                         test       r11d, r11d
00e1c 0f8c3e170000                   jl         0x7ff77bbd21e0
00e22 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e27 453bc6                         cmp        r8d, r14d
00e2a 7421                           je         0x7ff77bbd0acd
00e2c 4963d3                         movsxd     rdx, r11d
00e2f 4883fa20                       cmp        rdx, 0x20
00e33 768f                           jbe        0x7ff77bbd0a44
00e35 c5f877                         vzeroupper 
00e38 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00e42 41ffd2                         call       r10
00e45 0f1f840000000000               nop        dword ptr [rax + rax]
00e4d 4c8b1424                       mov        r10, qword ptr [rsp]
00e51 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e55 c5f877                         vzeroupper 
00e58 4881c400010000                 add        rsp, 0x100
00e5f 5d                             pop        rbp
00e60 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e64 0f87c21d0000                   ja         0x7ff77bbd28ac
00e6a c3                             ret        
00e6b 4183fa30                       cmp        r10d, 0x30
00e6f 0f8e8c000000                   jle        0x7ff77bbd0b81
00e75 4585f6                         test       r14d, r14d
00e78 0f8c0a1b0000                   jl         0x7ff77bbd2608
00e7e 85db                           test       ebx, ebx
00e80 0f8c021b0000                   jl         0x7ff77bbd2608
00e86 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e8b 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00e93 0f82ef1a0000                   jb         0x7ff77bbd2608
00e99 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00e9e 453bdd                         cmp        r11d, r13d
00ea1 0f82e11a0000                   jb         0x7ff77bbd2608
00ea7 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00eaf 4585d2                         test       r10d, r10d
00eb2 7426                           je         0x7ff77bbd0b5a
00eb4 4883fa20                       cmp        rdx, 0x20
00eb8 772d                           ja         0x7ff77bbd0b67
00eba 4d63d2                         movsxd     r10, r10d
00ebd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ec4 c442a8f5db                     bzhi       r11, r11, r10
00ec9 c4c1fb92fb                     kmovq      k7, r11
00ece 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ed4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00eda 4489ac24b8000000               mov        dword ptr [rsp + 0xb8], r13d
00ee2 e95ffaffff                     jmp        0x7ff77bbd05c6
00ee7 c5f877                         vzeroupper 
00eea 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00ef4 41ffd2                         call       r10
00ef7 0f1f840000000000               nop        dword ptr [rax + rax]
00eff ebd9                           jmp        0x7ff77bbd0b5a
00f01 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00f09 0f8334190000                   jae        0x7ff77bbd24c3
00f0f 4d63ce                         movsxd     r9, r14d
00f12 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f1a c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00f21 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
00f28 0f83b6190000                   jae        0x7ff77bbd2564
00f2e 448d5310                       lea        r10d, [rbx + 0x10]
00f32 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00f3a 4c63db                         movsxd     r11, ebx
00f3d 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00f45 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00f4c 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00f54 453bd5                         cmp        r10d, r13d
00f57 0f8db4060000                   jge        0x7ff77bbd1291
00f5d 4d2bcb                         sub        r9, r11
00f60 4d63da                         movsxd     r11, r10d
00f63 486354241c                     movsxd     rdx, dword ptr [rsp + 0x1c]
00f68 4883c2f1                       add        rdx, -0xf
00f6c 4f8d040b                       lea        r8, [r11 + r9]
00f70 4c3bc2                         cmp        r8, rdx
00f73 0f83af1a0000                   jae        0x7ff77bbd26a8
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
00f9d 0f83851a0000                   jae        0x7ff77bbd26a8
00fa3 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
00fab 0f83771a0000                   jae        0x7ff77bbd26a8
00fb1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fb6 4983c2f1                       add        r10, -0xf
00fba 4983c3f0                       add        r11, -0x10
00fbe 4d3bda                         cmp        r11, r10
00fc1 0f83611a0000                   jae        0x7ff77bbd26a8
00fc7 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00fce 0f8fcc1a0000                   jg         0x7ff77bbd2720
00fd4 458bd6                         mov        r10d, r14d
00fd7 442bd3                         sub        r10d, ebx
00fda 83c320                         add        ebx, 0x20
00fdd e909040000                     jmp        0x7ff77bbd106b
00fe2 443b8c24b0000000               cmp        r9d, dword ptr [rsp + 0xb0]
00fea 0f83ac150000                   jae        0x7ff77bbd221c
00ff0 4963c9                         movsxd     rcx, r9d
00ff3 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00ffb 4d8b540a08                     mov        r10, qword ptr [r10 + rcx + 8]
01000 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01008 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01010 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01018 0f8312160000                   jae        0x7ff77bbd22b0
0101e 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
01026 418d6808                       lea        ebp, [r8 + 8]
0102a 4d63d0                         movsxd     r10, r8d
0102d 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01035 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0103d 4b895c1308                     mov        qword ptr [r11 + r10 + 8], rbx
01042 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01049 0f8d86030000                   jge        0x7ff77bbd1055
0104f 492bca                         sub        rcx, r10
01052 4863dd                         movsxd     rbx, ebp
01055 4c8d140b                       lea        r10, [rbx + rcx]
01059 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0105e 0f8350160000                   jae        0x7ff77bbd2334
01064 4c8bd2                         mov        r10, rdx
01067 4c2bd3                         sub        r10, rbx
0106a 4983c207                       add        r10, 7
0106e 4983e2f8                       and        r10, 0xfffffffffffffff8
01072 458bda                         mov        r11d, r10d
01075 478d540308                     lea        r10d, [r11 + r8 + 8]
0107a 4d63d2                         movsxd     r10, r10d
0107d 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
01082 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
01087 0f8327160000                   jae        0x7ff77bbd2334
0108d 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
01094 0f831a160000                   jae        0x7ff77bbd2334
0109a 4983c2f8                       add        r10, -8
0109e 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
010a3 0f830b160000                   jae        0x7ff77bbd2334
010a9 41baf8ffffff                   mov        r10d, 0xfffffff8
010af 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
010b7 498bc3                         mov        rax, r11
010ba 418bfb                         mov        edi, r11d
010bd 442bd7                         sub        r10d, edi
010c0 452bd0                         sub        r10d, r8d
010c3 4183c2f0                       add        r10d, -0x10
010c7 418d7810                       lea        edi, [r8 + 0x10]
010cb 4c63df                         movsxd     r11, edi
010ce be06000000                     mov        esi, 6
010d3 c442c8f5d2                     bzhi       r10, r10, rsi
010d8 4d03da                         add        r11, r10
010db 4c3bda                         cmp        r11, rdx
010de 488bfa                         mov        rdi, rdx
010e1 490f4cfb                       cmovl      rdi, r11
010e5 4c8bd7                         mov        r10, rdi
010e8 4c2bd3                         sub        r10, rbx
010eb 4d8d5aff                       lea        r11, [r10 - 1]
010ef 49c1fb3f                       sar        r11, 0x3f
010f3 49c1eb3d                       shr        r11, 0x3d
010f7 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
010fc 4983e2f8                       and        r10, 0xfffffffffffffff8
01100 4c03d3                         add        r10, rbx
01103 493bda                         cmp        rbx, r10
01106 490f4cda                       cmovl      rbx, r10
0110a 448bdb                         mov        r11d, ebx
0110d 458d5308                       lea        r10d, [r11 + 8]
01111 442b9c24c0000000               sub        r11d, dword ptr [rsp + 0xc0]
01119 4d63ea                         movsxd     r13, r10d
0111c 4c03e8                         add        r13, rax
0111f 4183c308                       add        r11d, 8
01123 4d63d3                         movsxd     r10, r11d
01126 4c03d0                         add        r10, rax
01129 498d5d48                       lea        rbx, [r13 + 0x48]
0112d 4983c508                       add        r13, 8
01131 498d7208                       lea        rsi, [r10 + 8]
01135 4533db                         xor        r11d, r11d
01138 483bde                         cmp        rbx, rsi
0113b 410f96c3                       setbe      r11b
0113f 4983c248                       add        r10, 0x48
01143 33f6                           xor        esi, esi
01145 4d3bd5                         cmp        r10, r13
01148 400f96c6                       setbe      sil
0114c 440bde                         or         r11d, esi
0114f 0f84c7150000                   je         0x7ff77bbd239c
01155 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
0115d 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01164 0f8f1a160000                   jg         0x7ff77bbd2404
0116a 452bc8                         sub        r9d, r8d
0116d 8bff                           mov        edi, edi
0116f eb05                           jmp        0x7ff77bbd0df6
01171 90                             nop        
01172 90                             nop        
01173 90                             nop        
01174 8beb                           mov        ebp, ebx
01176 458d1429                       lea        r10d, [r9 + rbp]
0117a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01182 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01187 448bdd                         mov        r11d, ebp
0118a 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01192 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01197 8d5d08                         lea        ebx, [rbp + 8]
0119a 3bdf                           cmp        ebx, edi
0119c 7cd6                           jl         0x7ff77bbd0df4
0119e 4c8d9208feffff                 lea        r10, [rdx - 0x1f8]
011a5 4981fa00000080                 cmp        r10, -0x80000000
011ac 49c7c300000080                 mov        r11, 0xffffffff80000000
011b3 4d0f4cd3                       cmovl      r10, r11
011b7 458bc2                         mov        r8d, r10d
011ba 413bd8                         cmp        ebx, r8d
011bd 0f8d29160000                   jge        0x7ff77bbd246c
011c3 4c63d3                         movsxd     r10, ebx
011c6 4c03d1                         add        r10, rcx
011c9 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
011ce 0f831f160000                   jae        0x7ff77bbd2473
011d4 81c500020000                   add        ebp, 0x200
011da 4c63d5                         movsxd     r10, ebp
011dd 4c03d1                         add        r10, rcx
011e0 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
011e5 0f831c160000                   jae        0x7ff77bbd2487
011eb 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
011f2 0f8323160000                   jae        0x7ff77bbd249b
011f8 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
011ff 0f832a160000                   jae        0x7ff77bbd24af
01205 4889542440                     mov        qword ptr [rsp + 0x40], rdx
0120a eb06                           jmp        0x7ff77bbd0e92
0120c 90                             nop        
0120d 90                             nop        
0120e 90                             nop        
0120f 90                             nop        
01210 8bda                           mov        ebx, edx
01212 448d9b00010000                 lea        r11d, [rbx + 0x100]
01219 4503d9                         add        r11d, r9d
0121c 448d9380000000                 lea        r10d, [rbx + 0x80]
01223 4503d1                         add        r10d, r9d
01226 418bd3                         mov        edx, r11d
01229 4963eb                         movsxd     rbp, r11d
0122c 418bfa                         mov        edi, r10d
0122f 4d63ea                         movsxd     r13, r10d
01232 8bc3                           mov        eax, ebx
01234 418d3419                       lea        esi, [r9 + rbx]
01238 448bd3                         mov        r10d, ebx
0123b 4d63d2                         movsxd     r10, r10d
0123e 448bde                         mov        r11d, esi
01241 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
01249 62917e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [r14 + r11 + 8]
01254 62d17e487f840608000000         vmovdqu32  zmmword ptr [r14 + rax + 8], zmm0
0125f 4863f6                         movsxd     rsi, esi
01262 62d17e486f843648000000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x48]
0126d 62917e487f841648000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x48], zmm0
01278 62d17e486f843e08000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdi + 8]
01283 62917e487f841688000000         vmovdqu32  zmmword ptr [r14 + r10 + 0x88], zmm0
0128e 62917e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + r13 + 0x48]
01299 62917e487f8416c8000000         vmovdqu32  zmmword ptr [r14 + r10 + 0xc8], zmm0
012a4 62d17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [r14 + rdx + 8]
012af 62917e487f841608010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x108], zmm0
012ba 62d17e486f842e48000000         vmovdqu32  zmm0, zmmword ptr [r14 + rbp + 0x48]
012c5 62917e487f841648010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x148], zmm0
012d0 62d17e486f843688010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x188]
012db 62917e487f841688010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x188], zmm0
012e6 62d17e486f8436c8010000         vmovdqu32  zmm0, zmmword ptr [r14 + rsi + 0x1c8]
012f1 62917e487f8416c8010000         vmovdqu32  zmmword ptr [r14 + r10 + 0x1c8], zmm0
012fc 8d9300020000                   lea        edx, [rbx + 0x200]
01302 413bd0                         cmp        edx, r8d
01305 0f8c05ffffff                   jl         0x7ff77bbd0e90
0130b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01310 4983c3c8                       add        r11, -0x38
01314 4981fb00000080                 cmp        r11, -0x80000000
0131b 49c7c200000080                 mov        r10, 0xffffffff80000000
01322 4d0f4cda                       cmovl      r11, r10
01326 458bdb                         mov        r11d, r11d
01329 413bd3                         cmp        edx, r11d
0132c 7d53                           jge        0x7ff77bbd1001
0132e 81c338020000                   add        ebx, 0x238
01334 4c63d3                         movsxd     r10, ebx
01337 4c03d1                         add        r10, rcx
0133a 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0133f 0f8323180000                   jae        0x7ff77bbd27e8
01345 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
0134c 0f833e180000                   jae        0x7ff77bbd2810
01352 90                             nop        
01353 90                             nop        
01354 448bc2                         mov        r8d, edx
01357 458d1411                       lea        r10d, [r9 + rdx]
0135b 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01363 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
0136e 62b17e487f840308000000         vmovdqu32  zmmword ptr [rbx + r8 + 8], zmm0
01379 83c240                         add        edx, 0x40
0137c 413bd3                         cmp        edx, r11d
0137f 7cd3                           jl         0x7ff77bbd0fd4
01381 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
01388 7d4b                           jge        0x7ff77bbd1055
0138a 4c63d2                         movsxd     r10, edx
0138d 4c03d1                         add        r10, rcx
01390 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01395 0f83e1170000                   jae        0x7ff77bbd27fc
0139b 3b9424b0000000                 cmp        edx, dword ptr [rsp + 0xb0]
013a2 0f83fc170000                   jae        0x7ff77bbd2824
013a8 458d1c11                       lea        r11d, [r9 + rdx]
013ac 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
013b4 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
013b9 448bc2                         mov        r8d, edx
013bc 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
013c4 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
013c9 83c208                         add        edx, 8
013cc 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
013d3 7cd3                           jl         0x7ff77bbd1028
013d5 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
013dc e968f3ffff                     jmp        0x7ff77bbd03c9
013e1 90                             nop        
013e2 90                             nop        
013e3 90                             nop        
013e4 89bc24c4000000                 mov        dword ptr [rsp + 0xc4], edi
013eb 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
013f3 458bda                         mov        r11d, r10d
013f6 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
013fe 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
01406 c4a17a6f441f08                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 8]
0140d 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
01415 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
0141c 8bbc24c4000000                 mov        edi, dword ptr [rsp + 0xc4]
01423 83c710                         add        edi, 0x10
01426 3bfb                           cmp        edi, ebx
01428 7cba                           jl         0x7ff77bbd1064
0142a 4881c110ffffff                 add        rcx, -0xf0
01431 4881f900000080                 cmp        rcx, -0x80000000
01438 49c7c300000080                 mov        r11, 0xffffffff80000000
0143f 490f4ccb                       cmovl      rcx, r11
01443 448bc1                         mov        r8d, ecx
01446 413bf8                         cmp        edi, r8d
01449 0f8d72010000                   jge        0x7ff77bbd1241
0144f 4c63df                         movsxd     r11, edi
01452 4d03d9                         add        r11, r9
01455 4c3bda                         cmp        r11, rdx
01458 0f83ba160000                   jae        0x7ff77bbd2798
0145e 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
01466 4181c300010000                 add        r11d, 0x100
0146d 4963cb                         movsxd     rcx, r11d
01470 4903c9                         add        rcx, r9
01473 483bca                         cmp        rcx, rdx
01476 0f83b0160000                   jae        0x7ff77bbd27ac
0147c 3bbc24b4000000                 cmp        edi, dword ptr [rsp + 0xb4]
01483 0f83b7160000                   jae        0x7ff77bbd27c0
01489 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
01491 0f83bd160000                   jae        0x7ff77bbd27d4
01497 90                             nop        
01498 90                             nop        
01499 90                             nop        
0149a 90                             nop        
0149b 90                             nop        
0149c 90                             nop        
0149d 90                             nop        
0149e 90                             nop        
0149f 90                             nop        
014a0 448bdf                         mov        r11d, edi
014a3 4963db                         movsxd     rbx, r11d
014a6 458d1c3a                       lea        r11d, [r10 + rdi]
014aa 8bcf                           mov        ecx, edi
014ac 418bf3                         mov        esi, r11d
014af 488b842498000000               mov        rax, qword ptr [rsp + 0x98]
014b7 c5fa6f443008                   vmovdqu    xmm0, xmmword ptr [rax + rsi + 8]
014bd 488bb424e0000000               mov        rsi, qword ptr [rsp + 0xe0]
014c5 c5fa7f440e08                   vmovdqu    xmmword ptr [rsi + rcx + 8], xmm0
014cb 4963cb                         movsxd     rcx, r11d
014ce c5fa6f440818                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x18]
014d4 c5fa7f441e18                   vmovdqu    xmmword ptr [rsi + rbx + 0x18], xmm0
014da c5fa6f440828                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x28]
014e0 c5fa7f441e28                   vmovdqu    xmmword ptr [rsi + rbx + 0x28], xmm0
014e6 c5fa6f440838                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x38]
014ec c5fa7f441e38                   vmovdqu    xmmword ptr [rsi + rbx + 0x38], xmm0
014f2 c5fa6f440848                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x48]
014f8 c5fa7f441e48                   vmovdqu    xmmword ptr [rsi + rbx + 0x48], xmm0
014fe c5fa6f440858                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x58]
01504 c5fa7f441e58                   vmovdqu    xmmword ptr [rsi + rbx + 0x58], xmm0
0150a c5fa6f440868                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x68]
01510 c5fa7f441e68                   vmovdqu    xmmword ptr [rsi + rbx + 0x68], xmm0
01516 c5fa6f440878                   vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x78]
0151c c5fa7f441e78                   vmovdqu    xmmword ptr [rsi + rbx + 0x78], xmm0
01522 c5fa6f840888000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x88]
0152b c5fa7f841e88000000             vmovdqu    xmmword ptr [rsi + rbx + 0x88], xmm0
01534 c5fa6f840898000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0x98]
0153d c5fa7f841e98000000             vmovdqu    xmmword ptr [rsi + rbx + 0x98], xmm0
01546 c5fa6f8408a8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xa8]
0154f c5fa7f841ea8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xa8], xmm0
01558 c5fa6f8408b8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xb8]
01561 c5fa7f841eb8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xb8], xmm0
0156a c5fa6f8408c8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xc8]
01573 c5fa7f841ec8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xc8], xmm0
0157c c5fa6f8408d8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xd8]
01585 c5fa7f841ed8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xd8], xmm0
0158e c5fa6f8408e8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xe8]
01597 c5fa7f841ee8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xe8], xmm0
015a0 c5fa6f8408f8000000             vmovdqu    xmm0, xmmword ptr [rax + rcx + 0xf8]
015a9 c5fa7f841ef8000000             vmovdqu    xmmword ptr [rsi + rbx + 0xf8], xmm0
015b2 81c700010000                   add        edi, 0x100
015b8 413bf8                         cmp        edi, r8d
015bb 0f8cdffeffff                   jl         0x7ff77bbd1120
015c1 413bfd                         cmp        edi, r13d
015c4 7d4b                           jge        0x7ff77bbd1291
015c6 4c63df                         movsxd     r11, edi
015c9 4d03d9                         add        r11, r9
015cc 4c3bda                         cmp        r11, rdx
015cf 0f83e3150000                   jae        0x7ff77bbd2838
015d5 3bbc24b4000000                 cmp        edi, dword ptr [rsp + 0xb4]
015dc 0f83ea150000                   jae        0x7ff77bbd284c
015e2 90                             nop        
015e3 90                             nop        
015e4 458d043a                       lea        r8d, [r10 + rdi]
015e8 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
015f0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
015f7 448bdf                         mov        r11d, edi
015fa 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
01602 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
01609 83c710                         add        edi, 0x10
0160c 413bfd                         cmp        edi, r13d
0160f 7cd3                           jl         0x7ff77bbd1264
01611 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01619 4503d6                         add        r10d, r14d
0161c 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01624 4489ac24b8000000               mov        dword ptr [rsp + 0xb8], r13d
0162c e915f3ffff                     jmp        0x7ff77bbd05c6
01631 bee4ffffff                     mov        esi, 0xffffffe4
01636 488b2c24                       mov        rbp, qword ptr [rsp]
0163a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0163f 4489542408                     mov        dword ptr [rsp + 8], r10d
01644 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01649 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0164e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01653 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01658 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0165c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01661 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01666 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0166b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01670 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01675 90                             nop        
01676 90                             nop        
01677 90                             nop        
01678 c5f877                         vzeroupper 
0167b e860c7afff                     call       0x7ff77b6cda60
01680 0f1f840078170008               nop        dword ptr [rax + rax + 0x8001778]
01688 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01692 4883e4f0                       and        rsp, 0xfffffffffffffff0
01696 e8c5e81818                     call       0x7ff793d5fbe0
0169b f4                             hlt        
0169c bee4ffffff                     mov        esi, 0xffffffe4
016a1 488b2c24                       mov        rbp, qword ptr [rsp]
016a5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016aa 44895c2408                     mov        dword ptr [rsp + 8], r11d
016af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016b9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016be 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016c3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016c7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016cc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016d1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
016d6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016db 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
016e0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016e5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
016ea 4489542458                     mov        dword ptr [rsp + 0x58], r10d
016ef 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
016f4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
016f9 4489742478                     mov        dword ptr [rsp + 0x78], r14d
016fe 90                             nop        
016ff 90                             nop        
01700 c5f877                         vzeroupper 
01703 e8d8c6afff                     call       0x7ff77b6cda60
01708 0f1f840000180009               nop        dword ptr [rax + rax + 0x9001800]
01710 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0171a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0171e e83de81818                     call       0x7ff793d5fbe0
01723 f4                             hlt        
01724 bee4ffffff                     mov        esi, 0xffffffe4
01729 488b2c24                       mov        rbp, qword ptr [rsp]
0172d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01732 4489542408                     mov        dword ptr [rsp + 8], r10d
01737 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0173c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01741 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01746 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0174b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01750 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01755 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0175a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0175f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01764 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01769 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0176e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01776 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0177b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01780 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01785 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0178d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01792 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01797 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0179c 895c2478                       mov        dword ptr [rsp + 0x78], ebx
017a0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017a9 90                             nop        
017aa 90                             nop        
017ab 90                             nop        
017ac c5f877                         vzeroupper 
017af e82cc6afff                     call       0x7ff77b6cda60
017b4 0f1f8400ac18000a               nop        dword ptr [rax + rax + 0xa0018ac]
017bc 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
017c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ca e891e71818                     call       0x7ff793d5fbe0
017cf f4                             hlt        
017d0 bee4ffffff                     mov        esi, 0xffffffe4
017d5 488b2c24                       mov        rbp, qword ptr [rsp]
017d9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017de 44895c2408                     mov        dword ptr [rsp + 8], r11d
017e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017ed 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017f2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017f7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
017fc 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01801 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01806 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0180b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01810 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01815 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0181a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0181f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01824 c5f877                         vzeroupper 
01827 e8b4c5afff                     call       0x7ff77b6cda60
0182c 0f1f84002419000b               nop        dword ptr [rax + rax + 0xb001924]
01834 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0183e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01842 e819e71818                     call       0x7ff793d5fbe0
01847 f4                             hlt        
01848 be45ffffff                     mov        esi, 0xffffff45
0184d 488b2c24                       mov        rbp, qword ptr [rsp]
01851 4c89442408                     mov        qword ptr [rsp + 8], r8
01856 90                             nop        
01857 90                             nop        
01858 c5f877                         vzeroupper 
0185b e880c5afff                     call       0x7ff77b6cda60
01860 0f1f84005819000c               nop        dword ptr [rax + rax + 0xc001958]
01868 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01872 4883e4f0                       and        rsp, 0xfffffffffffffff0
01876 e8e5e61818                     call       0x7ff793d5fbe0
0187b f4                             hlt        
0187c be45ffffff                     mov        esi, 0xffffff45
01881 488b2c24                       mov        rbp, qword ptr [rsp]
01885 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0188a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0188f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01894 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01899 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0189e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018a3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018a7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018ac 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018b1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018b6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
018bb 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018c0 8954246c                       mov        dword ptr [rsp + 0x6c], edx
018c4 c5f877                         vzeroupper 
018c7 e814c5afff                     call       0x7ff77b6cda60
018cc 0f1f8400c419000d               nop        dword ptr [rax + rax + 0xd0019c4]
018d4 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
018de 4883e4f0                       and        rsp, 0xfffffffffffffff0
018e2 e879e61818                     call       0x7ff793d5fbe0
018e7 f4                             hlt        
018e8 493be8                         cmp        rbp, r8
018eb bdffffffff                     mov        ebp, 0xffffffff
018f0 7c08                           jl         0x7ff77bbd157a
018f2 400f95c5                       setne      bpl
018f6 400fb6ed                       movzx      ebp, bpl
018fa be45ffffff                     mov        esi, 0xffffff45
018ff 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01904 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01909 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0190d 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01912 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01917 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0191c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01921 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01926 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0192b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01930 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01935 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0193a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0193f 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01944 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01949 90                             nop        
0194a 90                             nop        
0194b 90                             nop        
0194c c5f877                         vzeroupper 
0194f e88cc4afff                     call       0x7ff77b6cda60
01954 0f1f84004c1a000e               nop        dword ptr [rax + rax + 0xe001a4c]
0195c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01966 4883e4f0                       and        rsp, 0xfffffffffffffff0
0196a e8f1e51818                     call       0x7ff793d5fbe0
0196f f4                             hlt        
01970 be45ffffff                     mov        esi, 0xffffff45
01975 488b2c24                       mov        rbp, qword ptr [rsp]
01979 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0197e 4489442408                     mov        dword ptr [rsp + 8], r8d
01983 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01988 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0198d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01992 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01997 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0199b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019a0 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
019a5 4489442438                     mov        dword ptr [rsp + 0x38], r8d
019aa 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
019af 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019b4 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
019b9 4489442460                     mov        dword ptr [rsp + 0x60], r8d
019be 4489542470                     mov        dword ptr [rsp + 0x70], r10d
019c3 90                             nop        
019c4 c5f877                         vzeroupper 
019c7 e814c4afff                     call       0x7ff77b6cda60
019cc 0f1f8400c41a000f               nop        dword ptr [rax + rax + 0xf001ac4]
019d4 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
019de 4883e4f0                       and        rsp, 0xfffffffffffffff0
019e2 e879e51818                     call       0x7ff793d5fbe0
019e7 f4                             hlt        
019e8 be45ffffff                     mov        esi, 0xffffff45
019ed 488b2c24                       mov        rbp, qword ptr [rsp]
019f1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019f6 4489542408                     mov        dword ptr [rsp + 8], r10d
019fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a00 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a05 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a0a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a0f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01a13 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a18 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a1d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a22 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a27 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a2c 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a31 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a36 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01a3e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a43 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a48 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a4d 90                             nop        
01a4e 90                             nop        
01a4f 90                             nop        
01a50 c5f877                         vzeroupper 
01a53 e888c3afff                     call       0x7ff77b6cda60
01a58 0f1f8400501b0010               nop        dword ptr [rax + rax + 0x10001b50]
01a60 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01a6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a6e e8ede41818                     call       0x7ff793d5fbe0
01a73 f4                             hlt        
01a74 bee4ffffff                     mov        esi, 0xffffffe4
01a79 488b2c24                       mov        rbp, qword ptr [rsp]
01a7d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a82 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a87 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a8c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a91 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a96 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a9b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01aa0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01aa5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01aaa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01aaf 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ab4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ab9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ac1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ac6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01acb 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01ad0 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01ad8 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01add 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ae2 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ae7 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01aef 90                             nop        
01af0 c5f877                         vzeroupper 
01af3 e8e8c2afff                     call       0x7ff77b6cda60
01af8 0f1f8400f01b0011               nop        dword ptr [rax + rax + 0x11001bf0]
01b00 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0e e84de41818                     call       0x7ff793d5fbe0
01b13 f4                             hlt        
01b14 bee4ffffff                     mov        esi, 0xffffffe4
01b19 488b2c24                       mov        rbp, qword ptr [rsp]
01b1d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b22 4489542408                     mov        dword ptr [rsp + 8], r10d
01b27 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b2c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b31 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b36 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b3b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01b40 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b45 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b4a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b4f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01b54 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b59 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b61 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b66 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01b6b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01b70 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01b78 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01b7d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b82 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b87 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01b8c 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01b91 90                             nop        
01b92 90                             nop        
01b93 90                             nop        
01b94 c5f877                         vzeroupper 
01b97 e844c2afff                     call       0x7ff77b6cda60
01b9c 0f1f8400941c0012               nop        dword ptr [rax + rax + 0x12001c94]
01ba4 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bb2 e8a9e31818                     call       0x7ff793d5fbe0
01bb7 f4                             hlt        
01bb8 4533d2                         xor        r10d, r10d
01bbb 4c891424                       mov        qword ptr [rsp], r10
01bbf e978e5ffff                     jmp        0x7ff77bbcfdbc
01bc4 4533d2                         xor        r10d, r10d
01bc7 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01bcf e997e5ffff                     jmp        0x7ff77bbcfdeb
01bd4 4533d2                         xor        r10d, r10d
01bd7 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01bdf e9b1e5ffff                     jmp        0x7ff77bbcfe15
01be4 4533d2                         xor        r10d, r10d
01be7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bec e9d0e5ffff                     jmp        0x7ff77bbcfe41
01bf1 4533d2                         xor        r10d, r10d
01bf4 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01bfc e9eae5ffff                     jmp        0x7ff77bbcfe6b
01c01 4533d2                         xor        r10d, r10d
01c04 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c0c e909e6ffff                     jmp        0x7ff77bbcfe9a
01c11 4183c108                       add        r9d, 8
01c15 be6effffff                     mov        esi, 0xffffff6e
01c1a 488b2c24                       mov        rbp, qword ptr [rsp]
01c1e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c23 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c28 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c2d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c32 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c37 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c3c 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c40 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01c45 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c4a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01c4f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c54 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c59 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c5e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01c63 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01c68 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c6d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c72 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
01c7a 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c7f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c83 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01c88 c5f877                         vzeroupper 
01c8b e850c1afff                     call       0x7ff77b6cda60
01c90 0f1f8400881d0013               nop        dword ptr [rax + rax + 0x13001d88]
01c98 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01ca2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ca6 e8b5e21818                     call       0x7ff793d5fbe0
01cab f4                             hlt        
01cac 4183c108                       add        r9d, 8
01cb0 be66ffffff                     mov        esi, 0xffffff66
01cb5 488b2c24                       mov        rbp, qword ptr [rsp]
01cb9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01cbe 4489542408                     mov        dword ptr [rsp + 8], r10d
01cc3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cc8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ccd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cd2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cd7 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01cdb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01ce0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ce5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cea 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cef 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01cf4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01cf9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01cfe 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d03 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d08 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d0d 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
01d15 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d1a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d1e 458bd3                         mov        r10d, r11d
01d21 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d26 90                             nop        
01d27 90                             nop        
01d28 c5f877                         vzeroupper 
01d2b e8b0c0afff                     call       0x7ff77b6cda60
01d30 0f1f8400281e0014               nop        dword ptr [rax + rax + 0x14001e28]
01d38 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d46 e815e21818                     call       0x7ff793d5fbe0
01d4b f4                             hlt        
01d4c 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5a e801e21818                     call       0x7ff793d5fbe0
01d5f f4                             hlt        
01d60 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01d6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6e e8ede11818                     call       0x7ff793d5fbe0
01d73 f4                             hlt        
01d74 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01d7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d82 e8d9e11818                     call       0x7ff793d5fbe0
01d87 f4                             hlt        
01d88 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01d92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d96 e8c5e11818                     call       0x7ff793d5fbe0
01d9b f4                             hlt        
01d9c 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01da6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01daa e8b1e11818                     call       0x7ff793d5fbe0
01daf f4                             hlt        
01db0 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
01dba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dbe e89de11818                     call       0x7ff793d5fbe0
01dc3 f4                             hlt        
01dc4 beccffffff                     mov        esi, 0xffffffcc
01dc9 488b2c24                       mov        rbp, qword ptr [rsp]
01dcd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dd2 4489542408                     mov        dword ptr [rsp + 8], r10d
01dd7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ddc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01de1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01de6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01deb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01df0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01df5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01dfa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01dff 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e04 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e09 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e11 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e16 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e1b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e20 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e25 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e2a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
01e32 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e37 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01e3c c5f877                         vzeroupper 
01e3f e89cbfafff                     call       0x7ff77b6cda60
01e44 0f1f84003c1f0015               nop        dword ptr [rax + rax + 0x15001f3c]
01e4c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01e56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e5a e801e11818                     call       0x7ff793d5fbe0
01e5f f4                             hlt        
01e60 beccffffff                     mov        esi, 0xffffffcc
01e65 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e6a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e6f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01e74 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e79 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e7e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e83 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01e88 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e8d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e95 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e9a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e9f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01ea4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01eac 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01eb1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01eb6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01ebb 90                             nop        
01ebc c5f877                         vzeroupper 
01ebf e81cbfafff                     call       0x7ff77b6cda60
01ec4 0f1f8400bc1f0016               nop        dword ptr [rax + rax + 0x16001fbc]
01ecc 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01ed6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eda e881e01818                     call       0x7ff793d5fbe0
01edf f4                             hlt        
01ee0 bee4ffffff                     mov        esi, 0xffffffe4
01ee5 488b2c24                       mov        rbp, qword ptr [rsp]
01ee9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01eee 4489542408                     mov        dword ptr [rsp + 8], r10d
01ef3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ef8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01efd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f02 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f07 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f0b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f10 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01f15 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f1a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f1f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f24 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01f29 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f2e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01f36 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f3b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f40 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01f45 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f4a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f4f 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01f56 90                             nop        
01f57 90                             nop        
01f58 c5f877                         vzeroupper 
01f5b e880beafff                     call       0x7ff77b6cda60
01f60 0f1f840058200017               nop        dword ptr [rax + rax + 0x17002058]
01f68 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
01f72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f76 e8e5df1818                     call       0x7ff793d5fbe0
01f7b f4                             hlt        
01f7c be6effffff                     mov        esi, 0xffffff6e
01f81 488b2c24                       mov        rbp, qword ptr [rsp]
01f85 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f8a 4489542408                     mov        dword ptr [rsp + 8], r10d
01f8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f99 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f9e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fa3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01fa7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01fac 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01fb1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01fb6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fbb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fc0 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01fc5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01fca 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01fcf 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01fd4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fd9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01fde 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01fe3 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01fe7 90                             nop        
01fe8 c5f877                         vzeroupper 
01feb e8f0bdafff                     call       0x7ff77b6cda60
01ff0 0f1f8400e8200018               nop        dword ptr [rax + rax + 0x180020e8]
01ff8 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02002 4883e4f0                       and        rsp, 0xfffffffffffffff0
02006 e855df1818                     call       0x7ff793d5fbe0
0200b f4                             hlt        
0200c be45ffffff                     mov        esi, 0xffffff45
02011 488b2c24                       mov        rbp, qword ptr [rsp]
02015 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0201a 4489542408                     mov        dword ptr [rsp + 8], r10d
0201f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02024 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02029 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0202e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02033 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02037 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0203c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02041 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02046 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0204b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02050 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02055 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0205a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0205f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02064 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02069 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0206e 89542478                       mov        dword ptr [rsp + 0x78], edx
02072 90                             nop        
02073 90                             nop        
02074 c5f877                         vzeroupper 
02077 e864bdafff                     call       0x7ff77b6cda60
0207c 0f1f840074210019               nop        dword ptr [rax + rax + 0x19002174]
02084 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0208e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02092 e8c9de1818                     call       0x7ff793d5fbe0
02097 f4                             hlt        
02098 be3dffffff                     mov        esi, 0xffffff3d
0209d 488b2c24                       mov        rbp, qword ptr [rsp]
020a1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020a6 44895c2408                     mov        dword ptr [rsp + 8], r11d
020ab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020b0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020b5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020ba 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020bf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020c3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020c8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
020cd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
020d2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020d7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020dc 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
020e1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
020e6 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020eb 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020f0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
020f5 4489542460                     mov        dword ptr [rsp + 0x60], r10d
020fa 89542478                       mov        dword ptr [rsp + 0x78], edx
020fe 90                             nop        
020ff 90                             nop        
02100 c5f877                         vzeroupper 
02103 e8d8bcafff                     call       0x7ff77b6cda60
02108 0f1f84000022001a               nop        dword ptr [rax + rax + 0x1a002200]
02110 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0211a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0211e e83dde1818                     call       0x7ff793d5fbe0
02123 f4                             hlt        
02124 bee4ffffff                     mov        esi, 0xffffffe4
02129 488b2c24                       mov        rbp, qword ptr [rsp]
0212d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02132 44895c2408                     mov        dword ptr [rsp + 8], r11d
02137 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0213c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02141 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02146 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0214b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02150 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02155 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0215a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0215f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02164 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02169 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02171 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02176 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0217b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02180 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02188 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0218d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02192 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02197 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
0219f 90                             nop        
021a0 c5f877                         vzeroupper 
021a3 e838bcafff                     call       0x7ff77b6cda60
021a8 0f1f8400a022001b               nop        dword ptr [rax + rax + 0x1b0022a0]
021b0 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
021ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
021be e89ddd1818                     call       0x7ff793d5fbe0
021c3 f4                             hlt        
021c4 bee4ffffff                     mov        esi, 0xffffffe4
021c9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021ce 4489542414                     mov        dword ptr [rsp + 0x14], r10d
021d3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
021d8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
021dd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021e2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021e7 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
021ec 4489542448                     mov        dword ptr [rsp + 0x48], r10d
021f1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
021f9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
021fe 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02203 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02208 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02210 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02215 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0221a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0221f 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02224 c5f877                         vzeroupper 
02227 e8b4bbafff                     call       0x7ff77b6cda60
0222c 0f1f84002423001c               nop        dword ptr [rax + rax + 0x1c002324]
02234 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0223e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02242 e819dd1818                     call       0x7ff793d5fbe0
02247 f4                             hlt        
02248 418d6901                       lea        ebp, [r9 + 1]
0224c bee4ffffff                     mov        esi, 0xffffffe4
02251 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02256 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0225b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02260 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02265 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0226a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0226f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02274 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02279 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02281 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02286 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0228b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02290 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02298 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0229d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022a2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
022a7 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
022ac c5f877                         vzeroupper 
022af e82cbbafff                     call       0x7ff77b6cda60
022b4 0f1f8400ac23001d               nop        dword ptr [rax + rax + 0x1d0023ac]
022bc 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
022c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ca e891dc1818                     call       0x7ff793d5fbe0
022cf f4                             hlt        
022d0 bee4ffffff                     mov        esi, 0xffffffe4
022d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022da 4489542414                     mov        dword ptr [rsp + 0x14], r10d
022df 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
022e4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
022e9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022ee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022f3 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
022f8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
022fd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02305 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0230a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0230f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02314 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02319 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0231e 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02323 90                             nop        
02324 c5f877                         vzeroupper 
02327 e8b4baafff                     call       0x7ff77b6cda60
0232c 0f1f84002424001e               nop        dword ptr [rax + rax + 0x1e002424]
02334 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0233e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02342 e819dc1818                     call       0x7ff793d5fbe0
02347 f4                             hlt        
02348 bee4ffffff                     mov        esi, 0xffffffe4
0234d 488b2c24                       mov        rbp, qword ptr [rsp]
02351 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02356 4489542408                     mov        dword ptr [rsp + 8], r10d
0235b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02360 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02365 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0236a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0236f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02374 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02379 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0237e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02383 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02388 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0238d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02392 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02397 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0239c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
023a1 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
023a6 90                             nop        
023a7 90                             nop        
023a8 c5f877                         vzeroupper 
023ab e830baafff                     call       0x7ff77b6cda60
023b0 0f1f8400a824001f               nop        dword ptr [rax + rax + 0x1f0024a8]
023b8 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
023c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023c6 e895db1818                     call       0x7ff793d5fbe0
023cb f4                             hlt        
023cc beccffffff                     mov        esi, 0xffffffcc
023d1 488b2c24                       mov        rbp, qword ptr [rsp]
023d5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023da 4489542408                     mov        dword ptr [rsp + 8], r10d
023df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023ee 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023f3 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
023f8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
023fd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02402 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02407 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0240c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02411 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02419 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0241e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02423 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02428 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02430 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02435 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0243a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0243f 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02444 c5f877                         vzeroupper 
02447 e894b9afff                     call       0x7ff77b6cda60
0244c 0f1f840044250020               nop        dword ptr [rax + rax + 0x20002544]
02454 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0245e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02462 e8f9da1818                     call       0x7ff793d5fbe0
02467 f4                             hlt        
02468 be45ffffff                     mov        esi, 0xffffff45
0246d 488b2c24                       mov        rbp, qword ptr [rsp]
02471 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02476 4489542408                     mov        dword ptr [rsp + 8], r10d
0247b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02480 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02485 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0248a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0248f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02494 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02499 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0249e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
024a3 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
024a8 c5f877                         vzeroupper 
024ab e830b9afff                     call       0x7ff77b6cda60
024b0 0f1f8400a8250021               nop        dword ptr [rax + rax + 0x210025a8]
024b8 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
024c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024c6 e895da1818                     call       0x7ff793d5fbe0
024cb f4                             hlt        
024cc bebeffffff                     mov        esi, 0xffffffbe
024d1 488b2c24                       mov        rbp, qword ptr [rsp]
024d5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024da 4489542408                     mov        dword ptr [rsp + 8], r10d
024df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024ee 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024f3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
024f7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
024fc c5f877                         vzeroupper 
024ff e8dcb8afff                     call       0x7ff77b6cda60
02504 0f1f8400fc250022               nop        dword ptr [rax + rax + 0x220025fc]
0250c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02516 4883e4f0                       and        rsp, 0xfffffffffffffff0
0251a e841da1818                     call       0x7ff793d5fbe0
0251f f4                             hlt        
02520 be85ffffff                     mov        esi, 0xffffff85
02525 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
02529 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0252e 44891424                       mov        dword ptr [rsp], r10d
02532 895c2404                       mov        dword ptr [rsp + 4], ebx
02536 4489742408                     mov        dword ptr [rsp + 8], r14d
0253b 90                             nop        
0253c c5f877                         vzeroupper 
0253f e89cb8afff                     call       0x7ff77b6cda60
02544 0f1f84003c260023               nop        dword ptr [rax + rax + 0x2300263c]
0254c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02556 4883e4f0                       and        rsp, 0xfffffffffffffff0
0255a e801da1818                     call       0x7ff793d5fbe0
0255f f4                             hlt        
02560 beccffffff                     mov        esi, 0xffffffcc
02565 488b2c24                       mov        rbp, qword ptr [rsp]
02569 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0256e 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02572 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02577 90                             nop        
02578 c5f877                         vzeroupper 
0257b e860b8afff                     call       0x7ff77b6cda60
02580 0f1f840078260024               nop        dword ptr [rax + rax + 0x24002678]
02588 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02592 4883e4f0                       and        rsp, 0xfffffffffffffff0
02596 e8c5d91818                     call       0x7ff793d5fbe0
0259b f4                             hlt        
0259c bee4ffffff                     mov        esi, 0xffffffe4
025a1 488b2c24                       mov        rbp, qword ptr [rsp]
025a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025aa 4489542408                     mov        dword ptr [rsp + 8], r10d
025af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025b9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025be 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025c3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
025c8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025cd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025d7 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
025dc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025e1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
025e9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
025ee 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
025f3 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
025f8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
025fd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02602 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
0260a 90                             nop        
0260b 90                             nop        
0260c c5f877                         vzeroupper 
0260f e8ccb7afff                     call       0x7ff77b6cda60
02614 0f1f84000c270025               nop        dword ptr [rax + rax + 0x2500270c]
0261c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02626 4883e4f0                       and        rsp, 0xfffffffffffffff0
0262a e831d91818                     call       0x7ff793d5fbe0
0262f f4                             hlt        
02630 bee4ffffff                     mov        esi, 0xffffffe4
02635 488b2c24                       mov        rbp, qword ptr [rsp]
02639 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0263e 4489542408                     mov        dword ptr [rsp + 8], r10d
02643 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02648 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0264d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02652 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02657 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0265c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02661 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02666 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0266b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02670 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02675 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0267a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0267f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02684 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02689 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0268e 90                             nop        
0268f 90                             nop        
02690 c5f877                         vzeroupper 
02693 e848b7afff                     call       0x7ff77b6cda60
02698 0f1f840090270026               nop        dword ptr [rax + rax + 0x26002790]
026a0 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
026aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ae e8add81818                     call       0x7ff793d5fbe0
026b3 f4                             hlt        
026b4 4183c108                       add        r9d, 8
026b8 be6effffff                     mov        esi, 0xffffff6e
026bd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026c2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
026c7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
026cc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026d1 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
026d6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
026db 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026e0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
026e5 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
026ed 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
026f2 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
026f7 90                             nop        
026f8 c5f877                         vzeroupper 
026fb e8e0b6afff                     call       0x7ff77b6cda60
02700 0f1f8400f8270027               nop        dword ptr [rax + rax + 0x270027f8]
02708 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02712 4883e4f0                       and        rsp, 0xfffffffffffffff0
02716 e845d81818                     call       0x7ff793d5fbe0
0271b f4                             hlt        
0271c 4183c108                       add        r9d, 8
02720 beb6ffffff                     mov        esi, 0xffffffb6
02725 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0272a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0272f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02734 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02739 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0273e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02743 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02748 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0274d 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
02755 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
0275a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0275f 90                             nop        
02760 c5f877                         vzeroupper 
02763 e878b6afff                     call       0x7ff77b6cda60
02768 0f1f840060280028               nop        dword ptr [rax + rax + 0x28002860]
02770 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0277a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0277e e8ddd71818                     call       0x7ff793d5fbe0
02783 f4                             hlt        
02784 4183c108                       add        r9d, 8
02788 be66ffffff                     mov        esi, 0xffffff66
0278d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02792 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02797 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0279c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027a1 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
027a6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
027ab 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027b0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
027b5 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
027bd 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
027c2 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
027c7 90                             nop        
027c8 c5f877                         vzeroupper 
027cb e810b6afff                     call       0x7ff77b6cda60
027d0 0f1f8400c8280029               nop        dword ptr [rax + rax + 0x290028c8]
027d8 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
027e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027e6 e875d71818                     call       0x7ff793d5fbe0
027eb f4                             hlt        
027ec 8bd3                           mov        edx, ebx
027ee e98eebffff                     jmp        0x7ff77bbd1001
027f3 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
027fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
02801 e85ad71818                     call       0x7ff793d5fbe0
02806 f4                             hlt        
02807 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02811 4883e4f0                       and        rsp, 0xfffffffffffffff0
02815 e846d71818                     call       0x7ff793d5fbe0
0281a f4                             hlt        
0281b 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02825 4883e4f0                       and        rsp, 0xfffffffffffffff0
02829 e832d71818                     call       0x7ff793d5fbe0
0282e f4                             hlt        
0282f 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02839 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283d e81ed71818                     call       0x7ff793d5fbe0
02842 f4                             hlt        
02843 bee4ffffff                     mov        esi, 0xffffffe4
02848 488b2c24                       mov        rbp, qword ptr [rsp]
0284c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02851 44895c2408                     mov        dword ptr [rsp + 8], r11d
02856 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0285b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02860 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02865 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0286a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0286f 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02874 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02879 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0287e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02883 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02888 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02890 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02895 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0289a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0289f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028a4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
028a9 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
028ae 895c2470                       mov        dword ptr [rsp + 0x70], ebx
028b2 4489742474                     mov        dword ptr [rsp + 0x74], r14d
028b7 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
028bf 90                             nop        
028c0 c5f877                         vzeroupper 
028c3 e818b5afff                     call       0x7ff77b6cda60
028c8 0f1f8400c029002a               nop        dword ptr [rax + rax + 0x2a0029c0]
028d0 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
028da 4883e4f0                       and        rsp, 0xfffffffffffffff0
028de e87dd61818                     call       0x7ff793d5fbe0
028e3 f4                             hlt        
028e4 c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
028ed bee4ffffff                     mov        esi, 0xffffffe4
028f2 488b2c24                       mov        rbp, qword ptr [rsp]
028f6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
028fb 4489542408                     mov        dword ptr [rsp + 8], r10d
02900 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02905 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0290a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0290f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02914 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02919 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0291e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02923 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02928 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0292d 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02932 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0293a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0293f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02944 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02949 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0294e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02953 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02958 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0295d 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02964 c5f877                         vzeroupper 
02967 e874b4afff                     call       0x7ff77b6cda60
0296c 0f1f8400642a002b               nop        dword ptr [rax + rax + 0x2b002a64]
02974 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
0297e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02982 e8d9d51818                     call       0x7ff793d5fbe0
02987 f4                             hlt        
02988 beccffffff                     mov        esi, 0xffffffcc
0298d 488b2c24                       mov        rbp, qword ptr [rsp]
02991 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02996 4489542408                     mov        dword ptr [rsp + 8], r10d
0299b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
029a0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029a5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
029aa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
029af 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
029b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
029b9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029be 4c89542440                     mov        qword ptr [rsp + 0x40], r10
029c3 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
029c8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
029cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
029d5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
029da 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
029df 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
029e4 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
029ec 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029f1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
029f6 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
029fb 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02a00 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02a04 c5f877                         vzeroupper 
02a07 e8d4b3afff                     call       0x7ff77b6cda60
02a0c 0f1f8400042b002c               nop        dword ptr [rax + rax + 0x2c002b04]
02a14 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02a1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a22 e839d51818                     call       0x7ff793d5fbe0
02a27 f4                             hlt        
02a28 418bee                         mov        ebp, r14d
02a2b 83c510                         add        ebp, 0x10
02a2e be6effffff                     mov        esi, 0xffffff6e
02a33 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02a38 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02a3d 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02a42 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02a47 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02a4c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a51 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a56 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02a5b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a60 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02a65 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02a6a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a6f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02a74 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02a79 90                             nop        
02a7a 90                             nop        
02a7b 90                             nop        
02a7c c5f877                         vzeroupper 
02a7f e85cb3afff                     call       0x7ff77b6cda60
02a84 0f1f84007c2b002d               nop        dword ptr [rax + rax + 0x2d002b7c]
02a8c 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02a96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a9a e8c1d41818                     call       0x7ff793d5fbe0
02a9f f4                             hlt        
02aa0 418bee                         mov        ebp, r14d
02aa3 83c510                         add        ebp, 0x10
02aa6 be66ffffff                     mov        esi, 0xffffff66
02aab 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02ab0 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02ab5 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02aba 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02abf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02ac4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02ac9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02ace 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02ad3 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02ad8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02add 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02ae2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ae7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02aec 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02af1 90                             nop        
02af2 90                             nop        
02af3 90                             nop        
02af4 c5f877                         vzeroupper 
02af7 e8e4b2afff                     call       0x7ff77b6cda60
02afc 0f1f8400f42b002e               nop        dword ptr [rax + rax + 0x2e002bf4]
02b04 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02b0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b12 e849d41818                     call       0x7ff793d5fbe0
02b17 f4                             hlt        
02b18 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b26 e835d41818                     call       0x7ff793d5fbe0
02b2b f4                             hlt        
02b2c 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3a e821d41818                     call       0x7ff793d5fbe0
02b3f f4                             hlt        
02b40 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b4e e80dd41818                     call       0x7ff793d5fbe0
02b53 f4                             hlt        
02b54 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b62 e8f9d31818                     call       0x7ff793d5fbe0
02b67 f4                             hlt        
02b68 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b76 e8e5d31818                     call       0x7ff793d5fbe0
02b7b f4                             hlt        
02b7c 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8a e8d1d31818                     call       0x7ff793d5fbe0
02b8f f4                             hlt        
02b90 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02b9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b9e e8bdd31818                     call       0x7ff793d5fbe0
02ba3 f4                             hlt        
02ba4 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bb2 e8a9d31818                     call       0x7ff793d5fbe0
02bb7 f4                             hlt        
02bb8 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02bc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bc6 e895d31818                     call       0x7ff793d5fbe0
02bcb f4                             hlt        
02bcc 48bfe0184654f77f0000           movabs     rdi, 0x7ff7544618e0
02bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bda e881d31818                     call       0x7ff793d5fbe0
02bdf f4                             hlt        
02be0 488bf0                         mov        rsi, rax
02be3 eb0d                           jmp        0x7ff77bbd2872
02be5 488bf0                         mov        rsi, rax
02be8 eb08                           jmp        0x7ff77bbd2872
02bea 488bf0                         mov        rsi, rax
02bed eb03                           jmp        0x7ff77bbd2872
02bef 488bf0                         mov        rsi, rax
02bf2 c5f877                         vzeroupper 
02bf5 4881c400010000                 add        rsp, 0x100
02bfc 5d                             pop        rbp
02bfd e95e50afff                     jmp        0x7ff77b6c78e0
02c02 bef6ffffff                     mov        esi, 0xfffffff6
02c07 90                             nop        
02c08 c5f877                         vzeroupper 
02c0b e8d0b1afff                     call       0x7ff77b6cda60
02c10 0f1f8400082d002f               nop        dword ptr [rax + rax + 0x2f002d08]
02c18 48bfe0531954f77f0000           movabs     rdi, 0x7ff7541953e0
02c22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c26 e835d31818                     call       0x7ff793d5fbe0
02c2b f4                             hlt        
02c2c 49bae00abd7bf77f0000           movabs     r10, 0x7ff77bbd0ae0
02c36 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02c3d e99efab5ff                     jmp        0x7ff77b732360
02c42 e819c9b4ff                     call       0x7ff77b71f1e0
02c47 e9e2d3ffff                     jmp        0x7ff77bbcfcae
02c4c f4                             hlt        
02c4d f4                             hlt        
02c4e f4                             hlt        
02c4f f4                             hlt        
