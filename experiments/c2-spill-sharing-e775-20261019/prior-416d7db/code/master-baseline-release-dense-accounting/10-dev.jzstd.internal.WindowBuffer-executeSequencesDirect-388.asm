00000 e87b778a18                     call       0x7fd34c70b280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85d4260000                   jne        0x7fd333e66202
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
000a6 448baef8000000                 mov        r13d, dword ptr [rsi + 0xf8]
000ad 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b9 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000c0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c5 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d1 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000d8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
000dd 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e9 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ed 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f2 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000f6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000fb 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00102 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00107 488bfe                         mov        rdi, rsi
0010a c5f877                         vzeroupper 
0010d 49bac0197f4cd37f0000           movabs     r10, 0x7fd34c7f19c0
00117 41ffd2                         call       r10
0011a 0f1f840000000000               nop        dword ptr [rax + rax]
00122 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00127 4d85d2                         test       r10, r10
0012a 0f84b8170000                   je         0x7fd333e653e8
00130 458b1a                         mov        r11d, dword ptr [r10]
00133 41c1eb0d                       shr        r11d, 0xd
00137 4181fb15040000                 cmp        r11d, 0x415
0013e 0f85201b0000                   jne        0x7fd333e65764
00144 4c891424                       mov        qword ptr [rsp], r10
00148 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00150 4885ed                         test       rbp, rbp
00153 0f849b170000                   je         0x7fd333e653f4
00159 448b5500                       mov        r10d, dword ptr [rbp]
0015d 41c1ea0d                       shr        r10d, 0xd
00161 4181fa05010000                 cmp        r10d, 0x105
00168 0f85f61a0000                   jne        0x7fd333e65764
0016e 4c8bd5                         mov        r10, rbp
00171 4c89542408                     mov        qword ptr [rsp + 8], r10
00176 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017e 4885ed                         test       rbp, rbp
00181 0f847a170000                   je         0x7fd333e65401
00187 448b5d00                       mov        r11d, dword ptr [rbp]
0018b 41c1eb0d                       shr        r11d, 0xd
0018f 4181fb08010000                 cmp        r11d, 0x108
00196 0f85c81a0000                   jne        0x7fd333e65764
0019c 4c8bd5                         mov        r10, rbp
0019f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a4 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ac 4885ed                         test       rbp, rbp
001af 0f8459170000                   je         0x7fd333e6540e
001b5 448b5500                       mov        r10d, dword ptr [rbp]
001b9 41c1ea0d                       shr        r10d, 0xd
001bd 4181fa07010000                 cmp        r10d, 0x107
001c4 0f859a1a0000                   jne        0x7fd333e65764
001ca 4c8bd5                         mov        r10, rbp
001cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d2 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001da 4885ed                         test       rbp, rbp
001dd 0f8438170000                   je         0x7fd333e6541b
001e3 448b5500                       mov        r10d, dword ptr [rbp]
001e7 41c1ea0d                       shr        r10d, 0xd
001eb 4181fa07010000                 cmp        r10d, 0x107
001f2 0f856c1a0000                   jne        0x7fd333e65764
001f8 4c8bd5                         mov        r10, rbp
001fb 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00200 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00208 4885ed                         test       rbp, rbp
0020b 0f8417170000                   je         0x7fd333e65428
00211 448b5500                       mov        r10d, dword ptr [rbp]
00215 41c1ea0d                       shr        r10d, 0xd
00219 4181fa05010000                 cmp        r10d, 0x105
00220 0f853e1a0000                   jne        0x7fd333e65764
00226 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00230 458b5204                       mov        r10d, dword ptr [r10 + 4]
00234 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00239 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0023e 4585db                         test       r11d, r11d
00241 0f8465190000                   je         0x7fd333e656ac
00247 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00250 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00255 4585db                         test       r11d, r11d
00258 0f864e190000                   jbe        0x7fd333e656ac
0025e 4183fb01                       cmp        r11d, 1
00262 0f8644190000                   jbe        0x7fd333e656ac
00268 4183fb02                       cmp        r11d, 2
0026c 0f863a190000                   jbe        0x7fd333e656ac
00272 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00277 458b5204                       mov        r10d, dword ptr [r10 + 4]
0027b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00280 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00285 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00289 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00291 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00296 4183c3f1                       add        r11d, -0xf
0029a 4585db                         test       r11d, r11d
0029d 0f8c09190000                   jl         0x7fd333e656ac
002a3 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
002ab 4183c2f1                       add        r10d, -0xf
002af 4585d2                         test       r10d, r10d
002b2 0f8cf4180000                   jl         0x7fd333e656ac
002b8 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002c0 4183c3f9                       add        r11d, -7
002c4 4585db                         test       r11d, r11d
002c7 0f8cdf180000                   jl         0x7fd333e656ac
002cd 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
002d5 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002dd 4d63d3                         movsxd     r10, r11d
002e0 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
002e8 458d53f1                       lea        r10d, [r11 - 0xf]
002ec 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002f4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
002fc 4983c2f1                       add        r10, -0xf
00300 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00308 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0030d 458d43f1                       lea        r8d, [r11 - 0xf]
00311 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
00319 4d63d3                         movsxd     r10, r11d
0031c 4983c2f1                       add        r10, -0xf
00320 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00328 e9db010000                     jmp        0x7fd333e64008
0032d 4533db                         xor        r11d, r11d
00330 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00335 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0033a 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0033e 448bda                         mov        r11d, edx
00341 4183fb03                       cmp        r11d, 3
00345 0f8ec5030000                   jle        0x7fd333e64210
0034b 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00350 45895310                       mov        dword ptr [r11 + 0x10], r10d
00354 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00358 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0035d 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00361 448d52fd                       lea        r10d, [rdx - 3]
00365 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0036d 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00372 45895308                       mov        dword ptr [r11 + 8], r10d
00376 4c639424a4000000               movsxd     r10, dword ptr [rsp + 0xa4]
0037e 4d63c5                         movsxd     r8, r13d
00381 4c03442440                     add        r8, qword ptr [rsp + 0x40]
00386 4c635c246c                     movsxd     r11, dword ptr [rsp + 0x6c]
0038b 4d8bcb                         mov        r9, r11
0038e 4d03c3                         add        r8, r11
00391 4d3bd0                         cmp        r10, r8
00394 0f8f3a130000                   jg         0x7fd333e651d4
0039a 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
003a2 4585db                         test       r11d, r11d
003a5 0f8e19120000                   jle        0x7fd333e650c4
003ab 418bdd                         mov        ebx, r13d
003ae 035c246c                       add        ebx, dword ptr [rsp + 0x6c]
003b2 48636c2478                     movsxd     rbp, dword ptr [rsp + 0x78]
003b7 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
003bc 4403db                         add        r11d, ebx
003bf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003c4 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
003c9 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
003d1 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
003d6 0f8f3a0c0000                   jg         0x7fd333e64b16
003dc 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
003e1 0f8f45130000                   jg         0x7fd333e6522c
003e7 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003ec 4183fa10                       cmp        r10d, 0x10
003f0 0f8fca010000                   jg         0x7fd333e640c0
003f6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003fb 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00403 0f83f3100000                   jae        0x7fd333e64ffc
00409 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0040e 458bcb                         mov        r9d, r11d
00411 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00416 c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
0041d 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00425 0f8315110000                   jae        0x7fd333e65040
0042b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00430 4503d9                         add        r11d, r9d
00433 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
0043b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00440 c4817a7f442a08                 vmovdqu    xmmword ptr [r10 + r13 + 8], xmm0
00447 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0044c 4503d5                         add        r10d, r13d
0044f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00457 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0045f 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
00467 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
0046f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00474 4183fa10                       cmp        r10d, 0x10
00478 0f8f92130000                   jg         0x7fd333e65310
0047e 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00486 4183fb10                       cmp        r11d, 0x10
0048a 0f8c58030000                   jl         0x7fd333e642e8
00490 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00498 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
004a0 0f838a0f0000                   jae        0x7fd333e64f30
004a6 458bda                         mov        r11d, r10d
004a9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004ae c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
004b5 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
004bd 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
004c5 0f83b90f0000                   jae        0x7fd333e64f84
004cb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
004d0 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
004d7 448b6c2478                     mov        r13d, dword ptr [rsp + 0x78]
004dc 4503ea                         add        r13d, r10d
004df 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004e3 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
004e8 41ffc0                         inc        r8d
004eb 4489442468                     mov        dword ptr [rsp + 0x68], r8d
004f0 418502                         test       dword ptr [r10], eax
004f3 48894424f8                     mov        qword ptr [rsp - 8], rax
004f8 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
004ff 89442438                       mov        dword ptr [rsp + 0x38], eax
00503 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00508 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0050d 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00512 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00517 442b4c2438                     sub        r9d, dword ptr [rsp + 0x38]
0051c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00521 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00526 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0052b 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00530 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00535 0f8d240a0000                   jge        0x7fd333e64a5f
0053b 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00540 0f83af0e0000                   jae        0x7fd333e64ef5
00546 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0054b 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
00550 4d8bd3                         mov        r10, r11
00553 49c1ea12                       shr        r10, 0x12
00557 458bd2                         mov        r10d, r10d
0055a 4181e2ffff0300                 and        r10d, 0x3ffff
00561 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00566 4d8bc3                         mov        r8, r11
00569 49c1f824                       sar        r8, 0x24
0056d 458bd3                         mov        r10d, r11d
00570 458bd8                         mov        r11d, r8d
00573 418bd3                         mov        edx, r11d
00576 4181e2ffff0100                 and        r10d, 0x1ffff
0057d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00582 4585db                         test       r11d, r11d
00585 0f8c59100000                   jl         0x7fd333e650e4
0058b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00590 4585d2                         test       r10d, r10d
00593 0f8494fdffff                   je         0x7fd333e63e2d
00599 453bd1                         cmp        r10d, r9d
0059c 0f8e93fdffff                   jle        0x7fd333e63e35
005a2 be45ffffff                     mov        esi, 0xffffff45
005a7 418bea                         mov        ebp, r10d
005aa 44890c24                       mov        dword ptr [rsp], r9d
005ae 6690                           nop        
005b0 c5f877                         vzeroupper 
005b3 e8a8f5b5ff                     call       0x7fd3339c3660
005b8 0f1f8400b0060001               nop        dword ptr [rax + rax + 0x10006b0]
005c0 4183fa30                       cmp        r10d, 0x30
005c4 0f8fed070000                   jg         0x7fd333e648b7
005ca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
005cf 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
005d7 0f8358130000                   jae        0x7fd333e65435
005dd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005e2 418bca                         mov        ecx, r10d
005e5 4d63c2                         movsxd     r8, r10d
005e8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
005ed c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
005f4 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
005fc 0f83c6130000                   jae        0x7fd333e654c8
00602 458d5510                       lea        r10d, [r13 + 0x10]
00606 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0060e 4d63d5                         movsxd     r10, r13d
00611 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00616 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0061d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00625 443bdb                         cmp        r11d, ebx
00628 0f8dc6000000                   jge        0x7fd333e641f4
0062e 4d2bc2                         sub        r8, r10
00631 4d63db                         movsxd     r11, r11d
00634 4f8d1403                       lea        r10, [r11 + r8]
00638 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00640 0f8346140000                   jae        0x7fd333e6558c
00646 4c63d3                         movsxd     r10, ebx
00649 4d2bd3                         sub        r10, r11
0064c 4983c20f                       add        r10, 0xf
00650 4983e2f0                       and        r10, 0xfffffffffffffff0
00654 458bd2                         mov        r10d, r10d
00657 478d5c2a10                     lea        r11d, [r10 + r13 + 0x10]
0065c 4d63db                         movsxd     r11, r11d
0065f 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00664 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0066c 0f831a140000                   jae        0x7fd333e6558c
00672 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0067a 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00682 0f8304140000                   jae        0x7fd333e6558c
00688 4983c3f0                       add        r11, -0x10
0068c 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00694 0f83f2130000                   jae        0x7fd333e6558c
0069a 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
006a0 0f8f76140000                   jg         0x7fd333e6561c
006a6 448bd1                         mov        r10d, ecx
006a9 452bd5                         sub        r10d, r13d
006ac 0f1f4000                       nop        dword ptr [rax]
006b0 458bc2                         mov        r8d, r10d
006b3 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
006bb 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006c0 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
006c7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006cf 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
006d4 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
006db 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
006e3 4183c010                       add        r8d, 0x10
006e7 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
006ef 443bc3                         cmp        r8d, ebx
006f2 7cbc                           jl         0x7fd333e641b0
006f4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
006f9 4403d1                         add        r10d, ecx
006fc 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00704 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0070b e947fdffff                     jmp        0x7fd333e63f57
00710 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00715 4585db                         test       r11d, r11d
00718 7407                           je         0x7fd333e64221
0071a 448d5aff                       lea        r11d, [rdx - 1]
0071e 418bd3                         mov        edx, r11d
00721 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00726 458b4308                       mov        r8d, dword ptr [r11 + 8]
0072a 85d2                           test       edx, edx
0072c 7474                           je         0x7fd333e642a2
0072e 83fa03                         cmp        edx, 3
00731 0f84250b0000                   je         0x7fd333e64d5c
00737 83fa02                         cmp        edx, 2
0073a 7773                           ja         0x7fd333e642af
0073c 3b54244c                       cmp        edx, dword ptr [rsp + 0x4c]
00740 0f8346150000                   jae        0x7fd333e6578c
00746 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0074b 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
00750 85d2                           test       edx, edx
00752 7e45                           jle        0x7fd333e64299
00754 448d52ff                       lea        r10d, [rdx - 1]
00758 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
0075d 0f83cd170000                   jae        0x7fd333e65a30
00763 4533c9                         xor        r9d, r9d
00766 458bd3                         mov        r10d, r11d
00769 4183c2cc                       add        r10d, -0x34
0076d 41c1ea02                       shr        r10d, 2
00771 458d5c12ff                     lea        r11d, [r10 + rdx - 1]
00776 4863ca                         movsxd     rcx, edx
00779 41ba04000000                   mov        r10d, 4
0077f c442a8f5d3                     bzhi       r10, r11, r10
00784 492bca                         sub        rcx, r10
00787 48ffc9                         dec        rcx
0078a 4885c9                         test       rcx, rcx
0078d 490f4cc9                       cmovl      rcx, r9
00791 448bd9                         mov        r11d, ecx
00794 e996060000                     jmp        0x7fd333e6492f
00799 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0079e 45894208                       mov        dword ptr [r10 + 8], r8d
007a2 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
007aa e9c7fbffff                     jmp        0x7fd333e63e76
007af 48bee82374e200000000           movabs     rsi, 0xe27423e8
007b9 418bed                         mov        ebp, r13d
007bc c5f877                         vzeroupper 
007bf e89c75a9ff                     call       0x7fd3338fb860
007c4 0f1f8400bc080002               nop        dword ptr [rax + rax + 0x20008bc]
007cc 4885c0                         test       rax, rax
007cf 0f84bb150000                   je         0x7fd333e65890
007d5 488bf0                         mov        rsi, rax
007d8 c5f877                         vzeroupper 
007db 4881c4f0000000                 add        rsp, 0xf0
007e2 5d                             pop        rbp
007e3 e9f851b6ff                     jmp        0x7fd3339c94e0
007e8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
007f0 4503da                         add        r11d, r10d
007f3 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
007fb 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00803 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00808 0f8dca020000                   jge        0x7fd333e645d8
0080e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00816 4183c308                       add        r11d, 8
0081a 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0081f 4183fa08                       cmp        r10d, 8
00823 0f8da8010000                   jge        0x7fd333e644d1
00829 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00831 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00839 0f83091a0000                   jae        0x7fd333e65d48
0083f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00844 430fbe6c1a08                   movsx      ebp, byte ptr [r10 + r11 + 8]
0084a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00852 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0085a 0f83a41a0000                   jae        0x7fd333e65e04
00860 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00865 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0086d 4183c303                       add        r11d, 3
00871 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00879 41ffc0                         inc        r8d
0087c 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00884 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
0088c 0f83d21a0000                   jae        0x7fd333e65e64
00892 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0089a 4183c303                       add        r11d, 3
0089e 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
008a6 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008ab 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
008b1 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
008b9 0f831d1b0000                   jae        0x7fd333e65edc
008bf 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
008c7 43886c1809                     mov        byte ptr [r8 + r11 + 9], bpl
008cc 470fbe44100a                   movsx      r8d, byte ptr [r8 + r10 + 0xa]
008d2 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
008d7 478844190a                     mov        byte ptr [r9 + r11 + 0xa], r8b
008dc 470fbe44110b                   movsx      r8d, byte ptr [r9 + r10 + 0xb]
008e2 478844190b                     mov        byte ptr [r9 + r11 + 0xb], r8b
008e7 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
008ef 4183fa08                       cmp        r10d, 8
008f3 0f83431b0000                   jae        0x7fd333e65f3c
008f9 49ba285d72e200000000           movabs     r10, 0xe2725d28
00903 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
0090b 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00913 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00918 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0091d 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00922 4183fb04                       cmp        r11d, 4
00926 7e40                           jle        0x7fd333e64468
00928 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
0092f 83c504                         add        ebp, 4
00932 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00937 8b542414                       mov        edx, dword ptr [rsp + 0x14]
0093b 90                             nop        
0093c c5f877                         vzeroupper 
0093f e81c74a9ff                     call       0x7fd3338fb860
00944 0f1f84003c0a0003               nop        dword ptr [rax + rax + 0x3000a3c]
0094c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00951 8bd5                           mov        edx, ebp
00953 8bc8                           mov        ecx, eax
00955 666690                         nop        
00958 c5f877                         vzeroupper 
0095b e80074a9ff                     call       0x7fd3338fb860
00960 0f1f8400580a0004               nop        dword ptr [rax + rax + 0x4000a58]
00968 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0096d 4183fb08                       cmp        r11d, 8
00971 7e51                           jle        0x7fd333e644c4
00973 49ba505d72e200000000           movabs     r10, 0xe2725d50
0097d 8b542414                       mov        edx, dword ptr [rsp + 0x14]
00981 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00989 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
0098e 83c208                         add        edx, 8
00991 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00996 6690                           nop        
00998 c5f877                         vzeroupper 
0099b e8c073a9ff                     call       0x7fd3338fb860
009a0 0f1f8400980a0005               nop        dword ptr [rax + rax + 0x5000a98]
009a8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009ad 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
009b1 488bc8                         mov        rcx, rax
009b4 c5f877                         vzeroupper 
009b7 e8a473a9ff                     call       0x7fd3338fb860
009bc 0f1f8400b40a0006               nop        dword ptr [rax + rax + 0x6000ab4]
009c4 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
009cc e90efbffff                     jmp        0x7fd333e63fdf
009d1 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009d6 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
009dd 666690                         nop        
009e0 c5f877                         vzeroupper 
009e3 e87873a9ff                     call       0x7fd3338fb860
009e8 0f1f8400e00a0007               nop        dword ptr [rax + rax + 0x7000ae0]
009f0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
009f5 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
009fc 488bc8                         mov        rcx, rax
009ff 90                             nop        
00a00 c5f877                         vzeroupper 
00a03 e85873a9ff                     call       0x7fd3338fb860
00a08 0f1f8400000b0008               nop        dword ptr [rax + rax + 0x8000b00]
00a10 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00a18 4183c308                       add        r11d, 8
00a1c 458bcb                         mov        r9d, r11d
00a1f be95ffffff                     mov        esi, 0xffffff95
00a24 488b2c24                       mov        rbp, qword ptr [rsp]
00a28 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00a2d 4c891424                       mov        qword ptr [rsp], r10
00a31 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a36 4489542408                     mov        dword ptr [rsp + 8], r10d
00a3b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a40 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00a45 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a4a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a4f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a54 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00a59 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00a5e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a63 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a68 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00a6d 48ff742440                     push       qword ptr [rsp + 0x40]
00a72 488f442438                     pop        qword ptr [rsp + 0x38]
00a77 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00a7c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00a81 48ff742450                     push       qword ptr [rsp + 0x50]
00a86 488f442448                     pop        qword ptr [rsp + 0x48]
00a8b 48ff742458                     push       qword ptr [rsp + 0x58]
00a90 488f442450                     pop        qword ptr [rsp + 0x50]
00a95 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00a9a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00a9f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00aa4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00aa9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00aae 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00ab3 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00abb 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
00ac0 458bda                         mov        r11d, r10d
00ac3 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ac8 c5f877                         vzeroupper 
00acb e890f0b5ff                     call       0x7fd3339c3660
00ad0 0f1f8400c80b0009               nop        dword ptr [rax + rax + 0x9000bc8]
00ad8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00add 4183fb30                       cmp        r11d, 0x30
00ae1 0f8f08020000                   jg         0x7fd333e647ef
00ae7 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00aee 83c5f9                         add        ebp, -7
00af1 89ac24a4000000                 mov        dword ptr [rsp + 0xa4], ebp
00af8 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00b00 443bd5                         cmp        r10d, ebp
00b03 0f83e3120000                   jae        0x7fd333e658ec
00b09 418bea                         mov        ebp, r10d
00b0c 89ac24b4000000                 mov        dword ptr [rsp + 0xb4], ebp
00b13 4863ed                         movsxd     rbp, ebp
00b16 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00b1e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00b23 498b6c2a08                     mov        rbp, qword ptr [r10 + rbp + 8]
00b28 4889ac24c8000000               mov        qword ptr [rsp + 0xc8], rbp
00b30 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b38 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00b40 0f832e130000                   jae        0x7fd333e65974
00b46 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00b4e 4963eb                         movsxd     rbp, r11d
00b51 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
00b59 488d4d08                       lea        rcx, [rbp + 8]
00b5d 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00b67 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00b6c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00b74 4533c9                         xor        r9d, r9d
00b77 90                             nop        
00b78 c5f877                         vzeroupper 
00b7b e8e067a9ff                     call       0x7fd3338fae60
00b80 0f1f8400780c000a               nop        dword ptr [rax + rax + 0xa000c78]
00b88 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b90 4183c208                       add        r10d, 8
00b94 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00b9c 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00ba4 0f8d33010000                   jge        0x7fd333e647dd
00baa 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00bb2 482bac24d0000000               sub        rbp, qword ptr [rsp + 0xd0]
00bba 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00bc2 4983c3f9                       add        r11, -7
00bc6 4d63c2                         movsxd     r8, r10d
00bc9 4d8d1428                       lea        r10, [r8 + rbp]
00bcd 4d3bd3                         cmp        r10, r11
00bd0 0f836a140000                   jae        0x7fd333e65b40
00bd6 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00bde 4d2bd0                         sub        r10, r8
00be1 4983c207                       add        r10, 7
00be5 4983e2f8                       and        r10, 0xfffffffffffffff8
00be9 458bd2                         mov        r10d, r10d
00bec 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
00bf4 478d540a08                     lea        r10d, [r10 + r9 + 8]
00bf9 4d63c2                         movsxd     r8, r10d
00bfc 4d8d5428f8                     lea        r10, [r8 + rbp - 8]
00c01 4d3bd3                         cmp        r10, r11
00c04 0f8336140000                   jae        0x7fd333e65b40
00c0a 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
00c12 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
00c1a 0f8320140000                   jae        0x7fd333e65b40
00c20 4983c0f8                       add        r8, -8
00c24 4d3bc3                         cmp        r8, r11
00c27 0f8313140000                   jae        0x7fd333e65b40
00c2d 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c35 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c3c 0f8fc6140000                   jg         0x7fd333e65c08
00c42 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00c49 412be9                         sub        ebp, r9d
00c4c 896c2414                       mov        dword ptr [rsp + 0x14], ebp
00c50 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00c58 4963cb                         movsxd     rcx, r11d
00c5b 4883c108                       add        rcx, 8
00c5f 8b6c2414                       mov        ebp, dword ptr [rsp + 0x14]
00c63 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00c6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00c6f 4d8b442a08                     mov        r8, qword ptr [r10 + rbp + 8]
00c74 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
00c7e 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
00c83 4533c9                         xor        r9d, r9d
00c86 6690                           nop        
00c88 c5f877                         vzeroupper 
00c8b e8d066a9ff                     call       0x7fd3338fae60
00c90 0f1f8400880d000b               nop        dword ptr [rax + rax + 0xb000d88]
00c98 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
00ca0 4183c208                       add        r10d, 8
00ca4 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00cac 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00cb4 7c9a                           jl         0x7fd333e64750
00cb6 eb25                           jmp        0x7fd333e647dd
00cb8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00cbd 4d63d2                         movsxd     r10, r10d
00cc0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cc7 c442a8f5db                     bzhi       r11, r11, r10
00ccc c4c1fb92fb                     kmovq      k7, r11
00cd1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cd7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cdd 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
00ce5 44036c2478                     add        r13d, dword ptr [rsp + 0x78]
00cea e9f0f7ffff                     jmp        0x7fd333e63fdf
00cef 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00cf7 4585d2                         test       r10d, r10d
00cfa 0f8cdc110000                   jl         0x7fd333e659dc
00d00 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d08 4585db                         test       r11d, r11d
00d0b 0f8ccb110000                   jl         0x7fd333e659dc
00d11 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d16 44039424b4000000               add        r10d, dword ptr [rsp + 0xb4]
00d1e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00d26 453bda                         cmp        r11d, r10d
00d29 0f82ad110000                   jb         0x7fd333e659dc
00d2f 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d37 0f829f110000                   jb         0x7fd333e659dc
00d3d 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d42 4585d2                         test       r10d, r10d
00d45 7496                           je         0x7fd333e647dd
00d47 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d4c 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00d54 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00d59 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00d61 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00d66 4883fd20                       cmp        rbp, 0x20
00d6a 0f8648ffffff                   jbe        0x7fd333e647b8
00d70 488bd5                         mov        rdx, rbp
00d73 c5f877                         vzeroupper 
00d76 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00d80 41ffd2                         call       r10
00d83 0f1f840000000000               nop        dword ptr [rax + rax]
00d8b e94dffffff                     jmp        0x7fd333e647dd
00d90 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d95 4d63d3                         movsxd     r10, r11d
00d98 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d9f c442a8f5db                     bzhi       r11, r11, r10
00da4 c4c1fb92fb                     kmovq      k7, r11
00da9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00daf 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00db5 eb66                           jmp        0x7fd333e6491d
00db7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00dbc 4585d2                         test       r10d, r10d
00dbf 0f8ce30f0000                   jl         0x7fd333e658a8
00dc5 4585ed                         test       r13d, r13d
00dc8 0f8cda0f0000                   jl         0x7fd333e658a8
00dce 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00dd3 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00ddb 0f82c70f0000                   jb         0x7fd333e658a8
00de1 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00de9 443bdb                         cmp        r11d, ebx
00dec 0f82b60f0000                   jb         0x7fd333e658a8
00df2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00df7 4585d2                         test       r10d, r10d
00dfa 7421                           je         0x7fd333e6491d
00dfc 4983f920                       cmp        r9, 0x20
00e00 768e                           jbe        0x7fd333e64890
00e02 498bd1                         mov        rdx, r9
00e05 c5f877                         vzeroupper 
00e08 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00e12 41ffd2                         call       r10
00e15 0f1f840000000000               nop        dword ptr [rax + rax]
00e1d 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00e24 e92ef6ffff                     jmp        0x7fd333e63f57
00e29 666690                         nop        
00e2c 418bd1                         mov        edx, r9d
00e2f 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
00e34 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
00e39 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00e3e 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
00e43 448d4aff                       lea        r9d, [rdx - 1]
00e47 453bcb                         cmp        r9d, r11d
00e4a 7fe0                           jg         0x7fd333e6492c
00e4c 4183f93f                       cmp        r9d, 0x3f
00e50 0f8ee2110000                   jle        0x7fd333e65b38
00e56 448bd2                         mov        r10d, edx
00e59 41ffca                         dec        r10d
00e5c 418bca                         mov        ecx, r10d
00e5f eb12                           jmp        0x7fd333e64973
00e61 0f1f840000000000               nop        dword ptr [rax + rax]
00e69 0f1f8000000000                 nop        dword ptr [rax]
00e70 418bca                         mov        ecx, r10d
00e73 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00e78 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00e83 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00e8e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00e99 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00ea4 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00eaf 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00eba 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00ec5 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00ed0 448d51c0                       lea        r10d, [rcx - 0x40]
00ed4 4183fa3f                       cmp        r10d, 0x3f
00ed8 7f96                           jg         0x7fd333e64970
00eda 4183fa0f                       cmp        r10d, 0xf
00ede 7e2d                           jle        0x7fd333e64a0d
00ee0 448bd1                         mov        r10d, ecx
00ee3 4183c2c0                       add        r10d, -0x40
00ee7 90                             nop        
00ee8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00eed 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00ef8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00f03 4183c2f0                       add        r10d, -0x10
00f07 4183fa0f                       cmp        r10d, 0xf
00f0b 7fdb                           jg         0x7fd333e649e8
00f0d 4585d2                         test       r10d, r10d
00f10 0f8e83f8ffff                   jle        0x7fd333e64299
00f16 458bca                         mov        r9d, r10d
00f19 666690                         nop        
00f1c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00f21 478b548a04                     mov        r10d, dword ptr [r10 + r9*4 + 4]
00f26 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00f2b 4789548b08                     mov        dword ptr [r11 + r9*4 + 8], r10d
00f30 41ffc9                         dec        r9d
00f33 4585c9                         test       r9d, r9d
00f36 7fe4                           jg         0x7fd333e64a1c
00f38 e95cf8ffff                     jmp        0x7fd333e64299
00f3d 4d63d1                         movsxd     r10, r9d
00f40 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f47 c442a8f5db                     bzhi       r11, r11, r10
00f4c c4c1fb92fb                     kmovq      k7, r11
00f51 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f57 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f5d eb72                           jmp        0x7fd333e64ad1
00f5f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f64 4585db                         test       r11d, r11d
00f67 0f8c6b150000                   jl         0x7fd333e65fd8
00f6d 4585ed                         test       r13d, r13d
00f70 0f8c62150000                   jl         0x7fd333e65fd8
00f76 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f7b 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00f80 0f8252150000                   jb         0x7fd333e65fd8
00f86 438d2c29                       lea        ebp, [r9 + r13]
00f8a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00f92 443bdd                         cmp        r11d, ebp
00f95 0f823d150000                   jb         0x7fd333e65fd8
00f9b 4585c9                         test       r9d, r9d
00f9e 0f8c34150000                   jl         0x7fd333e65fd8
00fa4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fa9 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00fae 7421                           je         0x7fd333e64ad1
00fb0 4963d1                         movsxd     rdx, r9d
00fb3 4883fa20                       cmp        rdx, 0x20
00fb7 7684                           jbe        0x7fd333e64a3d
00fb9 c5f877                         vzeroupper 
00fbc 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
00fc6 41ffd2                         call       r10
00fc9 0f1f840000000000               nop        dword ptr [rax + rax]
00fd1 4c8b1424                       mov        r10, qword ptr [rsp]
00fd5 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00fd9 c5f877                         vzeroupper 
00fdc 4881c4f0000000                 add        rsp, 0xf0
00fe3 5d                             pop        rbp
00fe4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00fe8 0f87fe160000                   ja         0x7fd333e661ec
00fee c3                             ret        
00fef 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00ff4 4d63d2                         movsxd     r10, r10d
00ff7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ffe c442a8f5db                     bzhi       r11, r11, r10
01003 c4c1fb92fb                     kmovq      k7, r11
01008 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0100e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01014 eb78                           jmp        0x7fd333e64b8e
01016 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0101b 4585d2                         test       r10d, r10d
0101e 0f84c9030000                   je         0x7fd333e64eed
01024 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01029 4585d2                         test       r10d, r10d
0102c 0f8cca140000                   jl         0x7fd333e65ffc
01032 4585ed                         test       r13d, r13d
01035 0f8cc1140000                   jl         0x7fd333e65ffc
0103b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01040 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01048 0f82ae140000                   jb         0x7fd333e65ffc
0104e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01056 443bd3                         cmp        r10d, ebx
01059 0f829d140000                   jb         0x7fd333e65ffc
0105f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01064 4585db                         test       r11d, r11d
01067 7425                           je         0x7fd333e64b8e
01069 4983f920                       cmp        r9, 0x20
0106d 0f867cffffff                   jbe        0x7fd333e64aef
01073 498bd1                         mov        rdx, r9
01076 c5f877                         vzeroupper 
01079 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
01083 41ffd2                         call       r10
01086 0f1f840000000000               nop        dword ptr [rax + rax]
0108e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01093 4585d2                         test       r10d, r10d
01096 0f8eb5010000                   jle        0x7fd333e64d51
0109c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
010a1 498d741a08                     lea        rsi, [r10 + rbx + 8]
010a6 448b742478                     mov        r14d, dword ptr [rsp + 0x78]
010ab 4403f3                         add        r14d, ebx
010ae 448bdb                         mov        r11d, ebx
010b1 442b9c24a4000000               sub        r11d, dword ptr [rsp + 0xa4]
010b9 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
010c1 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
010c6 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
010ce 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
010d3 0f8deb000000                   jge        0x7fd333e64cc4
010d9 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
010de 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
010e6 458bda                         mov        r11d, r10d
010e9 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
010f1 450f4fda                       cmovg      r11d, r10d
010f5 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
010fd 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01105 4585db                         test       r11d, r11d
01108 0f8c5a140000                   jl         0x7fd333e66068
0110e 85db                           test       ebx, ebx
01110 0f8c52140000                   jl         0x7fd333e66068
01116 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
0111e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01126 453bd3                         cmp        r10d, r11d
01129 0f8239140000                   jb         0x7fd333e66068
0112f 448bdb                         mov        r11d, ebx
01132 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
0113a 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
01142 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0114a 453bd3                         cmp        r10d, r11d
0114d 0f8215140000                   jb         0x7fd333e66068
01153 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0115b 4585db                         test       r11d, r11d
0115e 0f8c04140000                   jl         0x7fd333e66068
01164 4585db                         test       r11d, r11d
01167 7429                           je         0x7fd333e64c92
01169 4963d3                         movsxd     rdx, r11d
0116c 4883fa20                       cmp        rdx, 0x20
01170 7738                           ja         0x7fd333e64caa
01172 4d63d3                         movsxd     r10, r11d
01175 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0117c c442a8f5db                     bzhi       r11, r11, r10
01181 c4c1fb92fb                     kmovq      k7, r11
01186 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0118c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01192 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0119a 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0119f 0f8c73010000                   jl         0x7fd333e64e18
011a5 e9aa000000                     jmp        0x7fd333e64d54
011aa c5f877                         vzeroupper 
011ad 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
011b7 41ffd2                         call       r10
011ba 0f1f840000000000               nop        dword ptr [rax + rax]
011c2 ebce                           jmp        0x7fd333e64c92
011c4 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
011cc 4585d2                         test       r10d, r10d
011cf 0f8c47140000                   jl         0x7fd333e6611c
011d5 85db                           test       ebx, ebx
011d7 0f8c3f140000                   jl         0x7fd333e6611c
011dd 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
011e2 4503da                         add        r11d, r10d
011e5 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
011ed 453bc3                         cmp        r8d, r11d
011f0 0f8226140000                   jb         0x7fd333e6611c
011f6 453bc6                         cmp        r8d, r14d
011f9 0f821d140000                   jb         0x7fd333e6611c
011ff 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01204 4585db                         test       r11d, r11d
01207 744b                           je         0x7fd333e64d54
01209 4883fd20                       cmp        rbp, 0x20
0120d 7725                           ja         0x7fd333e64d34
0120f 458bd3                         mov        r10d, r11d
01212 4d63d2                         movsxd     r10, r10d
01215 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0121c c442a8f5db                     bzhi       r11, r11, r10
01221 c4c1fb92fb                     kmovq      k7, r11
01226 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0122c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01232 eb20                           jmp        0x7fd333e64d54
01234 488bd5                         mov        rdx, rbp
01237 c5f877                         vzeroupper 
0123a 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
01244 41ffd2                         call       r10
01247 0f1f840000000000               nop        dword ptr [rax + rax]
0124f eb03                           jmp        0x7fd333e64d54
01251 448bf3                         mov        r14d, ebx
01254 458bee                         mov        r13d, r14d
01257 e983f2ffff                     jmp        0x7fd333e63fdf
0125c 41ffc8                         dec        r8d
0125f 4585c0                         test       r8d, r8d
01262 7e1f                           jle        0x7fd333e64d83
01264 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
01269 45895310                       mov        dword ptr [r11 + 0x10], r10d
0126d 458b5b08                       mov        r11d, dword ptr [r11 + 8]
01271 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01276 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0127a 45894208                       mov        dword ptr [r10 + 8], r8d
0127e e91ff5ffff                     jmp        0x7fd333e642a2
01283 48beb82374e200000000           movabs     rsi, 0xe27423b8
0128d 418bed                         mov        ebp, r13d
01290 c5f877                         vzeroupper 
01293 e8c86aa9ff                     call       0x7fd3338fb860
01298 0f1f84009013000c               nop        dword ptr [rax + rax + 0xc001390]
012a0 4885c0                         test       rax, rax
012a3 0f852cf5ffff                   jne        0x7fd333e642d5
012a9 bef6ffffff                     mov        esi, 0xfffffff6
012ae 6690                           nop        
012b0 c5f877                         vzeroupper 
012b3 e8a8e8b5ff                     call       0x7fd3339c3660
012b8 0f1f8400b013000d               nop        dword ptr [rax + rax + 0xd0013b0]
012c0 448bd5                         mov        r10d, ebp
012c3 4d63d2                         movsxd     r10, r10d
012c6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
012cd c442a8f5db                     bzhi       r11, r11, r10
012d2 c4c1fb92fb                     kmovq      k7, r11
012d7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012dd 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012e3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
012eb 4403d5                         add        r10d, ebp
012ee 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
012f6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
012fa 418502                         test       dword ptr [r10], eax
012fd 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01305 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0130a 0f8d44ffffff                   jge        0x7fd333e64d54
01310 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
01318 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01320 442b9424a4000000               sub        r10d, dword ptr [rsp + 0xa4]
01328 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01330 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
01334 2bac24a4000000                 sub        ebp, dword ptr [rsp + 0xa4]
0133b 3bac24a4000000                 cmp        ebp, dword ptr [rsp + 0xa4]
01342 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0134a 410f4feb                       cmovg      ebp, r11d
0134e 4585d2                         test       r10d, r10d
01351 0f8c790e0000                   jl         0x7fd333e65cd0
01357 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0135f 4585db                         test       r11d, r11d
01362 0f8c680e0000                   jl         0x7fd333e65cd0
01368 458d1c2a                       lea        r11d, [r10 + rbp]
0136c 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01374 453bd3                         cmp        r10d, r11d
01377 0f82530e0000                   jb         0x7fd333e65cd0
0137d 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
01385 4403ed                         add        r13d, ebp
01388 458bda                         mov        r11d, r10d
0138b 453bdd                         cmp        r11d, r13d
0138e 0f823c0e0000                   jb         0x7fd333e65cd0
01394 85ed                           test       ebp, ebp
01396 0f8c340e0000                   jl         0x7fd333e65cd0
0139c 85ed                           test       ebp, ebp
0139e 0f843fffffff                   je         0x7fd333e64de3
013a4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
013a9 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
013b1 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
013b6 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
013be 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
013c3 4863d5                         movsxd     rdx, ebp
013c6 4883fa20                       cmp        rdx, 0x20
013ca 0f86f0feffff                   jbe        0x7fd333e64dc0
013d0 c5f877                         vzeroupper 
013d3 49ba204f8e33d37f0000           movabs     r10, 0x7fd3338e4f20
013dd 41ffd2                         call       r10
013e0 0f1f840000000000               nop        dword ptr [rax + rax]
013e8 e9f6feffff                     jmp        0x7fd333e64de3
013ed 418bdd                         mov        ebx, r13d
013f0 e999fcffff                     jmp        0x7fd333e64b8e
013f5 bee4ffffff                     mov        esi, 0xffffffe4
013fa 488b2c24                       mov        rbp, qword ptr [rsp]
013fe 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01403 4c891424                       mov        qword ptr [rsp], r10
01407 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0140c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01411 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01416 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0141b 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01420 c5f877                         vzeroupper 
01423 e838e7b5ff                     call       0x7fd3339c3660
01428 0f1f84002015000f               nop        dword ptr [rax + rax + 0xf001520]
01430 bee4ffffff                     mov        esi, 0xffffffe4
01435 488b2c24                       mov        rbp, qword ptr [rsp]
01439 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0143e 4c891424                       mov        qword ptr [rsp], r10
01442 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01447 4489542408                     mov        dword ptr [rsp + 8], r10d
0144c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01451 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01456 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0145b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01460 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01465 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0146a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0146f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01474 c5f877                         vzeroupper 
01477 e8e4e6b5ff                     call       0x7fd3339c3660
0147c 0f1f840074150010               nop        dword ptr [rax + rax + 0x10001574]
01484 bee4ffffff                     mov        esi, 0xffffffe4
01489 488b2c24                       mov        rbp, qword ptr [rsp]
0148d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01492 4c891424                       mov        qword ptr [rsp], r10
01496 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0149b 44895c2408                     mov        dword ptr [rsp + 8], r11d
014a0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
014a5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014aa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014af 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014b4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014b9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014be 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
014c3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014c8 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
014d0 4489542470                     mov        dword ptr [rsp + 0x70], r10d
014d5 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
014dd 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
014e2 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
014eb 90                             nop        
014ec c5f877                         vzeroupper 
014ef e86ce6b5ff                     call       0x7fd3339c3660
014f4 0f1f8400ec150011               nop        dword ptr [rax + rax + 0x110015ec]
014fc bee4ffffff                     mov        esi, 0xffffffe4
01501 488b2c24                       mov        rbp, qword ptr [rsp]
01505 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0150a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0150f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01514 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01519 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0151e 48894424f8                     mov        qword ptr [rsp - 8], rax
01523 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01527 89442470                       mov        dword ptr [rsp + 0x70], eax
0152b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01530 c5f877                         vzeroupper 
01533 e828e6b5ff                     call       0x7fd3339c3660
01538 0f1f840030160012               nop        dword ptr [rax + rax + 0x12001630]
01540 bee4ffffff                     mov        esi, 0xffffffe4
01545 488b2c24                       mov        rbp, qword ptr [rsp]
01549 4c891c24                       mov        qword ptr [rsp], r11
0154d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01552 44895c2408                     mov        dword ptr [rsp + 8], r11d
01557 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0155c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01561 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01566 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0156b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01570 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01575 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0157a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0157f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01584 48894424f8                     mov        qword ptr [rsp - 8], rax
01589 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0158d 89442470                       mov        dword ptr [rsp + 0x70], eax
01591 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01596 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0159b 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
015a3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015a8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
015b1 666690                         nop        
015b4 c5f877                         vzeroupper 
015b7 e8a4e5b5ff                     call       0x7fd3339c3660
015bc 0f1f8400b4160013               nop        dword ptr [rax + rax + 0x130016b4]
015c4 be45ffffff                     mov        esi, 0xffffff45
015c9 488b2c24                       mov        rbp, qword ptr [rsp]
015cd 4c89442408                     mov        qword ptr [rsp + 8], r8
015d2 6690                           nop        
015d4 c5f877                         vzeroupper 
015d7 e884e5b5ff                     call       0x7fd3339c3660
015dc 0f1f8400d4160014               nop        dword ptr [rax + rax + 0x140016d4]
015e4 be45ffffff                     mov        esi, 0xffffff45
015e9 488b2c24                       mov        rbp, qword ptr [rsp]
015ed 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015f2 4c891424                       mov        qword ptr [rsp], r10
015f6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015fb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01600 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01605 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0160a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0160f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01614 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01619 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0161e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01623 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01628 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0162d 48894424f8                     mov        qword ptr [rsp - 8], rax
01632 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01636 89442434                       mov        dword ptr [rsp + 0x34], eax
0163a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163f 48894424f8                     mov        qword ptr [rsp - 8], rax
01644 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01648 89442438                       mov        dword ptr [rsp + 0x38], eax
0164c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01651 48894424f8                     mov        qword ptr [rsp - 8], rax
01656 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0165a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0165e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01663 48ff742450                     push       qword ptr [rsp + 0x50]
01668 488f442448                     pop        qword ptr [rsp + 0x48]
0166d 48ff742458                     push       qword ptr [rsp + 0x58]
01672 488f442450                     pop        qword ptr [rsp + 0x50]
01677 48894424f8                     mov        qword ptr [rsp - 8], rax
0167c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01680 89442458                       mov        dword ptr [rsp + 0x58], eax
01684 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01689 48894424f8                     mov        qword ptr [rsp - 8], rax
0168e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01692 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01696 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0169b 48894424f8                     mov        qword ptr [rsp - 8], rax
016a0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016a4 89442460                       mov        dword ptr [rsp + 0x60], eax
016a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ad 48894424f8                     mov        qword ptr [rsp - 8], rax
016b2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
016b6 89442464                       mov        dword ptr [rsp + 0x64], eax
016ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016bf 8954246c                       mov        dword ptr [rsp + 0x6c], edx
016c3 90                             nop        
016c4 c5f877                         vzeroupper 
016c7 e894e4b5ff                     call       0x7fd3339c3660
016cc 0f1f8400c4170015               nop        dword ptr [rax + rax + 0x150017c4]
016d4 4d3bd0                         cmp        r10, r8
016d7 bdffffffff                     mov        ebp, 0xffffffff
016dc 7c08                           jl         0x7fd333e651e6
016de 400f95c5                       setne      bpl
016e2 400fb6ed                       movzx      ebp, bpl
016e6 be45ffffff                     mov        esi, 0xffffff45
016eb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016f0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016f5 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
016fa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016ff 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01704 48894424f8                     mov        qword ptr [rsp - 8], rax
01709 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0170d 89442470                       mov        dword ptr [rsp + 0x70], eax
01711 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01716 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0171b 90                             nop        
0171c c5f877                         vzeroupper 
0171f e83ce4b5ff                     call       0x7fd3339c3660
01724 0f1f84001c180016               nop        dword ptr [rax + rax + 0x1600181c]
0172c be45ffffff                     mov        esi, 0xffffff45
01731 488b2c24                       mov        rbp, qword ptr [rsp]
01735 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0173a 4c891424                       mov        qword ptr [rsp], r10
0173e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01743 44895c2408                     mov        dword ptr [rsp + 8], r11d
01748 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0174d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01752 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01757 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0175c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01761 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01766 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0176b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01770 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01775 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0177a 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0177f 48894424f8                     mov        qword ptr [rsp - 8], rax
01784 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01788 89442434                       mov        dword ptr [rsp + 0x34], eax
0178c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01791 48894424f8                     mov        qword ptr [rsp - 8], rax
01796 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0179a 89442438                       mov        dword ptr [rsp + 0x38], eax
0179e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a3 48894424f8                     mov        qword ptr [rsp - 8], rax
017a8 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017ac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b5 48ff742450                     push       qword ptr [rsp + 0x50]
017ba 488f442448                     pop        qword ptr [rsp + 0x48]
017bf 48ff742458                     push       qword ptr [rsp + 0x58]
017c4 488f442450                     pop        qword ptr [rsp + 0x50]
017c9 48894424f8                     mov        qword ptr [rsp - 8], rax
017ce 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017d2 89442458                       mov        dword ptr [rsp + 0x58], eax
017d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017db 48894424f8                     mov        qword ptr [rsp - 8], rax
017e0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017e4 89442460                       mov        dword ptr [rsp + 0x60], eax
017e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ed 48894424f8                     mov        qword ptr [rsp - 8], rax
017f2 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017f6 89442468                       mov        dword ptr [rsp + 0x68], eax
017fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ff 90                             nop        
01800 c5f877                         vzeroupper 
01803 e858e3b5ff                     call       0x7fd3339c3660
01808 0f1f840000190017               nop        dword ptr [rax + rax + 0x17001900]
01810 be45ffffff                     mov        esi, 0xffffff45
01815 488b2c24                       mov        rbp, qword ptr [rsp]
01819 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0181e 4c891424                       mov        qword ptr [rsp], r10
01822 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01827 4489542408                     mov        dword ptr [rsp + 8], r10d
0182c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01831 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01836 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0183b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01840 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01845 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0184a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0184f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01854 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01859 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0185e 48894424f8                     mov        qword ptr [rsp - 8], rax
01863 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01867 89442438                       mov        dword ptr [rsp + 0x38], eax
0186b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01870 48894424f8                     mov        qword ptr [rsp - 8], rax
01875 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01879 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0187d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01882 48ff742450                     push       qword ptr [rsp + 0x50]
01887 488f442448                     pop        qword ptr [rsp + 0x48]
0188c 48ff742458                     push       qword ptr [rsp + 0x58]
01891 488f442450                     pop        qword ptr [rsp + 0x50]
01896 48894424f8                     mov        qword ptr [rsp - 8], rax
0189b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0189f 89442458                       mov        dword ptr [rsp + 0x58], eax
018a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a8 48894424f8                     mov        qword ptr [rsp - 8], rax
018ad 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018b1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ba 48894424f8                     mov        qword ptr [rsp - 8], rax
018bf 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018c3 89442460                       mov        dword ptr [rsp + 0x60], eax
018c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
018d1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
018d6 6690                           nop        
018d8 c5f877                         vzeroupper 
018db e880e2b5ff                     call       0x7fd3339c3660
018e0 0f1f8400d8190018               nop        dword ptr [rax + rax + 0x180019d8]
018e8 4533d2                         xor        r10d, r10d
018eb 4c891424                       mov        qword ptr [rsp], r10
018ef e954e8ffff                     jmp        0x7fd333e63c48
018f4 4533d2                         xor        r10d, r10d
018f7 4c89542408                     mov        qword ptr [rsp + 8], r10
018fc e975e8ffff                     jmp        0x7fd333e63c76
01901 4533d2                         xor        r10d, r10d
01904 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01909 e996e8ffff                     jmp        0x7fd333e63ca4
0190e 4533d2                         xor        r10d, r10d
01911 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01916 e9b7e8ffff                     jmp        0x7fd333e63cd2
0191b 4533d2                         xor        r10d, r10d
0191e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01923 e9d8e8ffff                     jmp        0x7fd333e63d00
01928 4533d2                         xor        r10d, r10d
0192b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01930 e9f6e8ffff                     jmp        0x7fd333e63d2b
01935 bee4ffffff                     mov        esi, 0xffffffe4
0193a 488b2c24                       mov        rbp, qword ptr [rsp]
0193e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01943 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01948 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0194d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0195b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0196d 89442460                       mov        dword ptr [rsp + 0x60], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 48894424f8                     mov        qword ptr [rsp - 8], rax
0197b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0197f 89442464                       mov        dword ptr [rsp + 0x64], eax
01983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01988 48894424f8                     mov        qword ptr [rsp - 8], rax
0198d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01991 89442468                       mov        dword ptr [rsp + 0x68], eax
01995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199a 48894424f8                     mov        qword ptr [rsp - 8], rax
0199f 8b442478                       mov        eax, dword ptr [rsp + 0x78]
019a3 8944246c                       mov        dword ptr [rsp + 0x6c], eax
019a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ac 895c2474                       mov        dword ptr [rsp + 0x74], ebx
019b0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
019b5 666690                         nop        
019b8 c5f877                         vzeroupper 
019bb e8a0e1b5ff                     call       0x7fd3339c3660
019c0 0f1f8400b81a0019               nop        dword ptr [rax + rax + 0x19001ab8]
019c8 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
019d1 bee4ffffff                     mov        esi, 0xffffffe4
019d6 488b2c24                       mov        rbp, qword ptr [rsp]
019da 4c891424                       mov        qword ptr [rsp], r10
019de 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019e3 4489542408                     mov        dword ptr [rsp + 8], r10d
019e8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019ed 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019fc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a01 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a06 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a0b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a10 48894424f8                     mov        qword ptr [rsp - 8], rax
01a15 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a19 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a22 48894424f8                     mov        qword ptr [rsp - 8], rax
01a27 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a2b 89442460                       mov        dword ptr [rsp + 0x60], eax
01a2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a34 48894424f8                     mov        qword ptr [rsp - 8], rax
01a39 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a3d 89442464                       mov        dword ptr [rsp + 0x64], eax
01a41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a46 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a4f 89442468                       mov        dword ptr [rsp + 0x68], eax
01a53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a58 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a61 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01a6e 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01a72 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01a7a 6690                           nop        
01a7c c5f877                         vzeroupper 
01a7f e8dce0b5ff                     call       0x7fd3339c3660
01a84 0f1f84007c1b001a               nop        dword ptr [rax + rax + 0x1a001b7c]
01a8c 8be9                           mov        ebp, ecx
01a8e 83c510                         add        ebp, 0x10
01a91 be6effffff                     mov        esi, 0xffffff6e
01a96 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a9b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01aa0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01aa5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01aaa 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01aae 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ab7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01abb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ac9 89442460                       mov        dword ptr [rsp + 0x60], eax
01acd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01adb 89442464                       mov        dword ptr [rsp + 0x64], eax
01adf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01aed 89442468                       mov        dword ptr [rsp + 0x68], eax
01af1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af6 48894424f8                     mov        qword ptr [rsp - 8], rax
01afb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01aff 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b08 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01b0c c5f877                         vzeroupper 
01b0f e84ce0b5ff                     call       0x7fd3339c3660
01b14 0f1f84000c1c001b               nop        dword ptr [rax + rax + 0x1b001c0c]
01b1c 8be9                           mov        ebp, ecx
01b1e 83c510                         add        ebp, 0x10
01b21 be66ffffff                     mov        esi, 0xffffff66
01b26 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b2b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b30 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b35 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b3a 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b47 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b50 48894424f8                     mov        qword ptr [rsp - 8], rax
01b55 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b59 89442460                       mov        dword ptr [rsp + 0x60], eax
01b5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b62 48894424f8                     mov        qword ptr [rsp - 8], rax
01b67 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b6b 89442464                       mov        dword ptr [rsp + 0x64], eax
01b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b74 48894424f8                     mov        qword ptr [rsp - 8], rax
01b79 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b7d 89442468                       mov        dword ptr [rsp + 0x68], eax
01b81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b86 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b8f 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01b93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b98 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01b9c c5f877                         vzeroupper 
01b9f e8bcdfb5ff                     call       0x7fd3339c3660
01ba4 0f1f84009c1c001c               nop        dword ptr [rax + rax + 0x1c001c9c]
01bac bebeffffff                     mov        esi, 0xffffffbe
01bb1 488b2c24                       mov        rbp, qword ptr [rsp]
01bb5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bba 4c891424                       mov        qword ptr [rsp], r10
01bbe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bc3 4489542408                     mov        dword ptr [rsp + 8], r10d
01bc8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bcd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bd2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bd7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bdc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01be1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01be6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01beb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01bf0 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01bf5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfa 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bfe 89442434                       mov        dword ptr [rsp + 0x34], eax
01c02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c07 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c10 89442438                       mov        dword ptr [rsp + 0x38], eax
01c14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c19 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1e 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c22 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2b 48ff742450                     push       qword ptr [rsp + 0x50]
01c30 488f442448                     pop        qword ptr [rsp + 0x48]
01c35 48ff742458                     push       qword ptr [rsp + 0x58]
01c3a 488f442450                     pop        qword ptr [rsp + 0x50]
01c3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c44 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c48 89442458                       mov        dword ptr [rsp + 0x58], eax
01c4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c51 666690                         nop        
01c54 c5f877                         vzeroupper 
01c57 e804dfb5ff                     call       0x7fd3339c3660
01c5c 0f1f8400541d001d               nop        dword ptr [rax + rax + 0x1d001d54]
01c64 be85ffffff                     mov        esi, 0xffffff85
01c69 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01c6d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c72 44891424                       mov        dword ptr [rsp], r10d
01c76 44896c2404                     mov        dword ptr [rsp + 4], r13d
01c7b 90                             nop        
01c7c c5f877                         vzeroupper 
01c7f e8dcdeb5ff                     call       0x7fd3339c3660
01c84 0f1f84007c1d001e               nop        dword ptr [rax + rax + 0x1e001d7c]
01c8c bee4ffffff                     mov        esi, 0xffffffe4
01c91 488b2c24                       mov        rbp, qword ptr [rsp]
01c95 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c9a 4c891424                       mov        qword ptr [rsp], r10
01c9e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ca3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ca8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01cad 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cb2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cb7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cbc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cc1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cc6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ccb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cd0 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01cde 89442434                       mov        dword ptr [rsp + 0x34], eax
01ce2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cec 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01cf0 89442438                       mov        dword ptr [rsp + 0x38], eax
01cf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfe 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01d02 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0b 48ff742450                     push       qword ptr [rsp + 0x50]
01d10 488f442448                     pop        qword ptr [rsp + 0x48]
01d15 48ff742458                     push       qword ptr [rsp + 0x58]
01d1a 488f442450                     pop        qword ptr [rsp + 0x50]
01d1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d24 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d28 89442458                       mov        dword ptr [rsp + 0x58], eax
01d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d3a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 48894424f8                     mov        qword ptr [rsp - 8], rax
01d48 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d4c 89442460                       mov        dword ptr [rsp + 0x60], eax
01d50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d55 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d5e 89442464                       mov        dword ptr [rsp + 0x64], eax
01d62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d67 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6c 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d70 89442468                       mov        dword ptr [rsp + 0x68], eax
01d74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d79 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01d80 c5f877                         vzeroupper 
01d83 e8d8ddb5ff                     call       0x7fd3339c3660
01d88 0f1f8400801e001f               nop        dword ptr [rax + rax + 0x1f001e80]
01d90 bef6ffffff                     mov        esi, 0xfffffff6
01d95 666690                         nop        
01d98 c5f877                         vzeroupper 
01d9b e8c0ddb5ff                     call       0x7fd3339c3660
01da0 0f1f8400981e0020               nop        dword ptr [rax + rax + 0x20001e98]
01da8 beccffffff                     mov        esi, 0xffffffcc
01dad 488b2c24                       mov        rbp, qword ptr [rsp]
01db1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01db6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01dbb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01dc0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dca 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01dce 89442470                       mov        dword ptr [rsp + 0x70], eax
01dd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd7 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01ddc c5f877                         vzeroupper 
01ddf e87cddb5ff                     call       0x7fd3339c3660
01de4 0f1f8400dc1e0021               nop        dword ptr [rax + rax + 0x21001edc]
01dec bee4ffffff                     mov        esi, 0xffffffe4
01df1 488b2c24                       mov        rbp, qword ptr [rsp]
01df5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dfa 4c891424                       mov        qword ptr [rsp], r10
01dfe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e03 4489542408                     mov        dword ptr [rsp + 8], r10d
01e08 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e0d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e12 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e17 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e1c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e21 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e26 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e2b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e30 48894424f8                     mov        qword ptr [rsp - 8], rax
01e35 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e39 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01e3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e42 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01e4a 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01e4f 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01e57 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01e5c 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01e64 c5f877                         vzeroupper 
01e67 e8f4dcb5ff                     call       0x7fd3339c3660
01e6c 0f1f8400641f0022               nop        dword ptr [rax + rax + 0x22001f64]
01e74 bee4ffffff                     mov        esi, 0xffffffe4
01e79 488b2c24                       mov        rbp, qword ptr [rsp]
01e7d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e82 4c891424                       mov        qword ptr [rsp], r10
01e86 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e8b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e90 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e95 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e9a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e9f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ea4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ea9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01eae 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01eb3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ebd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ec1 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eca 6690                           nop        
01ecc c5f877                         vzeroupper 
01ecf e88cdcb5ff                     call       0x7fd3339c3660
01ed4 0f1f8400cc1f0023               nop        dword ptr [rax + rax + 0x23001fcc]
01edc beccffffff                     mov        esi, 0xffffffcc
01ee1 488b2c24                       mov        rbp, qword ptr [rsp]
01ee5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01eea 4c891424                       mov        qword ptr [rsp], r10
01eee 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ef3 4489542408                     mov        dword ptr [rsp + 8], r10d
01ef8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01efd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f02 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f07 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f0c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f11 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f16 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f1b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f20 c5f877                         vzeroupper 
01f23 e838dcb5ff                     call       0x7fd3339c3660
01f28 0f1f840020200024               nop        dword ptr [rax + rax + 0x24002020]
01f30 be6effffff                     mov        esi, 0xffffff6e
01f35 488b2c24                       mov        rbp, qword ptr [rsp]
01f39 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f3e 4c891424                       mov        qword ptr [rsp], r10
01f42 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f47 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f4c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f51 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f56 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f5b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f60 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f65 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f6f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f74 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01f79 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f82 89442434                       mov        dword ptr [rsp + 0x34], eax
01f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f90 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f94 89442438                       mov        dword ptr [rsp + 0x38], eax
01f98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01fa6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01faa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01faf 48ff742450                     push       qword ptr [rsp + 0x50]
01fb4 488f442448                     pop        qword ptr [rsp + 0x48]
01fb9 48ff742458                     push       qword ptr [rsp + 0x58]
01fbe 488f442450                     pop        qword ptr [rsp + 0x50]
01fc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fcc 89442458                       mov        dword ptr [rsp + 0x58], eax
01fd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fda 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fde 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fe2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fec 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ff0 89442460                       mov        dword ptr [rsp + 0x60], eax
01ff4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffe 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02002 89442464                       mov        dword ptr [rsp + 0x64], eax
02006 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200b 48894424f8                     mov        qword ptr [rsp - 8], rax
02010 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02014 89442468                       mov        dword ptr [rsp + 0x68], eax
02018 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02022 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02026 6690                           nop        
02028 c5f877                         vzeroupper 
0202b e830dbb5ff                     call       0x7fd3339c3660
02030 0f1f840028210025               nop        dword ptr [rax + rax + 0x25002128]
02038 458bd1                         mov        r10d, r9d
0203b e9cdeeffff                     jmp        0x7fd333e64a0d
02040 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
02048 458d5a08                       lea        r11d, [r10 + 8]
0204c 458bcb                         mov        r9d, r11d
0204f be6effffff                     mov        esi, 0xffffff6e
02054 488b2c24                       mov        rbp, qword ptr [rsp]
02058 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0205d 4c891424                       mov        qword ptr [rsp], r10
02061 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02066 44895c2408                     mov        dword ptr [rsp + 8], r11d
0206b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02070 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02075 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0207a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0207f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02084 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02089 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0208e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02093 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02098 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0209d 48ff742440                     push       qword ptr [rsp + 0x40]
020a2 488f442438                     pop        qword ptr [rsp + 0x38]
020a7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020ac 4489542440                     mov        dword ptr [rsp + 0x40], r10d
020b1 48ff742450                     push       qword ptr [rsp + 0x50]
020b6 488f442448                     pop        qword ptr [rsp + 0x48]
020bb 48ff742458                     push       qword ptr [rsp + 0x58]
020c0 488f442450                     pop        qword ptr [rsp + 0x50]
020c5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020ca 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
020cf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020d4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
020d9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
020de 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
020e3 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
020eb 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
020f0 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
020f5 666690                         nop        
020f8 c5f877                         vzeroupper 
020fb e860dab5ff                     call       0x7fd3339c3660
02100 0f1f8400f8210026               nop        dword ptr [rax + rax + 0x260021f8]
02108 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
02110 458d5a08                       lea        r11d, [r10 + 8]
02114 458bcb                         mov        r9d, r11d
02117 be66ffffff                     mov        esi, 0xffffff66
0211c 488b2c24                       mov        rbp, qword ptr [rsp]
02120 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02125 4c891424                       mov        qword ptr [rsp], r10
02129 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0212e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02133 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02138 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0213d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02142 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02147 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0214c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02151 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02156 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0215b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02160 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02165 48ff742440                     push       qword ptr [rsp + 0x40]
0216a 488f442438                     pop        qword ptr [rsp + 0x38]
0216f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02174 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02179 48ff742450                     push       qword ptr [rsp + 0x50]
0217e 488f442448                     pop        qword ptr [rsp + 0x48]
02183 48ff742458                     push       qword ptr [rsp + 0x58]
02188 488f442450                     pop        qword ptr [rsp + 0x50]
0218d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02192 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02197 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0219c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
021a1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
021a6 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
021ab 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
021b3 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
021b8 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
021bd 666690                         nop        
021c0 c5f877                         vzeroupper 
021c3 e898d9b5ff                     call       0x7fd3339c3660
021c8 0f1f8400c0220027               nop        dword ptr [rax + rax + 0x270022c0]
021d0 beccffffff                     mov        esi, 0xffffffcc
021d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021da 4489542414                     mov        dword ptr [rsp + 0x14], r10d
021df 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021e4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021e9 48894424f8                     mov        qword ptr [rsp - 8], rax
021ee 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021f2 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02200 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02204 89442460                       mov        dword ptr [rsp + 0x60], eax
02208 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220d 48894424f8                     mov        qword ptr [rsp - 8], rax
02212 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02216 89442464                       mov        dword ptr [rsp + 0x64], eax
0221a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221f 48894424f8                     mov        qword ptr [rsp - 8], rax
02224 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02228 89442468                       mov        dword ptr [rsp + 0x68], eax
0222c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02231 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02235 666690                         nop        
02238 c5f877                         vzeroupper 
0223b e820d9b5ff                     call       0x7fd3339c3660
02240 0f1f840038230028               nop        dword ptr [rax + rax + 0x28002338]
02248 bee4ffffff                     mov        esi, 0xffffffe4
0224d 488b2c24                       mov        rbp, qword ptr [rsp]
02251 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02256 4c891424                       mov        qword ptr [rsp], r10
0225a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0225f 4489542408                     mov        dword ptr [rsp + 8], r10d
02264 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02269 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0226e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02273 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02278 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0227d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02282 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02287 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0228c 48894424f8                     mov        qword ptr [rsp - 8], rax
02291 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02295 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02299 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229e 48894424f8                     mov        qword ptr [rsp - 8], rax
022a3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
022a7 89442460                       mov        dword ptr [rsp + 0x60], eax
022ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b0 48894424f8                     mov        qword ptr [rsp - 8], rax
022b5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
022b9 89442464                       mov        dword ptr [rsp + 0x64], eax
022bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c2 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
022ca 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
022cf 48894424f8                     mov        qword ptr [rsp - 8], rax
022d4 8b442478                       mov        eax, dword ptr [rsp + 0x78]
022d8 89442474                       mov        dword ptr [rsp + 0x74], eax
022dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e1 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
022e9 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
022f1 666690                         nop        
022f4 c5f877                         vzeroupper 
022f7 e864d8b5ff                     call       0x7fd3339c3660
022fc 0f1f8400f4230029               nop        dword ptr [rax + rax + 0x290023f4]
02304 bee4ffffff                     mov        esi, 0xffffffe4
02309 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0230e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02313 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02318 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02326 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 48894424f8                     mov        qword ptr [rsp - 8], rax
02334 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02338 89442460                       mov        dword ptr [rsp + 0x60], eax
0233c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02341 48894424f8                     mov        qword ptr [rsp - 8], rax
02346 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0234a 89442464                       mov        dword ptr [rsp + 0x64], eax
0234e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02353 90                             nop        
02354 c5f877                         vzeroupper 
02357 e804d8b5ff                     call       0x7fd3339c3660
0235c 0f1f84005424002a               nop        dword ptr [rax + rax + 0x2a002454]
02364 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
0236b ffc5                           inc        ebp
0236d bee4ffffff                     mov        esi, 0xffffffe4
02372 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02377 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0237c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02381 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02386 48894424f8                     mov        qword ptr [rsp - 8], rax
0238b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0238f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02393 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02398 48894424f8                     mov        qword ptr [rsp - 8], rax
0239d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023a1 89442460                       mov        dword ptr [rsp + 0x60], eax
023a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023aa 48894424f8                     mov        qword ptr [rsp - 8], rax
023af 8b442468                       mov        eax, dword ptr [rsp + 0x68]
023b3 89442464                       mov        dword ptr [rsp + 0x64], eax
023b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023bc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
023c4 4489542470                     mov        dword ptr [rsp + 0x70], r10d
023c9 666690                         nop        
023cc c5f877                         vzeroupper 
023cf e88cd7b5ff                     call       0x7fd3339c3660
023d4 0f1f8400cc24002b               nop        dword ptr [rax + rax + 0x2b0024cc]
023dc bee4ffffff                     mov        esi, 0xffffffe4
023e1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023e6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
023eb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
023f0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023f5 48894424f8                     mov        qword ptr [rsp - 8], rax
023fa 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023fe 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02402 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02407 48894424f8                     mov        qword ptr [rsp - 8], rax
0240c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02410 89442460                       mov        dword ptr [rsp + 0x60], eax
02414 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02419 48894424f8                     mov        qword ptr [rsp - 8], rax
0241e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02422 89442464                       mov        dword ptr [rsp + 0x64], eax
02426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242b 90                             nop        
0242c c5f877                         vzeroupper 
0242f e82cd7b5ff                     call       0x7fd3339c3660
02434 0f1f84002c25002c               nop        dword ptr [rax + rax + 0x2c00252c]
0243c bee4ffffff                     mov        esi, 0xffffffe4
02441 488b2c24                       mov        rbp, qword ptr [rsp]
02445 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0244a 4c891424                       mov        qword ptr [rsp], r10
0244e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02453 44895c2408                     mov        dword ptr [rsp + 8], r11d
02458 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0245d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02462 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02467 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0246c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02471 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02476 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0247b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02480 48894424f8                     mov        qword ptr [rsp - 8], rax
02485 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02489 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0248d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02492 48894424f8                     mov        qword ptr [rsp - 8], rax
02497 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0249b 89442460                       mov        dword ptr [rsp + 0x60], eax
0249f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a4 48894424f8                     mov        qword ptr [rsp - 8], rax
024a9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
024ad 89442464                       mov        dword ptr [rsp + 0x64], eax
024b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b6 48894424f8                     mov        qword ptr [rsp - 8], rax
024bb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
024bf 89442470                       mov        dword ptr [rsp + 0x70], eax
024c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c8 c5f877                         vzeroupper 
024cb e890d6b5ff                     call       0x7fd3339c3660
024d0 0f1f8400c825002d               nop        dword ptr [rax + rax + 0x2d0025c8]
024d8 beccffffff                     mov        esi, 0xffffffcc
024dd 488b2c24                       mov        rbp, qword ptr [rsp]
024e1 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
024e6 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
024eb 90                             nop        
024ec c5f877                         vzeroupper 
024ef e86cd6b5ff                     call       0x7fd3339c3660
024f4 0f1f8400ec25002e               nop        dword ptr [rax + rax + 0x2e0025ec]
024fc beccffffff                     mov        esi, 0xffffffcc
02501 488b2c24                       mov        rbp, qword ptr [rsp]
02505 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0250a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0250f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02514 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02519 48894424f8                     mov        qword ptr [rsp - 8], rax
0251e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02522 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0252b 48894424f8                     mov        qword ptr [rsp - 8], rax
02530 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02534 89442460                       mov        dword ptr [rsp + 0x60], eax
02538 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253d 48894424f8                     mov        qword ptr [rsp - 8], rax
02542 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02546 89442464                       mov        dword ptr [rsp + 0x64], eax
0254a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254f 4489ac248c000000               mov        dword ptr [rsp + 0x8c], r13d
02557 90                             nop        
02558 c5f877                         vzeroupper 
0255b e800d6b5ff                     call       0x7fd3339c3660
02560 0f1f84005826002f               nop        dword ptr [rax + rax + 0x2f002658]
02568 beccffffff                     mov        esi, 0xffffffcc
0256d 488b2c24                       mov        rbp, qword ptr [rsp]
02571 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02576 4c891424                       mov        qword ptr [rsp], r10
0257a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0257f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02584 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02589 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0258e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02593 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02598 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0259d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025a2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
025a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
025ac 48894424f8                     mov        qword ptr [rsp - 8], rax
025b1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025b5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
025b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025be 48894424f8                     mov        qword ptr [rsp - 8], rax
025c3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025c7 89442460                       mov        dword ptr [rsp + 0x60], eax
025cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d0 48894424f8                     mov        qword ptr [rsp - 8], rax
025d5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
025d9 89442464                       mov        dword ptr [rsp + 0x64], eax
025dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e2 48894424f8                     mov        qword ptr [rsp - 8], rax
025e7 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
025eb 89442468                       mov        dword ptr [rsp + 0x68], eax
025ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f4 48894424f8                     mov        qword ptr [rsp - 8], rax
025f9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
025fd 89442470                       mov        dword ptr [rsp + 0x70], eax
02601 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02606 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0260a 6690                           nop        
0260c c5f877                         vzeroupper 
0260f e84cd5b5ff                     call       0x7fd3339c3660
02614 0f1f84000c270030               nop        dword ptr [rax + rax + 0x3000270c]
0261c beccffffff                     mov        esi, 0xffffffcc
02621 488b2c24                       mov        rbp, qword ptr [rsp]
02625 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0262a 4c891424                       mov        qword ptr [rsp], r10
0262e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02633 44895c2408                     mov        dword ptr [rsp + 8], r11d
02638 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0263d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02642 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02647 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0264c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02651 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02656 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0265b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02660 48894424f8                     mov        qword ptr [rsp - 8], rax
02665 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02669 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0266d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02672 48894424f8                     mov        qword ptr [rsp - 8], rax
02677 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0267b 89442460                       mov        dword ptr [rsp + 0x60], eax
0267f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02684 48894424f8                     mov        qword ptr [rsp - 8], rax
02689 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0268d 89442464                       mov        dword ptr [rsp + 0x64], eax
02691 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02696 48894424f8                     mov        qword ptr [rsp - 8], rax
0269b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0269f 89442468                       mov        dword ptr [rsp + 0x68], eax
026a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a8 895c2474                       mov        dword ptr [rsp + 0x74], ebx
026ac c5f877                         vzeroupper 
026af e8acd4b5ff                     call       0x7fd3339c3660
026b4 0f1f8400ac270031               nop        dword ptr [rax + rax + 0x310027ac]
026bc eb10                           jmp        0x7fd333e661ce
026be eb0e                           jmp        0x7fd333e661ce
026c0 eb0c                           jmp        0x7fd333e661ce
026c2 eb0a                           jmp        0x7fd333e661ce
026c4 eb08                           jmp        0x7fd333e661ce
026c6 eb06                           jmp        0x7fd333e661ce
026c8 eb04                           jmp        0x7fd333e661ce
026ca eb02                           jmp        0x7fd333e661ce
026cc eb00                           jmp        0x7fd333e661ce
026ce 488bf0                         mov        rsi, rax
026d1 e902e1ffff                     jmp        0x7fd333e642d8
026d6 bef6ffffff                     mov        esi, 0xfffffff6
026db 90                             nop        
026dc c5f877                         vzeroupper 
026df e87cd4b5ff                     call       0x7fd3339c3660
026e4 0f1f8400dc270032               nop        dword ptr [rax + rax + 0x320027dc]
026ec 49bae44ae633d37f0000           movabs     r10, 0x7fd333e64ae4
026f6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
026fd e9de7ca9ff                     jmp        0x7fd3338fdee0
02702 e89948a8ff                     call       0x7fd3338eaaa0
02707 e922d9ffff                     jmp        0x7fd333e63b2e
0270c f4                             hlt        
0270d f4                             hlt        
0270e f4                             hlt        
0270f f4                             hlt        
