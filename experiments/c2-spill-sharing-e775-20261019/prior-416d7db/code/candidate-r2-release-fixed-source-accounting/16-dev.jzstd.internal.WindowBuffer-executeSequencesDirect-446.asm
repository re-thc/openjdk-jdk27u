00000 e87b17ca18                     call       0x7f4c34b29880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85d0450000                   jne        0x7f4c1be8c6fe
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bae38010000                 mov        r13, qword ptr [rsi + 0x138]
0003c 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
00040 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00045 4c8bb628010000                 mov        r14, qword ptr [rsi + 0x128]
0004c 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00053 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00058 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0005f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00066 4c89542408                     mov        qword ptr [rsp + 8], r10
0006b 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00072 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00077 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0007e 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00083 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
0008a 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00092 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
00099 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0009e 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
000b6 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000bd 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000c2 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000c9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000ce 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d2 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000d7 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000db 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000e0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000e7 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
000ec 488bfe                         mov        rdi, rsi
000ef c5f877                         vzeroupper 
000f2 49ba4088c0344c7f0000           movabs     r10, 0x7f4c34c08840
000fc 41ffd2                         call       r10
000ff 0f1f840000000000               nop        dword ptr [rax + rax]
00107 4885db                         test       rbx, rbx
0010a 0f845c230000                   je         0x7f4c1be8a56c
00110 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00114 41c1eb0a                       shr        r11d, 0xa
00118 4181fb0c080000                 cmp        r11d, 0x80c
0011f 0f8513350000                   jne        0x7f4c1be8b738
00125 4c8bd3                         mov        r10, rbx
00128 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0012d 4d85ed                         test       r13, r13
00130 0f8443230000                   je         0x7f4c1be8a579
00136 458b5504                       mov        r10d, dword ptr [r13 + 4]
0013a 41c1ea0a                       shr        r10d, 0xa
0013e 4181fa05020000                 cmp        r10d, 0x205
00145 0f85ed340000                   jne        0x7f4c1be8b738
0014b 4d8bd5                         mov        r10, r13
0014e 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00156 4d85f6                         test       r14, r14
00159 0f842a230000                   je         0x7f4c1be8a589
0015f 458b5e04                       mov        r11d, dword ptr [r14 + 4]
00163 41c1eb0a                       shr        r11d, 0xa
00167 4181fb08020000                 cmp        r11d, 0x208
0016e 0f85c4340000                   jne        0x7f4c1be8b738
00174 4d8bd6                         mov        r10, r14
00177 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0017f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00184 4d85d2                         test       r10, r10
00187 0f840c230000                   je         0x7f4c1be8a599
0018d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00191 41c1ea0a                       shr        r10d, 0xa
00195 4181fa07020000                 cmp        r10d, 0x207
0019c 0f8596340000                   jne        0x7f4c1be8b738
001a2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ac 4885ed                         test       rbp, rbp
001af 0f84f1220000                   je         0x7f4c1be8a5a6
001b5 448b5d04                       mov        r11d, dword ptr [rbp + 4]
001b9 41c1eb0a                       shr        r11d, 0xa
001bd 4181fb07020000                 cmp        r11d, 0x207
001c4 0f856e340000                   jne        0x7f4c1be8b738
001ca 4c8bd5                         mov        r10, rbp
001cd 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001d5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001da 4d85d2                         test       r10, r10
001dd 0f84d3220000                   je         0x7f4c1be8a5b6
001e3 458b5204                       mov        r10d, dword ptr [r10 + 4]
001e7 41c1ea0a                       shr        r10d, 0xa
001eb 4181fa05020000                 cmp        r10d, 0x205
001f2 0f8540340000                   jne        0x7f4c1be8b738
001f8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001fd 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00205 e9cc040000                     jmp        0x7f4c1be887d6
0020a 448bd5                         mov        r10d, ebp
0020d 4d63d2                         movsxd     r10, r10d
00210 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00217 c442a8f5db                     bzhi       r11, r11, r10
0021c c4c1fb92fb                     kmovq      k7, r11
00221 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00227 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0022d 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00235 4403d5                         add        r10d, ebp
00238 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00240 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00244 418502                         test       dword ptr [r10], eax
00247 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0024f 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00257 0f8d08080000                   jge        0x7f4c1be88b65
0025d 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
00261 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00266 442b9424a8000000               sub        r10d, dword ptr [rsp + 0xa8]
0026e 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
00275 2bac24a8000000                 sub        ebp, dword ptr [rsp + 0xa8]
0027c 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00283 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
0028a 0f4feb                         cmovg      ebp, ebx
0028d 458bda                         mov        r11d, r10d
00290 4585d2                         test       r10d, r10d
00293 0f8c4b2d0000                   jl         0x7f4c1be8b0e4
00299 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
0029d 85db                           test       ebx, ebx
0029f 0f8c3f2d0000                   jl         0x7f4c1be8b0e4
002a5 458d042a                       lea        r8d, [r10 + rbp]
002a9 453be8                         cmp        r13d, r8d
002ac 0f82322d0000                   jb         0x7f4c1be8b0e4
002b2 03dd                           add        ebx, ebp
002b4 443beb                         cmp        r13d, ebx
002b7 0f82272d0000                   jb         0x7f4c1be8b0e4
002bd 85ed                           test       ebp, ebp
002bf 0f8c1f2d0000                   jl         0x7f4c1be8b0e4
002c5 85ed                           test       ebp, ebp
002c7 0f8460ffffff                   je         0x7f4c1be8832d
002cd 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002d2 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
002da 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
002df 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
002e4 4863d5                         movsxd     rdx, ebp
002e7 4883fa20                       cmp        rdx, 0x20
002eb 0f8619ffffff                   jbe        0x7f4c1be8830a
002f1 c5f877                         vzeroupper 
002f4 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
002fe 41ffd2                         call       r10
00301 0f1f840000000000               nop        dword ptr [rax + rax]
00309 e91fffffff                     jmp        0x7f4c1be8832d
0030e 48894424f8                     mov        qword ptr [rsp - 8], rax
00313 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00317 89442448                       mov        dword ptr [rsp + 0x48], eax
0031b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00320 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
00327 85c9                           test       ecx, ecx
00329 0f8e61180000                   jle        0x7f4c1be89c90
0032f 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00337 4503dd                         add        r11d, r13d
0033a 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0033f 0f8fbf190000                   jg         0x7f4c1be89e04
00345 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0034a 4503de                         add        r11d, r14d
0034d 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00355 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0035a 0f8f4c1a0000                   jg         0x7f4c1be89eac
00360 4183fe10                       cmp        r14d, 0x10
00364 0f8fa1070000                   jg         0x7f4c1be88c0b
0036a 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
00372 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00376 458d53f1                       lea        r10d, [r11 - 0xf]
0037a 4585d2                         test       r10d, r10d
0037d 0f8cfd120000                   jl         0x7f4c1be89780
00383 4183c3f1                       add        r11d, -0xf
00387 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
0038b 413bdb                         cmp        ebx, r11d
0038e 0f8300110000                   jae        0x7f4c1be89594
00394 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
0039c 448b5b08                       mov        r11d, dword ptr [rbx + 8]
003a0 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
003a4 4c8bac2480000000               mov        r13, qword ptr [rsp + 0x80]
003ac c4c17a6f441d0c                 vmovdqu    xmm0, xmmword ptr [r13 + rbx + 0xc]
003b3 458d53f1                       lea        r10d, [r11 - 0xf]
003b7 4585d2                         test       r10d, r10d
003ba 0f8c9c130000                   jl         0x7f4c1be8985c
003c0 4183c3f1                       add        r11d, -0xf
003c4 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
003cc 453beb                         cmp        r13d, r11d
003cf 0f839b110000                   jae        0x7f4c1be89670
003d5 458d2c1e                       lea        r13d, [r14 + rbx]
003d9 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
003e1 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
003e8 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
003f0 c4c17a7f441d0c                 vmovdqu    xmmword ptr [r13 + rbx + 0xc], xmm0
003f7 4403f3                         add        r14d, ebx
003fa 418bde                         mov        ebx, r14d
003fd 2b9c24a8000000                 sub        ebx, dword ptr [rsp + 0xa8]
00404 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
0040c 458b6808                       mov        r13d, dword ptr [r8 + 8]
00410 458d55f1                       lea        r10d, [r13 - 0xf]
00414 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0041c 4183fb10                       cmp        r11d, 0x10
00420 7f44                           jg         0x7f4c1be88566
00422 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
0042a 4183f910                       cmp        r9d, 0x10
0042e 7c36                           jl         0x7f4c1be88566
00430 4585d2                         test       r10d, r10d
00433 0f8c9b160000                   jl         0x7f4c1be89bd4
00439 4183c5f1                       add        r13d, -0xf
0043d 413bdd                         cmp        ebx, r13d
00440 0f83fe140000                   jae        0x7f4c1be89a44
00446 c4c17a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xc]
0044d 453bf5                         cmp        r14d, r13d
00450 0f83aa150000                   jae        0x7f4c1be89b00
00456 c4817a7f44300c                 vmovdqu    xmmword ptr [r8 + r14 + 0xc], xmm0
0045d 438d1c33                       lea        ebx, [r11 + r14]
00461 e940020000                     jmp        0x7f4c1be887a6
00466 458d5df9                       lea        r11d, [r13 - 7]
0046a 498d7c180c                     lea        rdi, [r8 + rbx + 0xc]
0046f 8b8c248c000000                 mov        ecx, dword ptr [rsp + 0x8c]
00476 4103ce                         add        ecx, r14d
00479 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00480 4b8d74300c                     lea        rsi, [r8 + r14 + 0xc]
00485 4863d1                         movsxd     rdx, ecx
00488 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
0048f 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
00496 0f8c73040000                   jl         0x7f4c1be88a0f
0049c 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
004a4 4183f930                       cmp        r9d, 0x30
004a8 0f8e85000000                   jle        0x7f4c1be88633
004ae 85db                           test       ebx, ebx
004b0 0f8c10200000                   jl         0x7f4c1be8a5c6
004b6 4585f6                         test       r14d, r14d
004b9 0f8c07200000                   jl         0x7f4c1be8a5c6
004bf 458d1c19                       lea        r11d, [r9 + rbx]
004c3 453beb                         cmp        r13d, r11d
004c6 0f82fa1f0000                   jb         0x7f4c1be8a5c6
004cc 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
004d4 0f82ec1f0000                   jb         0x7f4c1be8a5c6
004da 418bd9                         mov        ebx, r9d
004dd 85db                           test       ebx, ebx
004df 0f84b6010000                   je         0x7f4c1be8879b
004e5 4863d3                         movsxd     rdx, ebx
004e8 4883fa20                       cmp        rdx, 0x20
004ec 7728                           ja         0x7f4c1be88616
004ee 448bd3                         mov        r10d, ebx
004f1 4d63d2                         movsxd     r10, r10d
004f4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004fb c442a8f5db                     bzhi       r11, r11, r10
00500 c4c1fb92fb                     kmovq      k7, r11
00505 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0050b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00511 e985010000                     jmp        0x7f4c1be8879b
00516 c5f877                         vzeroupper 
00519 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00523 41ffd2                         call       r10
00526 0f1f840000000000               nop        dword ptr [rax + rax]
0052e e968010000                     jmp        0x7f4c1be8879b
00533 4585db                         test       r11d, r11d
00536 0f8c701c0000                   jl         0x7f4c1be8a2ac
0053c 458d55f9                       lea        r10d, [r13 - 7]
00540 413bda                         cmp        ebx, r10d
00543 0f83671a0000                   jae        0x7f4c1be8a0b0
00549 4863fb                         movsxd     rdi, ebx
0054c 498b4c380c                     mov        rcx, qword ptr [r8 + rdi + 0xc]
00551 453bf2                         cmp        r14d, r10d
00554 0f83561b0000                   jae        0x7f4c1be8a1b0
0055a 458bce                         mov        r9d, r14d
0055d 458d5908                       lea        r11d, [r9 + 8]
00561 4963f1                         movsxd     rsi, r9d
00564 49894c300c                     mov        qword ptr [r8 + rsi + 0xc], rcx
00569 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00571 0f8d24010000                   jge        0x7f4c1be8879b
00577 482bfe                         sub        rdi, rsi
0057a 4963c5                         movsxd     rax, r13d
0057d 4883c0f9                       add        rax, -7
00581 4963f3                         movsxd     rsi, r11d
00584 488d0c3e                       lea        rcx, [rsi + rdi]
00588 483bc8                         cmp        rcx, rax
0058b 0f831b1d0000                   jae        0x7f4c1be8a3ac
00591 488bca                         mov        rcx, rdx
00594 482bce                         sub        rcx, rsi
00597 4883c107                       add        rcx, 7
0059b 4883e1f8                       and        rcx, 0xfffffffffffffff8
0059f 8bf1                           mov        esi, ecx
005a1 428d4c0e08                     lea        ecx, [rsi + r9 + 8]
005a6 4863c9                         movsxd     rcx, ecx
005a9 488d7c39f8                     lea        rdi, [rcx + rdi - 8]
005ae 483bf8                         cmp        rdi, rax
005b1 0f83f51c0000                   jae        0x7f4c1be8a3ac
005b7 453bda                         cmp        r11d, r10d
005ba 0f83ec1c0000                   jae        0x7f4c1be8a3ac
005c0 4883c1f8                       add        rcx, -8
005c4 483bc8                         cmp        rcx, rax
005c7 0f83df1c0000                   jae        0x7f4c1be8a3ac
005cd 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
005d5 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
005dc 0f8fb21d0000                   jg         0x7f4c1be8a494
005e2 412bd9                         sub        ebx, r9d
005e5 4183c110                       add        r9d, 0x10
005e9 458bd3                         mov        r10d, r11d
005ec 428d0c1b                       lea        ecx, [rbx + r11]
005f0 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
005f8 4d8b440d0c                     mov        r8, qword ptr [r13 + rcx + 0xc]
005fd 4f8944150c                     mov        qword ptr [r13 + r10 + 0xc], r8
00602 4183c308                       add        r11d, 8
00606 453bd9                         cmp        r11d, r9d
00609 7cde                           jl         0x7f4c1be886e9
0060b 4883c2f8                       add        rdx, -8
0060f 4881fa00000080                 cmp        rdx, -0x80000000
00616 49c7c200000080                 mov        r10, 0xffffffff80000000
0061d 490f4cd2                       cmovl      rdx, r10
00621 448bd2                         mov        r10d, edx
00624 453bda                         cmp        r11d, r10d
00627 7d3f                           jge        0x7f4c1be88768
00629 0f1f8000000000                 nop        dword ptr [rax]
00630 458bc3                         mov        r8d, r11d
00633 4963f8                         movsxd     rdi, r8d
00636 458bc3                         mov        r8d, r11d
00639 468d0c1b                       lea        r9d, [rbx + r11]
0063d 418bc9                         mov        ecx, r9d
00640 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
00648 4f8b4c0d0c                     mov        r9, qword ptr [r13 + r9 + 0xc]
0064d 4f894c050c                     mov        qword ptr [r13 + r8 + 0xc], r9
00652 4c63c1                         movsxd     r8, ecx
00655 4f8b440514                     mov        r8, qword ptr [r13 + r8 + 0x14]
0065a 4d89443d14                     mov        qword ptr [r13 + rdi + 0x14], r8
0065f 4183c310                       add        r11d, 0x10
00663 453bda                         cmp        r11d, r10d
00666 7cc8                           jl         0x7f4c1be88730
00668 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00670 7d29                           jge        0x7f4c1be8879b
00672 6690                           nop        
00674 468d141b                       lea        r10d, [rbx + r11]
00678 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
00680 4f8b54150c                     mov        r10, qword ptr [r13 + r10 + 0xc]
00685 458bc3                         mov        r8d, r11d
00688 4f8954050c                     mov        qword ptr [r13 + r8 + 0xc], r10
0068d 4183c308                       add        r11d, 8
00691 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00699 7cd9                           jl         0x7f4c1be88774
0069b 4403b4248c000000               add        r14d, dword ptr [rsp + 0x8c]
006a3 418bde                         mov        ebx, r14d
006a6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006ab 41ffc3                         inc        r11d
006ae 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006b7 418502                         test       dword ptr [r10], eax
006ba 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
006c1 48894424f8                     mov        qword ptr [rsp - 8], rax
006c6 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
006cd 8944247c                       mov        dword ptr [rsp + 0x7c], eax
006d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
006d6 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
006db 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
006e3 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
006e8 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
006ed 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
006f1 3b4c2428                       cmp        ecx, dword ptr [rsp + 0x28]
006f5 0f8d4d060000                   jge        0x7f4c1be88e48
006fb 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
00703 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00706 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0070a 3bd9                           cmp        ebx, ecx
0070c 0f83f70c0000                   jae        0x7f4c1be89509
00712 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
0071a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0071f 4a8b4cdb10                     mov        rcx, qword ptr [rbx + r11*8 + 0x10]
00724 448bf1                         mov        r14d, ecx
00727 4181e6ffff0100                 and        r14d, 0x1ffff
0072e 4c8bd9                         mov        r11, rcx
00731 49c1fb24                       sar        r11, 0x24
00735 48c1e912                       shr        rcx, 0x12
00739 458bdb                         mov        r11d, r11d
0073c 418bd3                         mov        edx, r11d
0073f 8bd9                           mov        ebx, ecx
00741 81e3ffff0300                   and        ebx, 0x3ffff
00747 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
0074e 4585db                         test       r11d, r11d
00751 0f8c55140000                   jl         0x7f4c1be89cac
00757 4585f6                         test       r14d, r14d
0075a 0f85c7000000                   jne        0x7f4c1be88927
00760 4533f6                         xor        r14d, r14d
00763 4183fb03                       cmp        r11d, 3
00767 0f8edf000000                   jle        0x7f4c1be8894c
0076d 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00775 448b5308                       mov        r10d, dword ptr [rbx + 8]
00779 4183c3fd                       add        r11d, -3
0077d 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00785 4183fa02                       cmp        r10d, 2
00789 0f86dd100000                   jbe        0x7f4c1be8996c
0078f 448b5b10                       mov        r11d, dword ptr [rbx + 0x10]
00793 44895b14                       mov        dword ptr [rbx + 0x14], r11d
00797 448b530c                       mov        r10d, dword ptr [rbx + 0xc]
0079b 44895310                       mov        dword ptr [rbx + 0x10], r10d
0079f 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
007a7 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
007ae 41895d0c                       mov        dword ptr [r13 + 0xc], ebx
007b2 4c639424a8000000               movsxd     r10, dword ptr [rsp + 0xa8]
007ba 4c891424                       mov        qword ptr [rsp], r10
007be 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
007c6 4c03542450                     add        r10, qword ptr [rsp + 0x50]
007cb 4963d6                         movsxd     rdx, r14d
007ce 4c03d2                         add        r10, rdx
007d1 488b0c24                       mov        rcx, qword ptr [rsp]
007d5 493bca                         cmp        rcx, r10
007d8 0f8f62140000                   jg         0x7f4c1be89d40
007de 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
007e6 4503ee                         add        r13d, r14d
007e9 418bdd                         mov        ebx, r13d
007ec 2b9c24a8000000                 sub        ebx, dword ptr [rsp + 0xa8]
007f3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
007f8 4585db                         test       r11d, r11d
007fb 0f850dfbffff                   jne        0x7f4c1be8840e
00801 4c63db                         movsxd     r11, ebx
00804 4c3b5c2458                     cmp        r11, qword ptr [rsp + 0x58]
00809 0f8c51160000                   jl         0x7f4c1be89f60
0080f 483b4c2460                     cmp        rcx, qword ptr [rsp + 0x60]
00814 0f8fee160000                   jg         0x7f4c1be8a008
0081a 4533db                         xor        r11d, r11d
0081d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00822 e9f9faffff                     jmp        0x7f4c1be88420
00827 453bf2                         cmp        r14d, r10d
0082a 0f8e33ffffff                   jle        0x7f4c1be88863
00830 be45ffffff                     mov        esi, 0xffffff45
00835 418bee                         mov        ebp, r14d
00838 44891424                       mov        dword ptr [rsp], r10d
0083c c5f877                         vzeroupper 
0083f e81cf4b4ff                     call       0x7f4c1b9d7d60
00844 0f1f84003c090002               nop        dword ptr [rax + rax + 0x200093c]
0084c 4585f6                         test       r14d, r14d
0084f 7407                           je         0x7f4c1be88958
00851 458d53ff                       lea        r10d, [r11 - 1]
00855 418bd2                         mov        edx, r10d
00858 85d2                           test       edx, edx
0085a 751d                           jne        0x7f4c1be88979
0085c 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00864 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00868 4585db                         test       r11d, r11d
0086b 0f86f71f0000                   jbe        0x7f4c1be8a968
00871 8b5b0c                         mov        ebx, dword ptr [rbx + 0xc]
00874 e98a000000                     jmp        0x7f4c1be88a03
00879 83fa03                         cmp        edx, 3
0087c 0f8416290000                   je         0x7f4c1be8b298
00882 83fa02                         cmp        edx, 2
00885 0f87d9290000                   ja         0x7f4c1be8b364
0088b 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00893 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00897 413bd3                         cmp        edx, r11d
0089a 0f83101e0000                   jae        0x7f4c1be8a7b0
008a0 8b5c930c                       mov        ebx, dword ptr [rbx + rdx*4 + 0xc]
008a4 85d2                           test       edx, edx
008a6 7e46                           jle        0x7f4c1be889ee
008a8 4585db                         test       r11d, r11d
008ab 0f8607280000                   jbe        0x7f4c1be8b1b8
008b1 448d52ff                       lea        r10d, [rdx - 1]
008b5 453bd3                         cmp        r10d, r11d
008b8 0f83fa270000                   jae        0x7f4c1be8b1b8
008be 4183fb01                       cmp        r11d, 1
008c2 0f86f0270000                   jbe        0x7f4c1be8b1b8
008c8 0f1f840000000000               nop        dword ptr [rax + rax]
008d0 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
008d8 458b549508                     mov        r10d, dword ptr [r13 + rdx*4 + 8]
008dd 458954950c                     mov        dword ptr [r13 + rdx*4 + 0xc], r10d
008e2 448d52ff                       lea        r10d, [rdx - 1]
008e6 418bd2                         mov        edx, r10d
008e9 4585d2                         test       r10d, r10d
008ec 7fe2                           jg         0x7f4c1be889d0
008ee 4585db                         test       r11d, r11d
008f1 0f86a51e0000                   jbe        0x7f4c1be8a89c
008f7 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
008ff 41895d0c                       mov        dword ptr [r13 + 0xc], ebx
00903 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
0090a e9a3feffff                     jmp        0x7f4c1be888b2
0090f 83f910                         cmp        ecx, 0x10
00912 0f8d6f080000                   jge        0x7f4c1be89287
00918 83f908                         cmp        ecx, 8
0091b 0f8d26050000                   jge        0x7f4c1be88f47
00921 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00929 4183fa10                       cmp        r10d, 0x10
0092d 0f8f3e010000                   jg         0x7f4c1be88b71
00933 413bdd                         cmp        ebx, r13d
00936 0f83d01f0000                   jae        0x7f4c1be8aa0c
0093c 410fbe6c180c                   movsx      ebp, byte ptr [r8 + rbx + 0xc]
00942 453bf5                         cmp        r14d, r13d
00945 0f83a1200000                   jae        0x7f4c1be8aaec
0094b 43886c300c                     mov        byte ptr [r8 + r14 + 0xc], bpl
00950 458d5601                       lea        r10d, [r14 + 1]
00954 448d4b03                       lea        r9d, [rbx + 3]
00958 453bcd                         cmp        r9d, r13d
0095b 0f833b210000                   jae        0x7f4c1be8ab9c
00961 4c63cb                         movsxd     r9, ebx
00964 430fbe6c080d                   movsx      ebp, byte ptr [r8 + r9 + 0xd]
0096a 418d4e03                       lea        ecx, [r14 + 3]
0096e 413bcd                         cmp        ecx, r13d
00971 0f8301220000                   jae        0x7f4c1be8ac78
00977 4963ce                         movsxd     rcx, r14d
0097a 41886c080d                     mov        byte ptr [r8 + rcx + 0xd], bpl
0097f 470fbe54080e                   movsx      r10d, byte ptr [r8 + r9 + 0xe]
00985 458854080e                     mov        byte ptr [r8 + rcx + 0xe], r10b
0098a 470fbe4c080f                   movsx      r9d, byte ptr [r8 + r9 + 0xf]
00990 45884c080f                     mov        byte ptr [r8 + rcx + 0xf], r9b
00995 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
0099d 4183f908                       cmp        r9d, 8
009a1 0f8385220000                   jae        0x7f4c1be8ad2c
009a7 49b9e0df2fe300000000           movabs     r9, 0xe32fdfe0
009b1 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
009b9 43035c910c                     add        ebx, dword ptr [r9 + r10*4 + 0xc]
009be 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
009c6 4183f904                       cmp        r9d, 4
009ca 7e3b                           jle        0x7f4c1be88b07
009cc 458d4dfd                       lea        r9d, [r13 - 3]
009d0 458d5604                       lea        r10d, [r14 + 4]
009d4 4585c9                         test       r9d, r9d
009d7 0f8cfb240000                   jl         0x7f4c1be8afd8
009dd 418bcd                         mov        ecx, r13d
009e0 83c1fd                         add        ecx, -3
009e3 3bd9                           cmp        ebx, ecx
009e5 0f830d230000                   jae        0x7f4c1be8adf8
009eb 448bcb                         mov        r9d, ebx
009ee 438b6c080c                     mov        ebp, dword ptr [r8 + r9 + 0xc]
009f3 443bd1                         cmp        r10d, ecx
009f6 0f8308240000                   jae        0x7f4c1be8af04
009fc 458bce                         mov        r9d, r14d
009ff 4d63d1                         movsxd     r10, r9d
00a02 43896c1010                     mov        dword ptr [r8 + r10 + 0x10], ebp
00a07 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a0f 4183fa08                       cmp        r10d, 8
00a13 7e50                           jle        0x7f4c1be88b65
00a15 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00a1f 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00a27 478b4c8a0c                     mov        r9d, dword ptr [r10 + r9*4 + 0xc]
00a2c 412bd9                         sub        ebx, r9d
00a2f 458d5608                       lea        r10d, [r14 + 8]
00a33 8d6b08                         lea        ebp, [rbx + 8]
00a36 4585db                         test       r11d, r11d
00a39 0f8c512a0000                   jl         0x7f4c1be8b590
00a3f 4183c5f9                       add        r13d, -7
00a43 413bed                         cmp        ebp, r13d
00a46 0f83e4280000                   jae        0x7f4c1be8b430
00a4c 4c63db                         movsxd     r11, ebx
00a4f 4b8b6c1814                     mov        rbp, qword ptr [r8 + r11 + 0x14]
00a54 453bd5                         cmp        r10d, r13d
00a57 0f838b290000                   jae        0x7f4c1be8b4e8
00a5d 4d63d6                         movsxd     r10, r14d
00a60 4b896c1014                     mov        qword ptr [r8 + r10 + 0x14], rbp
00a65 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00a6c e935fcffff                     jmp        0x7f4c1be887a6
00a71 85db                           test       ebx, ebx
00a73 0f8ccf2a0000                   jl         0x7f4c1be8b648
00a79 4585f6                         test       r14d, r14d
00a7c 0f8cc62a0000                   jl         0x7f4c1be8b648
00a82 453bee                         cmp        r13d, r14d
00a85 0f82bd2a0000                   jb         0x7f4c1be8b648
00a8b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a93 4503d6                         add        r10d, r14d
00a96 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00a9b 453bea                         cmp        r13d, r10d
00a9e 0f82a42a0000                   jb         0x7f4c1be8b648
00aa4 85c9                           test       ecx, ecx
00aa6 0f8c9c2a0000                   jl         0x7f4c1be8b648
00aac 85c9                           test       ecx, ecx
00aae 0f84adf7ffff                   je         0x7f4c1be88361
00ab4 4c8b1424                       mov        r10, qword ptr [rsp]
00ab8 4983fa20                       cmp        r10, 0x20
00abc 772d                           ja         0x7f4c1be88beb
00abe 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00ac6 4d63d2                         movsxd     r10, r10d
00ac9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ad0 c442a8f5db                     bzhi       r11, r11, r10
00ad5 c4c1fb92fb                     kmovq      k7, r11
00ada 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ae0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ae6 e976f7ffff                     jmp        0x7f4c1be88361
00aeb 498bd2                         mov        rdx, r10
00aee c5f877                         vzeroupper 
00af1 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00afb 41ffd2                         call       r10
00afe 0f1f840000000000               nop        dword ptr [rax + rax]
00b06 e956f7ffff                     jmp        0x7f4c1be88361
00b0b 4183fe30                       cmp        r14d, 0x30
00b0f 0f8eb4000000                   jle        0x7f4c1be88cc9
00b15 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00b1d 418b4a08                       mov        ecx, dword ptr [r10 + 8]
00b21 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00b29 418b7208                       mov        esi, dword ptr [r10 + 8]
00b2d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b32 4585d2                         test       r10d, r10d
00b35 0f8c252e0000                   jl         0x7f4c1be8ba60
00b3b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b43 4585db                         test       r11d, r11d
00b46 0f8c142e0000                   jl         0x7f4c1be8ba60
00b4c 3b8c24ac000000                 cmp        ecx, dword ptr [rsp + 0xac]
00b53 0f82072e0000                   jb         0x7f4c1be8ba60
00b59 413bf5                         cmp        esi, r13d
00b5c 0f82fe2d0000                   jb         0x7f4c1be8ba60
00b62 4585f6                         test       r14d, r14d
00b65 7440                           je         0x7f4c1be88ca7
00b67 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00b6f 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00b74 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00b7c 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00b81 4883fa20                       cmp        rdx, 0x20
00b85 7728                           ja         0x7f4c1be88caf
00b87 4d63d6                         movsxd     r10, r14d
00b8a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b91 c442a8f5db                     bzhi       r11, r11, r10
00b96 c4c1fb92fb                     kmovq      k7, r11
00b9b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ba1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ba7 458bf5                         mov        r14d, r13d
00baa e955f8ffff                     jmp        0x7f4c1be88504
00baf c5f877                         vzeroupper 
00bb2 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00bbc 41ffd2                         call       r10
00bbf 0f1f840000000000               nop        dword ptr [rax + rax]
00bc7 ebde                           jmp        0x7f4c1be88ca7
00bc9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00bd1 458b4a08                       mov        r9d, dword ptr [r10 + 8]
00bd5 418d69f1                       lea        ebp, [r9 - 0xf]
00bd9 85ed                           test       ebp, ebp
00bdb 0f8cc72c0000                   jl         0x7f4c1be8b9a8
00be1 418d69f1                       lea        ebp, [r9 - 0xf]
00be5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00bea 443bd5                         cmp        r10d, ebp
00bed 0f83e92a0000                   jae        0x7f4c1be8b7dc
00bf3 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00bfb 418b4a08                       mov        ecx, dword ptr [r10 + 8]
00bff 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c04 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00c09 8d69f1                         lea        ebp, [rcx - 0xf]
00c0c 4963fb                         movsxd     rdi, r11d
00c0f 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00c17 c4c17a6f443a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rdi + 0xc]
00c1e 85ed                           test       ebp, ebp
00c20 0f8c362e0000                   jl         0x7f4c1be8bb5c
00c26 448d59f1                       lea        r11d, [rcx - 0xf]
00c2a 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00c32 453bc3                         cmp        r8d, r11d
00c35 0f83592b0000                   jae        0x7f4c1be8b894
00c3b 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c43 418bc2                         mov        eax, r10d
00c46 4963d2                         movsxd     rdx, r10d
00c49 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00c51 c4c17a7f44120c                 vmovdqu    xmmword ptr [r10 + rdx + 0xc], xmm0
00c58 448d5010                       lea        r10d, [rax + 0x10]
00c5c 458bc2                         mov        r8d, r10d
00c5f 453bd5                         cmp        r10d, r13d
00c62 0f8da6000000                   jge        0x7f4c1be88e0e
00c68 482bfa                         sub        rdi, rdx
00c6b 4963d1                         movsxd     rdx, r9d
00c6e 4883c2f1                       add        rdx, -0xf
00c72 4d63ca                         movsxd     r9, r10d
00c75 4d8d1439                       lea        r10, [r9 + rdi]
00c79 4c3bd2                         cmp        r10, rdx
00c7c 0f83aa2e0000                   jae        0x7f4c1be8bc2c
00c82 4d63d5                         movsxd     r10, r13d
00c85 4d2bd1                         sub        r10, r9
00c88 4983c20f                       add        r10, 0xf
00c8c 4983e2f0                       and        r10, 0xfffffffffffffff0
00c90 458bca                         mov        r9d, r10d
00c93 448bd0                         mov        r10d, eax
00c96 478d541110                     lea        r10d, [r9 + r10 + 0x10]
00c9b 4d63d2                         movsxd     r10, r10d
00c9e 4d8d4c3af0                     lea        r9, [r10 + rdi - 0x10]
00ca3 4c3bca                         cmp        r9, rdx
00ca6 0f83802e0000                   jae        0x7f4c1be8bc2c
00cac 453bc3                         cmp        r8d, r11d
00caf 0f83772e0000                   jae        0x7f4c1be8bc2c
00cb5 4c63d9                         movsxd     r11, ecx
00cb8 4983c2f0                       add        r10, -0x10
00cbc 4983c3f1                       add        r11, -0xf
00cc0 4d3bd3                         cmp        r10, r11
00cc3 0f83632e0000                   jae        0x7f4c1be8bc2c
00cc9 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00cd0 0f8f262f0000                   jg         0x7f4c1be8bcfc
00cd6 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00cdb 442bd0                         sub        r10d, eax
00cde 6690                           nop        
00ce0 458bd8                         mov        r11d, r8d
00ce3 438d0c02                       lea        ecx, [r10 + r8]
00ce7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cef c4c17a6f44090c                 vmovdqu    xmm0, xmmword ptr [r9 + rcx + 0xc]
00cf6 488b8c24a0000000               mov        rcx, qword ptr [rsp + 0xa0]
00cfe c4a17a7f44190c                 vmovdqu    xmmword ptr [rcx + r11 + 0xc], xmm0
00d05 4183c010                       add        r8d, 0x10
00d09 453bc5                         cmp        r8d, r13d
00d0c 7cd2                           jl         0x7f4c1be88de0
00d0e 440374247c                     add        r14d, dword ptr [rsp + 0x7c]
00d13 4489b424ac000000               mov        dword ptr [rsp + 0xac], r14d
00d1b 458bf5                         mov        r14d, r13d
00d1e e9e1f6ffff                     jmp        0x7f4c1be88504
00d23 4d63d2                         movsxd     r10, r10d
00d26 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d2d c442a8f5db                     bzhi       r11, r11, r10
00d32 c4c1fb92fb                     kmovq      k7, r11
00d37 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d3d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d43 e994000000                     jmp        0x7f4c1be88edc
00d48 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
00d50 448b5908                       mov        r11d, dword ptr [rcx + 8]
00d54 4c8bb424a0000000               mov        r14, qword ptr [rsp + 0xa0]
00d5c 418b5608                       mov        edx, dword ptr [r14 + 8]
00d60 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00d65 4585ed                         test       r13d, r13d
00d68 0f8c42290000                   jl         0x7f4c1be8b7b0
00d6e 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00d75 85db                           test       ebx, ebx
00d77 0f8c3a290000                   jl         0x7f4c1be8b7b7
00d7d 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00d82 0f822f290000                   jb         0x7f4c1be8b7b7
00d88 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00d8f 4103ea                         add        ebp, r10d
00d92 3bd5                           cmp        edx, ebp
00d94 0f821d290000                   jb         0x7f4c1be8b7b7
00d9a 4585d2                         test       r10d, r10d
00d9d 0f8c14290000                   jl         0x7f4c1be8b7b7
00da3 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00da7 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00dab 742f                           je         0x7f4c1be88edc
00dad 4b8d740e0c                     lea        rsi, [r14 + r9 + 0xc]
00db2 4a8d7c010c                     lea        rdi, [rcx + r8 + 0xc]
00db7 4963d2                         movsxd     rdx, r10d
00dba 4883fa20                       cmp        rdx, 0x20
00dbe 0f865fffffff                   jbe        0x7f4c1be88e23
00dc4 c5f877                         vzeroupper 
00dc7 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00dd1 41ffd2                         call       r10
00dd4 0f1f840000000000               nop        dword ptr [rax + rax]
00ddc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00de1 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00de5 c5f877                         vzeroupper 
00de8 4881c4c0000000                 add        rsp, 0xc0
00def 5d                             pop        rbp
00df0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00df4 0f87ee370000                   ja         0x7f4c1be8c6e8
00dfa c3                             ret        
00dfb 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00e00 498bd8                         mov        rbx, r8
00e03 90                             nop        
00e04 448bd8                         mov        r11d, eax
00e07 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
00e0c 62b17e486f841b0c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 0xc]
00e17 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e1c 62b17e487f84130c000000         vmovdqu32  zmmword ptr [rbx + r10 + 0xc], zmm0
00e27 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e2c 4183c340                       add        r11d, 0x40
00e30 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00e35 443bd9                         cmp        r11d, ecx
00e38 7cca                           jl         0x7f4c1be88f04
00e3a 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00e42 e9f6020000                     jmp        0x7f4c1be8923d
00e47 4585db                         test       r11d, r11d
00e4a 0f8c40300000                   jl         0x7f4c1be8bf90
00e50 458d55f9                       lea        r10d, [r13 - 7]
00e54 418bca                         mov        ecx, r10d
00e57 413bda                         cmp        ebx, r10d
00e5a 0f836c2e0000                   jae        0x7f4c1be8bdcc
00e60 8bc3                           mov        eax, ebx
00e62 4863f8                         movsxd     rdi, eax
00e65 4d8b5c380c                     mov        r11, qword ptr [r8 + rdi + 0xc]
00e6a 453bf2                         cmp        r14d, r10d
00e6d 0f83392f0000                   jae        0x7f4c1be8beac
00e73 458bce                         mov        r9d, r14d
00e76 458d5108                       lea        r10d, [r9 + 8]
00e7a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00e7f 4963f1                         movsxd     rsi, r9d
00e82 4d895c300c                     mov        qword ptr [r8 + rsi + 0xc], r11
00e87 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00e8f 0f8de6020000                   jge        0x7f4c1be8927b
00e95 482bfe                         sub        rdi, rsi
00e98 4963f5                         movsxd     rsi, r13d
00e9b 4883c6f9                       add        rsi, -7
00e9f 4d63da                         movsxd     r11, r10d
00ea2 498d2c3b                       lea        rbp, [r11 + rdi]
00ea6 483bee                         cmp        rbp, rsi
00ea9 0f83c1300000                   jae        0x7f4c1be8c070
00eaf 488bea                         mov        rbp, rdx
00eb2 492beb                         sub        rbp, r11
00eb5 4883c507                       add        rbp, 7
00eb9 4883e5f8                       and        rbp, 0xfffffffffffffff8
00ebd 448bed                         mov        r13d, ebp
00ec0 478d6c0d08                     lea        r13d, [r13 + r9 + 8]
00ec5 4963ed                         movsxd     rbp, r13d
00ec8 488d7c3df8                     lea        rdi, [rbp + rdi - 8]
00ecd 483bfe                         cmp        rdi, rsi
00ed0 0f839a300000                   jae        0x7f4c1be8c070
00ed6 443bd1                         cmp        r10d, ecx
00ed9 0f8391300000                   jae        0x7f4c1be8c070
00edf 4883c5f8                       add        rbp, -8
00ee3 483bee                         cmp        rbp, rsi
00ee6 0f8384300000                   jae        0x7f4c1be8c070
00eec 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00ef4 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00efb 0f8f2f310000                   jg         0x7f4c1be8c130
00f01 412bc1                         sub        eax, r9d
00f04 bff4ffffff                     mov        edi, 0xfffffff4
00f09 4c8d52c8                       lea        r10, [rdx - 0x38]
00f0d 4981fa00000080                 cmp        r10, -0x80000000
00f14 48c7c100000080                 mov        rcx, 0xffffffff80000000
00f1b 4c0f4cd1                       cmovl      r10, rcx
00f1f 418bca                         mov        ecx, r10d
00f22 412bde                         sub        ebx, r14d
00f25 418d7110                       lea        esi, [r9 + 0x10]
00f29 458bd0                         mov        r10d, r8d
00f2c 412bfa                         sub        edi, r10d
00f2f 412bf9                         sub        edi, r9d
00f32 83c7f0                         add        edi, -0x10
00f35 4c63d6                         movsxd     r10, esi
00f38 498be8                         mov        rbp, r8
00f3b 41b906000000                   mov        r9d, 6
00f41 c462b0f5cf                     bzhi       r9, rdi, r9
00f46 4d03d1                         add        r10, r9
00f49 4c3bd2                         cmp        r10, rdx
00f4c 4c8bca                         mov        r9, rdx
00f4f 4d0f4cca                       cmovl      r9, r10
00f53 4d8bd1                         mov        r10, r9
00f56 4d2bd3                         sub        r10, r11
00f59 498d7aff                       lea        rdi, [r10 - 1]
00f5d 48c1ff3f                       sar        rdi, 0x3f
00f61 48c1ef3d                       shr        rdi, 0x3d
00f65 4e8d5417ff                     lea        r10, [rdi + r10 - 1]
00f6a 4983e2f8                       and        r10, 0xfffffffffffffff8
00f6e 4d03d3                         add        r10, r11
00f71 4d3bda                         cmp        r11, r10
00f74 4d0f4cda                       cmovl      r11, r10
00f78 458bdb                         mov        r11d, r11d
00f7b 468d541b08                     lea        r10d, [rbx + r11 + 8]
00f80 4183c308                       add        r11d, 8
00f84 4963da                         movsxd     rbx, r10d
00f87 4803dd                         add        rbx, rbp
00f8a 4963fb                         movsxd     rdi, r11d
00f8d 4803fd                         add        rdi, rbp
00f90 4c8d530c                       lea        r10, [rbx + 0xc]
00f94 4883c34c                       add        rbx, 0x4c
00f98 488d6f4c                       lea        rbp, [rdi + 0x4c]
00f9c 4533db                         xor        r11d, r11d
00f9f 493bea                         cmp        rbp, r10
00fa2 410f96c3                       setbe      r11b
00fa6 4883c70c                       add        rdi, 0xc
00faa 4533d2                         xor        r10d, r10d
00fad 483bdf                         cmp        rbx, rdi
00fb0 410f96c2                       setbe      r10b
00fb4 450bda                         or         r11d, r10d
00fb7 0f84e7150000                   je         0x7f4c1be8a6a4
00fbd 458bc9                         mov        r9d, r9d
00fc0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fc5 8bd8                           mov        ebx, eax
00fc7 035c2468                       add        ebx, dword ptr [rsp + 0x68]
00fcb 4d8b54180c                     mov        r10, qword ptr [r8 + rbx + 0xc]
00fd0 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
00fd5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00fda 4183c208                       add        r10d, 8
00fde 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00fe3 458bda                         mov        r11d, r10d
00fe6 453bd1                         cmp        r10d, r9d
00fe9 7cd5                           jl         0x7f4c1be890c0
00feb 4881c208feffff                 add        rdx, -0x1f8
00ff2 4881fa00000080                 cmp        rdx, -0x80000000
00ff9 49c7c200000080                 mov        r10, 0xffffffff80000000
01000 490f4cd2                       cmovl      rdx, r10
01004 448bca                         mov        r9d, edx
01007 453bd9                         cmp        r11d, r9d
0100a 0f8dd0300000                   jge        0x7f4c1be8c1e0
01010 458bd3                         mov        r10d, r11d
01013 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01018 0f1f840000000000               nop        dword ptr [rax + rax]
01020 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01025 4963db                         movsxd     rbx, r11d
01028 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0102d 448bd0                         mov        r10d, eax
01030 4403542468                     add        r10d, dword ptr [rsp + 0x68]
01035 8b7c2468                       mov        edi, dword ptr [rsp + 0x68]
01039 81c780000000                   add        edi, 0x80
0103f 03f8                           add        edi, eax
01041 418bf2                         mov        esi, r10d
01044 62d17e486f84300c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rsi + 0xc]
0104f 62917e487f84180c000000         vmovdqu32  zmmword ptr [r8 + r11 + 0xc], zmm0
0105a 4963d2                         movsxd     rdx, r10d
0105d 62d17e486f84104c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 0x4c]
01068 62d17e487f84184c000000         vmovdqu32  zmmword ptr [r8 + rbx + 0x4c], zmm0
01073 448bdf                         mov        r11d, edi
01076 62917e486f84180c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0xc]
01081 62d17e487f84188c000000         vmovdqu32  zmmword ptr [r8 + rbx + 0x8c], zmm0
0108c 4c63d7                         movsxd     r10, edi
0108f 62917e486f84104c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0x4c]
0109a 62d17e487f8418cc000000         vmovdqu32  zmmword ptr [r8 + rbx + 0xcc], zmm0
010a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010aa 4181c200010000                 add        r10d, 0x100
010b1 4403d0                         add        r10d, eax
010b4 458bda                         mov        r11d, r10d
010b7 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
010c2 62d17e487f84180c010000         vmovdqu32  zmmword ptr [r8 + rbx + 0x10c], zmm0
010cd 4d63d3                         movsxd     r10, r11d
010d0 62917e486f84104c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0x4c]
010db 62d17e487f84184c010000         vmovdqu32  zmmword ptr [r8 + rbx + 0x14c], zmm0
010e6 62d17e486f84108c010000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 0x18c]
010f1 62d17e487f84188c010000         vmovdqu32  zmmword ptr [r8 + rbx + 0x18c], zmm0
010fc 62d17e486f8410cc010000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 0x1cc]
01107 62d17e487f8418cc010000         vmovdqu32  zmmword ptr [r8 + rbx + 0x1cc], zmm0
01112 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01117 4181c200020000                 add        r10d, 0x200
0111e 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01123 453bd1                         cmp        r10d, r9d
01126 0f8cf4feffff                   jl         0x7f4c1be89120
0112c 443bd1                         cmp        r10d, ecx
0112f 0f8cc6fcffff                   jl         0x7f4c1be88efb
01135 4c898424a0000000               mov        qword ptr [rsp + 0xa0], r8
0113d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01142 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0114a 7d2f                           jge        0x7f4c1be8927b
0114c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01151 666690                         nop        
01154 468d1c10                       lea        r11d, [rax + r10]
01158 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
01160 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
01165 458bc2                         mov        r8d, r10d
01168 4e895c030c                     mov        qword ptr [rbx + r8 + 0xc], r11
0116d 4183c208                       add        r10d, 8
01171 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
01179 7cd9                           jl         0x7f4c1be89254
0117b 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01182 e91ff5ffff                     jmp        0x7f4c1be887a6
01187 4585d2                         test       r10d, r10d
0118a 0f8c24310000                   jl         0x7f4c1be8c3b4
01190 458d5df1                       lea        r11d, [r13 - 0xf]
01194 418bcb                         mov        ecx, r11d
01197 413bdb                         cmp        ebx, r11d
0119a 0f834d2f0000                   jae        0x7f4c1be8c1ed
011a0 4c63cb                         movsxd     r9, ebx
011a3 c4817a6f44080c                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 0xc]
011aa 453bf3                         cmp        r14d, r11d
011ad 0f8309300000                   jae        0x7f4c1be8c2bc
011b3 418d6e10                       lea        ebp, [r14 + 0x10]
011b7 4d63d6                         movsxd     r10, r14d
011ba c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
011c1 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
011c8 0f8d2f020000                   jge        0x7f4c1be894fd
011ce 4d2bca                         sub        r9, r10
011d1 4963fd                         movsxd     rdi, r13d
011d4 4883c7f1                       add        rdi, -0xf
011d8 4c63dd                         movsxd     r11, ebp
011db 4f8d140b                       lea        r10, [r11 + r9]
011df 4c3bd7                         cmp        r10, rdi
011e2 0f839c310000                   jae        0x7f4c1be8c484
011e8 4c8bd2                         mov        r10, rdx
011eb 4d2bd3                         sub        r10, r11
011ee 4983c20f                       add        r10, 0xf
011f2 4983e2f0                       and        r10, 0xfffffffffffffff0
011f6 458bda                         mov        r11d, r10d
011f9 478d543310                     lea        r10d, [r11 + r14 + 0x10]
011fe 4d63d2                         movsxd     r10, r10d
01201 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
01206 4c3bdf                         cmp        r11, rdi
01209 0f8375310000                   jae        0x7f4c1be8c484
0120f 3be9                           cmp        ebp, ecx
01211 0f836d310000                   jae        0x7f4c1be8c484
01217 4983c2f0                       add        r10, -0x10
0121b 4c3bd7                         cmp        r10, rdi
0121e 0f8360310000                   jae        0x7f4c1be8c484
01224 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0122c 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
01233 0f8fdb310000                   jg         0x7f4c1be8c514
01239 412bde                         sub        ebx, r14d
0123c 4183c620                       add        r14d, 0x20
01240 448bdd                         mov        r11d, ebp
01243 448d142b                       lea        r10d, [rbx + rbp]
01247 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
0124f c4817a6f44150c                 vmovdqu    xmm0, xmmword ptr [r13 + r10 + 0xc]
01256 c4817a7f441d0c                 vmovdqu    xmmword ptr [r13 + r11 + 0xc], xmm0
0125d 83c510                         add        ebp, 0x10
01260 413bee                         cmp        ebp, r14d
01263 7cdb                           jl         0x7f4c1be89340
01265 4881c210ffffff                 add        rdx, -0xf0
0126c 4881fa00000080                 cmp        rdx, -0x80000000
01273 49c7c200000080                 mov        r10, 0xffffffff80000000
0127a 490f4cd2                       cmovl      rdx, r10
0127e 448bd2                         mov        r10d, edx
01281 413bea                         cmp        ebp, r10d
01284 0f8d40010000                   jge        0x7f4c1be894ca
0128a 660f1f440000                   nop        word ptr [rax + rax]
01290 448bc5                         mov        r8d, ebp
01293 4963c8                         movsxd     rcx, r8d
01296 448bdd                         mov        r11d, ebp
01299 448d0c2b                       lea        r9d, [rbx + rbp]
0129d 458bc1                         mov        r8d, r9d
012a0 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
012a8 c4817a6f440d0c                 vmovdqu    xmm0, xmmword ptr [r13 + r9 + 0xc]
012af c4817a7f441d0c                 vmovdqu    xmmword ptr [r13 + r11 + 0xc], xmm0
012b6 4d63d8                         movsxd     r11, r8d
012b9 c4817a6f441d1c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x1c]
012c0 c4c17a7f440d1c                 vmovdqu    xmmword ptr [r13 + rcx + 0x1c], xmm0
012c7 c4817a6f441d2c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x2c]
012ce c4c17a7f440d2c                 vmovdqu    xmmword ptr [r13 + rcx + 0x2c], xmm0
012d5 c4817a6f441d3c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x3c]
012dc c4c17a7f440d3c                 vmovdqu    xmmword ptr [r13 + rcx + 0x3c], xmm0
012e3 c4817a6f441d4c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x4c]
012ea c4c17a7f440d4c                 vmovdqu    xmmword ptr [r13 + rcx + 0x4c], xmm0
012f1 c4817a6f441d5c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x5c]
012f8 c4c17a7f440d5c                 vmovdqu    xmmword ptr [r13 + rcx + 0x5c], xmm0
012ff c4817a6f441d6c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x6c]
01306 c4c17a7f440d6c                 vmovdqu    xmmword ptr [r13 + rcx + 0x6c], xmm0
0130d c4817a6f441d7c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x7c]
01314 c4c17a7f440d7c                 vmovdqu    xmmword ptr [r13 + rcx + 0x7c], xmm0
0131b c4817a6f841d8c000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x8c]
01325 c4c17a7f840d8c000000           vmovdqu    xmmword ptr [r13 + rcx + 0x8c], xmm0
0132f c4817a6f841d9c000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0x9c]
01339 c4c17a7f840d9c000000           vmovdqu    xmmword ptr [r13 + rcx + 0x9c], xmm0
01343 c4817a6f841dac000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xac]
0134d c4c17a7f840dac000000           vmovdqu    xmmword ptr [r13 + rcx + 0xac], xmm0
01357 c4817a6f841dbc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xbc]
01361 c4c17a7f840dbc000000           vmovdqu    xmmword ptr [r13 + rcx + 0xbc], xmm0
0136b c4817a6f841dcc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xcc]
01375 c4c17a7f840dcc000000           vmovdqu    xmmword ptr [r13 + rcx + 0xcc], xmm0
0137f c4817a6f841ddc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xdc]
01389 c4c17a7f840ddc000000           vmovdqu    xmmword ptr [r13 + rcx + 0xdc], xmm0
01393 c4817a6f841dec000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xec]
0139d c4c17a7f840dec000000           vmovdqu    xmmword ptr [r13 + rcx + 0xec], xmm0
013a7 c4817a6f841dfc000000           vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xfc]
013b1 c4c17a7f840dfc000000           vmovdqu    xmmword ptr [r13 + rcx + 0xfc], xmm0
013bb 81c500010000                   add        ebp, 0x100
013c1 413bea                         cmp        ebp, r10d
013c4 0f8cc6feffff                   jl         0x7f4c1be89390
013ca 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
013d1 7d2a                           jge        0x7f4c1be894fd
013d3 90                             nop        
013d4 448d142b                       lea        r10d, [rbx + rbp]
013d8 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
013e0 c4817a6f44150c                 vmovdqu    xmm0, xmmword ptr [r13 + r10 + 0xc]
013e7 448bdd                         mov        r11d, ebp
013ea c4817a7f441d0c                 vmovdqu    xmmword ptr [r13 + r11 + 0xc], xmm0
013f1 83c510                         add        ebp, 0x10
013f4 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
013fb 7cd7                           jl         0x7f4c1be894d4
013fd 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01404 e99df2ffff                     jmp        0x7f4c1be887a6
01409 bee4ffffff                     mov        esi, 0xffffffe4
0140e 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01413 48894424f8                     mov        qword ptr [rsp - 8], rax
01418 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0141c 89442408                       mov        dword ptr [rsp + 8], eax
01420 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01425 48ff742420                     push       qword ptr [rsp + 0x20]
0142a 488f442418                     pop        qword ptr [rsp + 0x18]
0142f 48894424f8                     mov        qword ptr [rsp - 8], rax
01434 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01438 8944240c                       mov        dword ptr [rsp + 0xc], eax
0143c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01441 48894424f8                     mov        qword ptr [rsp - 8], rax
01446 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0144a 89442438                       mov        dword ptr [rsp + 0x38], eax
0144e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01453 48ff742450                     push       qword ptr [rsp + 0x50]
01458 488f442440                     pop        qword ptr [rsp + 0x40]
0145d 48894424f8                     mov        qword ptr [rsp - 8], rax
01462 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01466 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0146a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146f 48ff742458                     push       qword ptr [rsp + 0x58]
01474 488f442448                     pop        qword ptr [rsp + 0x48]
01479 48ff742460                     push       qword ptr [rsp + 0x60]
0147e 488f442450                     pop        qword ptr [rsp + 0x50]
01483 90                             nop        
01484 c5f877                         vzeroupper 
01487 e8d4e7b4ff                     call       0x7f4c1b9d7d60
0148c 0f1f840084150003               nop        dword ptr [rax + rax + 0x3001584]
01494 bee4ffffff                     mov        esi, 0xffffffe4
01499 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0149e 48894424f8                     mov        qword ptr [rsp - 8], rax
014a3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014a7 89442408                       mov        dword ptr [rsp + 8], eax
014ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b0 48ff742420                     push       qword ptr [rsp + 0x20]
014b5 488f442418                     pop        qword ptr [rsp + 0x18]
014ba 48894424f8                     mov        qword ptr [rsp - 8], rax
014bf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014c3 8944240c                       mov        dword ptr [rsp + 0xc], eax
014c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014cc 48894424f8                     mov        qword ptr [rsp - 8], rax
014d1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014d5 89442438                       mov        dword ptr [rsp + 0x38], eax
014d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014de 48ff742450                     push       qword ptr [rsp + 0x50]
014e3 488f442440                     pop        qword ptr [rsp + 0x40]
014e8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ed 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014f1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fa 48ff742458                     push       qword ptr [rsp + 0x58]
014ff 488f442448                     pop        qword ptr [rsp + 0x48]
01504 48ff742460                     push       qword ptr [rsp + 0x60]
01509 488f442450                     pop        qword ptr [rsp + 0x50]
0150e 48894424f8                     mov        qword ptr [rsp - 8], rax
01513 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01517 89442458                       mov        dword ptr [rsp + 0x58], eax
0151b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01520 48894424f8                     mov        qword ptr [rsp - 8], rax
01525 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01529 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0152d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01532 48894424f8                     mov        qword ptr [rsp - 8], rax
01537 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0153b 89442460                       mov        dword ptr [rsp + 0x60], eax
0153f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01544 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01549 48894424f8                     mov        qword ptr [rsp - 8], rax
0154e 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01552 89442478                       mov        dword ptr [rsp + 0x78], eax
01556 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155b 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01560 c5f877                         vzeroupper 
01563 e8f8e6b4ff                     call       0x7f4c1b9d7d60
01568 0f1f840060160004               nop        dword ptr [rax + rax + 0x4001660]
01570 bee4ffffff                     mov        esi, 0xffffffe4
01575 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0157a 48ffb42480000000               push       qword ptr [rsp + 0x80]
01582 488f0424                       pop        qword ptr [rsp]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0158f 89442408                       mov        dword ptr [rsp + 8], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 48ff742420                     push       qword ptr [rsp + 0x20]
0159d 488f442418                     pop        qword ptr [rsp + 0x18]
015a2 48894424f8                     mov        qword ptr [rsp - 8], rax
015a7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015ab 8944240c                       mov        dword ptr [rsp + 0xc], eax
015af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b4 895c2434                       mov        dword ptr [rsp + 0x34], ebx
015b8 48894424f8                     mov        qword ptr [rsp - 8], rax
015bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015c1 89442438                       mov        dword ptr [rsp + 0x38], eax
015c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ca 48ff742450                     push       qword ptr [rsp + 0x50]
015cf 488f442440                     pop        qword ptr [rsp + 0x40]
015d4 48894424f8                     mov        qword ptr [rsp - 8], rax
015d9 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015dd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e6 48ff742458                     push       qword ptr [rsp + 0x58]
015eb 488f442448                     pop        qword ptr [rsp + 0x48]
015f0 48ff742460                     push       qword ptr [rsp + 0x60]
015f5 488f442450                     pop        qword ptr [rsp + 0x50]
015fa 48894424f8                     mov        qword ptr [rsp - 8], rax
015ff 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01603 89442458                       mov        dword ptr [rsp + 0x58], eax
01607 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160c 48894424f8                     mov        qword ptr [rsp - 8], rax
01611 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01615 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01619 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161e 48894424f8                     mov        qword ptr [rsp - 8], rax
01623 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01627 89442460                       mov        dword ptr [rsp + 0x60], eax
0162b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01630 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01635 48894424f8                     mov        qword ptr [rsp - 8], rax
0163a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01641 89442468                       mov        dword ptr [rsp + 0x68], eax
01645 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164a 48894424f8                     mov        qword ptr [rsp - 8], rax
0164f 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01656 89442478                       mov        dword ptr [rsp + 0x78], eax
0165a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165f 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01664 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0166d 666690                         nop        
01670 c5f877                         vzeroupper 
01673 e8e8e5b4ff                     call       0x7f4c1b9d7d60
01678 0f1f840070170005               nop        dword ptr [rax + rax + 0x5001770]
01680 beccffffff                     mov        esi, 0xffffffcc
01685 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0168a 48894424f8                     mov        qword ptr [rsp - 8], rax
0168f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01693 89442408                       mov        dword ptr [rsp + 8], eax
01697 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169c 48ff742420                     push       qword ptr [rsp + 0x20]
016a1 488f442418                     pop        qword ptr [rsp + 0x18]
016a6 48894424f8                     mov        qword ptr [rsp - 8], rax
016ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016af 8944240c                       mov        dword ptr [rsp + 0xc], eax
016b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b8 48894424f8                     mov        qword ptr [rsp - 8], rax
016bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
016c1 89442438                       mov        dword ptr [rsp + 0x38], eax
016c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ca 48ff742450                     push       qword ptr [rsp + 0x50]
016cf 488f442440                     pop        qword ptr [rsp + 0x40]
016d4 48894424f8                     mov        qword ptr [rsp - 8], rax
016d9 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016dd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e6 48ff742458                     push       qword ptr [rsp + 0x58]
016eb 488f442448                     pop        qword ptr [rsp + 0x48]
016f0 48ff742460                     push       qword ptr [rsp + 0x60]
016f5 488f442450                     pop        qword ptr [rsp + 0x50]
016fa 48894424f8                     mov        qword ptr [rsp - 8], rax
016ff 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01703 89442458                       mov        dword ptr [rsp + 0x58], eax
01707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170c 48894424f8                     mov        qword ptr [rsp - 8], rax
01711 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01715 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01719 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171e 48894424f8                     mov        qword ptr [rsp - 8], rax
01723 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01727 89442460                       mov        dword ptr [rsp + 0x60], eax
0172b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01730 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01735 48894424f8                     mov        qword ptr [rsp - 8], rax
0173a 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0173e 89442478                       mov        dword ptr [rsp + 0x78], eax
01742 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01747 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0174c c5f877                         vzeroupper 
0174f e80ce5b4ff                     call       0x7f4c1b9d7d60
01754 0f1f84004c180006               nop        dword ptr [rax + rax + 0x600184c]
0175c beccffffff                     mov        esi, 0xffffffcc
01761 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01766 48ffb42480000000               push       qword ptr [rsp + 0x80]
0176e 488f0424                       pop        qword ptr [rsp]
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0177b 89442408                       mov        dword ptr [rsp + 8], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 48ff742420                     push       qword ptr [rsp + 0x20]
01789 488f442418                     pop        qword ptr [rsp + 0x18]
0178e 48894424f8                     mov        qword ptr [rsp - 8], rax
01793 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01797 8944240c                       mov        dword ptr [rsp + 0xc], eax
0179b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a0 895c2434                       mov        dword ptr [rsp + 0x34], ebx
017a4 48894424f8                     mov        qword ptr [rsp - 8], rax
017a9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017ad 89442438                       mov        dword ptr [rsp + 0x38], eax
017b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b6 48ff742450                     push       qword ptr [rsp + 0x50]
017bb 488f442440                     pop        qword ptr [rsp + 0x40]
017c0 48894424f8                     mov        qword ptr [rsp - 8], rax
017c5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017c9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d2 48ff742458                     push       qword ptr [rsp + 0x58]
017d7 488f442448                     pop        qword ptr [rsp + 0x48]
017dc 48ff742460                     push       qword ptr [rsp + 0x60]
017e1 488f442450                     pop        qword ptr [rsp + 0x50]
017e6 48894424f8                     mov        qword ptr [rsp - 8], rax
017eb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017ef 89442458                       mov        dword ptr [rsp + 0x58], eax
017f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f8 48894424f8                     mov        qword ptr [rsp - 8], rax
017fd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01801 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01805 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01813 89442460                       mov        dword ptr [rsp + 0x60], eax
01817 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01821 48894424f8                     mov        qword ptr [rsp - 8], rax
01826 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
0182d 89442468                       mov        dword ptr [rsp + 0x68], eax
01831 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01836 48894424f8                     mov        qword ptr [rsp - 8], rax
0183b 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01842 89442478                       mov        dword ptr [rsp + 0x78], eax
01846 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01850 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01859 666690                         nop        
0185c c5f877                         vzeroupper 
0185f e8fce3b4ff                     call       0x7f4c1b9d7d60
01864 0f1f84005c190007               nop        dword ptr [rax + rax + 0x700195c]
0186c bee4ffffff                     mov        esi, 0xffffffe4
01871 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01876 48894424f8                     mov        qword ptr [rsp - 8], rax
0187b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0187f 89442408                       mov        dword ptr [rsp + 8], eax
01883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01888 48ff742420                     push       qword ptr [rsp + 0x20]
0188d 488f442418                     pop        qword ptr [rsp + 0x18]
01892 48894424f8                     mov        qword ptr [rsp - 8], rax
01897 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0189b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 48894424f8                     mov        qword ptr [rsp - 8], rax
018a9 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
018ad 89442434                       mov        dword ptr [rsp + 0x34], eax
018b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b6 48894424f8                     mov        qword ptr [rsp - 8], rax
018bb 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018bf 89442438                       mov        dword ptr [rsp + 0x38], eax
018c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c8 48ff742450                     push       qword ptr [rsp + 0x50]
018cd 488f442440                     pop        qword ptr [rsp + 0x40]
018d2 48894424f8                     mov        qword ptr [rsp - 8], rax
018d7 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018db 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e4 48ff742458                     push       qword ptr [rsp + 0x58]
018e9 488f442448                     pop        qword ptr [rsp + 0x48]
018ee 48ff742460                     push       qword ptr [rsp + 0x60]
018f3 488f442450                     pop        qword ptr [rsp + 0x50]
018f8 48894424f8                     mov        qword ptr [rsp - 8], rax
018fd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01901 89442458                       mov        dword ptr [rsp + 0x58], eax
01905 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190a 48894424f8                     mov        qword ptr [rsp - 8], rax
0190f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01913 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01917 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191c 48894424f8                     mov        qword ptr [rsp - 8], rax
01921 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01925 89442460                       mov        dword ptr [rsp + 0x60], eax
01929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192e 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01933 90                             nop        
01934 c5f877                         vzeroupper 
01937 e824e3b4ff                     call       0x7f4c1b9d7d60
0193c 0f1f8400341a0008               nop        dword ptr [rax + rax + 0x8001a34]
01944 bee4ffffff                     mov        esi, 0xffffffe4
01949 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0194e 48894424f8                     mov        qword ptr [rsp - 8], rax
01953 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01957 89442408                       mov        dword ptr [rsp + 8], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48ff742420                     push       qword ptr [rsp + 0x20]
01965 488f442418                     pop        qword ptr [rsp + 0x18]
0196a 48894424f8                     mov        qword ptr [rsp - 8], rax
0196f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01973 8944240c                       mov        dword ptr [rsp + 0xc], eax
01977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197c 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01981 48894424f8                     mov        qword ptr [rsp - 8], rax
01986 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0198a 89442438                       mov        dword ptr [rsp + 0x38], eax
0198e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01993 48ff742450                     push       qword ptr [rsp + 0x50]
01998 488f442440                     pop        qword ptr [rsp + 0x40]
0199d 48894424f8                     mov        qword ptr [rsp - 8], rax
019a2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019a6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019af 48ff742458                     push       qword ptr [rsp + 0x58]
019b4 488f442448                     pop        qword ptr [rsp + 0x48]
019b9 48ff742460                     push       qword ptr [rsp + 0x60]
019be 488f442450                     pop        qword ptr [rsp + 0x50]
019c3 48894424f8                     mov        qword ptr [rsp - 8], rax
019c8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019cc 89442458                       mov        dword ptr [rsp + 0x58], eax
019d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d5 48894424f8                     mov        qword ptr [rsp - 8], rax
019da 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019de 89442460                       mov        dword ptr [rsp + 0x60], eax
019e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e7 895c2470                       mov        dword ptr [rsp + 0x70], ebx
019eb 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
019f0 c5f877                         vzeroupper 
019f3 e868e2b4ff                     call       0x7f4c1b9d7d60
019f8 0f1f8400f01a0009               nop        dword ptr [rax + rax + 0x9001af0]
01a00 bee4ffffff                     mov        esi, 0xffffffe4
01a05 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01a0a 48ffb42480000000               push       qword ptr [rsp + 0x80]
01a12 488f0424                       pop        qword ptr [rsp]
01a16 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a1f 89442408                       mov        dword ptr [rsp + 8], eax
01a23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a28 48ff742420                     push       qword ptr [rsp + 0x20]
01a2d 488f442418                     pop        qword ptr [rsp + 0x18]
01a32 48894424f8                     mov        qword ptr [rsp - 8], rax
01a37 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a3b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a4d 89442438                       mov        dword ptr [rsp + 0x38], eax
01a51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a56 48ff742450                     push       qword ptr [rsp + 0x50]
01a5b 488f442440                     pop        qword ptr [rsp + 0x40]
01a60 48894424f8                     mov        qword ptr [rsp - 8], rax
01a65 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a69 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a72 48ff742458                     push       qword ptr [rsp + 0x58]
01a77 488f442448                     pop        qword ptr [rsp + 0x48]
01a7c 48ff742460                     push       qword ptr [rsp + 0x60]
01a81 488f442450                     pop        qword ptr [rsp + 0x50]
01a86 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a8f 89442458                       mov        dword ptr [rsp + 0x58], eax
01a93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a98 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01aa1 89442460                       mov        dword ptr [rsp + 0x60], eax
01aa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaa 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01aaf 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01ab4 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
01ab9 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01ac2 6690                           nop        
01ac4 c5f877                         vzeroupper 
01ac7 e894e1b4ff                     call       0x7f4c1b9d7d60
01acc 0f1f8400c41b000a               nop        dword ptr [rax + rax + 0xa001bc4]
01ad4 beccffffff                     mov        esi, 0xffffffcc
01ad9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01ade 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ae7 89442408                       mov        dword ptr [rsp + 8], eax
01aeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af0 48ff742420                     push       qword ptr [rsp + 0x20]
01af5 488f442418                     pop        qword ptr [rsp + 0x18]
01afa 48894424f8                     mov        qword ptr [rsp - 8], rax
01aff 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b03 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0c 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01b11 48894424f8                     mov        qword ptr [rsp - 8], rax
01b16 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01b1a 89442438                       mov        dword ptr [rsp + 0x38], eax
01b1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b23 48ff742450                     push       qword ptr [rsp + 0x50]
01b28 488f442440                     pop        qword ptr [rsp + 0x40]
01b2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b32 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b36 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3f 48ff742458                     push       qword ptr [rsp + 0x58]
01b44 488f442448                     pop        qword ptr [rsp + 0x48]
01b49 48ff742460                     push       qword ptr [rsp + 0x60]
01b4e 488f442450                     pop        qword ptr [rsp + 0x50]
01b53 48894424f8                     mov        qword ptr [rsp - 8], rax
01b58 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01b5c 89442458                       mov        dword ptr [rsp + 0x58], eax
01b60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b65 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b6e 89442460                       mov        dword ptr [rsp + 0x60], eax
01b72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b77 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01b7b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01b80 c5f877                         vzeroupper 
01b83 e8d8e0b4ff                     call       0x7f4c1b9d7d60
01b88 0f1f8400801c000b               nop        dword ptr [rax + rax + 0xb001c80]
01b90 be45ffffff                     mov        esi, 0xffffff45
01b95 4c89542408                     mov        qword ptr [rsp + 8], r10
01b9a 6690                           nop        
01b9c c5f877                         vzeroupper 
01b9f e8bce0b4ff                     call       0x7f4c1b9d7d60
01ba4 0f1f84009c1c000c               nop        dword ptr [rax + rax + 0xc001c9c]
01bac be45ffffff                     mov        esi, 0xffffff45
01bb1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01bb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bbf 89442408                       mov        dword ptr [rsp + 8], eax
01bc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc8 48ff742420                     push       qword ptr [rsp + 0x20]
01bcd 488f442418                     pop        qword ptr [rsp + 0x18]
01bd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bdb 8944240c                       mov        dword ptr [rsp + 0xc], eax
01bdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be4 48894424f8                     mov        qword ptr [rsp - 8], rax
01be9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01bed 89442438                       mov        dword ptr [rsp + 0x38], eax
01bf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf6 48ff742450                     push       qword ptr [rsp + 0x50]
01bfb 488f442440                     pop        qword ptr [rsp + 0x40]
01c00 48894424f8                     mov        qword ptr [rsp - 8], rax
01c05 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c09 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c12 48ff742458                     push       qword ptr [rsp + 0x58]
01c17 488f442448                     pop        qword ptr [rsp + 0x48]
01c1c 48ff742460                     push       qword ptr [rsp + 0x60]
01c21 488f442450                     pop        qword ptr [rsp + 0x50]
01c26 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c2b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c30 c5f877                         vzeroupper 
01c33 e828e0b4ff                     call       0x7f4c1b9d7d60
01c38 0f1f8400301d000d               nop        dword ptr [rax + rax + 0xd001d30]
01c40 493bca                         cmp        rcx, r10
01c43 bdffffffff                     mov        ebp, 0xffffffff
01c48 7c08                           jl         0x7f4c1be89d52
01c4a 400f95c5                       setne      bpl
01c4e 400fb6ed                       movzx      ebp, bpl
01c52 be45ffffff                     mov        esi, 0xffffff45
01c57 48ff742418                     push       qword ptr [rsp + 0x18]
01c5c 488f0424                       pop        qword ptr [rsp]
01c60 48894424f8                     mov        qword ptr [rsp - 8], rax
01c65 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c69 89442414                       mov        dword ptr [rsp + 0x14], eax
01c6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c72 48894424f8                     mov        qword ptr [rsp - 8], rax
01c77 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c7b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c84 48ff742450                     push       qword ptr [rsp + 0x50]
01c89 488f442448                     pop        qword ptr [rsp + 0x48]
01c8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c93 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c97 89442444                       mov        dword ptr [rsp + 0x44], eax
01c9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca0 48ff742458                     push       qword ptr [rsp + 0x58]
01ca5 488f442450                     pop        qword ptr [rsp + 0x50]
01caa 48ff742460                     push       qword ptr [rsp + 0x60]
01caf 488f442458                     pop        qword ptr [rsp + 0x58]
01cb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cbd 89442460                       mov        dword ptr [rsp + 0x60], eax
01cc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ccf 89442464                       mov        dword ptr [rsp + 0x64], eax
01cd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ce1 89442468                       mov        dword ptr [rsp + 0x68], eax
01ce5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cea 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01cef 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01cf4 c5f877                         vzeroupper 
01cf7 e864dfb4ff                     call       0x7f4c1b9d7d60
01cfc 0f1f8400f41d000e               nop        dword ptr [rax + rax + 0xe001df4]
01d04 be45ffffff                     mov        esi, 0xffffff45
01d09 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01d0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d13 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d17 89442408                       mov        dword ptr [rsp + 8], eax
01d1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d20 48ff742420                     push       qword ptr [rsp + 0x20]
01d25 488f442418                     pop        qword ptr [rsp + 0x18]
01d2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d33 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d41 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01d45 89442438                       mov        dword ptr [rsp + 0x38], eax
01d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4e 48ff742450                     push       qword ptr [rsp + 0x50]
01d53 488f442440                     pop        qword ptr [rsp + 0x40]
01d58 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01d61 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6a 48ff742458                     push       qword ptr [rsp + 0x58]
01d6f 488f442448                     pop        qword ptr [rsp + 0x48]
01d74 48ff742460                     push       qword ptr [rsp + 0x60]
01d79 488f442450                     pop        qword ptr [rsp + 0x50]
01d7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d83 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d87 89442460                       mov        dword ptr [rsp + 0x60], eax
01d8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d90 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01d95 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01d9a 6690                           nop        
01d9c c5f877                         vzeroupper 
01d9f e8bcdeb4ff                     call       0x7f4c1b9d7d60
01da4 0f1f84009c1e000f               nop        dword ptr [rax + rax + 0xf001e9c]
01dac be45ffffff                     mov        esi, 0xffffff45
01db1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01db6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dbb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01dbf 89442408                       mov        dword ptr [rsp + 8], eax
01dc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc8 48ff742420                     push       qword ptr [rsp + 0x20]
01dcd 488f442418                     pop        qword ptr [rsp + 0x18]
01dd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ddb 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ddf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de4 48894424f8                     mov        qword ptr [rsp - 8], rax
01de9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ded 89442438                       mov        dword ptr [rsp + 0x38], eax
01df1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df6 48ff742450                     push       qword ptr [rsp + 0x50]
01dfb 488f442440                     pop        qword ptr [rsp + 0x40]
01e00 48894424f8                     mov        qword ptr [rsp - 8], rax
01e05 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e09 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e12 48ff742458                     push       qword ptr [rsp + 0x58]
01e17 488f442448                     pop        qword ptr [rsp + 0x48]
01e1c 48ff742460                     push       qword ptr [rsp + 0x60]
01e21 488f442450                     pop        qword ptr [rsp + 0x50]
01e26 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e2f 89442458                       mov        dword ptr [rsp + 0x58], eax
01e33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e38 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e41 89442460                       mov        dword ptr [rsp + 0x60], eax
01e45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01e4f 90                             nop        
01e50 c5f877                         vzeroupper 
01e53 e808deb4ff                     call       0x7f4c1b9d7d60
01e58 0f1f8400501f0010               nop        dword ptr [rax + rax + 0x10001f50]
01e60 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01e65 4d3bd8                         cmp        r11, r8
01e68 bdffffffff                     mov        ebp, 0xffffffff
01e6d 7c08                           jl         0x7f4c1be89f77
01e6f 400f95c5                       setne      bpl
01e73 400fb6ed                       movzx      ebp, bpl
01e77 be45ffffff                     mov        esi, 0xffffff45
01e7c 48ff742418                     push       qword ptr [rsp + 0x18]
01e81 488f0424                       pop        qword ptr [rsp]
01e85 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e8e 89442414                       mov        dword ptr [rsp + 0x14], eax
01e92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e97 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9c 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01ea0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ea4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea9 48ff742450                     push       qword ptr [rsp + 0x50]
01eae 488f442448                     pop        qword ptr [rsp + 0x48]
01eb3 48ff742458                     push       qword ptr [rsp + 0x58]
01eb8 488f442450                     pop        qword ptr [rsp + 0x50]
01ebd 48ff742460                     push       qword ptr [rsp + 0x60]
01ec2 488f442458                     pop        qword ptr [rsp + 0x58]
01ec7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ecc 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ed0 89442460                       mov        dword ptr [rsp + 0x60], eax
01ed4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ede 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ee2 89442464                       mov        dword ptr [rsp + 0x64], eax
01ee6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eeb 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01ef0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01ef5 666690                         nop        
01ef8 c5f877                         vzeroupper 
01efb e860ddb4ff                     call       0x7f4c1b9d7d60
01f00 0f1f8400f81f0011               nop        dword ptr [rax + rax + 0x11001ff8]
01f08 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
01f0d 493bcb                         cmp        rcx, r11
01f10 bdffffffff                     mov        ebp, 0xffffffff
01f15 7c08                           jl         0x7f4c1be8a01f
01f17 400f95c5                       setne      bpl
01f1b 400fb6ed                       movzx      ebp, bpl
01f1f be45ffffff                     mov        esi, 0xffffff45
01f24 48ff742418                     push       qword ptr [rsp + 0x18]
01f29 488f0424                       pop        qword ptr [rsp]
01f2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f32 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f36 89442414                       mov        dword ptr [rsp + 0x14], eax
01f3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f44 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f48 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f51 48ff742450                     push       qword ptr [rsp + 0x50]
01f56 488f442448                     pop        qword ptr [rsp + 0x48]
01f5b 48ff742458                     push       qword ptr [rsp + 0x58]
01f60 488f442450                     pop        qword ptr [rsp + 0x50]
01f65 48ff742460                     push       qword ptr [rsp + 0x60]
01f6a 488f442458                     pop        qword ptr [rsp + 0x58]
01f6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f74 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f78 89442460                       mov        dword ptr [rsp + 0x60], eax
01f7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f81 48894424f8                     mov        qword ptr [rsp - 8], rax
01f86 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f8a 89442464                       mov        dword ptr [rsp + 0x64], eax
01f8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f93 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01f98 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01f9d 666690                         nop        
01fa0 c5f877                         vzeroupper 
01fa3 e8b8dcb4ff                     call       0x7f4c1b9d7d60
01fa8 0f1f8400a0200012               nop        dword ptr [rax + rax + 0x120020a0]
01fb0 bee4ffffff                     mov        esi, 0xffffffe4
01fb5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01fba 48ffb42480000000               push       qword ptr [rsp + 0x80]
01fc2 488f0424                       pop        qword ptr [rsp]
01fc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fcf 89442408                       mov        dword ptr [rsp + 8], eax
01fd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd8 48ff742420                     push       qword ptr [rsp + 0x20]
01fdd 488f442418                     pop        qword ptr [rsp + 0x18]
01fe2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01feb 8944240c                       mov        dword ptr [rsp + 0xc], eax
01fef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ffd 89442438                       mov        dword ptr [rsp + 0x38], eax
02001 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02006 48ff742450                     push       qword ptr [rsp + 0x50]
0200b 488f442440                     pop        qword ptr [rsp + 0x40]
02010 48894424f8                     mov        qword ptr [rsp - 8], rax
02015 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02019 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0201d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02022 48ff742458                     push       qword ptr [rsp + 0x58]
02027 488f442448                     pop        qword ptr [rsp + 0x48]
0202c 48ff742460                     push       qword ptr [rsp + 0x60]
02031 488f442450                     pop        qword ptr [rsp + 0x50]
02036 48894424f8                     mov        qword ptr [rsp - 8], rax
0203b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0203f 89442458                       mov        dword ptr [rsp + 0x58], eax
02043 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02048 48894424f8                     mov        qword ptr [rsp - 8], rax
0204d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02051 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02055 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205a 48894424f8                     mov        qword ptr [rsp - 8], rax
0205f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02063 89442460                       mov        dword ptr [rsp + 0x60], eax
02067 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206c 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02071 48894424f8                     mov        qword ptr [rsp - 8], rax
02076 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0207d 89442468                       mov        dword ptr [rsp + 0x68], eax
02081 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02086 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0208b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02090 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02097 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0209f 90                             nop        
020a0 c5f877                         vzeroupper 
020a3 e8b8dbb4ff                     call       0x7f4c1b9d7d60
020a8 0f1f8400a0210013               nop        dword ptr [rax + rax + 0x130021a0]
020b0 bee4ffffff                     mov        esi, 0xffffffe4
020b5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
020ba 48ffb42480000000               push       qword ptr [rsp + 0x80]
020c2 488f0424                       pop        qword ptr [rsp]
020c6 48894424f8                     mov        qword ptr [rsp - 8], rax
020cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020cf 89442408                       mov        dword ptr [rsp + 8], eax
020d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d8 48ff742420                     push       qword ptr [rsp + 0x20]
020dd 488f442418                     pop        qword ptr [rsp + 0x18]
020e2 48894424f8                     mov        qword ptr [rsp - 8], rax
020e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
020ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f4 48894424f8                     mov        qword ptr [rsp - 8], rax
020f9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
020fd 89442438                       mov        dword ptr [rsp + 0x38], eax
02101 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02106 48ff742450                     push       qword ptr [rsp + 0x50]
0210b 488f442440                     pop        qword ptr [rsp + 0x40]
02110 48894424f8                     mov        qword ptr [rsp - 8], rax
02115 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02119 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0211d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02122 48ff742458                     push       qword ptr [rsp + 0x58]
02127 488f442448                     pop        qword ptr [rsp + 0x48]
0212c 48ff742460                     push       qword ptr [rsp + 0x60]
02131 488f442450                     pop        qword ptr [rsp + 0x50]
02136 48894424f8                     mov        qword ptr [rsp - 8], rax
0213b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0213f 89442458                       mov        dword ptr [rsp + 0x58], eax
02143 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02148 48894424f8                     mov        qword ptr [rsp - 8], rax
0214d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02151 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02155 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215a 48894424f8                     mov        qword ptr [rsp - 8], rax
0215f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02163 89442460                       mov        dword ptr [rsp + 0x60], eax
02167 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216c 48894424f8                     mov        qword ptr [rsp - 8], rax
02171 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02178 89442468                       mov        dword ptr [rsp + 0x68], eax
0217c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02181 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02186 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0218a 48894c2478                     mov        qword ptr [rsp + 0x78], rcx
0218f 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02194 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0219c c5f877                         vzeroupper 
0219f e8bcdab4ff                     call       0x7f4c1b9d7d60
021a4 0f1f84009c220014               nop        dword ptr [rax + rax + 0x1400229c]
021ac beccffffff                     mov        esi, 0xffffffcc
021b1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
021b6 48ffb42480000000               push       qword ptr [rsp + 0x80]
021be 488f0424                       pop        qword ptr [rsp]
021c2 48894424f8                     mov        qword ptr [rsp - 8], rax
021c7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021cb 89442408                       mov        dword ptr [rsp + 8], eax
021cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d4 48ff742420                     push       qword ptr [rsp + 0x20]
021d9 488f442418                     pop        qword ptr [rsp + 0x18]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
021eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f0 48894424f8                     mov        qword ptr [rsp - 8], rax
021f5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021f9 89442438                       mov        dword ptr [rsp + 0x38], eax
021fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02202 48ff742450                     push       qword ptr [rsp + 0x50]
02207 488f442440                     pop        qword ptr [rsp + 0x40]
0220c 48894424f8                     mov        qword ptr [rsp - 8], rax
02211 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02215 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02219 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221e 48ff742458                     push       qword ptr [rsp + 0x58]
02223 488f442448                     pop        qword ptr [rsp + 0x48]
02228 48ff742460                     push       qword ptr [rsp + 0x60]
0222d 488f442450                     pop        qword ptr [rsp + 0x50]
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0223b 89442458                       mov        dword ptr [rsp + 0x58], eax
0223f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02244 48894424f8                     mov        qword ptr [rsp - 8], rax
02249 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0224d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02251 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02256 48894424f8                     mov        qword ptr [rsp - 8], rax
0225b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0225f 89442460                       mov        dword ptr [rsp + 0x60], eax
02263 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02268 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0226d 48894424f8                     mov        qword ptr [rsp - 8], rax
02272 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02279 89442468                       mov        dword ptr [rsp + 0x68], eax
0227d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02282 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02287 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0228c 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02293 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
0229b 90                             nop        
0229c c5f877                         vzeroupper 
0229f e8bcd9b4ff                     call       0x7f4c1b9d7d60
022a4 0f1f84009c230015               nop        dword ptr [rax + rax + 0x1500239c]
022ac 83c308                         add        ebx, 8
022af be6effffff                     mov        esi, 0xffffff6e
022b4 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
022b9 48894424f8                     mov        qword ptr [rsp - 8], rax
022be 8b442410                       mov        eax, dword ptr [rsp + 0x10]
022c2 89442408                       mov        dword ptr [rsp + 8], eax
022c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cb 48ff742420                     push       qword ptr [rsp + 0x20]
022d0 488f442418                     pop        qword ptr [rsp + 0x18]
022d5 48894424f8                     mov        qword ptr [rsp - 8], rax
022da 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022de 8944240c                       mov        dword ptr [rsp + 0xc], eax
022e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
022ec 48894424f8                     mov        qword ptr [rsp - 8], rax
022f1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022f5 89442438                       mov        dword ptr [rsp + 0x38], eax
022f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fe 48ff742450                     push       qword ptr [rsp + 0x50]
02303 488f442440                     pop        qword ptr [rsp + 0x40]
02308 48894424f8                     mov        qword ptr [rsp - 8], rax
0230d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02311 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231a 48ff742458                     push       qword ptr [rsp + 0x58]
0231f 488f442448                     pop        qword ptr [rsp + 0x48]
02324 48ff742460                     push       qword ptr [rsp + 0x60]
02329 488f442450                     pop        qword ptr [rsp + 0x50]
0232e 48894424f8                     mov        qword ptr [rsp - 8], rax
02333 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02337 89442458                       mov        dword ptr [rsp + 0x58], eax
0233b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02340 48894424f8                     mov        qword ptr [rsp - 8], rax
02345 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02349 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0234d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02352 48894424f8                     mov        qword ptr [rsp - 8], rax
02357 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0235b 89442460                       mov        dword ptr [rsp + 0x60], eax
0235f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02364 48894424f8                     mov        qword ptr [rsp - 8], rax
02369 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02370 89442468                       mov        dword ptr [rsp + 0x68], eax
02374 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02379 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0237d 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02382 6690                           nop        
02384 c5f877                         vzeroupper 
02387 e8d4d8b4ff                     call       0x7f4c1b9d7d60
0238c 0f1f840084240016               nop        dword ptr [rax + rax + 0x16002484]
02394 83c308                         add        ebx, 8
02397 be66ffffff                     mov        esi, 0xffffff66
0239c 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
023a1 48894424f8                     mov        qword ptr [rsp - 8], rax
023a6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023aa 89442408                       mov        dword ptr [rsp + 8], eax
023ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b3 48ff742420                     push       qword ptr [rsp + 0x20]
023b8 488f442418                     pop        qword ptr [rsp + 0x18]
023bd 48894424f8                     mov        qword ptr [rsp - 8], rax
023c2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023c6 8944240c                       mov        dword ptr [rsp + 0xc], eax
023ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023cf 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
023d4 48894424f8                     mov        qword ptr [rsp - 8], rax
023d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023dd 89442438                       mov        dword ptr [rsp + 0x38], eax
023e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e6 48ff742450                     push       qword ptr [rsp + 0x50]
023eb 488f442440                     pop        qword ptr [rsp + 0x40]
023f0 48894424f8                     mov        qword ptr [rsp - 8], rax
023f5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
023f9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02402 48ff742458                     push       qword ptr [rsp + 0x58]
02407 488f442448                     pop        qword ptr [rsp + 0x48]
0240c 48ff742460                     push       qword ptr [rsp + 0x60]
02411 488f442450                     pop        qword ptr [rsp + 0x50]
02416 48894424f8                     mov        qword ptr [rsp - 8], rax
0241b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0241f 89442458                       mov        dword ptr [rsp + 0x58], eax
02423 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02428 48894424f8                     mov        qword ptr [rsp - 8], rax
0242d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02431 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02435 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243a 48894424f8                     mov        qword ptr [rsp - 8], rax
0243f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02443 89442460                       mov        dword ptr [rsp + 0x60], eax
02447 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244c 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02450 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02455 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0245a 6690                           nop        
0245c c5f877                         vzeroupper 
0245f e8fcd7b4ff                     call       0x7f4c1b9d7d60
02464 0f1f84005c250017               nop        dword ptr [rax + rax + 0x1700255c]
0246c 4533d2                         xor        r10d, r10d
0246f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02474 e9b4dcffff                     jmp        0x7f4c1be8822d
02479 4533d2                         xor        r10d, r10d
0247c 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
02484 e9cddcffff                     jmp        0x7f4c1be88256
02489 4533d2                         xor        r10d, r10d
0248c 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
02494 e9e6dcffff                     jmp        0x7f4c1be8827f
02499 4533d2                         xor        r10d, r10d
0249c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
024a1 e906ddffff                     jmp        0x7f4c1be882ac
024a6 4533d2                         xor        r10d, r10d
024a9 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
024b1 e91fddffff                     jmp        0x7f4c1be882d5
024b6 4533d2                         xor        r10d, r10d
024b9 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
024c1 e93fddffff                     jmp        0x7f4c1be88305
024c6 beccffffff                     mov        esi, 0xffffffcc
024cb 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
024d0 48ffb42480000000               push       qword ptr [rsp + 0x80]
024d8 488f0424                       pop        qword ptr [rsp]
024dc 48894424f8                     mov        qword ptr [rsp - 8], rax
024e1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
024e5 89442408                       mov        dword ptr [rsp + 8], eax
024e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ee 48ff742420                     push       qword ptr [rsp + 0x20]
024f3 488f442418                     pop        qword ptr [rsp + 0x18]
024f8 48894424f8                     mov        qword ptr [rsp - 8], rax
024fd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02501 8944240c                       mov        dword ptr [rsp + 0xc], eax
02505 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250a 48894424f8                     mov        qword ptr [rsp - 8], rax
0250f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02513 89442438                       mov        dword ptr [rsp + 0x38], eax
02517 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251c 48ff742450                     push       qword ptr [rsp + 0x50]
02521 488f442440                     pop        qword ptr [rsp + 0x40]
02526 48894424f8                     mov        qword ptr [rsp - 8], rax
0252b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0252f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02533 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02538 48ff742458                     push       qword ptr [rsp + 0x58]
0253d 488f442448                     pop        qword ptr [rsp + 0x48]
02542 48ff742460                     push       qword ptr [rsp + 0x60]
02547 488f442450                     pop        qword ptr [rsp + 0x50]
0254c 48894424f8                     mov        qword ptr [rsp - 8], rax
02551 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02555 89442458                       mov        dword ptr [rsp + 0x58], eax
02559 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255e 48894424f8                     mov        qword ptr [rsp - 8], rax
02563 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02567 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0256b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02570 48894424f8                     mov        qword ptr [rsp - 8], rax
02575 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02579 89442460                       mov        dword ptr [rsp + 0x60], eax
0257d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02582 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02586 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0258b 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
02593 90                             nop        
02594 c5f877                         vzeroupper 
02597 e8c4d6b4ff                     call       0x7f4c1b9d7d60
0259c 0f1f840094260018               nop        dword ptr [rax + rax + 0x18002694]
025a4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
025a9 448bd8                         mov        r11d, eax
025ac 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
025b1 4f8b5c180c                     mov        r11, qword ptr [r8 + r11 + 0xc]
025b6 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
025bb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
025c0 4183c308                       add        r11d, 8
025c4 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
025c9 443bde                         cmp        r11d, esi
025cc 7cd6                           jl         0x7f4c1be8a6a4
025ce 443bd9                         cmp        r11d, ecx
025d1 0f8dbd1e0000                   jge        0x7f4c1be8c594
025d7 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
025dc 498bd8                         mov        rbx, r8
025df 90                             nop        
025e0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
025e5 4d63c3                         movsxd     r8, r11d
025e8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
025ed 448bd8                         mov        r11d, eax
025f0 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
025f5 458bcb                         mov        r9d, r11d
025f8 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
025fd 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
02602 4d63d9                         movsxd     r11, r9d
02605 4e8b541b14                     mov        r10, qword ptr [rbx + r11 + 0x14]
0260a 4e89540314                     mov        qword ptr [rbx + r8 + 0x14], r10
0260f 4e8b541b1c                     mov        r10, qword ptr [rbx + r11 + 0x1c]
02614 4e8954031c                     mov        qword ptr [rbx + r8 + 0x1c], r10
02619 4e8b541b24                     mov        r10, qword ptr [rbx + r11 + 0x24]
0261e 4e89540324                     mov        qword ptr [rbx + r8 + 0x24], r10
02623 4e8b541b2c                     mov        r10, qword ptr [rbx + r11 + 0x2c]
02628 4e8954032c                     mov        qword ptr [rbx + r8 + 0x2c], r10
0262d 4e8b541b34                     mov        r10, qword ptr [rbx + r11 + 0x34]
02632 4e89540334                     mov        qword ptr [rbx + r8 + 0x34], r10
02637 4e8b541b3c                     mov        r10, qword ptr [rbx + r11 + 0x3c]
0263c 4e8954033c                     mov        qword ptr [rbx + r8 + 0x3c], r10
02641 4e8b541b44                     mov        r10, qword ptr [rbx + r11 + 0x44]
02646 4e89540344                     mov        qword ptr [rbx + r8 + 0x44], r10
0264b 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02650 4183c240                       add        r10d, 0x40
02654 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02659 443bd1                         cmp        r10d, ecx
0265c 0f8c7effffff                   jl         0x7f4c1be8a6e0
02662 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
0266a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0266f 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
02677 0f8dfeeaffff                   jge        0x7f4c1be8927b
0267d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02682 6690                           nop        
02684 468d1418                       lea        r10d, [rax + r11]
02688 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
02690 4f8b54110c                     mov        r10, qword ptr [r9 + r10 + 0xc]
02695 458bc3                         mov        r8d, r11d
02698 4f8954010c                     mov        qword ptr [r9 + r8 + 0xc], r10
0269d 4183c308                       add        r11d, 8
026a1 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
026a9 7cd9                           jl         0x7f4c1be8a784
026ab e9cbeaffff                     jmp        0x7f4c1be8927b
026b0 bee4ffffff                     mov        esi, 0xffffffe4
026b5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
026ba 48ffb42480000000               push       qword ptr [rsp + 0x80]
026c2 488f0424                       pop        qword ptr [rsp]
026c6 48894424f8                     mov        qword ptr [rsp - 8], rax
026cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
026cf 89442408                       mov        dword ptr [rsp + 8], eax
026d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d8 48ff742420                     push       qword ptr [rsp + 0x20]
026dd 488f442418                     pop        qword ptr [rsp + 0x18]
026e2 48894424f8                     mov        qword ptr [rsp - 8], rax
026e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
026ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f4 48894424f8                     mov        qword ptr [rsp - 8], rax
026f9 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
026fd 89442434                       mov        dword ptr [rsp + 0x34], eax
02701 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02706 48894424f8                     mov        qword ptr [rsp - 8], rax
0270b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0270f 89442438                       mov        dword ptr [rsp + 0x38], eax
02713 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02718 48ff742450                     push       qword ptr [rsp + 0x50]
0271d 488f442440                     pop        qword ptr [rsp + 0x40]
02722 48894424f8                     mov        qword ptr [rsp - 8], rax
02727 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0272b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0272f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02734 48ff742458                     push       qword ptr [rsp + 0x58]
02739 488f442448                     pop        qword ptr [rsp + 0x48]
0273e 48ff742460                     push       qword ptr [rsp + 0x60]
02743 488f442450                     pop        qword ptr [rsp + 0x50]
02748 48894424f8                     mov        qword ptr [rsp - 8], rax
0274d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02751 89442458                       mov        dword ptr [rsp + 0x58], eax
02755 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275a 48894424f8                     mov        qword ptr [rsp - 8], rax
0275f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02763 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02767 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276c 48894424f8                     mov        qword ptr [rsp - 8], rax
02771 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02775 89442460                       mov        dword ptr [rsp + 0x60], eax
02779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277e 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02783 89942480000000                 mov        dword ptr [rsp + 0x80], edx
0278a 6690                           nop        
0278c c5f877                         vzeroupper 
0278f e8ccd4b4ff                     call       0x7f4c1b9d7d60
02794 0f1f84008c280019               nop        dword ptr [rax + rax + 0x1900288c]
0279c bee4ffffff                     mov        esi, 0xffffffe4
027a1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
027a6 48894424f8                     mov        qword ptr [rsp - 8], rax
027ab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027af 89442408                       mov        dword ptr [rsp + 8], eax
027b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b8 48ff742420                     push       qword ptr [rsp + 0x20]
027bd 488f442418                     pop        qword ptr [rsp + 0x18]
027c2 48894424f8                     mov        qword ptr [rsp - 8], rax
027c7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027cb 8944240c                       mov        dword ptr [rsp + 0xc], eax
027cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d4 48894424f8                     mov        qword ptr [rsp - 8], rax
027d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027dd 89442438                       mov        dword ptr [rsp + 0x38], eax
027e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e6 48ff742450                     push       qword ptr [rsp + 0x50]
027eb 488f442440                     pop        qword ptr [rsp + 0x40]
027f0 48894424f8                     mov        qword ptr [rsp - 8], rax
027f5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
027f9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02802 48ff742458                     push       qword ptr [rsp + 0x58]
02807 488f442448                     pop        qword ptr [rsp + 0x48]
0280c 48ff742460                     push       qword ptr [rsp + 0x60]
02811 488f442450                     pop        qword ptr [rsp + 0x50]
02816 48894424f8                     mov        qword ptr [rsp - 8], rax
0281b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0281f 89442458                       mov        dword ptr [rsp + 0x58], eax
02823 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02828 48894424f8                     mov        qword ptr [rsp - 8], rax
0282d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02831 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283a 48894424f8                     mov        qword ptr [rsp - 8], rax
0283f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02843 89442460                       mov        dword ptr [rsp + 0x60], eax
02847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02851 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02855 666690                         nop        
02858 c5f877                         vzeroupper 
0285b e800d4b4ff                     call       0x7f4c1b9d7d60
02860 0f1f84005829001a               nop        dword ptr [rax + rax + 0x1a002958]
02868 bee4ffffff                     mov        esi, 0xffffffe4
0286d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02872 48894424f8                     mov        qword ptr [rsp - 8], rax
02877 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0287b 89442408                       mov        dword ptr [rsp + 8], eax
0287f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02884 48ff742420                     push       qword ptr [rsp + 0x20]
02889 488f442418                     pop        qword ptr [rsp + 0x18]
0288e 48894424f8                     mov        qword ptr [rsp - 8], rax
02893 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02897 8944240c                       mov        dword ptr [rsp + 0xc], eax
0289b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a0 48894424f8                     mov        qword ptr [rsp - 8], rax
028a5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028a9 89442438                       mov        dword ptr [rsp + 0x38], eax
028ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b2 48ff742450                     push       qword ptr [rsp + 0x50]
028b7 488f442440                     pop        qword ptr [rsp + 0x40]
028bc 48ff742458                     push       qword ptr [rsp + 0x58]
028c1 488f442448                     pop        qword ptr [rsp + 0x48]
028c6 48ff742460                     push       qword ptr [rsp + 0x60]
028cb 488f442450                     pop        qword ptr [rsp + 0x50]
028d0 48894424f8                     mov        qword ptr [rsp - 8], rax
028d5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
028d9 89442458                       mov        dword ptr [rsp + 0x58], eax
028dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e2 48894424f8                     mov        qword ptr [rsp - 8], rax
028e7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028eb 89442460                       mov        dword ptr [rsp + 0x60], eax
028ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f4 4489742464                     mov        dword ptr [rsp + 0x64], r14d
028f9 666690                         nop        
028fc c5f877                         vzeroupper 
028ff e85cd3b4ff                     call       0x7f4c1b9d7d60
02904 0f1f8400fc29001b               nop        dword ptr [rax + rax + 0x1b0029fc]
0290c bee4ffffff                     mov        esi, 0xffffffe4
02911 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02916 48ffb42480000000               push       qword ptr [rsp + 0x80]
0291e 488f0424                       pop        qword ptr [rsp]
02922 48894424f8                     mov        qword ptr [rsp - 8], rax
02927 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0292b 89442408                       mov        dword ptr [rsp + 8], eax
0292f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02934 48ff742420                     push       qword ptr [rsp + 0x20]
02939 488f442418                     pop        qword ptr [rsp + 0x18]
0293e 48894424f8                     mov        qword ptr [rsp - 8], rax
02943 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02947 8944240c                       mov        dword ptr [rsp + 0xc], eax
0294b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02950 48894424f8                     mov        qword ptr [rsp - 8], rax
02955 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02959 89442434                       mov        dword ptr [rsp + 0x34], eax
0295d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02962 48ff742450                     push       qword ptr [rsp + 0x50]
02967 488f442438                     pop        qword ptr [rsp + 0x38]
0296c 48894424f8                     mov        qword ptr [rsp - 8], rax
02971 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02975 89442440                       mov        dword ptr [rsp + 0x40], eax
02979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297e 48ff742458                     push       qword ptr [rsp + 0x58]
02983 488f442448                     pop        qword ptr [rsp + 0x48]
02988 48ff742460                     push       qword ptr [rsp + 0x60]
0298d 488f442450                     pop        qword ptr [rsp + 0x50]
02992 48894424f8                     mov        qword ptr [rsp - 8], rax
02997 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0299b 89442444                       mov        dword ptr [rsp + 0x44], eax
0299f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a4 48894424f8                     mov        qword ptr [rsp - 8], rax
029a9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
029ad 89442458                       mov        dword ptr [rsp + 0x58], eax
029b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b6 48894424f8                     mov        qword ptr [rsp - 8], rax
029bb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029bf 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c8 4489542474                     mov        dword ptr [rsp + 0x74], r10d
029cd 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
029d5 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
029dc c5f877                         vzeroupper 
029df e87cd2b4ff                     call       0x7f4c1b9d7d60
029e4 0f1f8400dc2a001c               nop        dword ptr [rax + rax + 0x1c002adc]
029ec bee4ffffff                     mov        esi, 0xffffffe4
029f1 48ff742418                     push       qword ptr [rsp + 0x18]
029f6 488f0424                       pop        qword ptr [rsp]
029fa 48ffb42480000000               push       qword ptr [rsp + 0x80]
02a02 488f442408                     pop        qword ptr [rsp + 8]
02a07 48894424f8                     mov        qword ptr [rsp - 8], rax
02a0c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a10 89442414                       mov        dword ptr [rsp + 0x14], eax
02a14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a19 48894424f8                     mov        qword ptr [rsp - 8], rax
02a1e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a22 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a2b 48ff742450                     push       qword ptr [rsp + 0x50]
02a30 488f442440                     pop        qword ptr [rsp + 0x40]
02a35 48ff742458                     push       qword ptr [rsp + 0x58]
02a3a 488f442450                     pop        qword ptr [rsp + 0x50]
02a3f 48ff742460                     push       qword ptr [rsp + 0x60]
02a44 488f442458                     pop        qword ptr [rsp + 0x58]
02a49 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4e 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02a52 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02a56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a60 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02a64 89442460                       mov        dword ptr [rsp + 0x60], eax
02a68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a72 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a76 89442464                       mov        dword ptr [rsp + 0x64], eax
02a7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a7f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02a83 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02a8b 90                             nop        
02a8c c5f877                         vzeroupper 
02a8f e8ccd1b4ff                     call       0x7f4c1b9d7d60
02a94 0f1f84008c2b001d               nop        dword ptr [rax + rax + 0x1d002b8c]
02a9c 8d6b01                         lea        ebp, [rbx + 1]
02a9f bee4ffffff                     mov        esi, 0xffffffe4
02aa4 48ff742418                     push       qword ptr [rsp + 0x18]
02aa9 488f0424                       pop        qword ptr [rsp]
02aad 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ab5 488f442408                     pop        qword ptr [rsp + 8]
02aba 48ffb42490000000               push       qword ptr [rsp + 0x90]
02ac2 488f442418                     pop        qword ptr [rsp + 0x18]
02ac7 48894424f8                     mov        qword ptr [rsp - 8], rax
02acc 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ad0 89442414                       mov        dword ptr [rsp + 0x14], eax
02ad4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad9 48894424f8                     mov        qword ptr [rsp - 8], rax
02ade 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02ae2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ae6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aeb 48ff742450                     push       qword ptr [rsp + 0x50]
02af0 488f442440                     pop        qword ptr [rsp + 0x40]
02af5 48ff742458                     push       qword ptr [rsp + 0x58]
02afa 488f442450                     pop        qword ptr [rsp + 0x50]
02aff 48ff742460                     push       qword ptr [rsp + 0x60]
02b04 488f442458                     pop        qword ptr [rsp + 0x58]
02b09 48894424f8                     mov        qword ptr [rsp - 8], rax
02b0e 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02b12 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02b16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b1b 48894424f8                     mov        qword ptr [rsp - 8], rax
02b20 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02b24 89442460                       mov        dword ptr [rsp + 0x60], eax
02b28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b2d 48894424f8                     mov        qword ptr [rsp - 8], rax
02b32 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b36 89442464                       mov        dword ptr [rsp + 0x64], eax
02b3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b3f 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02b44 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02b48 48894424f8                     mov        qword ptr [rsp - 8], rax
02b4d 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02b54 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02b58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b5d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
02b65 666690                         nop        
02b68 c5f877                         vzeroupper 
02b6b e8f0d0b4ff                     call       0x7f4c1b9d7d60
02b70 0f1f8400682c001e               nop        dword ptr [rax + rax + 0x1e002c68]
02b78 bee4ffffff                     mov        esi, 0xffffffe4
02b7d 48ff742418                     push       qword ptr [rsp + 0x18]
02b82 488f0424                       pop        qword ptr [rsp]
02b86 48ffb42480000000               push       qword ptr [rsp + 0x80]
02b8e 488f442408                     pop        qword ptr [rsp + 8]
02b93 48894424f8                     mov        qword ptr [rsp - 8], rax
02b98 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b9c 89442414                       mov        dword ptr [rsp + 0x14], eax
02ba0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba5 48894424f8                     mov        qword ptr [rsp - 8], rax
02baa 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02bae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02bb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb7 48ff742450                     push       qword ptr [rsp + 0x50]
02bbc 488f442440                     pop        qword ptr [rsp + 0x40]
02bc1 48ff742458                     push       qword ptr [rsp + 0x58]
02bc6 488f442450                     pop        qword ptr [rsp + 0x50]
02bcb 48ff742460                     push       qword ptr [rsp + 0x60]
02bd0 488f442458                     pop        qword ptr [rsp + 0x58]
02bd5 48894424f8                     mov        qword ptr [rsp - 8], rax
02bda 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02bde 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02be2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02be7 48894424f8                     mov        qword ptr [rsp - 8], rax
02bec 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02bf0 89442460                       mov        dword ptr [rsp + 0x60], eax
02bf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bf9 48894424f8                     mov        qword ptr [rsp - 8], rax
02bfe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c02 89442464                       mov        dword ptr [rsp + 0x64], eax
02c06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0b 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02c10 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02c14 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
02c1c c5f877                         vzeroupper 
02c1f e83cd0b4ff                     call       0x7f4c1b9d7d60
02c24 0f1f84001c2d001f               nop        dword ptr [rax + rax + 0x1f002d1c]
02c2c bee4ffffff                     mov        esi, 0xffffffe4
02c31 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02c36 48894424f8                     mov        qword ptr [rsp - 8], rax
02c3b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c3f 89442408                       mov        dword ptr [rsp + 8], eax
02c43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c48 48ff742420                     push       qword ptr [rsp + 0x20]
02c4d 488f442418                     pop        qword ptr [rsp + 0x18]
02c52 48894424f8                     mov        qword ptr [rsp - 8], rax
02c57 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c5b 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c64 48894424f8                     mov        qword ptr [rsp - 8], rax
02c69 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c6d 89442434                       mov        dword ptr [rsp + 0x34], eax
02c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c76 48ff742450                     push       qword ptr [rsp + 0x50]
02c7b 488f442438                     pop        qword ptr [rsp + 0x38]
02c80 48894424f8                     mov        qword ptr [rsp - 8], rax
02c85 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c89 89442440                       mov        dword ptr [rsp + 0x40], eax
02c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c92 48ff742458                     push       qword ptr [rsp + 0x58]
02c97 488f442448                     pop        qword ptr [rsp + 0x48]
02c9c 48ff742460                     push       qword ptr [rsp + 0x60]
02ca1 488f442450                     pop        qword ptr [rsp + 0x50]
02ca6 48894424f8                     mov        qword ptr [rsp - 8], rax
02cab 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02caf 89442444                       mov        dword ptr [rsp + 0x44], eax
02cb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cb8 48894424f8                     mov        qword ptr [rsp - 8], rax
02cbd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02cc1 89442458                       mov        dword ptr [rsp + 0x58], eax
02cc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cca 48894424f8                     mov        qword ptr [rsp - 8], rax
02ccf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cd3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02cd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cdc 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02ce1 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02ce5 666690                         nop        
02ce8 c5f877                         vzeroupper 
02ceb e870cfb4ff                     call       0x7f4c1b9d7d60
02cf0 0f1f8400e82d0020               nop        dword ptr [rax + rax + 0x20002de8]
02cf8 bee4ffffff                     mov        esi, 0xffffffe4
02cfd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02d02 48ffb42480000000               push       qword ptr [rsp + 0x80]
02d0a 488f0424                       pop        qword ptr [rsp]
02d0e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d13 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d17 89442408                       mov        dword ptr [rsp + 8], eax
02d1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d20 48ffb42490000000               push       qword ptr [rsp + 0x90]
02d28 488f442410                     pop        qword ptr [rsp + 0x10]
02d2d 48ff742420                     push       qword ptr [rsp + 0x20]
02d32 488f442418                     pop        qword ptr [rsp + 0x18]
02d37 48894424f8                     mov        qword ptr [rsp - 8], rax
02d3c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d40 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d49 48894424f8                     mov        qword ptr [rsp - 8], rax
02d4e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02d52 89442434                       mov        dword ptr [rsp + 0x34], eax
02d56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d5b 48ff742450                     push       qword ptr [rsp + 0x50]
02d60 488f442438                     pop        qword ptr [rsp + 0x38]
02d65 48894424f8                     mov        qword ptr [rsp - 8], rax
02d6a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02d6e 89442440                       mov        dword ptr [rsp + 0x40], eax
02d72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d77 48ff742458                     push       qword ptr [rsp + 0x58]
02d7c 488f442448                     pop        qword ptr [rsp + 0x48]
02d81 48ff742460                     push       qword ptr [rsp + 0x60]
02d86 488f442450                     pop        qword ptr [rsp + 0x50]
02d8b 48894424f8                     mov        qword ptr [rsp - 8], rax
02d90 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d94 89442444                       mov        dword ptr [rsp + 0x44], eax
02d98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d9d 48894424f8                     mov        qword ptr [rsp - 8], rax
02da2 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02da6 89442458                       mov        dword ptr [rsp + 0x58], eax
02daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02daf 48894424f8                     mov        qword ptr [rsp - 8], rax
02db4 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02db8 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02dbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dc1 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
02dcb 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02dd2 89442470                       mov        dword ptr [rsp + 0x70], eax
02dd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ddb 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02de2 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
02dea 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
02df1 666690                         nop        
02df4 c5f877                         vzeroupper 
02df7 e864ceb4ff                     call       0x7f4c1b9d7d60
02dfc 0f1f8400f42e0021               nop        dword ptr [rax + rax + 0x21002ef4]
02e04 bee4ffffff                     mov        esi, 0xffffffe4
02e09 48ff742418                     push       qword ptr [rsp + 0x18]
02e0e 488f0424                       pop        qword ptr [rsp]
02e12 48ffb42480000000               push       qword ptr [rsp + 0x80]
02e1a 488f442408                     pop        qword ptr [rsp + 8]
02e1f 48894424f8                     mov        qword ptr [rsp - 8], rax
02e24 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e28 89442414                       mov        dword ptr [rsp + 0x14], eax
02e2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e31 48894424f8                     mov        qword ptr [rsp - 8], rax
02e36 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02e3a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e43 48ff742450                     push       qword ptr [rsp + 0x50]
02e48 488f442440                     pop        qword ptr [rsp + 0x40]
02e4d 48ff742458                     push       qword ptr [rsp + 0x58]
02e52 488f442450                     pop        qword ptr [rsp + 0x50]
02e57 48ff742460                     push       qword ptr [rsp + 0x60]
02e5c 488f442458                     pop        qword ptr [rsp + 0x58]
02e61 48894424f8                     mov        qword ptr [rsp - 8], rax
02e66 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02e6a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e73 48894424f8                     mov        qword ptr [rsp - 8], rax
02e78 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02e7c 89442460                       mov        dword ptr [rsp + 0x60], eax
02e80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e85 48894424f8                     mov        qword ptr [rsp - 8], rax
02e8a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e8e 89442464                       mov        dword ptr [rsp + 0x64], eax
02e92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e97 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02e9c 48894424f8                     mov        qword ptr [rsp - 8], rax
02ea1 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02ea8 89442478                       mov        dword ptr [rsp + 0x78], eax
02eac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eb1 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
02eb6 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
02ebe 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02ec5 666690                         nop        
02ec8 c5f877                         vzeroupper 
02ecb e890cdb4ff                     call       0x7f4c1b9d7d60
02ed0 0f1f8400c82f0022               nop        dword ptr [rax + rax + 0x22002fc8]
02ed8 beccffffff                     mov        esi, 0xffffffcc
02edd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02ee2 48ffb42480000000               push       qword ptr [rsp + 0x80]
02eea 488f0424                       pop        qword ptr [rsp]
02eee 48894424f8                     mov        qword ptr [rsp - 8], rax
02ef3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02ef7 89442408                       mov        dword ptr [rsp + 8], eax
02efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f00 48ffb42490000000               push       qword ptr [rsp + 0x90]
02f08 488f442410                     pop        qword ptr [rsp + 0x10]
02f0d 48ff742420                     push       qword ptr [rsp + 0x20]
02f12 488f442418                     pop        qword ptr [rsp + 0x18]
02f17 48894424f8                     mov        qword ptr [rsp - 8], rax
02f1c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02f20 8944240c                       mov        dword ptr [rsp + 0xc], eax
02f24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f29 48894424f8                     mov        qword ptr [rsp - 8], rax
02f2e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02f32 89442434                       mov        dword ptr [rsp + 0x34], eax
02f36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f3b 48ff742450                     push       qword ptr [rsp + 0x50]
02f40 488f442438                     pop        qword ptr [rsp + 0x38]
02f45 48894424f8                     mov        qword ptr [rsp - 8], rax
02f4a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02f4e 89442440                       mov        dword ptr [rsp + 0x40], eax
02f52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f57 48ff742458                     push       qword ptr [rsp + 0x58]
02f5c 488f442448                     pop        qword ptr [rsp + 0x48]
02f61 48ff742460                     push       qword ptr [rsp + 0x60]
02f66 488f442450                     pop        qword ptr [rsp + 0x50]
02f6b 48894424f8                     mov        qword ptr [rsp - 8], rax
02f70 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02f74 89442444                       mov        dword ptr [rsp + 0x44], eax
02f78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
02f82 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02f86 89442458                       mov        dword ptr [rsp + 0x58], eax
02f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
02f94 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f98 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02f9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fa1 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02fa6 48894424f8                     mov        qword ptr [rsp - 8], rax
02fab 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02fb2 89442470                       mov        dword ptr [rsp + 0x70], eax
02fb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fbb 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02fc2 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
02fca 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02fd2 6690                           nop        
02fd4 c5f877                         vzeroupper 
02fd7 e884ccb4ff                     call       0x7f4c1b9d7d60
02fdc 0f1f8400d4300023               nop        dword ptr [rax + rax + 0x230030d4]
02fe4 beccffffff                     mov        esi, 0xffffffcc
02fe9 48ff742418                     push       qword ptr [rsp + 0x18]
02fee 488f0424                       pop        qword ptr [rsp]
02ff2 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ffa 488f442408                     pop        qword ptr [rsp + 8]
02fff 48ffb42490000000               push       qword ptr [rsp + 0x90]
03007 488f442418                     pop        qword ptr [rsp + 0x18]
0300c 48894424f8                     mov        qword ptr [rsp - 8], rax
03011 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03015 89442414                       mov        dword ptr [rsp + 0x14], eax
03019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0301e 48894424f8                     mov        qword ptr [rsp - 8], rax
03023 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03027 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0302b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03030 48ff742450                     push       qword ptr [rsp + 0x50]
03035 488f442440                     pop        qword ptr [rsp + 0x40]
0303a 48ff742458                     push       qword ptr [rsp + 0x58]
0303f 488f442450                     pop        qword ptr [rsp + 0x50]
03044 48ff742460                     push       qword ptr [rsp + 0x60]
03049 488f442458                     pop        qword ptr [rsp + 0x58]
0304e 48894424f8                     mov        qword ptr [rsp - 8], rax
03053 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03057 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0305b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03060 48894424f8                     mov        qword ptr [rsp - 8], rax
03065 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03069 89442460                       mov        dword ptr [rsp + 0x60], eax
0306d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03072 48894424f8                     mov        qword ptr [rsp - 8], rax
03077 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0307b 89442464                       mov        dword ptr [rsp + 0x64], eax
0307f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03084 4489742470                     mov        dword ptr [rsp + 0x70], r14d
03089 48894424f8                     mov        qword ptr [rsp - 8], rax
0308e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
03095 89442474                       mov        dword ptr [rsp + 0x74], eax
03099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0309e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
030a6 6690                           nop        
030a8 c5f877                         vzeroupper 
030ab e8b0cbb4ff                     call       0x7f4c1b9d7d60
030b0 0f1f8400a8310024               nop        dword ptr [rax + rax + 0x240031a8]
030b8 be6effffff                     mov        esi, 0xffffff6e
030bd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
030c2 48894424f8                     mov        qword ptr [rsp - 8], rax
030c7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
030cb 89442408                       mov        dword ptr [rsp + 8], eax
030cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030d4 48ff742420                     push       qword ptr [rsp + 0x20]
030d9 488f442418                     pop        qword ptr [rsp + 0x18]
030de 48894424f8                     mov        qword ptr [rsp - 8], rax
030e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
030e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
030eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030f0 48894424f8                     mov        qword ptr [rsp - 8], rax
030f5 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
030f9 89442434                       mov        dword ptr [rsp + 0x34], eax
030fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03102 48894424f8                     mov        qword ptr [rsp - 8], rax
03107 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0310b 89442438                       mov        dword ptr [rsp + 0x38], eax
0310f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03114 48ff742450                     push       qword ptr [rsp + 0x50]
03119 488f442440                     pop        qword ptr [rsp + 0x40]
0311e 48894424f8                     mov        qword ptr [rsp - 8], rax
03123 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
03127 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0312b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03130 48ff742458                     push       qword ptr [rsp + 0x58]
03135 488f442448                     pop        qword ptr [rsp + 0x48]
0313a 48ff742460                     push       qword ptr [rsp + 0x60]
0313f 488f442450                     pop        qword ptr [rsp + 0x50]
03144 48894424f8                     mov        qword ptr [rsp - 8], rax
03149 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0314d 89442458                       mov        dword ptr [rsp + 0x58], eax
03151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03156 48894424f8                     mov        qword ptr [rsp - 8], rax
0315b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0315f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03168 48894424f8                     mov        qword ptr [rsp - 8], rax
0316d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03171 89442460                       mov        dword ptr [rsp + 0x60], eax
03175 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0317a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0317f 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
03183 8954247c                       mov        dword ptr [rsp + 0x7c], edx
03187 90                             nop        
03188 c5f877                         vzeroupper 
0318b e8d0cab4ff                     call       0x7f4c1b9d7d60
03190 0f1f840088320025               nop        dword ptr [rax + rax + 0x25003288]
03198 be45ffffff                     mov        esi, 0xffffff45
0319d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
031a2 48894424f8                     mov        qword ptr [rsp - 8], rax
031a7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
031ab 89442408                       mov        dword ptr [rsp + 8], eax
031af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031b4 48ff742420                     push       qword ptr [rsp + 0x20]
031b9 488f442418                     pop        qword ptr [rsp + 0x18]
031be 48894424f8                     mov        qword ptr [rsp - 8], rax
031c3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
031c7 8944240c                       mov        dword ptr [rsp + 0xc], eax
031cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031d0 48894424f8                     mov        qword ptr [rsp - 8], rax
031d5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
031d9 89442438                       mov        dword ptr [rsp + 0x38], eax
031dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031e2 48ff742450                     push       qword ptr [rsp + 0x50]
031e7 488f442440                     pop        qword ptr [rsp + 0x40]
031ec 48894424f8                     mov        qword ptr [rsp - 8], rax
031f1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
031f5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
031f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031fe 48ff742458                     push       qword ptr [rsp + 0x58]
03203 488f442448                     pop        qword ptr [rsp + 0x48]
03208 48ff742460                     push       qword ptr [rsp + 0x60]
0320d 488f442450                     pop        qword ptr [rsp + 0x50]
03212 48894424f8                     mov        qword ptr [rsp - 8], rax
03217 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0321b 89442458                       mov        dword ptr [rsp + 0x58], eax
0321f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03224 48894424f8                     mov        qword ptr [rsp - 8], rax
03229 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0322d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03231 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03236 48894424f8                     mov        qword ptr [rsp - 8], rax
0323b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0323f 89442460                       mov        dword ptr [rsp + 0x60], eax
03243 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03248 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0324d 89542478                       mov        dword ptr [rsp + 0x78], edx
03251 666690                         nop        
03254 c5f877                         vzeroupper 
03257 e804cab4ff                     call       0x7f4c1b9d7d60
0325c 0f1f840054330026               nop        dword ptr [rax + rax + 0x26003354]
03264 be3dffffff                     mov        esi, 0xffffff3d
03269 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0326e 48894424f8                     mov        qword ptr [rsp - 8], rax
03273 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03277 89442408                       mov        dword ptr [rsp + 8], eax
0327b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03280 48ff742420                     push       qword ptr [rsp + 0x20]
03285 488f442418                     pop        qword ptr [rsp + 0x18]
0328a 48894424f8                     mov        qword ptr [rsp - 8], rax
0328f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03293 8944240c                       mov        dword ptr [rsp + 0xc], eax
03297 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0329c 48894424f8                     mov        qword ptr [rsp - 8], rax
032a1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
032a5 89442438                       mov        dword ptr [rsp + 0x38], eax
032a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ae 48ff742450                     push       qword ptr [rsp + 0x50]
032b3 488f442440                     pop        qword ptr [rsp + 0x40]
032b8 48894424f8                     mov        qword ptr [rsp - 8], rax
032bd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
032c1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
032c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ca 48ff742458                     push       qword ptr [rsp + 0x58]
032cf 488f442448                     pop        qword ptr [rsp + 0x48]
032d4 48ff742460                     push       qword ptr [rsp + 0x60]
032d9 488f442450                     pop        qword ptr [rsp + 0x50]
032de 48894424f8                     mov        qword ptr [rsp - 8], rax
032e3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
032e7 89442458                       mov        dword ptr [rsp + 0x58], eax
032eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032f0 48894424f8                     mov        qword ptr [rsp - 8], rax
032f5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
032f9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
032fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03302 48894424f8                     mov        qword ptr [rsp - 8], rax
03307 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0330b 89442460                       mov        dword ptr [rsp + 0x60], eax
0330f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03314 4489742464                     mov        dword ptr [rsp + 0x64], r14d
03319 89542478                       mov        dword ptr [rsp + 0x78], edx
0331d 666690                         nop        
03320 c5f877                         vzeroupper 
03323 e838c9b4ff                     call       0x7f4c1b9d7d60
03328 0f1f840020340027               nop        dword ptr [rax + rax + 0x27003420]
03330 bee4ffffff                     mov        esi, 0xffffffe4
03335 48ff742418                     push       qword ptr [rsp + 0x18]
0333a 488f0424                       pop        qword ptr [rsp]
0333e 48ffb42480000000               push       qword ptr [rsp + 0x80]
03346 488f442408                     pop        qword ptr [rsp + 8]
0334b 48894424f8                     mov        qword ptr [rsp - 8], rax
03350 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03354 89442414                       mov        dword ptr [rsp + 0x14], eax
03358 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0335d 48894424f8                     mov        qword ptr [rsp - 8], rax
03362 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03366 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0336a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0336f 48ff742450                     push       qword ptr [rsp + 0x50]
03374 488f442440                     pop        qword ptr [rsp + 0x40]
03379 48ff742458                     push       qword ptr [rsp + 0x58]
0337e 488f442450                     pop        qword ptr [rsp + 0x50]
03383 48ff742460                     push       qword ptr [rsp + 0x60]
03388 488f442458                     pop        qword ptr [rsp + 0x58]
0338d 48894424f8                     mov        qword ptr [rsp - 8], rax
03392 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03396 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0339a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0339f 48894424f8                     mov        qword ptr [rsp - 8], rax
033a4 8b442478                       mov        eax, dword ptr [rsp + 0x78]
033a8 89442460                       mov        dword ptr [rsp + 0x60], eax
033ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033b1 48894424f8                     mov        qword ptr [rsp - 8], rax
033b6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
033ba 89442464                       mov        dword ptr [rsp + 0x64], eax
033be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033c3 4489742468                     mov        dword ptr [rsp + 0x68], r14d
033c8 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
033d0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
033d8 c5f877                         vzeroupper 
033db e880c8b4ff                     call       0x7f4c1b9d7d60
033e0 0f1f8400d8340028               nop        dword ptr [rax + rax + 0x280034d8]
033e8 bee4ffffff                     mov        esi, 0xffffffe4
033ed 48ff742418                     push       qword ptr [rsp + 0x18]
033f2 488f0424                       pop        qword ptr [rsp]
033f6 48894424f8                     mov        qword ptr [rsp - 8], rax
033fb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
033ff 89442414                       mov        dword ptr [rsp + 0x14], eax
03403 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03408 48894424f8                     mov        qword ptr [rsp - 8], rax
0340d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03411 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0341a 48ff742450                     push       qword ptr [rsp + 0x50]
0341f 488f442440                     pop        qword ptr [rsp + 0x40]
03424 48ff742458                     push       qword ptr [rsp + 0x58]
03429 488f442450                     pop        qword ptr [rsp + 0x50]
0342e 48ff742460                     push       qword ptr [rsp + 0x60]
03433 488f442458                     pop        qword ptr [rsp + 0x58]
03438 48894424f8                     mov        qword ptr [rsp - 8], rax
0343d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03441 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03445 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0344a 48894424f8                     mov        qword ptr [rsp - 8], rax
0344f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03453 89442460                       mov        dword ptr [rsp + 0x60], eax
03457 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0345c 48894424f8                     mov        qword ptr [rsp - 8], rax
03461 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03465 89442464                       mov        dword ptr [rsp + 0x64], eax
03469 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0346e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03473 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
03478 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0347d 666690                         nop        
03480 c5f877                         vzeroupper 
03483 e8d8c7b4ff                     call       0x7f4c1b9d7d60
03488 0f1f840080350029               nop        dword ptr [rax + rax + 0x29003580]
03490 beccffffff                     mov        esi, 0xffffffcc
03495 48ff742418                     push       qword ptr [rsp + 0x18]
0349a 488f0424                       pop        qword ptr [rsp]
0349e 48ffb42480000000               push       qword ptr [rsp + 0x80]
034a6 488f442408                     pop        qword ptr [rsp + 8]
034ab 48894424f8                     mov        qword ptr [rsp - 8], rax
034b0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
034b4 89442414                       mov        dword ptr [rsp + 0x14], eax
034b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034bd 48894424f8                     mov        qword ptr [rsp - 8], rax
034c2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
034c6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
034ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034cf 48ff742450                     push       qword ptr [rsp + 0x50]
034d4 488f442440                     pop        qword ptr [rsp + 0x40]
034d9 48ff742458                     push       qword ptr [rsp + 0x58]
034de 488f442450                     pop        qword ptr [rsp + 0x50]
034e3 48ff742460                     push       qword ptr [rsp + 0x60]
034e8 488f442458                     pop        qword ptr [rsp + 0x58]
034ed 48894424f8                     mov        qword ptr [rsp - 8], rax
034f2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
034f6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
034fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034ff 48894424f8                     mov        qword ptr [rsp - 8], rax
03504 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03508 89442460                       mov        dword ptr [rsp + 0x60], eax
0350c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03511 48894424f8                     mov        qword ptr [rsp - 8], rax
03516 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0351a 89442464                       mov        dword ptr [rsp + 0x64], eax
0351e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03523 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03528 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
03530 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
03538 c5f877                         vzeroupper 
0353b e820c7b4ff                     call       0x7f4c1b9d7d60
03540 0f1f84003836002a               nop        dword ptr [rax + rax + 0x2a003638]
03548 beccffffff                     mov        esi, 0xffffffcc
0354d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03552 48ffb42480000000               push       qword ptr [rsp + 0x80]
0355a 488f0424                       pop        qword ptr [rsp]
0355e 48894424f8                     mov        qword ptr [rsp - 8], rax
03563 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03567 89442408                       mov        dword ptr [rsp + 8], eax
0356b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03570 48ff742420                     push       qword ptr [rsp + 0x20]
03575 488f442418                     pop        qword ptr [rsp + 0x18]
0357a 48894424f8                     mov        qword ptr [rsp - 8], rax
0357f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03583 8944240c                       mov        dword ptr [rsp + 0xc], eax
03587 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0358c 48894424f8                     mov        qword ptr [rsp - 8], rax
03591 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03595 89442434                       mov        dword ptr [rsp + 0x34], eax
03599 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0359e 48ff742450                     push       qword ptr [rsp + 0x50]
035a3 488f442438                     pop        qword ptr [rsp + 0x38]
035a8 48894424f8                     mov        qword ptr [rsp - 8], rax
035ad 8b442448                       mov        eax, dword ptr [rsp + 0x48]
035b1 89442440                       mov        dword ptr [rsp + 0x40], eax
035b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035ba 48ff742458                     push       qword ptr [rsp + 0x58]
035bf 488f442448                     pop        qword ptr [rsp + 0x48]
035c4 48ff742460                     push       qword ptr [rsp + 0x60]
035c9 488f442450                     pop        qword ptr [rsp + 0x50]
035ce 48894424f8                     mov        qword ptr [rsp - 8], rax
035d3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
035d7 89442444                       mov        dword ptr [rsp + 0x44], eax
035db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035e0 48894424f8                     mov        qword ptr [rsp - 8], rax
035e5 8b442478                       mov        eax, dword ptr [rsp + 0x78]
035e9 89442458                       mov        dword ptr [rsp + 0x58], eax
035ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035f2 48894424f8                     mov        qword ptr [rsp - 8], rax
035f7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
035fb 8944245c                       mov        dword ptr [rsp + 0x5c], eax
035ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03604 48894424f8                     mov        qword ptr [rsp - 8], rax
03609 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
03610 8944246c                       mov        dword ptr [rsp + 0x6c], eax
03614 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03619 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0361d 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
03625 666690                         nop        
03628 c5f877                         vzeroupper 
0362b e830c6b4ff                     call       0x7f4c1b9d7d60
03630 0f1f84002837002b               nop        dword ptr [rax + rax + 0x2b003728]
03638 be85ffffff                     mov        esi, 0xffffff85
0363d 48894424f8                     mov        qword ptr [rsp - 8], rax
03642 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03646 890424                         mov        dword ptr [rsp], eax
03649 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0364e 48894424f8                     mov        qword ptr [rsp - 8], rax
03653 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03657 89442404                       mov        dword ptr [rsp + 4], eax
0365b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03660 48894424f8                     mov        qword ptr [rsp - 8], rax
03665 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03669 89442418                       mov        dword ptr [rsp + 0x18], eax
0366d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03672 48ff742450                     push       qword ptr [rsp + 0x50]
03677 488f442420                     pop        qword ptr [rsp + 0x20]
0367c 48ff742458                     push       qword ptr [rsp + 0x58]
03681 488f442428                     pop        qword ptr [rsp + 0x28]
03686 48ff742460                     push       qword ptr [rsp + 0x60]
0368b 488f442430                     pop        qword ptr [rsp + 0x30]
03690 48895c2450                     mov        qword ptr [rsp + 0x50], rbx
03695 4c896c2458                     mov        qword ptr [rsp + 0x58], r13
0369a 4c89742460                     mov        qword ptr [rsp + 0x60], r14
0369f 90                             nop        
036a0 c5f877                         vzeroupper 
036a3 e8b8c5b4ff                     call       0x7f4c1b9d7d60
036a8 0f1f8400a037002c               nop        dword ptr [rax + rax + 0x2c0037a0]
036b0 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
036b7 beccffffff                     mov        esi, 0xffffffcc
036bc 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
036c1 895c2414                       mov        dword ptr [rsp + 0x14], ebx
036c5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
036ca 6690                           nop        
036cc c5f877                         vzeroupper 
036cf e88cc5b4ff                     call       0x7f4c1b9d7d60
036d4 0f1f8400cc37002d               nop        dword ptr [rax + rax + 0x2d0037cc]
036dc bee4ffffff                     mov        esi, 0xffffffe4
036e1 48ff742418                     push       qword ptr [rsp + 0x18]
036e6 488f0424                       pop        qword ptr [rsp]
036ea 48894424f8                     mov        qword ptr [rsp - 8], rax
036ef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
036f3 89442414                       mov        dword ptr [rsp + 0x14], eax
036f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
036fc 48894424f8                     mov        qword ptr [rsp - 8], rax
03701 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03705 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03709 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0370e 48ff742450                     push       qword ptr [rsp + 0x50]
03713 488f442440                     pop        qword ptr [rsp + 0x40]
03718 48ff742458                     push       qword ptr [rsp + 0x58]
0371d 488f442450                     pop        qword ptr [rsp + 0x50]
03722 48ff742460                     push       qword ptr [rsp + 0x60]
03727 488f442458                     pop        qword ptr [rsp + 0x58]
0372c 48894424f8                     mov        qword ptr [rsp - 8], rax
03731 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03735 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03739 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0373e 48894424f8                     mov        qword ptr [rsp - 8], rax
03743 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03747 89442460                       mov        dword ptr [rsp + 0x60], eax
0374b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03750 48894424f8                     mov        qword ptr [rsp - 8], rax
03755 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03759 89442464                       mov        dword ptr [rsp + 0x64], eax
0375d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03762 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03767 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0376c 48894424f8                     mov        qword ptr [rsp - 8], rax
03771 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03778 89442478                       mov        dword ptr [rsp + 0x78], eax
0377c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03781 666690                         nop        
03784 c5f877                         vzeroupper 
03787 e8d4c4b4ff                     call       0x7f4c1b9d7d60
0378c 0f1f84008438002e               nop        dword ptr [rax + rax + 0x2e003884]
03794 bee4ffffff                     mov        esi, 0xffffffe4
03799 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0379e 48ffb42480000000               push       qword ptr [rsp + 0x80]
037a6 488f0424                       pop        qword ptr [rsp]
037aa 48894424f8                     mov        qword ptr [rsp - 8], rax
037af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
037b3 89442408                       mov        dword ptr [rsp + 8], eax
037b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037bc 48ffb42490000000               push       qword ptr [rsp + 0x90]
037c4 488f442410                     pop        qword ptr [rsp + 0x10]
037c9 48ff742420                     push       qword ptr [rsp + 0x20]
037ce 488f442418                     pop        qword ptr [rsp + 0x18]
037d3 48894424f8                     mov        qword ptr [rsp - 8], rax
037d8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
037dc 8944240c                       mov        dword ptr [rsp + 0xc], eax
037e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037e5 48ffb42498000000               push       qword ptr [rsp + 0x98]
037ed 488f442420                     pop        qword ptr [rsp + 0x20]
037f2 48894424f8                     mov        qword ptr [rsp - 8], rax
037f7 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
037fb 89442430                       mov        dword ptr [rsp + 0x30], eax
037ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03804 48894424f8                     mov        qword ptr [rsp - 8], rax
03809 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0380d 89442434                       mov        dword ptr [rsp + 0x34], eax
03811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03816 48ff742450                     push       qword ptr [rsp + 0x50]
0381b 488f442438                     pop        qword ptr [rsp + 0x38]
03820 48894424f8                     mov        qword ptr [rsp - 8], rax
03825 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03829 89442440                       mov        dword ptr [rsp + 0x40], eax
0382d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03832 48ff742458                     push       qword ptr [rsp + 0x58]
03837 488f442448                     pop        qword ptr [rsp + 0x48]
0383c 48ff742460                     push       qword ptr [rsp + 0x60]
03841 488f442450                     pop        qword ptr [rsp + 0x50]
03846 48894424f8                     mov        qword ptr [rsp - 8], rax
0384b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0384f 89442444                       mov        dword ptr [rsp + 0x44], eax
03853 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03858 48894424f8                     mov        qword ptr [rsp - 8], rax
0385d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03861 89442458                       mov        dword ptr [rsp + 0x58], eax
03865 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0386a 48894424f8                     mov        qword ptr [rsp - 8], rax
0386f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03873 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0387c 4489742460                     mov        dword ptr [rsp + 0x60], r14d
03881 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03886 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0388e c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
03897 90                             nop        
03898 c5f877                         vzeroupper 
0389b e8c0c3b4ff                     call       0x7f4c1b9d7d60
038a0 0f1f84009839002f               nop        dword ptr [rax + rax + 0x2f003998]
038a8 beccffffff                     mov        esi, 0xffffffcc
038ad 48ff742418                     push       qword ptr [rsp + 0x18]
038b2 488f0424                       pop        qword ptr [rsp]
038b6 48894424f8                     mov        qword ptr [rsp - 8], rax
038bb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
038bf 89442414                       mov        dword ptr [rsp + 0x14], eax
038c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
038c8 48894424f8                     mov        qword ptr [rsp - 8], rax
038cd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
038d1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
038d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
038da 48ff742450                     push       qword ptr [rsp + 0x50]
038df 488f442440                     pop        qword ptr [rsp + 0x40]
038e4 48ff742458                     push       qword ptr [rsp + 0x58]
038e9 488f442450                     pop        qword ptr [rsp + 0x50]
038ee 48ff742460                     push       qword ptr [rsp + 0x60]
038f3 488f442458                     pop        qword ptr [rsp + 0x58]
038f8 48894424f8                     mov        qword ptr [rsp - 8], rax
038fd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03901 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03905 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0390a 48894424f8                     mov        qword ptr [rsp - 8], rax
0390f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03913 89442460                       mov        dword ptr [rsp + 0x60], eax
03917 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0391c 48894424f8                     mov        qword ptr [rsp - 8], rax
03921 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03925 89442464                       mov        dword ptr [rsp + 0x64], eax
03929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0392e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03933 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
03938 48894424f8                     mov        qword ptr [rsp - 8], rax
0393d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03944 89442478                       mov        dword ptr [rsp + 0x78], eax
03948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0394d 666690                         nop        
03950 c5f877                         vzeroupper 
03953 e808c3b4ff                     call       0x7f4c1b9d7d60
03958 0f1f8400503a0030               nop        dword ptr [rax + rax + 0x30003a50]
03960 beccffffff                     mov        esi, 0xffffffcc
03965 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0396a 48894424f8                     mov        qword ptr [rsp - 8], rax
0396f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03973 89442408                       mov        dword ptr [rsp + 8], eax
03977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0397c 48ff742420                     push       qword ptr [rsp + 0x20]
03981 488f442418                     pop        qword ptr [rsp + 0x18]
03986 48894424f8                     mov        qword ptr [rsp - 8], rax
0398b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0398f 8944240c                       mov        dword ptr [rsp + 0xc], eax
03993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03998 48894424f8                     mov        qword ptr [rsp - 8], rax
0399d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
039a1 89442438                       mov        dword ptr [rsp + 0x38], eax
039a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039aa 48ff742450                     push       qword ptr [rsp + 0x50]
039af 488f442440                     pop        qword ptr [rsp + 0x40]
039b4 48894424f8                     mov        qword ptr [rsp - 8], rax
039b9 8b442448                       mov        eax, dword ptr [rsp + 0x48]
039bd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
039c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039c6 48ff742458                     push       qword ptr [rsp + 0x58]
039cb 488f442448                     pop        qword ptr [rsp + 0x48]
039d0 48ff742460                     push       qword ptr [rsp + 0x60]
039d5 488f442450                     pop        qword ptr [rsp + 0x50]
039da 48894424f8                     mov        qword ptr [rsp - 8], rax
039df 8b442474                       mov        eax, dword ptr [rsp + 0x74]
039e3 89442458                       mov        dword ptr [rsp + 0x58], eax
039e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039ec 48894424f8                     mov        qword ptr [rsp - 8], rax
039f1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
039f5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
039f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039fe 48894424f8                     mov        qword ptr [rsp - 8], rax
03a03 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03a07 89442460                       mov        dword ptr [rsp + 0x60], eax
03a0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a10 48ffb42480000000               push       qword ptr [rsp + 0x80]
03a18 488f442470                     pop        qword ptr [rsp + 0x70]
03a1d 48894424f8                     mov        qword ptr [rsp - 8], rax
03a22 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03a26 89442478                       mov        dword ptr [rsp + 0x78], eax
03a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a2f 48894424f8                     mov        qword ptr [rsp - 8], rax
03a34 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03a3b 8944247c                       mov        dword ptr [rsp + 0x7c], eax
03a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a44 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
03a4c c5f877                         vzeroupper 
03a4f e80cc2b4ff                     call       0x7f4c1b9d7d60
03a54 0f1f84004c3b0031               nop        dword ptr [rax + rax + 0x31003b4c]
03a5c beccffffff                     mov        esi, 0xffffffcc
03a61 48ff742418                     push       qword ptr [rsp + 0x18]
03a66 488f0424                       pop        qword ptr [rsp]
03a6a 48ffb42480000000               push       qword ptr [rsp + 0x80]
03a72 488f442408                     pop        qword ptr [rsp + 8]
03a77 48ffb42490000000               push       qword ptr [rsp + 0x90]
03a7f 488f442418                     pop        qword ptr [rsp + 0x18]
03a84 48894424f8                     mov        qword ptr [rsp - 8], rax
03a89 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03a8d 89442414                       mov        dword ptr [rsp + 0x14], eax
03a91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a96 48ffb42498000000               push       qword ptr [rsp + 0x98]
03a9e 488f442428                     pop        qword ptr [rsp + 0x28]
03aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
03aa8 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03aac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03ab0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ab5 48ff742450                     push       qword ptr [rsp + 0x50]
03aba 488f442440                     pop        qword ptr [rsp + 0x40]
03abf 48ff742458                     push       qword ptr [rsp + 0x58]
03ac4 488f442450                     pop        qword ptr [rsp + 0x50]
03ac9 48ff742460                     push       qword ptr [rsp + 0x60]
03ace 488f442458                     pop        qword ptr [rsp + 0x58]
03ad3 48894424f8                     mov        qword ptr [rsp - 8], rax
03ad8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03adc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03ae0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ae5 48894424f8                     mov        qword ptr [rsp - 8], rax
03aea 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03aee 89442460                       mov        dword ptr [rsp + 0x60], eax
03af2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03af7 48894424f8                     mov        qword ptr [rsp - 8], rax
03afc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03b00 89442464                       mov        dword ptr [rsp + 0x64], eax
03b04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b09 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03b0e 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
03b13 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
03b1c c5f877                         vzeroupper 
03b1f e83cc1b4ff                     call       0x7f4c1b9d7d60
03b24 0f1f84001c3c0032               nop        dword ptr [rax + rax + 0x32003c1c]
03b2c 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
03b30 83c510                         add        ebp, 0x10
03b33 be6effffff                     mov        esi, 0xffffff6e
03b38 48ff742418                     push       qword ptr [rsp + 0x18]
03b3d 488f0424                       pop        qword ptr [rsp]
03b41 48ffb42480000000               push       qword ptr [rsp + 0x80]
03b49 488f442408                     pop        qword ptr [rsp + 8]
03b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
03b53 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03b57 89442414                       mov        dword ptr [rsp + 0x14], eax
03b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b60 48894424f8                     mov        qword ptr [rsp - 8], rax
03b65 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03b69 89442438                       mov        dword ptr [rsp + 0x38], eax
03b6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b72 48894424f8                     mov        qword ptr [rsp - 8], rax
03b77 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03b7b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03b7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b84 48ff742450                     push       qword ptr [rsp + 0x50]
03b89 488f442440                     pop        qword ptr [rsp + 0x40]
03b8e 48ff742458                     push       qword ptr [rsp + 0x58]
03b93 488f442450                     pop        qword ptr [rsp + 0x50]
03b98 48ff742460                     push       qword ptr [rsp + 0x60]
03b9d 488f442458                     pop        qword ptr [rsp + 0x58]
03ba2 48894424f8                     mov        qword ptr [rsp - 8], rax
03ba7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03bab 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03baf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03bb4 48894424f8                     mov        qword ptr [rsp - 8], rax
03bb9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03bbd 89442460                       mov        dword ptr [rsp + 0x60], eax
03bc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03bc6 48894424f8                     mov        qword ptr [rsp - 8], rax
03bcb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03bcf 89442464                       mov        dword ptr [rsp + 0x64], eax
03bd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03bd8 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03bdd 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
03be2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
03bea 6690                           nop        
03bec c5f877                         vzeroupper 
03bef e86cc0b4ff                     call       0x7f4c1b9d7d60
03bf4 0f1f8400ec3c0033               nop        dword ptr [rax + rax + 0x33003cec]
03bfc 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
03c00 83c510                         add        ebp, 0x10
03c03 be66ffffff                     mov        esi, 0xffffff66
03c08 48ff742418                     push       qword ptr [rsp + 0x18]
03c0d 488f0424                       pop        qword ptr [rsp]
03c11 48ffb42480000000               push       qword ptr [rsp + 0x80]
03c19 488f442408                     pop        qword ptr [rsp + 8]
03c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
03c23 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03c27 89442414                       mov        dword ptr [rsp + 0x14], eax
03c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c30 48894424f8                     mov        qword ptr [rsp - 8], rax
03c35 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03c39 89442438                       mov        dword ptr [rsp + 0x38], eax
03c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c42 48894424f8                     mov        qword ptr [rsp - 8], rax
03c47 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03c4b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c54 48ff742450                     push       qword ptr [rsp + 0x50]
03c59 488f442440                     pop        qword ptr [rsp + 0x40]
03c5e 48ff742458                     push       qword ptr [rsp + 0x58]
03c63 488f442450                     pop        qword ptr [rsp + 0x50]
03c68 48ff742460                     push       qword ptr [rsp + 0x60]
03c6d 488f442458                     pop        qword ptr [rsp + 0x58]
03c72 48894424f8                     mov        qword ptr [rsp - 8], rax
03c77 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03c7b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c84 48894424f8                     mov        qword ptr [rsp - 8], rax
03c89 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03c8d 89442460                       mov        dword ptr [rsp + 0x60], eax
03c91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c96 48894424f8                     mov        qword ptr [rsp - 8], rax
03c9b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03c9f 89442464                       mov        dword ptr [rsp + 0x64], eax
03ca3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ca8 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03cad 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
03cb2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
03cba 6690                           nop        
03cbc c5f877                         vzeroupper 
03cbf e89cbfb4ff                     call       0x7f4c1b9d7d60
03cc4 0f1f8400bc3d0034               nop        dword ptr [rax + rax + 0x34003dbc]
03ccc bee4ffffff                     mov        esi, 0xffffffe4
03cd1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03cd6 48ffb42480000000               push       qword ptr [rsp + 0x80]
03cde 488f0424                       pop        qword ptr [rsp]
03ce2 48894424f8                     mov        qword ptr [rsp - 8], rax
03ce7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03ceb 89442408                       mov        dword ptr [rsp + 8], eax
03cef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03cf4 48ff742420                     push       qword ptr [rsp + 0x20]
03cf9 488f442418                     pop        qword ptr [rsp + 0x18]
03cfe 48894424f8                     mov        qword ptr [rsp - 8], rax
03d03 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03d07 8944240c                       mov        dword ptr [rsp + 0xc], eax
03d0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d10 48894424f8                     mov        qword ptr [rsp - 8], rax
03d15 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03d19 89442434                       mov        dword ptr [rsp + 0x34], eax
03d1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d22 48ff742450                     push       qword ptr [rsp + 0x50]
03d27 488f442438                     pop        qword ptr [rsp + 0x38]
03d2c 48894424f8                     mov        qword ptr [rsp - 8], rax
03d31 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03d35 89442440                       mov        dword ptr [rsp + 0x40], eax
03d39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d3e 48ff742458                     push       qword ptr [rsp + 0x58]
03d43 488f442448                     pop        qword ptr [rsp + 0x48]
03d48 48ff742460                     push       qword ptr [rsp + 0x60]
03d4d 488f442450                     pop        qword ptr [rsp + 0x50]
03d52 48894424f8                     mov        qword ptr [rsp - 8], rax
03d57 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03d5b 89442444                       mov        dword ptr [rsp + 0x44], eax
03d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d64 48894424f8                     mov        qword ptr [rsp - 8], rax
03d69 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03d6d 89442458                       mov        dword ptr [rsp + 0x58], eax
03d71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d76 48894424f8                     mov        qword ptr [rsp - 8], rax
03d7b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03d7f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03d83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d88 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03d8d 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
03d94 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
03d9c c5f877                         vzeroupper 
03d9f e8bcbeb4ff                     call       0x7f4c1b9d7d60
03da4 0f1f84009c3e0035               nop        dword ptr [rax + rax + 0x35003e9c]
03dac bee4ffffff                     mov        esi, 0xffffffe4
03db1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03db6 48ffb42480000000               push       qword ptr [rsp + 0x80]
03dbe 488f0424                       pop        qword ptr [rsp]
03dc2 48894424f8                     mov        qword ptr [rsp - 8], rax
03dc7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03dcb 89442408                       mov        dword ptr [rsp + 8], eax
03dcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03dd4 48ff742420                     push       qword ptr [rsp + 0x20]
03dd9 488f442418                     pop        qword ptr [rsp + 0x18]
03dde 48894424f8                     mov        qword ptr [rsp - 8], rax
03de3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03de7 8944240c                       mov        dword ptr [rsp + 0xc], eax
03deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03df0 48894424f8                     mov        qword ptr [rsp - 8], rax
03df5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03df9 89442434                       mov        dword ptr [rsp + 0x34], eax
03dfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e02 48ff742450                     push       qword ptr [rsp + 0x50]
03e07 488f442438                     pop        qword ptr [rsp + 0x38]
03e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
03e11 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03e15 89442440                       mov        dword ptr [rsp + 0x40], eax
03e19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e1e 48ff742458                     push       qword ptr [rsp + 0x58]
03e23 488f442448                     pop        qword ptr [rsp + 0x48]
03e28 48ff742460                     push       qword ptr [rsp + 0x60]
03e2d 488f442450                     pop        qword ptr [rsp + 0x50]
03e32 48894424f8                     mov        qword ptr [rsp - 8], rax
03e37 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03e3b 89442444                       mov        dword ptr [rsp + 0x44], eax
03e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e44 48894424f8                     mov        qword ptr [rsp - 8], rax
03e49 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03e4d 89442458                       mov        dword ptr [rsp + 0x58], eax
03e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e56 48894424f8                     mov        qword ptr [rsp - 8], rax
03e5b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03e5f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e68 4489742470                     mov        dword ptr [rsp + 0x70], r14d
03e6d 89442474                       mov        dword ptr [rsp + 0x74], eax
03e71 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
03e76 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
03e7e 6690                           nop        
03e80 c5f877                         vzeroupper 
03e83 e8d8bdb4ff                     call       0x7f4c1b9d7d60
03e88 0f1f8400803f0036               nop        dword ptr [rax + rax + 0x36003f80]
03e90 beccffffff                     mov        esi, 0xffffffcc
03e95 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03e9a 48ffb42480000000               push       qword ptr [rsp + 0x80]
03ea2 488f0424                       pop        qword ptr [rsp]
03ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
03eab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03eaf 89442408                       mov        dword ptr [rsp + 8], eax
03eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03eb8 48ff742420                     push       qword ptr [rsp + 0x20]
03ebd 488f442418                     pop        qword ptr [rsp + 0x18]
03ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
03ec7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03ecb 8944240c                       mov        dword ptr [rsp + 0xc], eax
03ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
03ed9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03edd 89442434                       mov        dword ptr [rsp + 0x34], eax
03ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ee6 48ff742450                     push       qword ptr [rsp + 0x50]
03eeb 488f442438                     pop        qword ptr [rsp + 0x38]
03ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
03ef5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03ef9 89442440                       mov        dword ptr [rsp + 0x40], eax
03efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f02 48ff742458                     push       qword ptr [rsp + 0x58]
03f07 488f442448                     pop        qword ptr [rsp + 0x48]
03f0c 48ff742460                     push       qword ptr [rsp + 0x60]
03f11 488f442450                     pop        qword ptr [rsp + 0x50]
03f16 48894424f8                     mov        qword ptr [rsp - 8], rax
03f1b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03f1f 89442444                       mov        dword ptr [rsp + 0x44], eax
03f23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f28 48894424f8                     mov        qword ptr [rsp - 8], rax
03f2d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03f31 89442458                       mov        dword ptr [rsp + 0x58], eax
03f35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f3a 48894424f8                     mov        qword ptr [rsp - 8], rax
03f3f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03f43 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03f47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f4c 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03f51 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
03f58 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
03f60 c5f877                         vzeroupper 
03f63 e8f8bcb4ff                     call       0x7f4c1b9d7d60
03f68 0f1f840060400037               nop        dword ptr [rax + rax + 0x37004060]
03f70 448bd8                         mov        r11d, eax
03f73 458d5308                       lea        r10d, [r11 + 8]
03f77 be6effffff                     mov        esi, 0xffffff6e
03f7c 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03f81 48894424f8                     mov        qword ptr [rsp - 8], rax
03f86 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03f8a 89442408                       mov        dword ptr [rsp + 8], eax
03f8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f93 48ff742420                     push       qword ptr [rsp + 0x20]
03f98 488f442418                     pop        qword ptr [rsp + 0x18]
03f9d 48894424f8                     mov        qword ptr [rsp - 8], rax
03fa2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03fa6 8944240c                       mov        dword ptr [rsp + 0xc], eax
03faa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03faf 48894424f8                     mov        qword ptr [rsp - 8], rax
03fb4 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03fb8 89442434                       mov        dword ptr [rsp + 0x34], eax
03fbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03fc1 48ff742450                     push       qword ptr [rsp + 0x50]
03fc6 488f442438                     pop        qword ptr [rsp + 0x38]
03fcb 48894424f8                     mov        qword ptr [rsp - 8], rax
03fd0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03fd4 89442440                       mov        dword ptr [rsp + 0x40], eax
03fd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03fdd 48ff742458                     push       qword ptr [rsp + 0x58]
03fe2 488f442448                     pop        qword ptr [rsp + 0x48]
03fe7 48ff742460                     push       qword ptr [rsp + 0x60]
03fec 488f442450                     pop        qword ptr [rsp + 0x50]
03ff1 48894424f8                     mov        qword ptr [rsp - 8], rax
03ff6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03ffa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03ffe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04003 48894424f8                     mov        qword ptr [rsp - 8], rax
04008 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0400f 89442460                       mov        dword ptr [rsp + 0x60], eax
04013 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04018 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0401d 666690                         nop        
04020 c5f877                         vzeroupper 
04023 e838bcb4ff                     call       0x7f4c1b9d7d60
04028 0f1f840020410038               nop        dword ptr [rax + rax + 0x38004120]
04030 448bd8                         mov        r11d, eax
04033 458d5308                       lea        r10d, [r11 + 8]
04037 be66ffffff                     mov        esi, 0xffffff66
0403c 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
04041 48894424f8                     mov        qword ptr [rsp - 8], rax
04046 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0404a 89442408                       mov        dword ptr [rsp + 8], eax
0404e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04053 48ff742420                     push       qword ptr [rsp + 0x20]
04058 488f442418                     pop        qword ptr [rsp + 0x18]
0405d 48894424f8                     mov        qword ptr [rsp - 8], rax
04062 8b442428                       mov        eax, dword ptr [rsp + 0x28]
04066 8944240c                       mov        dword ptr [rsp + 0xc], eax
0406a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0406f 48894424f8                     mov        qword ptr [rsp - 8], rax
04074 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04078 89442434                       mov        dword ptr [rsp + 0x34], eax
0407c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04081 48ff742450                     push       qword ptr [rsp + 0x50]
04086 488f442438                     pop        qword ptr [rsp + 0x38]
0408b 48894424f8                     mov        qword ptr [rsp - 8], rax
04090 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04094 89442440                       mov        dword ptr [rsp + 0x40], eax
04098 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0409d 48ff742458                     push       qword ptr [rsp + 0x58]
040a2 488f442448                     pop        qword ptr [rsp + 0x48]
040a7 48ff742460                     push       qword ptr [rsp + 0x60]
040ac 488f442450                     pop        qword ptr [rsp + 0x50]
040b1 48894424f8                     mov        qword ptr [rsp - 8], rax
040b6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
040ba 8944245c                       mov        dword ptr [rsp + 0x5c], eax
040be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
040c3 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
040c8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
040cd 666690                         nop        
040d0 c5f877                         vzeroupper 
040d3 e888bbb4ff                     call       0x7f4c1b9d7d60
040d8 0f1f8400d0410039               nop        dword ptr [rax + rax + 0x390041d0]
040e0 4c898424a0000000               mov        qword ptr [rsp + 0xa0], r8
040e8 e950d0ffff                     jmp        0x7f4c1be8923d
040ed bee4ffffff                     mov        esi, 0xffffffe4
040f2 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
040f7 48894424f8                     mov        qword ptr [rsp - 8], rax
040fc 8b442410                       mov        eax, dword ptr [rsp + 0x10]
04100 89442408                       mov        dword ptr [rsp + 8], eax
04104 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04109 48ff742420                     push       qword ptr [rsp + 0x20]
0410e 488f442418                     pop        qword ptr [rsp + 0x18]
04113 48894424f8                     mov        qword ptr [rsp - 8], rax
04118 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0411c 8944240c                       mov        dword ptr [rsp + 0xc], eax
04120 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04125 48894424f8                     mov        qword ptr [rsp - 8], rax
0412a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0412e 89442434                       mov        dword ptr [rsp + 0x34], eax
04132 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04137 48ff742450                     push       qword ptr [rsp + 0x50]
0413c 488f442438                     pop        qword ptr [rsp + 0x38]
04141 48894424f8                     mov        qword ptr [rsp - 8], rax
04146 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0414a 89442440                       mov        dword ptr [rsp + 0x40], eax
0414e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04153 48ff742458                     push       qword ptr [rsp + 0x58]
04158 488f442448                     pop        qword ptr [rsp + 0x48]
0415d 48ff742460                     push       qword ptr [rsp + 0x60]
04162 488f442450                     pop        qword ptr [rsp + 0x50]
04167 48894424f8                     mov        qword ptr [rsp - 8], rax
0416c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
04170 89442444                       mov        dword ptr [rsp + 0x44], eax
04174 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04179 48894424f8                     mov        qword ptr [rsp - 8], rax
0417e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
04182 89442458                       mov        dword ptr [rsp + 0x58], eax
04186 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0418b 48894424f8                     mov        qword ptr [rsp - 8], rax
04190 8b442470                       mov        eax, dword ptr [rsp + 0x70]
04194 8944245c                       mov        dword ptr [rsp + 0x5c], eax
04198 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0419d 4489742464                     mov        dword ptr [rsp + 0x64], r14d
041a2 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
041a6 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
041ab 90                             nop        
041ac c5f877                         vzeroupper 
041af e8acbab4ff                     call       0x7f4c1b9d7d60
041b4 0f1f8400ac42003a               nop        dword ptr [rax + rax + 0x3a0042ac]
041bc bee4ffffff                     mov        esi, 0xffffffe4
041c1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
041c6 48ffb42480000000               push       qword ptr [rsp + 0x80]
041ce 488f0424                       pop        qword ptr [rsp]
041d2 48894424f8                     mov        qword ptr [rsp - 8], rax
041d7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
041db 89442408                       mov        dword ptr [rsp + 8], eax
041df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
041e4 48ff742420                     push       qword ptr [rsp + 0x20]
041e9 488f442418                     pop        qword ptr [rsp + 0x18]
041ee 48894424f8                     mov        qword ptr [rsp - 8], rax
041f3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
041f7 8944240c                       mov        dword ptr [rsp + 0xc], eax
041fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04200 48894424f8                     mov        qword ptr [rsp - 8], rax
04205 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04209 89442434                       mov        dword ptr [rsp + 0x34], eax
0420d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04212 48ff742450                     push       qword ptr [rsp + 0x50]
04217 488f442438                     pop        qword ptr [rsp + 0x38]
0421c 48894424f8                     mov        qword ptr [rsp - 8], rax
04221 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04225 89442440                       mov        dword ptr [rsp + 0x40], eax
04229 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0422e 48ff742458                     push       qword ptr [rsp + 0x58]
04233 488f442448                     pop        qword ptr [rsp + 0x48]
04238 48ff742460                     push       qword ptr [rsp + 0x60]
0423d 488f442450                     pop        qword ptr [rsp + 0x50]
04242 48894424f8                     mov        qword ptr [rsp - 8], rax
04247 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0424b 89442444                       mov        dword ptr [rsp + 0x44], eax
0424f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04254 48894424f8                     mov        qword ptr [rsp - 8], rax
04259 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0425d 89442458                       mov        dword ptr [rsp + 0x58], eax
04261 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04266 48894424f8                     mov        qword ptr [rsp - 8], rax
0426b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0426f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
04273 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04278 48894424f8                     mov        qword ptr [rsp - 8], rax
0427d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
04284 89442460                       mov        dword ptr [rsp + 0x60], eax
04288 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0428d 895c2468                       mov        dword ptr [rsp + 0x68], ebx
04291 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
04296 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0429b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
042a4 c5f877                         vzeroupper 
042a7 e8b4b9b4ff                     call       0x7f4c1b9d7d60
042ac 0f1f8400a443003b               nop        dword ptr [rax + rax + 0x3b0043a4]
042b4 beccffffff                     mov        esi, 0xffffffcc
042b9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
042be 48894424f8                     mov        qword ptr [rsp - 8], rax
042c3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
042c7 89442408                       mov        dword ptr [rsp + 8], eax
042cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042d0 48ff742420                     push       qword ptr [rsp + 0x20]
042d5 488f442418                     pop        qword ptr [rsp + 0x18]
042da 48894424f8                     mov        qword ptr [rsp - 8], rax
042df 8b442428                       mov        eax, dword ptr [rsp + 0x28]
042e3 8944240c                       mov        dword ptr [rsp + 0xc], eax
042e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042ec 48894424f8                     mov        qword ptr [rsp - 8], rax
042f1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
042f5 89442434                       mov        dword ptr [rsp + 0x34], eax
042f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042fe 48ff742450                     push       qword ptr [rsp + 0x50]
04303 488f442438                     pop        qword ptr [rsp + 0x38]
04308 48894424f8                     mov        qword ptr [rsp - 8], rax
0430d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04311 89442440                       mov        dword ptr [rsp + 0x40], eax
04315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0431a 48ff742458                     push       qword ptr [rsp + 0x58]
0431f 488f442448                     pop        qword ptr [rsp + 0x48]
04324 48ff742460                     push       qword ptr [rsp + 0x60]
04329 488f442450                     pop        qword ptr [rsp + 0x50]
0432e 48894424f8                     mov        qword ptr [rsp - 8], rax
04333 8b442474                       mov        eax, dword ptr [rsp + 0x74]
04337 89442444                       mov        dword ptr [rsp + 0x44], eax
0433b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04340 48894424f8                     mov        qword ptr [rsp - 8], rax
04345 8b442478                       mov        eax, dword ptr [rsp + 0x78]
04349 89442458                       mov        dword ptr [rsp + 0x58], eax
0434d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04352 48894424f8                     mov        qword ptr [rsp - 8], rax
04357 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0435b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0435f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04364 4489742464                     mov        dword ptr [rsp + 0x64], r14d
04369 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0436d 4489542478                     mov        dword ptr [rsp + 0x78], r10d
04372 6690                           nop        
04374 c5f877                         vzeroupper 
04377 e8e4b8b4ff                     call       0x7f4c1b9d7d60
0437c 0f1f84007444003c               nop        dword ptr [rax + rax + 0x3c004474]
04384 83c310                         add        ebx, 0x10
04387 be6effffff                     mov        esi, 0xffffff6e
0438c 48ff742418                     push       qword ptr [rsp + 0x18]
04391 488f0424                       pop        qword ptr [rsp]
04395 48894424f8                     mov        qword ptr [rsp - 8], rax
0439a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0439e 89442414                       mov        dword ptr [rsp + 0x14], eax
043a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043a7 48894424f8                     mov        qword ptr [rsp - 8], rax
043ac 8b442440                       mov        eax, dword ptr [rsp + 0x40]
043b0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
043b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043b9 48ff742450                     push       qword ptr [rsp + 0x50]
043be 488f442440                     pop        qword ptr [rsp + 0x40]
043c3 48ff742458                     push       qword ptr [rsp + 0x58]
043c8 488f442450                     pop        qword ptr [rsp + 0x50]
043cd 48ff742460                     push       qword ptr [rsp + 0x60]
043d2 488f442458                     pop        qword ptr [rsp + 0x58]
043d7 48894424f8                     mov        qword ptr [rsp - 8], rax
043dc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
043e0 89442464                       mov        dword ptr [rsp + 0x64], eax
043e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043e9 48894424f8                     mov        qword ptr [rsp - 8], rax
043ee 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
043f5 89442468                       mov        dword ptr [rsp + 0x68], eax
043f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043fe 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
04402 6690                           nop        
04404 c5f877                         vzeroupper 
04407 e854b8b4ff                     call       0x7f4c1b9d7d60
0440c 0f1f84000445003d               nop        dword ptr [rax + rax + 0x3d004504]
04414 83c310                         add        ebx, 0x10
04417 be66ffffff                     mov        esi, 0xffffff66
0441c 48ff742418                     push       qword ptr [rsp + 0x18]
04421 488f0424                       pop        qword ptr [rsp]
04425 48894424f8                     mov        qword ptr [rsp - 8], rax
0442a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0442e 89442414                       mov        dword ptr [rsp + 0x14], eax
04432 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04437 48894424f8                     mov        qword ptr [rsp - 8], rax
0443c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04440 8944243c                       mov        dword ptr [rsp + 0x3c], eax
04444 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04449 48ff742450                     push       qword ptr [rsp + 0x50]
0444e 488f442440                     pop        qword ptr [rsp + 0x40]
04453 48ff742458                     push       qword ptr [rsp + 0x58]
04458 488f442450                     pop        qword ptr [rsp + 0x50]
0445d 48ff742460                     push       qword ptr [rsp + 0x60]
04462 488f442458                     pop        qword ptr [rsp + 0x58]
04467 48894424f8                     mov        qword ptr [rsp - 8], rax
0446c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
04470 89442464                       mov        dword ptr [rsp + 0x64], eax
04474 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04479 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0447d 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
04482 6690                           nop        
04484 c5f877                         vzeroupper 
04487 e8d4b7b4ff                     call       0x7f4c1b9d7d60
0448c 0f1f84008445003e               nop        dword ptr [rax + rax + 0x3e004584]
04494 4c898424a0000000               mov        qword ptr [rsp + 0xa0], r8
0449c e9c9e1ffff                     jmp        0x7f4c1be8a76a
044a1 bef6ffffff                     mov        esi, 0xfffffff6
044a6 6690                           nop        
044a8 c5f877                         vzeroupper 
044ab e8b0b7b4ff                     call       0x7f4c1b9d7d60
044b0 0f1f8400a845003f               nop        dword ptr [rax + rax + 0x3f0045a8]
044b8 bef6ffffff                     mov        esi, 0xfffffff6
044bd 666690                         nop        
044c0 c5f877                         vzeroupper 
044c3 e898b7b4ff                     call       0x7f4c1b9d7d60
044c8 0f1f8400c0450040               nop        dword ptr [rax + rax + 0x400045c0]
044d0 bef6ffffff                     mov        esi, 0xfffffff6
044d5 666690                         nop        
044d8 c5f877                         vzeroupper 
044db e880b7b4ff                     call       0x7f4c1b9d7d60
044e0 0f1f8400d8450041               nop        dword ptr [rax + rax + 0x410045d8]
044e8 bef6ffffff                     mov        esi, 0xfffffff6
044ed 666690                         nop        
044f0 c5f877                         vzeroupper 
044f3 e868b7b4ff                     call       0x7f4c1b9d7d60
044f8 0f1f8400f0450042               nop        dword ptr [rax + rax + 0x420045f0]
04500 bef6ffffff                     mov        esi, 0xfffffff6
04505 8bea                           mov        ebp, edx
04507 90                             nop        
04508 c5f877                         vzeroupper 
0450b e850b7b4ff                     call       0x7f4c1b9d7d60
04510 0f1f840008460043               nop        dword ptr [rax + rax + 0x43004608]
04518 bef6ffffff                     mov        esi, 0xfffffff6
0451d 666690                         nop        
04520 c5f877                         vzeroupper 
04523 e838b7b4ff                     call       0x7f4c1b9d7d60
04528 0f1f840020460044               nop        dword ptr [rax + rax + 0x44004620]
04530 bef6ffffff                     mov        esi, 0xfffffff6
04535 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0453a 6690                           nop        
0453c c5f877                         vzeroupper 
0453f e81cb7b4ff                     call       0x7f4c1b9d7d60
04544 0f1f84003c460045               nop        dword ptr [rax + rax + 0x4500463c]
0454c bef6ffffff                     mov        esi, 0xfffffff6
04551 4489542408                     mov        dword ptr [rsp + 8], r10d
04556 6690                           nop        
04558 c5f877                         vzeroupper 
0455b e800b7b4ff                     call       0x7f4c1b9d7d60
04560 0f1f840058460046               nop        dword ptr [rax + rax + 0x46004658]
04568 bef6ffffff                     mov        esi, 0xfffffff6
0456d 666690                         nop        
04570 c5f877                         vzeroupper 
04573 e8e8b6b4ff                     call       0x7f4c1b9d7d60
04578 0f1f840070460047               nop        dword ptr [rax + rax + 0x47004670]
04580 bef6ffffff                     mov        esi, 0xfffffff6
04585 448974240c                     mov        dword ptr [rsp + 0xc], r14d
0458a 6690                           nop        
0458c c5f877                         vzeroupper 
0458f e8ccb6b4ff                     call       0x7f4c1b9d7d60
04594 0f1f84008c460048               nop        dword ptr [rax + rax + 0x4800468c]
0459c bef6ffffff                     mov        esi, 0xfffffff6
045a1 666690                         nop        
045a4 c5f877                         vzeroupper 
045a7 e8b4b6b4ff                     call       0x7f4c1b9d7d60
045ac 0f1f8400a4460049               nop        dword ptr [rax + rax + 0x490046a4]
045b4 bef6ffffff                     mov        esi, 0xfffffff6
045b9 4489742408                     mov        dword ptr [rsp + 8], r14d
045be 6690                           nop        
045c0 c5f877                         vzeroupper 
045c3 e898b6b4ff                     call       0x7f4c1b9d7d60
045c8 0f1f8400c046004a               nop        dword ptr [rax + rax + 0x4a0046c0]
045d0 bef6ffffff                     mov        esi, 0xfffffff6
045d5 666690                         nop        
045d8 c5f877                         vzeroupper 
045db e880b6b4ff                     call       0x7f4c1b9d7d60
045e0 0f1f8400d846004b               nop        dword ptr [rax + rax + 0x4b0046d8]
045e8 49baf08ee81b4c7f0000           movabs     r10, 0x7f4c1be88ef0
045f2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
045f9 e9e267a8ff                     jmp        0x7f4c1b912ee0
045fe e89d33a7ff                     call       0x7f4c1b8ffaa0
04603 e926baffff                     jmp        0x7f4c1be8812e
