00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ece0000000                 sub        rsp, 0xe0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8598200000                   jne        0x7f4313bd1fb6
0001e 4889742440                     mov        qword ptr [rsp + 0x40], rsi
00023 8d5aff                         lea        ebx, [rdx - 1]
00026 448b5604                       mov        r10d, dword ptr [rsi + 4]
0002a 413bda                         cmp        ebx, r10d
0002d 0f83160c0000                   jae        0x7f4313bd0b49
00033 0fb6441607                     movzx      eax, byte ptr [rsi + rdx + 7]
00038 85c0                           test       eax, eax
0003a 0f84240e0000                   je         0x7f4313bd0d64
00040 448bda                         mov        r11d, edx
00043 442bd9                         sub        r11d, ecx
00046 f30fbdd8                       lzcnt      ebx, eax
0004a 428d34dd00000000               lea        esi, [r11*8]
00052 b81f000000                     mov        eax, 0x1f
00057 2bc3                           sub        eax, ebx
00059 41be08000000                   mov        r14d, 8
0005f 442bf0                         sub        r14d, eax
00062 8bde                           mov        ebx, esi
00064 412bde                         sub        ebx, r14d
00067 4183fb08                       cmp        r11d, 8
0006b 0f8d1b0e0000                   jge        0x7f4313bd0d8c
00071 895c2428                       mov        dword ptr [rsp + 0x28], ebx
00075 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
0007c 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00081 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00086 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0008a 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0008e 4863d9                         movsxd     rbx, ecx
00091 4963fa                         movsxd     rdi, r10d
00094 4585db                         test       r11d, r11d
00097 0f8f570a0000                   jg         0x7f4313bd09f4
0009d 4533c0                         xor        r8d, r8d
000a0 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000a5 458d43f8                       lea        r8d, [r11 - 8]
000a9 4183f808                       cmp        r8d, 8
000ad 0f8d2d0e0000                   jge        0x7f4313bd0de0
000b3 4585c0                         test       r8d, r8d
000b6 0f8e4f010000                   jle        0x7f4313bd010b
000bc 418d6bf7                       lea        ebp, [r11 - 9]
000c0 85ed                           test       ebp, ebp
000c2 0f8c790b0000                   jl         0x7f4313bd0b41
000c8 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
000cd 453bca                         cmp        r9d, r10d
000d0 0f83021d0000                   jae        0x7f4313bd1cd8
000d6 4c63d5                         movsxd     r10, ebp
000d9 4c03d3                         add        r10, rbx
000dc 4c3bd7                         cmp        r10, rdi
000df 0f83f31c0000                   jae        0x7f4313bd1cd8
000e5 85ed                           test       ebp, ebp
000e7 0f8ecb1d0000                   jle        0x7f4313bd1db8
000ed 4183c3f6                       add        r11d, -0xa
000f1 33c9                           xor        ecx, ecx
000f3 48c1e108                       shl        rcx, 8
000f7 448bd5                         mov        r10d, ebp
000fa 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
000ff 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00104 4f0fb6441008                   movzx      r8, byte ptr [r8 + r10 + 8]
0010a 4c0bc1                         or         r8, rcx
0010d 448d4dff                       lea        r9d, [rbp - 1]
00111 453bcb                         cmp        r9d, r11d
00114 7e08                           jle        0x7f4313bd001e
00116 498bc8                         mov        rcx, r8
00119 418be9                         mov        ebp, r9d
0011c ebd5                           jmp        0x7f4313bcfff3
0011e 4183f902                       cmp        r9d, 2
00122 0f8e93000000                   jle        0x7f4313bd00bb
00128 4d63d1                         movsxd     r10, r9d
0012b 4c03d3                         add        r10, rbx
0012e 4c3bd7                         cmp        r10, rdi
00131 0f83f91c0000                   jae        0x7f4313bd1d30
00137 83c5fc                         add        ebp, -4
0013a 4c63d5                         movsxd     r10, ebp
0013d 4c03d3                         add        r10, rbx
00140 4c3bd7                         cmp        r10, rdi
00143 0f83fb1c0000                   jae        0x7f4313bd1d44
00149 90                             nop        
0014a 90                             nop        
0014b 90                             nop        
0014c 90                             nop        
0014d 90                             nop        
0014e 90                             nop        
0014f 90                             nop        
00150 49c1e008                       shl        r8, 8
00154 418bc9                         mov        ecx, r9d
00157 034c243c                       add        ecx, dword ptr [rsp + 0x3c]
0015b 458bd9                         mov        r11d, r9d
0015e 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
00163 4d63db                         movsxd     r11, r11d
00166 448d51fe                       lea        r10d, [rcx - 2]
0016a 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
0016f 4a0fb6541208                   movzx      rdx, byte ptr [rdx + r10 + 8]
00175 83c1fd                         add        ecx, -3
00178 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0017d 4d0fb6540a08                   movzx      r10, byte ptr [r10 + rcx + 8]
00183 488b4c2440                     mov        rcx, qword ptr [rsp + 0x40]
00188 4a0fb64c1907                   movzx      rcx, byte ptr [rcx + r11 + 7]
0018e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00193 4e0fb65c1d08                   movzx      r11, byte ptr [rbp + r11 + 8]
00199 4d0bc3                         or         r8, r11
0019c 49c1e008                       shl        r8, 8
001a0 4c0bc1                         or         r8, rcx
001a3 49c1e008                       shl        r8, 8
001a7 4c0bc2                         or         r8, rdx
001aa 49c1e008                       shl        r8, 8
001ae 4d0bc2                         or         r8, r10
001b1 4183c1fc                       add        r9d, -4
001b5 4183f902                       cmp        r9d, 2
001b9 7f95                           jg         0x7f4313bd0050
001bb 4183f9ff                       cmp        r9d, -1
001bf 7e37                           jle        0x7f4313bd00f8
001c1 4d63d1                         movsxd     r10, r9d
001c4 4c03d3                         add        r10, rbx
001c7 4c3bd7                         cmp        r10, rdi
001ca 0f83541d0000                   jae        0x7f4313bd1e24
001d0 49c1e008                       shl        r8, 8
001d4 458bd9                         mov        r11d, r9d
001d7 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
001dc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
001e1 4f0fb65c1a08                   movzx      r11, byte ptr [r10 + r11 + 8]
001e7 4d0bd8                         or         r11, r8
001ea 41ffc9                         dec        r9d
001ed 4183f9ff                       cmp        r9d, -1
001f1 7e08                           jle        0x7f4313bd00fb
001f3 4d8bc3                         mov        r8, r11
001f6 ebd8                           jmp        0x7f4313bd00d0
001f8 4d8bd8                         mov        r11, r8
001fb 41ba80000000                   mov        r10d, 0x80
00201 442bd6                         sub        r10d, esi
00204 c442a9f7db                     shlx       r11, r11, r10
00209 eb03                           jmp        0x7f4313bd010e
0020b 4533db                         xor        r11d, r11d
0020e 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
00213 458b5018                       mov        r10d, dword ptr [r8 + 0x18]
00217 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0021c 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00221 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00225 418bd2                         mov        edx, r10d
00228 458b501c                       mov        r10d, dword ptr [r8 + 0x1c]
0022c 4489542454                     mov        dword ptr [rsp + 0x54], r10d
00231 458b4204                       mov        r8d, dword ptr [r10 + 4]
00235 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0023a 458b5220                       mov        r10d, dword ptr [r10 + 0x20]
0023e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00243 458b5204                       mov        r10d, dword ptr [r10 + 4]
00247 b940000000                     mov        ecx, 0x40
0024c 412bce                         sub        ecx, r14d
0024f 458bc8                         mov        r9d, r8d
00252 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00257 45034b04                       add        r9d, dword ptr [r11 + 4]
0025b 4503ca                         add        r9d, r10d
0025e 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00263 4585c9                         test       r9d, r9d
00266 0f84c00c0000                   je         0x7f4313bd0e2c
0026c 443bc9                         cmp        r9d, ecx
0026f 0f8f370d0000                   jg         0x7f4313bd0eac
00275 412bc9                         sub        ecx, r9d
00278 c462f3f74c2430                 shrx       r9, qword ptr [rsp + 0x30], rcx
0027f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00284 4183fb40                       cmp        r11d, 0x40
00288 0f8da60d0000                   jge        0x7f4313bd0f34
0028e 442bd8                         sub        r11d, eax
00291 4183c308                       add        r11d, 8
00295 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0029a b901000000                     mov        ecx, 1
0029f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
002a4 c4e2a1f7c9                     shlx       rcx, rcx, r11
002a9 48ffc9                         dec        rcx
002ac 4923c9                         and        rcx, r9
002af 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002b4 4183fb40                       cmp        r11d, 0x40
002b8 0f8d060e0000                   jge        0x7f4313bd0fc4
002be 4183fa20                       cmp        r10d, 0x20
002c2 0f8d740e0000                   jge        0x7f4313bd103c
002c8 c462abf7c9                     shrx       r9, rcx, r10
002cd 41bb01000000                   mov        r11d, 1
002d3 c44229f7d3                     shlx       r10d, r11d, r10d
002d8 41ffca                         dec        r10d
002db 4d63d2                         movsxd     r10, r10d
002de 4c23d1                         and        r10, rcx
002e1 458bd2                         mov        r10d, r10d
002e4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
002e9 4183f820                       cmp        r8d, 0x20
002ed 0f8de10e0000                   jge        0x7f4313bd10d4
002f3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
002f8 458b5204                       mov        r10d, dword ptr [r10 + 4]
002fc 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00301 448bd2                         mov        r10d, edx
00304 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00308 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0030d 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00311 418bea                         mov        ebp, r10d
00314 418b7a04                       mov        edi, dword ptr [r10 + 4]
00318 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0031d 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00321 418bc2                         mov        eax, r10d
00324 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00328 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00330 4585d2                         test       r10d, r10d
00333 0f8e79070000                   jle        0x7f4313bd09b2
00339 c44239f7d3                     shlx       r10d, r11d, r8d
0033e c442bbf7d9                     shrx       r11, r9, r8
00343 41ffca                         dec        r10d
00346 458bc3                         mov        r8d, r11d
00349 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00351 4d63d2                         movsxd     r10, r10d
00354 4d23d1                         and        r10, r9
00357 458bd2                         mov        r10d, r10d
0035a 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00362 448d51ff                       lea        r10d, [rcx - 1]
00366 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0036e 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00373 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
0037a 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00382 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00387 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0038e 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00396 448d5bff                       lea        r11d, [rbx - 1]
0039a 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
003a2 448d57ff                       lea        r10d, [rdi - 1]
003a6 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
003ae 85c9                           test       ecx, ecx
003b0 0f86da080000                   jbe        0x7f4313bd0b90
003b6 85ff                           test       edi, edi
003b8 0f86d2080000                   jbe        0x7f4313bd0b90
003be 85db                           test       ebx, ebx
003c0 0f86ca080000                   jbe        0x7f4313bd0b90
003c6 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
003ce 458b5204                       mov        r10d, dword ptr [r10 + 4]
003d2 4585d2                         test       r10d, r10d
003d5 0f86b5080000                   jbe        0x7f4313bd0b90
003db 4d63da                         movsxd     r11, r10d
003de 4c63842488000000               movsxd     r8, dword ptr [rsp + 0x88]
003e6 49ffc8                         dec        r8
003e9 4d3bc3                         cmp        r8, r11
003ec 0f839e080000                   jae        0x7f4313bd0b90
003f2 4983f801                       cmp        r8, 1
003f6 41bb01000000                   mov        r11d, 1
003fc 4d0f4cc3                       cmovl      r8, r11
00400 418bf8                         mov        edi, r8d
00403 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
0040a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00412 410f4ffb                       cmovg      edi, r11d
00416 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0041b 44239c24ac000000               and        r11d, dword ptr [rsp + 0xac]
00423 418bcb                         mov        ecx, r11d
00426 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0042e 44239c24b0000000               and        r11d, dword ptr [rsp + 0xb0]
00436 458bf3                         mov        r14d, r11d
00439 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00441 44239c24a4000000               and        r11d, dword ptr [rsp + 0xa4]
00449 4533c0                         xor        r8d, r8d
0044c 4533c9                         xor        r9d, r9d
0044f 4489542404                     mov        dword ptr [rsp + 4], r10d
00454 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0045c 4c898c24c0000000               mov        qword ptr [rsp + 0xc0], r9
00464 8bf2                           mov        esi, edx
00466 44891c24                       mov        dword ptr [rsp], r11d
0046a 4e8b5cda08                     mov        r11, qword ptr [rdx + r11*8 + 8]
0046f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00477 41ffc2                         inc        r10d
0047a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00482 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00487 49c1eb20                       shr        r11, 0x20
0048b 458bd3                         mov        r10d, r11d
0048e 450fb6c2                       movzx      r8d, r10b
00492 8bd8                           mov        ebx, eax
00494 4c8b54c808                     mov        r10, qword ptr [rax + rcx*8 + 8]
00499 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
004a1 448bdd                         mov        r11d, ebp
004a4 458bce                         mov        r9d, r14d
004a7 4e8b54f508                     mov        r10, qword ptr [rbp + r14*8 + 8]
004ac 4c89542470                     mov        qword ptr [rsp + 0x70], r10
004b1 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
004b9 49c1ea20                       shr        r10, 0x20
004bd 458bd2                         mov        r10d, r10d
004c0 450fb6d2                       movzx      r10d, r10b
004c4 488b542470                     mov        rdx, qword ptr [rsp + 0x70]
004c9 48c1ea20                       shr        rdx, 0x20
004cd 8bc2                           mov        eax, edx
004cf 440fb6f0                       movzx      r14d, al
004d3 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
004da 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
004e1 0f8c910d0000                   jl         0x7f4313bd1178
004e7 438d0432                       lea        eax, [r10 + r14]
004eb 4103c0                         add        eax, r8d
004ee 0f84600e0000                   je         0x7f4313bd1254
004f4 83f83f                         cmp        eax, 0x3f
004f7 0f8f470f0000                   jg         0x7f4313bd1344
004fd bd40000000                     mov        ebp, 0x40
00502 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00506 3bc5                           cmp        eax, ebp
00508 0f8f26100000                   jg         0x7f4313bd1434
0050e 2be8                           sub        ebp, eax
00510 c4e2d3f7542430                 shrx       rdx, qword ptr [rsp + 0x30], rbp
00517 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
0051c 4403e8                         add        r13d, eax
0051f 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00524 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
00529 4403e8                         add        r13d, eax
0052c 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
00531 bd01000000                     mov        ebp, 1
00536 c4e2f9f7c5                     shlx       rax, rbp, rax
0053b 48ffc8                         dec        rax
0053e 4823d0                         and        rdx, rax
00541 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
00545 83f840                         cmp        eax, 0x40
00548 0f8dd2100000                   jge        0x7f4313bd1520
0054e 4183f840                       cmp        r8d, 0x40
00552 0f8d98110000                   jge        0x7f4313bd15f0
00558 c4e2bbf7c2                     shrx       rax, rdx, r8
0055d c462b9f7c5                     shlx       r8, rbp, r8
00562 49ffc8                         dec        r8
00565 4c23c2                         and        r8, rdx
00568 4183fa40                       cmp        r10d, 0x40
0056c 0f8d92120000                   jge        0x7f4313bd1704
00572 c462abf7e8                     shrx       r13, rax, r10
00577 ba01000000                     mov        edx, 1
0057c c4e2a9f7ea                     shlx       rbp, rdx, r10
00581 48ffcd                         dec        rbp
00584 4823e8                         and        rbp, rax
00587 4183fe40                       cmp        r14d, 0x40
0058b 0f8d5b130000                   jge        0x7f4313bd17ec
00591 41ba01000000                   mov        r10d, 1
00597 c4c289f7d2                     shlx       rdx, r10, r14
0059c 458bd0                         mov        r10d, r8d
0059f 48ffca                         dec        rdx
005a2 4923d5                         and        rdx, r13
005a5 448bc5                         mov        r8d, ebp
005a8 488b442470                     mov        rax, qword ptr [rsp + 0x70]
005ad 8bc0                           mov        eax, eax
005af 4803d0                         add        rdx, rax
005b2 488b442468                     mov        rax, qword ptr [rsp + 0x68]
005b7 8be8                           mov        ebp, eax
005b9 4403d5                         add        r10d, ebp
005bc 488b8424b8000000               mov        rax, qword ptr [rsp + 0xb8]
005c4 8bc0                           mov        eax, eax
005c6 4403c0                         add        r8d, eax
005c9 4963c0                         movsxd     rax, r8d
005cc 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
005d4 4c03e8                         add        r13, rax
005d7 4c89ac24c0000000               mov        qword ptr [rsp + 0xc0], r13
005df 4885d2                         test       rdx, rdx
005e2 0f8e77070000                   jle        0x7f4313bd0c5f
005e8 4881faffffff7f                 cmp        rdx, 0x7fffffff
005ef 0f8fbf130000                   jg         0x7f4313bd18b4
005f5 4181faffff0100                 cmp        r10d, 0x1ffff
005fc 0f8fba140000                   jg         0x7f4313bd19bc
00602 4181f8ffff0300                 cmp        r8d, 0x3ffff
00609 0f8f75150000                   jg         0x7f4313bd1a84
0060f 8bea                           mov        ebp, edx
00611 81fd00000010                   cmp        ebp, 0x10000000
00617 0f832f160000                   jae        0x7f4313bd1b4c
0061d 4d63d2                         movsxd     r10, r10d
00620 48c1e012                       shl        rax, 0x12
00624 4c63c5                         movsxd     r8, ebp
00627 49c1e024                       shl        r8, 0x24
0062b 490bc0                         or         rax, r8
0062e 490bc2                         or         rax, r10
00631 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00639 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00641 4b8944c208                     mov        qword ptr [r10 + r8*8 + 8], rax
00646 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0064e 443bd7                         cmp        r10d, edi
00651 7d1b                           jge        0x7f4313bd056e
00653 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0065b 8bd6                           mov        edx, esi
0065d 418beb                         mov        ebp, r11d
00660 8bc3                           mov        eax, ebx
00662 458bf1                         mov        r14d, r9d
00665 448b1c24                       mov        r11d, dword ptr [rsp]
00669 e9f6fdffff                     jmp        0x7f4313bd0364
0066e 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00676 0f8da8060000                   jge        0x7f4313bd0c24
0067c 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00681 0f83b0060000                   jae        0x7f4313bd0c37
00687 41ffc0                         inc        r8d
0068a 443b442404                     cmp        r8d, dword ptr [rsp + 4]
0068f 0f83b6060000                   jae        0x7f4313bd0c4b
00695 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0069d 41ffc2                         inc        r10d
006a0 418bd3                         mov        edx, r11d
006a3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
006ab 448b1424                       mov        r10d, dword ptr [rsp]
006af 4e8b54d608                     mov        r10, qword ptr [rsi + r10*8 + 8]
006b4 4c8b5ccb08                     mov        r11, qword ptr [rbx + rcx*8 + 8]
006b9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
006be 49c1ea20                       shr        r10, 0x20
006c2 458bd2                         mov        r10d, r10d
006c5 450fb6c2                       movzx      r8d, r10b
006c9 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
006d1 49c1eb20                       shr        r11, 0x20
006d5 458bdb                         mov        r11d, r11d
006d8 450fb6d3                       movzx      r10d, r11b
006dc 448bda                         mov        r11d, edx
006df 4a8b7cca08                     mov        rdi, qword ptr [rdx + r9*8 + 8]
006e4 48897c2470                     mov        qword ptr [rsp + 0x70], rdi
006e9 48c1ef20                       shr        rdi, 0x20
006ed 8bd7                           mov        edx, edi
006ef 440fb6f2                       movzx      r14d, dl
006f3 438d0416                       lea        eax, [r14 + r10]
006f7 4103c0                         add        eax, r8d
006fa 0f84540c0000                   je         0x7f4313bd1254
00700 83f83f                         cmp        eax, 0x3f
00703 0f8f3b0d0000                   jg         0x7f4313bd1344
00709 bd40000000                     mov        ebp, 0x40
0070e 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00712 3bc5                           cmp        eax, ebp
00714 0f8f1a0e0000                   jg         0x7f4313bd1434
0071a 2be8                           sub        ebp, eax
0071c c4e2d3f7542430                 shrx       rdx, qword ptr [rsp + 0x30], rbp
00723 bf01000000                     mov        edi, 1
00728 c4e2f9f7ff                     shlx       rdi, rdi, rax
0072d 48ffcf                         dec        rdi
00730 4823d7                         and        rdx, rdi
00733 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
00737 03f8                           add        edi, eax
00739 897c247c                       mov        dword ptr [rsp + 0x7c], edi
0073d 8b7c245c                       mov        edi, dword ptr [rsp + 0x5c]
00741 03f8                           add        edi, eax
00743 897c245c                       mov        dword ptr [rsp + 0x5c], edi
00747 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
0074b 83ff40                         cmp        edi, 0x40
0074e 0f8dcc0e0000                   jge        0x7f4313bd1520
00754 4183f840                       cmp        r8d, 0x40
00758 0f8d920f0000                   jge        0x7f4313bd15f0
0075e c4e2bbf7c2                     shrx       rax, rdx, r8
00763 bf01000000                     mov        edi, 1
00768 c462b9f7c7                     shlx       r8, rdi, r8
0076d 49ffc8                         dec        r8
00770 4c23c2                         and        r8, rdx
00773 4183fa40                       cmp        r10d, 0x40
00777 0f8d87100000                   jge        0x7f4313bd1704
0077d c462abf7e8                     shrx       r13, rax, r10
00782 c4e2a9f7ef                     shlx       rbp, rdi, r10
00787 48ffcd                         dec        rbp
0078a 4823e8                         and        rbp, rax
0078d 4183fe40                       cmp        r14d, 0x40
00791 0f8d55110000                   jge        0x7f4313bd17ec
00797 41ba01000000                   mov        r10d, 1
0079d c4c289f7d2                     shlx       rdx, r10, r14
007a2 458bd0                         mov        r10d, r8d
007a5 48ffca                         dec        rdx
007a8 4923d5                         and        rdx, r13
007ab 448bc5                         mov        r8d, ebp
007ae 488b7c2468                     mov        rdi, qword ptr [rsp + 0x68]
007b3 8bff                           mov        edi, edi
007b5 4403d7                         add        r10d, edi
007b8 488bbc24b8000000               mov        rdi, qword ptr [rsp + 0xb8]
007c0 8bc7                           mov        eax, edi
007c2 4403c0                         add        r8d, eax
007c5 488b7c2470                     mov        rdi, qword ptr [rsp + 0x70]
007ca 8bff                           mov        edi, edi
007cc 4803d7                         add        rdx, rdi
007cf 4963c0                         movsxd     rax, r8d
007d2 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
007da 4803f8                         add        rdi, rax
007dd 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
007e5 4885d2                         test       rdx, rdx
007e8 0f8e71050000                   jle        0x7f4313bd0c5f
007ee 4881faffffff7f                 cmp        rdx, 0x7fffffff
007f5 0f8fb9110000                   jg         0x7f4313bd18b4
007fb 4181faffff0100                 cmp        r10d, 0x1ffff
00802 0f8fb4120000                   jg         0x7f4313bd19bc
00808 4181f8ffff0300                 cmp        r8d, 0x3ffff
0080f 0f8f6f130000                   jg         0x7f4313bd1a84
00815 8bfa                           mov        edi, edx
00817 81ff00000010                   cmp        edi, 0x10000000
0081d 0f8329140000                   jae        0x7f4313bd1b4c
00823 4d63d2                         movsxd     r10, r10d
00826 48c1e012                       shl        rax, 0x12
0082a 4c63c7                         movsxd     r8, edi
0082d 49c1e024                       shl        r8, 0x24
00831 4c0bc0                         or         r8, rax
00834 4d0bc2                         or         r8, r10
00837 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0083f 8bbc2494000000                 mov        edi, dword ptr [rsp + 0x94]
00846 4d8944fa08                     mov        qword ptr [r10 + rdi*8 + 8], r8
0084b ffc7                           inc        edi
0084d 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
00854 7d0f                           jge        0x7f4313bd0765
00856 418bd3                         mov        edx, r11d
00859 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
00860 e946feffff                     jmp        0x7f4313bd05ab
00865 8bc6                           mov        eax, esi
00867 418bd3                         mov        edx, r11d
0086a 448bc1                         mov        r8d, ecx
0086d 418bc9                         mov        ecx, r9d
00870 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
00877 0f8d2b020000                   jge        0x7f4313bd09a8
0087d 3b7c2404                       cmp        edi, dword ptr [rsp + 4]
00881 0f8361160000                   jae        0x7f4313bd1de8
00887 448bd7                         mov        r10d, edi
0088a 443b542404                     cmp        r10d, dword ptr [rsp + 4]
0088f 0f8367160000                   jae        0x7f4313bd1dfc
00895 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
0089c 8bf3                           mov        esi, ebx
0089e 458bd8                         mov        r11d, r8d
008a1 4e8b44c308                     mov        r8, qword ptr [rbx + r8*8 + 8]
008a6 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
008ae 41ffc2                         inc        r10d
008b1 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
008b9 4c898424b8000000               mov        qword ptr [rsp + 0xb8], r8
008c1 49c1e820                       shr        r8, 0x20
008c5 458bc0                         mov        r8d, r8d
008c8 450fb6d0                       movzx      r10d, r8b
008cc 448bca                         mov        r9d, edx
008cf 4c8b44ca08                     mov        r8, qword ptr [rdx + rcx*8 + 8]
008d4 4c89442470                     mov        qword ptr [rsp + 0x70], r8
008d9 8bd8                           mov        ebx, eax
008db 8b3c24                         mov        edi, dword ptr [rsp]
008de 4c8b44f808                     mov        r8, qword ptr [rax + rdi*8 + 8]
008e3 4c89442468                     mov        qword ptr [rsp + 0x68], r8
008e8 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
008ed 49c1e820                       shr        r8, 0x20
008f1 458bc0                         mov        r8d, r8d
008f4 450fb6f0                       movzx      r14d, r8b
008f8 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
008fd 49c1e820                       shr        r8, 0x20
00901 458bc0                         mov        r8d, r8d
00904 450fb6c0                       movzx      r8d, r8b
00908 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
0090f 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
00916 0f8c5c090000                   jl         0x7f4313bd1178
0091c 438d0432                       lea        eax, [r10 + r14]
00920 4103c0                         add        eax, r8d
00923 0f842b0a0000                   je         0x7f4313bd1254
00929 83f83f                         cmp        eax, 0x3f
0092c 0f8f120b0000                   jg         0x7f4313bd1344
00932 bd40000000                     mov        ebp, 0x40
00937 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
0093b 3bc5                           cmp        eax, ebp
0093d 0f8ff10b0000                   jg         0x7f4313bd1434
00943 2be8                           sub        ebp, eax
00945 c4e2d3f7542430                 shrx       rdx, qword ptr [rsp + 0x30], rbp
0094c bd01000000                     mov        ebp, 1
00951 c4e2f9f7ed                     shlx       rbp, rbp, rax
00956 48ffcd                         dec        rbp
00959 4823d5                         and        rdx, rbp
0095c 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00961 4403e8                         add        r13d, eax
00964 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00969 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
0096e 4403e8                         add        r13d, eax
00971 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
00976 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0097a 83f840                         cmp        eax, 0x40
0097d 0f8d9d0c0000                   jge        0x7f4313bd1520
00983 4183f840                       cmp        r8d, 0x40
00987 0f8d630d0000                   jge        0x7f4313bd15f0
0098d c4e2bbf7c2                     shrx       rax, rdx, r8
00992 bd01000000                     mov        ebp, 1
00997 c462b9f7c5                     shlx       r8, rbp, r8
0099c 49ffc8                         dec        r8
0099f 4c23c2                         and        r8, rdx
009a2 4183fa40                       cmp        r10d, 0x40
009a6 0f8d580e0000                   jge        0x7f4313bd1704
009ac c462abf7e8                     shrx       r13, rax, r10
009b1 ba01000000                     mov        edx, 1
009b6 c4e2a9f7ea                     shlx       rbp, rdx, r10
009bb 48ffcd                         dec        rbp
009be 4823e8                         and        rbp, rax
009c1 4183fe40                       cmp        r14d, 0x40
009c5 0f8d210f0000                   jge        0x7f4313bd17ec
009cb 41ba01000000                   mov        r10d, 1
009d1 c4c289f7d2                     shlx       rdx, r10, r14
009d6 458bd0                         mov        r10d, r8d
009d9 48ffca                         dec        rdx
009dc 4923d5                         and        rdx, r13
009df 448bc5                         mov        r8d, ebp
009e2 488b442468                     mov        rax, qword ptr [rsp + 0x68]
009e7 8be8                           mov        ebp, eax
009e9 4403d5                         add        r10d, ebp
009ec 488b8424b8000000               mov        rax, qword ptr [rsp + 0xb8]
009f4 8bc0                           mov        eax, eax
009f6 4403c0                         add        r8d, eax
009f9 488b442470                     mov        rax, qword ptr [rsp + 0x70]
009fe 8bc0                           mov        eax, eax
00a00 4803d0                         add        rdx, rax
00a03 4963e8                         movsxd     rbp, r8d
00a06 488b8424c0000000               mov        rax, qword ptr [rsp + 0xc0]
00a0e 4803c5                         add        rax, rbp
00a11 48898424c0000000               mov        qword ptr [rsp + 0xc0], rax
00a19 4885d2                         test       rdx, rdx
00a1c 0f8e3d030000                   jle        0x7f4313bd0c5f
00a22 4881faffffff7f                 cmp        rdx, 0x7fffffff
00a29 0f8f850f0000                   jg         0x7f4313bd18b4
00a2f 4181faffff0100                 cmp        r10d, 0x1ffff
00a36 0f8f80100000                   jg         0x7f4313bd19bc
00a3c 4181f8ffff0300                 cmp        r8d, 0x3ffff
00a43 0f8f3b110000                   jg         0x7f4313bd1a84
00a49 8bc2                           mov        eax, edx
00a4b 3d00000010                     cmp        eax, 0x10000000
00a50 0f83f6110000                   jae        0x7f4313bd1b4c
00a56 4d63d2                         movsxd     r10, r10d
00a59 4c63c0                         movsxd     r8, eax
00a5c 48c1e512                       shl        rbp, 0x12
00a60 49c1e024                       shl        r8, 0x24
00a64 490be8                         or         rbp, r8
00a67 490bea                         or         rbp, r10
00a6a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a72 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00a7a 4b896cc208                     mov        qword ptr [r10 + r8*8 + 8], rbp
00a7f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a87 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00a8f 7d17                           jge        0x7f4313bd09a8
00a91 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00a99 8bc3                           mov        eax, ebx
00a9b 418bd1                         mov        edx, r9d
00a9e 8bde                           mov        ebx, esi
00aa0 458bc3                         mov        r8d, r11d
00aa3 e9f4fdffff                     jmp        0x7f4313bd079c
00aa8 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00ab0 eb03                           jmp        0x7f4313bd09b5
00ab2 4533db                         xor        r11d, r11d
00ab5 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
00aba 4d03da                         add        r11, r10
00abd 4c639424f0000000               movsxd     r10, dword ptr [rsp + 0xf0]
00ac5 4d3bda                         cmp        r11, r10
00ac8 0f8f4a120000                   jg         0x7f4313bd1c18
00ace 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00ad3 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00ad8 0f8572120000                   jne        0x7f4313bd1c50
00ade 418bc3                         mov        eax, r11d
00ae1 4881c4e0000000                 add        rsp, 0xe0
00ae8 5d                             pop        rbp
00ae9 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00aed 0f87ad150000                   ja         0x7f4313bd1fa0
00af3 c3                             ret        
00af4 458d4bff                       lea        r9d, [r11 - 1]
00af8 4585c9                         test       r9d, r9d
00afb 0f8c3c010000                   jl         0x7f4313bd0b3d
00b01 413bca                         cmp        ecx, r10d
00b04 0f836e120000                   jae        0x7f4313bd1c78
00b0a 4d63c1                         movsxd     r8, r9d
00b0d 4c03c3                         add        r8, rbx
00b10 4c3bc7                         cmp        r8, rdi
00b13 0f835f120000                   jae        0x7f4313bd1c78
00b19 4585c9                         test       r9d, r9d
00b1c 0f8e36130000                   jle        0x7f4313bd1d58
00b22 418d53fe                       lea        edx, [r11 - 2]
00b26 33ed                           xor        ebp, ebp
00b28 458bc1                         mov        r8d, r9d
00b2b 440344243c                     add        r8d, dword ptr [rsp + 0x3c]
00b30 488b4c2440                     mov        rcx, qword ptr [rsp + 0x40]
00b35 4e0fb6440108                   movzx      r8, byte ptr [rcx + r8 + 8]
00b3b 48c1e508                       shl        rbp, 8
00b3f 4c0bc5                         or         r8, rbp
00b42 418d49ff                       lea        ecx, [r9 - 1]
00b46 3bca                           cmp        ecx, edx
00b48 7e08                           jle        0x7f4313bd0a52
00b4a 498be8                         mov        rbp, r8
00b4d 448bc9                         mov        r9d, ecx
00b50 ebd6                           jmp        0x7f4313bd0a28
00b52 83f902                         cmp        ecx, 2
00b55 0f8e8a000000                   jle        0x7f4313bd0ae5
00b5b 4863d1                         movsxd     rdx, ecx
00b5e 4803d3                         add        rdx, rbx
00b61 483bd7                         cmp        rdx, rdi
00b64 0f839e120000                   jae        0x7f4313bd1d08
00b6a 4183c1fc                       add        r9d, -4
00b6e 4d63c9                         movsxd     r9, r9d
00b71 4c03cb                         add        r9, rbx
00b74 4c3bcf                         cmp        r9, rdi
00b77 0f839f120000                   jae        0x7f4313bd1d1c
00b7d 890424                         mov        dword ptr [rsp], eax
00b80 49c1e008                       shl        r8, 8
00b84 8bd1                           mov        edx, ecx
00b86 0354243c                       add        edx, dword ptr [rsp + 0x3c]
00b8a 448bc9                         mov        r9d, ecx
00b8d 44034c243c                     add        r9d, dword ptr [rsp + 0x3c]
00b92 4963e9                         movsxd     rbp, r9d
00b95 8d42fe                         lea        eax, [rdx - 2]
00b98 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00b9d 490fb6440108                   movzx      rax, byte ptr [r9 + rax + 8]
00ba3 83c2fd                         add        edx, -3
00ba6 4d0fb64c1108                   movzx      r9, byte ptr [r9 + rdx + 8]
00bac 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00bb1 480fb6542a07                   movzx      rdx, byte ptr [rdx + rbp + 7]
00bb7 4c8b6c2440                     mov        r13, qword ptr [rsp + 0x40]
00bbc 490fb66c2d08                   movzx      rbp, byte ptr [r13 + rbp + 8]
00bc2 4c0bc5                         or         r8, rbp
00bc5 49c1e008                       shl        r8, 8
00bc9 4c0bc2                         or         r8, rdx
00bcc 49c1e008                       shl        r8, 8
00bd0 4c0bc0                         or         r8, rax
00bd3 49c1e008                       shl        r8, 8
00bd7 4d0bc1                         or         r8, r9
00bda 83c1fc                         add        ecx, -4
00bdd 83f902                         cmp        ecx, 2
00be0 7f9e                           jg         0x7f4313bd0a80
00be2 8b0424                         mov        eax, dword ptr [rsp]
00be5 83f9ff                         cmp        ecx, -1
00be8 7e38                           jle        0x7f4313bd0b22
00bea 4c63c9                         movsxd     r9, ecx
00bed 4c03cb                         add        r9, rbx
00bf0 4c3bcf                         cmp        r9, rdi
00bf3 0f8317130000                   jae        0x7f4313bd1e10
00bf9 90                             nop        
00bfa 90                             nop        
00bfb 90                             nop        
00bfc 49c1e008                       shl        r8, 8
00c00 448bc9                         mov        r9d, ecx
00c03 44034c243c                     add        r9d, dword ptr [rsp + 0x3c]
00c08 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00c0d 4a0fb6540a08                   movzx      rdx, byte ptr [rdx + r9 + 8]
00c13 490bd0                         or         rdx, r8
00c16 ffc9                           dec        ecx
00c18 83f9ff                         cmp        ecx, -1
00c1b 7e08                           jle        0x7f4313bd0b25
00c1d 4c8bc2                         mov        r8, rdx
00c20 ebda                           jmp        0x7f4313bd0afc
00c22 498bd0                         mov        rdx, r8
00c25 41b940000000                   mov        r9d, 0x40
00c2b 442bce                         sub        r9d, esi
00c2e c462b1f7c2                     shlx       r8, rdx, r9
00c33 4c89442430                     mov        qword ptr [rsp + 0x30], r8
00c38 e968f4ffff                     jmp        0x7f4313bcffa5
00c3d 33d2                           xor        edx, edx
00c3f ebe4                           jmp        0x7f4313bd0b25
00c41 4533db                         xor        r11d, r11d
00c44 e9b2f5ffff                     jmp        0x7f4313bd00fb
00c49 bee4ffffff                     mov        esi, 0xffffffe4
00c4e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00c53 891424                         mov        dword ptr [rsp], edx
00c56 894c2404                       mov        dword ptr [rsp + 4], ecx
00c5a 4c89442408                     mov        qword ptr [rsp + 8], r8
00c5f 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00c64 897c2418                       mov        dword ptr [rsp + 0x18], edi
00c68 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
00c6c 90                             nop        
00c6d 90                             nop        
00c6e 90                             nop        
00c6f e8ecceafff                     call       0x7f43136cda60
00c74 0f1f84006c0d0000               nop        dword ptr [rax + rax + 0xd6c]
00c7c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00c86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8a e851e02018                     call       0x7f432bddebe0
00c8f f4                             hlt        
00c90 be6effffff                     mov        esi, 0xffffff6e
00c95 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00c9a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c9f 44891c24                       mov        dword ptr [rsp], r11d
00ca3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ca8 4489542404                     mov        dword ptr [rsp + 4], r10d
00cad 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00cb2 4c89542408                     mov        qword ptr [rsp + 8], r10
00cb7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00cbc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00cc1 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00cc9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00cce 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00cd3 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00cd8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00cdd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00ce2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00ce7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00cec 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00cf1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00cf6 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00cfb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d00 90                             nop        
00d01 90                             nop        
00d02 90                             nop        
00d03 e858ceafff                     call       0x7f43136cda60
00d08 0f1f8400000e0001               nop        dword ptr [rax + rax + 0x1000e00]
00d10 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00d1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d1e e8bddf2018                     call       0x7f432bddebe0
00d23 f4                             hlt        
00d24 8bc6                           mov        eax, esi
00d26 418bd3                         mov        edx, r11d
00d29 448bc1                         mov        r8d, ecx
00d2c 418bc9                         mov        ecx, r9d
00d2f 418bfa                         mov        edi, r10d
00d32 e939fbffff                     jmp        0x7f4313bd0770
00d37 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
00d41 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d45 e896df2018                     call       0x7f432bddebe0
00d4a f4                             hlt        
00d4b 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
00d55 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d59 e882df2018                     call       0x7f432bddebe0
00d5e f4                             hlt        
00d5f 4533db                         xor        r11d, r11d
00d62 493bd3                         cmp        rdx, r11
00d65 bdffffffff                     mov        ebp, 0xffffffff
00d6a 7c08                           jl         0x7f4313bd0c74
00d6c 400f95c5                       setne      bpl
00d70 400fb6ed                       movzx      ebp, bpl
00d74 be45ffffff                     mov        esi, 0xffffff45
00d79 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00d7e 4c891c24                       mov        qword ptr [rsp], r11
00d82 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00d87 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d8c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00d91 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00d96 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00d9e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00da3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00da8 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dad 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00db2 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00db7 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00dbc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00dc1 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
00dc6 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00dcb 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00dd0 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00dd5 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
00dda 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00ddf 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
00de4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00de9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00dee 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00df3 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00dfb 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00e00 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00e05 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
00e0d 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00e15 458bd3                         mov        r10d, r11d
00e18 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00e20 48894424f8                     mov        qword ptr [rsp - 8], rax
00e25 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00e2c 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
00e33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e38 4889942490000000               mov        qword ptr [rsp + 0x90], rdx
00e40 90                             nop        
00e41 90                             nop        
00e42 90                             nop        
00e43 e818cdafff                     call       0x7f43136cda60
00e48 0f1f8400400f0002               nop        dword ptr [rax + rax + 0x2000f40]
00e50 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00e5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e5e e87dde2018                     call       0x7f432bddebe0
00e63 f4                             hlt        
00e64 be45ffffff                     mov        esi, 0xffffff45
00e69 8be8                           mov        ebp, eax
00e6b e8f0ccafff                     call       0x7f43136cda60
00e70 0f1f8400680f0003               nop        dword ptr [rax + rax + 0x3000f68]
00e78 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e86 e855de2018                     call       0x7f432bddebe0
00e8b f4                             hlt        
00e8c be45ffffff                     mov        esi, 0xffffff45
00e91 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00e96 894c2404                       mov        dword ptr [rsp + 4], ecx
00e9a 4c89442408                     mov        qword ptr [rsp + 8], r8
00e9f 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00ea4 897c2418                       mov        dword ptr [rsp + 0x18], edi
00ea8 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
00ead 895c2420                       mov        dword ptr [rsp + 0x20], ebx
00eb1 89542424                       mov        dword ptr [rsp + 0x24], edx
00eb5 89542430                       mov        dword ptr [rsp + 0x30], edx
00eb9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ebe 90                             nop        
00ebf e89cccafff                     call       0x7f43136cda60
00ec4 0f1f8400bc0f0004               nop        dword ptr [rax + rax + 0x4000fbc]
00ecc 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00ed6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eda e801de2018                     call       0x7f432bddebe0
00edf f4                             hlt        
00ee0 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00ee4 83c5f8                         add        ebp, -8
00ee7 be45ffffff                     mov        esi, 0xffffff45
00eec 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00ef1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ef6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00efb 4489742424                     mov        dword ptr [rsp + 0x24], r14d
00f00 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f05 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00f0a 90                             nop        
00f0b e850ccafff                     call       0x7f43136cda60
00f10 0f1f840008100005               nop        dword ptr [rax + rax + 0x5001008]
00f18 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00f22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f26 e8b5dd2018                     call       0x7f432bddebe0
00f2b f4                             hlt        
00f2c be45ffffff                     mov        esi, 0xffffff45
00f31 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00f36 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f3b 44891424                       mov        dword ptr [rsp], r10d
00f3f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f44 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f49 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f4e 4c89542408                     mov        qword ptr [rsp + 8], r10
00f53 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f58 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f5d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f62 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00f67 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f6c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f71 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f76 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00f7b 4489742424                     mov        dword ptr [rsp + 0x24], r14d
00f80 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00f84 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00f89 90                             nop        
00f8a 90                             nop        
00f8b e8d0cbafff                     call       0x7f43136cda60
00f90 0f1f840088100006               nop        dword ptr [rax + rax + 0x6001088]
00f98 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
00fa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fa6 e835dd2018                     call       0x7f432bddebe0
00fab f4                             hlt        
00fac be45ffffff                     mov        esi, 0xffffff45
00fb1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00fb6 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fbb 44891c24                       mov        dword ptr [rsp], r11d
00fbf 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fc4 4489542404                     mov        dword ptr [rsp + 4], r10d
00fc9 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00fce 4c89542408                     mov        qword ptr [rsp + 8], r10
00fd3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00fd8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fdd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00fe2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00fe7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00ff1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00ff6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00ffb 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01000 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01005 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0100a 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0100f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01013 e848cbafff                     call       0x7f43136cda60
01018 0f1f840010110007               nop        dword ptr [rax + rax + 0x7001110]
01020 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0102a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0102e e8addc2018                     call       0x7f432bddebe0
01033 f4                             hlt        
01034 be45ffffff                     mov        esi, 0xffffff45
01039 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0103e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01043 44891c24                       mov        dword ptr [rsp], r11d
01047 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0104c 4489542404                     mov        dword ptr [rsp + 4], r10d
01051 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01056 4c89542408                     mov        qword ptr [rsp + 8], r10
0105b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01060 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01065 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0106a 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0106f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01074 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01079 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0107e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01083 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01088 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
0108d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01092 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01097 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
0109c 4489542450                     mov        dword ptr [rsp + 0x50], r10d
010a1 90                             nop        
010a2 90                             nop        
010a3 e8b8caafff                     call       0x7f43136cda60
010a8 0f1f8400a0110008               nop        dword ptr [rax + rax + 0x80011a0]
010b0 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
010ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
010be e81ddc2018                     call       0x7f432bddebe0
010c3 f4                             hlt        
010c4 be45ffffff                     mov        esi, 0xffffff45
010c9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
010ce 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
010d3 44891424                       mov        dword ptr [rsp], r10d
010d7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
010dc 4489542404                     mov        dword ptr [rsp + 4], r10d
010e1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
010e6 4c89542408                     mov        qword ptr [rsp + 8], r10
010eb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010f0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010f5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
010fa 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
010ff 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01104 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01109 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0110e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01113 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
01118 90                             nop        
01119 90                             nop        
0111a 90                             nop        
0111b e840caafff                     call       0x7f43136cda60
01120 0f1f840018120009               nop        dword ptr [rax + rax + 0x9001218]
01128 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01132 4883e4f0                       and        rsp, 0xfffffffffffffff0
01136 e8a5db2018                     call       0x7f432bddebe0
0113b f4                             hlt        
0113c be45ffffff                     mov        esi, 0xffffff45
01141 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01146 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0114b 44891c24                       mov        dword ptr [rsp], r11d
0114f 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01154 4489442404                     mov        dword ptr [rsp + 4], r8d
01159 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0115e 4c895c2408                     mov        qword ptr [rsp + 8], r11
01163 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01168 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0116d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01172 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01177 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0117c 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01181 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01186 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0118b 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
01190 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01195 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0119a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0119f 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
011a4 4489442444                     mov        dword ptr [rsp + 0x44], r8d
011a9 48894c2450                     mov        qword ptr [rsp + 0x50], rcx
011ae 4489542458                     mov        dword ptr [rsp + 0x58], r10d
011b3 e8a8c9afff                     call       0x7f43136cda60
011b8 0f1f8400b012000a               nop        dword ptr [rax + rax + 0xa0012b0]
011c0 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
011ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ce e80ddb2018                     call       0x7f432bddebe0
011d3 f4                             hlt        
011d4 be45ffffff                     mov        esi, 0xffffff45
011d9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
011de 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
011e3 44891c24                       mov        dword ptr [rsp], r11d
011e7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
011ec 4489542404                     mov        dword ptr [rsp + 4], r10d
011f1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
011f6 4c89542408                     mov        qword ptr [rsp + 8], r10
011fb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01200 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01205 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0120a 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0120f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01214 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01219 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0121e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01223 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01228 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0122d 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01232 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01237 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0123c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01241 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01246 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0124b 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01250 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01255 90                             nop        
01256 90                             nop        
01257 e804c9afff                     call       0x7f43136cda60
0125c 0f1f84005413000b               nop        dword ptr [rax + rax + 0xb001354]
01264 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0126e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01272 e869da2018                     call       0x7f432bddebe0
01277 f4                             hlt        
01278 be45ffffff                     mov        esi, 0xffffff45
0127d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01282 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01287 44891c24                       mov        dword ptr [rsp], r11d
0128b 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01290 44894c2404                     mov        dword ptr [rsp + 4], r9d
01295 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0129a 4c895c2408                     mov        qword ptr [rsp + 8], r11
0129f 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
012a4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
012a9 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
012ae 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
012b3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
012b8 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
012bd 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
012c2 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
012c7 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
012cc 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
012d1 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
012d6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
012db 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
012e0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
012e5 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
012ea 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
012ef 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
012f4 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
012f9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
012fe 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01303 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01308 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0130d 48ff742468                     push       qword ptr [rsp + 0x68]
01312 488f442460                     pop        qword ptr [rsp + 0x60]
01317 48ff742470                     push       qword ptr [rsp + 0x70]
0131c 488f442468                     pop        qword ptr [rsp + 0x68]
01321 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01326 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0132b 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01333 e828c8afff                     call       0x7f43136cda60
01338 0f1f84003014000c               nop        dword ptr [rax + rax + 0xc001430]
01340 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0134a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0134e e88dd92018                     call       0x7f432bddebe0
01353 f4                             hlt        
01354 be45ffffff                     mov        esi, 0xffffff45
01359 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0135e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01363 44891c24                       mov        dword ptr [rsp], r11d
01367 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0136c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01371 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01376 4c895c2408                     mov        qword ptr [rsp + 8], r11
0137b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01380 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01385 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
0138d 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01392 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01397 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0139c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
013a1 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
013a6 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
013ab 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
013b0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
013b5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
013ba 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
013bf 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
013c4 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
013c9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
013ce 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
013d3 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
013d8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
013dd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
013e2 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
013e7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
013ec 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
013f1 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
013f6 48ff742468                     push       qword ptr [rsp + 0x68]
013fb 488f442460                     pop        qword ptr [rsp + 0x60]
01400 48ff742470                     push       qword ptr [rsp + 0x70]
01405 488f442468                     pop        qword ptr [rsp + 0x68]
0140a 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0140f 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01414 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0141c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01423 e838c7afff                     call       0x7f43136cda60
01428 0f1f84002015000d               nop        dword ptr [rax + rax + 0xd001520]
01430 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0143a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0143e e89dd82018                     call       0x7f432bddebe0
01443 f4                             hlt        
01444 be45ffffff                     mov        esi, 0xffffff45
01449 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0144e 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01453 44890c24                       mov        dword ptr [rsp], r9d
01457 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0145c 44895c2404                     mov        dword ptr [rsp + 4], r11d
01461 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01466 4c895c2408                     mov        qword ptr [rsp + 8], r11
0146b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01470 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01475 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0147d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01482 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01487 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0148c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01491 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01496 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0149b 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
014a0 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
014a5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
014aa 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
014af 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
014b4 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
014b9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
014be 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
014c3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
014c8 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
014cd 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
014d2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
014d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
014dc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
014e1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
014e6 48ff742468                     push       qword ptr [rsp + 0x68]
014eb 488f442460                     pop        qword ptr [rsp + 0x60]
014f0 48ff742470                     push       qword ptr [rsp + 0x70]
014f5 488f442468                     pop        qword ptr [rsp + 0x68]
014fa 4489742478                     mov        dword ptr [rsp + 0x78], r14d
014ff 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01504 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0150c 89842488000000                 mov        dword ptr [rsp + 0x88], eax
01513 e848c6afff                     call       0x7f43136cda60
01518 0f1f84001016000e               nop        dword ptr [rax + rax + 0xe001610]
01520 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0152a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0152e e8add72018                     call       0x7f432bddebe0
01533 f4                             hlt        
01534 be45ffffff                     mov        esi, 0xffffff45
01539 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0153e 4c891c24                       mov        qword ptr [rsp], r11
01542 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01547 44894c2408                     mov        dword ptr [rsp + 8], r9d
0154c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01551 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01556 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0155e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01563 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01568 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0156d 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01572 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01577 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
0157c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01581 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01586 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0158b 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
01590 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01595 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0159a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0159f 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
015a4 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
015a9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015ae 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
015b3 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
015bb 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
015c0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
015c5 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
015ca 48894424f8                     mov        qword ptr [rsp - 8], rax
015cf 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
015d6 89442464                       mov        dword ptr [rsp + 0x64], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
015e7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
015ef 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
015f7 89842490000000                 mov        dword ptr [rsp + 0x90], eax
015fe 90                             nop        
015ff e85cc5afff                     call       0x7f43136cda60
01604 0f1f8400fc16000f               nop        dword ptr [rax + rax + 0xf0016fc]
0160c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01616 4883e4f0                       and        rsp, 0xfffffffffffffff0
0161a e8c1d62018                     call       0x7f432bddebe0
0161f f4                             hlt        
01620 be45ffffff                     mov        esi, 0xffffff45
01625 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0162a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0162f 44891c24                       mov        dword ptr [rsp], r11d
01633 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01638 44894c2404                     mov        dword ptr [rsp + 4], r9d
0163d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01642 4c895c2408                     mov        qword ptr [rsp + 8], r11
01647 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0164c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01651 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01656 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0165b 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01660 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01665 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0166a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0166f 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
01674 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01679 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0167e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01683 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
01688 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0168d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01692 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01697 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0169c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016a1 48ff742468                     push       qword ptr [rsp + 0x68]
016a6 488f442458                     pop        qword ptr [rsp + 0x58]
016ab 48ff742470                     push       qword ptr [rsp + 0x70]
016b0 488f442460                     pop        qword ptr [rsp + 0x60]
016b5 4489742470                     mov        dword ptr [rsp + 0x70], r14d
016ba 4489542474                     mov        dword ptr [rsp + 0x74], r10d
016bf 4489442478                     mov        dword ptr [rsp + 0x78], r8d
016c4 4889942480000000               mov        qword ptr [rsp + 0x80], rdx
016cc 90                             nop        
016cd 90                             nop        
016ce 90                             nop        
016cf e88cc4afff                     call       0x7f43136cda60
016d4 0f1f8400cc170010               nop        dword ptr [rax + rax + 0x100017cc]
016dc 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
016e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ea e8f1d52018                     call       0x7f432bddebe0
016ef f4                             hlt        
016f0 be45ffffff                     mov        esi, 0xffffff45
016f5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016fa 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
016ff 44890c24                       mov        dword ptr [rsp], r9d
01703 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01708 44895c2404                     mov        dword ptr [rsp + 4], r11d
0170d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01712 4c895c2408                     mov        qword ptr [rsp + 8], r11
01717 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
0171c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01721 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01729 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0172e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01733 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01738 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0173d 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01742 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01747 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0174c 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
01751 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01756 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0175b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01760 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
01765 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0176a 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0176f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01774 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
01779 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0177e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01783 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01788 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01790 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01795 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0179a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0179f 48894424f8                     mov        qword ptr [rsp - 8], rax
017a4 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
017ab 8944245c                       mov        dword ptr [rsp + 0x5c], eax
017af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b4 48ff742468                     push       qword ptr [rsp + 0x68]
017b9 488f442460                     pop        qword ptr [rsp + 0x60]
017be 48ff742470                     push       qword ptr [rsp + 0x70]
017c3 488f442468                     pop        qword ptr [rsp + 0x68]
017c8 4489742478                     mov        dword ptr [rsp + 0x78], r14d
017cd 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
017d2 4889942490000000               mov        qword ptr [rsp + 0x90], rdx
017da 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
017e2 90                             nop        
017e3 e878c3afff                     call       0x7f43136cda60
017e8 0f1f8400e0180011               nop        dword ptr [rax + rax + 0x110018e0]
017f0 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
017fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fe e8ddd42018                     call       0x7f432bddebe0
01803 f4                             hlt        
01804 be45ffffff                     mov        esi, 0xffffff45
01809 418be8                         mov        ebp, r8d
0180c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01811 4c891c24                       mov        qword ptr [rsp], r11
01815 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0181a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0181f 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01824 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01829 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01831 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01836 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0183b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01840 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01845 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
0184a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0184f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01854 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01859 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0185e 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01863 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01868 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
0186d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01872 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01877 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0187c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01881 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01886 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0188e 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01893 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01898 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0189d 48894424f8                     mov        qword ptr [rsp - 8], rax
018a2 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
018a9 89442464                       mov        dword ptr [rsp + 0x64], eax
018ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b2 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
018ba 4889842490000000               mov        qword ptr [rsp + 0x90], rax
018c2 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
018ca 90                             nop        
018cb e890c2afff                     call       0x7f43136cda60
018d0 0f1f8400c8190012               nop        dword ptr [rax + rax + 0x120019c8]
018d8 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
018e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018e6 e8f5d32018                     call       0x7f432bddebe0
018eb f4                             hlt        
018ec be45ffffff                     mov        esi, 0xffffff45
018f1 448bdd                         mov        r11d, ebp
018f4 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
018fc 418be8                         mov        ebp, r8d
018ff 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01904 4c891424                       mov        qword ptr [rsp], r10
01908 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0190d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01912 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01917 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0191c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01924 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01929 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0192e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01933 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01938 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0193d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01942 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01947 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0194c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01951 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01956 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0195b 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01960 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01965 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0196a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0196f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01974 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01979 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0197e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01983 4c89ac2480000000               mov        qword ptr [rsp + 0x80], r13
0198b 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
01993 e8c8c1afff                     call       0x7f43136cda60
01998 0f1f8400901a0013               nop        dword ptr [rax + rax + 0x13001a90]
019a0 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
019aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ae e82dd32018                     call       0x7f432bddebe0
019b3 f4                             hlt        
019b4 be45ffffff                     mov        esi, 0xffffff45
019b9 41bbffffff7f                   mov        r11d, 0x7fffffff
019bf 493bd3                         cmp        rdx, r11
019c2 bdffffffff                     mov        ebp, 0xffffffff
019c7 7c08                           jl         0x7f4313bd18d1
019c9 400f95c5                       setne      bpl
019cd 400fb6ed                       movzx      ebp, bpl
019d1 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
019d6 4c891c24                       mov        qword ptr [rsp], r11
019da 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
019df 44894c2408                     mov        dword ptr [rsp + 8], r9d
019e4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019e9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019ee 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
019f6 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
019fb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a00 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a05 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01a0a 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01a0f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01a14 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a19 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01a1e 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01a23 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01a28 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01a2d 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01a32 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01a37 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a3c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01a41 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01a46 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01a4b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01a53 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01a58 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01a5d 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01a65 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01a6d 458bd3                         mov        r10d, r11d
01a70 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01a78 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01a84 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 4889942490000000               mov        qword ptr [rsp + 0x90], rdx
01a98 90                             nop        
01a99 90                             nop        
01a9a 90                             nop        
01a9b e8c0c0afff                     call       0x7f43136cda60
01aa0 0f1f8400981b0014               nop        dword ptr [rax + rax + 0x14001b98]
01aa8 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01ab2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ab6 e825d22018                     call       0x7f432bddebe0
01abb f4                             hlt        
01abc be45ffffff                     mov        esi, 0xffffff45
01ac1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ac6 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01acb 44890424                       mov        dword ptr [rsp], r8d
01acf 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ad4 44895c2404                     mov        dword ptr [rsp + 4], r11d
01ad9 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01ade 4c895c2408                     mov        qword ptr [rsp + 8], r11
01ae3 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01ae8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01aed 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01af2 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01af7 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01afc 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01b01 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01b06 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01b0b 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01b10 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01b15 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01b1a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b1f 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
01b24 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01b29 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b2e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01b33 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01b38 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01b3d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01b42 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01b47 48ff742468                     push       qword ptr [rsp + 0x68]
01b4c 488f442460                     pop        qword ptr [rsp + 0x60]
01b51 48ff742470                     push       qword ptr [rsp + 0x70]
01b56 488f442468                     pop        qword ptr [rsp + 0x68]
01b5b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01b60 90                             nop        
01b61 90                             nop        
01b62 90                             nop        
01b63 e8f8bfafff                     call       0x7f43136cda60
01b68 0f1f8400601c0015               nop        dword ptr [rax + rax + 0x15001c60]
01b70 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01b7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b7e e85dd12018                     call       0x7f432bddebe0
01b83 f4                             hlt        
01b84 be45ffffff                     mov        esi, 0xffffff45
01b89 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b8e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b93 44891424                       mov        dword ptr [rsp], r10d
01b97 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b9c 44895c2404                     mov        dword ptr [rsp + 4], r11d
01ba1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ba6 4c89542408                     mov        qword ptr [rsp + 8], r10
01bab 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bb0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bb5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bba 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01bbf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bc4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01bc9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01bce 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01bd3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01bd8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01bdd 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01be2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01be7 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01bec 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01bf1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01bf6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01bfb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c00 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c05 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01c0a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01c0f 48ff742468                     push       qword ptr [rsp + 0x68]
01c14 488f442460                     pop        qword ptr [rsp + 0x60]
01c19 48ff742470                     push       qword ptr [rsp + 0x70]
01c1e 488f442468                     pop        qword ptr [rsp + 0x68]
01c23 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01c28 90                             nop        
01c29 90                             nop        
01c2a 90                             nop        
01c2b e830bfafff                     call       0x7f43136cda60
01c30 0f1f8400281d0016               nop        dword ptr [rax + rax + 0x16001d28]
01c38 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01c42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c46 e895d02018                     call       0x7f432bddebe0
01c4b f4                             hlt        
01c4c be3dffffff                     mov        esi, 0xffffff3d
01c51 8bea                           mov        ebp, edx
01c53 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01c58 4c891c24                       mov        qword ptr [rsp], r11
01c5c 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01c61 44894c2408                     mov        dword ptr [rsp + 8], r9d
01c66 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01c6b 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01c70 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01c78 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c7d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c82 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c87 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01c8c 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01c91 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01c96 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c9b 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01ca0 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01ca5 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01caa 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01caf 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01cb4 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01cb9 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01cbe 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01cc3 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01cc8 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01ccd 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01cd5 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01cda 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01cdf 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01ce7 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01cef 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01cf7 e864beafff                     call       0x7f43136cda60
01cfc 0f1f8400f41d0017               nop        dword ptr [rax + rax + 0x17001df4]
01d04 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d12 e8c9cf2018                     call       0x7f432bddebe0
01d17 f4                             hlt        
01d18 4d3bda                         cmp        r11, r10
01d1b bdffffffff                     mov        ebp, 0xffffffff
01d20 7c08                           jl         0x7f4313bd1c2a
01d22 400f95c5                       setne      bpl
01d26 400fb6ed                       movzx      ebp, bpl
01d2a be45ffffff                     mov        esi, 0xffffff45
01d2f e82cbeafff                     call       0x7f43136cda60
01d34 0f1f84002c1e0018               nop        dword ptr [rax + rax + 0x18001e2c]
01d3c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01d46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4a e891cf2018                     call       0x7f432bddebe0
01d4f f4                             hlt        
01d50 be45ffffff                     mov        esi, 0xffffff45
01d55 90                             nop        
01d56 90                             nop        
01d57 e804beafff                     call       0x7f43136cda60
01d5c 0f1f8400541e0019               nop        dword ptr [rax + rax + 0x19001e54]
01d64 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01d6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d72 e869cf2018                     call       0x7f432bddebe0
01d77 f4                             hlt        
01d78 be6effffff                     mov        esi, 0xffffff6e
01d7d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d82 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d87 4c89542408                     mov        qword ptr [rsp + 8], r10
01d8c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d91 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d96 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
01d9b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01da0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01da5 89542424                       mov        dword ptr [rsp + 0x24], edx
01da9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01dae 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01db2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01db7 e8a4bdafff                     call       0x7f43136cda60
01dbc 0f1f8400b41e001a               nop        dword ptr [rax + rax + 0x1a001eb4]
01dc4 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01dce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dd2 e809cf2018                     call       0x7f432bddebe0
01dd7 f4                             hlt        
01dd8 be6effffff                     mov        esi, 0xffffff6e
01ddd 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01de2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01de7 e874bdafff                     call       0x7f43136cda60
01dec 0f1f8400e41e001b               nop        dword ptr [rax + rax + 0x1b001ee4]
01df4 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e8d9ce2018                     call       0x7f432bddebe0
01e07 f4                             hlt        
01e08 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01e12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e16 e8c5ce2018                     call       0x7f432bddebe0
01e1b f4                             hlt        
01e1c 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01e26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e2a e8b1ce2018                     call       0x7f432bddebe0
01e2f f4                             hlt        
01e30 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e89dce2018                     call       0x7f432bddebe0
01e43 f4                             hlt        
01e44 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01e4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e52 e889ce2018                     call       0x7f432bddebe0
01e57 f4                             hlt        
01e58 be66ffffff                     mov        esi, 0xffffff66
01e5d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e62 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e67 4c89542408                     mov        qword ptr [rsp + 8], r10
01e6c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e71 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e76 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
01e7b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e80 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e85 89542424                       mov        dword ptr [rsp + 0x24], edx
01e89 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e8e 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01e92 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01e97 e8c4bcafff                     call       0x7f43136cda60
01e9c 0f1f8400941f001c               nop        dword ptr [rax + rax + 0x1c001f94]
01ea4 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eb2 e829ce2018                     call       0x7f432bddebe0
01eb7 f4                             hlt        
01eb8 be66ffffff                     mov        esi, 0xffffff66
01ebd 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01ec2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01ec7 e894bcafff                     call       0x7f43136cda60
01ecc 0f1f8400c41f001d               nop        dword ptr [rax + rax + 0x1d001fc4]
01ed4 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee2 e8f9cd2018                     call       0x7f432bddebe0
01ee7 f4                             hlt        
01ee8 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01ef2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ef6 e8e5cd2018                     call       0x7f432bddebe0
01efb f4                             hlt        
01efc 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01f06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0a e8d1cd2018                     call       0x7f432bddebe0
01f0f f4                             hlt        
01f10 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01f1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f1e e8bdcd2018                     call       0x7f432bddebe0
01f23 f4                             hlt        
01f24 48bf104c1fec427f0000           movabs     rdi, 0x7f42ec1f4c10
01f2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f32 e8a9cd2018                     call       0x7f432bddebe0
01f37 f4                             hlt        
01f38 bef6ffffff                     mov        esi, 0xfffffff6
01f3d 8beb                           mov        ebp, ebx
01f3f e81cbcafff                     call       0x7f43136cda60
01f44 0f1f84003c20001e               nop        dword ptr [rax + rax + 0x1e00203c]
01f4c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01f56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f5a e881cd2018                     call       0x7f432bddebe0
01f5f f4                             hlt        
01f60 bef6ffffff                     mov        esi, 0xfffffff6
01f65 90                             nop        
01f66 90                             nop        
01f67 e8f4bbafff                     call       0x7f43136cda60
01f6c 0f1f84006420001f               nop        dword ptr [rax + rax + 0x1f002064]
01f74 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01f7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f82 e859cd2018                     call       0x7f432bddebe0
01f87 f4                             hlt        
01f88 bef6ffffff                     mov        esi, 0xfffffff6
01f8d 90                             nop        
01f8e 90                             nop        
01f8f e8ccbbafff                     call       0x7f43136cda60
01f94 0f1f84008c200020               nop        dword ptr [rax + rax + 0x2000208c]
01f9c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01fa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01faa e831cd2018                     call       0x7f432bddebe0
01faf f4                             hlt        
01fb0 bef6ffffff                     mov        esi, 0xfffffff6
01fb5 90                             nop        
01fb6 90                             nop        
01fb7 e8a4bbafff                     call       0x7f43136cda60
01fbc 0f1f8400b4200021               nop        dword ptr [rax + rax + 0x210020b4]
01fc4 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01fce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fd2 e809cd2018                     call       0x7f432bddebe0
01fd7 f4                             hlt        
01fd8 bef6ffffff                     mov        esi, 0xfffffff6
01fdd 90                             nop        
01fde 90                             nop        
01fdf e87cbbafff                     call       0x7f43136cda60
01fe4 0f1f8400dc200022               nop        dword ptr [rax + rax + 0x220020dc]
01fec 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
01ff6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ffa e8e1cc2018                     call       0x7f432bddebe0
01fff f4                             hlt        
02000 bef6ffffff                     mov        esi, 0xfffffff6
02005 90                             nop        
02006 90                             nop        
02007 e854bbafff                     call       0x7f43136cda60
0200c 0f1f840004210023               nop        dword ptr [rax + rax + 0x23002104]
02014 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0201e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02022 e8b9cc2018                     call       0x7f432bddebe0
02027 f4                             hlt        
02028 bef6ffffff                     mov        esi, 0xfffffff6
0202d 90                             nop        
0202e 90                             nop        
0202f e82cbbafff                     call       0x7f43136cda60
02034 0f1f84002c210024               nop        dword ptr [rax + rax + 0x2400212c]
0203c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
02046 4883e4f0                       and        rsp, 0xfffffffffffffff0
0204a e891cc2018                     call       0x7f432bddebe0
0204f f4                             hlt        
02050 bef6ffffff                     mov        esi, 0xfffffff6
02055 90                             nop        
02056 90                             nop        
02057 e804bbafff                     call       0x7f43136cda60
0205c 0f1f840054210025               nop        dword ptr [rax + rax + 0x25002154]
02064 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
0206e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02072 e869cc2018                     call       0x7f432bddebe0
02077 f4                             hlt        
02078 bef6ffffff                     mov        esi, 0xfffffff6
0207d 90                             nop        
0207e 90                             nop        
0207f e8dcbaafff                     call       0x7f43136cda60
02084 0f1f84007c210026               nop        dword ptr [rax + rax + 0x2600217c]
0208c 48bfb0491fec427f0000           movabs     rdi, 0x7f42ec1f49b0
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e841cc2018                     call       0x7f432bddebe0
0209f f4                             hlt        
020a0 49bae909bd13437f0000           movabs     r10, 0x7f4313bd09e9
020aa 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020b1 e9aa03b6ff                     jmp        0x7f4313732360
020b6 e825d2b4ff                     call       0x7f431371f1e0
020bb e95edfffff                     jmp        0x7f4313bcff1e
