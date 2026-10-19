00000 e8fb763c17                     call       0x7ff8eef9a300
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
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85b4220000                   jne        0x7ff8d7bd4ee2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004d 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00095 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 448b9ef8000000                 mov        r11d, dword ptr [rsi + 0xf8]
000ad 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b2 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
000b9 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000c0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000ed 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000f2 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000f6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49ba70ca15eff87f0000           movabs     r10, 0x7ff8ef15ca70
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84e4150000                   je         0x7ff8d7bd4314
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15410000                 cmp        r11d, 0x4115
0013e 0f85f8160000                   jne        0x7ff8d7bd443c
00144 4c891424                       mov        qword ptr [rsp], r10
00148 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00150 4d85d2                         test       r10, r10
00153 0f84c7150000                   je         0x7ff8d7bd4320
00159 458b12                         mov        r10d, dword ptr [r10]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181faf9060000                 cmp        r10d, 0x6f9
00167 0f85cf160000                   jne        0x7ff8d7bd443c
0016d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00182 4d85d2                         test       r10, r10
00185 0f84a2150000                   je         0x7ff8d7bd432d
0018b 458b12                         mov        r10d, dword ptr [r10]
0018e 41c1ea0d                       shr        r10d, 0xd
00192 4181fafc060000                 cmp        r10d, 0x6fc
00199 0f859d160000                   jne        0x7ff8d7bd443c
0019f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
001a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
001b4 4d85d2                         test       r10, r10
001b7 0f847d150000                   je         0x7ff8d7bd433a
001bd 458b1a                         mov        r11d, dword ptr [r10]
001c0 41c1eb0d                       shr        r11d, 0xd
001c4 4181fbfb060000                 cmp        r11d, 0x6fb
001cb 0f856b160000                   jne        0x7ff8d7bd443c
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001de 4d85d2                         test       r10, r10
001e1 0f8460150000                   je         0x7ff8d7bd4347
001e7 458b12                         mov        r10d, dword ptr [r10]
001ea 41c1ea0d                       shr        r10d, 0xd
001ee 4181fafb060000                 cmp        r10d, 0x6fb
001f5 0f8541160000                   jne        0x7ff8d7bd443c
001fb 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00203 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00208 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00210 4d85d2                         test       r10, r10
00213 0f843b150000                   je         0x7ff8d7bd4354
00219 458b1a                         mov        r11d, dword ptr [r10]
0021c 41c1eb0d                       shr        r11d, 0xd
00220 4181fbf9060000                 cmp        r11d, 0x6f9
00227 0f850f160000                   jne        0x7ff8d7bd443c
0022d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00232 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00237 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023b 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00240 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00245 4585d2                         test       r10d, r10d
00248 0f8413150000                   je         0x7ff8d7bd4361
0024e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00253 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00257 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0025c 458d53f1                       lea        r10d, [r11 - 0xf]
00260 4585d2                         test       r10d, r10d
00263 0f8cf8140000                   jl         0x7ff8d7bd4361
00269 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0026e 458b5204                       mov        r10d, dword ptr [r10 + 4]
00272 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0027a 458d5af1                       lea        r11d, [r10 - 0xf]
0027e 4585db                         test       r11d, r11d
00281 0f8cda140000                   jl         0x7ff8d7bd4361
00287 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0028c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00290 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00298 4585db                         test       r11d, r11d
0029b 0f86c0140000                   jbe        0x7ff8d7bd4361
002a1 4183fb01                       cmp        r11d, 1
002a5 0f86b6140000                   jbe        0x7ff8d7bd4361
002ab 4183fb02                       cmp        r11d, 2
002af 0f86ac140000                   jbe        0x7ff8d7bd4361
002b5 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002bd 4183c3f9                       add        r11d, -7
002c1 4585db                         test       r11d, r11d
002c4 0f8c97140000                   jl         0x7ff8d7bd4361
002ca 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002d2 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002da 458d5af1                       lea        r11d, [r10 - 0xf]
002de 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002eb 4183c2f1                       add        r10d, -0xf
002ef 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002f7 e9b6010000                     jmp        0x7ff8d7bd30b2
002fc 4533c0                         xor        r8d, r8d
002ff 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00304 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00309 418b4a0c                       mov        ecx, dword ptr [r10 + 0xc]
0030d 4183fb03                       cmp        r11d, 3
00311 0f8e45020000                   jle        0x7ff8d7bd315c
00317 41894a10                       mov        dword ptr [r10 + 0x10], ecx
0031b 458b4208                       mov        r8d, dword ptr [r10 + 8]
0031f 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00323 4183c3fd                       add        r11d, -3
00327 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0032f 45895a08                       mov        dword ptr [r10 + 8], r11d
00333 4c639c2494000000               movsxd     r11, dword ptr [rsp + 0x94]
0033b 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00340 4c03542440                     add        r10, qword ptr [rsp + 0x40]
00345 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
0034a 4d03d0                         add        r10, r8
0034d 4d3bda                         cmp        r11, r10
00350 0f8f320f0000                   jg         0x7ff8d7bd3e88
00356 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0035e 4585c9                         test       r9d, r9d
00361 0f8ed90d0000                   jle        0x7ff8d7bd3d40
00367 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0036c 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00371 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
00376 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
0037b 0f8f7b0f0000                   jg         0x7ff8d7bd3efc
00381 458bdd                         mov        r11d, r13d
00384 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00389 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
0038e 0f8f74100000                   jg         0x7ff8d7bd4008
00394 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00399 4183fa10                       cmp        r10d, 0x10
0039d 0f8f71110000                   jg         0x7ff8d7bd4114
003a3 443bac2490000000               cmp        r13d, dword ptr [rsp + 0x90]
003ab 0f836b0b0000                   jae        0x7ff8d7bd3b1c
003b1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003b6 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
003bd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003c2 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
003ca 0f83ac0b0000                   jae        0x7ff8d7bd3b7c
003d0 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003d5 4503d5                         add        r10d, r13d
003d8 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003e0 458bd3                         mov        r10d, r11d
003e3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003e8 4503da                         add        r11d, r10d
003eb 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
003f0 4963ca                         movsxd     rcx, r10d
003f3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
003f8 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
003ff 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00404 442b8c2494000000               sub        r9d, dword ptr [rsp + 0x94]
0040c 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
00414 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00419 4183fb10                       cmp        r11d, 0x10
0041d 0f8ff9110000                   jg         0x7ff8d7bd421c
00423 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0042b 4183f910                       cmp        r9d, 0x10
0042f 0f8c07020000                   jl         0x7ff8d7bd323c
00435 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0043d 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00445 0f83e10b0000                   jae        0x7ff8d7bd3c2c
0044b 458bc3                         mov        r8d, r11d
0044e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00453 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0045a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0045f 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00467 0f83370c0000                   jae        0x7ff8d7bd3ca4
0046d 458bc2                         mov        r8d, r10d
00470 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00475 4d63d0                         movsxd     r10, r8d
00478 438d0c03                       lea        ecx, [r11 + r8]
0047c 034c2478                       add        ecx, dword ptr [rsp + 0x78]
00480 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00484 4d63db                         movsxd     r11, r11d
00487 4d03da                         add        r11, r10
0048a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0048f c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00496 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0049a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0049f 41ffc3                         inc        r11d
004a2 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
004a7 418502                         test       dword ptr [r10], eax
004aa 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
004b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
004b7 452bd5                         sub        r10d, r13d
004ba 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004bf 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
004c4 0f8dd8080000                   jge        0x7ff8d7bd39a2
004ca 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
004cf 0f83e7090000                   jae        0x7ff8d7bd3abc
004d5 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
004da 4f8b44c308                     mov        r8, qword ptr [r11 + r8*8 + 8]
004df 458bd8                         mov        r11d, r8d
004e2 4181e3ffff0100                 and        r11d, 0x1ffff
004e9 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
004ee 4d8bd8                         mov        r11, r8
004f1 49c1fb24                       sar        r11, 0x24
004f5 49c1e812                       shr        r8, 0x12
004f9 458bdb                         mov        r11d, r11d
004fc 458bc8                         mov        r9d, r8d
004ff 4181e1ffff0300                 and        r9d, 0x3ffff
00506 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
0050b 4585db                         test       r11d, r11d
0050e 0f8c600c0000                   jl         0x7ff8d7bd3d74
00514 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00519 4585c0                         test       r8d, r8d
0051c 0f84dafdffff                   je         0x7ff8d7bd2efc
00522 453bc2                         cmp        r8d, r10d
00525 0f8ed9fdffff                   jle        0x7ff8d7bd2f04
0052b be45ffffff                     mov        esi, 0xffffff45
00530 418be8                         mov        ebp, r8d
00533 44891424                       mov        dword ptr [rsp], r10d
00537 90                             nop        
00538 c5f877                         vzeroupper 
0053b e820a9afff                     call       0x7ff8d76cda60
00540 0f1f840038060001               nop        dword ptr [rax + rax + 0x1000638]
00548 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
00552 4883e4f0                       and        rsp, 0xfffffffffffffff0
00556 e8859a1917                     call       0x7ff8eed6cbe0
0055b f4                             hlt        
0055c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00561 4585d2                         test       r10d, r10d
00564 7403                           je         0x7ff8d7bd3169
00566 41ffcb                         dec        r11d
00569 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0056e 458b4208                       mov        r8d, dword ptr [r10 + 8]
00572 4585db                         test       r11d, r11d
00575 747c                           je         0x7ff8d7bd31f3
00577 4183fb03                       cmp        r11d, 3
0057b 0f84ca080000                   je         0x7ff8d7bd3a4b
00581 4183fb02                       cmp        r11d, 2
00585 7779                           ja         0x7ff8d7bd3200
00587 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
0058f 0f83eb120000                   jae        0x7ff8d7bd4480
00595 478b449a08                     mov        r8d, dword ptr [r10 + r11*4 + 8]
0059a 4585db                         test       r11d, r11d
0059d 7e4b                           jle        0x7ff8d7bd31ea
0059f 458d53ff                       lea        r10d, [r11 - 1]
005a3 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
005ab 0f836f170000                   jae        0x7ff8d7bd4920
005b1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005b6 458bca                         mov        r9d, r10d
005b9 4183c1cc                       add        r9d, -0x34
005bd 41c1e902                       shr        r9d, 2
005c1 478d5419ff                     lea        r10d, [r9 + r11 - 1]
005c6 4533c9                         xor        r9d, r9d
005c9 4963cb                         movsxd     rcx, r11d
005cc bb04000000                     mov        ebx, 4
005d1 c442e0f5d2                     bzhi       r10, r10, rbx
005d6 492bca                         sub        rcx, r10
005d9 48ffc9                         dec        rcx
005dc 4885c9                         test       rcx, rcx
005df 490f4cc9                       cmovl      rcx, r9
005e3 8bc9                           mov        ecx, ecx
005e5 e9f5050000                     jmp        0x7ff8d7bd37df
005ea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005ef 45894208                       mov        dword ptr [r10 + 8], r8d
005f3 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
005fb e933fdffff                     jmp        0x7ff8d7bd2f33
00600 48bee0b272e200000000           movabs     rsi, 0xe272b2e0
0060a 418bed                         mov        ebp, r13d
0060d 90                             nop        
0060e 90                             nop        
0060f 90                             nop        
00610 c5f877                         vzeroupper 
00613 e848cab5ff                     call       0x7ff8d772fc60
00618 0f1f840010070002               nop        dword ptr [rax + rax + 0x2000710]
00620 4885c0                         test       rax, rax
00623 0f8473130000                   je         0x7ff8d7bd459c
00629 488bf0                         mov        rsi, rax
0062c c5f877                         vzeroupper 
0062f 4881c4c0000000                 add        rsp, 0xc0
00636 5d                             pop        rbp
00637 e92429afff                     jmp        0x7ff8d76c5b60
0063c 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00641 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00646 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
0064b 0f8df3020000                   jge        0x7ff8d7bd3544
00651 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00656 4183c308                       add        r11d, 8
0065a 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00662 4183f908                       cmp        r9d, 8
00666 0f8da5010000                   jge        0x7ff8d7bd3411
0066c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00674 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0067c 0f830e180000                   jae        0x7ff8d7bd4a90
00682 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00687 430fbe6c1808                   movsx      ebp, byte ptr [r8 + r11 + 8]
0068d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00692 443b842480000000               cmp        r8d, dword ptr [rsp + 0x80]
0069a 0f83c8180000                   jae        0x7ff8d7bd4b68
006a0 4d63da                         movsxd     r11, r10d
006a3 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
006a8 4d03c3                         add        r8, r11
006ab 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006b0 43886c0308                     mov        byte ptr [r11 + r8 + 8], bpl
006b5 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006bd 4183c303                       add        r11d, 3
006c1 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
006c6 41ffc0                         inc        r8d
006c9 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
006d1 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
006d9 0f8305190000                   jae        0x7ff8d7bd4be4
006df 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006e4 4183c303                       add        r11d, 3
006e8 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
006f0 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
006f5 430fbe6c0109                   movsx      ebp, byte ptr [r9 + r8 + 9]
006fb 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00703 0f8373190000                   jae        0x7ff8d7bd4c7c
00709 4d63d2                         movsxd     r10, r10d
0070c 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
00711 4d03da                         add        r11, r10
00714 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00719 470fbe54010a                   movsx      r10d, byte ptr [r9 + r8 + 0xa]
0071f 478854190a                     mov        byte ptr [r9 + r11 + 0xa], r10b
00724 470fbe44010b                   movsx      r8d, byte ptr [r9 + r8 + 0xb]
0072a 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
0072f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00737 4183fb08                       cmp        r11d, 8
0073b 0f83cb190000                   jae        0x7ff8d7bd4d0c
00741 49ba20ec70e200000000           movabs     r10, 0xe270ec20
0074b 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00753 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00758 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0075d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00762 4183fa04                       cmp        r10d, 4
00766 7e3c                           jle        0x7ff8d7bd33a4
00768 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
0076c 83c504                         add        ebp, 4
0076f 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00774 418bd1                         mov        edx, r9d
00777 90                             nop        
00778 c5f877                         vzeroupper 
0077b e8e0c8b5ff                     call       0x7ff8d772fc60
00780 0f1f840078080003               nop        dword ptr [rax + rax + 0x3000878]
00788 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0078d 8bd5                           mov        edx, ebp
0078f 8bc8                           mov        ecx, eax
00791 90                             nop        
00792 90                             nop        
00793 90                             nop        
00794 c5f877                         vzeroupper 
00797 e8c4c8b5ff                     call       0x7ff8d772fc60
0079c 0f1f840094080004               nop        dword ptr [rax + rax + 0x4000894]
007a4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
007a9 4183fa08                       cmp        r10d, 8
007ad 0f8ee3fcffff                   jle        0x7ff8d7bd3096
007b3 49ba48ec70e200000000           movabs     r10, 0xe270ec48
007bd 8b542414                       mov        edx, dword ptr [rsp + 0x14]
007c1 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007c9 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
007ce 83c208                         add        edx, 8
007d1 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007d6 90                             nop        
007d7 90                             nop        
007d8 c5f877                         vzeroupper 
007db e880c8b5ff                     call       0x7ff8d772fc60
007e0 0f1f8400d8080005               nop        dword ptr [rax + rax + 0x50008d8]
007e8 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
007ec 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
007f1 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
007f8 488bc8                         mov        rcx, rax
007fb 90                             nop        
007fc c5f877                         vzeroupper 
007ff e85cc8b5ff                     call       0x7ff8d772fc60
00804 0f1f8400fc080006               nop        dword ptr [rax + rax + 0x60008fc]
0080c e985fcffff                     jmp        0x7ff8d7bd3096
00811 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00816 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
0081d 90                             nop        
0081e 90                             nop        
0081f 90                             nop        
00820 c5f877                         vzeroupper 
00823 e838c8b5ff                     call       0x7ff8d772fc60
00828 0f1f840020090007               nop        dword ptr [rax + rax + 0x7000920]
00830 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00835 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00839 488bc8                         mov        rcx, rax
0083c c5f877                         vzeroupper 
0083f e81cc8b5ff                     call       0x7ff8d772fc60
00844 0f1f84003c090008               nop        dword ptr [rax + rax + 0x800093c]
0084c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00854 4183c308                       add        r11d, 8
00858 be95ffffff                     mov        esi, 0xffffff95
0085d 488b2c24                       mov        rbp, qword ptr [rsp]
00861 48ff742408                     push       qword ptr [rsp + 8]
00866 488f0424                       pop        qword ptr [rsp]
0086a 48894424f8                     mov        qword ptr [rsp - 8], rax
0086f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00873 89442408                       mov        dword ptr [rsp + 8], eax
00877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0087c 48ff742418                     push       qword ptr [rsp + 0x18]
00881 488f442410                     pop        qword ptr [rsp + 0x10]
00886 48ff742420                     push       qword ptr [rsp + 0x20]
0088b 488f442418                     pop        qword ptr [rsp + 0x18]
00890 48894424f8                     mov        qword ptr [rsp - 8], rax
00895 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00899 8944240c                       mov        dword ptr [rsp + 0xc], eax
0089d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a2 48ff742430                     push       qword ptr [rsp + 0x30]
008a7 488f442428                     pop        qword ptr [rsp + 0x28]
008ac 48894424f8                     mov        qword ptr [rsp - 8], rax
008b1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
008b5 89442434                       mov        dword ptr [rsp + 0x34], eax
008b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008be 48894424f8                     mov        qword ptr [rsp - 8], rax
008c3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
008c7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
008cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008d0 48ff742450                     push       qword ptr [rsp + 0x50]
008d5 488f442448                     pop        qword ptr [rsp + 0x48]
008da 48ff742458                     push       qword ptr [rsp + 0x58]
008df 488f442450                     pop        qword ptr [rsp + 0x50]
008e4 48894424f8                     mov        qword ptr [rsp - 8], rax
008e9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008ed 89442458                       mov        dword ptr [rsp + 0x58], eax
008f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008f6 48894424f8                     mov        qword ptr [rsp - 8], rax
008fb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
008ff 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00908 48894424f8                     mov        qword ptr [rsp - 8], rax
0090d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00911 89442460                       mov        dword ptr [rsp + 0x60], eax
00915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0091a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0091f 90                             nop        
00920 c5f877                         vzeroupper 
00923 e838a5afff                     call       0x7ff8d76cda60
00928 0f1f8400200a0009               nop        dword ptr [rax + rax + 0x9000a20]
00930 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0093a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0093e e89d961917                     call       0x7ff8eed6cbe0
00943 f4                             hlt        
00944 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00949 4183fb30                       cmp        r11d, 0x30
0094d 0f8ffb010000                   jg         0x7ff8d7bd374e
00953 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0095b 4183c0f9                       add        r8d, -7
0095f 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00967 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0096f 453bd8                         cmp        r11d, r8d
00972 0f8350100000                   jae        0x7ff8d7bd45c8
00978 458bc3                         mov        r8d, r11d
0097b 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00983 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00988 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
0098d 4c899c24a0000000               mov        qword ptr [rsp + 0xa0], r11
00995 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0099a 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
009a2 0f83c4100000                   jae        0x7ff8d7bd466c
009a8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
009ad 4d63d2                         movsxd     r10, r10d
009b0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
009b5 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
009ba 4d63db                         movsxd     r11, r11d
009bd 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
009c2 418be8                         mov        ebp, r8d
009c5 48be28c122e200000000           movabs     rsi, 0xe222c128
009cf 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009d4 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009dc 4533c9                         xor        r9d, r9d
009df 90                             nop        
009e0 c5f877                         vzeroupper 
009e3 e878bcb5ff                     call       0x7ff8d772f260
009e8 0f1f8400e00a000a               nop        dword ptr [rax + rax + 0xa000ae0]
009f0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
009f5 44035c2414                     add        r11d, dword ptr [rsp + 0x14]
009fa 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
009ff 458d5308                       lea        r10d, [r11 + 8]
00a03 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a0b 458bda                         mov        r11d, r10d
00a0e 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00a13 0f8d21010000                   jge        0x7ff8d7bd373a
00a19 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a21 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
00a26 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00a2b 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
00a33 4983c0f9                       add        r8, -7
00a37 48634c2414                     movsxd     rcx, dword ptr [rsp + 0x14]
00a3c 4d63ca                         movsxd     r9, r10d
00a3f 4d8d1409                       lea        r10, [r9 + rcx]
00a43 4d3bd0                         cmp        r10, r8
00a46 0f833c110000                   jae        0x7ff8d7bd4788
00a4c 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00a51 4d2bd1                         sub        r10, r9
00a54 4983c207                       add        r10, 7
00a58 4983e2f8                       and        r10, 0xfffffffffffffff8
00a5c 458bd2                         mov        r10d, r10d
00a5f 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00a64 478d540a08                     lea        r10d, [r10 + r9 + 8]
00a69 4d63d2                         movsxd     r10, r10d
00a6c 4e8d4c11f8                     lea        r9, [rcx + r10 - 8]
00a71 4d3bc8                         cmp        r9, r8
00a74 0f830e110000                   jae        0x7ff8d7bd4788
00a7a 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00a82 0f8300110000                   jae        0x7ff8d7bd4788
00a88 4983c2f8                       add        r10, -8
00a8c 4d3bd0                         cmp        r10, r8
00a8f 0f83f3100000                   jae        0x7ff8d7bd4788
00a95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a9a 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00aa1 0f8fad110000                   jg         0x7ff8d7bd4854
00aa7 90                             nop        
00aa8 90                             nop        
00aa9 90                             nop        
00aaa 90                             nop        
00aab 90                             nop        
00aac 90                             nop        
00aad 90                             nop        
00aae 90                             nop        
00aaf 90                             nop        
00ab0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ab8 4963cb                         movsxd     rcx, r11d
00abb 4883c108                       add        rcx, 8
00abf 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00ac6 036c2414                       add        ebp, dword ptr [rsp + 0x14]
00aca 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00acf 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00ad4 48be28c122e200000000           movabs     rsi, 0xe222c128
00ade 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00ae3 4533c9                         xor        r9d, r9d
00ae6 90                             nop        
00ae7 90                             nop        
00ae8 c5f877                         vzeroupper 
00aeb e870bbb5ff                     call       0x7ff8d772f260
00af0 0f1f8400e80b000b               nop        dword ptr [rax + rax + 0xb000be8]
00af8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b00 4183c208                       add        r10d, 8
00b04 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00b0c 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00b11 7c9d                           jl         0x7ff8d7bd36b0
00b13 eb25                           jmp        0x7ff8d7bd373a
00b15 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b1a 4d63d3                         movsxd     r10, r11d
00b1d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b24 c442a8f5db                     bzhi       r11, r11, r10
00b29 c4c1fb92fb                     kmovq      k7, r11
00b2e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b34 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b3a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00b3f 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
00b44 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b49 e948f9ffff                     jmp        0x7ff8d7bd3096
00b4e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00b56 4585db                         test       r11d, r11d
00b59 0f8c9d0f0000                   jl         0x7ff8d7bd46fc
00b5f 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00b64 4585c9                         test       r9d, r9d
00b67 0f8c8f0f0000                   jl         0x7ff8d7bd46fc
00b6d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00b72 4503d3                         add        r10d, r11d
00b75 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00b7d 453bca                         cmp        r9d, r10d
00b80 0f82760f0000                   jb         0x7ff8d7bd46fc
00b86 443b4c2438                     cmp        r9d, dword ptr [rsp + 0x38]
00b8b 0f826b0f0000                   jb         0x7ff8d7bd46fc
00b91 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00b96 4585d2                         test       r10d, r10d
00b99 749f                           je         0x7ff8d7bd373a
00b9b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ba0 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00ba5 4c03c1                         add        r8, rcx
00ba8 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00bad 4863542478                     movsxd     rdx, dword ptr [rsp + 0x78]
00bb2 4883fa20                       cmp        rdx, 0x20
00bb6 0f8659ffffff                   jbe        0x7ff8d7bd3715
00bbc c5f877                         vzeroupper 
00bbf 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
00bc9 41ffd2                         call       r10
00bcc 0f1f840000000000               nop        dword ptr [rax + rax]
00bd4 e961ffffff                     jmp        0x7ff8d7bd373a
00bd9 90                             nop        
00bda 90                             nop        
00bdb 90                             nop        
00bdc 458bda                         mov        r11d, r10d
00bdf 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00be4 478b4c9a04                     mov        r9d, dword ptr [r10 + r11*4 + 4]
00be9 47894c9a08                     mov        dword ptr [r10 + r11*4 + 8], r9d
00bee 458d53ff                       lea        r10d, [r11 - 1]
00bf2 443bd1                         cmp        r10d, ecx
00bf5 7fe5                           jg         0x7ff8d7bd37dc
00bf7 48639c2484000000               movsxd     rbx, dword ptr [rsp + 0x84]
00bff 4183fa3f                       cmp        r10d, 0x3f
00c03 0f8e0b010000                   jle        0x7ff8d7bd3914
00c09 4d63cb                         movsxd     r9, r11d
00c0c 4983c1fe                       add        r9, -2
00c10 4c3bcb                         cmp        r9, rbx
00c13 0f8327120000                   jae        0x7ff8d7bd4a40
00c19 418d4bbf                       lea        ecx, [r11 - 0x41]
00c1d 3b8c2484000000                 cmp        ecx, dword ptr [rsp + 0x84]
00c24 0f832a120000                   jae        0x7ff8d7bd4a54
00c2a 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00c32 0f8330120000                   jae        0x7ff8d7bd4a68
00c38 458d4bc0                       lea        r9d, [r11 - 0x40]
00c3c 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00c44 0f8332120000                   jae        0x7ff8d7bd4a7c
00c4a 41ffcb                         dec        r11d
00c4d eb04                           jmp        0x7ff8d7bd3853
00c4f 90                             nop        
00c50 458bda                         mov        r11d, r10d
00c53 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00c58 62917e486f849ac8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x38]
00c63 62917e487f849accffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x34], zmm0
00c6e 62917e486f849a88ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x78]
00c79 62917e487f849a8cffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x74], zmm0
00c84 62917e486f849a48ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0xb8]
00c8f 62917e487f849a4cffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0xb4], zmm0
00c9a 62917e486f849a08ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0xf8]
00ca5 62917e487f849a0cffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0xf4], zmm0
00cb0 458d53c0                       lea        r10d, [r11 - 0x40]
00cb4 4183fa3f                       cmp        r10d, 0x3f
00cb8 7f96                           jg         0x7ff8d7bd3850
00cba 4183fa0f                       cmp        r10d, 0xf
00cbe 7e54                           jle        0x7ff8d7bd3914
00cc0 458bd3                         mov        r10d, r11d
00cc3 418d4ab0                       lea        ecx, [r10 - 0x50]
00cc7 3b8c2484000000                 cmp        ecx, dword ptr [rsp + 0x84]
00cce 0f8350150000                   jae        0x7ff8d7bd4e24
00cd4 4183c2b1                       add        r10d, -0x4f
00cd8 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00ce0 0f8366150000                   jae        0x7ff8d7bd4e4c
00ce6 4183c3c0                       add        r11d, -0x40
00cea 90                             nop        
00ceb 90                             nop        
00cec 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00cf1 62917e486f849ac8ffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x38]
00cfc 62917e487f849accffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x34], zmm0
00d07 4183c3f0                       add        r11d, -0x10
00d0b 4183fb0f                       cmp        r11d, 0xf
00d0f 7fdb                           jg         0x7ff8d7bd38ec
00d11 458bd3                         mov        r10d, r11d
00d14 4585d2                         test       r10d, r10d
00d17 0f8ecdf8ffff                   jle        0x7ff8d7bd31ea
00d1d 4d63da                         movsxd     r11, r10d
00d20 49ffcb                         dec        r11
00d23 4c3bdb                         cmp        r11, rbx
00d26 0f83e4140000                   jae        0x7ff8d7bd4e10
00d2c 458bda                         mov        r11d, r10d
00d2f 418d4bff                       lea        ecx, [r11 - 1]
00d33 3b8c2484000000                 cmp        ecx, dword ptr [rsp + 0x84]
00d3a 0f83f8140000                   jae        0x7ff8d7bd4e38
00d40 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00d48 0f8312150000                   jae        0x7ff8d7bd4e60
00d4e 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00d56 0f8318150000                   jae        0x7ff8d7bd4e74
00d5c 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00d61 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00d66 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00d6b 47895c9108                     mov        dword ptr [r9 + r10*4 + 8], r11d
00d70 41ffca                         dec        r10d
00d73 4585d2                         test       r10d, r10d
00d76 7fe4                           jg         0x7ff8d7bd395c
00d78 e96df8ffff                     jmp        0x7ff8d7bd31ea
00d7d 4d63d2                         movsxd     r10, r10d
00d80 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d87 c442a8f5db                     bzhi       r11, r11, r10
00d8c c4c1fb92fb                     kmovq      k7, r11
00d91 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d97 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d9d e98b000000                     jmp        0x7ff8d7bd3a2d
00da2 4585ed                         test       r13d, r13d
00da5 0f8c21140000                   jl         0x7ff8d7bd4dcc
00dab 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00db0 4585c0                         test       r8d, r8d
00db3 0f8c18140000                   jl         0x7ff8d7bd4dd1
00db9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00dbe 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00dc3 0f8208140000                   jb         0x7ff8d7bd4dd1
00dc9 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00dcd 4103ea                         add        ebp, r10d
00dd0 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00dd8 443bcd                         cmp        r9d, ebp
00ddb 0f82f0130000                   jb         0x7ff8d7bd4dd1
00de1 4585d2                         test       r10d, r10d
00de4 0f8ce7130000                   jl         0x7ff8d7bd4dd1
00dea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00def 453bdd                         cmp        r11d, r13d
00df2 7439                           je         0x7ff8d7bd3a2d
00df4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00df9 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00dfe 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00e03 4b8d7c2b08                     lea        rdi, [r11 + r13 + 8]
00e08 4963d2                         movsxd     rdx, r10d
00e0b 4883fa20                       cmp        rdx, 0x20
00e0f 0f8668ffffff                   jbe        0x7ff8d7bd397d
00e15 c5f877                         vzeroupper 
00e18 49ba409171d7f87f0000           movabs     r10, 0x7ff8d7719140
00e22 41ffd2                         call       r10
00e25 0f1f840000000000               nop        dword ptr [rax + rax]
00e2d 4c8b1424                       mov        r10, qword ptr [rsp]
00e31 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e35 c5f877                         vzeroupper 
00e38 4881c4c0000000                 add        rsp, 0xc0
00e3f 5d                             pop        rbp
00e40 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e44 0f8782140000                   ja         0x7ff8d7bd4ecc
00e4a c3                             ret        
00e4b 41ffc8                         dec        r8d
00e4e 4585c0                         test       r8d, r8d
00e51 7e15                           jle        0x7ff8d7bd3a68
00e53 41894a10                       mov        dword ptr [r10 + 0x10], ecx
00e57 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00e5b 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00e5f 45894208                       mov        dword ptr [r10 + 8], r8d
00e63 e98bf7ffff                     jmp        0x7ff8d7bd31f3
00e68 48beb0b272e200000000           movabs     rsi, 0xe272b2b0
00e72 418bed                         mov        ebp, r13d
00e75 90                             nop        
00e76 90                             nop        
00e77 90                             nop        
00e78 c5f877                         vzeroupper 
00e7b e8e0c1b5ff                     call       0x7ff8d772fc60
00e80 0f1f8400780f000c               nop        dword ptr [rax + rax + 0xc000f78]
00e88 4885c0                         test       rax, rax
00e8b 0f8598f7ffff                   jne        0x7ff8d7bd3229
00e91 bef6ffffff                     mov        esi, 0xfffffff6
00e96 90                             nop        
00e97 90                             nop        
00e98 c5f877                         vzeroupper 
00e9b e8c09fafff                     call       0x7ff8d76cda60
00ea0 0f1f8400980f000d               nop        dword ptr [rax + rax + 0xd000f98]
00ea8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
00eb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eb6 e825911917                     call       0x7ff8eed6cbe0
00ebb f4                             hlt        
00ebc bee4ffffff                     mov        esi, 0xffffffe4
00ec1 488b2c24                       mov        rbp, qword ptr [rsp]
00ec5 48ff742408                     push       qword ptr [rsp + 8]
00eca 488f0424                       pop        qword ptr [rsp]
00ece 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00ed7 89442408                       mov        dword ptr [rsp + 8], eax
00edb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee0 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ee9 8944240c                       mov        dword ptr [rsp + 0xc], eax
00eed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ef2 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00ef7 90                             nop        
00ef8 c5f877                         vzeroupper 
00efb e8609fafff                     call       0x7ff8d76cda60
00f00 0f1f8400f80f000e               nop        dword ptr [rax + rax + 0xe000ff8]
00f08 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
00f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f16 e8c5901917                     call       0x7ff8eed6cbe0
00f1b f4                             hlt        
00f1c bee4ffffff                     mov        esi, 0xffffffe4
00f21 488b2c24                       mov        rbp, qword ptr [rsp]
00f25 48894424f8                     mov        qword ptr [rsp - 8], rax
00f2a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f2e 89442414                       mov        dword ptr [rsp + 0x14], eax
00f32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f37 48ff742470                     push       qword ptr [rsp + 0x70]
00f3c 488f442428                     pop        qword ptr [rsp + 0x28]
00f41 48894424f8                     mov        qword ptr [rsp - 8], rax
00f46 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00f4a 89442470                       mov        dword ptr [rsp + 0x70], eax
00f4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f53 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00f58 c5f877                         vzeroupper 
00f5b e8009fafff                     call       0x7ff8d76cda60
00f60 0f1f84005810000f               nop        dword ptr [rax + rax + 0xf001058]
00f68 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
00f72 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f76 e865901917                     call       0x7ff8eed6cbe0
00f7b f4                             hlt        
00f7c bee4ffffff                     mov        esi, 0xffffffe4
00f81 488b2c24                       mov        rbp, qword ptr [rsp]
00f85 48ff742408                     push       qword ptr [rsp + 8]
00f8a 488f0424                       pop        qword ptr [rsp]
00f8e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f93 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f97 89442408                       mov        dword ptr [rsp + 8], eax
00f9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa0 48ff742418                     push       qword ptr [rsp + 0x18]
00fa5 488f442410                     pop        qword ptr [rsp + 0x10]
00faa 48ff742420                     push       qword ptr [rsp + 0x20]
00faf 488f442418                     pop        qword ptr [rsp + 0x18]
00fb4 48894424f8                     mov        qword ptr [rsp - 8], rax
00fb9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00fbd 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc6 48ff742470                     push       qword ptr [rsp + 0x70]
00fcb 488f442420                     pop        qword ptr [rsp + 0x20]
00fd0 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00fd5 48894424f8                     mov        qword ptr [rsp - 8], rax
00fda 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00fde 89442470                       mov        dword ptr [rsp + 0x70], eax
00fe2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe7 48894424f8                     mov        qword ptr [rsp - 8], rax
00fec 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
00ff3 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00ff7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ffc c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01005 90                             nop        
01006 90                             nop        
01007 90                             nop        
01008 c5f877                         vzeroupper 
0100b e8509eafff                     call       0x7ff8d76cda60
01010 0f1f840008110010               nop        dword ptr [rax + rax + 0x10001108]
01018 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01022 4883e4f0                       and        rsp, 0xfffffffffffffff0
01026 e8b58f1917                     call       0x7ff8eed6cbe0
0102b f4                             hlt        
0102c bee4ffffff                     mov        esi, 0xffffffe4
01031 488b2c24                       mov        rbp, qword ptr [rsp]
01035 48ff742408                     push       qword ptr [rsp + 8]
0103a 488f0424                       pop        qword ptr [rsp]
0103e 48894424f8                     mov        qword ptr [rsp - 8], rax
01043 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01047 89442408                       mov        dword ptr [rsp + 8], eax
0104b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01050 48ff742418                     push       qword ptr [rsp + 0x18]
01055 488f442410                     pop        qword ptr [rsp + 0x10]
0105a 48ff742420                     push       qword ptr [rsp + 0x20]
0105f 488f442418                     pop        qword ptr [rsp + 0x18]
01064 48894424f8                     mov        qword ptr [rsp - 8], rax
01069 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0106d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01071 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01076 48ff742470                     push       qword ptr [rsp + 0x70]
0107b 488f442420                     pop        qword ptr [rsp + 0x20]
01080 c5f877                         vzeroupper 
01083 e8d89dafff                     call       0x7ff8d76cda60
01088 0f1f840080110011               nop        dword ptr [rax + rax + 0x11001180]
01090 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0109a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0109e e83d8f1917                     call       0x7ff8eed6cbe0
010a3 f4                             hlt        
010a4 bee4ffffff                     mov        esi, 0xffffffe4
010a9 488b2c24                       mov        rbp, qword ptr [rsp]
010ad 48ff742408                     push       qword ptr [rsp + 8]
010b2 488f0424                       pop        qword ptr [rsp]
010b6 48894424f8                     mov        qword ptr [rsp - 8], rax
010bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
010bf 89442408                       mov        dword ptr [rsp + 8], eax
010c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c8 48ff742418                     push       qword ptr [rsp + 0x18]
010cd 488f442410                     pop        qword ptr [rsp + 0x10]
010d2 48ff742420                     push       qword ptr [rsp + 0x20]
010d7 488f442418                     pop        qword ptr [rsp + 0x18]
010dc 48894424f8                     mov        qword ptr [rsp - 8], rax
010e1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
010e5 8944240c                       mov        dword ptr [rsp + 0xc], eax
010e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010ee 48ff742470                     push       qword ptr [rsp + 0x70]
010f3 488f442420                     pop        qword ptr [rsp + 0x20]
010f8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
010fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01102 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01109 89442474                       mov        dword ptr [rsp + 0x74], eax
0110d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01112 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0111b 90                             nop        
0111c c5f877                         vzeroupper 
0111f e83c9dafff                     call       0x7ff8d76cda60
01124 0f1f84001c120012               nop        dword ptr [rax + rax + 0x1200121c]
0112c 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0113a e8a18e1917                     call       0x7ff8eed6cbe0
0113f f4                             hlt        
01140 be45ffffff                     mov        esi, 0xffffff45
01145 488b2c24                       mov        rbp, qword ptr [rsp]
01149 4c89542408                     mov        qword ptr [rsp + 8], r10
0114e 90                             nop        
0114f 90                             nop        
01150 c5f877                         vzeroupper 
01153 e8089dafff                     call       0x7ff8d76cda60
01158 0f1f840050120013               nop        dword ptr [rax + rax + 0x13001250]
01160 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0116a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0116e e86d8e1917                     call       0x7ff8eed6cbe0
01173 f4                             hlt        
01174 be45ffffff                     mov        esi, 0xffffff45
01179 488b2c24                       mov        rbp, qword ptr [rsp]
0117d 48ff742408                     push       qword ptr [rsp + 8]
01182 488f0424                       pop        qword ptr [rsp]
01186 48894424f8                     mov        qword ptr [rsp - 8], rax
0118b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0118f 89442408                       mov        dword ptr [rsp + 8], eax
01193 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01198 48ff742418                     push       qword ptr [rsp + 0x18]
0119d 488f442410                     pop        qword ptr [rsp + 0x10]
011a2 48ff742420                     push       qword ptr [rsp + 0x20]
011a7 488f442418                     pop        qword ptr [rsp + 0x18]
011ac 48894424f8                     mov        qword ptr [rsp - 8], rax
011b1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011b5 8944240c                       mov        dword ptr [rsp + 0xc], eax
011b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011be 48ff742430                     push       qword ptr [rsp + 0x30]
011c3 488f442428                     pop        qword ptr [rsp + 0x28]
011c8 48894424f8                     mov        qword ptr [rsp - 8], rax
011cd 8b442438                       mov        eax, dword ptr [rsp + 0x38]
011d1 89442430                       mov        dword ptr [rsp + 0x30], eax
011d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011da 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
011df 48894424f8                     mov        qword ptr [rsp - 8], rax
011e4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
011e8 89442438                       mov        dword ptr [rsp + 0x38], eax
011ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f1 48894424f8                     mov        qword ptr [rsp - 8], rax
011f6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
011fa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
011fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01203 48ff742450                     push       qword ptr [rsp + 0x50]
01208 488f442448                     pop        qword ptr [rsp + 0x48]
0120d 48ff742458                     push       qword ptr [rsp + 0x58]
01212 488f442450                     pop        qword ptr [rsp + 0x50]
01217 48894424f8                     mov        qword ptr [rsp - 8], rax
0121c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01220 89442458                       mov        dword ptr [rsp + 0x58], eax
01224 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01229 48894424f8                     mov        qword ptr [rsp - 8], rax
0122e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01232 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01236 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123b 48894424f8                     mov        qword ptr [rsp - 8], rax
01240 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01244 89442460                       mov        dword ptr [rsp + 0x60], eax
01248 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124d 48894424f8                     mov        qword ptr [rsp - 8], rax
01252 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01256 89442464                       mov        dword ptr [rsp + 0x64], eax
0125a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01264 c5f877                         vzeroupper 
01267 e8f49bafff                     call       0x7ff8d76cda60
0126c 0f1f840064130014               nop        dword ptr [rax + rax + 0x14001364]
01274 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0127e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01282 e8598d1917                     call       0x7ff8eed6cbe0
01287 f4                             hlt        
01288 4d3bda                         cmp        r11, r10
0128b bdffffffff                     mov        ebp, 0xffffffff
01290 7c08                           jl         0x7ff8d7bd3e9a
01292 400f95c5                       setne      bpl
01296 400fb6ed                       movzx      ebp, bpl
0129a be45ffffff                     mov        esi, 0xffffff45
0129f 48894424f8                     mov        qword ptr [rsp - 8], rax
012a4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012a8 89442414                       mov        dword ptr [rsp + 0x14], eax
012ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b1 48ff742470                     push       qword ptr [rsp + 0x70]
012b6 488f442428                     pop        qword ptr [rsp + 0x28]
012bb 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
012c0 48894424f8                     mov        qword ptr [rsp - 8], rax
012c5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
012c9 89442470                       mov        dword ptr [rsp + 0x70], eax
012cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d2 4c89542478                     mov        qword ptr [rsp + 0x78], r10
012d7 90                             nop        
012d8 c5f877                         vzeroupper 
012db e8809bafff                     call       0x7ff8d76cda60
012e0 0f1f8400d8130015               nop        dword ptr [rax + rax + 0x150013d8]
012e8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
012f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012f6 e8e58c1917                     call       0x7ff8eed6cbe0
012fb f4                             hlt        
012fc be45ffffff                     mov        esi, 0xffffff45
01301 488b2c24                       mov        rbp, qword ptr [rsp]
01305 48ff742408                     push       qword ptr [rsp + 8]
0130a 488f0424                       pop        qword ptr [rsp]
0130e 48894424f8                     mov        qword ptr [rsp - 8], rax
01313 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01317 89442408                       mov        dword ptr [rsp + 8], eax
0131b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01320 48ff742418                     push       qword ptr [rsp + 0x18]
01325 488f442410                     pop        qword ptr [rsp + 0x10]
0132a 48ff742420                     push       qword ptr [rsp + 0x20]
0132f 488f442418                     pop        qword ptr [rsp + 0x18]
01334 48894424f8                     mov        qword ptr [rsp - 8], rax
01339 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0133d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01341 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01346 48ff742470                     push       qword ptr [rsp + 0x70]
0134b 488f442420                     pop        qword ptr [rsp + 0x20]
01350 48ff742430                     push       qword ptr [rsp + 0x30]
01355 488f442428                     pop        qword ptr [rsp + 0x28]
0135a 48894424f8                     mov        qword ptr [rsp - 8], rax
0135f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01363 89442430                       mov        dword ptr [rsp + 0x30], eax
01367 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01371 48894424f8                     mov        qword ptr [rsp - 8], rax
01376 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0137a 89442438                       mov        dword ptr [rsp + 0x38], eax
0137e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01383 48894424f8                     mov        qword ptr [rsp - 8], rax
01388 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0138c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01390 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01395 48ff742450                     push       qword ptr [rsp + 0x50]
0139a 488f442448                     pop        qword ptr [rsp + 0x48]
0139f 48ff742458                     push       qword ptr [rsp + 0x58]
013a4 488f442450                     pop        qword ptr [rsp + 0x50]
013a9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ae 8b442464                       mov        eax, dword ptr [rsp + 0x64]
013b2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
013b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013bb 48894424f8                     mov        qword ptr [rsp - 8], rax
013c0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
013c4 89442464                       mov        dword ptr [rsp + 0x64], eax
013c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013cd 48894424f8                     mov        qword ptr [rsp - 8], rax
013d2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
013d6 89442468                       mov        dword ptr [rsp + 0x68], eax
013da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013df 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
013e4 c5f877                         vzeroupper 
013e7 e8749aafff                     call       0x7ff8d76cda60
013ec 0f1f8400e4140016               nop        dword ptr [rax + rax + 0x160014e4]
013f4 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
013fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01402 e8d98b1917                     call       0x7ff8eed6cbe0
01407 f4                             hlt        
01408 be45ffffff                     mov        esi, 0xffffff45
0140d 488b2c24                       mov        rbp, qword ptr [rsp]
01411 48ff742408                     push       qword ptr [rsp + 8]
01416 488f0424                       pop        qword ptr [rsp]
0141a 48894424f8                     mov        qword ptr [rsp - 8], rax
0141f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01423 89442408                       mov        dword ptr [rsp + 8], eax
01427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142c 48ff742418                     push       qword ptr [rsp + 0x18]
01431 488f442410                     pop        qword ptr [rsp + 0x10]
01436 48ff742420                     push       qword ptr [rsp + 0x20]
0143b 488f442418                     pop        qword ptr [rsp + 0x18]
01440 48894424f8                     mov        qword ptr [rsp - 8], rax
01445 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01449 8944240c                       mov        dword ptr [rsp + 0xc], eax
0144d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01452 48ff742470                     push       qword ptr [rsp + 0x70]
01457 488f442420                     pop        qword ptr [rsp + 0x20]
0145c 48ff742430                     push       qword ptr [rsp + 0x30]
01461 488f442428                     pop        qword ptr [rsp + 0x28]
01466 48894424f8                     mov        qword ptr [rsp - 8], rax
0146b 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0146f 89442430                       mov        dword ptr [rsp + 0x30], eax
01473 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01478 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0147d 48894424f8                     mov        qword ptr [rsp - 8], rax
01482 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01486 89442438                       mov        dword ptr [rsp + 0x38], eax
0148a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148f 48894424f8                     mov        qword ptr [rsp - 8], rax
01494 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01498 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0149c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a1 48ff742450                     push       qword ptr [rsp + 0x50]
014a6 488f442448                     pop        qword ptr [rsp + 0x48]
014ab 48ff742458                     push       qword ptr [rsp + 0x58]
014b0 488f442450                     pop        qword ptr [rsp + 0x50]
014b5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ba 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014be 89442458                       mov        dword ptr [rsp + 0x58], eax
014c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c7 48894424f8                     mov        qword ptr [rsp - 8], rax
014cc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014d0 89442460                       mov        dword ptr [rsp + 0x60], eax
014d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d9 48894424f8                     mov        qword ptr [rsp - 8], rax
014de 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
014e2 89442468                       mov        dword ptr [rsp + 0x68], eax
014e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014eb 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
014f0 c5f877                         vzeroupper 
014f3 e86899afff                     call       0x7ff8d76cda60
014f8 0f1f8400f0150017               nop        dword ptr [rax + rax + 0x170015f0]
01500 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0150a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0150e e8cd8a1917                     call       0x7ff8eed6cbe0
01513 f4                             hlt        
01514 be45ffffff                     mov        esi, 0xffffff45
01519 488b2c24                       mov        rbp, qword ptr [rsp]
0151d 48ff742408                     push       qword ptr [rsp + 8]
01522 488f0424                       pop        qword ptr [rsp]
01526 48894424f8                     mov        qword ptr [rsp - 8], rax
0152b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0152f 89442408                       mov        dword ptr [rsp + 8], eax
01533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01538 48ff742418                     push       qword ptr [rsp + 0x18]
0153d 488f442410                     pop        qword ptr [rsp + 0x10]
01542 48ff742420                     push       qword ptr [rsp + 0x20]
01547 488f442418                     pop        qword ptr [rsp + 0x18]
0154c 48894424f8                     mov        qword ptr [rsp - 8], rax
01551 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01555 8944240c                       mov        dword ptr [rsp + 0xc], eax
01559 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155e 48ff742470                     push       qword ptr [rsp + 0x70]
01563 488f442420                     pop        qword ptr [rsp + 0x20]
01568 48ff742430                     push       qword ptr [rsp + 0x30]
0156d 488f442428                     pop        qword ptr [rsp + 0x28]
01572 48894424f8                     mov        qword ptr [rsp - 8], rax
01577 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0157b 89442430                       mov        dword ptr [rsp + 0x30], eax
0157f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01584 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01589 48894424f8                     mov        qword ptr [rsp - 8], rax
0158e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01592 89442438                       mov        dword ptr [rsp + 0x38], eax
01596 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159b 48894424f8                     mov        qword ptr [rsp - 8], rax
015a0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015a4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ad 48ff742450                     push       qword ptr [rsp + 0x50]
015b2 488f442448                     pop        qword ptr [rsp + 0x48]
015b7 48ff742458                     push       qword ptr [rsp + 0x58]
015bc 488f442450                     pop        qword ptr [rsp + 0x50]
015c1 48894424f8                     mov        qword ptr [rsp - 8], rax
015c6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
015ca 89442458                       mov        dword ptr [rsp + 0x58], eax
015ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d3 48894424f8                     mov        qword ptr [rsp - 8], rax
015d8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015dc 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e5 48894424f8                     mov        qword ptr [rsp - 8], rax
015ea 8b442468                       mov        eax, dword ptr [rsp + 0x68]
015ee 89442460                       mov        dword ptr [rsp + 0x60], eax
015f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f7 90                             nop        
015f8 c5f877                         vzeroupper 
015fb e86098afff                     call       0x7ff8d76cda60
01600 0f1f8400f8160018               nop        dword ptr [rax + rax + 0x180016f8]
01608 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01612 4883e4f0                       and        rsp, 0xfffffffffffffff0
01616 e8c5891917                     call       0x7ff8eed6cbe0
0161b f4                             hlt        
0161c be45ffffff                     mov        esi, 0xffffff45
01621 488b2c24                       mov        rbp, qword ptr [rsp]
01625 48ff742408                     push       qword ptr [rsp + 8]
0162a 488f0424                       pop        qword ptr [rsp]
0162e 48894424f8                     mov        qword ptr [rsp - 8], rax
01633 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01637 89442408                       mov        dword ptr [rsp + 8], eax
0163b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01640 48ff742418                     push       qword ptr [rsp + 0x18]
01645 488f442410                     pop        qword ptr [rsp + 0x10]
0164a 48ff742420                     push       qword ptr [rsp + 0x20]
0164f 488f442418                     pop        qword ptr [rsp + 0x18]
01654 48894424f8                     mov        qword ptr [rsp - 8], rax
01659 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0165d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01661 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01666 48ff742470                     push       qword ptr [rsp + 0x70]
0166b 488f442420                     pop        qword ptr [rsp + 0x20]
01670 48ff742430                     push       qword ptr [rsp + 0x30]
01675 488f442428                     pop        qword ptr [rsp + 0x28]
0167a 48894424f8                     mov        qword ptr [rsp - 8], rax
0167f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01683 89442438                       mov        dword ptr [rsp + 0x38], eax
01687 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168c 48894424f8                     mov        qword ptr [rsp - 8], rax
01691 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01695 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01699 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169e 48ff742450                     push       qword ptr [rsp + 0x50]
016a3 488f442448                     pop        qword ptr [rsp + 0x48]
016a8 48ff742458                     push       qword ptr [rsp + 0x58]
016ad 488f442450                     pop        qword ptr [rsp + 0x50]
016b2 48894424f8                     mov        qword ptr [rsp - 8], rax
016b7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016bb 89442458                       mov        dword ptr [rsp + 0x58], eax
016bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c4 48894424f8                     mov        qword ptr [rsp - 8], rax
016c9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016cd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d6 48894424f8                     mov        qword ptr [rsp - 8], rax
016db 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016df 89442460                       mov        dword ptr [rsp + 0x60], eax
016e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
016ed 90                             nop        
016ee 90                             nop        
016ef 90                             nop        
016f0 c5f877                         vzeroupper 
016f3 e86897afff                     call       0x7ff8d76cda60
016f8 0f1f8400f0170019               nop        dword ptr [rax + rax + 0x190017f0]
01700 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e8cd881917                     call       0x7ff8eed6cbe0
01713 f4                             hlt        
01714 4533d2                         xor        r10d, r10d
01717 4c891424                       mov        qword ptr [rsp], r10
0171b e928eaffff                     jmp        0x7ff8d7bd2d48
01720 4533d2                         xor        r10d, r10d
01723 4c89542408                     mov        qword ptr [rsp + 8], r10
01728 e94deaffff                     jmp        0x7ff8d7bd2d7a
0172d 4533d2                         xor        r10d, r10d
01730 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01735 e972eaffff                     jmp        0x7ff8d7bd2dac
0173a 4533d2                         xor        r10d, r10d
0173d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01742 e98feaffff                     jmp        0x7ff8d7bd2dd6
01747 4533d2                         xor        r10d, r10d
0174a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0174f e9b4eaffff                     jmp        0x7ff8d7bd2e08
01754 4533d2                         xor        r10d, r10d
01757 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0175c e9d1eaffff                     jmp        0x7ff8d7bd2e32
01761 bebeffffff                     mov        esi, 0xffffffbe
01766 488b2c24                       mov        rbp, qword ptr [rsp]
0176a 48ff742408                     push       qword ptr [rsp + 8]
0176f 488f0424                       pop        qword ptr [rsp]
01773 48894424f8                     mov        qword ptr [rsp - 8], rax
01778 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0177c 89442408                       mov        dword ptr [rsp + 8], eax
01780 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01785 48ff742418                     push       qword ptr [rsp + 0x18]
0178a 488f442410                     pop        qword ptr [rsp + 0x10]
0178f 48ff742420                     push       qword ptr [rsp + 0x20]
01794 488f442418                     pop        qword ptr [rsp + 0x18]
01799 48894424f8                     mov        qword ptr [rsp - 8], rax
0179e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017a2 8944240c                       mov        dword ptr [rsp + 0xc], eax
017a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ab 48ff742430                     push       qword ptr [rsp + 0x30]
017b0 488f442428                     pop        qword ptr [rsp + 0x28]
017b5 48894424f8                     mov        qword ptr [rsp - 8], rax
017ba 8b442438                       mov        eax, dword ptr [rsp + 0x38]
017be 89442430                       mov        dword ptr [rsp + 0x30], eax
017c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c7 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
017cc 48894424f8                     mov        qword ptr [rsp - 8], rax
017d1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
017d5 89442438                       mov        dword ptr [rsp + 0x38], eax
017d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017de 48894424f8                     mov        qword ptr [rsp - 8], rax
017e3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017e7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f0 48ff742450                     push       qword ptr [rsp + 0x50]
017f5 488f442448                     pop        qword ptr [rsp + 0x48]
017fa 48ff742458                     push       qword ptr [rsp + 0x58]
017ff 488f442450                     pop        qword ptr [rsp + 0x50]
01804 48894424f8                     mov        qword ptr [rsp - 8], rax
01809 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0180d 89442458                       mov        dword ptr [rsp + 0x58], eax
01811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01816 90                             nop        
01817 90                             nop        
01818 c5f877                         vzeroupper 
0181b e84096afff                     call       0x7ff8d76cda60
01820 0f1f84001819001a               nop        dword ptr [rax + rax + 0x1a001918]
01828 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01832 4883e4f0                       and        rsp, 0xfffffffffffffff0
01836 e8a5871917                     call       0x7ff8eed6cbe0
0183b f4                             hlt        
0183c be85ffffff                     mov        esi, 0xffffff85
01841 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01845 48894424f8                     mov        qword ptr [rsp - 8], rax
0184a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0184e 890424                         mov        dword ptr [rsp], eax
01851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01856 44896c2408                     mov        dword ptr [rsp + 8], r13d
0185b 90                             nop        
0185c c5f877                         vzeroupper 
0185f e8fc95afff                     call       0x7ff8d76cda60
01864 0f1f84005c19001b               nop        dword ptr [rax + rax + 0x1b00195c]
0186c 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01876 4883e4f0                       and        rsp, 0xfffffffffffffff0
0187a e861871917                     call       0x7ff8eed6cbe0
0187f f4                             hlt        
01880 bee4ffffff                     mov        esi, 0xffffffe4
01885 488b2c24                       mov        rbp, qword ptr [rsp]
01889 48ff742408                     push       qword ptr [rsp + 8]
0188e 488f0424                       pop        qword ptr [rsp]
01892 48894424f8                     mov        qword ptr [rsp - 8], rax
01897 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0189b 89442408                       mov        dword ptr [rsp + 8], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 48ff742418                     push       qword ptr [rsp + 0x18]
018a9 488f442410                     pop        qword ptr [rsp + 0x10]
018ae 48ff742420                     push       qword ptr [rsp + 0x20]
018b3 488f442418                     pop        qword ptr [rsp + 0x18]
018b8 48894424f8                     mov        qword ptr [rsp - 8], rax
018bd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018c1 8944240c                       mov        dword ptr [rsp + 0xc], eax
018c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ca 48ff742430                     push       qword ptr [rsp + 0x30]
018cf 488f442428                     pop        qword ptr [rsp + 0x28]
018d4 48894424f8                     mov        qword ptr [rsp - 8], rax
018d9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
018dd 89442430                       mov        dword ptr [rsp + 0x30], eax
018e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e6 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
018eb 48894424f8                     mov        qword ptr [rsp - 8], rax
018f0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
018f4 89442438                       mov        dword ptr [rsp + 0x38], eax
018f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01902 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01906 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0190a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190f 48ff742450                     push       qword ptr [rsp + 0x50]
01914 488f442448                     pop        qword ptr [rsp + 0x48]
01919 48ff742458                     push       qword ptr [rsp + 0x58]
0191e 488f442450                     pop        qword ptr [rsp + 0x50]
01923 48894424f8                     mov        qword ptr [rsp - 8], rax
01928 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0192c 89442458                       mov        dword ptr [rsp + 0x58], eax
01930 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01935 48894424f8                     mov        qword ptr [rsp - 8], rax
0193a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0193e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01942 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01947 48894424f8                     mov        qword ptr [rsp - 8], rax
0194c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01950 89442460                       mov        dword ptr [rsp + 0x60], eax
01954 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01959 48894424f8                     mov        qword ptr [rsp - 8], rax
0195e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01962 89442464                       mov        dword ptr [rsp + 0x64], eax
01966 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196b 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
01970 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01978 c5f877                         vzeroupper 
0197b e8e094afff                     call       0x7ff8d76cda60
01980 0f1f8400781a001c               nop        dword ptr [rax + rax + 0x1c001a78]
01988 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01992 4883e4f0                       and        rsp, 0xfffffffffffffff0
01996 e845861917                     call       0x7ff8eed6cbe0
0199b f4                             hlt        
0199c bef6ffffff                     mov        esi, 0xfffffff6
019a1 90                             nop        
019a2 90                             nop        
019a3 90                             nop        
019a4 c5f877                         vzeroupper 
019a7 e8b494afff                     call       0x7ff8d76cda60
019ac 0f1f8400a41a001d               nop        dword ptr [rax + rax + 0x1d001aa4]
019b4 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
019be 4883e4f0                       and        rsp, 0xfffffffffffffff0
019c2 e819861917                     call       0x7ff8eed6cbe0
019c7 f4                             hlt        
019c8 bee4ffffff                     mov        esi, 0xffffffe4
019cd 488b2c24                       mov        rbp, qword ptr [rsp]
019d1 48ff742408                     push       qword ptr [rsp + 8]
019d6 488f0424                       pop        qword ptr [rsp]
019da 48894424f8                     mov        qword ptr [rsp - 8], rax
019df 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019e3 89442408                       mov        dword ptr [rsp + 8], eax
019e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ec 48ff742418                     push       qword ptr [rsp + 0x18]
019f1 488f442410                     pop        qword ptr [rsp + 0x10]
019f6 48ff742420                     push       qword ptr [rsp + 0x20]
019fb 488f442418                     pop        qword ptr [rsp + 0x18]
01a00 48894424f8                     mov        qword ptr [rsp - 8], rax
01a05 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a09 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a12 48ff742470                     push       qword ptr [rsp + 0x70]
01a17 488f442420                     pop        qword ptr [rsp + 0x20]
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01a25 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a33 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a37 89442470                       mov        dword ptr [rsp + 0x70], eax
01a3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a40 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01a48 c5f877                         vzeroupper 
01a4b e81094afff                     call       0x7ff8d76cda60
01a50 0f1f8400481b001e               nop        dword ptr [rax + rax + 0x1e001b48]
01a58 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a66 e875851917                     call       0x7ff8eed6cbe0
01a6b f4                             hlt        
01a6c bee4ffffff                     mov        esi, 0xffffffe4
01a71 488b2c24                       mov        rbp, qword ptr [rsp]
01a75 48ff742408                     push       qword ptr [rsp + 8]
01a7a 488f0424                       pop        qword ptr [rsp]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a87 89442408                       mov        dword ptr [rsp + 8], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 48ff742418                     push       qword ptr [rsp + 0x18]
01a95 488f442410                     pop        qword ptr [rsp + 0x10]
01a9a 48ff742420                     push       qword ptr [rsp + 0x20]
01a9f 488f442418                     pop        qword ptr [rsp + 0x18]
01aa4 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01aad 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ab1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab6 48ff742470                     push       qword ptr [rsp + 0x70]
01abb 488f442420                     pop        qword ptr [rsp + 0x20]
01ac0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ac9 89442470                       mov        dword ptr [rsp + 0x70], eax
01acd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad2 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01ad7 90                             nop        
01ad8 c5f877                         vzeroupper 
01adb e88093afff                     call       0x7ff8d76cda60
01ae0 0f1f8400d81b001f               nop        dword ptr [rax + rax + 0x1f001bd8]
01ae8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01af2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01af6 e8e5841917                     call       0x7ff8eed6cbe0
01afb f4                             hlt        
01afc beccffffff                     mov        esi, 0xffffffcc
01b01 488b2c24                       mov        rbp, qword ptr [rsp]
01b05 48ff742408                     push       qword ptr [rsp + 8]
01b0a 488f0424                       pop        qword ptr [rsp]
01b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b13 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b17 89442408                       mov        dword ptr [rsp + 8], eax
01b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b20 48ff742418                     push       qword ptr [rsp + 0x18]
01b25 488f442410                     pop        qword ptr [rsp + 0x10]
01b2a 48ff742420                     push       qword ptr [rsp + 0x20]
01b2f 488f442418                     pop        qword ptr [rsp + 0x18]
01b34 48894424f8                     mov        qword ptr [rsp - 8], rax
01b39 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b3d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b46 48ff742470                     push       qword ptr [rsp + 0x70]
01b4b 488f442420                     pop        qword ptr [rsp + 0x20]
01b50 48894424f8                     mov        qword ptr [rsp - 8], rax
01b55 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01b59 89442438                       mov        dword ptr [rsp + 0x38], eax
01b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b62 90                             nop        
01b63 90                             nop        
01b64 c5f877                         vzeroupper 
01b67 e8f492afff                     call       0x7ff8d76cda60
01b6c 0f1f8400641c0020               nop        dword ptr [rax + rax + 0x20001c64]
01b74 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01b7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b82 e859841917                     call       0x7ff8eed6cbe0
01b87 f4                             hlt        
01b88 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01b90 458d5a08                       lea        r11d, [r10 + 8]
01b94 be6effffff                     mov        esi, 0xffffff6e
01b99 488b2c24                       mov        rbp, qword ptr [rsp]
01b9d 48ff742408                     push       qword ptr [rsp + 8]
01ba2 488f0424                       pop        qword ptr [rsp]
01ba6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01baf 89442408                       mov        dword ptr [rsp + 8], eax
01bb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb8 48ff742418                     push       qword ptr [rsp + 0x18]
01bbd 488f442410                     pop        qword ptr [rsp + 0x10]
01bc2 48ff742420                     push       qword ptr [rsp + 0x20]
01bc7 488f442418                     pop        qword ptr [rsp + 0x18]
01bcc 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd1 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bd5 8944240c                       mov        dword ptr [rsp + 0xc], eax
01bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bde 48ff742470                     push       qword ptr [rsp + 0x70]
01be3 488f442420                     pop        qword ptr [rsp + 0x20]
01be8 48ff742430                     push       qword ptr [rsp + 0x30]
01bed 488f442428                     pop        qword ptr [rsp + 0x28]
01bf2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bfb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01bff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c04 48894424f8                     mov        qword ptr [rsp - 8], rax
01c09 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c0d 89442460                       mov        dword ptr [rsp + 0x60], eax
01c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c16 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c1f 89442464                       mov        dword ptr [rsp + 0x64], eax
01c23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c28 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c2d 90                             nop        
01c2e 90                             nop        
01c2f 90                             nop        
01c30 c5f877                         vzeroupper 
01c33 e82892afff                     call       0x7ff8d76cda60
01c38 0f1f8400301d0021               nop        dword ptr [rax + rax + 0x21001d30]
01c40 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01c4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c4e e88d831917                     call       0x7ff8eed6cbe0
01c53 f4                             hlt        
01c54 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01c5c 458d5a08                       lea        r11d, [r10 + 8]
01c60 be66ffffff                     mov        esi, 0xffffff66
01c65 488b2c24                       mov        rbp, qword ptr [rsp]
01c69 48ff742408                     push       qword ptr [rsp + 8]
01c6e 488f0424                       pop        qword ptr [rsp]
01c72 48894424f8                     mov        qword ptr [rsp - 8], rax
01c77 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c7b 89442408                       mov        dword ptr [rsp + 8], eax
01c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c84 48ff742418                     push       qword ptr [rsp + 0x18]
01c89 488f442410                     pop        qword ptr [rsp + 0x10]
01c8e 48ff742420                     push       qword ptr [rsp + 0x20]
01c93 488f442418                     pop        qword ptr [rsp + 0x18]
01c98 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ca1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ca5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01caa 48ff742470                     push       qword ptr [rsp + 0x70]
01caf 488f442420                     pop        qword ptr [rsp + 0x20]
01cb4 48ff742430                     push       qword ptr [rsp + 0x30]
01cb9 488f442428                     pop        qword ptr [rsp + 0x28]
01cbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cc7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ccb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cd9 89442460                       mov        dword ptr [rsp + 0x60], eax
01cdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ceb 89442464                       mov        dword ptr [rsp + 0x64], eax
01cef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf4 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01cf9 90                             nop        
01cfa 90                             nop        
01cfb 90                             nop        
01cfc c5f877                         vzeroupper 
01cff e85c91afff                     call       0x7ff8d76cda60
01d04 0f1f8400fc1d0022               nop        dword ptr [rax + rax + 0x22001dfc]
01d0c 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d1a e8c1821917                     call       0x7ff8eed6cbe0
01d1f f4                             hlt        
01d20 be6effffff                     mov        esi, 0xffffff6e
01d25 488b2c24                       mov        rbp, qword ptr [rsp]
01d29 48ff742408                     push       qword ptr [rsp + 8]
01d2e 488f0424                       pop        qword ptr [rsp]
01d32 48894424f8                     mov        qword ptr [rsp - 8], rax
01d37 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d3b 89442408                       mov        dword ptr [rsp + 8], eax
01d3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d44 48ff742418                     push       qword ptr [rsp + 0x18]
01d49 488f442410                     pop        qword ptr [rsp + 0x10]
01d4e 48ff742420                     push       qword ptr [rsp + 0x20]
01d53 488f442418                     pop        qword ptr [rsp + 0x18]
01d58 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d61 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6a 48ff742430                     push       qword ptr [rsp + 0x30]
01d6f 488f442428                     pop        qword ptr [rsp + 0x28]
01d74 48894424f8                     mov        qword ptr [rsp - 8], rax
01d79 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d7d 89442430                       mov        dword ptr [rsp + 0x30], eax
01d81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d86 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01d8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d90 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d94 89442438                       mov        dword ptr [rsp + 0x38], eax
01d98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01da2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01da6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daf 48ff742450                     push       qword ptr [rsp + 0x50]
01db4 488f442448                     pop        qword ptr [rsp + 0x48]
01db9 48ff742458                     push       qword ptr [rsp + 0x58]
01dbe 488f442450                     pop        qword ptr [rsp + 0x50]
01dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01dcc 89442458                       mov        dword ptr [rsp + 0x58], eax
01dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dda 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01dde 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01de2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dec 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01df0 89442460                       mov        dword ptr [rsp + 0x60], eax
01df4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfe 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e02 89442464                       mov        dword ptr [rsp + 0x64], eax
01e06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0b 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
01e10 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01e15 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01e1a 90                             nop        
01e1b 90                             nop        
01e1c c5f877                         vzeroupper 
01e1f e83c90afff                     call       0x7ff8d76cda60
01e24 0f1f84001c1f0023               nop        dword ptr [rax + rax + 0x23001f1c]
01e2c 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01e36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3a e8a1811917                     call       0x7ff8eed6cbe0
01e3f f4                             hlt        
01e40 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
01e4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e4e e88d811917                     call       0x7ff8eed6cbe0
01e53 f4                             hlt        
01e54 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
01e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e62 e879811917                     call       0x7ff8eed6cbe0
01e67 f4                             hlt        
01e68 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
01e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e76 e865811917                     call       0x7ff8eed6cbe0
01e7b f4                             hlt        
01e7c 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
01e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8a e851811917                     call       0x7ff8eed6cbe0
01e8f f4                             hlt        
01e90 bee4ffffff                     mov        esi, 0xffffffe4
01e95 488b2c24                       mov        rbp, qword ptr [rsp]
01e99 48ff742408                     push       qword ptr [rsp + 8]
01e9e 488f0424                       pop        qword ptr [rsp]
01ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01eab 89442408                       mov        dword ptr [rsp + 8], eax
01eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb4 48ff742418                     push       qword ptr [rsp + 0x18]
01eb9 488f442410                     pop        qword ptr [rsp + 0x10]
01ebe 48ff742420                     push       qword ptr [rsp + 0x20]
01ec3 488f442418                     pop        qword ptr [rsp + 0x18]
01ec8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ecd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ed1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ed5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eda 48ff742470                     push       qword ptr [rsp + 0x70]
01edf 488f442420                     pop        qword ptr [rsp + 0x20]
01ee4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01eed 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ef1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef6 48894424f8                     mov        qword ptr [rsp - 8], rax
01efb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01eff 89442460                       mov        dword ptr [rsp + 0x60], eax
01f03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f08 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f11 89442464                       mov        dword ptr [rsp + 0x64], eax
01f15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f23 89442468                       mov        dword ptr [rsp + 0x68], eax
01f27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f31 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f35 89442474                       mov        dword ptr [rsp + 0x74], eax
01f39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01f43 90                             nop        
01f44 c5f877                         vzeroupper 
01f47 e8148fafff                     call       0x7ff8d76cda60
01f4c 0f1f840044200024               nop        dword ptr [rax + rax + 0x24002044]
01f54 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01f5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f62 e879801917                     call       0x7ff8eed6cbe0
01f67 f4                             hlt        
01f68 bee4ffffff                     mov        esi, 0xffffffe4
01f6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f72 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f76 89442414                       mov        dword ptr [rsp + 0x14], eax
01f7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7f 48ff742470                     push       qword ptr [rsp + 0x70]
01f84 488f442428                     pop        qword ptr [rsp + 0x28]
01f89 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f92 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01f96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fa4 89442460                       mov        dword ptr [rsp + 0x60], eax
01fa8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fad 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fb6 89442464                       mov        dword ptr [rsp + 0x64], eax
01fba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbf 90                             nop        
01fc0 c5f877                         vzeroupper 
01fc3 e8988eafff                     call       0x7ff8d76cda60
01fc8 0f1f8400c0200025               nop        dword ptr [rax + rax + 0x250020c0]
01fd0 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
01fda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fde e8fd7f1917                     call       0x7ff8eed6cbe0
01fe3 f4                             hlt        
01fe4 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
01feb ffc5                           inc        ebp
01fed bee4ffffff                     mov        esi, 0xffffffe4
01ff2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ffb 89442414                       mov        dword ptr [rsp + 0x14], eax
01fff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02004 48ff742470                     push       qword ptr [rsp + 0x70]
02009 488f442428                     pop        qword ptr [rsp + 0x28]
0200e 48894424f8                     mov        qword ptr [rsp - 8], rax
02013 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02017 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0201b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02020 48894424f8                     mov        qword ptr [rsp - 8], rax
02025 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02029 89442460                       mov        dword ptr [rsp + 0x60], eax
0202d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02032 48894424f8                     mov        qword ptr [rsp - 8], rax
02037 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0203b 89442464                       mov        dword ptr [rsp + 0x64], eax
0203f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02044 48894424f8                     mov        qword ptr [rsp - 8], rax
02049 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0204d 89442470                       mov        dword ptr [rsp + 0x70], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 90                             nop        
02057 90                             nop        
02058 c5f877                         vzeroupper 
0205b e8008eafff                     call       0x7ff8d76cda60
02060 0f1f840058210026               nop        dword ptr [rax + rax + 0x26002158]
02068 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
02072 4883e4f0                       and        rsp, 0xfffffffffffffff0
02076 e8657f1917                     call       0x7ff8eed6cbe0
0207b f4                             hlt        
0207c bee4ffffff                     mov        esi, 0xffffffe4
02081 48894424f8                     mov        qword ptr [rsp - 8], rax
02086 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0208a 89442414                       mov        dword ptr [rsp + 0x14], eax
0208e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02093 48ff742470                     push       qword ptr [rsp + 0x70]
02098 488f442428                     pop        qword ptr [rsp + 0x28]
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020a6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
020aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020af 48894424f8                     mov        qword ptr [rsp - 8], rax
020b4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020b8 89442460                       mov        dword ptr [rsp + 0x60], eax
020bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c1 48894424f8                     mov        qword ptr [rsp - 8], rax
020c6 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020ca 89442464                       mov        dword ptr [rsp + 0x64], eax
020ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d3 48894424f8                     mov        qword ptr [rsp - 8], rax
020d8 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
020dc 89442470                       mov        dword ptr [rsp + 0x70], eax
020e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e5 90                             nop        
020e6 90                             nop        
020e7 90                             nop        
020e8 c5f877                         vzeroupper 
020eb e8708dafff                     call       0x7ff8d76cda60
020f0 0f1f8400e8210027               nop        dword ptr [rax + rax + 0x270021e8]
020f8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
02102 4883e4f0                       and        rsp, 0xfffffffffffffff0
02106 e8d57e1917                     call       0x7ff8eed6cbe0
0210b f4                             hlt        
0210c bee4ffffff                     mov        esi, 0xffffffe4
02111 488b2c24                       mov        rbp, qword ptr [rsp]
02115 48ff742408                     push       qword ptr [rsp + 8]
0211a 488f0424                       pop        qword ptr [rsp]
0211e 48894424f8                     mov        qword ptr [rsp - 8], rax
02123 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02127 89442408                       mov        dword ptr [rsp + 8], eax
0212b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02130 48ff742418                     push       qword ptr [rsp + 0x18]
02135 488f442410                     pop        qword ptr [rsp + 0x10]
0213a 48ff742420                     push       qword ptr [rsp + 0x20]
0213f 488f442418                     pop        qword ptr [rsp + 0x18]
02144 48894424f8                     mov        qword ptr [rsp - 8], rax
02149 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0214d 8944240c                       mov        dword ptr [rsp + 0xc], eax
02151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02156 48ff742470                     push       qword ptr [rsp + 0x70]
0215b 488f442420                     pop        qword ptr [rsp + 0x20]
02160 48894424f8                     mov        qword ptr [rsp - 8], rax
02165 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02169 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0216d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02172 48894424f8                     mov        qword ptr [rsp - 8], rax
02177 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0217b 89442460                       mov        dword ptr [rsp + 0x60], eax
0217f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02184 48894424f8                     mov        qword ptr [rsp - 8], rax
02189 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0218d 89442464                       mov        dword ptr [rsp + 0x64], eax
02191 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02196 48894424f8                     mov        qword ptr [rsp - 8], rax
0219b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0219f 89442470                       mov        dword ptr [rsp + 0x70], eax
021a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a8 c5f877                         vzeroupper 
021ab e8b08cafff                     call       0x7ff8d76cda60
021b0 0f1f8400a8220028               nop        dword ptr [rax + rax + 0x280022a8]
021b8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
021c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021c6 e8157e1917                     call       0x7ff8eed6cbe0
021cb f4                             hlt        
021cc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
021d1 beccffffff                     mov        esi, 0xffffffcc
021d6 488b2c24                       mov        rbp, qword ptr [rsp]
021da 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
021df 4489442414                     mov        dword ptr [rsp + 0x14], r8d
021e4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021e9 90                             nop        
021ea 90                             nop        
021eb 90                             nop        
021ec c5f877                         vzeroupper 
021ef e86c8cafff                     call       0x7ff8d76cda60
021f4 0f1f8400ec220029               nop        dword ptr [rax + rax + 0x290022ec]
021fc 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
02206 4883e4f0                       and        rsp, 0xfffffffffffffff0
0220a e8d17d1917                     call       0x7ff8eed6cbe0
0220f f4                             hlt        
02210 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
0221a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0221e e8bd7d1917                     call       0x7ff8eed6cbe0
02223 f4                             hlt        
02224 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
0222e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02232 e8a97d1917                     call       0x7ff8eed6cbe0
02237 f4                             hlt        
02238 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
02242 4883e4f0                       and        rsp, 0xfffffffffffffff0
02246 e8957d1917                     call       0x7ff8eed6cbe0
0224b f4                             hlt        
0224c 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
02256 4883e4f0                       and        rsp, 0xfffffffffffffff0
0225a e8817d1917                     call       0x7ff8eed6cbe0
0225f f4                             hlt        
02260 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
0226a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0226e e86d7d1917                     call       0x7ff8eed6cbe0
02273 f4                             hlt        
02274 48bf80b32db0f87f0000           movabs     rdi, 0x7ff8b02db380
0227e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02282 e8597d1917                     call       0x7ff8eed6cbe0
02287 f4                             hlt        
02288 eb10                           jmp        0x7ff8d7bd4e9a
0228a eb0e                           jmp        0x7ff8d7bd4e9a
0228c eb0c                           jmp        0x7ff8d7bd4e9a
0228e eb0a                           jmp        0x7ff8d7bd4e9a
02290 eb08                           jmp        0x7ff8d7bd4e9a
02292 eb06                           jmp        0x7ff8d7bd4e9a
02294 eb04                           jmp        0x7ff8d7bd4e9a
02296 eb02                           jmp        0x7ff8d7bd4e9a
02298 eb00                           jmp        0x7ff8d7bd4e9a
0229a 488bf0                         mov        rsi, rax
0229d e98ae3ffff                     jmp        0x7ff8d7bd322c
022a2 bef6ffffff                     mov        esi, 0xfffffff6
022a7 90                             nop        
022a8 c5f877                         vzeroupper 
022ab e8b08bafff                     call       0x7ff8d76cda60
022b0 0f1f8400a823002a               nop        dword ptr [rax + rax + 0x2a0023a8]
022b8 48bf70692ab0f87f0000           movabs     rdi, 0x7ff8b02a6970
022c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022c6 e8157d1917                     call       0x7ff8eed6cbe0
022cb f4                             hlt        
022cc 49ba403abdd7f87f0000           movabs     r10, 0x7ff8d7bd3a40
022d6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
022dd e97ed4b5ff                     jmp        0x7ff8d7732360
022e2 e8f9a2b4ff                     call       0x7ff8d771f1e0
022e7 e942ddffff                     jmp        0x7ff8d7bd2c2e
022ec f4                             hlt        
022ed f4                             hlt        
022ee f4                             hlt        
022ef f4                             hlt        
