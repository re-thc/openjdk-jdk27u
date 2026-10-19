00000 e8fbef3a18                     call       0x7ff793f8d300
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
00028 0f85dc2b0000                   jne        0x7ff77bbe0f0a
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b2e                         mov        r13d, dword ptr [rsi]
00049 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00050 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00055 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00061 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00068 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0006d 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00074 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00079 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00080 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00085 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0008c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00091 448bb6f8000000                 mov        r14d, dword ptr [rsi + 0xf8]
00098 8baef0000000                   mov        ebp, dword ptr [rsi + 0xf0]
0009e 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000a5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000b6 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000bd 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000c5 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cc 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000d4 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
000e0 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e4 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
000ec 8b5e68                         mov        ebx, dword ptr [rsi + 0x68]
000ef 448b5648                       mov        r10d, dword ptr [rsi + 0x48]
000f3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000fb 448b5e10                       mov        r11d, dword ptr [rsi + 0x10]
000ff 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00107 448b5608                       mov        r10d, dword ptr [rsi + 8]
0010b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00113 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
0011a 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00122 488bfe                         mov        rdi, rsi
00125 c5f877                         vzeroupper 
00128 49ba70fa1494f77f0000           movabs     r10, 0x7ff79414fa70
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f84391a0000                   je         0x7ff77bbdfe84
0014b 458b12                         mov        r10d, dword ptr [r10]
0014e 41c1ea0d                       shr        r10d, 0xd
00152 4181fa15410000                 cmp        r10d, 0x4115
00159 0f8559230000                   jne        0x7ff77bbe07b8
0015f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00164 4c891424                       mov        qword ptr [rsp], r10
00168 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0016d 4d85d2                         test       r10, r10
00170 0f841a1a0000                   je         0x7ff77bbdfe90
00176 458b1a                         mov        r11d, dword ptr [r10]
00179 41c1eb0d                       shr        r11d, 0xd
0017d 4181fbf9060000                 cmp        r11d, 0x6f9
00184 0f852e230000                   jne        0x7ff77bbe07b8
0018a 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00192 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00197 4d85d2                         test       r10, r10
0019a 0f84001a0000                   je         0x7ff77bbdfea0
001a0 458b12                         mov        r10d, dword ptr [r10]
001a3 41c1ea0d                       shr        r10d, 0xd
001a7 4181fafc060000                 cmp        r10d, 0x6fc
001ae 0f8504230000                   jne        0x7ff77bbe07b8
001b4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001b9 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001c1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c6 4d85d2                         test       r10, r10
001c9 0f84e1190000                   je         0x7ff77bbdfeb0
001cf 458b1a                         mov        r11d, dword ptr [r10]
001d2 41c1eb0d                       shr        r11d, 0xd
001d6 4181fbfb060000                 cmp        r11d, 0x6fb
001dd 0f85d5220000                   jne        0x7ff77bbe07b8
001e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001ed 4d85d2                         test       r10, r10
001f0 0f84c7190000                   je         0x7ff77bbdfebd
001f6 458b12                         mov        r10d, dword ptr [r10]
001f9 41c1ea0d                       shr        r10d, 0xd
001fd 4181fafb060000                 cmp        r10d, 0x6fb
00204 0f85ae220000                   jne        0x7ff77bbe07b8
0020a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0020f 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00217 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0021c 458b1a                         mov        r11d, dword ptr [r10]
0021f 41c1eb0d                       shr        r11d, 0xd
00223 4181fbf9060000                 cmp        r11d, 0x6f9
0022a 0f8588220000                   jne        0x7ff77bbe07b8
00230 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00238 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023c 4489542408                     mov        dword ptr [rsp + 8], r10d
00241 458d5af9                       lea        r11d, [r10 - 7]
00245 4585db                         test       r11d, r11d
00248 0f8cc8220000                   jl         0x7ff77bbe0816
0024e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00253 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00258 4183c3f1                       add        r11d, -0xf
0025c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00261 4183c2f9                       add        r10d, -7
00265 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0026d e907020000                     jmp        0x7ff77bbde779
00272 448bdb                         mov        r11d, ebx
00275 4d63d3                         movsxd     r10, r11d
00278 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0027f c442a8f5db                     bzhi       r11, r11, r10
00284 c4c1fb92fb                     kmovq      k7, r11
00289 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0028f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00295 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0029d 4403d3                         add        r10d, ebx
002a0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
002a8 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002ac 418502                         test       dword ptr [r10], eax
002af 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002b7 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002bf 0f8deb090000                   jge        0x7ff77bbdefb0
002c5 418bee                         mov        ebp, r14d
002c8 448bc5                         mov        r8d, ebp
002cb 442b8424cc000000               sub        r8d, dword ptr [rsp + 0xcc]
002d3 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
002da 2b9c24cc000000                 sub        ebx, dword ptr [rsp + 0xcc]
002e1 3b9c24cc000000                 cmp        ebx, dword ptr [rsp + 0xcc]
002e8 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002f0 410f4fdb                       cmovg      ebx, r11d
002f4 4585c0                         test       r8d, r8d
002f7 0f8cd0180000                   jl         0x7ff77bbdfecd
002fd 85ed                           test       ebp, ebp
002ff 0f8cc8180000                   jl         0x7ff77bbdfecd
00305 468d1403                       lea        r10d, [rbx + r8]
00309 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0030e 453bda                         cmp        r11d, r10d
00311 0f82b6180000                   jb         0x7ff77bbdfecd
00317 448d342b                       lea        r14d, [rbx + rbp]
0031b 453bde                         cmp        r11d, r14d
0031e 0f82a9180000                   jb         0x7ff77bbdfecd
00324 85db                           test       ebx, ebx
00326 0f8ca1180000                   jl         0x7ff77bbdfecd
0032c 85db                           test       ebx, ebx
0032e 0f8461ffffff                   je         0x7ff77bbde595
00334 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0033c 498d742a08                     lea        rsi, [r10 + rbp + 8]
00341 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00346 4863d3                         movsxd     rdx, ebx
00349 4883fa20                       cmp        rdx, 0x20
0034d 0f861fffffff                   jbe        0x7ff77bbde572
00353 c5f877                         vzeroupper 
00356 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00360 41ffd2                         call       r10
00363 0f1f840000000000               nop        dword ptr [rax + rax]
0036b e925ffffff                     jmp        0x7ff77bbde595
00370 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00377 448bb42494000000               mov        r14d, dword ptr [rsp + 0x94]
0037f 4503f3                         add        r14d, r11d
00382 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00386 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0038a e982020000                     jmp        0x7ff77bbde911
0038f 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00397 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
0039c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
003a4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
003ac 4b8d741308                     lea        rsi, [r11 + r10 + 8]
003b1 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003b9 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
003c1 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
003c9 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003d1 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
003d9 0f8c50060000                   jl         0x7ff77bbded2f
003df 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003e7 4183fb30                       cmp        r11d, 0x30
003eb 7e7c                           jle        0x7ff77bbde769
003ed 4585ed                         test       r13d, r13d
003f0 0f8c76180000                   jl         0x7ff77bbdff6c
003f6 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003fe 4585db                         test       r11d, r11d
00401 0f8c65180000                   jl         0x7ff77bbdff6c
00407 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0040f 4503d5                         add        r10d, r13d
00412 448b442408                     mov        r8d, dword ptr [rsp + 8]
00417 453bc2                         cmp        r8d, r10d
0041a 0f824c180000                   jb         0x7ff77bbdff6c
00420 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00428 0f823e180000                   jb         0x7ff77bbdff6c
0042e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00436 4585db                         test       r11d, r11d
00439 0f842d010000                   je         0x7ff77bbde86c
0043f 4963d3                         movsxd     rdx, r11d
00442 4883fa20                       cmp        rdx, 0x20
00446 0f86fd000000                   jbe        0x7ff77bbde849
0044c c5f877                         vzeroupper 
0044f 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00459 41ffd2                         call       r10
0045c 0f1f840000000000               nop        dword ptr [rax + rax]
00464 e903010000                     jmp        0x7ff77bbde86c
00469 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0046d 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
00475 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00479 443bac24c8000000               cmp        r13d, dword ptr [rsp + 0xc8]
00481 0f83a5150000                   jae        0x7ff77bbdfd2c
00487 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0048f 4f8b442a08                     mov        r8, qword ptr [r10 + r13 + 8]
00494 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0049c 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004a4 0f830e160000                   jae        0x7ff77bbdfdb8
004aa 4183c508                       add        r13d, 8
004ae 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
004b2 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004ba 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
004bf 4183c208                       add        r10d, 8
004c3 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
004cb 418503                         test       dword ptr [r11], eax
004ce 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
004d6 7d67                           jge        0x7ff77bbde83f
004d8 90                             nop        
004d9 90                             nop        
004da 90                             nop        
004db 90                             nop        
004dc 90                             nop        
004dd 90                             nop        
004de 90                             nop        
004df 90                             nop        
004e0 443bac24c8000000               cmp        r13d, dword ptr [rsp + 0xc8]
004e8 0f833e150000                   jae        0x7ff77bbdfd2c
004ee 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004f6 4f8b442a08                     mov        r8, qword ptr [r10 + r13 + 8]
004fb 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00503 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0050b 0f83a7150000                   jae        0x7ff77bbdfdb8
00511 4183c508                       add        r13d, 8
00515 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00519 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00521 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
00526 4183c308                       add        r11d, 8
0052a 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00532 418502                         test       dword ptr [r10], eax
00535 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0053d 7ca1                           jl         0x7ff77bbde7e0
0053f 4403b42494000000               add        r14d, dword ptr [rsp + 0x94]
00547 eb33                           jmp        0x7ff77bbde87c
00549 458bd3                         mov        r10d, r11d
0054c 4d63d2                         movsxd     r10, r10d
0054f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00556 c442a8f5db                     bzhi       r11, r11, r10
0055b c4c1fb92fb                     kmovq      k7, r11
00560 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00566 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0056c 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00570 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00578 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
0057c 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00584 458b5204                       mov        r10d, dword ptr [r10 + 4]
00588 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0058d 4585c0                         test       r8d, r8d
00590 0f8ca6150000                   jl         0x7ff77bbdfe3c
00596 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0059e 458b4b04                       mov        r9d, dword ptr [r11 + 4]
005a2 4183f901                       cmp        r9d, 1
005a6 0f8690150000                   jbe        0x7ff77bbdfe3c
005ac 4183f902                       cmp        r9d, 2
005b0 0f8686150000                   jbe        0x7ff77bbdfe3c
005b6 4585c9                         test       r9d, r9d
005b9 0f867d150000                   jbe        0x7ff77bbdfe3c
005bf 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
005c7 458b4304                       mov        r8d, dword ptr [r11 + 4]
005cb 458d58f1                       lea        r11d, [r8 - 0xf]
005cf 4585db                         test       r11d, r11d
005d2 0f8c64150000                   jl         0x7ff77bbdfe3c
005d8 8b7c2408                       mov        edi, dword ptr [rsp + 8]
005dc 458bd8                         mov        r11d, r8d
005df 448d6ff1                       lea        r13d, [rdi - 0xf]
005e3 4489ac24e0000000               mov        dword ptr [rsp + 0xe0], r13d
005eb 458d6bf1                       lea        r13d, [r11 - 0xf]
005ef 8bc5                           mov        eax, ebp
005f1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
005f6 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
005fb 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00600 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00604 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00609 4489ac24d0000000               mov        dword ptr [rsp + 0xd0], r13d
00611 4d8b4730                       mov        r8, qword ptr [r15 + 0x30]
00615 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0061a 442bd0                         sub        r10d, eax
0061d 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00625 4b8d743308                     lea        rsi, [r11 + r14 + 8]
0062a 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00632 498d7c0108                     lea        rdi, [r9 + rax + 8]
00637 448d5b01                       lea        r11d, [rbx + 1]
0063b 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00640 418500                         test       dword ptr [r8], eax
00643 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00648 0f8d14080000                   jge        0x7ff77bbdf162
0064e 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00653 0f83e10f0000                   jae        0x7ff77bbdf93a
00659 4c63db                         movsxd     r11, ebx
0065c 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
00664 4f8b44d810                     mov        r8, qword ptr [r8 + r11*8 + 0x10]
00669 458bd8                         mov        r11d, r8d
0066c 4181e3ffff0100                 and        r11d, 0x1ffff
00673 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0067b 4d8bd8                         mov        r11, r8
0067e 49c1eb12                       shr        r11, 0x12
00682 49c1f824                       sar        r8, 0x24
00686 458bdb                         mov        r11d, r11d
00689 458bc0                         mov        r8d, r8d
0068c 418bc8                         mov        ecx, r8d
0068f 4181e3ffff0300                 and        r11d, 0x3ffff
00696 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0069e 4585c0                         test       r8d, r8d
006a1 0f8cc5110000                   jl         0x7ff77bbdfb6c
006a7 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
006af 4585db                         test       r11d, r11d
006b2 0f8568020000                   jne        0x7ff77bbdec20
006b8 4533d2                         xor        r10d, r10d
006bb 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
006c3 4183f803                       cmp        r8d, 3
006c7 0f8ebb020000                   jle        0x7ff77bbdec88
006cd 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006d5 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006d9 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006e1 45895310                       mov        dword ptr [r11 + 0x10], r10d
006e5 458b5b08                       mov        r11d, dword ptr [r11 + 8]
006e9 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006f1 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
006f5 458d50fd                       lea        r10d, [r8 - 3]
006f9 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00701 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00709 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00711 45895a08                       mov        dword ptr [r10 + 8], r11d
00715 48639c24cc000000               movsxd     rbx, dword ptr [rsp + 0xcc]
0071d 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00722 4d63d6                         movsxd     r10, r14d
00725 4c03542478                     add        r10, qword ptr [rsp + 0x78]
0072a 4863942498000000               movsxd     rdx, dword ptr [rsp + 0x98]
00732 4c03d2                         add        r10, rdx
00735 488beb                         mov        rbp, rbx
00738 493bda                         cmp        rbx, r10
0073b 0f8f8f110000                   jg         0x7ff77bbdfbd0
00741 418bde                         mov        ebx, r14d
00744 039c2498000000                 add        ebx, dword ptr [rsp + 0x98]
0074b 448beb                         mov        r13d, ebx
0074e 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
00756 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
0075e 4585c0                         test       r8d, r8d
00761 0f84f5010000                   je         0x7ff77bbdec5c
00767 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0076c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00774 4585db                         test       r11d, r11d
00777 0f8ebb100000                   jle        0x7ff77bbdfb38
0077d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00785 4403db                         add        r11d, ebx
00788 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00790 0f8fa2110000                   jg         0x7ff77bbdfc38
00796 448bd8                         mov        r11d, eax
00799 44039c2498000000               add        r11d, dword ptr [rsp + 0x98]
007a1 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
007a6 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
007ae 0f8ffc110000                   jg         0x7ff77bbdfcb0
007b4 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
007bc 4183fa10                       cmp        r10d, 0x10
007c0 0f8fff040000                   jg         0x7ff77bbdefc5
007c6 448bd8                         mov        r11d, eax
007c9 3b8424d0000000                 cmp        eax, dword ptr [rsp + 0xd0]
007d0 0f83ce0e0000                   jae        0x7ff77bbdf9a4
007d6 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007de c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
007e5 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
007ed 0f832d0f0000                   jae        0x7ff77bbdfa20
007f3 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
007fb 4503d3                         add        r10d, r11d
007fe 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00803 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0080b c4817a7f443208                 vmovdqu    xmmword ptr [r10 + r14 + 8], xmm0
00812 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0081a 4503d6                         add        r10d, r14d
0081d 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00825 458bea                         mov        r13d, r10d
00828 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
00830 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00838 4183fb10                       cmp        r11d, 0x10
0083c 0f8f4dfbffff                   jg         0x7ff77bbde68f
00842 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0084a 4183fa10                       cmp        r10d, 0x10
0084e 0f8c3bfbffff                   jl         0x7ff77bbde68f
00854 443bac24e0000000               cmp        r13d, dword ptr [rsp + 0xe0]
0085c 0f835e0f0000                   jae        0x7ff77bbdfac0
00862 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0086a c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
00871 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00879 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00881 0f82e9faffff                   jb         0x7ff77bbde670
00887 bee4ffffff                     mov        esi, 0xffffffe4
0088c 488b2c24                       mov        rbp, qword ptr [rsp]
00890 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00895 44895c2408                     mov        dword ptr [rsp + 8], r11d
0089a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0089f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
008a4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008a9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008ae 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
008b3 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
008b8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
008bd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
008c2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008c7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
008cc 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008d4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008d9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008e1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
008e6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008eb 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
008f0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008f9 90                             nop        
008fa 90                             nop        
008fb 90                             nop        
008fc c5f877                         vzeroupper 
008ff e85ceeaeff                     call       0x7ff77b6cda60
00904 0f1f8400fc090004               nop        dword ptr [rax + rax + 0x40009fc]
0090c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
00916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0091a e8c10f1818                     call       0x7ff793d5fbe0
0091f f4                             hlt        
00920 453bda                         cmp        r11d, r10d
00923 0f8e9afdffff                   jle        0x7ff77bbde9c3
00929 be45ffffff                     mov        esi, 0xffffff45
0092e 418beb                         mov        ebp, r11d
00931 44891424                       mov        dword ptr [rsp], r10d
00935 90                             nop        
00936 90                             nop        
00937 90                             nop        
00938 c5f877                         vzeroupper 
0093b e820eeaeff                     call       0x7ff77b6cda60
00940 0f1f8400380a0005               nop        dword ptr [rax + rax + 0x5000a38]
00948 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
00952 4883e4f0                       and        rsp, 0xfffffffffffffff0
00956 e8850f1818                     call       0x7ff793d5fbe0
0095b f4                             hlt        
0095c 4d63dd                         movsxd     r11, r13d
0095f 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00967 0f8c8f130000                   jl         0x7ff77bbdfffc
0096d 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
00975 0f8ff1130000                   jg         0x7ff77bbe006c
0097b 4533c0                         xor        r8d, r8d
0097e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00983 e9e4fdffff                     jmp        0x7ff77bbdea6c
00988 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00990 4585d2                         test       r10d, r10d
00993 7407                           je         0x7ff77bbdec9c
00995 458d50ff                       lea        r10d, [r8 - 1]
00999 418bca                         mov        ecx, r10d
0099c 85c9                           test       ecx, ecx
0099e 750e                           jne        0x7ff77bbdecae
009a0 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
009a8 458b5a08                       mov        r11d, dword ptr [r10 + 8]
009ac eb74                           jmp        0x7ff77bbded22
009ae 83f903                         cmp        ecx, 3
009b1 0f8481160000                   je         0x7ff77bbe0338
009b7 83f902                         cmp        ecx, 2
009ba 0f87f0160000                   ja         0x7ff77bbe03b0
009c0 3b4c2430                       cmp        ecx, dword ptr [rsp + 0x30]
009c4 0f836c150000                   jae        0x7ff77bbe0236
009ca 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009d2 458b5c8b08                     mov        r11d, dword ptr [r11 + rcx*4 + 8]
009d7 85c9                           test       ecx, ecx
009d9 7e3b                           jle        0x7ff77bbded16
009db 448d41ff                       lea        r8d, [rcx - 1]
009df 443b442430                     cmp        r8d, dword ptr [rsp + 0x30]
009e4 0f83d2150000                   jae        0x7ff77bbe02bc
009ea 90                             nop        
009eb 90                             nop        
009ec 90                             nop        
009ed 90                             nop        
009ee 90                             nop        
009ef 90                             nop        
009f0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009f8 458b548804                     mov        r10d, dword ptr [r8 + rcx*4 + 4]
009fd 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
00a05 4589548908                     mov        dword ptr [r9 + rcx*4 + 8], r10d
00a0a 448d51ff                       lea        r10d, [rcx - 1]
00a0e 418bca                         mov        ecx, r10d
00a11 4585d2                         test       r10d, r10d
00a14 7fda                           jg         0x7ff77bbdecf0
00a16 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00a1e 45895a08                       mov        dword ptr [r10 + 8], r11d
00a22 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a2a e9e6fcffff                     jmp        0x7ff77bbdea15
00a2f 4183fa10                       cmp        r10d, 0x10
00a33 0f8d1b1a0000                   jge        0x7ff77bbe0754
00a39 4183fa08                       cmp        r10d, 8
00a3d 0f8d85070000                   jge        0x7ff77bbdf4c8
00a43 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00a4b 4183fb10                       cmp        r11d, 0x10
00a4f 0f8eb6000000                   jle        0x7ff77bbdee0b
00a55 4585ed                         test       r13d, r13d
00a58 0f8c5a190000                   jl         0x7ff77bbe06b8
00a5e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a66 4585d2                         test       r10d, r10d
00a69 0f8c49190000                   jl         0x7ff77bbe06b8
00a6f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a74 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00a7c 0f8236190000                   jb         0x7ff77bbe06b8
00a82 8bac24cc000000                 mov        ebp, dword ptr [rsp + 0xcc]
00a89 03ac249c000000                 add        ebp, dword ptr [rsp + 0x9c]
00a90 443bdd                         cmp        r11d, ebp
00a93 0f821f190000                   jb         0x7ff77bbe06b8
00a99 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00aa1 4585d2                         test       r10d, r10d
00aa4 0f8c0e190000                   jl         0x7ff77bbe06b8
00aaa 4585d2                         test       r10d, r10d
00aad 0f8415f8ffff                   je         0x7ff77bbde5c8
00ab3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00ab8 4983fa20                       cmp        r10, 0x20
00abc 772d                           ja         0x7ff77bbdedeb
00abe 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00ac6 4d63d2                         movsxd     r10, r10d
00ac9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ad0 c442a8f5db                     bzhi       r11, r11, r10
00ad5 c4c1fb92fb                     kmovq      k7, r11
00ada 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ae0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ae6 e9ddf7ffff                     jmp        0x7ff77bbde5c8
00aeb 498bd2                         mov        rdx, r10
00aee c5f877                         vzeroupper 
00af1 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00afb 41ffd2                         call       r10
00afe 0f1f840000000000               nop        dword ptr [rax + rax]
00b06 e9bdf7ffff                     jmp        0x7ff77bbde5c8
00b0b 443b6c2408                     cmp        r13d, dword ptr [rsp + 8]
00b10 0f8312160000                   jae        0x7ff77bbe0428
00b16 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b1e 430fbe6c2a08                   movsx      ebp, byte ptr [r10 + r13 + 8]
00b24 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b2c 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b31 0f8391160000                   jae        0x7ff77bbe04c8
00b37 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b3f 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b47 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00b4c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b54 41ffc2                         inc        r10d
00b57 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00b5f 458d5d03                       lea        r11d, [r13 + 3]
00b63 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b68 0f83d6160000                   jae        0x7ff77bbe0544
00b6e 4d63dd                         movsxd     r11, r13d
00b71 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b79 430fbe6c1a09                   movsx      ebp, byte ptr [r10 + r11 + 9]
00b7f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b87 4183c203                       add        r10d, 3
00b8b 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b90 0f832e170000                   jae        0x7ff77bbe05c4
00b96 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
00b9e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00ba6 43886c0209                     mov        byte ptr [r10 + r8 + 9], bpl
00bab 470fbe541a0a                   movsx      r10d, byte ptr [r10 + r11 + 0xa]
00bb1 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00bb9 478854010a                     mov        byte ptr [r9 + r8 + 0xa], r10b
00bbe 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
00bc4 47885c010b                     mov        byte ptr [r9 + r8 + 0xb], r11b
00bc9 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00bd1 4183fb08                       cmp        r11d, 8
00bd5 0f8359170000                   jae        0x7ff77bbe0634
00bdb 49baf03b27e300000000           movabs     r10, 0xe3273bf0
00be5 47036c9a08                     add        r13d, dword ptr [r10 + r11*4 + 8]
00bea 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
00bef 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00bf7 4183fb04                       cmp        r11d, 4
00bfb 7e43                           jle        0x7ff77bbdef40
00bfd 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c04 83c504                         add        ebp, 4
00c07 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c0f 418bd5                         mov        edx, r13d
00c12 90                             nop        
00c13 90                             nop        
00c14 c5f877                         vzeroupper 
00c17 e8440db5ff                     call       0x7ff77b72fc60
00c1c 0f1f8400140d0006               nop        dword ptr [rax + rax + 0x6000d14]
00c24 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c2c 8bd5                           mov        edx, ebp
00c2e 8bc8                           mov        ecx, eax
00c30 c5f877                         vzeroupper 
00c33 e8280db5ff                     call       0x7ff77b72fc60
00c38 0f1f8400300d0007               nop        dword ptr [rax + rax + 0x7000d30]
00c40 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00c48 4183fb08                       cmp        r11d, 8
00c4c 7e62                           jle        0x7ff77bbdefb0
00c4e 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00c52 49ba183c27e300000000           movabs     r10, 0xe3273c18
00c5c 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00c64 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00c69 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c70 83c508                         add        ebp, 8
00c73 83c208                         add        edx, 8
00c76 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c7e 90                             nop        
00c7f 90                             nop        
00c80 c5f877                         vzeroupper 
00c83 e8d80cb5ff                     call       0x7ff77b72fc60
00c88 0f1f8400800d0008               nop        dword ptr [rax + rax + 0x8000d80]
00c90 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c98 8bd5                           mov        edx, ebp
00c9a 488bc8                         mov        rcx, rax
00c9d 90                             nop        
00c9e 90                             nop        
00c9f 90                             nop        
00ca0 c5f877                         vzeroupper 
00ca3 e8b80cb5ff                     call       0x7ff77b72fc60
00ca8 0f1f8400a00d0009               nop        dword ptr [rax + rax + 0x9000da0]
00cb0 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00cb4 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00cbc 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00cc0 e9b7f8ffff                     jmp        0x7ff77bbde87c
00cc5 4183fa30                       cmp        r10d, 0x30
00cc9 0f8e86000000                   jle        0x7ff77bbdf055
00ccf 85c0                           test       eax, eax
00cd1 0f8c051a0000                   jl         0x7ff77bbe09dc
00cd7 4585f6                         test       r14d, r14d
00cda 0f8cfc190000                   jl         0x7ff77bbe09dc
00ce0 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00ce4 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00ce8 0f82ee190000                   jb         0x7ff77bbe09dc
00cee 448b542408                     mov        r10d, dword ptr [rsp + 8]
00cf3 443bd3                         cmp        r10d, ebx
00cf6 0f82e0190000                   jb         0x7ff77bbe09dc
00cfc 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00d04 4585d2                         test       r10d, r10d
00d07 7426                           je         0x7ff77bbdf02f
00d09 4883fa20                       cmp        rdx, 0x20
00d0d 772c                           ja         0x7ff77bbdf03b
00d0f 4d63d2                         movsxd     r10, r10d
00d12 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d19 c442a8f5db                     bzhi       r11, r11, r10
00d1e c4c1fb92fb                     kmovq      k7, r11
00d23 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d29 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d2f 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
00d36 e9f5faffff                     jmp        0x7ff77bbdeb30
00d3b c5f877                         vzeroupper 
00d3e 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00d48 41ffd2                         call       r10
00d4b 0f1f840000000000               nop        dword ptr [rax + rax]
00d53 ebda                           jmp        0x7ff77bbdf02f
00d55 448bc0                         mov        r8d, eax
00d58 3b8424d0000000                 cmp        eax, dword ptr [rsp + 0xd0]
00d5f 0f8347180000                   jae        0x7ff77bbe08ac
00d65 4963c8                         movsxd     rcx, r8d
00d68 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d70 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00d77 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
00d7f 0f83bb180000                   jae        0x7ff77bbe0940
00d85 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00d8a 458d5610                       lea        r10d, [r14 + 0x10]
00d8e 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00d96 4d63d6                         movsxd     r10, r14d
00d99 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00da1 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00da8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00db0 443bdb                         cmp        r11d, ebx
00db3 0f8df1030000                   jge        0x7ff77bbdf4aa
00db9 492bca                         sub        rcx, r10
00dbc 4d63d3                         movsxd     r10, r11d
00dbf 48637c2444                     movsxd     rdi, dword ptr [rsp + 0x44]
00dc4 4883c7f1                       add        rdi, -0xf
00dc8 4d8d040a                       lea        r8, [r10 + rcx]
00dcc 4c3bc7                         cmp        r8, rdi
00dcf 0f839f190000                   jae        0x7ff77bbe0a74
00dd5 4c63cb                         movsxd     r9, ebx
00dd8 4d8bc1                         mov        r8, r9
00ddb 4d2bc2                         sub        r8, r10
00dde 4983c00f                       add        r8, 0xf
00de2 4983e0f0                       and        r8, 0xfffffffffffffff0
00de6 458bd0                         mov        r10d, r8d
00de9 478d443210                     lea        r8d, [r10 + r14 + 0x10]
00dee 4d63d0                         movsxd     r10, r8d
00df1 4d8d440af0                     lea        r8, [r10 + rcx - 0x10]
00df6 4c3bc7                         cmp        r8, rdi
00df9 0f8375190000                   jae        0x7ff77bbe0a74
00dff 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00e07 0f8367190000                   jae        0x7ff77bbe0a74
00e0d 4983c2f0                       add        r10, -0x10
00e11 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
00e16 4983c3f1                       add        r11, -0xf
00e1a 4d3bd3                         cmp        r10, r11
00e1d 0f8351190000                   jae        0x7ff77bbe0a74
00e23 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e29 0f8fa1190000                   jg         0x7ff77bbe0ad0
00e2f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e34 452bd6                         sub        r10d, r14d
00e37 4183c620                       add        r14d, 0x20
00e3b e9b0000000                     jmp        0x7ff77bbdf1f0
00e40 4d63d2                         movsxd     r10, r10d
00e43 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e4a c442a8f5db                     bzhi       r11, r11, r10
00e4f c4c1fb92fb                     kmovq      k7, r11
00e54 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e5a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e60 eb67                           jmp        0x7ff77bbdf1c9
00e62 85c0                           test       eax, eax
00e64 0f8c06170000                   jl         0x7ff77bbe0870
00e6a 4585f6                         test       r14d, r14d
00e6d 0f8cfd160000                   jl         0x7ff77bbe0870
00e73 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e78 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e7d 0f82ed160000                   jb         0x7ff77bbe0870
00e83 438d2c16                       lea        ebp, [r14 + r10]
00e87 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e8c 443bdd                         cmp        r11d, ebp
00e8f 0f82db160000                   jb         0x7ff77bbe0870
00e95 4585d2                         test       r10d, r10d
00e98 0f8cd2160000                   jl         0x7ff77bbe0870
00e9e 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ea3 443bc8                         cmp        r9d, eax
00ea6 7421                           je         0x7ff77bbdf1c9
00ea8 4963d2                         movsxd     rdx, r10d
00eab 4883fa20                       cmp        rdx, 0x20
00eaf 768f                           jbe        0x7ff77bbdf140
00eb1 c5f877                         vzeroupper 
00eb4 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00ebe 41ffd2                         call       r10
00ec1 0f1f840000000000               nop        dword ptr [rax + rax]
00ec9 4c8b1424                       mov        r10, qword ptr [rsp]
00ecd 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00ed1 c5f877                         vzeroupper 
00ed4 4881c400010000                 add        rsp, 0x100
00edb 5d                             pop        rbp
00edc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ee0 0f870e1d0000                   ja         0x7ff77bbe0ef4
00ee6 c3                             ret        
00ee7 90                             nop        
00ee8 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00ef0 458bda                         mov        r11d, r10d
00ef3 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
00efb 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f03 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00f0a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00f12 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00f1a c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00f21 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f29 4183c310                       add        r11d, 0x10
00f2d 453bde                         cmp        r11d, r14d
00f30 7cb6                           jl         0x7ff77bbdf1e8
00f32 4981c110ffffff                 add        r9, -0xf0
00f39 4981f900000080                 cmp        r9, -0x80000000
00f40 49c7c000000080                 mov        r8, 0xffffffff80000000
00f47 4d0f4cc8                       cmovl      r9, r8
00f4b 418bf1                         mov        esi, r9d
00f4e 443bde                         cmp        r11d, esi
00f51 0f8d03020000                   jge        0x7ff77bbdf45a
00f57 4d63c3                         movsxd     r8, r11d
00f5a 4c03c1                         add        r8, rcx
00f5d 4c3bc7                         cmp        r8, rdi
00f60 0f83c6180000                   jae        0x7ff77bbe0b2c
00f66 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00f6e 4181c100010000                 add        r9d, 0x100
00f75 4d63c1                         movsxd     r8, r9d
00f78 4c03c1                         add        r8, rcx
00f7b 4c3bc7                         cmp        r8, rdi
00f7e 0f83bc180000                   jae        0x7ff77bbe0b40
00f84 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00f8c 0f83c2180000                   jae        0x7ff77bbe0b54
00f92 443b8c24e0000000               cmp        r9d, dword ptr [rsp + 0xe0]
00f9a 0f83c8180000                   jae        0x7ff77bbe0b68
00fa0 478d0c1a                       lea        r9d, [r10 + r11]
00fa4 458bc3                         mov        r8d, r11d
00fa7 4d63c0                         movsxd     r8, r8d
00faa 418bd1                         mov        edx, r9d
00fad 488b8424a8000000               mov        rax, qword ptr [rsp + 0xa8]
00fb5 c5fa6f441008                   vmovdqu    xmm0, xmmword ptr [rax + rdx + 8]
00fbb 4963d1                         movsxd     rdx, r9d
00fbe 458bcb                         mov        r9d, r11d
00fc1 488b8424c0000000               mov        rax, qword ptr [rsp + 0xc0]
00fc9 c4a17a7f440808                 vmovdqu    xmmword ptr [rax + r9 + 8], xmm0
00fd0 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00fd8 c4c17a6f441118                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x18]
00fdf c4a17a7f440018                 vmovdqu    xmmword ptr [rax + r8 + 0x18], xmm0
00fe6 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00fee c4c17a6f441128                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x28]
00ff5 c4a17a7f440028                 vmovdqu    xmmword ptr [rax + r8 + 0x28], xmm0
00ffc 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01004 c4c17a6f441138                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x38]
0100b c4a17a7f440038                 vmovdqu    xmmword ptr [rax + r8 + 0x38], xmm0
01012 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
0101a c4c17a6f441148                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x48]
01021 c4a17a7f440048                 vmovdqu    xmmword ptr [rax + r8 + 0x48], xmm0
01028 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01030 c4c17a6f441158                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x58]
01037 c4a17a7f440058                 vmovdqu    xmmword ptr [rax + r8 + 0x58], xmm0
0103e 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01046 c4c17a6f441168                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x68]
0104d c4a17a7f440068                 vmovdqu    xmmword ptr [rax + r8 + 0x68], xmm0
01054 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
0105c c4c17a6f441178                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x78]
01063 c4a17a7f440078                 vmovdqu    xmmword ptr [rax + r8 + 0x78], xmm0
0106a 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01072 c4c17a6f841188000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x88]
0107c c4a17a7f840088000000           vmovdqu    xmmword ptr [rax + r8 + 0x88], xmm0
01086 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
0108e c4c17a6f841198000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x98]
01098 c4a17a7f840098000000           vmovdqu    xmmword ptr [rax + r8 + 0x98], xmm0
010a2 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
010aa c4c17a6f8411a8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xa8]
010b4 c4a17a7f8400a8000000           vmovdqu    xmmword ptr [rax + r8 + 0xa8], xmm0
010be 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
010c6 c4c17a6f8411b8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xb8]
010d0 c4a17a7f8400b8000000           vmovdqu    xmmword ptr [rax + r8 + 0xb8], xmm0
010da 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
010e2 c4c17a6f8411c8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xc8]
010ec c4a17a7f8400c8000000           vmovdqu    xmmword ptr [rax + r8 + 0xc8], xmm0
010f6 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
010fe c4c17a6f8411d8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xd8]
01108 c4a17a7f8400d8000000           vmovdqu    xmmword ptr [rax + r8 + 0xd8], xmm0
01112 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
0111a c4c17a6f8411e8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xe8]
01124 c4a17a7f8400e8000000           vmovdqu    xmmword ptr [rax + r8 + 0xe8], xmm0
0112e 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01136 c4c17a6f8411f8000000           vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0xf8]
01140 c4a17a7f8400f8000000           vmovdqu    xmmword ptr [rax + r8 + 0xf8], xmm0
0114a 4181c300010000                 add        r11d, 0x100
01151 443bde                         cmp        r11d, esi
01154 0f8c46feffff                   jl         0x7ff77bbdf2a0
0115a 443bdb                         cmp        r11d, ebx
0115d 7d4b                           jge        0x7ff77bbdf4aa
0115f 4d63c3                         movsxd     r8, r11d
01162 4c03c1                         add        r8, rcx
01165 4c3bc7                         cmp        r8, rdi
01168 0f834a190000                   jae        0x7ff77bbe0db8
0116e 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
01176 0f8350190000                   jae        0x7ff77bbe0dcc
0117c 478d041a                       lea        r8d, [r10 + r11]
01180 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01188 c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
0118f 458bcb                         mov        r9d, r11d
01192 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0119a c4817a7f440808                 vmovdqu    xmmword ptr [r8 + r9 + 8], xmm0
011a1 4183c310                       add        r11d, 0x10
011a5 443bdb                         cmp        r11d, ebx
011a8 7cd2                           jl         0x7ff77bbdf47c
011aa 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
011b2 4403542438                     add        r10d, dword ptr [rsp + 0x38]
011b7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
011bc 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
011c3 e968f6ffff                     jmp        0x7ff77bbdeb30
011c8 443bac24c8000000               cmp        r13d, dword ptr [rsp + 0xc8]
011d0 0f83a6160000                   jae        0x7ff77bbe0b7c
011d6 458bd5                         mov        r10d, r13d
011d9 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
011e1 4d63ca                         movsxd     r9, r10d
011e4 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
011ec 4f8b540a08                     mov        r10, qword ptr [r10 + r9 + 8]
011f1 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
011f9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01201 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01209 0f8301170000                   jae        0x7ff77bbe0c10
0120f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01217 4183c208                       add        r10d, 8
0121b 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01220 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01224 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0122c 4d63d8                         movsxd     r11, r8d
0122f 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01237 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0123f 4a895c1908                     mov        qword ptr [rcx + r11 + 8], rbx
01244 418d5808                       lea        ebx, [r8 + 8]
01248 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0124c 418502                         test       dword ptr [r10], eax
0124f 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
01256 0f8d54faffff                   jge        0x7ff77bbdefb0
0125c 4d2bcb                         sub        r9, r11
0125f 48634c240c                     movsxd     rcx, dword ptr [rsp + 0xc]
01264 4883c1f9                       add        rcx, -7
01268 4863d3                         movsxd     rdx, ebx
0126b 4e8d140a                       lea        r10, [rdx + r9]
0126f 4c3bd1                         cmp        r10, rcx
01272 0f830c170000                   jae        0x7ff77bbe0c84
01278 4863bc2498000000               movsxd     rdi, dword ptr [rsp + 0x98]
01280 4c8bd7                         mov        r10, rdi
01283 4c2bd2                         sub        r10, rdx
01286 4983c207                       add        r10, 7
0128a 4983e2f8                       and        r10, 0xfffffffffffffff8
0128e 458bda                         mov        r11d, r10d
01291 478d540308                     lea        r10d, [r11 + r8 + 8]
01296 4d63d2                         movsxd     r10, r10d
01299 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
0129e 4c3bd9                         cmp        r11, rcx
012a1 0f83dd160000                   jae        0x7ff77bbe0c84
012a7 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
012ae 0f83d0160000                   jae        0x7ff77bbe0c84
012b4 4983c2f8                       add        r10, -8
012b8 4c3bd1                         cmp        r10, rcx
012bb 0f83c3160000                   jae        0x7ff77bbe0c84
012c1 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
012c9 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
012d0 0f8f1a170000                   jg         0x7ff77bbe0cf0
012d6 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
012de 452bd0                         sub        r10d, r8d
012e1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
012e6 41baf8ffffff                   mov        r10d, 0xfffffff8
012ec 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
012f4 458bdb                         mov        r11d, r11d
012f7 452bd3                         sub        r10d, r11d
012fa 452bd0                         sub        r10d, r8d
012fd 4183c010                       add        r8d, 0x10
01301 4183c2f0                       add        r10d, -0x10
01305 4c8d5fc8                       lea        r11, [rdi - 0x38]
01309 4981fb00000080                 cmp        r11, -0x80000000
01310 48c7c300000080                 mov        rbx, 0xffffffff80000000
01317 4c0f4cdb                       cmovl      r11, rbx
0131b 418bdb                         mov        ebx, r11d
0131e 442bac249c000000               sub        r13d, dword ptr [rsp + 0x9c]
01326 4d63d8                         movsxd     r11, r8d
01329 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
01331 488bc6                         mov        rax, rsi
01334 be06000000                     mov        esi, 6
01339 c442c8f5d2                     bzhi       r10, r10, rsi
0133e 4d03da                         add        r11, r10
01341 4c3bdf                         cmp        r11, rdi
01344 488bf7                         mov        rsi, rdi
01347 490f4cf3                       cmovl      rsi, r11
0134b 4c8bd6                         mov        r10, rsi
0134e 4c2bd2                         sub        r10, rdx
01351 4d8d5aff                       lea        r11, [r10 - 1]
01355 49c1fb3f                       sar        r11, 0x3f
01359 49c1eb3d                       shr        r11, 0x3d
0135d 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
01362 4983e2f8                       and        r10, 0xfffffffffffffff8
01366 4c03d2                         add        r10, rdx
01369 493bd2                         cmp        rdx, r10
0136c 490f4cd2                       cmovl      rdx, r10
01370 448bda                         mov        r11d, edx
01373 478d541d08                     lea        r10d, [r13 + r11 + 8]
01378 4183c308                       add        r11d, 8
0137c 4963d2                         movsxd     rdx, r10d
0137f 4803d0                         add        rdx, rax
01382 4963eb                         movsxd     rbp, r11d
01385 4803e8                         add        rbp, rax
01388 4c8d5208                       lea        r10, [rdx + 8]
0138c 4883c248                       add        rdx, 0x48
01390 488d4548                       lea        rax, [rbp + 0x48]
01394 4533db                         xor        r11d, r11d
01397 493bc2                         cmp        rax, r10
0139a 410f96c3                       setbe      r11b
0139e 4883c508                       add        rbp, 8
013a2 488bc2                         mov        rax, rdx
013a5 4533d2                         xor        r10d, r10d
013a8 483bc5                         cmp        rax, rbp
013ab 410f96c2                       setbe      r10b
013af 450bda                         or         r11d, r10d
013b2 0f84280a0000                   je         0x7ff77bbe00e0
013b8 8bd6                           mov        edx, esi
013ba eb05                           jmp        0x7ff77bbdf6c1
013bc 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
013c1 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
013c6 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
013cb 440344246c                     add        r8d, dword ptr [rsp + 0x6c]
013d0 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
013d8 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
013dd 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
013e5 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
013ea 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
013ef 4183c008                       add        r8d, 8
013f3 443bc2                         cmp        r8d, edx
013f6 7cc4                           jl         0x7ff77bbdf6bc
013f8 4881c708feffff                 add        rdi, -0x1f8
013ff 4881ff00000080                 cmp        rdi, -0x80000000
01406 49c7c200000080                 mov        r10, 0xffffffff80000000
0140d 490f4cfa                       cmovl      rdi, r10
01411 8bd7                           mov        edx, edi
01413 443bc2                         cmp        r8d, edx
01416 0f8d44160000                   jge        0x7ff77bbe0d60
0141c 4d63d0                         movsxd     r10, r8d
0141f 4d03d1                         add        r10, r9
01422 4c3bd1                         cmp        r10, rcx
01425 0f833d160000                   jae        0x7ff77bbe0d68
0142b 8b7c246c                       mov        edi, dword ptr [rsp + 0x6c]
0142f 81c700020000                   add        edi, 0x200
01435 4c63d7                         movsxd     r10, edi
01438 4d03d1                         add        r10, r9
0143b 4c3bd1                         cmp        r10, rcx
0143e 0f8338160000                   jae        0x7ff77bbe0d7c
01444 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
0144c 0f833e160000                   jae        0x7ff77bbe0d90
01452 3bbc24c8000000                 cmp        edi, dword ptr [rsp + 0xc8]
01459 0f8345160000                   jae        0x7ff77bbe0da4
0145f eb12                           jmp        0x7ff77bbdf773
01461 90                             nop        
01462 90                             nop        
01463 90                             nop        
01464 90                             nop        
01465 90                             nop        
01466 90                             nop        
01467 90                             nop        
01468 90                             nop        
01469 90                             nop        
0146a 90                             nop        
0146b 90                             nop        
0146c 90                             nop        
0146d 90                             nop        
0146e 90                             nop        
0146f 90                             nop        
01470 448bc6                         mov        r8d, esi
01473 458d9000010000                 lea        r10d, [r8 + 0x100]
0147a 4403542418                     add        r10d, dword ptr [rsp + 0x18]
0147f 418db080000000                 lea        esi, [r8 + 0x80]
01486 03742418                       add        esi, dword ptr [rsp + 0x18]
0148a 418bea                         mov        ebp, r10d
0148d 4d63ea                         movsxd     r13, r10d
01490 418bf8                         mov        edi, r8d
01493 8b442418                       mov        eax, dword ptr [rsp + 0x18]
01497 4103c0                         add        eax, r8d
0149a 458bd0                         mov        r10d, r8d
0149d 4d63f2                         movsxd     r14, r10d
014a0 448bd8                         mov        r11d, eax
014a3 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
014ab 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
014b6 62d17e487f843a08000000         vmovdqu32  zmmword ptr [r10 + rdi + 8], zmm0
014c1 4863f8                         movsxd     rdi, eax
014c4 458d5040                       lea        r10d, [r8 + 0x40]
014c8 4403542418                     add        r10d, dword ptr [rsp + 0x18]
014cd 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
014d5 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
014e0 62917e487f843348000000         vmovdqu32  zmmword ptr [r11 + r14 + 0x48], zmm0
014eb 62d17e486f843308000000         vmovdqu32  zmm0, zmmword ptr [r11 + rsi + 8]
014f6 62917e487f843388000000         vmovdqu32  zmmword ptr [r11 + r14 + 0x88], zmm0
01501 62d17e486f843bc8000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdi + 0xc8]
0150c 62917e487f8433c8000000         vmovdqu32  zmmword ptr [r11 + r14 + 0xc8], zmm0
01517 62d17e486f842b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rbp + 8]
01522 62917e487f843308010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x108], zmm0
0152d 62d17e486f843b48010000         vmovdqu32  zmm0, zmmword ptr [r11 + rdi + 0x148]
01538 62917e487f843348010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x148], zmm0
01543 62d17e486f843b88010000         vmovdqu32  zmm0, zmmword ptr [r11 + rdi + 0x188]
0154e 62917e487f843388010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x188], zmm0
01559 62917e486f842bc8000000         vmovdqu32  zmm0, zmmword ptr [r11 + r13 + 0xc8]
01564 62917e487f8433c8010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x1c8], zmm0
0156f 418db000020000                 lea        esi, [r8 + 0x200]
01576 3bf2                           cmp        esi, edx
01578 0f8cf2feffff                   jl         0x7ff77bbdf770
0157e 3bf3                           cmp        esi, ebx
01580 7d56                           jge        0x7ff77bbdf8d8
01582 4181c038020000                 add        r8d, 0x238
01589 4d63d0                         movsxd     r10, r8d
0158c 4d03d1                         add        r10, r9
0158f 4c3bd1                         cmp        r10, rcx
01592 0f8348150000                   jae        0x7ff77bbe0de0
01598 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
015a0 0f8362150000                   jae        0x7ff77bbe0e08
015a6 90                             nop        
015a7 90                             nop        
015a8 448bde                         mov        r11d, esi
015ab 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
015b0 4403d6                         add        r10d, esi
015b3 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
015bb 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
015c6 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
015d1 83c640                         add        esi, 0x40
015d4 3bf3                           cmp        esi, ebx
015d6 7cd0                           jl         0x7ff77bbdf8a8
015d8 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
015df 0f8dcbf6ffff                   jge        0x7ff77bbdefb0
015e5 4c63d6                         movsxd     r10, esi
015e8 4d03d1                         add        r10, r9
015eb 4c3bd1                         cmp        r10, rcx
015ee 0f8300150000                   jae        0x7ff77bbe0df4
015f4 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
015fb 0f831b150000                   jae        0x7ff77bbe0e1c
01601 90                             nop        
01602 90                             nop        
01603 90                             nop        
01604 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01609 4403de                         add        r11d, esi
0160c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01614 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01619 448bc6                         mov        r8d, esi
0161c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01624 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01629 83c608                         add        esi, 8
0162c 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
01633 7ccf                           jl         0x7ff77bbdf904
01635 e976f6ffff                     jmp        0x7ff77bbdefb0
0163a bee4ffffff                     mov        esi, 0xffffffe4
0163f 488b2c24                       mov        rbp, qword ptr [rsp]
01643 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01648 4489542408                     mov        dword ptr [rsp + 8], r10d
0164d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01652 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01657 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0165c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01661 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01666 89442434                       mov        dword ptr [rsp + 0x34], eax
0166a 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0166f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01674 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01679 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0167e 90                             nop        
0167f 90                             nop        
01680 c5f877                         vzeroupper 
01683 e8d8e0aeff                     call       0x7ff77b6cda60
01688 0f1f84008017000b               nop        dword ptr [rax + rax + 0xb001780]
01690 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0169a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0169e e83d021818                     call       0x7ff793d5fbe0
016a3 f4                             hlt        
016a4 bee4ffffff                     mov        esi, 0xffffffe4
016a9 488b2c24                       mov        rbp, qword ptr [rsp]
016ad 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016b2 4489542408                     mov        dword ptr [rsp + 8], r10d
016b7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016c1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016c6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016cb 4489742430                     mov        dword ptr [rsp + 0x30], r14d
016d0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
016d5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016da 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
016df 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016e4 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
016e9 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
016ee 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
016f3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
016f8 89442478                       mov        dword ptr [rsp + 0x78], eax
016fc c5f877                         vzeroupper 
016ff e85ce0aeff                     call       0x7ff77b6cda60
01704 0f1f8400fc17000c               nop        dword ptr [rax + rax + 0xc0017fc]
0170c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01716 4883e4f0                       and        rsp, 0xfffffffffffffff0
0171a e8c1011818                     call       0x7ff793d5fbe0
0171f f4                             hlt        
01720 bee4ffffff                     mov        esi, 0xffffffe4
01725 488b2c24                       mov        rbp, qword ptr [rsp]
01729 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0172e 4489542408                     mov        dword ptr [rsp + 8], r10d
01733 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01738 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0173d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01742 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01747 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0174c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01751 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01756 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0175b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01760 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01765 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0176a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01772 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01777 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0177f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01784 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01789 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0178e 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01793 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0179c c5f877                         vzeroupper 
0179f e8bcdfaeff                     call       0x7ff77b6cda60
017a4 0f1f84009c18000d               nop        dword ptr [rax + rax + 0xd00189c]
017ac 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
017b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ba e821011818                     call       0x7ff793d5fbe0
017bf f4                             hlt        
017c0 bee4ffffff                     mov        esi, 0xffffffe4
017c5 488b2c24                       mov        rbp, qword ptr [rsp]
017c9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017ce 4489542408                     mov        dword ptr [rsp + 8], r10d
017d3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017dd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017e2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017e7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
017ec 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
017f1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
017f6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
017fb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01800 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01805 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0180a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0180f 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01814 c5f877                         vzeroupper 
01817 e844dfaeff                     call       0x7ff77b6cda60
0181c 0f1f84001419000e               nop        dword ptr [rax + rax + 0xe001914]
01824 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0182e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01832 e8a9001818                     call       0x7ff793d5fbe0
01837 f4                             hlt        
01838 be45ffffff                     mov        esi, 0xffffff45
0183d 488b2c24                       mov        rbp, qword ptr [rsp]
01841 4c89542408                     mov        qword ptr [rsp + 8], r10
01846 90                             nop        
01847 90                             nop        
01848 c5f877                         vzeroupper 
0184b e810dfaeff                     call       0x7ff77b6cda60
01850 0f1f84004819000f               nop        dword ptr [rax + rax + 0xf001948]
01858 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01862 4883e4f0                       and        rsp, 0xfffffffffffffff0
01866 e875001818                     call       0x7ff793d5fbe0
0186b f4                             hlt        
0186c be45ffffff                     mov        esi, 0xffffff45
01871 488b2c24                       mov        rbp, qword ptr [rsp]
01875 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0187a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0187f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01884 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01889 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0188e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01893 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01898 89442434                       mov        dword ptr [rsp + 0x34], eax
0189c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018a1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018a6 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
018ab 90                             nop        
018ac c5f877                         vzeroupper 
018af e8acdeaeff                     call       0x7ff77b6cda60
018b4 0f1f8400ac190010               nop        dword ptr [rax + rax + 0x100019ac]
018bc 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
018c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ca e811001818                     call       0x7ff793d5fbe0
018cf f4                             hlt        
018d0 493bda                         cmp        rbx, r10
018d3 bdffffffff                     mov        ebp, 0xffffffff
018d8 7c08                           jl         0x7ff77bbdfbe2
018da 400f95c5                       setne      bpl
018de 400fb6ed                       movzx      ebp, bpl
018e2 be45ffffff                     mov        esi, 0xffffff45
018e7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018ec 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018f1 4489742438                     mov        dword ptr [rsp + 0x38], r14d
018f6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018fa 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
018ff 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01904 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01909 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0190e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01913 90                             nop        
01914 c5f877                         vzeroupper 
01917 e844deaeff                     call       0x7ff77b6cda60
0191c 0f1f8400141a0011               nop        dword ptr [rax + rax + 0x11001a14]
01924 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0192e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01932 e8a9ff1718                     call       0x7ff793d5fbe0
01937 f4                             hlt        
01938 be45ffffff                     mov        esi, 0xffffff45
0193d 488b2c24                       mov        rbp, qword ptr [rsp]
01941 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01946 4489542408                     mov        dword ptr [rsp + 8], r10d
0194b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01950 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01955 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0195a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0195f 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01964 89442434                       mov        dword ptr [rsp + 0x34], eax
01968 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0196d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01972 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01977 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0197c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01981 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01986 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0198b 90                             nop        
0198c c5f877                         vzeroupper 
0198f e8ccddaeff                     call       0x7ff77b6cda60
01994 0f1f84008c1a0012               nop        dword ptr [rax + rax + 0x12001a8c]
0199c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
019a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019aa e831ff1718                     call       0x7ff793d5fbe0
019af f4                             hlt        
019b0 be45ffffff                     mov        esi, 0xffffff45
019b5 488b2c24                       mov        rbp, qword ptr [rsp]
019b9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019be 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019cd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019d2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019d7 4489742430                     mov        dword ptr [rsp + 0x30], r14d
019dc 89442434                       mov        dword ptr [rsp + 0x34], eax
019e0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
019e5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019ea 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019ef 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019f4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019f9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
019fe 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01a03 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01a08 c5f877                         vzeroupper 
01a0b e850ddaeff                     call       0x7ff77b6cda60
01a10 0f1f8400081b0013               nop        dword ptr [rax + rax + 0x13001b08]
01a18 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01a22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a26 e8b5fe1718                     call       0x7ff793d5fbe0
01a2b f4                             hlt        
01a2c bee4ffffff                     mov        esi, 0xffffffe4
01a31 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a36 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a3b 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01a40 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a45 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a4a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a4f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a54 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01a5c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a61 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a69 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a6e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01a76 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01a7b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01a83 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a88 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01a8c 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
01a94 c5f877                         vzeroupper 
01a97 e8c4dcaeff                     call       0x7ff77b6cda60
01a9c 0f1f8400941b0014               nop        dword ptr [rax + rax + 0x14001b94]
01aa4 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ab2 e829fe1718                     call       0x7ff793d5fbe0
01ab7 f4                             hlt        
01ab8 bee4ffffff                     mov        esi, 0xffffffe4
01abd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ac2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ac7 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01acc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ad1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ad6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01adb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ae0 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01ae8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01aed 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01af5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01afa 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01b02 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01b07 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01b0b 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01b10 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01b15 90                             nop        
01b16 90                             nop        
01b17 90                             nop        
01b18 c5f877                         vzeroupper 
01b1b e840dcaeff                     call       0x7ff77b6cda60
01b20 0f1f8400181c0015               nop        dword ptr [rax + rax + 0x15001c18]
01b28 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01b32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b36 e8a5fd1718                     call       0x7ff793d5fbe0
01b3b f4                             hlt        
01b3c bebeffffff                     mov        esi, 0xffffffbe
01b41 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b46 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b4b 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01b50 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01b55 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b5a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01b5e 90                             nop        
01b5f 90                             nop        
01b60 c5f877                         vzeroupper 
01b63 e8f8dbaeff                     call       0x7ff77b6cda60
01b68 0f1f8400601c0016               nop        dword ptr [rax + rax + 0x16001c60]
01b70 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01b7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b7e e85dfd1718                     call       0x7ff793d5fbe0
01b83 f4                             hlt        
01b84 4533d2                         xor        r10d, r10d
01b87 4c891424                       mov        qword ptr [rsp], r10
01b8b e9d8e5ffff                     jmp        0x7ff77bbde468
01b90 4533d2                         xor        r10d, r10d
01b93 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01b9b e9f2e5ffff                     jmp        0x7ff77bbde492
01ba0 4533d2                         xor        r10d, r10d
01ba3 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01bab e911e6ffff                     jmp        0x7ff77bbde4c1
01bb0 4533d2                         xor        r10d, r10d
01bb3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bb8 e92be6ffff                     jmp        0x7ff77bbde4e8
01bbd 4533d2                         xor        r10d, r10d
01bc0 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
01bc8 e94ae6ffff                     jmp        0x7ff77bbde517
01bcd beccffffff                     mov        esi, 0xffffffcc
01bd2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bd7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01bdc 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01be1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01be6 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01beb 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01bf0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01bf5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01bfa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01c02 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01c07 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01c0f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01c14 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01c1c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c21 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c26 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01c2b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01c33 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01c38 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01c40 899c2498000000                 mov        dword ptr [rsp + 0x98], ebx
01c47 90                             nop        
01c48 c5f877                         vzeroupper 
01c4b e810dbaeff                     call       0x7ff77b6cda60
01c50 0f1f8400481d0017               nop        dword ptr [rax + rax + 0x17001d48]
01c58 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01c62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c66 e875fc1718                     call       0x7ff793d5fbe0
01c6b f4                             hlt        
01c6c beccffffff                     mov        esi, 0xffffffcc
01c71 488b2c24                       mov        rbp, qword ptr [rsp]
01c75 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c7a 4489542408                     mov        dword ptr [rsp + 8], r10d
01c7f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c84 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c89 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c8e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c93 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01c98 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01c9d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ca2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ca7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cac 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cb1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cb6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01cbb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cc0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01cc5 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01ccd 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01cd2 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01cd7 90                             nop        
01cd8 c5f877                         vzeroupper 
01cdb e880daaeff                     call       0x7ff77b6cda60
01ce0 0f1f8400d81d0018               nop        dword ptr [rax + rax + 0x18001dd8]
01ce8 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01cf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cf6 e8e5fb1718                     call       0x7ff793d5fbe0
01cfb f4                             hlt        
01cfc 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01d04 4d3bd8                         cmp        r11, r8
01d07 bdffffffff                     mov        ebp, 0xffffffff
01d0c 7c08                           jl         0x7ff77bbe0016
01d0e 400f95c5                       setne      bpl
01d12 400fb6ed                       movzx      ebp, bpl
01d16 be45ffffff                     mov        esi, 0xffffff45
01d1b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d20 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d25 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01d2a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d2e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01d33 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01d38 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d3d 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01d42 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d47 90                             nop        
01d48 c5f877                         vzeroupper 
01d4b e810daaeff                     call       0x7ff77b6cda60
01d50 0f1f8400481e0019               nop        dword ptr [rax + rax + 0x19001e48]
01d58 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01d62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d66 e875fb1718                     call       0x7ff793d5fbe0
01d6b f4                             hlt        
01d6c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01d74 493beb                         cmp        rbp, r11
01d77 bdffffffff                     mov        ebp, 0xffffffff
01d7c 7c08                           jl         0x7ff77bbe0086
01d7e 400f95c5                       setne      bpl
01d82 400fb6ed                       movzx      ebp, bpl
01d86 be45ffffff                     mov        esi, 0xffffff45
01d8b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d90 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d95 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01d9a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d9e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01da3 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01da8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01dad 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01db2 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01db7 90                             nop        
01db8 c5f877                         vzeroupper 
01dbb e8a0d9aeff                     call       0x7ff77b6cda60
01dc0 0f1f8400b81e001a               nop        dword ptr [rax + rax + 0x1a001eb8]
01dc8 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dd6 e805fb1718                     call       0x7ff793d5fbe0
01ddb f4                             hlt        
01ddc 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01de0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01de5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01dea 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
01def 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
01df7 4e8b541708                     mov        r10, qword ptr [rdi + r10 + 8]
01dfc 4e89541f08                     mov        qword ptr [rdi + r11 + 8], r10
01e01 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
01e05 83c208                         add        edx, 8
01e08 413bd0                         cmp        edx, r8d
01e0b 7ccf                           jl         0x7ff77bbe00dc
01e0d 3bd3                           cmp        edx, ebx
01e0f 0f8dc1000000                   jge        0x7ff77bbe01d6
01e15 4c63d2                         movsxd     r10, edx
01e18 4d03d1                         add        r10, r9
01e1b 4c3bd1                         cmp        r10, rcx
01e1e 0f830c0d0000                   jae        0x7ff77bbe0e30
01e24 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e29 4183c240                       add        r10d, 0x40
01e2d 4d63da                         movsxd     r11, r10d
01e30 4d03d9                         add        r11, r9
01e33 4c3bd9                         cmp        r11, rcx
01e36 0f83080d0000                   jae        0x7ff77bbe0e44
01e3c 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
01e43 0f830f0d0000                   jae        0x7ff77bbe0e58
01e49 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
01e51 0f83150d0000                   jae        0x7ff77bbe0e6c
01e57 90                             nop        
01e58 90                             nop        
01e59 90                             nop        
01e5a 90                             nop        
01e5b 90                             nop        
01e5c 90                             nop        
01e5d 90                             nop        
01e5e 90                             nop        
01e5f 90                             nop        
01e60 448bda                         mov        r11d, edx
01e63 4963fb                         movsxd     rdi, r11d
01e66 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01e6b 4403d2                         add        r10d, edx
01e6e 448bc2                         mov        r8d, edx
01e71 458bda                         mov        r11d, r10d
01e74 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
01e7c 4e8b5c1e08                     mov        r11, qword ptr [rsi + r11 + 8]
01e81 4e895c0608                     mov        qword ptr [rsi + r8 + 8], r11
01e86 4d63da                         movsxd     r11, r10d
01e89 4e8b541e10                     mov        r10, qword ptr [rsi + r11 + 0x10]
01e8e 4c89543e10                     mov        qword ptr [rsi + rdi + 0x10], r10
01e93 4e8b541e18                     mov        r10, qword ptr [rsi + r11 + 0x18]
01e98 4c89543e18                     mov        qword ptr [rsi + rdi + 0x18], r10
01e9d 4e8b541e20                     mov        r10, qword ptr [rsi + r11 + 0x20]
01ea2 4c89543e20                     mov        qword ptr [rsi + rdi + 0x20], r10
01ea7 4e8b541e28                     mov        r10, qword ptr [rsi + r11 + 0x28]
01eac 4c89543e28                     mov        qword ptr [rsi + rdi + 0x28], r10
01eb1 4e8b541e30                     mov        r10, qword ptr [rsi + r11 + 0x30]
01eb6 4c89543e30                     mov        qword ptr [rsi + rdi + 0x30], r10
01ebb 4e8b541e38                     mov        r10, qword ptr [rsi + r11 + 0x38]
01ec0 4c89543e38                     mov        qword ptr [rsi + rdi + 0x38], r10
01ec5 4e8b541e40                     mov        r10, qword ptr [rsi + r11 + 0x40]
01eca 4c89543e40                     mov        qword ptr [rsi + rdi + 0x40], r10
01ecf 83c240                         add        edx, 0x40
01ed2 3bd3                           cmp        edx, ebx
01ed4 7c8a                           jl         0x7ff77bbe0160
01ed6 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01edd 0f8dcdedffff                   jge        0x7ff77bbdefb0
01ee3 4c63d2                         movsxd     r10, edx
01ee6 4d03d1                         add        r10, r9
01ee9 4c3bd1                         cmp        r10, rcx
01eec 0f838e0c0000                   jae        0x7ff77bbe0e80
01ef2 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
01ef9 0f83950c0000                   jae        0x7ff77bbe0e94
01eff 90                             nop        
01f00 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f05 4403da                         add        r11d, edx
01f08 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01f10 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01f15 448bc2                         mov        r8d, edx
01f18 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01f20 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01f25 83c208                         add        edx, 8
01f28 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01f2f 7ccf                           jl         0x7ff77bbe0200
01f31 e97aedffff                     jmp        0x7ff77bbdefb0
01f36 bee4ffffff                     mov        esi, 0xffffffe4
01f3b 488b2c24                       mov        rbp, qword ptr [rsp]
01f3f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f44 4489542408                     mov        dword ptr [rsp + 8], r10d
01f49 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f4e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f53 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f58 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f5d 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01f62 89442434                       mov        dword ptr [rsp + 0x34], eax
01f66 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01f6b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f70 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f75 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f7a 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01f82 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f87 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f8c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f91 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01f98 c5f877                         vzeroupper 
01f9b e8c0d7aeff                     call       0x7ff77b6cda60
01fa0 0f1f84009820001b               nop        dword ptr [rax + rax + 0x1b002098]
01fa8 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
01fb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb6 e825f91718                     call       0x7ff793d5fbe0
01fbb f4                             hlt        
01fbc be6effffff                     mov        esi, 0xffffff6e
01fc1 488b2c24                       mov        rbp, qword ptr [rsp]
01fc5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01fca 4489542408                     mov        dword ptr [rsp + 8], r10d
01fcf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fd4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fd9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fde 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01fe3 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01fe8 89442434                       mov        dword ptr [rsp + 0x34], eax
01fec 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01ff1 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01ff6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ffb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02000 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02005 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0200a 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0200f 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
02013 90                             nop        
02014 c5f877                         vzeroupper 
02017 e844d7aeff                     call       0x7ff77b6cda60
0201c 0f1f84001421001c               nop        dword ptr [rax + rax + 0x1c002114]
02024 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0202e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02032 e8a9f81718                     call       0x7ff793d5fbe0
02037 f4                             hlt        
02038 be45ffffff                     mov        esi, 0xffffff45
0203d 488b2c24                       mov        rbp, qword ptr [rsp]
02041 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02046 4489542408                     mov        dword ptr [rsp + 8], r10d
0204b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02050 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02055 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0205a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0205f 4489742430                     mov        dword ptr [rsp + 0x30], r14d
02064 89442434                       mov        dword ptr [rsp + 0x34], eax
02068 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0206d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02072 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02077 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0207c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02081 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02086 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0208a 90                             nop        
0208b 90                             nop        
0208c c5f877                         vzeroupper 
0208f e8ccd6aeff                     call       0x7ff77b6cda60
02094 0f1f84008c21001d               nop        dword ptr [rax + rax + 0x1d00218c]
0209c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
020a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020aa e831f81718                     call       0x7ff793d5fbe0
020af f4                             hlt        
020b0 be3dffffff                     mov        esi, 0xffffff3d
020b5 488b2c24                       mov        rbp, qword ptr [rsp]
020b9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020be 4489542408                     mov        dword ptr [rsp + 8], r10d
020c3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020cd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020d2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020d7 4489742430                     mov        dword ptr [rsp + 0x30], r14d
020dc 89442434                       mov        dword ptr [rsp + 0x34], eax
020e0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
020e5 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020ea 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020ef 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020f4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020f9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
020fe 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02102 90                             nop        
02103 90                             nop        
02104 c5f877                         vzeroupper 
02107 e854d6aeff                     call       0x7ff77b6cda60
0210c 0f1f84000422001e               nop        dword ptr [rax + rax + 0x1e002204]
02114 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0211e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02122 e8b9f71718                     call       0x7ff793d5fbe0
02127 f4                             hlt        
02128 bee4ffffff                     mov        esi, 0xffffffe4
0212d 488b2c24                       mov        rbp, qword ptr [rsp]
02131 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02136 44895c2408                     mov        dword ptr [rsp + 8], r11d
0213b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02140 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02145 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0214a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0214f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02154 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02159 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0215e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02163 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02168 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0216d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02172 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02177 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0217f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02184 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0218c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02191 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02196 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0219b 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
021a3 90                             nop        
021a4 c5f877                         vzeroupper 
021a7 e8b4d5aeff                     call       0x7ff77b6cda60
021ac 0f1f8400a422001f               nop        dword ptr [rax + rax + 0x1f0022a4]
021b4 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
021be 4883e4f0                       and        rsp, 0xfffffffffffffff0
021c2 e819f71718                     call       0x7ff793d5fbe0
021c7 f4                             hlt        
021c8 bee4ffffff                     mov        esi, 0xffffffe4
021cd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021d2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
021d7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
021dc 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
021e1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
021e6 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
021eb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021f0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021f5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
021fd 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02202 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0220a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0220f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02214 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02219 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0221e 90                             nop        
0221f 90                             nop        
02220 c5f877                         vzeroupper 
02223 e838d5aeff                     call       0x7ff77b6cda60
02228 0f1f840020230020               nop        dword ptr [rax + rax + 0x20002320]
02230 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0223a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0223e e89df61718                     call       0x7ff793d5fbe0
02243 f4                             hlt        
02244 418d6d01                       lea        ebp, [r13 + 1]
02248 bee4ffffff                     mov        esi, 0xffffffe4
0224d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02252 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02257 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0225c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02261 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02266 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0226b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02270 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02275 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0227d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02282 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0228a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0228f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02294 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02299 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0229e 90                             nop        
0229f 90                             nop        
022a0 c5f877                         vzeroupper 
022a3 e8b8d4aeff                     call       0x7ff77b6cda60
022a8 0f1f8400a0230021               nop        dword ptr [rax + rax + 0x210023a0]
022b0 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
022ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
022be e81df61718                     call       0x7ff793d5fbe0
022c3 f4                             hlt        
022c4 bee4ffffff                     mov        esi, 0xffffffe4
022c9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022ce 4489542414                     mov        dword ptr [rsp + 0x14], r10d
022d3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
022d8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
022dd 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
022e2 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022e7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022ec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022f1 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
022f9 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022fe 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02303 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02308 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0230d 90                             nop        
0230e 90                             nop        
0230f 90                             nop        
02310 c5f877                         vzeroupper 
02313 e848d4aeff                     call       0x7ff77b6cda60
02318 0f1f840010240022               nop        dword ptr [rax + rax + 0x22002410]
02320 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0232a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0232e e8adf51718                     call       0x7ff793d5fbe0
02333 f4                             hlt        
02334 bee4ffffff                     mov        esi, 0xffffffe4
02339 488b2c24                       mov        rbp, qword ptr [rsp]
0233d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02342 4489542408                     mov        dword ptr [rsp + 8], r10d
02347 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0234c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02351 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02356 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0235b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02360 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02365 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0236a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0236f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02374 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02379 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0237e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02383 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02388 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0238d 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02392 90                             nop        
02393 90                             nop        
02394 c5f877                         vzeroupper 
02397 e8c4d3aeff                     call       0x7ff77b6cda60
0239c 0f1f840094240023               nop        dword ptr [rax + rax + 0x23002494]
023a4 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
023ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
023b2 e829f51718                     call       0x7ff793d5fbe0
023b7 f4                             hlt        
023b8 beccffffff                     mov        esi, 0xffffffcc
023bd 488b2c24                       mov        rbp, qword ptr [rsp]
023c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
023cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023da 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023df 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
023e4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
023e9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023ee 4489542434                     mov        dword ptr [rsp + 0x34], r10d
023f3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023f8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023fd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02402 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02407 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0240f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02414 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0241c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02421 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02426 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0242b 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02430 c5f877                         vzeroupper 
02433 e828d3aeff                     call       0x7ff77b6cda60
02438 0f1f840030250024               nop        dword ptr [rax + rax + 0x24002530]
02440 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0244a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0244e e88df41718                     call       0x7ff793d5fbe0
02453 f4                             hlt        
02454 be45ffffff                     mov        esi, 0xffffff45
02459 488b2c24                       mov        rbp, qword ptr [rsp]
0245d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02462 4489542408                     mov        dword ptr [rsp + 8], r10d
02467 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0246c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02471 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02476 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0247b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02480 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02485 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0248a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0248f 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
02494 c5f877                         vzeroupper 
02497 e8c4d2aeff                     call       0x7ff77b6cda60
0249c 0f1f840094250025               nop        dword ptr [rax + rax + 0x25002594]
024a4 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
024ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
024b2 e829f41718                     call       0x7ff793d5fbe0
024b7 f4                             hlt        
024b8 be85ffffff                     mov        esi, 0xffffff85
024bd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024c2 44891424                       mov        dword ptr [rsp], r10d
024c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024cb 44895c2404                     mov        dword ptr [rsp + 4], r11d
024d0 4489742408                     mov        dword ptr [rsp + 8], r14d
024d5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
024da 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024df 895c2434                       mov        dword ptr [rsp + 0x34], ebx
024e3 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
024e8 c5f877                         vzeroupper 
024eb e870d2aeff                     call       0x7ff77b6cda60
024f0 0f1f8400e8250026               nop        dword ptr [rax + rax + 0x260025e8]
024f8 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02502 4883e4f0                       and        rsp, 0xfffffffffffffff0
02506 e8d5f31718                     call       0x7ff793d5fbe0
0250b f4                             hlt        
0250c 4533d2                         xor        r10d, r10d
0250f 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02514 eb0d                           jmp        0x7ff77bbe0823
02516 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0251e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02523 be6effffff                     mov        esi, 0xffffff6e
02528 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0252d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02532 4489742430                     mov        dword ptr [rsp + 0x30], r14d
02537 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0253c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02541 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02545 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0254a 90                             nop        
0254b 90                             nop        
0254c c5f877                         vzeroupper 
0254f e80cd2aeff                     call       0x7ff77b6cda60
02554 0f1f84004c260027               nop        dword ptr [rax + rax + 0x2700264c]
0255c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02566 4883e4f0                       and        rsp, 0xfffffffffffffff0
0256a e871f31718                     call       0x7ff793d5fbe0
0256f f4                             hlt        
02570 beccffffff                     mov        esi, 0xffffffcc
02575 488b2c24                       mov        rbp, qword ptr [rsp]
02579 89442410                       mov        dword ptr [rsp + 0x10], eax
0257d 4489742414                     mov        dword ptr [rsp + 0x14], r14d
02582 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02587 90                             nop        
02588 c5f877                         vzeroupper 
0258b e8d0d1aeff                     call       0x7ff77b6cda60
02590 0f1f840088260028               nop        dword ptr [rax + rax + 0x28002688]
02598 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
025a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
025a6 e835f31718                     call       0x7ff793d5fbe0
025ab f4                             hlt        
025ac bee4ffffff                     mov        esi, 0xffffffe4
025b1 488b2c24                       mov        rbp, qword ptr [rsp]
025b5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025ba 4489542408                     mov        dword ptr [rsp + 8], r10d
025bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025c9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025ce 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025d3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
025d8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
025dd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025e2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025e7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025ec 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025f1 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
025f9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025fe 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02603 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02608 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0260c 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02611 89442474                       mov        dword ptr [rsp + 0x74], eax
02615 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0261c c5f877                         vzeroupper 
0261f e83cd1aeff                     call       0x7ff77b6cda60
02624 0f1f84001c270029               nop        dword ptr [rax + rax + 0x2900271c]
0262c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02636 4883e4f0                       and        rsp, 0xfffffffffffffff0
0263a e8a1f21718                     call       0x7ff793d5fbe0
0263f f4                             hlt        
02640 c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
02649 bee4ffffff                     mov        esi, 0xffffffe4
0264e 488b2c24                       mov        rbp, qword ptr [rsp]
02652 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02657 4489542408                     mov        dword ptr [rsp + 8], r10d
0265c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02661 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02666 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0266b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02670 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02675 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0267a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0267f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02684 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02689 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0268e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02696 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0269b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026a0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
026a5 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
026a9 4489442474                     mov        dword ptr [rsp + 0x74], r8d
026ae 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
026b6 90                             nop        
026b7 90                             nop        
026b8 c5f877                         vzeroupper 
026bb e8a0d0aeff                     call       0x7ff77b6cda60
026c0 0f1f8400b827002a               nop        dword ptr [rax + rax + 0x2a0027b8]
026c8 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
026d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
026d6 e805f21718                     call       0x7ff793d5fbe0
026db f4                             hlt        
026dc beccffffff                     mov        esi, 0xffffffcc
026e1 488b2c24                       mov        rbp, qword ptr [rsp]
026e5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
026ea 44895c2408                     mov        dword ptr [rsp + 8], r11d
026ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026f4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026f9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
026fe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02703 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02708 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0270d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02712 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02717 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0271c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02721 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02729 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0272e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02736 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0273b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02740 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02745 89442478                       mov        dword ptr [rsp + 0x78], eax
02749 448974247c                     mov        dword ptr [rsp + 0x7c], r14d
0274e 90                             nop        
0274f 90                             nop        
02750 c5f877                         vzeroupper 
02753 e808d0aeff                     call       0x7ff77b6cda60
02758 0f1f84005028002b               nop        dword ptr [rax + rax + 0x2b002850]
02760 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0276a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0276e e86df11718                     call       0x7ff793d5fbe0
02773 f4                             hlt        
02774 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
02778 83c510                         add        ebp, 0x10
0277b be6effffff                     mov        esi, 0xffffff6e
02780 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02785 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0278a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0278f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02794 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02799 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0279e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
027a3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
027a8 895c2478                       mov        dword ptr [rsp + 0x78], ebx
027ac c5f877                         vzeroupper 
027af e8accfaeff                     call       0x7ff77b6cda60
027b4 0f1f8400ac28002c               nop        dword ptr [rax + rax + 0x2c0028ac]
027bc 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
027c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ca e811f11718                     call       0x7ff793d5fbe0
027cf f4                             hlt        
027d0 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
027d4 83c510                         add        ebp, 0x10
027d7 be66ffffff                     mov        esi, 0xffffff66
027dc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027e1 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
027e6 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
027eb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027f0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
027f5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027fa 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027ff 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02804 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02808 c5f877                         vzeroupper 
0280b e850cfaeff                     call       0x7ff77b6cda60
02810 0f1f84000829002d               nop        dword ptr [rax + rax + 0x2d002908]
02818 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02822 4883e4f0                       and        rsp, 0xfffffffffffffff0
02826 e8b5f01718                     call       0x7ff793d5fbe0
0282b f4                             hlt        
0282c 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283a e8a1f01718                     call       0x7ff793d5fbe0
0283f f4                             hlt        
02840 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
0284a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0284e e88df01718                     call       0x7ff793d5fbe0
02853 f4                             hlt        
02854 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
0285e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02862 e879f01718                     call       0x7ff793d5fbe0
02867 f4                             hlt        
02868 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02872 4883e4f0                       and        rsp, 0xfffffffffffffff0
02876 e865f01718                     call       0x7ff793d5fbe0
0287b f4                             hlt        
0287c bee4ffffff                     mov        esi, 0xffffffe4
02881 488b2c24                       mov        rbp, qword ptr [rsp]
02885 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0288a 4489542408                     mov        dword ptr [rsp + 8], r10d
0288f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02894 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02899 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0289e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
028a3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
028a8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
028ad 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
028b2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
028b7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
028bc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028c1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
028c6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
028cb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
028d3 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
028d8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
028dd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
028e2 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
028ea 90                             nop        
028eb 90                             nop        
028ec c5f877                         vzeroupper 
028ef e86cceaeff                     call       0x7ff77b6cda60
028f4 0f1f8400ec29002e               nop        dword ptr [rax + rax + 0x2e0029ec]
028fc 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0290a e8d1ef1718                     call       0x7ff793d5fbe0
0290f f4                             hlt        
02910 bee4ffffff                     mov        esi, 0xffffffe4
02915 488b2c24                       mov        rbp, qword ptr [rsp]
02919 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0291e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02923 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02928 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0292d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02932 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02937 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0293c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02941 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02946 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0294b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02950 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02955 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0295a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0295f 90                             nop        
02960 c5f877                         vzeroupper 
02963 e8f8cdaeff                     call       0x7ff77b6cda60
02968 0f1f8400602a002f               nop        dword ptr [rax + rax + 0x2f002a60]
02970 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
0297a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0297e e85def1718                     call       0x7ff793d5fbe0
02983 f4                             hlt        
02984 be6effffff                     mov        esi, 0xffffff6e
02989 488b2c24                       mov        rbp, qword ptr [rsp]
0298d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02992 44895c2408                     mov        dword ptr [rsp + 8], r11d
02997 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0299c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029a1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
029a6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
029ab 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
029b0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
029b5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
029ba 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029bf 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
029c7 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
029cc c5f877                         vzeroupper 
029cf e88ccdaeff                     call       0x7ff77b6cda60
029d4 0f1f8400cc2a0030               nop        dword ptr [rax + rax + 0x30002acc]
029dc 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
029e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029ea e8f1ee1718                     call       0x7ff793d5fbe0
029ef f4                             hlt        
029f0 be66ffffff                     mov        esi, 0xffffff66
029f5 488b2c24                       mov        rbp, qword ptr [rsp]
029f9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
029fe 44895c2408                     mov        dword ptr [rsp + 8], r11d
02a03 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a0d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a12 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02a17 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02a1c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02a21 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02a26 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a2b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
02a33 458bda                         mov        r11d, r10d
02a36 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02a3b 90                             nop        
02a3c c5f877                         vzeroupper 
02a3f e81ccdaeff                     call       0x7ff77b6cda60
02a44 0f1f84003c2b0031               nop        dword ptr [rax + rax + 0x31002b3c]
02a4c 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02a56 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a5a e881ee1718                     call       0x7ff793d5fbe0
02a5f f4                             hlt        
02a60 418bf0                         mov        esi, r8d
02a63 e970ebffff                     jmp        0x7ff77bbdf8d8
02a68 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02a72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a76 e865ee1718                     call       0x7ff793d5fbe0
02a7b f4                             hlt        
02a7c 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02a86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a8a e851ee1718                     call       0x7ff793d5fbe0
02a8f f4                             hlt        
02a90 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a9e e83dee1718                     call       0x7ff793d5fbe0
02aa3 f4                             hlt        
02aa4 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ab2 e829ee1718                     call       0x7ff793d5fbe0
02ab7 f4                             hlt        
02ab8 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ac6 e815ee1718                     call       0x7ff793d5fbe0
02acb f4                             hlt        
02acc 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ada e801ee1718                     call       0x7ff793d5fbe0
02adf f4                             hlt        
02ae0 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aee e8eded1718                     call       0x7ff793d5fbe0
02af3 f4                             hlt        
02af4 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02afe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b02 e8d9ed1718                     call       0x7ff793d5fbe0
02b07 f4                             hlt        
02b08 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b16 e8c5ed1718                     call       0x7ff793d5fbe0
02b1b f4                             hlt        
02b1c 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b2a e8b1ed1718                     call       0x7ff793d5fbe0
02b2f f4                             hlt        
02b30 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3e e89ded1718                     call       0x7ff793d5fbe0
02b43 f4                             hlt        
02b44 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b52 e889ed1718                     call       0x7ff793d5fbe0
02b57 f4                             hlt        
02b58 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b66 e875ed1718                     call       0x7ff793d5fbe0
02b6b f4                             hlt        
02b6c 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b76 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b7a e861ed1718                     call       0x7ff793d5fbe0
02b7f f4                             hlt        
02b80 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8e e84ded1718                     call       0x7ff793d5fbe0
02b93 f4                             hlt        
02b94 48bf709b5e54f77f0000           movabs     rdi, 0x7ff7545e9b70
02b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ba2 e839ed1718                     call       0x7ff793d5fbe0
02ba7 f4                             hlt        
02ba8 488bf0                         mov        rsi, rax
02bab eb0d                           jmp        0x7ff77bbe0eba
02bad 488bf0                         mov        rsi, rax
02bb0 eb08                           jmp        0x7ff77bbe0eba
02bb2 488bf0                         mov        rsi, rax
02bb5 eb03                           jmp        0x7ff77bbe0eba
02bb7 488bf0                         mov        rsi, rax
02bba c5f877                         vzeroupper 
02bbd 4881c400010000                 add        rsp, 0x100
02bc4 5d                             pop        rbp
02bc5 e9166aaeff                     jmp        0x7ff77b6c78e0
02bca bef6ffffff                     mov        esi, 0xfffffff6
02bcf 90                             nop        
02bd0 c5f877                         vzeroupper 
02bd3 e888cbaeff                     call       0x7ff77b6cda60
02bd8 0f1f8400d02c0032               nop        dword ptr [rax + rax + 0x32002cd0]
02be0 48bfa0388854f77f0000           movabs     rdi, 0x7ff7548838a0
02bea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bee e8edec1718                     call       0x7ff793d5fbe0
02bf3 f4                             hlt        
02bf4 49badcf1bd7bf77f0000           movabs     r10, 0x7ff77bbdf1dc
02bfe 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02c05 e95614b5ff                     jmp        0x7ff77b732360
02c0a e8d1e2b3ff                     call       0x7ff77b71f1e0
02c0f e91ad4ffff                     jmp        0x7ff77bbde32e
02c14 f4                             hlt        
02c15 f4                             hlt        
02c16 f4                             hlt        
02c17 f4                             hlt        
