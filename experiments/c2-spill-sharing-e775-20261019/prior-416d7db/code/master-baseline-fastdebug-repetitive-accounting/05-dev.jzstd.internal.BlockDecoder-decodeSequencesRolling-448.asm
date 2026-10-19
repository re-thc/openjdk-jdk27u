00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ecd0000000                 sub        rsp, 0xd0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85ec210000                   jne        0x7f3463bda10a
0001e 4889742440                     mov        qword ptr [rsp + 0x40], rsi
00023 448d5aff                       lea        r11d, [rdx - 1]
00027 448b5604                       mov        r10d, dword ptr [rsi + 4]
0002b 453bda                         cmp        r11d, r10d
0002e 0f83060c0000                   jae        0x7f3463bd8b3a
00034 0fb6441607                     movzx      eax, byte ptr [rsi + rdx + 7]
00039 85c0                           test       eax, eax
0003b 0f840b0e0000                   je         0x7f3463bd8d4c
00041 448bda                         mov        r11d, edx
00044 442bd9                         sub        r11d, ecx
00047 f30fbdd8                       lzcnt      ebx, eax
0004b 428d34dd00000000               lea        esi, [r11*8]
00053 b81f000000                     mov        eax, 0x1f
00058 2bc3                           sub        eax, ebx
0005a 41be08000000                   mov        r14d, 8
00060 442bf0                         sub        r14d, eax
00063 8bde                           mov        ebx, esi
00065 412bde                         sub        ebx, r14d
00068 4183fb08                       cmp        r11d, 8
0006c 0f8d020e0000                   jge        0x7f3463bd8d74
00072 895c2428                       mov        dword ptr [rsp + 0x28], ebx
00076 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0007d 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00082 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00087 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0008b 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0008f 4863d9                         movsxd     rbx, ecx
00092 4963fa                         movsxd     rdi, r10d
00095 4585db                         test       r11d, r11d
00098 0f8f3f0a0000                   jg         0x7f3463bd89dd
0009e 4533c0                         xor        r8d, r8d
000a1 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000a6 458d43f8                       lea        r8d, [r11 - 8]
000aa 4183f808                       cmp        r8d, 8
000ae 0f8d140e0000                   jge        0x7f3463bd8dc8
000b4 4585c0                         test       r8d, r8d
000b7 0f8e4e010000                   jle        0x7f3463bd810b
000bd 418d6bf7                       lea        ebp, [r11 - 9]
000c1 85ed                           test       ebp, ebp
000c3 0f8c690b0000                   jl         0x7f3463bd8b32
000c9 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
000ce 453bca                         cmp        r9d, r10d
000d1 0f83511e0000                   jae        0x7f3463bd9e28
000d7 4c63d5                         movsxd     r10, ebp
000da 4c03d3                         add        r10, rbx
000dd 4c3bd7                         cmp        r10, rdi
000e0 0f83421e0000                   jae        0x7f3463bd9e28
000e6 85ed                           test       ebp, ebp
000e8 0f8e1a1f0000                   jle        0x7f3463bd9f08
000ee 4183c3f6                       add        r11d, -0xa
000f2 33c9                           xor        ecx, ecx
000f4 48c1e108                       shl        rcx, 8
000f8 448bd5                         mov        r10d, ebp
000fb 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
00100 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00105 4f0fb6441008                   movzx      r8, byte ptr [r8 + r10 + 8]
0010b 4c0bc1                         or         r8, rcx
0010e 448d4dff                       lea        r9d, [rbp - 1]
00112 453bcb                         cmp        r9d, r11d
00115 7e08                           jle        0x7f3463bd801f
00117 498bc8                         mov        rcx, r8
0011a 418be9                         mov        ebp, r9d
0011d ebd5                           jmp        0x7f3463bd7ff4
0011f 4183f902                       cmp        r9d, 2
00123 0f8e92000000                   jle        0x7f3463bd80bb
00129 4d63d1                         movsxd     r10, r9d
0012c 4c03d3                         add        r10, rbx
0012f 4c3bd7                         cmp        r10, rdi
00132 0f83481e0000                   jae        0x7f3463bd9e80
00138 83c5fc                         add        ebp, -4
0013b 4c63d5                         movsxd     r10, ebp
0013e 4c03d3                         add        r10, rbx
00141 4c3bd7                         cmp        r10, rdi
00144 0f834a1e0000                   jae        0x7f3463bd9e94
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
001b9 7f95                           jg         0x7f3463bd8050
001bb 4183f9ff                       cmp        r9d, -1
001bf 7e37                           jle        0x7f3463bd80f8
001c1 4d63d1                         movsxd     r10, r9d
001c4 4c03d3                         add        r10, rbx
001c7 4c3bd7                         cmp        r10, rdi
001ca 0f83a41e0000                   jae        0x7f3463bd9f74
001d0 49c1e008                       shl        r8, 8
001d4 458bd9                         mov        r11d, r9d
001d7 44035c243c                     add        r11d, dword ptr [rsp + 0x3c]
001dc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
001e1 4f0fb6541a08                   movzx      r10, byte ptr [r10 + r11 + 8]
001e7 4d0bd0                         or         r10, r8
001ea 41ffc9                         dec        r9d
001ed 4183f9ff                       cmp        r9d, -1
001f1 7e08                           jle        0x7f3463bd80fb
001f3 4d8bc2                         mov        r8, r10
001f6 ebd8                           jmp        0x7f3463bd80d0
001f8 4d8bd0                         mov        r10, r8
001fb 41bb80000000                   mov        r11d, 0x80
00201 442bde                         sub        r11d, esi
00204 c442a1f7da                     shlx       r11, r10, r11
00209 eb03                           jmp        0x7f3463bd810e
0020b 4533db                         xor        r11d, r11d
0020e 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
00213 458b5018                       mov        r10d, dword ptr [r8 + 0x18]
00217 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0021c 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00221 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00225 44891424                       mov        dword ptr [rsp], r10d
00229 458b501c                       mov        r10d, dword ptr [r8 + 0x1c]
0022d 4489542454                     mov        dword ptr [rsp + 0x54], r10d
00232 458b4a04                       mov        r9d, dword ptr [r10 + 4]
00236 458b5020                       mov        r10d, dword ptr [r8 + 0x20]
0023a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0023f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00243 41b840000000                   mov        r8d, 0x40
00249 452bc6                         sub        r8d, r14d
0024c 418bc9                         mov        ecx, r9d
0024f 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00254 41034b04                       add        ecx, dword ptr [r11 + 4]
00258 4103ca                         add        ecx, r10d
0025b 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
0025f 85c9                           test       ecx, ecx
00261 0f84ad0c0000                   je         0x7f3463bd8e14
00267 413bc8                         cmp        ecx, r8d
0026a 0f8f240d0000                   jg         0x7f3463bd8e94
00270 442bc1                         sub        r8d, ecx
00273 c462bbf7442430                 shrx       r8, qword ptr [rsp + 0x30], r8
0027a 83f940                         cmp        ecx, 0x40
0027d 0f8d990d0000                   jge        0x7f3463bd8f1c
00283 448bd9                         mov        r11d, ecx
00286 442bd8                         sub        r11d, eax
00289 4183c308                       add        r11d, 8
0028d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00292 b901000000                     mov        ecx, 1
00297 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0029c c4e2a1f7c9                     shlx       rcx, rcx, r11
002a1 48ffc9                         dec        rcx
002a4 4923c8                         and        rcx, r8
002a7 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002ac 4183fb40                       cmp        r11d, 0x40
002b0 0f8dee0d0000                   jge        0x7f3463bd8fa4
002b6 4183fa20                       cmp        r10d, 0x20
002ba 0f8d5c0e0000                   jge        0x7f3463bd901c
002c0 c462abf7c1                     shrx       r8, rcx, r10
002c5 bf01000000                     mov        edi, 1
002ca c46229f7d7                     shlx       r10d, edi, r10d
002cf 41ffca                         dec        r10d
002d2 4d63d2                         movsxd     r10, r10d
002d5 4c23d1                         and        r10, rcx
002d8 458bd2                         mov        r10d, r10d
002db 4489542460                     mov        dword ptr [rsp + 0x60], r10d
002e0 4183f920                       cmp        r9d, 0x20
002e4 0f8dca0e0000                   jge        0x7f3463bd90b4
002ea 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
002ef 458b5204                       mov        r10d, dword ptr [r10 + 4]
002f3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002f8 448b1424                       mov        r10d, dword ptr [rsp]
002fc 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00300 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00305 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00309 458bea                         mov        r13d, r10d
0030c 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00310 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00315 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00319 418bf2                         mov        esi, r10d
0031c 418b5204                       mov        edx, dword ptr [r10 + 4]
00320 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00328 4585d2                         test       r10d, r10d
0032b 0f8e6a070000                   jle        0x7f3463bd899b
00331 c46231f7d7                     shlx       r10d, edi, r9d
00336 c442b3f7d8                     shrx       r11, r8, r9
0033b 41ffca                         dec        r10d
0033e 458bcb                         mov        r9d, r11d
00341 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
00349 4d63d2                         movsxd     r10, r10d
0034c 4d23d0                         and        r10, r8
0034f 458bd2                         mov        r10d, r10d
00352 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0035a 448d5bff                       lea        r11d, [rbx - 1]
0035e 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00366 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0036b 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00372 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0037a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0037f 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00386 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0038e 448d5aff                       lea        r11d, [rdx - 1]
00392 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
0039a 448d51ff                       lea        r10d, [rcx - 1]
0039e 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
003a6 85db                           test       ebx, ebx
003a8 0f86d2080000                   jbe        0x7f3463bd8b80
003ae 85c9                           test       ecx, ecx
003b0 0f86ca080000                   jbe        0x7f3463bd8b80
003b6 85d2                           test       edx, edx
003b8 0f86c2080000                   jbe        0x7f3463bd8b80
003be 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003c6 458b5204                       mov        r10d, dword ptr [r10 + 4]
003ca 4489542404                     mov        dword ptr [rsp + 4], r10d
003cf 4585d2                         test       r10d, r10d
003d2 0f86a8080000                   jbe        0x7f3463bd8b80
003d8 4d63d2                         movsxd     r10, r10d
003db 4c639c2490000000               movsxd     r11, dword ptr [rsp + 0x90]
003e3 49ffcb                         dec        r11
003e6 4d3bda                         cmp        r11, r10
003e9 0f8391080000                   jae        0x7f3463bd8b80
003ef 4983fb01                       cmp        r11, 1
003f3 41ba01000000                   mov        r10d, 1
003f9 4d0f4cda                       cmovl      r11, r10
003fd 418bfb                         mov        edi, r11d
00400 3bbc2490000000                 cmp        edi, dword ptr [rsp + 0x90]
00407 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0040f 410f4ffa                       cmovg      edi, r10d
00413 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00418 44239424ac000000               and        r10d, dword ptr [rsp + 0xac]
00420 418bd2                         mov        edx, r10d
00423 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0042b 44239424b0000000               and        r10d, dword ptr [rsp + 0xb0]
00433 458bca                         mov        r9d, r10d
00436 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0043e 44239424a4000000               and        r10d, dword ptr [rsp + 0xa4]
00446 4533db                         xor        r11d, r11d
00449 4533c0                         xor        r8d, r8d
0044c 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00454 4c898424b8000000               mov        qword ptr [rsp + 0xb8], r8
0045c 4489542408                     mov        dword ptr [rsp + 8], r10d
00461 448b1424                       mov        r10d, dword ptr [rsp]
00465 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0046a 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0046f 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00476 ffc5                           inc        ebp
00478 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0047d 49c1ea20                       shr        r10, 0x20
00481 458bd2                         mov        r10d, r10d
00484 410fb6da                       movzx      ebx, r10b
00488 8bca                           mov        ecx, edx
0048a 4c8b54d608                     mov        r10, qword ptr [rsi + rdx*8 + 8]
0048f 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00497 458bdd                         mov        r11d, r13d
0049a 4f8b54cd08                     mov        r10, qword ptr [r13 + r9*8 + 8]
0049f 4c89542470                     mov        qword ptr [rsp + 0x70], r10
004a4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
004ac 49c1ea20                       shr        r10, 0x20
004b0 458bd2                         mov        r10d, r10d
004b3 450fb6c2                       movzx      r8d, r10b
004b7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
004bc 49c1ea20                       shr        r10, 0x20
004c0 458bd2                         mov        r10d, r10d
004c3 450fb6f2                       movzx      r14d, r10b
004c7 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
004ce 0f8c840d0000                   jl         0x7f3463bd9158
004d4 478d1430                       lea        r10d, [r8 + r14]
004d8 4403d3                         add        r10d, ebx
004db 0f84530e0000                   je         0x7f3463bd9234
004e1 4183fa3f                       cmp        r10d, 0x3f
004e5 0f8f490f0000                   jg         0x7f3463bd9334
004eb b840000000                     mov        eax, 0x40
004f0 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
004f4 443bd0                         cmp        r10d, eax
004f7 0f8f37100000                   jg         0x7f3463bd9434
004fd 412bc2                         sub        eax, r10d
00500 c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
00507 4183fa40                       cmp        r10d, 0x40
0050b 0f8d23110000                   jge        0x7f3463bd9534
00511 ba01000000                     mov        edx, 1
00516 c4e2a9f7c2                     shlx       rax, rdx, r10
0051b 48ffc8                         dec        rax
0051e 4923c5                         and        rax, r13
00521 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00525 4103d2                         add        edx, r10d
00528 8954247c                       mov        dword ptr [rsp + 0x7c], edx
0052c 8b54245c                       mov        edx, dword ptr [rsp + 0x5c]
00530 4103d2                         add        edx, r10d
00533 8954245c                       mov        dword ptr [rsp + 0x5c], edx
00537 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0053c 4183fa40                       cmp        r10d, 0x40
00540 0f8d02120000                   jge        0x7f3463bd9648
00546 83fb40                         cmp        ebx, 0x40
00549 0f8dd5120000                   jge        0x7f3463bd9724
0054f c462e3f7d0                     shrx       r10, rax, rbx
00554 ba01000000                     mov        edx, 1
00559 c4e2e1f7da                     shlx       rbx, rdx, rbx
0055e 48ffcb                         dec        rbx
00561 4823d8                         and        rbx, rax
00564 4183f840                       cmp        r8d, 0x40
00568 0f8dd6130000                   jge        0x7f3463bd9844
0056e c442bbf7ea                     shrx       r13, r10, r8
00573 c462b9f7c2                     shlx       r8, rdx, r8
00578 49ffc8                         dec        r8
0057b 4d23c2                         and        r8, r10
0057e 4183fe40                       cmp        r14d, 0x40
00582 0f8db0140000                   jge        0x7f3463bd9938
00588 41ba01000000                   mov        r10d, 1
0058e c4c289f7c2                     shlx       rax, r10, r14
00593 448bd3                         mov        r10d, ebx
00596 48ffc8                         dec        rax
00599 4923c5                         and        rax, r13
0059c 458bc0                         mov        r8d, r8d
0059f 488b5c2470                     mov        rbx, qword ptr [rsp + 0x70]
005a4 8bdb                           mov        ebx, ebx
005a6 4803c3                         add        rax, rbx
005a9 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
005ae 8bd3                           mov        edx, ebx
005b0 4403d2                         add        r10d, edx
005b3 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
005bb 8bdb                           mov        ebx, ebx
005bd 4403c3                         add        r8d, ebx
005c0 4963d8                         movsxd     rbx, r8d
005c3 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
005cb 4803d3                         add        rdx, rbx
005ce 48899424b8000000               mov        qword ptr [rsp + 0xb8], rdx
005d6 4885c0                         test       rax, rax
005d9 0f8e6f070000                   jle        0x7f3463bd8c4e
005df 483dffffff7f                   cmp        rax, 0x7fffffff
005e5 0f8f21150000                   jg         0x7f3463bd9a0c
005eb 4181faffff0100                 cmp        r10d, 0x1ffff
005f2 0f8f14160000                   jg         0x7f3463bd9b0c
005f8 4181f8ffff0300                 cmp        r8d, 0x3ffff
005ff 0f8fcf160000                   jg         0x7f3463bd9bd4
00605 8bd0                           mov        edx, eax
00607 81fa00000010                   cmp        edx, 0x10000000
0060d 0f8389170000                   jae        0x7f3463bd9c9c
00613 4d63d2                         movsxd     r10, r10d
00616 48c1e312                       shl        rbx, 0x12
0061a 4c63c2                         movsxd     r8, edx
0061d 49c1e024                       shl        r8, 0x24
00621 490bd8                         or         rbx, r8
00624 490bda                         or         rbx, r10
00627 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0062f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00637 4b895cd008                     mov        qword ptr [r8 + r10*8 + 8], rbx
0063c 3bef                           cmp        ebp, edi
0063e 7d16                           jge        0x7f3463bd8556
00640 89ac2494000000                 mov        dword ptr [rsp + 0x94], ebp
00647 458beb                         mov        r13d, r11d
0064a 8bd1                           mov        edx, ecx
0064c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00651 e906feffff                     jmp        0x7f3463bd835c
00656 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
0065d 0f8db1060000                   jge        0x7f3463bd8c14
00663 3b6c2404                       cmp        ebp, dword ptr [rsp + 4]
00667 0f83b9060000                   jae        0x7f3463bd8c26
0066d 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00675 41ffc0                         inc        r8d
00678 443b442404                     cmp        r8d, dword ptr [rsp + 4]
0067d 0f83b7060000                   jae        0x7f3463bd8c3a
00683 41ffc2                         inc        r10d
00686 418bc3                         mov        eax, r11d
00689 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00691 448b1424                       mov        r10d, dword ptr [rsp]
00695 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0069a 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
0069f 4c8b54ce08                     mov        r10, qword ptr [rsi + rcx*8 + 8]
006a4 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
006a9 49c1eb20                       shr        r11, 0x20
006ad 458bdb                         mov        r11d, r11d
006b0 410fb6db                       movzx      ebx, r11b
006b4 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006bc 49c1ea20                       shr        r10, 0x20
006c0 458bda                         mov        r11d, r10d
006c3 450fb6c3                       movzx      r8d, r11b
006c7 448bd8                         mov        r11d, eax
006ca 4e8b54c808                     mov        r10, qword ptr [rax + r9*8 + 8]
006cf 4c89542470                     mov        qword ptr [rsp + 0x70], r10
006d4 49c1ea20                       shr        r10, 0x20
006d8 418bd2                         mov        edx, r10d
006db 440fb6f2                       movzx      r14d, dl
006df 478d1406                       lea        r10d, [r14 + r8]
006e3 4403d3                         add        r10d, ebx
006e6 0f84480c0000                   je         0x7f3463bd9234
006ec 4183fa3f                       cmp        r10d, 0x3f
006f0 0f8f3e0d0000                   jg         0x7f3463bd9334
006f6 b840000000                     mov        eax, 0x40
006fb 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
006ff 443bd0                         cmp        r10d, eax
00702 0f8f2c0e0000                   jg         0x7f3463bd9434
00708 412bc2                         sub        eax, r10d
0070b c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
00712 4183fa40                       cmp        r10d, 0x40
00716 0f8d180f0000                   jge        0x7f3463bd9534
0071c ba01000000                     mov        edx, 1
00721 c4e2a9f7c2                     shlx       rax, rdx, r10
00726 48ffc8                         dec        rax
00729 4923c5                         and        rax, r13
0072c 8b54245c                       mov        edx, dword ptr [rsp + 0x5c]
00730 4103d2                         add        edx, r10d
00733 8954245c                       mov        dword ptr [rsp + 0x5c], edx
00737 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0073b 4103d2                         add        edx, r10d
0073e 8954247c                       mov        dword ptr [rsp + 0x7c], edx
00742 83fa40                         cmp        edx, 0x40
00745 0f8dfd0f0000                   jge        0x7f3463bd9648
0074b 83fb40                         cmp        ebx, 0x40
0074e 0f8dd0100000                   jge        0x7f3463bd9724
00754 c462e3f7d0                     shrx       r10, rax, rbx
00759 ba01000000                     mov        edx, 1
0075e c4e2e1f7da                     shlx       rbx, rdx, rbx
00763 48ffcb                         dec        rbx
00766 4823d8                         and        rbx, rax
00769 4183f840                       cmp        r8d, 0x40
0076d 0f8dd1110000                   jge        0x7f3463bd9844
00773 c442bbf7ea                     shrx       r13, r10, r8
00778 c462b9f7c2                     shlx       r8, rdx, r8
0077d 49ffc8                         dec        r8
00780 4d23c2                         and        r8, r10
00783 4183fe40                       cmp        r14d, 0x40
00787 0f8dab120000                   jge        0x7f3463bd9938
0078d 41ba01000000                   mov        r10d, 1
00793 c4c289f7c2                     shlx       rax, r10, r14
00798 448bd3                         mov        r10d, ebx
0079b 48ffc8                         dec        rax
0079e 4923c5                         and        rax, r13
007a1 458bc0                         mov        r8d, r8d
007a4 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
007a9 8bd3                           mov        edx, ebx
007ab 4403d2                         add        r10d, edx
007ae 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
007b6 8bdb                           mov        ebx, ebx
007b8 4403c3                         add        r8d, ebx
007bb 488b5c2470                     mov        rbx, qword ptr [rsp + 0x70]
007c0 8bdb                           mov        ebx, ebx
007c2 4803c3                         add        rax, rbx
007c5 4963d0                         movsxd     rdx, r8d
007c8 488b9c24b8000000               mov        rbx, qword ptr [rsp + 0xb8]
007d0 4803da                         add        rbx, rdx
007d3 48899c24b8000000               mov        qword ptr [rsp + 0xb8], rbx
007db 4885c0                         test       rax, rax
007de 0f8e6a050000                   jle        0x7f3463bd8c4e
007e4 483dffffff7f                   cmp        rax, 0x7fffffff
007ea 0f8f1c130000                   jg         0x7f3463bd9a0c
007f0 4181faffff0100                 cmp        r10d, 0x1ffff
007f7 0f8f0f140000                   jg         0x7f3463bd9b0c
007fd 4181f8ffff0300                 cmp        r8d, 0x3ffff
00804 0f8fca140000                   jg         0x7f3463bd9bd4
0080a 8bd8                           mov        ebx, eax
0080c 81fb00000010                   cmp        ebx, 0x10000000
00812 0f8384150000                   jae        0x7f3463bd9c9c
00818 4d63d2                         movsxd     r10, r10d
0081b 48c1e212                       shl        rdx, 0x12
0081f 4c63c3                         movsxd     r8, ebx
00822 49c1e024                       shl        r8, 0x24
00826 4c0bc2                         or         r8, rdx
00829 4d0bc2                         or         r8, r10
0082c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00834 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0083b 4d8944da08                     mov        qword ptr [r10 + rbx*8 + 8], r8
00840 ffc3                           inc        ebx
00842 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
00849 7d0f                           jge        0x7f3463bd875a
0084b 418bc3                         mov        eax, r11d
0084e 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00855 e937feffff                     jmp        0x7f3463bd8591
0085a 418bc3                         mov        eax, r11d
0085d 8bfe                           mov        edi, esi
0085f 448bc1                         mov        r8d, ecx
00862 418bc9                         mov        ecx, r9d
00865 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
0086c 0f8d1f020000                   jge        0x7f3463bd8991
00872 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
00876 0f83bc170000                   jae        0x7f3463bd9f38
0087c 448bd3                         mov        r10d, ebx
0087f 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00884 0f83c2170000                   jae        0x7f3463bd9f4c
0088a 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00891 90                             nop        
00892 90                             nop        
00893 90                             nop        
00894 8bf7                           mov        esi, edi
00896 458bd8                         mov        r11d, r8d
00899 4e8b54c708                     mov        r10, qword ptr [rdi + r8*8 + 8]
0089e 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
008a5 ffc5                           inc        ebp
008a7 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
008af 49c1ea20                       shr        r10, 0x20
008b3 458bd2                         mov        r10d, r10d
008b6 450fb6c2                       movzx      r8d, r10b
008ba 448bc8                         mov        r9d, eax
008bd 4c8b54c808                     mov        r10, qword ptr [rax + rcx*8 + 8]
008c2 4c89542470                     mov        qword ptr [rsp + 0x70], r10
008c7 8b3c24                         mov        edi, dword ptr [rsp]
008ca 8b542408                       mov        edx, dword ptr [rsp + 8]
008ce 4c8b54d708                     mov        r10, qword ptr [rdi + rdx*8 + 8]
008d3 4c89542468                     mov        qword ptr [rsp + 0x68], r10
008d8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
008dd 49c1ea20                       shr        r10, 0x20
008e1 418bda                         mov        ebx, r10d
008e4 440fb6f3                       movzx      r14d, bl
008e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
008ed 49c1ea20                       shr        r10, 0x20
008f1 418bda                         mov        ebx, r10d
008f4 0fb6db                         movzx      ebx, bl
008f7 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
008fe 0f8c54090000                   jl         0x7f3463bd9158
00904 478d1430                       lea        r10d, [r8 + r14]
00908 4403d3                         add        r10d, ebx
0090b 0f84230a0000                   je         0x7f3463bd9234
00911 4183fa3f                       cmp        r10d, 0x3f
00915 0f8f190b0000                   jg         0x7f3463bd9334
0091b b840000000                     mov        eax, 0x40
00920 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
00924 443bd0                         cmp        r10d, eax
00927 0f8f070c0000                   jg         0x7f3463bd9434
0092d 412bc2                         sub        eax, r10d
00930 c462fbf76c2430                 shrx       r13, qword ptr [rsp + 0x30], rax
00937 4183fa40                       cmp        r10d, 0x40
0093b 0f8df30c0000                   jge        0x7f3463bd9534
00941 b801000000                     mov        eax, 1
00946 c4e2a9f7c0                     shlx       rax, rax, r10
0094b 48ffc8                         dec        rax
0094e 4923c5                         and        rax, r13
00951 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
00956 4503ea                         add        r13d, r10d
00959 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0095e 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00963 4503ea                         add        r13d, r10d
00966 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
0096b 4183fd40                       cmp        r13d, 0x40
0096f 0f8dd30d0000                   jge        0x7f3463bd9648
00975 83fb40                         cmp        ebx, 0x40
00978 0f8da60e0000                   jge        0x7f3463bd9724
0097e c462e3f7d0                     shrx       r10, rax, rbx
00983 41bd01000000                   mov        r13d, 1
00989 c4c2e1f7dd                     shlx       rbx, r13, rbx
0098e 48ffcb                         dec        rbx
00991 4823d8                         and        rbx, rax
00994 4183f840                       cmp        r8d, 0x40
00998 0f8da60f0000                   jge        0x7f3463bd9844
0099e c442bbf7ea                     shrx       r13, r10, r8
009a3 b801000000                     mov        eax, 1
009a8 c462b9f7c0                     shlx       r8, rax, r8
009ad 49ffc8                         dec        r8
009b0 4d23c2                         and        r8, r10
009b3 4183fe40                       cmp        r14d, 0x40
009b7 0f8d7b100000                   jge        0x7f3463bd9938
009bd 41ba01000000                   mov        r10d, 1
009c3 c4c289f7c2                     shlx       rax, r10, r14
009c8 448bd3                         mov        r10d, ebx
009cb 48ffc8                         dec        rax
009ce 4923c5                         and        rax, r13
009d1 458bc0                         mov        r8d, r8d
009d4 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
009d9 448beb                         mov        r13d, ebx
009dc 4503d5                         add        r10d, r13d
009df 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
009e7 8bdb                           mov        ebx, ebx
009e9 4403c3                         add        r8d, ebx
009ec 488b5c2470                     mov        rbx, qword ptr [rsp + 0x70]
009f1 8bdb                           mov        ebx, ebx
009f3 4803c3                         add        rax, rbx
009f6 4963d8                         movsxd     rbx, r8d
009f9 4c8bac24b8000000               mov        r13, qword ptr [rsp + 0xb8]
00a01 4c03eb                         add        r13, rbx
00a04 4c89ac24b8000000               mov        qword ptr [rsp + 0xb8], r13
00a0c 4885c0                         test       rax, rax
00a0f 0f8e39030000                   jle        0x7f3463bd8c4e
00a15 483dffffff7f                   cmp        rax, 0x7fffffff
00a1b 0f8feb100000                   jg         0x7f3463bd9a0c
00a21 4181faffff0100                 cmp        r10d, 0x1ffff
00a28 0f8fde110000                   jg         0x7f3463bd9b0c
00a2e 4181f8ffff0300                 cmp        r8d, 0x3ffff
00a35 0f8f99120000                   jg         0x7f3463bd9bd4
00a3b 448be8                         mov        r13d, eax
00a3e 4181fd00000010                 cmp        r13d, 0x10000000
00a45 0f8351130000                   jae        0x7f3463bd9c9c
00a4b 4d63d2                         movsxd     r10, r10d
00a4e 4d63c5                         movsxd     r8, r13d
00a51 48c1e312                       shl        rbx, 0x12
00a55 49c1e024                       shl        r8, 0x24
00a59 490bd8                         or         rbx, r8
00a5c 490bda                         or         rbx, r10
00a5f 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00a67 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00a6f 4b895cc208                     mov        qword ptr [r10 + r8*8 + 8], rbx
00a74 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00a7b 7d14                           jge        0x7f3463bd8991
00a7d 89ac2494000000                 mov        dword ptr [rsp + 0x94], ebp
00a84 418bc1                         mov        eax, r9d
00a87 8bfe                           mov        edi, esi
00a89 458bc3                         mov        r8d, r11d
00a8c e903feffff                     jmp        0x7f3463bd8794
00a91 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00a99 eb03                           jmp        0x7f3463bd899e
00a9b 4533c0                         xor        r8d, r8d
00a9e 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
00aa3 4d03c2                         add        r8, r10
00aa6 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
00aae 4d3bc2                         cmp        r8, r10
00ab1 0f8fb1130000                   jg         0x7f3463bd9d68
00ab7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00abc 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00ac1 0f85d9130000                   jne        0x7f3463bd9da0
00ac7 418bc0                         mov        eax, r8d
00aca 4881c4d0000000                 add        rsp, 0xd0
00ad1 5d                             pop        rbp
00ad2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ad6 0f8718170000                   ja         0x7f3463bda0f4
00adc c3                             ret        
00add 458d4bff                       lea        r9d, [r11 - 1]
00ae1 4585c9                         test       r9d, r9d
00ae4 0f8c43010000                   jl         0x7f3463bd8b2d
00aea 413bca                         cmp        ecx, r10d
00aed 0f83d5130000                   jae        0x7f3463bd9dc8
00af3 4d63c1                         movsxd     r8, r9d
00af6 4c03c3                         add        r8, rbx
00af9 4c3bc7                         cmp        r8, rdi
00afc 0f83c6130000                   jae        0x7f3463bd9dc8
00b02 4585c9                         test       r9d, r9d
00b05 0f8e9d140000                   jle        0x7f3463bd9ea8
00b0b 418d53fe                       lea        edx, [r11 - 2]
00b0f 33ed                           xor        ebp, ebp
00b11 458bc1                         mov        r8d, r9d
00b14 440344243c                     add        r8d, dword ptr [rsp + 0x3c]
00b19 488b4c2440                     mov        rcx, qword ptr [rsp + 0x40]
00b1e 4e0fb6440108                   movzx      r8, byte ptr [rcx + r8 + 8]
00b24 48c1e508                       shl        rbp, 8
00b28 4c0bc5                         or         r8, rbp
00b2b 418d49ff                       lea        ecx, [r9 - 1]
00b2f 3bca                           cmp        ecx, edx
00b31 7e08                           jle        0x7f3463bd8a3b
00b33 498be8                         mov        rbp, r8
00b36 448bc9                         mov        r9d, ecx
00b39 ebd6                           jmp        0x7f3463bd8a11
00b3b 83f902                         cmp        ecx, 2
00b3e 0f8e91000000                   jle        0x7f3463bd8ad5
00b44 4863d1                         movsxd     rdx, ecx
00b47 4803d3                         add        rdx, rbx
00b4a 483bd7                         cmp        rdx, rdi
00b4d 0f8305140000                   jae        0x7f3463bd9e58
00b53 4183c1fc                       add        r9d, -4
00b57 4d63c9                         movsxd     r9, r9d
00b5a 4c03cb                         add        r9, rbx
00b5d 4c3bcf                         cmp        r9, rdi
00b60 0f8306140000                   jae        0x7f3463bd9e6c
00b66 890424                         mov        dword ptr [rsp], eax
00b69 90                             nop        
00b6a 90                             nop        
00b6b 90                             nop        
00b6c 90                             nop        
00b6d 90                             nop        
00b6e 90                             nop        
00b6f 90                             nop        
00b70 49c1e008                       shl        r8, 8
00b74 8bd1                           mov        edx, ecx
00b76 0354243c                       add        edx, dword ptr [rsp + 0x3c]
00b7a 448bc9                         mov        r9d, ecx
00b7d 44034c243c                     add        r9d, dword ptr [rsp + 0x3c]
00b82 4963e9                         movsxd     rbp, r9d
00b85 8d42fe                         lea        eax, [rdx - 2]
00b88 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00b8d 490fb6440108                   movzx      rax, byte ptr [r9 + rax + 8]
00b93 83c2fd                         add        edx, -3
00b96 4d0fb64c1108                   movzx      r9, byte ptr [r9 + rdx + 8]
00b9c 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00ba1 480fb6542a07                   movzx      rdx, byte ptr [rdx + rbp + 7]
00ba7 4c8b6c2440                     mov        r13, qword ptr [rsp + 0x40]
00bac 490fb66c2d08                   movzx      rbp, byte ptr [r13 + rbp + 8]
00bb2 4c0bc5                         or         r8, rbp
00bb5 49c1e008                       shl        r8, 8
00bb9 4c0bc2                         or         r8, rdx
00bbc 49c1e008                       shl        r8, 8
00bc0 4c0bc0                         or         r8, rax
00bc3 49c1e008                       shl        r8, 8
00bc7 4d0bc1                         or         r8, r9
00bca 83c1fc                         add        ecx, -4
00bcd 83f902                         cmp        ecx, 2
00bd0 7f9e                           jg         0x7f3463bd8a70
00bd2 8b0424                         mov        eax, dword ptr [rsp]
00bd5 83f9ff                         cmp        ecx, -1
00bd8 7e38                           jle        0x7f3463bd8b12
00bda 4c63c9                         movsxd     r9, ecx
00bdd 4c03cb                         add        r9, rbx
00be0 4c3bcf                         cmp        r9, rdi
00be3 0f8377140000                   jae        0x7f3463bd9f60
00be9 90                             nop        
00bea 90                             nop        
00beb 90                             nop        
00bec 49c1e008                       shl        r8, 8
00bf0 448bc9                         mov        r9d, ecx
00bf3 44034c243c                     add        r9d, dword ptr [rsp + 0x3c]
00bf8 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00bfd 4e0fb64c0a08                   movzx      r9, byte ptr [rdx + r9 + 8]
00c03 4d0bc8                         or         r9, r8
00c06 ffc9                           dec        ecx
00c08 83f9ff                         cmp        ecx, -1
00c0b 7e08                           jle        0x7f3463bd8b15
00c0d 4d8bc1                         mov        r8, r9
00c10 ebda                           jmp        0x7f3463bd8aec
00c12 4d8bc8                         mov        r9, r8
00c15 41b840000000                   mov        r8d, 0x40
00c1b 442bc6                         sub        r8d, esi
00c1e c442b9f7c1                     shlx       r8, r9, r8
00c23 4c89442430                     mov        qword ptr [rsp + 0x30], r8
00c28 e979f4ffff                     jmp        0x7f3463bd7fa6
00c2d 4533c9                         xor        r9d, r9d
00c30 ebe3                           jmp        0x7f3463bd8b15
00c32 4533d2                         xor        r10d, r10d
00c35 e9c1f5ffff                     jmp        0x7f3463bd80fb
00c3a bee4ffffff                     mov        esi, 0xffffffe4
00c3f 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00c44 891424                         mov        dword ptr [rsp], edx
00c47 894c2404                       mov        dword ptr [rsp + 4], ecx
00c4b 4c89442408                     mov        qword ptr [rsp + 8], r8
00c50 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00c55 897c2418                       mov        dword ptr [rsp + 0x18], edi
00c59 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00c5e 90                             nop        
00c5f e87c7ca8ff                     call       0x7f34636607e0
00c64 0f1f84005c0d0000               nop        dword ptr [rax + rax + 0xd5c]
00c6c 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c7a e8e1394c17                     call       0x7f347b09c560
00c7f f4                             hlt        
00c80 be6effffff                     mov        esi, 0xffffff6e
00c85 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00c8a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00c8f 44891c24                       mov        dword ptr [rsp], r11d
00c93 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c98 4489542404                     mov        dword ptr [rsp + 4], r10d
00c9d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00ca2 4c89542408                     mov        qword ptr [rsp + 8], r10
00ca7 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00cac 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00cb1 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00cb9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00cbe 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00cc3 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00cc8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ccd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00cd2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00cd7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00cdc 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00ce1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00ce6 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00ceb 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00cf0 90                             nop        
00cf1 90                             nop        
00cf2 90                             nop        
00cf3 e8e87ba8ff                     call       0x7f34636607e0
00cf8 0f1f8400f00d0001               nop        dword ptr [rax + rax + 0x1000df0]
00d00 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00d0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d0e e84d394c17                     call       0x7f347b09c560
00d13 f4                             hlt        
00d14 418bc3                         mov        eax, r11d
00d17 8bfe                           mov        edi, esi
00d19 448bc1                         mov        r8d, ecx
00d1c 418bc9                         mov        ecx, r9d
00d1f 8bdd                           mov        ebx, ebp
00d21 e93ffbffff                     jmp        0x7f3463bd8765
00d26 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
00d30 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d34 e827394c17                     call       0x7f347b09c560
00d39 f4                             hlt        
00d3a 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
00d44 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d48 e813394c17                     call       0x7f347b09c560
00d4d f4                             hlt        
00d4e 4533db                         xor        r11d, r11d
00d51 493bc3                         cmp        rax, r11
00d54 bdffffffff                     mov        ebp, 0xffffffff
00d59 7c08                           jl         0x7f3463bd8c63
00d5b 400f95c5                       setne      bpl
00d5f 400fb6ed                       movzx      ebp, bpl
00d63 be45ffffff                     mov        esi, 0xffffff45
00d68 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00d6d 4c891c24                       mov        qword ptr [rsp], r11
00d71 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
00d76 44894c2408                     mov        dword ptr [rsp + 8], r9d
00d7b 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00d80 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00d85 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00d8d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d92 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00d97 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00d9c 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00da1 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00da6 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00dab 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00db0 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00db5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00dba 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
00dbf 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00dc4 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00dc9 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dce 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
00dd3 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00dd8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ddd 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00de2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00de7 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00dec 48ffb42480000000               push       qword ptr [rsp + 0x80]
00df4 488f442478                     pop        qword ptr [rsp + 0x78]
00df9 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
00e01 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00e09 48894424f8                     mov        qword ptr [rsp - 8], rax
00e0e 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00e15 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
00e1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e21 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00e29 90                             nop        
00e2a 90                             nop        
00e2b e8b07aa8ff                     call       0x7f34636607e0
00e30 0f1f8400280f0002               nop        dword ptr [rax + rax + 0x2000f28]
00e38 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00e42 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e46 e815384c17                     call       0x7f347b09c560
00e4b f4                             hlt        
00e4c be45ffffff                     mov        esi, 0xffffff45
00e51 8be8                           mov        ebp, eax
00e53 e8887aa8ff                     call       0x7f34636607e0
00e58 0f1f8400500f0003               nop        dword ptr [rax + rax + 0x3000f50]
00e60 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e6e e8ed374c17                     call       0x7f347b09c560
00e73 f4                             hlt        
00e74 be45ffffff                     mov        esi, 0xffffff45
00e79 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00e7e 894c2404                       mov        dword ptr [rsp + 4], ecx
00e82 4c89442408                     mov        qword ptr [rsp + 8], r8
00e87 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00e8c 897c2418                       mov        dword ptr [rsp + 0x18], edi
00e90 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
00e95 895c2420                       mov        dword ptr [rsp + 0x20], ebx
00e99 89542424                       mov        dword ptr [rsp + 0x24], edx
00e9d 89542430                       mov        dword ptr [rsp + 0x30], edx
00ea1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ea6 90                             nop        
00ea7 e8347aa8ff                     call       0x7f34636607e0
00eac 0f1f8400a40f0004               nop        dword ptr [rax + rax + 0x4000fa4]
00eb4 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00ebe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ec2 e899374c17                     call       0x7f347b09c560
00ec7 f4                             hlt        
00ec8 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00ecc 83c5f8                         add        ebp, -8
00ecf be45ffffff                     mov        esi, 0xffffff45
00ed4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00ed9 4c891424                       mov        qword ptr [rsp], r10
00edd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ee2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ee7 4489742424                     mov        dword ptr [rsp + 0x24], r14d
00eec 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00ef1 90                             nop        
00ef2 90                             nop        
00ef3 e8e879a8ff                     call       0x7f34636607e0
00ef8 0f1f8400f00f0005               nop        dword ptr [rax + rax + 0x5000ff0]
00f00 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f0e e84d374c17                     call       0x7f347b09c560
00f13 f4                             hlt        
00f14 be45ffffff                     mov        esi, 0xffffff45
00f19 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00f1e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f23 44891424                       mov        dword ptr [rsp], r10d
00f27 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f2c 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f31 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f36 4c89542408                     mov        qword ptr [rsp + 8], r10
00f3b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f40 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f45 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f4a 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00f4f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f54 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f59 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f5e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00f63 4489742424                     mov        dword ptr [rsp + 0x24], r14d
00f68 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00f6d 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00f71 90                             nop        
00f72 90                             nop        
00f73 e86879a8ff                     call       0x7f34636607e0
00f78 0f1f840070100006               nop        dword ptr [rax + rax + 0x6001070]
00f80 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
00f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f8e e8cd364c17                     call       0x7f347b09c560
00f93 f4                             hlt        
00f94 be45ffffff                     mov        esi, 0xffffff45
00f99 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00f9e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00fa3 44891c24                       mov        dword ptr [rsp], r11d
00fa7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fac 4489542404                     mov        dword ptr [rsp + 4], r10d
00fb1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00fb6 4c89542408                     mov        qword ptr [rsp + 8], r10
00fbb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00fc0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fc5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00fca 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00fcf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fd4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00fd9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fde 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00fe3 4489742424                     mov        dword ptr [rsp + 0x24], r14d
00fe8 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00fed 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ff2 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00ff6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00ffb e8e078a8ff                     call       0x7f34636607e0
01000 0f1f8400f8100007               nop        dword ptr [rax + rax + 0x70010f8]
01008 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01012 4883e4f0                       and        rsp, 0xfffffffffffffff0
01016 e845364c17                     call       0x7f347b09c560
0101b f4                             hlt        
0101c be45ffffff                     mov        esi, 0xffffff45
01021 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01026 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0102b 44891c24                       mov        dword ptr [rsp], r11d
0102f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01034 4489542404                     mov        dword ptr [rsp + 4], r10d
01039 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0103e 4c89542408                     mov        qword ptr [rsp + 8], r10
01043 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01048 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0104d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01052 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01057 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0105c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01061 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01066 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0106b 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01070 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01075 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0107a 4c89442448                     mov        qword ptr [rsp + 0x48], r8
0107f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01083 e85878a8ff                     call       0x7f34636607e0
01088 0f1f840080110008               nop        dword ptr [rax + rax + 0x8001180]
01090 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0109a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0109e e8bd354c17                     call       0x7f347b09c560
010a3 f4                             hlt        
010a4 be45ffffff                     mov        esi, 0xffffff45
010a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
010ae 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
010b3 44891424                       mov        dword ptr [rsp], r10d
010b7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
010bc 4489542404                     mov        dword ptr [rsp + 4], r10d
010c1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
010c6 4c89542408                     mov        qword ptr [rsp + 8], r10
010cb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010d0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010d5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010da 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
010df 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
010e4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
010e9 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
010ee 4489542424                     mov        dword ptr [rsp + 0x24], r10d
010f3 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
010f8 90                             nop        
010f9 90                             nop        
010fa 90                             nop        
010fb e8e077a8ff                     call       0x7f34636607e0
01100 0f1f8400f8110009               nop        dword ptr [rax + rax + 0x90011f8]
01108 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01112 4883e4f0                       and        rsp, 0xfffffffffffffff0
01116 e845354c17                     call       0x7f347b09c560
0111b f4                             hlt        
0111c be45ffffff                     mov        esi, 0xffffff45
01121 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01126 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0112b 44891c24                       mov        dword ptr [rsp], r11d
0112f 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01134 4489442404                     mov        dword ptr [rsp + 4], r8d
01139 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0113e 4c895c2408                     mov        qword ptr [rsp + 8], r11
01143 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01148 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0114d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01152 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01157 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0115c 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01161 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01166 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0116b 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01170 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01175 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
0117a 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0117f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01184 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01189 48894c2450                     mov        qword ptr [rsp + 0x50], rcx
0118e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01193 e84877a8ff                     call       0x7f34636607e0
01198 0f1f84009012000a               nop        dword ptr [rax + rax + 0xa001290]
011a0 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
011aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ae e8ad344c17                     call       0x7f347b09c560
011b3 f4                             hlt        
011b4 be45ffffff                     mov        esi, 0xffffff45
011b9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
011be 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
011c3 44891c24                       mov        dword ptr [rsp], r11d
011c7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
011cc 4489542404                     mov        dword ptr [rsp + 4], r10d
011d1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
011d6 4c89542408                     mov        qword ptr [rsp + 8], r10
011db 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
011e0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
011e5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
011ea 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
011ef 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
011f4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
011f9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
011fe 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01203 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01208 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0120d 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01212 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01217 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0121c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01221 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01226 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0122b 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01230 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
01235 90                             nop        
01236 90                             nop        
01237 e8a476a8ff                     call       0x7f34636607e0
0123c 0f1f84003413000b               nop        dword ptr [rax + rax + 0xb001334]
01244 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0124e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01252 e809344c17                     call       0x7f347b09c560
01257 f4                             hlt        
01258 be45ffffff                     mov        esi, 0xffffff45
0125d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01262 4c891424                       mov        qword ptr [rsp], r10
01266 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0126b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01270 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01275 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0127a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01282 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01287 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0128c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01291 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01296 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0129b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
012a0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
012a5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
012aa 4489542440                     mov        dword ptr [rsp + 0x40], r10d
012af 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
012b4 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
012b9 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
012be 4489542448                     mov        dword ptr [rsp + 0x48], r10d
012c3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
012c8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
012cd 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
012d2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
012d7 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
012df 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
012e4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
012e9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
012ee 48ffb42480000000               push       qword ptr [rsp + 0x80]
012f6 488f442478                     pop        qword ptr [rsp + 0x78]
012fb 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01303 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0130b 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
01312 90                             nop        
01313 e8c875a8ff                     call       0x7f34636607e0
01318 0f1f84001014000c               nop        dword ptr [rax + rax + 0xc001410]
01320 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0132a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0132e e82d334c17                     call       0x7f347b09c560
01333 f4                             hlt        
01334 be45ffffff                     mov        esi, 0xffffff45
01339 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0133e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01343 44891c24                       mov        dword ptr [rsp], r11d
01347 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0134c 44895c2404                     mov        dword ptr [rsp + 4], r11d
01351 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01356 4c895c2408                     mov        qword ptr [rsp + 8], r11
0135b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01360 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01365 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0136a 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0136f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01374 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01379 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0137e 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01383 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01388 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0138d 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01392 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01397 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
0139c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
013a1 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
013a6 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
013ab 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
013b0 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
013b5 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
013ba 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
013bf 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
013c7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
013cc 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
013d1 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
013d6 48ff742468                     push       qword ptr [rsp + 0x68]
013db 488f442460                     pop        qword ptr [rsp + 0x60]
013e0 48ff742470                     push       qword ptr [rsp + 0x70]
013e5 488f442468                     pop        qword ptr [rsp + 0x68]
013ea 48ffb42480000000               push       qword ptr [rsp + 0x80]
013f2 488f442470                     pop        qword ptr [rsp + 0x70]
013f7 4489742478                     mov        dword ptr [rsp + 0x78], r14d
013fc 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01401 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01408 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01410 90                             nop        
01411 90                             nop        
01412 90                             nop        
01413 e8c874a8ff                     call       0x7f34636607e0
01418 0f1f84001015000d               nop        dword ptr [rax + rax + 0xd001510]
01420 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0142a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0142e e82d324c17                     call       0x7f347b09c560
01433 f4                             hlt        
01434 be45ffffff                     mov        esi, 0xffffff45
01439 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0143e 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01443 44890c24                       mov        dword ptr [rsp], r9d
01447 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0144c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01451 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01456 4c895c2408                     mov        qword ptr [rsp + 8], r11
0145b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01460 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01465 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0146a 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0146f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01474 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01479 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0147e 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01483 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
01488 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0148d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01492 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01497 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
0149c 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
014a1 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
014a6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
014ab 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
014b0 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
014b5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
014ba 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
014bf 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
014c7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
014cc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
014d1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
014d6 48ff742468                     push       qword ptr [rsp + 0x68]
014db 488f442460                     pop        qword ptr [rsp + 0x60]
014e0 48ff742470                     push       qword ptr [rsp + 0x70]
014e5 488f442468                     pop        qword ptr [rsp + 0x68]
014ea 48ffb42480000000               push       qword ptr [rsp + 0x80]
014f2 488f442470                     pop        qword ptr [rsp + 0x70]
014f7 4489742478                     mov        dword ptr [rsp + 0x78], r14d
014fc 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01501 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01508 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01510 90                             nop        
01511 90                             nop        
01512 90                             nop        
01513 e8c873a8ff                     call       0x7f34636607e0
01518 0f1f84001016000e               nop        dword ptr [rax + rax + 0xe001610]
01520 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0152a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0152e e82d314c17                     call       0x7f347b09c560
01533 f4                             hlt        
01534 be45ffffff                     mov        esi, 0xffffff45
01539 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0153e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01543 44891c24                       mov        dword ptr [rsp], r11d
01547 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0154c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01551 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01556 4c895c2408                     mov        qword ptr [rsp + 8], r11
0155b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01560 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01565 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0156d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01572 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01577 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0157c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01581 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01586 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0158b 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01590 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
01595 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0159a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0159f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
015a4 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
015a9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
015ae 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
015b3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
015b8 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
015bd 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
015c2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015c7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
015cc 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
015d4 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
015d9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
015de 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
015e3 48ffb42480000000               push       qword ptr [rsp + 0x80]
015eb 488f442478                     pop        qword ptr [rsp + 0x78]
015f0 4489742464                     mov        dword ptr [rsp + 0x64], r14d
015f5 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
015fd 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01604 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0160c 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01613 e8c872a8ff                     call       0x7f34636607e0
01618 0f1f84001017000f               nop        dword ptr [rax + rax + 0xf001710]
01620 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0162a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0162e e82d304c17                     call       0x7f347b09c560
01633 f4                             hlt        
01634 be45ffffff                     mov        esi, 0xffffff45
01639 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0163e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01643 44891c24                       mov        dword ptr [rsp], r11d
01647 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0164c 44895c2404                     mov        dword ptr [rsp + 4], r11d
01651 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01656 4c895c2408                     mov        qword ptr [rsp + 8], r11
0165b 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01660 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01665 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
0166d 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01672 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01677 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0167c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01681 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01686 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0168b 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01690 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01695 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0169a 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
0169f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
016a4 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
016a9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016ae 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
016b3 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
016b8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
016bd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
016c2 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
016c7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
016cc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
016d4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
016d9 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
016de 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
016e3 48ff742468                     push       qword ptr [rsp + 0x68]
016e8 488f442460                     pop        qword ptr [rsp + 0x60]
016ed 48ff742470                     push       qword ptr [rsp + 0x70]
016f2 488f442468                     pop        qword ptr [rsp + 0x68]
016f7 48ffb42480000000               push       qword ptr [rsp + 0x80]
016ff 488f442470                     pop        qword ptr [rsp + 0x70]
01704 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01709 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0170e 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01715 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
0171d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
01725 90                             nop        
01726 90                             nop        
01727 e8b471a8ff                     call       0x7f34636607e0
0172c 0f1f840024180010               nop        dword ptr [rax + rax + 0x10001824]
01734 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0173e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01742 e8192f4c17                     call       0x7f347b09c560
01747 f4                             hlt        
01748 be45ffffff                     mov        esi, 0xffffff45
0174d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01752 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01757 44891c24                       mov        dword ptr [rsp], r11d
0175b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01760 44895c2404                     mov        dword ptr [rsp + 4], r11d
01765 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0176a 4c89542408                     mov        qword ptr [rsp + 8], r10
0176f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01774 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01779 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0177e 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01783 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01788 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0178d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01792 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01797 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
0179c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
017a1 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
017a6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017ab 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017b0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017b5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017ba 4489542440                     mov        dword ptr [rsp + 0x40], r10d
017bf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
017c4 4489542450                     mov        dword ptr [rsp + 0x50], r10d
017c9 48ff742468                     push       qword ptr [rsp + 0x68]
017ce 488f442458                     pop        qword ptr [rsp + 0x58]
017d3 48ff742470                     push       qword ptr [rsp + 0x70]
017d8 488f442460                     pop        qword ptr [rsp + 0x60]
017dd 48ffb42480000000               push       qword ptr [rsp + 0x80]
017e5 488f442468                     pop        qword ptr [rsp + 0x68]
017ea 4489742470                     mov        dword ptr [rsp + 0x70], r14d
017ef 4489442474                     mov        dword ptr [rsp + 0x74], r8d
017f4 895c2478                       mov        dword ptr [rsp + 0x78], ebx
017f8 4889842480000000               mov        qword ptr [rsp + 0x80], rax
01800 90                             nop        
01801 90                             nop        
01802 90                             nop        
01803 e8d870a8ff                     call       0x7f34636607e0
01808 0f1f840000190011               nop        dword ptr [rax + rax + 0x11001900]
01810 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0181a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0181e e83d2e4c17                     call       0x7f347b09c560
01823 f4                             hlt        
01824 be45ffffff                     mov        esi, 0xffffff45
01829 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0182e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01833 44891424                       mov        dword ptr [rsp], r10d
01837 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0183c 4489542404                     mov        dword ptr [rsp + 4], r10d
01841 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01846 4c89542408                     mov        qword ptr [rsp + 8], r10
0184b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01850 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01855 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0185d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01862 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01867 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0186c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01871 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01876 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0187b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01880 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01885 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0188a 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0188f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01894 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01899 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0189e 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
018a3 4489542440                     mov        dword ptr [rsp + 0x40], r10d
018a8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
018ad 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
018b2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018b7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018bc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
018c4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018c9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018ce 4489542458                     mov        dword ptr [rsp + 0x58], r10d
018d3 48894424f8                     mov        qword ptr [rsp - 8], rax
018d8 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
018df 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e8 48ff742468                     push       qword ptr [rsp + 0x68]
018ed 488f442460                     pop        qword ptr [rsp + 0x60]
018f2 48ff742470                     push       qword ptr [rsp + 0x70]
018f7 488f442468                     pop        qword ptr [rsp + 0x68]
018fc 48ffb42480000000               push       qword ptr [rsp + 0x80]
01904 488f442470                     pop        qword ptr [rsp + 0x70]
01909 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0190e 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01913 4889842490000000               mov        qword ptr [rsp + 0x90], rax
0191b 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01922 90                             nop        
01923 e8b86fa8ff                     call       0x7f34636607e0
01928 0f1f8400201a0012               nop        dword ptr [rax + rax + 0x12001a20]
01930 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0193a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0193e e81d2d4c17                     call       0x7f347b09c560
01943 f4                             hlt        
01944 be45ffffff                     mov        esi, 0xffffff45
01949 8beb                           mov        ebp, ebx
0194b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01950 4c891c24                       mov        qword ptr [rsp], r11
01954 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01959 44894c2408                     mov        dword ptr [rsp + 8], r9d
0195e 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01963 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01968 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01970 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01975 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0197a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0197f 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01984 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01989 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0198e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01993 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01998 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0199d 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
019a2 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
019a7 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
019ac 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
019b1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
019b6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019bb 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
019c0 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
019c5 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
019cd 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
019d2 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
019d7 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
019dc 48894424f8                     mov        qword ptr [rsp - 8], rax
019e1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
019e8 89442464                       mov        dword ptr [rsp + 0x64], eax
019ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f1 48ffb42480000000               push       qword ptr [rsp + 0x80]
019f9 488f442478                     pop        qword ptr [rsp + 0x78]
019fe 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01a06 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01a0e 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
01a16 90                             nop        
01a17 e8c46ea8ff                     call       0x7f34636607e0
01a1c 0f1f8400141b0013               nop        dword ptr [rax + rax + 0x13001b14]
01a24 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01a2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a32 e8292c4c17                     call       0x7f347b09c560
01a37 f4                             hlt        
01a38 be45ffffff                     mov        esi, 0xffffff45
01a3d 458bd8                         mov        r11d, r8d
01a40 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01a48 8beb                           mov        ebp, ebx
01a4a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a4f 4c891424                       mov        qword ptr [rsp], r10
01a53 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a58 4489542408                     mov        dword ptr [rsp + 8], r10d
01a5d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a62 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a67 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a6c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a71 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a76 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a7b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01a80 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a85 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a8a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a8f 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
01a94 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a99 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01a9e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01aa3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01aa8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01aad 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ab2 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01ab7 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01abf 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01ac4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ac9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ace 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ad6 488f442478                     pop        qword ptr [rsp + 0x78]
01adb 4c89ac2480000000               mov        qword ptr [rsp + 0x80], r13
01ae3 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
01aeb e8f06da8ff                     call       0x7f34636607e0
01af0 0f1f8400e81b0014               nop        dword ptr [rax + rax + 0x14001be8]
01af8 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01b02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b06 e8552b4c17                     call       0x7f347b09c560
01b0b f4                             hlt        
01b0c be45ffffff                     mov        esi, 0xffffff45
01b11 41bbffffff7f                   mov        r11d, 0x7fffffff
01b17 493bc3                         cmp        rax, r11
01b1a bdffffffff                     mov        ebp, 0xffffffff
01b1f 7c08                           jl         0x7f3463bd9a29
01b21 400f95c5                       setne      bpl
01b25 400fb6ed                       movzx      ebp, bpl
01b29 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01b2e 4c891c24                       mov        qword ptr [rsp], r11
01b32 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b37 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b3c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b41 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b46 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01b4e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01b53 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b58 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b5d 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01b62 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01b67 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01b6c 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b71 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01b76 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01b7b 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01b80 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01b85 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01b8a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01b8f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b94 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01b99 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01b9e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01ba3 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01ba8 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01bad 48ffb42480000000               push       qword ptr [rsp + 0x80]
01bb5 488f442478                     pop        qword ptr [rsp + 0x78]
01bba 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01bc2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01bca 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcf 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01bd6 8984248c000000                 mov        dword ptr [rsp + 0x8c], eax
01bdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be2 4889842490000000               mov        qword ptr [rsp + 0x90], rax
01bea 90                             nop        
01beb e8f06ca8ff                     call       0x7f34636607e0
01bf0 0f1f8400e81c0015               nop        dword ptr [rax + rax + 0x15001ce8]
01bf8 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e8552a4c17                     call       0x7f347b09c560
01c0b f4                             hlt        
01c0c be45ffffff                     mov        esi, 0xffffff45
01c11 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01c16 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01c1b 44890424                       mov        dword ptr [rsp], r8d
01c1f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c24 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c29 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c2e 4c895c2408                     mov        qword ptr [rsp + 8], r11
01c33 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01c38 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01c3d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c42 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01c47 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01c4c 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01c51 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01c56 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01c5b 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01c60 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01c65 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01c6a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01c6f 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
01c74 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01c79 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c7e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01c83 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01c88 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01c8d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01c92 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01c97 48ff742468                     push       qword ptr [rsp + 0x68]
01c9c 488f442460                     pop        qword ptr [rsp + 0x60]
01ca1 48ff742470                     push       qword ptr [rsp + 0x70]
01ca6 488f442468                     pop        qword ptr [rsp + 0x68]
01cab 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01cb0 90                             nop        
01cb1 90                             nop        
01cb2 90                             nop        
01cb3 e8286ca8ff                     call       0x7f34636607e0
01cb8 0f1f8400b01d0016               nop        dword ptr [rax + rax + 0x16001db0]
01cc0 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01cca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cce e88d294c17                     call       0x7f347b09c560
01cd3 f4                             hlt        
01cd4 be45ffffff                     mov        esi, 0xffffff45
01cd9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cde 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01ce3 44891424                       mov        dword ptr [rsp], r10d
01ce7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01cec 44895c2404                     mov        dword ptr [rsp + 4], r11d
01cf1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cf6 4c89542408                     mov        qword ptr [rsp + 8], r10
01cfb 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d00 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d05 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d0a 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01d0f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d14 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d19 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d1e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01d23 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01d28 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d2d 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01d32 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d37 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01d3c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d41 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01d46 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01d4b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d50 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d55 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d5a 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01d5f 48ff742468                     push       qword ptr [rsp + 0x68]
01d64 488f442460                     pop        qword ptr [rsp + 0x60]
01d69 48ff742470                     push       qword ptr [rsp + 0x70]
01d6e 488f442468                     pop        qword ptr [rsp + 0x68]
01d73 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01d78 90                             nop        
01d79 90                             nop        
01d7a 90                             nop        
01d7b e8606ba8ff                     call       0x7f34636607e0
01d80 0f1f8400781e0017               nop        dword ptr [rax + rax + 0x17001e78]
01d88 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01d92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d96 e8c5284c17                     call       0x7f347b09c560
01d9b f4                             hlt        
01d9c be3dffffff                     mov        esi, 0xffffff3d
01da1 8be8                           mov        ebp, eax
01da3 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01da8 4c891c24                       mov        qword ptr [rsp], r11
01dac 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01db1 44894c2408                     mov        dword ptr [rsp + 8], r9d
01db6 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01dbb 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01dc0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01dc5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01dca 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01dcf 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01dd4 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01dd9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01dde 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
01de3 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01de8 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01ded 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01df2 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01df7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01dfc 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01e01 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e06 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01e0b 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01e10 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01e18 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01e1d 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01e22 48ffb42480000000               push       qword ptr [rsp + 0x80]
01e2a 488f442478                     pop        qword ptr [rsp + 0x78]
01e2f 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01e37 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01e3f 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01e47 e8946aa8ff                     call       0x7f34636607e0
01e4c 0f1f8400441f0018               nop        dword ptr [rax + rax + 0x18001f44]
01e54 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e62 e8f9274c17                     call       0x7f347b09c560
01e67 f4                             hlt        
01e68 4d3bc2                         cmp        r8, r10
01e6b bdffffffff                     mov        ebp, 0xffffffff
01e70 7c08                           jl         0x7f3463bd9d7a
01e72 400f95c5                       setne      bpl
01e76 400fb6ed                       movzx      ebp, bpl
01e7a be45ffffff                     mov        esi, 0xffffff45
01e7f e85c6aa8ff                     call       0x7f34636607e0
01e84 0f1f84007c1f0019               nop        dword ptr [rax + rax + 0x19001f7c]
01e8c 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01e96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9a e8c1274c17                     call       0x7f347b09c560
01e9f f4                             hlt        
01ea0 be45ffffff                     mov        esi, 0xffffff45
01ea5 90                             nop        
01ea6 90                             nop        
01ea7 e8346aa8ff                     call       0x7f34636607e0
01eac 0f1f8400a41f001a               nop        dword ptr [rax + rax + 0x1a001fa4]
01eb4 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01ebe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ec2 e899274c17                     call       0x7f347b09c560
01ec7 f4                             hlt        
01ec8 be6effffff                     mov        esi, 0xffffff6e
01ecd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ed2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ed7 4c89542408                     mov        qword ptr [rsp + 8], r10
01edc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ee1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ee6 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
01eeb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ef0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ef5 89542424                       mov        dword ptr [rsp + 0x24], edx
01ef9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01efe 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01f02 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01f07 e8d469a8ff                     call       0x7f34636607e0
01f0c 0f1f84000420001b               nop        dword ptr [rax + rax + 0x1b002004]
01f14 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01f1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f22 e839274c17                     call       0x7f347b09c560
01f27 f4                             hlt        
01f28 be6effffff                     mov        esi, 0xffffff6e
01f2d 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01f32 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01f37 e8a469a8ff                     call       0x7f34636607e0
01f3c 0f1f84003420001c               nop        dword ptr [rax + rax + 0x1c002034]
01f44 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01f4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f52 e809274c17                     call       0x7f347b09c560
01f57 f4                             hlt        
01f58 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
01f62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f66 e8f5264c17                     call       0x7f347b09c560
01f6b f4                             hlt        
01f6c 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
01f76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f7a e8e1264c17                     call       0x7f347b09c560
01f7f f4                             hlt        
01f80 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
01f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f8e e8cd264c17                     call       0x7f347b09c560
01f93 f4                             hlt        
01f94 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
01f9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fa2 e8b9264c17                     call       0x7f347b09c560
01fa7 f4                             hlt        
01fa8 be66ffffff                     mov        esi, 0xffffff66
01fad 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fb2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01fb7 4c89542408                     mov        qword ptr [rsp + 8], r10
01fbc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01fc1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fc6 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
01fcb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fd0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fd5 89542424                       mov        dword ptr [rsp + 0x24], edx
01fd9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01fde 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01fe2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01fe7 e8f468a8ff                     call       0x7f34636607e0
01fec 0f1f8400e420001d               nop        dword ptr [rax + rax + 0x1d0020e4]
01ff4 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
01ffe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02002 e859264c17                     call       0x7f347b09c560
02007 f4                             hlt        
02008 be66ffffff                     mov        esi, 0xffffff66
0200d 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02012 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02017 e8c468a8ff                     call       0x7f34636607e0
0201c 0f1f84001421001e               nop        dword ptr [rax + rax + 0x1e002114]
02024 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0202e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02032 e829264c17                     call       0x7f347b09c560
02037 f4                             hlt        
02038 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
02042 4883e4f0                       and        rsp, 0xfffffffffffffff0
02046 e815264c17                     call       0x7f347b09c560
0204b f4                             hlt        
0204c 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
02056 4883e4f0                       and        rsp, 0xfffffffffffffff0
0205a e801264c17                     call       0x7f347b09c560
0205f f4                             hlt        
02060 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
0206a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206e e8ed254c17                     call       0x7f347b09c560
02073 f4                             hlt        
02074 48bf800f2a3c347f0000           movabs     rdi, 0x7f343c2a0f80
0207e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02082 e8d9254c17                     call       0x7f347b09c560
02087 f4                             hlt        
02088 bef6ffffff                     mov        esi, 0xfffffff6
0208d 418beb                         mov        ebp, r11d
02090 90                             nop        
02091 90                             nop        
02092 90                             nop        
02093 e84868a8ff                     call       0x7f34636607e0
02098 0f1f84009021001f               nop        dword ptr [rax + rax + 0x1f002190]
020a0 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
020aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ae e8ad254c17                     call       0x7f347b09c560
020b3 f4                             hlt        
020b4 bef6ffffff                     mov        esi, 0xfffffff6
020b9 90                             nop        
020ba 90                             nop        
020bb e82068a8ff                     call       0x7f34636607e0
020c0 0f1f8400b8210020               nop        dword ptr [rax + rax + 0x200021b8]
020c8 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
020d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020d6 e885254c17                     call       0x7f347b09c560
020db f4                             hlt        
020dc bef6ffffff                     mov        esi, 0xfffffff6
020e1 90                             nop        
020e2 90                             nop        
020e3 e8f867a8ff                     call       0x7f34636607e0
020e8 0f1f8400e0210021               nop        dword ptr [rax + rax + 0x210021e0]
020f0 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
020fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
020fe e85d254c17                     call       0x7f347b09c560
02103 f4                             hlt        
02104 bef6ffffff                     mov        esi, 0xfffffff6
02109 90                             nop        
0210a 90                             nop        
0210b e8d067a8ff                     call       0x7f34636607e0
02110 0f1f840008220022               nop        dword ptr [rax + rax + 0x22002208]
02118 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
02122 4883e4f0                       and        rsp, 0xfffffffffffffff0
02126 e835254c17                     call       0x7f347b09c560
0212b f4                             hlt        
0212c bef6ffffff                     mov        esi, 0xfffffff6
02131 90                             nop        
02132 90                             nop        
02133 e8a867a8ff                     call       0x7f34636607e0
02138 0f1f840030220023               nop        dword ptr [rax + rax + 0x23002230]
02140 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0214a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0214e e80d254c17                     call       0x7f347b09c560
02153 f4                             hlt        
02154 bef6ffffff                     mov        esi, 0xfffffff6
02159 90                             nop        
0215a 90                             nop        
0215b e88067a8ff                     call       0x7f34636607e0
02160 0f1f840058220024               nop        dword ptr [rax + rax + 0x24002258]
02168 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
02172 4883e4f0                       and        rsp, 0xfffffffffffffff0
02176 e8e5244c17                     call       0x7f347b09c560
0217b f4                             hlt        
0217c bef6ffffff                     mov        esi, 0xfffffff6
02181 90                             nop        
02182 90                             nop        
02183 e85867a8ff                     call       0x7f34636607e0
02188 0f1f840080220025               nop        dword ptr [rax + rax + 0x25002280]
02190 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
0219a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0219e e8bd244c17                     call       0x7f347b09c560
021a3 f4                             hlt        
021a4 bef6ffffff                     mov        esi, 0xfffffff6
021a9 90                             nop        
021aa 90                             nop        
021ab e83067a8ff                     call       0x7f34636607e0
021b0 0f1f8400a8220026               nop        dword ptr [rax + rax + 0x260022a8]
021b8 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
021c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021c6 e895244c17                     call       0x7f347b09c560
021cb f4                             hlt        
021cc bef6ffffff                     mov        esi, 0xfffffff6
021d1 90                             nop        
021d2 90                             nop        
021d3 e80867a8ff                     call       0x7f34636607e0
021d8 0f1f8400d0220027               nop        dword ptr [rax + rax + 0x270022d0]
021e0 48bf200d2a3c347f0000           movabs     rdi, 0x7f343c2a0d20
021ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
021ee e86d244c17                     call       0x7f347b09c560
021f3 f4                             hlt        
021f4 49bad289bd63347f0000           movabs     r10, 0x7f3463bd89d2
021fe 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02205 e95682b5ff                     jmp        0x7f3463732360
0220a e8d150b4ff                     call       0x7f346371f1e0
0220f e90adeffff                     jmp        0x7f3463bd7f1e
02214 f4                             hlt        
02215 f4                             hlt        
02216 f4                             hlt        
02217 f4                             hlt        
